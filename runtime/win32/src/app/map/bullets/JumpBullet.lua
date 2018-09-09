
-- 跳跃子弹，负责图片更换和命中后的处理
-- 以目标作为子弹消失点，命中目标后计算伤害

local math2d                 = require("math2d")
local BulletBase             = require("app.map.bullets.BulletBase")
local MapConstants           = require("app.map.MapConstants")
local StableGameProperties   = require("app.properties.StableGameProperties")
local CurvedBulletBase       = require("app.map.bullets.CurvedBulletBase")
local SkillBase              = require("app.map.skills.SkillBase")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local BulletType             = require("app.map.bullets.BulletType")
local ObjectState            = require("app.map.ObjectState")
-- local JumpBullet = class("JumpBullet", CurvedBulletBase)
-- 不继承CurvedBulletBase，因为这个子弹轨迹太不一样了,实现自己的fireBegan、tickBullet函数
local JumpBullet = class("JumpBullet", BulletBase)

local math2d          = require("math2d")
local radians4point   = math2d.radians4point
local radians2degrees = math2d.radians2degrees
local degrees2radians = math2d.degrees2radians
local pointAtCircle   = math2d.pointAtCircle


function JumpBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig

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

    -- 记录单次飞行的时间
    self.flyAllTime  = {}
    self.onePassTime = 0    -- 记录这次跳跃过去了多长时间

    return JumpBullet.super.ctor(self, source, target, sprite, params.delay)
end

-- 显示闪电图片
function JumpBullet:updateBullet(source, target, sprite)

    -- local startX  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- local startY  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
    local startX, startY = self:calFirePoint(source)

    local targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    local targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_
    

    -- 算飞到目标当前位置需要多久
    local dist    = math2d.dist(startX, startY, targetX, targetY)
    local flyTime = math.abs(dist)/self.weaponConfig.flySpeed
    -- 根据飞的时间再预判一下目标的位置
    if target.hasBehavior and target:hasBehavior("MovableBehavior") and target:isMoving() 
        and (target.curState == ObjectState.MOVE or target.curState == ObjectState.TRACK) then
        targetX, targetY = target:getFuturePosition(flyTime)
    end


    targetX = targetX + target.radiusOffsetX_ + target.hitOffsetX_
    targetY = targetY + target.radiusOffsetY_ + target.hitOffsetY_


    local ft = flyTime
    self.speedX_    = (targetX - startX) / ft
    -- self.offsetY_ = ((self.targetY_ - self.startY_) - ((self.g_ * ft) * (ft / 2))) / ft

    if self.weaponConfig.trajectory == BulletType.STRAIGHT then
        -- 直线轨迹的Y轴速度
        self.speedY_ = (targetY - startY)  / ft
    elseif self.weaponConfig.trajectory == BulletType.PARABOLA then
        -- 抛物线轨迹的Y轴速度
        self.g_      = -400
        self.speedY_ = ((targetY - startY) - ((self.g_ * ft) * (ft / 2))) / ft
    end



    -- 算弧度
    local radians = math2d.radians4point(startX, startY, targetX, targetY)
    -- print(" 弧度 radians = "..tostring(radians))
    -- 算角度
    local degrees = math2d.radians2degrees(radians)
    -- print(" 弧度 degrees = "..tostring(degrees))

    sprite:setPosition(startX, startY)
    sprite:setRotation(degrees)

    self.startX_ = startX
    self.startY_ = startY

    self.targetX_ = targetX
    self.targetY_ = targetY

    self.prevX_  = startX
    self.prevY_  = startY

    -- 记录单次已经飞行了的时间
    self.onePassTime = 0

    -- 记录单次需要飞行的时间
    self.flyAllTime[self.count_] = flyTime

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
function JumpBullet:fireBegan()

    -- 显示跳跃子弹的图片
    self:updateBullet(self.target1_, self.target2_, self.sprite_)
    -- chang by Owen, 2016.3.9, 修改self.target_, 在BulletBase计算伤害
    self.target_ = self.target2_




    self.isBegan_ = true

    self.sprite_:setVisible(true)
end

-- 每帧调整图片的角度、长度
function JumpBullet:tickBullet(dt)

    if self.over_ then
        return
    end

    -- 更新子弹位置
    self.onePassTime = self.onePassTime + dt
    local passTime = self.onePassTime 
    local x = self.startX_ + passTime * self.speedX_
    local y 
    -- local y = self.startY_ + passTime * self.speedY_ + self.g_ * passTime * passTime / 2
    if self.weaponConfig.trajectory == BulletType.STRAIGHT then
        -- 直线轨迹
        y = self.startY_ + passTime * self.speedY_
    elseif self.weaponConfig.trajectory == BulletType.PARABOLA then
        -- 抛物线轨迹
        y = self.startY_ + passTime * self.speedY_ + self.g_ * passTime * passTime / 2
    end
    self.sprite_:setPosition(x, y)

    local degrees = radians2degrees(radians4point(self.prevX_, self.prevY_, x, y))
    self.prevX_, self.prevY_ = x, y
    self.sprite_:setRotation(degrees)

    -- print("跳跃子弹位置 x = "..x.." y = "..y)

    -- chang by Owen, 2016.3.9, 修改self.target_, 在BulletBase计算伤害
    self.target_ = self.target2_

    local allPassTime = self.time_ - self.delay_


    -- if passTime >= self.flyTime_ then
    --     -- 然后mapRuntime中就会把table中的这个子弹删掉了,不会再tick机进来
    --     self.over_ = true  
    --     table_removeAll(self.targetIds)
    --     self.sprite_:setVisible(false)
    --     self:removeView()
    --     return
    -- end

    -- 这一波已经电完了
    local hasFlyTime = 0
    for i, v in pairs(self.flyAllTime) do
        hasFlyTime = hasFlyTime + v
    end
    -- print("hasFlyTime = "..tostring(hasFlyTime))
    if allPassTime >= hasFlyTime then
        -- 跳跃次数都完了, 需要删除子弹
        if self.count_ == self.weaponConfig.jumpNumber then
            -- print("跳跃次数都完了")
            self.over_ = true
            table_removeAll(self.targetIds)
            self.sprite_:setVisible(false)
            self:removeView()
            return
        end

        -- 这次跳跃结束了，如果终点没有落在目标的半径内，则直接取消后面的跳跃
        local dist = math2d.dist(x, y, self.targetX_, self.targetY_)
        if dist > self.target2_.radius_ then
            -- print("离目标中心太远，跳跃结束了")
            self.over_ = true
            table_removeAll(self.targetIds)
            self.sprite_:setVisible(false)
            self:removeView()
            return
        else
            self:hit()
        end


        local target = findNextTarget(self.source_, self.target2_, self.weaponConfig.jumpDistance, 
            self.campId_, self.targetIds, self.isSkill, self.skillConfig)
        self.count_ = self.count_ + 1
        if target ~= nil then
            -- print("target ~= nil")
            -- print("找到了下一个目标，继续跳跃")
            self.target1_ = self.target2_
            self.target2_ = target
            self:fireBegan()
        else
            -- print("target == nil")
            -- print("找不到下一个目标，停止跳跃")
            self.target1_ = self.target2_
            self.target2_ = nil
            self.over_ = true
            table_removeAll(self.targetIds)
            self.sprite_:setVisible(false)
            self:removeView()
            return
        end
    end


end

function JumpBullet:showBulletEffect()
    
end

-- 命中处理
function JumpBullet:hit()
    -- print("JumpBullet:hit()")

    self:showBulletEffect()

    if self.isSkill then
        self:dealSkillAttack(self.source_, self.target_)
    else 

        -- 计算伤害
        local isHit, att = self:calcDamage(self.source_, self.target_)
        -- 调用 MapEventHandler:() 来扣血
        -- print("JumpBullet:hit() att = "..tostring(att))
        if isHit then
            -- print("JumpBullet:hit() 1 att = "..tostring(att))
            for i=2,self.count_ do
                att = att * self.weaponConfig.jumpReduce/MapConstants.FOUDATION_PERCENT
            end
            -- print("JumpBullet:hit() 2 att = "..tostring(att))
            self.target2_.mapRuntime_.handler_:hit(self.source_, self.target2_, att)
        end
    end


end

function JumpBullet:miss()
    self:showBulletEffect()    
end

return JumpBullet
