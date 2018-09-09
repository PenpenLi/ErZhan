
local MapConstants           = require("app.map.MapConstants")
local CurvedBulletBase       = require("app.map.bullets.CurvedBulletBase")
local SkillBase              = require("app.map.skills.SkillBase")
local StableGameProperties   = require("app.properties.StableGameProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local CannonBullet = class("CannonBullet", CurvedBulletBase)

-- 爆炸类型的子弹，负责图片更换和命中后的处理

function CannonBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    -- print("CannonBullet:ctor trajectory = "..tostring(trajectory))
    local params = {
        flyTime = weaponConfig.flyTime/1000,  -- math.random(70, 85) / 100,
        g       = -700,                      -- 这个g原先设的是-1000，打近的怪物就变成平射了，所以改成-2000
        isRotation  = true,
        delay   = delay or 0,
        trajectory  = trajectory,    -- 子弹轨迹，直线还是抛物线，还是其他
    }

    self.boomSpriteScale_ = 1
    self.mapRuntime = source.mapRuntime_

    -- if not spriteName then spriteName = "#CannonBall01.png" end
    -- local spriteName = "#CannonBall01.png"
    -- local sprite = display.newSprite(spriteName)

    -- 如果是4级炮塔的子弹，学了大爆裂天赋的话，需要对子弹的属性进行修改
    if self.weaponConfig.mainID == StableGameProperties.FOUR_LV_TURRET_BULLET_ID then
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
                    -- print("修改子弹的属性 name = "..tostring(k).." value = "..tostring(change))
                    self.weaponConfig[k] = changeData + change
                end
            end
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

    return CannonBullet.super.ctor(self, source, target, sprite, params)
end

function CannonBullet:fireBegan()
    CannonBullet.super.fireBegan(self)
    self.sprite_:setVisible(true)
end

-- 显示子弹落地或者击中以后的光效
function CannonBullet:showBulletEffect()
    if self.weaponConfig.bombImages and not string.find(self.weaponConfig.bombImages, "png") then
        -- 如果子弹配置了爆炸效果
        local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache(self.weaponConfig.bombImages, false)
        local x, y = self.sprite_:getPosition()
        effect:setPosition(x + offsetX, y + offsetY)
        local parent = self.sprite_:getParent()
        parent:addChild(effect, self.sprite_:getLocalZOrder())

        -- 处理4级炮塔大爆裂天赋对子弹爆裂范围的修改
        if self.source_.mainID_ == "160204" then
            local needScale = 1.0
            if self.source_.talent_ and self.source_.talent_[1] then
                local talentConfig = self.source_.talent_[1]
                if talentConfig.level == 1 then
                    needScale = 1*1.2/1.45
                elseif talentConfig.level == 2 then
                    needScale = 1*1.3/1.45
                end
            end
            -- print("大爆裂 needScale = "..tostring(needScale))
            effect:setScale(needScale)
        end
    else
        -- 没有配置爆炸特效
        local framesName = self.boomFramesName_
        if not framesName then framesName = "CannonBoom%04d.png" end
        local framesLength = self.boomFramesLength_
        if not framesLength then framesLength = 15 end
        local framesTime = self.boomFramesTime_
        if not framesTime then framesTime = 0.8 end

        local frames    = display.newFrames(framesName, 1, framesLength)
        local boom      = display.newSprite(frames[1])
        local animation = display.newAnimation(frames, framesTime / framesLength)

        local x, y = self.sprite_:getPosition()
        boom:setPosition(x, y + 10)
        boom:setScale(math.random(100, 120) / 100 * self.boomSpriteScale_)
        boom:playAnimationOnce(animation, "removeWhenFinished")

        local parent = self.sprite_:getParent()
        parent:addChild(boom, self.sprite_:getLocalZOrder())

        -- 显示一个爆炸范围的圈
        local boom2     = display.newSprite("ui/fight/circle.png")
        boom2:setPosition(x, y)
        local scale = tonumber(self.weaponConfig.blastRadius) * 2/boom2:getContentSize().width
        -- print("set scale = "..scale)

        boom2:setScaleY(0.8*scale)
        boom2:setScaleX(scale)

        parent:addChild(boom2, self.sprite_:getLocalZOrder())
        transition.fadeOut(boom2, {
            time = 0.2,
            delay = 0.2, -- math.random(30, 100) / 100,
            onComplete = function()
                if not tolua.isnull(boom2) then
                    boom2:removeSelf()
                end
            end
        })
    end

end

function CannonBullet:hit()

    -- do
    --     local target = self.target_
    --     local targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    --     local targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_
    --     local x, y = self.sprite_:getPosition()
    --     -- print("炮塔子弹飞行结束，目标位置 x = "..targetX.." y = "..targetY
    --         .." 子弹位置 x = "..x.." y = "..y)
    -- end

    self:showBulletEffect()    

    -- add by Owen, 2016.4.23, 炮弹击中地面的时候，需要播放音效
    if self.weaponConfig.bombSound then
        AudioMgr.playSound(self.weaponConfig.bombSound)
    end


    local x, y = self.sprite_:getPosition()
    -- 实现爆炸伤害
    -- 取得溅射范围内的敌人，然后判定miss，然后伤害
    -- 如果source死亡了，self.source_也还会保留着，
    -- 因为物体死亡后，在Map:removeObject()中只是将物体从table中删除，并没将object置为nil
    local targets 
    if self.isSkill then
        targets = SkillBase.dealTarget(self.mapRuntime, self.targetX_, self.targetY_, 
            self.weaponConfig.blastRadius, self.weaponConfig.blastNumber, 
            self.skillConfig.actionObject, self.source_)
    else
        targets = self.target_.mapRuntime_:getRangeTargets(nil, true, x, 
            y, self.weaponConfig.blastRadius, true, self.campId_)

    end
    for index, target in ipairs (targets) do
        if self.isSkill then
            
            -- 如果是5级箭塔调用的火焰箭子弹，那么溅射到的单位的伤害要特殊计算
            if self.weaponConfig.mainID == StableGameProperties.FIRE_ARROW_BULLET_ID 
                and self.source_.talent_ and self.source_.talent_[1] then
                
                -- print("self.target_.index_ = "..tostring(self.target_.index_)
                --     .." target.index_ = "..tostring(target.index_))
                if target.index_ == self.target_.index_ then
                    -- 攻击的那个目标，伤害不变
                    self:dealSkillAttack(self.source_, target)
                else
                    -- 溅射到的目标，  伤害是一个特殊的数值
                    self.target_.mapRuntime_.handler_:hit(self.source_, target, 
                        self.source_.talent_[1].sputterDamage)
                end
            else
                self:dealSkillAttack(self.source_, target)
            end
        else 
            -- self.weaponConfig.blastNumber 表示溅射伤害的个数, 并且是地面单位
            if index <= self.weaponConfig.blastNumber
                and target.walkLayer_ == MapConstants.MONSTER_WALK_LAYER_EARTH then 
                
                local isHit, att = self:calcDamage(self.source_, self.target_)

                if isHit then
                    self.target_.mapRuntime_.handler_:hit(self.source_, target, att)
                end
            end
        end
    end

        -- 删掉子弹图片
    self:removeView()

end

function CannonBullet:miss()
    self:showBulletEffect()    
    -- miss要删掉子弹图片
    self:removeView()
end

return CannonBullet
