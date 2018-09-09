
-- 扩散型子弹
-- 在攻击方周围一定范围内产生伤害

local MapConstants     = require("app.map.MapConstants")
local math2d           = require("math2d")
local BulletBase       = require("app.map.bullets.BulletBase")
local SkillBase        = require("app.map.skills.SkillBase")
local CurvedBulletBase = require("app.map.bullets.CurvedBulletBase")
local EffectAniCache   = require("app.map.spine.EffectAniCache")

local DiffuseBullet = class("DiffuseBullet", BulletBase)



function DiffuseBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    local params = {
        flyTime     = weaponConfig.flyTime, -- weaponConfig.flyTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0,
        trajectory  = 0,    -- 子弹轨迹，直线还是抛物线，还是其他
    }

    -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    local sprite
    if string.find(weaponConfig.bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
        local scale     = weaponConfig.diffuseRadius*2/sprite:getContentSize().width
        sprite:setScaleY(0.8*scale) 
        sprite:setScaleX(scale)
    else
        -- 扩散子弹的特效只需要播放一次
        sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, false)
    end

    local startX_  = source.x_ + source.radiusOffsetX_ -- + source.fireOffsetX_
    local startY_  = source.y_ + source.radiusOffsetY_ -- + source.fireOffsetY_
    self.startX_ = startX_
    self.startY_ = startY_
    -- print("DiffuseBullet 1 self.startX_ = "..tostring(self.startX_).." y = "..tostring(self.startY_))
    -- 如果是手动技能调用进来的，以手指点击为中心
    if isSkill and self.skillType == MapConstants.SKILL_TYPE_MANUAL then
        self.startX_ = target.x_
        self.startY_ = target.y_
    end
    sprite:setPosition(startX_, startY_)



    -- print("DiffuseBullet 2 self.startX_ = "..tostring(self.startX_).." y = "..tostring(self.startY_))

    return DiffuseBullet.super.ctor(self, source, target, sprite, params.delay)
    -- CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
end

-- 对范围内的目标进行处理
function DiffuseBullet:dealTarget(x, y, distance, campId)

    local targets

    -- 根据技能的作用对象，获得范围内特定的目标
    if self.isSkill then
        targets = SkillBase.dealTarget(self.source_.mapRuntime_, x, y, 
            self.weaponConfig.diffuseRadius, self.weaponConfig.diffuseNumber, 
            self.skillConfig.actionObject, self.source_)
    else
        targets = self.source_.mapRuntime_:getRangeTargets(nil, true, x, 
            y, distance, true, campId)
    end
    
    if targets and #targets > 0 then
        -- 计算伤害
        for i,v in ipairs(targets) do
            if i <= self.weaponConfig.diffuseNumber then
                if self.isSkill then
                    self:dealSkillAttack(self.source_, v)
                else
                    local isHit, att = self:calcDamage(self.source_, v)
                    if isHit then
                        v.mapRuntime_.handler_:hit(self.source_, v, att)
                    end
                end
            end
        end
    end
end

function DiffuseBullet:fireBegan()
    -- print("DiffuseBullet:fireBegan()")
    if isSkill and self.skillType == MapConstants.SKILL_TYPE_MANUAL then
        self.startX_ = self.target_.x_
        self.startY_ = self.target_.y_
    end
    -- 扩散子弹的中心点，计算范围内的物体的时候，要去掉出手位置
    local centerX, centerY
    if self.source_ and self.source_.fireOffsetX_ then
        centerX  = self.source_.x_ + self.source_.radiusOffsetX_  -- self.startX_ - self.source_.fireOffsetX_
    end
    if self.source_ and self.source_.fireOffsetY_ then
        centerY  = self.source_.y_ + self.source_.radiusOffsetY_  -- self.startY_ - self.source_.fireOffsetY_
    end
    -- 计算伤害
    self.sprite_:setPosition(self.startX_, self.startY_)
    -- print("DiffuseBullet:fireBegan() self.startX_ = "..tostring(self.startX_).." y = "..tostring(self.startY_))
    local target = self:dealTarget(centerX, centerY, self.weaponConfig.diffuseRadius, 
            self.campId_)

    -- self:removeView()
    -- 0.3 秒后再删除自己
    -- change by Owen, 2016.5.24, 只有是图片的时候，需要过一段时间后移除掉自己，
    -- 如果是特效的子弹范围的话，播放一次后就会把自己给移除了
    if string.find(self.weaponConfig.bulletImages, "png") then
        transition.fadeOut(self.sprite_, {
            time = 0.3,
            delay = math.random(50, 100) / 100,
            onComplete = function()
                if not tolua.isnull(self.sprite_) then
                    self.sprite_:removeSelf()
                end
            end
        })
    end

    self.over_ = true

end

function DiffuseBullet:tickBullet(dt)
end

function DiffuseBullet:showBulletEffect()
end

-- 命中处理
function DiffuseBullet:hit()
end

function DiffuseBullet:miss() 
end

return DiffuseBullet
