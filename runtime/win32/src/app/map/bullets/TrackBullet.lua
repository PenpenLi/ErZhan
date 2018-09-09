
-- 跟踪子弹

local math2d                 = require("math2d")
local BulletBase             = require("app.map.bullets.BulletBase")
local SkillBase              = require("app.map.skills.SkillBase")
local CurvedBulletBase       = require("app.map.bullets.CurvedBulletBase")
local StableGameProperties   = require("app.properties.StableGameProperties")
local MapConstants           = require("app.map.MapConstants")
local BuffProperties         = require("app.properties.BuffProperties")
local BuffBase               = require("app.map.skills.BuffBase")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local radians4point   = math2d.radians4point
local radians2degrees = math2d.radians2degrees

local TrackBullet = class("TrackBullet", BulletBase)



function TrackBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)

    self.weaponConfig = weaponConfig
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    local params = {
        flyTime     = 0, -- weaponConfig.flyTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0.1,
        trajectory  = 0,    -- 子弹轨迹，直线还是抛物线，还是其他
    }



    -- 记录子弹当前的位置
    -- self.currentX  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- self.currentY  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
    local startX, startY = self:calFirePoint(source)
    -- 记录要飞到的目标位置
    self.targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    self.targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_

    -- add by Owen, 2015.10.28, 制作4级法师塔魂魄技能
    if source and source.mainID_ == "160304"
        and self.weaponConfig.mainID == StableGameProperties.FOUR_LV_MAGIC_SOUL_BULLET_ID then
        if source._secondBulletInterval == nil then
            -- 表示第一个魂魄子弹飞出去了
            -- local pos = source._soulBulletImgs[1]:getPosition()
            -- dump(pos, "dump test pos")
            self.currentX = source._soulBulletImgs[1]:getPositionX()
            self.currentY = source._soulBulletImgs[1]:getPositionY()
        else
            -- 表示第二个魂魄子弹飞出去了
            -- local pos = source._soulBulletImgs[2]:getPosition()
            -- dump(pos, "dump test 2 pos")
            self.currentX = source._soulBulletImgs[2]:getPositionX()
            self.currentY = source._soulBulletImgs[2]:getPositionY()
        end
    end
                    

    -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    local sprite
    if string.find(weaponConfig.bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
    else
        sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, true)
    end
    sprite:setVisible(params.delay == 0)

    return TrackBullet.super.ctor(self, source, target, sprite, params.delay)
    -- CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
end

-- 延迟0.1秒后显示飞镖图片
function TrackBullet:fireBegan()

    self.sprite_:setPosition(self.currentX, self.currentY)
    self.sprite_:setVisible(true)

    self.isBegan_ = true
end

-- 每帧调整图片的角度、长度
function TrackBullet:tickBullet(dt)

    -- 更新子弹图片需要显示的位置
    local dist        = math2d.dist(self.currentX, self.currentY, self.targetX, self.targetY)
    local needFlyTime = dist/self.weaponConfig.flySpeed
    self.preX         = self.currentX
    self.preY         = self.currentY
    self.currentX     = self.currentX + (self.targetX - self.currentX)*(dt/needFlyTime)
    self.currentY     = self.currentY + (self.targetY - self.currentY)*(dt/needFlyTime)

    -- 旋转子弹
    -- if self.isRotation_ then

        local degrees = radians2degrees(radians4point(self.preX, self.preY, self.currentX, self.currentY))
        self.sprite_:setRotation(degrees)
    -- end

    self.sprite_:setPosition(self.currentX, self.currentY)

    -- print("TrackBullet:tickBullet self.currentX = "..self.currentX.." self.currentY = "..self.currentY
    --     .."self.targetX = "..self.targetX.." self.targetY = "..self.targetY)

    -- 如果命中目标了
    if math.abs(self.currentX - self.targetX) < 3 and math.abs(self.currentY - self.targetY) < 3 then
        if self.isSkill then
            self:dealSkillAttack(self.source_, self.target_)
        else 
            -- 计算伤害
            local isHit, att = self:calcDamage(self.source_, self.target_)
            -- 调用 MapEventHandler:() 来扣血
            -- self.target_肯定存在，因为不存在了不会调用 hit() 函数
            -- print("TrackBullet:hit() att = "..tostring(att))
            if isHit then
                -- -- 给命中的目标计算伤害
                -- self.target_.mapRuntime_.handler_:hit(self.source_, self.target_, att)

                -- add by Owen, 2015.7.27, 处理普攻吸血
                if self.source_ and self.source_.suckHp_ and self.source_.suckHp_ ~= 0 then
                    self.source_:increaseHp(self.source_.suckHp_)
                end

                -- add by Owen, 2015.10.28, 制作4级法师塔魂魄技能
                if self.source_.mainID_ == "160304"
                    and self.weaponConfig.mainID == StableGameProperties.FOUR_LV_MAGIC_SOUL_BULLET_ID then
                    
                    -- 记录被魂魄攻击的次数
                    -- 在monsterBehavior:tick中,会累加这个值,一旦超过3秒,就会将_soulAttackCount置为0
                    self.target_._fourMagicAttackTime = 0

                    if not self.target_._soulAttackCount or self.target_._soulAttackCount == 0 then
                        self.target_._soulAttackCount = 1
                    else
                        self.target_._soulAttackCount = self.target_._soulAttackCount + 1
                    end

                    -- change by Owen, 2016.4.8, 魂魄子弹的基础攻击力要有一个加成
                    att = att * (StableGameProperties.FOUR_LV_MAGIC_ADD_ATTACK/MapConstants.FOUDATION_PERCENT)

                    -- 取被免伤后的值，然后用连乘来计算，已确认过
                    for i = 1, self.target_._soulAttackCount - 1 do
                        att = att*(StableGameProperties.FOUR_LV_MAGIC_ADD_PERCENT_ATT/MapConstants.FOUDATION_PERCENT)
                    end

                    -- print("添加钉魂箭数值")
                    -- add by Owen, 2015.10.27, 显示中了钉魂箭文字
                    if not self.target_._addViw then
                        self.target_._addViw = {}
                    end
                    if not self.target_._addViw["fourMagic"] then
                        -- print("添加钉魂箭数值 1 object.index_ = "..tostring(self.target_.index_))
                        self.target_._addViw["fourMagic"] = self.target_:addView("魂魄攻击次数"..self.target_._soulAttackCount,
                            100, false)
                    elseif not self.target_.destroyed_ then
                        -- print("添加钉魂箭数值 2 object.index_ = "..tostring(self.target_.index_))
                        self.target_._addViw["fourMagic"]:setString("魂魄攻击次数"..self.target_._soulAttackCount)
                    end

                    -- 如果4级法师塔学了天赋1，那么需要给物体附加buff
                    if self.source_.talent_ and self.source_.talent_[1] then
                        local hitBuffs = self.source_.talent_[1].hitState
                        local buff
                        for i,v in ipairs(hitBuffs) do
                            if math.random(MapConstants.FOUDATION_PERCENT) <= v[1] then
                                buff = BuffProperties.get(v[2])
                                BuffBase.addTimeBuff(self.target_, buff, self.source_, nil)
                            end
                        end
                    end
                end
                -- 给命中的目标计算伤害
                self.target_.mapRuntime_.handler_:hit(self.source_, self.target_, att)
            end
        end

        -- 删掉子弹图片
        self:removeView()
        -- 子弹飞行结束
        self.over_ = true
    end

    -- 如果目标没有死亡，就需要更新目标位置
    if not self.target_.destroyed_ then
        self.targetX = self.target_.x_ + self.target_.radiusOffsetX_ + self.target_.hitOffsetX_
        self.targetY = self.target_.y_ + self.target_.radiusOffsetY_ + self.target_.hitOffsetY_
    end
    
end

function TrackBullet:showBulletEffect()
end

-- 命中处理
function TrackBullet:hit()
end

function TrackBullet:miss() 
end

return TrackBullet
