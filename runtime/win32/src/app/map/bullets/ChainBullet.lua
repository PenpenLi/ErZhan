
-- 链式子弹，负责图片更换和命中后的处理
-- 以目标作为子弹消失点，命中目标后计算伤害

local math2d                 = require("math2d")
local BulletBase             = require("app.map.bullets.BulletBase")
local MapConstants           = require("app.map.MapConstants")
local StableGameProperties   = require("app.properties.StableGameProperties")
local CurvedBulletBase       = require("app.map.bullets.CurvedBulletBase")
local SkillBase              = require("app.map.skills.SkillBase")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
-- local ChainBullet = class("ChainBullet", CurvedBulletBase)
-- 不继承CurvedBulletBase，因为这个子弹轨迹太不一样了,实现自己的fireBegan、tickBullet函数
local ChainBullet = class("ChainBullet", BulletBase)


function ChainBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig

    -- 如果是5级炮塔的子弹，学了锁链或者积雷天赋的话，需要对子弹的属性进行修改
    if self.weaponConfig.mainID == StableGameProperties.FIVE_LV_TURRET_BULLET_ID then
        if source.talent_ and source.talent_[1] then
            local change
            local changeData
            for k,v in pairs(source.talent_[1].changeBullets) do   
                if type(v) ~= "table" then
                    -- 不是table的话，表示直接替换
                    self.weaponConfig[k] = v
                else
                    changeData = self.weaponConfig[k]
                    if v[1] == 1 then 
                        change = changeData*(v[2]/MapConstants.FOUDATION_PERCENT - 1)
                    else 
                        change = v[2]
                    end
                    -- print("ChainBullet 修改子弹的属性 name = "..tostring(k).." value = "..tostring(change))
                    self.weaponConfig[k] = changeData + change
                end
            end
        end
        if source.talent_ and source.talent_[2] then
            local change
            local changeData
            for k,v in pairs(source.talent_[2].changeBullets) do
                if type(v) ~= "table" then
                    -- 不是table的话，表示直接替换
                    self.weaponConfig[k] = v
                else
                    changeData = self.weaponConfig[k]
                    if v[1] == 1 then 
                        change = changeData*(v[2]/MapConstants.FOUDATION_PERCENT - 1)
                    else 
                        change = v[2]
                    end
                    -- print("ChainBullet 修改子弹的属性 name = "..tostring(k).." value = "..tostring(change))
                    self.weaponConfig[k] = changeData + change
                end
            end
        end
    end

    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    self.duration_   = 0.3   -- 单次闪电持续时间
    self.count_      = 1     -- 当前是第几次跳跃的闪电
    self.flyTime_    = 0.3 * (weaponConfig.jumpNumber + 1)
    local params = {
        flyTime     = 1.0 * (weaponConfig.jumpNumber + 1), -- weaponConfig.flyTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0,
        trajectory  = weaponConfig.trajectory,    -- 子弹轨迹，直线还是抛物线，还是其他
    }
    -- local sprite = display.newSprite("ui/fight/line.png")

    -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    local sprite
    if string.find(weaponConfig.bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
    else
        sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, true)
    end
    sprite:setAnchorPoint(cc.p(0, 0.5))
    sprite:setVisible(params.delay == 0)

    -- 记录闪电链的两个目标
    self.target1_ = source
    self.target2_ = target

    -- 记录被我电过的人
    self.targetIds = {}
    table.insert(self.targetIds, target.id_)

    return ChainBullet.super.ctor(self, source, target, sprite, params.delay)
    -- CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
end

-- 显示闪电图片
function ChainBullet:showChain(source, target, sprite)

    local startX, startY
    -- change by Owen, 2016.4.15, 第一次显示闪电链的时候，才是出手点位置，其他时候用中心点位置
    if self.count_ == 1 then
        startX, startY = self:calFirePoint(source)
    else
        startX  = source.x_ + source.radiusOffsetX_
        startY  = source.y_ + source.radiusOffsetY_
    end

    local targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    local targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_

    -- 算弧度
    local radians = math2d.radians4point(startX, startY, targetX, targetY)
    -- print(" 弧度 radians = "..tostring(radians))
    -- 算角度
    local degrees = math2d.radians2degrees(radians)
    -- print(" 弧度 degrees = "..tostring(degrees))


    sprite:setPosition(startX, startY)
    sprite:setRotation(degrees)

    -- 算距离
    local dist = math2d.dist(startX, startY, targetX, targetY)
    sprite:setScaleX(dist/sprite:getContentSize().width)
end

-- 一个电完了以后，找下一个电的目标
-- change by Owen, 2015.10.29, 增加一个src参数和两个skill参数，要判定目标是否能被攻击
local function findNextTarget(source, target, distance, campId, targetIds, isSkill, skillConfig)
    local x, y = target.x_ + target.radiusOffsetX_, target.y_ + target.radiusOffsetY_

    local targets 

    -- 如果是技能调用的话，通过技能的作用对象来找目标
    if isSkill then 
        targets = SkillBase.dealTarget(source.mapRuntime_, x, y, 
            distance, 99, skillConfig.actionObject, source)
    else
        targets = target.mapRuntime_:getRangeTargets(nil, true, x, 
            y, distance, true, campId)
    end

    -- 普攻调用子弹，需要剔除掉不能被我普通攻击的怪物类型
    if source and not isSkill then
        local bCanAttack
        for i = #targets, 1, -1 do
            bCanAttack = false
            for i2,v in ipairs(source.enemyType_) do
                if targets[i].walkLayer_ == v then
                    bCanAttack = true
                    break
                end
            end
            -- 不能攻击就要移除掉
            if not bCanAttack then
                table.remove(targets, i)
            end
        end
    end
    
    if targets and #targets > 0 then
        -- 根据距离排个序
        for i,v in ipairs (targets) do
            local dist = math2d.dist(x, y, v.x_, v.y_)
            v.dist = dist
        end
        table.sort(targets, function(a, b)
            return a.dist < b.dist
        end)
        -- dump(target, " dump findNextTarget target")
        for i, v in ipairs (targets) do
            local bSameTarget = false
            for i2, v2 in ipairs (targetIds) do
                if tostring(v.id_) == tostring(v2) then
                    bSameTarget = true
                end
            end
            if bSameTarget == false then
                -- print("table.insert(targetIds, v.id_) v.id_ = "..tostring(v.id_))
                table.insert(targetIds, v.id_)
                return v
            end
        end
        return nil
    else
        return nil
    end
end

-- 显示第一个图片
function ChainBullet:fireBegan()
    -- ChainBullet.super.fireBegan(self)

    -- 显示连接source和target的闪电图片



    self:showChain(self.target1_, self.target2_, self.sprite_)
    -- chang by Owen, 2016.3.9, 修改self.target_, 在BulletBase计算伤害
    self.target_ = self.target2_

    -- 第一下点到就要计算伤害
    self:hit()

    self.isBegan_ = true

    self.sprite_:setVisible(true)
end

-- 每帧调整图片的角度、长度
function ChainBullet:tickBullet()

    self:showChain(self.target1_, self.target2_, self.sprite_)
    -- chang by Owen, 2016.3.9, 修改self.target_, 在BulletBase计算伤害
    self.target_ = self.target2_

    local passTime = self.time_ - self.delay_


    if passTime >= self.flyTime_ then
        -- 然后mapRuntime中就会把table中的这个子弹删掉了,不会再tick机进来
        self.over_ = true  
        table_removeAll(self.targetIds)
        self.sprite_:setVisible(false)
        self:removeView()
        return
    end

        -- 这一波已经电完了
    if passTime >= self.duration_*self.count_ then
        local target = findNextTarget(self.source_, self.target2_, self.weaponConfig.jumpDistance, 
            self.campId_, self.targetIds, self.isSkill, self.skillConfig)
        self.count_ = self.count_ + 1
        if target ~= nil then
            -- print("target ~= nil")
            self.target1_ = self.target2_
            self.target2_ = target
            self:fireBegan()
        else
            -- print("target == nil")
            self.target1_ = self.target2_
            self.target2_ = nil
            self.over_ = true
            table_removeAll(self.targetIds)
            self.sprite_:setVisible(false)
            self:removeView()
        end
    end

    
end

function ChainBullet:showBulletEffect()
    
end

-- 命中处理
function ChainBullet:hit()
    -- print("ChainBullet:hit()")

    self:showBulletEffect()

    if self.isSkill then
        self:dealSkillAttack(self.source_, self.target_)
    else 

        -- 计算伤害
        local isHit, att = self:calcDamage(self.source_, self.target_)
        -- 调用 MapEventHandler:() 来扣血
        -- print("ChainBullet:hit() att = "..tostring(att))
        if isHit then
            -- print("ChainBullet:hit() 1 att = "..tostring(att))
            for i=2,self.count_ do
                att = att * self.weaponConfig.jumpReduce/MapConstants.FOUDATION_PERCENT
            end
            -- print("ChainBullet:hit() 2 att = "..tostring(att))
            self.target2_.mapRuntime_.handler_:hit(self.source_, self.target2_, att)
        end
    end


end

function ChainBullet:miss()
    self:showBulletEffect()    
end

return ChainBullet
