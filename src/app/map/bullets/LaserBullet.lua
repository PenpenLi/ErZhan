
-- 激光子弹,
-- 命中目标以后，按照怪物行走的路径，向前或者向后移动一段距离

local math2d           = require("math2d")
local BulletBase       = require("app.map.bullets.BulletBase")
local SkillBase        = require("app.map.skills.SkillBase")
local CurvedBulletBase = require("app.map.bullets.CurvedBulletBase")
local MapConstants     = require("app.map.MapConstants")
local EffectAniCache   = require("app.map.spine.EffectAniCache")

local LaserBullet = class("LaserBullet", BulletBase)



function LaserBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.flyTime_     = weaponConfig.moveTime/1000
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    local params = {
        flyTime     = weaponConfig.moveTime/1000, -- weaponConfig.moveTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0.1,
        trajectory  = 0,    -- 子弹轨迹，直线还是抛物线，还是其他
    }
    self.myDelay  = 0.1


    -- 根据目标的位置，推断子弹要飞行的最远位置
    -- local startX  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- local startY  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
    local startX, startY = self:calFirePoint(source)
    local targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    local targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_

    -- 记录激光开始的时候对准的目标位置
    self.targetX_ = targetX
    self.targetY_ = targetY

    -- 记录怪物的路径点目标位置
    local midX, midY

    if target:hasBehavior("MovableBehavior") then
        local path = target.map_:getObject(target.bindingPathId_)
        -- add by Owen, 2016.6.13, 激光子弹下面会报错，path可能为空，加这一层保护
        -- if not path then
        --     return
        -- end
        -- 一半的概率激光子弹朝着怪物的前进方向移动
        if math.random(MapConstants.FOUDATION_PERCENT) < MapConstants.FOUDATION_PERCENT/2 then
            midX, midY = path:getPoint(target.currentPointIndex_)
        else
            midX, midY = path:getPoint(target.currentPointIndex_ + 1)
        end
    else
        -- print(" error 朝不可移动的单位发射激光子弹")
    end

    -- print("LaserBullet ctor targetX = "..tostring(targetX).." midX = "..tostring(midX))
    local time = math2d.dist(target.x_, target.y_, midX, midY)/ (weaponConfig.moveSpeed)
    -- X和Y方向上的飞行速度
    self.speedX = (midX - target.x_) / time
    self.speedY = (midY - target.y_) / time


    -- 记录已经被我击中过的目标的id_，如果是回旋子弹，在时间的一半处清空
    self.attackedObj = {}
    -- 标识是否已经清理过一次记录的攻击过的目标
    self.hasClear    = false



    -- local sprite = display.newSprite("bullet/dart.png")
    -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    local sprite
    if string.find(weaponConfig.bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
    else
        sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, true)
    end

    sprite:setAnchorPoint(cc.p(0, 0))
    sprite:setVisible(params.delay == 0)

    return LaserBullet.super.ctor(self, source, target, sprite, params.delay)
    -- CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
end

-- 显示激光图片
local function showLaser(startX, startY, targetX, targetY, sprite, rangeSprite)

    -- local startX  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- local startY  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_

    -- local targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    -- local targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_

    -- 算弧度
    local radians = math2d.radians4point(startX, startY, targetX, targetY)
    -- print(" 弧度 radians = "..tostring(radians))
    -- 算角度
    local degrees = math2d.radians2degrees(radians)
    -- print(" 弧度 degrees = "..tostring(degrees))


    sprite:setPosition(startX, startY)
    sprite:setRotation(degrees)

    -- print("showLaser startX = "..tostring(startX).." startY = "..tostring(startY)
    --     .." targetX = "..tostring(targetX).." targetY = "..tostring(targetY))

    -- 算距离
    local dist = math2d.dist(startX, startY, targetX, targetY)
    -- sprite:setScaleY(0.5)
    sprite:setScaleX(dist/sprite:getContentSize().width)

    -- 显示激光碰撞检测的范围
    -- rangeSprite:setPosition(targetX, targetY)
end

function LaserBullet:dealTarget(x, y, distance, campId)
    -- local targets = self.source_.mapRuntime_:getRangeTargets(nil, true, x, 
    --     y, distance, true, campId)
    
    -- if targets and #targets > 0 then
    --     -- 计算伤害
    --     for i,v in ipairs(targets) do
    --         local isHit, att = self:calcDamage(self.source_, v)
    --         if isHit then
    --             v.mapRuntime_.handler_:hit(self.source_, v, att)
    --         end
    --     end
    -- end

    local targets 
    if self.isSkill then
        targets = SkillBase.dealTarget(self.source_.mapRuntime_, x,
            y, distance, 99, self.skillConfig.actionObject, self.source_)
    else
        targets = self.source_.mapRuntime_:getRangeTargets(nil, true, x, 
            y, distance, true, campId)
    end

    -- 遍历目标，判定是否已经撞击过
    if targets and #targets > 0 then
        for i, v in ipairs(targets) do
            local bNewTarget = true
            -- dump(self.attackedObj, "dump self.attackedObj")
            for i2, v2 in ipairs(self.attackedObj) do
                if v.id_ == v2 then
                    bNewTarget = false
                    break
                end
            end
            -- print("BuffBase.tickImpact 4")
            -- 如果没被攻击过，那么算伤害
            if bNewTarget == true then
                -- 如果伤害数值跟目标没关系，那么在BulletSkill中就已经计算过了
                -- 在 calcDamage 函数中会根据是不是技能伤害，以及是否考虑免伤做出计算
                if self.isSkill then
                    self:dealSkillAttack(self.source_, v)
                else
                    local isHit, att = self:calcDamage(self.source_, v)
                    if isHit then
                        v.mapRuntime_.handler_:hit(self.source_, v, att)
                    end
                end
                table.insert(self.attackedObj, v.id_)
            end
        end
    end
end

-- 延迟0.1秒后显示飞镖图片
function LaserBullet:fireBegan()

    -- 显示激光碰撞检测的范围
    self.rangeSprite = display.newSprite("ui/fight/circle.png")
    local parent = self.sprite_:getParent()
    parent:addChild(self.rangeSprite, self.sprite_:getLocalZOrder())
    self.rangeSprite:setPosition(self.targetX_, self.targetY_)

    local scale = tonumber(self.weaponConfig.laserRadius) * 2/self.rangeSprite:getContentSize().width
    self.rangeSprite:setScaleY(0.8*scale)
    self.rangeSprite:setScaleX(scale)
    self.rangeSprite:setVisible(false)


    -- 显示连接source和target的闪电图片
    showLaser(self.startX_, self.startY_, self.targetX_, self.targetY_, self.sprite_, self.rangeSprite)


    -- 第一下点到就要计算伤害
    local target = self:dealTarget(self.targetX_, self.targetY_, self.weaponConfig.laserRadius, 
            self.campId_)

    self.sprite_:setVisible(true)

    self.isBegan_ = true


end

-- 每帧调整图片的角度、长度
function LaserBullet:tickBullet(dt)

    local tarX = self.targetX_ + self.speedX * (self.time_ - self.delay_)
    local tarY = self.targetY_ + self.speedY * (self.time_ - self.delay_)

    showLaser(self.startX_, self.startY_, tarX, tarY, self.sprite_, self.rangeSprite)

    -- 计算伤害
    local target = self:dealTarget(tarX, tarY, self.weaponConfig.laserRadius, 
        self.campId_)


    local passTime = self.time_ - self.delay_

    -- add by Owen, 2016.5.16, 每过一段时间，需要在受击位置显示一个击中的效果
    if not self.hitCount then
        self.hitCount = 1
    end
    -- 每过0.2s显示一个击中效果
    if passTime >= self.hitCount * 0.2 then
        local hitEff, offsetY, offsetX = EffectAniCache.getEffectAniCache(self.weaponConfig.hitImages, true)
        -- 显示激光碰撞检测的范围
        local parent = self.sprite_:getParent()
        parent:addChild(hitEff, self.sprite_:getLocalZOrder())
        hitEff:setPosition(tarX, tarY)

        transition.fadeOut(hitEff, {
            time = 0.8,
            delay = math.random(50, 100) / 100,
            onComplete = function()
                if not tolua.isnull(hitEff) then
                    hitEff:removeSelf()
                end
            end
        })
        self.hitCount = self.hitCount + 1
    end

    -- print("LaserBullet self.flyTime_ = "..tostring(self.flyTime_).." self.speedX = "
    --     ..tostring(self.speedX).." self.speedY = "..tostring(self.speedY).." dt = "..tostring(dt))
    if passTime >= self.flyTime_ then
        -- 然后mapRuntime中就会把table中的这个子弹删掉了,不会再tick机进来
        self.over_ = true
        self.attackedObj = nil
        self.sprite_:setVisible(false)
        self:removeView()
        self.rangeSprite:removeSelf()
        return
    end
end

function LaserBullet:showBulletEffect()
end

-- 命中处理
function LaserBullet:hit()
end

function LaserBullet:miss() 
end

return LaserBullet
