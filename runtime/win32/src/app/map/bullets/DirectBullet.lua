
local math2d          = require("math2d")
local BulletBase      = require("app.map.bullets.BulletBase")
local MapConstants    = require("app.map.MapConstants")
local EffectAniCache  = require("app.map.spine.EffectAniCache")
local StableGameProperties = require("app.properties.StableGameProperties")
local DirectBullet = class("DirectBullet", BulletBase)

-- 直接对目标进行处理的子弹，没有图片

function DirectBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    -- print("DirectBullet:ctor trajectory = "..tostring(trajectory))
    local params = {
        flyTime     = 0,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0,
        trajectory  = trajectory,    -- 子弹轨迹，直线还是抛物线，还是其他
    }

    -- local sprite = display.newSprite("#Arrow01.png")
    
    -- -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    -- local sprite
    -- if string.find(weaponConfig.bulletImages, "png") then
    --     sprite = display.newSprite(weaponConfig.bulletImages)
    -- else
    --     sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, true)
    -- end
    -- sprite:setVisible(params.delay == 0)

    -- 构造父类
    return DirectBullet.super.ctor(self, source, target, sprite, params)

end

function DirectBullet:fireBegan()
    -- print("DirectBullet:fireBegan()")
    if not self.isSkill then
        -- 不是技能，则为近战攻击的时候调用
        -- 计算攻击力
        self.attack_ = self:calcSrcAttack(self.source_)

        local target = self.target_

        local isHit, att = self:calcDamage(self.source_, target)
        -- print("DirectBullet:fireBegan() 暴击率 = "..tostring(self.source_.critical_
        --     .." 攻击力 = "..tostring(self.source_.attack_).." 伤害= "..tostring(att)))
        
        if isHit then
            -- 计算具体的伤害数值
            target.mapRuntime_.handler_:hit(nil, target, att)
            
            -- 处理普攻吸血
            if self.source_ and self.source_.suckHp_ and self.source_.suckHp_ ~= 0 then
                -- print("触发了普攻吸血， self.source_.suckHp_ = "..tostring(self.source_.suckHp_))
                self.source_:increaseHp(self.source_.suckHp_)

                -- 每次吸血的时候，在身上加一个吸血的效果
                if not self.source_.destroyed_ then
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_vampire_1", false, 
                        nil, self.source_)
                    self.source_.sprite_:addChild(effect, -1)
                    effect:setPosition(offsetX, offsetY)
                end
            end
        end

        if target.sprite_ then
            -- local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Bleed",
            --     nil, nil, target)
            -- target.sprite_:addChild(effect)
            -- effect:setPosition(offsetX, offsetY)
            -- -- 如果被攻击的物体翻转了的话，那么飙血动画要翻转，因为飙血动画是9点钟的
            -- if target.flipSprite_ then
            --     effect:setScaleX(-1)
            -- end
        end
    end

    -- 如果是技能调用子弹
    if self.isSkill then
        -- 如果是130221技能，那么就增加英雄的暴击率，然后计算伤害
        if string.sub(self.skillConfig.mainID, 1, 5) == "13022" then
            self.source_.critical_ = self.source_.critical_ + StableGameProperties.TIE_SHAN_ADD_CRI
        end

        self.attack_ = self:calcSrcAttack(self.source_)
        self:dealSkillAttack(self.source_, self.target_)

        -- 罗刹鬼斩技能触发伤害计算完以后，暴击率要还原
        if string.sub(self.skillConfig.mainID, 1, 5) == "13022" then
            -- print("罗刹鬼斩技能触发 暴击率 = "..tostring(self.source_.critical_))
            self.source_.critical_ = self.source_.originalPro_.critical
            -- print("罗刹鬼斩技能触发 还原后暴击率 = "..tostring(self.source_.critical_))
        end
    end



    self.over_ = true

end

return DirectBullet
