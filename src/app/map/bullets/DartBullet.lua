
-- 飞镖子弹

local math2d           = require("math2d")
local BulletBase       = require("app.map.bullets.BulletBase")
local SkillBase        = require("app.map.skills.SkillBase")
local CurvedBulletBase = require("app.map.bullets.CurvedBulletBase")
local EffectAniCache   = require("app.map.spine.EffectAniCache")

local DartBullet = class("DartBullet", BulletBase)



function DartBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.returnTime_  = weaponConfig.returnTime
    self.flyTime_     = weaponConfig.flyTime
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    local params = {
        flyTime     = weaponConfig.flyTime/1000, -- weaponConfig.flyTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0.1,
        trajectory  = 0,    -- 子弹轨迹，直线还是抛物线，还是其他
    }
    self.myDelay  = 0.1

    self.isFlyOut = false   -- 一直往外飞
    self.isReturn = false   -- 是否会回旋
    if tonumber(weaponConfig.flyTime) == 0 then
        self.isFlyOut = true
    elseif tonumber(weaponConfig.returnTime) ~= 0 then
        self.isReturn = true
    end


    -- 根据目标的位置，推断子弹要飞行的最远位置
    -- local startX  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- local startY  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
    local startX, startY = self:calFirePoint(source)
    self.prevX, self.prevY = startX, startY

    local targetX, targetY

    -- 预估子弹的飞行时间
    local dist = math2d.dist(startX, startY, target.x_, target.y_)
    local time = dist/weaponConfig.flySpeed
    targetX, targetY = target:getFuturePosition(time)
    -- dist = dist + math2d.dist(target.x_, target.y_, targetX, targetY)
    dist = math2d.dist(startX, startY, targetX, targetY)
    time = dist/weaponConfig.flySpeed

    if target:hasBehavior("MovableBehavior") and target:isMoving() then

        targetX, targetY = target:getFuturePosition(time)
    else
        targetX, targetY = target.x_, target.y_
    end
    targetX = targetX + target.radiusOffsetX_ + target.hitOffsetX_
    targetY = targetY + target.radiusOffsetY_ + target.hitOffsetY_
    -- local dist = math2d.dist(startX, startY, targetX, targetY)
    -- local time = dist/weaponConfig.flySpeed
    -- X和Y方向上的飞行速度
    self.speedX = (targetX - startX) / time
    self.speedY = (targetY - startY) / time
    -- 往外飞时的最终到达位置
    self.targetX_ = startX + self.speedX * (weaponConfig.returnTime/1000)
    self.targetY_ = startY + self.speedY * (weaponConfig.returnTime/1000)

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
    sprite:setVisible(params.delay == 0)

    return DartBullet.super.ctor(self, source, target, sprite, params.delay)
    -- CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
end

function DartBullet:dealTarget(x, y, distance, campId)
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
function DartBullet:fireBegan()
    -- DartBullet.super.fireBegan(self)

    -- 显示连接source和target的闪电图片

    local x = self.startX_ + self.speedX * self.myDelay
    local y = self.startY_ + self.speedY * self.myDelay
    
    local degrees = math2d.radians2degrees(math2d.radians4point(self.prevX, 
        self.prevY, x, y))
    self.prevX, self.prevY = x, y
    self.sprite_:setRotation(degrees)

    self.sprite_:setPosition(x, y)
    self.sprite_:setVisible(true)

    -- 第一下点到就要计算伤害
    local target = self:dealTarget(x, y, self.weaponConfig.dartRadius, 
            self.campId_)


    self.isBegan_ = true

end

-- 每帧调整图片的角度、长度
function DartBullet:tickBullet(dt)
    if self.time_ <= self.myDelay then
        return
    else
        local passTime = self.time_ * 1000
        

        local x = self.startX_ + self.speedX * (self.time_)
        local y = self.startY_ + self.speedY * (self.time_)


        if self.isFlyOut then
            -- 一直往外飞
            -- print("一直往外飞 x = "..tostring(x).." y = "..tostring(y))

            -- add by Owen, 2016.4.18, 往外飞的时候，子弹要旋转
            local degrees = math2d.radians2degrees(math2d.radians4point(self.prevX, 
                self.prevY, x, y))
            self.prevX, self.prevY = x, y
            self.sprite_:setRotation(degrees)

            self.sprite_:setPosition(x, y)
            -- 飞到屏幕外面了就要删除
            local endX = display.width
            local endY = display.height
            if GLOBAL_FIGHT_UI_SCALE == 0.5 then
                endX = endX * 2
                endY = endY * 2
            end
            if x < 0 or x > endX or y < 0 or y > endY then
                self:removeView()
                self.over_ = true
            end
        elseif self.isReturn == false then 
            if passTime >= self.flyTime_ then
                -- 不回旋的子弹，飞行的总时间到了
                self:removeView()
                self.over_ = true
            else
                self.sprite_:setPosition(x, y)
            end
        elseif self.isReturn then
            if passTime <= self.returnTime_ then
                -- 回旋的, 还没到回旋时间
                self.sprite_:setPosition(x, y)
            else
                
                local bulletPosX = self.sprite_:getPositionX()
                local bulletPosY = self.sprite_:getPositionY()
                local source     = self.source_
                local endX       = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
                local endY       = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
                if math2d.dist(bulletPosX, bulletPosY, endX, endY) < 30 then
                    -- < (source.radiusOffsetY_ + source.fireOffsetY_) then
                    -- 已经回到发射者身边了，则把自己删除
                    self:removeView()
                    self.over_ = true
                else
                    -- 可以回旋了，先在原地待0.2秒
                    local stopTime = 0.3
                    if passTime - self.returnTime_ < stopTime*1000 then
                        -- add by Owen, 2015.8.3, 清空已经攻击过的目标
                        if not self.hasClear then
                            self.hasClear = true
                            self.attackedObj = {}
                        end
                    else
                        local speed   = self.weaponConfig.flySpeed
                        local flyTime = math2d.dist(self.targetX_, self.targetY_, endX, endY)/speed
                        local speedX  = (endX - self.targetX_)/flyTime
                        local speedY  = (endY - self.targetY_)/flyTime

                        -- 开始回旋, 要跟踪发射者的位置
                        local time = (self.time_ - self.returnTime_/1000 - stopTime)
                        x = self.targetX_ + speedX * time
                        y = self.targetY_ + speedY * time

                        -- add by Owen, 2016.4.18, 往回飞以后，子弹要旋转
                        local degrees = math2d.radians2degrees(math2d.radians4point(self.prevX, 
                            self.prevY, x, y))
                        self.prevX, self.prevY = x, y
                        self.sprite_:setRotation(degrees)

                        -- print("开始回旋了 targetX_ = "..tostring(self.targetX_).." y = "..tostring(self.targetY_))
                        -- print("开始回旋了 x = "..tostring(x).." y = "..tostring(y))
                        -- print("发射源的位置 endX = "..tostring(endX).." y = "..tostring(endY))
                        -- print("发射源的位置 2 source.x_ = "..tostring(source.x_).." y = "..tostring(source.y_))
                        -- print("source.mainId_ = "..tostring(source.mainId_))
                        self.sprite_:setPosition(x, y)
                    end
                end

            end
        end

        -- 计算伤害
        local target = self:dealTarget(x, y, self.weaponConfig.dartRadius, 
            self.campId_)

    end

end

function DartBullet:showBulletEffect()
end

-- 命中处理
function DartBullet:hit()
end

function DartBullet:miss() 
end

return DartBullet
