
local MapConstants = require("app.map.MapConstants")
local BehaviorBase = require("app.map.behaviors.BehaviorBase")
local SkillFactory = require("app.map.skills.SkillFactory")
local BuffBase     = require("app.map.skills.BuffBase")
local DestroyedBehavior = class("DestroyedBehavior", BehaviorBase)

function DestroyedBehavior:ctor()
    -- change by Owen, 2016.1.12, 不需要绑定CampBehavior和CollisionBehavior
    DestroyedBehavior.super.ctor(self, "DestroyedBehavior", {"CampBehavior", "CollisionBehavior"}, 1)
    -- DestroyedBehavior.super.ctor(self, "DestroyedBehavior", 1)
end

function DestroyedBehavior:bind(object)
    local function isDestroyed(object)
        return object.destroyed_
    end
    object:bindMethod(self, "isDestroyed", isDestroyed)

    local function getMaxHp(object)
        return object.maxHp_
    end
    object:bindMethod(self, "getMaxHp", getMaxHp)

    local function setMaxHp(object, maxHp)
        maxHp = checkint(maxHp)
        assert(maxHp > 0, string.format("DestroyedBehavior.setMaxHp() - invalid maxHp %s", tostring(maxHp)))
        object.maxHp_ = maxHp
    end
    object:bindMethod(self, "setMaxHp", setMaxHp)

    local function getHp(object)
        return object.hp_
    end
    object:bindMethod(self, "getHp", getHp)

    local function setHp(object, hp)
        hp = checknumber(hp)
        assert(hp >= 0 and hp <= object.maxHp_,
               string.format("DestroyedBehavior.setHp() - invalid hp %s", tostring(hp)))
        object.hp_ = hp
        object.destroyed_ = object.hp_ <= 0
        object.hp__ = nil
    end
    object:bindMethod(self, "setHp", setHp)

    local function decreaseHp(object, amount)
        if object.destroyed_ then
            return
        end

        -- add by Owen, 2016.4.24, 英雄扣血了，也需要清零舞蹈倒计时
        if object.campId_ == MapConstants.HERO_CAMP then
            -- print("英雄扣血了，也需要清零舞蹈倒计时")
            -- 清零英雄的舞蹈倒计时
            if object.danceTime_ then
                object.danceTime_ = 0
                -- 记录目前是战斗状态
                object.isOutFight_     = false
                object.restorHPTime_ = 0
            end
        end

        amount = checknumber(amount)
        assert(amount >= 0, string.format("DestroyedBehavior.decreaseHp() - invalid amount %s", tostring(amount)))
        
        -- add by Owen, 2015.7.16, 血量变化的时候触发技能
        if object.hpTriggerSkill then
            local hp = (object.hp_ - amount)
            local percent = hp/object.maxHp_
            if hp <= 0 then
                percent = 0
            end
            for i,v in ipairs(object.hpTriggerSkill) do
                -- v[1],技能触发概率
                -- v[2],技能ID
                -- v[3],CD倒计时
                -- v[4],技能CD
                -- v[5],技能消耗
                -- v[6],技能配置

                -- 标记兵塔召唤出来的大水元素是被替换死掉的，这时候是不能分裂小水元素的
                if object.mainID_ == "170204" and object._isReplaceDie == true then
                    break
                end

                -- 遍历此时可以触发的技能,百分比满足了，并且CD也到了, 
                -- 孙悟空的复活放到rt:removeObject()中处理
                if percent <= v[1] and v[3] <= 0 and string.sub(v[2], 1, 5) ~= "13020" then
                    -- 判断消耗品是否满足了
                    local isPowerEnough, target = SkillFactory.checkIsSkillPowerEnough(object, v[2], v[5])
                    if isPowerEnough == true 
                        and not object._isComa then

                        -- 重置技能的CD
                        v[3] = v[4]

                        -- 清零英雄的舞蹈倒计时
                        if object.danceTime_ then
                            object.danceTime_ = 0
                            -- 记录目前是战斗状态
                            object.isOutFight_     = false
                            object.restorHPTime_ = 0
                        end

                        -- print("释放了血量触发的技能")

                        if v[1] == 0 then
                            -- change by Owen, 2016.3.22, 放在死亡动作播放完以后再释放这个技能
                            local function dieToCallUnit()
                                -- print("怪物死亡后的召唤技能 object._dieToCallUnitFunc")
                                SkillFactory.releaseSkill(object, v[2], MapConstants.SKILL_TYPE_AUTO, 
                                object.mapRuntime_, object, target, nil, nil, nil)
                            end
                            object._dieToCallUnitFunc = dieToCallUnit
                            -- -- 如果是物体死亡以后释放的技能，那么就不需要播放释放技能动画了
                            -- SkillFactory.releaseSkill(object, v[2], MapConstants.SKILL_TYPE_AUTO, 
                            --     object.mapRuntime_, object, target, nil, nil, nil)
                        else
                            -- 不是死亡触发的技能，还是需要播放技能释放动画的
                            SkillFactory.playSkillAni(object, v[2], MapConstants.SKILL_TYPE_AUTO, 
                                object.mapRuntime_, object, target, nil, nil, nil, v[6])
                        end
                        break
                    end
                end
            end
        end

        -- 处理吸伤盾
        if object.buffs_ and object.buffs_.timeBuff_ and object.buffs_.timeBuff_ then
            for k,v in pairs(object.buffs_.timeBuff_) do
                if v.absorbShield then
                    if object._absorbedDamage < object._absorbedMaxDamage then
                        if math.random(MapConstants.FOUDATION_PERCENT) <= v.absorbShield[1] then
                            -- 触发了吸伤
                            local count = amount - (object._absorbedMaxDamage - object._absorbedDamage)
                            local finalCount   -- 吸收了多少伤害
                            if count <= 0 then
                                -- 吸收了所有的伤害
                                finalCount = amount
                                amount = 0
                            else
                                finalCount = object._absorbedMaxDamage - object._absorbedDamage
                                amount = count
                            end
                            object._absorbedDamage = object._absorbedDamage + finalCount

                            if object._absorbedDamage == object._absorbedMaxDamage then
                                -- print("吸伤盾破了，从TimeBuff中移除")
                                -- 吸伤盾破了，从TimeBuff中移除
                                BuffBase.clearOneTimeBuff(object, k)
                            end
                        end
                    end
                end
            end
        end

        object.hp_ = object.hp_ - amount
        if object.hp_ <= 0 then
            object.hp_ = 0
            -- change by Owen, 2016.1.19, 血量==0了，直接把血条置为不可见
            object.hpOutlineSprite_:setVisible(false)
            if object.timeLineOutSprite_ then
                object.timeLineOutSprite_:setVisible(false)
            end
        end
        object.hpSprite_:setScaleX(object.hp_ / object.maxHp_)
        object.destroyed_ = object.hp_ <= 0
    end
    object:bindMethod(self, "decreaseHp", decreaseHp)

    local function increaseHp(object, amount)
        if object.destroyed_ then
            return
        end
        -- add by Owen, 2016.5.15, 制作第7关模式3，逃跑精灵不能回血
        if object.mainID_ == "100107" then
            return
        end
        amount = checknumber(amount)
        assert(amount >= 0, string.format("DestroyedBehavior.increaseHp() - invalid amount %s", tostring(amount)))
        object.hp_ = object.hp_ + amount
        if object.hp_ >= object.maxHp_ then
            object.hp_ = object.maxHp_
        end
        object.hpSprite_:setScaleX(object.hp_ / object.maxHp_)
        object.destroyed_ = object.hp_ <= 0
    end
    object:bindMethod(self, "increaseHp", increaseHp)

    local function createView(object, batch, marksLayer, debugLayer)
        -- local beginTime = socket.gettime()
        -- local oriBegin  = beginTime
        -- print("DestroyedBehavior:createView")
        -- hpOutSprite = display.newSprite(string.format("#ObjectHpOutline.png"))

        
        

        hpOutSprite = display.newSprite("ui/fight/lifeLine/heroHpOut2.png")
        if object.campId_ == MapConstants.HERO_CAMP then
            -- hpSprite_ = display.newSprite("#FriendlyHp.png")

            if not object._isSoldier then
                hpOutSprite:setTexture("ui/fight/lifeLine/heroHpOut.png")
            else
                hpOutSprite:setTexture("ui/fight/lifeLine/heroHpOut2.png")
            end

            hpSprite_ = display.newSprite("ui/fight/lifeLine/heroHp.png")
        else
            -- hpSprite_ = display.newSprite("#EnemyHp.png")
            hpSprite_ = display.newSprite("ui/fight/lifeLine/monsterHp.png")
        end
        hpSprite_:align(display.LEFT_CENTER, 0, 0)

        hpOutSprite:align(display.LEFT_CENTER, 0, 0)
        batch:addChild(hpOutSprite, MapConstants.HP_BAR_ZORDER)

        -- 美术给的血条图片的长度
        local imgWidth  = hpOutSprite:getContentSize().width
        local imgHeight = hpOutSprite:getContentSize().height

        local hpScale = object.radius_*0.85/imgWidth    -- object.radius_*2/imgWidth

        -- print("hp imgWidth = "..tostring(imgWidth).." hpScale = "..tostring(hpScale))

        hpOutSprite:addChild(hpSprite_)
        

        -- 英雄的血条不要进行缩放, 要修改一下位置
        if object.campId_ == MapConstants.HERO_CAMP and not object._isSoldier then
            hpScale = 1.0
            hpSprite_:setPosition(3, imgHeight/2)
        else
            hpOutSprite:setScaleX(hpScale)
            hpSprite_:setPosition(0, imgHeight/2)
        end

        -- object.hpSprite_:setScaleX(hpScale)

        object.hpOutlineSprite_ = hpOutSprite
        object.hpSprite_        = hpSprite_
        self.hpScale = hpScale

        -- 先计算好位置偏移
        object._hpDiffX = object.radiusOffsetX_ - (imgWidth / 2)*hpScale
        object._hpDiffY = object.radiusOffsetY_ + object.radius_ + MapConstants.HP_BAR_OFFSET_Y

        hpOutSprite:setPosition(object.x_ + object._hpDiffX, 
            object.y_ + object._hpDiffY)

        if object.campId_ == MapConstants.TOWER_CAMP then
            hpOutSprite:setVisible(false)
        end


        -- 如果是通过祭坛塔，召唤出来的士兵的话显示一个时间条
        if object.mainID_ == "170106" or object.mainID_ == "170204" 
            or object.mainID_ == "170301" then

            local timeLineOut = display.newSprite("ui/fight/lifeLine/timeLineOut.png")
            local timeLine    = display.newSprite("ui/fight/lifeLine/timeLine.png")


            timeLineOut:align(display.LEFT_CENTER, 0, 0)
            batch:addChild(timeLineOut, MapConstants.HP_BAR_ZORDER)

            timeLine:align(display.LEFT_CENTER, 0, 0)

            -- 美术给的血条图片的长度
            local imgWidth  = timeLineOut:getContentSize().width
            local imgHeight = timeLineOut:getContentSize().height

            local hpScale = object.radius_*0.85/imgWidth    -- object.radius_*2/imgWidth

            -- print("time imgWidth = "..tostring(imgWidth).." timeScale = "..tostring(timeScale))

            timeLineOut:addChild(timeLine)
            timeLine:setPosition(0, imgHeight/2)

            timeLineOut:setScaleX(hpScale)
            -- object.timeLine:setScaleX(hpScale)

            object.timeLineOutSprite_ = timeLineOut
            object.timeLineSprite_    = timeLine

            -- -- 先计算好位置偏移
            -- object._hpDiffX = object.radiusOffsetX_ - (imgWidth / 2)*hpScale
            -- object._hpDiffY = object.radiusOffsetY_ + object.radius_ + MapConstants.HP_BAR_OFFSET_Y
        end



        -- 给美术测试，隐藏掉血条
        -- object.hpSprite_:setVisible(false)
        -- object.hpOutlineSprite_:setVisible(false)

        -- local endTime = socket.gettime()
        -- print("StaticObject:createView 耗时 3 = "..(endTime - beginTime))
    
        -- print("DestroyedBehavior:createView 整个函数耗时 = "..(endTime - oriBegin))
    end
    object:bindMethod(self, "createView", createView)

    local function removeView(object)
        -- print("DestroyedBehavior:removeView")
        object.hpOutlineSprite_:removeSelf()
        object.hpOutlineSprite_ = nil
        -- object.hpSprite_:removeSelf()
        object.hpSprite_ = nil
        if object.timeLineOutSprite_ then
            object.timeLineOutSprite_:removeSelf()
            object.timeLineOutSprite_ = nil
            object.timeLineSprite_ = nil
        end
    end
    object:bindMethod(self, "removeView", removeView, true)

    local function updateView(object)
        -- 只有在绑定 Behavior 的时候，才会调用一次这个函数，其他时候都不会调用这个函数

        -- print("DestroyedBehavior updateView object.hp_ = "..tostring(object.hp_))
        object.hp__ = object.hp_
        -- chang by Owen, 2015.4.28, 新建一个塔，跑，然后再停，会报错，object.hpSprite_不存在
        -- if object.hp_ > 0 then
        if object.hp_ > 0 and object.hpSprite_ ~= nil then
            local x, y = object.x_, object.y_

            -- object.hpSprite_:setPosition(x + self.diffX, y + self.diffY)

            object.hpSprite_:setScaleX(object.hp_ / object.maxHp_) -- * self.hpScale)

            -- print("hpOutlineSprite_:setPosition x = "..x.." y = "..y)
            -- object.hpOutlineSprite_:setPosition(x + object._hpDiffX, y + object._hpDiffY)

            -- object.hpOutlineSprite_:setPosition(x + radiusOffsetX, y2)
        else
            -- if object.hpSprite_ then
            --     object.hpSprite_:setVisible(false)
            -- end
            -- if object.hpOutlineSprite_ then 
            --     object.hpOutlineSprite_:setVisible(false)
            -- end
        end
    end
    object:bindMethod(self, "updateView", updateView)

    local function fastUpdateView(object)
        -- if not object.updated__ and object.hp__ == object.hp_ then return end
        -- updateView(object)
    end
    object:bindMethod(self, "fastUpdateView", fastUpdateView)

    self:reset(object)
end

function DestroyedBehavior:unbind(object)
    object.hitOffsetX_ = nil
    object.hitOffsetY_ = nil
    object.maxHp_      = nil
    object.destroyed_  = nil
    object.hp_         = nil

    object:unbindMethod(self, "isDestroyed")
    object:unbindMethod(self, "setDestroyed")
    object:unbindMethod(self, "getMaxHp")
    object:unbindMethod(self, "setMaxHp")
    object:unbindMethod(self, "getHp")
    object:unbindMethod(self, "setHp")
    object:unbindMethod(self, "decreaseHp")
    object:unbindMethod(self, "increaseHp")
    object:unbindMethod(self, "createView")
    object:unbindMethod(self, "removeView")
    object:unbindMethod(self, "updateView")
    object:unbindMethod(self, "fastUpdateView")
end

function DestroyedBehavior:reset(object)
    object.hitOffsetX_ = checkint(object.state_.hitOffsetX)
    object.hitOffsetY_ = checkint(object.state_.hitOffsetY)
    object.maxHp_      = checkint(object.state_.maxHp)

    if object.maxHp_ < 1 then object.maxHp_ = 1 end
    object.hp_        = object.maxHp_
    object.destroyed_ = object.hp_ <= 0
    object.hp__       = nil
end

return DestroyedBehavior
