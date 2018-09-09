
local MonsterProperties      = require("app.properties.MonsterProperties")
local MapConstants           = require("app.map.MapConstants")
local BehaviorBase           = require("app.map.behaviors.BehaviorBase")
local BuffBase               = require("app.map.skills.BuffBase")
local SkillFactory           = require("app.map.skills.SkillFactory")
local StableGameProperties   = require("app.properties.StableGameProperties")
local ObjectState            = require("app.map.ObjectState")
local BuffProperties         = require("app.properties.BuffProperties")
local AutoSkillProperties    = require("app.properties.AutoSkillProperties")

local MonsterBehavior = class("MonsterBehavior", BehaviorBase)

function MonsterBehavior:ctor()
    local depends = {
        "DestroyedBehavior",
        "FireBehavior",
        "MovableBehavior",
        -- "DecorateBehavior",
    }
    MonsterBehavior.super.ctor(self, "MonsterBehavior", depends, 100)
end

function MonsterBehavior:bind(object)
    -- 增加阵营和碰撞检测的mask
    object.campId_ = MapConstants.MONSTER_CAMP
    object.maskId_ = MapConstants.MONSTER_CAMP_MASK

    -- 战斗中默认自动释放主动技能
    object.isAutoCast = true

    -- 战斗中自动跟踪
    object.isAutoTrack = false -- true

    -- 是否启用 AI
    object.isAIEnabled = true

    -- 死亡后是否显示墓碑并自动复活
    object.isRevive = false

    -- buff列表
    object.buffs_={}

    -- object.npcId_ = object.state_.npcId
    if type(object.npcId_) ~= "string" then object.npcId_ = "" end

    -- local function getNPCId(object)
    --     return object.npcId_
    -- end
    -- object:bindMethod(self, "getNPCId", getNPCId)

    local function setNPCId(object, npcId)
        -- object.npcId_ = npcId

        local define = MonsterProperties.get(object.defineId_)
        if not define then
            -- object.npcId_ = "1001001"
            -- define = MonsterProperties.get(object.npcId_)
            object.defineId_ = "100101"
            define = MonsterProperties.get(object.defineId_)
        end
        for k, v in pairs(define) do
            local kn = k .. "_"
            object[kn] = v
            object.state_[k] = v
        end

        -- 保存物体的基础属性
        -- BuffBase.restoreOriginalPro(object)
        object.mp_ = 0

    end
    object:bindMethod(self, "setNPCId", setNPCId)

    -- 初始化怪物的技能，因为CallUnitSkill中直接包含SkillFactory会出错，所以绕一个弯
    local function initMonsterSkillAndBuff(object, mapRuntime)
        SkillFactory.initSkillAndBuff(object, mapRuntime)
    end
    object:bindMethod(self, "initMonsterSkillAndBuff", initMonsterSkillAndBuff)


    -- add by Owen, 2015.7.29, 添加怪物的tick函数，用来处理能量的回复
    local function tick(object, dt)
        if object.maxMP_ then
            -- 每秒回复多少
            local restore = object.restoreMP_[2] * (1/(object.restoreMP_[1]/MapConstants.MILLISECOND))
            object.mp_ = object.mp_ + restore * dt
            -- print("怪物的MP值, object.mp_ = "..tostring(object.mp_))
            if object.mp_ >= object.maxMP_ then
                object.mp_ = object.maxMP_
            end
        end

        -- 记录Boss刷了多久, 用来做Boss的休息逻辑判定
        if object.restCD_ then
            if not object._bossNormalLiveCD then
                object._bossNormalLiveCD = 0
            else
                if not object._needRest and object.curState ~= ObjectState.BOSS_REST then
                    -- print("MonsterBehavior:tick 1")
                    object._bossNormalLiveCD = object._bossNormalLiveCD + dt
                end
                -- Boss行走的时间到了，后面需要播放休息动作了
                if not object._needRest 
                    and object._bossNormalLiveCD >= object.restCD_[1]/MapConstants.MILLISECOND then
                    -- print("MonsterBehavior:tick 2")
                    object._needRest = true
                    object._bossNormalLiveCD = 0
                end

                -- 只有怪物为Idle或者是移动的时候，才可以播放休息动作
                if (object.curState == ObjectState.IDLE or object.curState == ObjectState.MOVE)
                     and object._needRest then
                    -- print("MonsterBehavior:tick 3")

                    -- add by Owen, 2016.4.4, 如果是地狱炎魔怪物，判定是不是给自己加了Buff
                    if object.mainID_ == "100504" 
                        and math.random(10000) < StableGameProperties.YAN_MO_ADD_HP_RANDOM then
                        local buff = BuffProperties.get("210304")
                        BuffBase.addTimeBuff(object, buff, object)
                    end

                    -- change by Owen, 2016.5.23, 熔岩Boss休息的时候，需要先播钻出来的动作，然后再切到休息动作
                    if object.mainID_ == "100504" then
                        -- 休息的时候，就变成地上怪物了
                        object.walkLayer_ = MapConstants.MONSTER_WALK_LAYER_EARTH

                        -- 如果Boss正在移动中，则需要先播放钻出来的动作，然后再播放休息动作
                        -- 如果已经在地面了，则直接播放休息动作就好
                        if object.curState == ObjectState.MOVE then
                            local function finc( ... )
                                object:playAni("Boss_Rest", true)
                            end
                            object:playAni("Special_02", false, true, nil, finc)
                        else
                            object:playAni("Boss_Rest", true)
                        end

                        -- 播放boss的休息动作, 开始记录Boss的休息倒计时
                        object:setState(ObjectState.BOSS_REST)
                        
                        
                        object._needRest = false
                        object._bossNormalLiveCD = 0
                    else
                        -- 播放boss的休息动作, 开始记录Boss的休息倒计时
                        object:setState(ObjectState.BOSS_REST)
                        object:playAni("Boss_Rest", true)
                        object._needRest = false
                        object._bossNormalLiveCD = 0
                    end
                end

                -- Boss开始休息了以后，要记录休息的时间
                if object.curState == ObjectState.BOSS_REST then
                    -- print("MonsterBehavior:tick 4")
                    if not object._bossRestTime then
                        object._bossRestTime = 0
                    end
                    object._bossRestTime = object._bossRestTime + dt
                    -- Boss休息的时间够了，开始正常的逻辑
                    if object._bossRestTime >= object.restCD_[2]/MapConstants.MILLISECOND  then
                        -- print("MonsterBehavior:tick 5")
                        object:setState(ObjectState.IDLE)
                        object:playAni("Idle", true)
                        object._bossRestTime = 0
                        object._bossNormalLiveCD = 0

                        -- add by Owen, 2016.4.4, 如果是地狱炎魔怪物，判定是不是释放技能岩浆暴怒
                        if object.mainID_ == "100504" 
                            and math.random(10000) < StableGameProperties.YAN_MO_RELEASE_RANDOM then
                            object:setState(ObjectState.RELEASE_SKILL)
                            SkillFactory.playSkillAni(object, "130414", 
                                MapConstants.SKILL_TYPE_AUTO,
                                object.mapRuntime_, object, nil, nil, nil, true)
                        end
                    end
                end
            end
        end

        -- add by Owen, 2015.10.16, 处理钉魂箭倒计时
        -- 记录物体被攻击的时间，因为如果3秒内没有被攻击的话，附加伤害就要清空
        -- 在monsterBehavior:tick中,会累加这个值,一旦超过3秒,就会将_soulAttack置为0
        local retainTIme = StableGameProperties.SOUL_ATTACK_CLEAR_CD/MapConstants.MILLISECOND
        if object._soulAttackTime and 
            object._soulAttackTime < retainTIme then
            
            object._soulAttackTime = object._soulAttackTime + dt
            if object._soulAttackTime > retainTIme then
                object._soulAttackTime = retainTIme

                -- print("3秒时间到了，清空钉魂箭的附加伤害")
                object._soulAttack = 0

                -- 显示去掉钉魂箭文字
                -- print("清空钉魂箭名字 object.index_ = "..tostring(object.index_))
                if not object.destroyed_ then
                    object._addViw["soulArrow"]:removeSelf()
                    object._addViw["soulArrow"] = nil
                    object._addViw["soulArrowEff"]:removeSelf()
                end
            end
        end

        -- add by Owen, 2015.10.28, 处理4级法师塔魂魄攻击
        -- 如果3秒内没有被攻击的话，附加的被攻击次数就要清空
        local retainTIme = StableGameProperties.FOUR_LV_MAGIC_CLEAR_TIME/MapConstants.MILLISECOND
        if object._fourMagicAttackTime and 
            object._fourMagicAttackTime < retainTIme then
            
            object._fourMagicAttackTime = object._fourMagicAttackTime + dt
            if object._fourMagicAttackTime > retainTIme then
                object._fourMagicAttackTime = retainTIme

                -- print("3秒时间到了，清空4级法师塔魂魄攻击次数")
                object._soulAttackCount = 0

                -- 显示去掉魂魄攻击文字
                -- print("清空掉魂魄攻击文字 object.index_ = "..tostring(object.index_))
                if not object.destroyed_ then
                    object._addViw["fourMagic"]:removeSelf()
                    object._addViw["fourMagic"] = nil
                end
            end
        end

        -- 如果这个帧动画有帧事件，并且已触发的事件少于需要处理的总事件
        if object._fireFrameIndexs and object._firedFrameCount < #object._fireFrameIndexs then
            local frameIndex = object:getCurrentFrameIndex()
            -- print("帧动画当前播放到了第几帧 frameIndex = "..tostring(frameIndex))
            if frameIndex == object._fireFrameIndexs[object._firedFrameCount + 1] then
                -- print("触发了帧动画的帧事件，index = "..frameIndex)
                object._aniEventFunc()
                object._firedFrameCount = object._firedFrameCount + 1
            end
        end
    end
    object:bindMethod(self, "tick", tick)

    -- change by Owen, 2016.2.26, 添加怪物的获得当前套路函数
    -- 如果是普攻，处理普攻释放的技能，然后返回，否则在这个函数中直接释放技能
    -- 是普攻，则返回true，
    -- 普攻触发了技能，或者套路中是技能，则返回false
    local function getAttackMode(object)

        -- 英雄将要攻击的目标
        local target = nil
        if object.bList then
            target = object.bList[1]
        elseif object.lookList then
            target = object.lookList[1]
        end

        if object.attackMode_ then
            if not object.attackCount_ then
                object.attackCount_   = 0      -- 记录怪物总共攻击了几次,在套路判定中用到
            end
            local total = #object.attackMode_
            local round = math.floor(object.attackCount_/total) 
            local index = object.attackCount_ + 1 - round*total
            -- print("HeroBehavior getAttackMode index = "..tostring(index))

            object.attackCount_ = object.attackCount_ + 1


            if tostring(object.attackMode_[index]) == "1" then
                -- 判定攻击中有没有触发了技能，如果有则不攻击
                if object.attackTriggerSkill and #object.attackTriggerSkill > 0 then
                    local hasReleaseSkill = SkillFactory.checkAttackTriggerSkill(object, target)
                    -- 如果普攻触发了技能，则返回false
                    if hasReleaseSkill then
                        return false
                    end
                end
                -- 普攻没触发技能则返回true
                return true
            else
                local skillId = tostring(object.attackMode_[index])
                if target ~= nil then
                    -- 清零舞蹈倒计时
                    object.danceTime_ = 0

                    -- change by Owen, 2016.4.14, 如果套路技能不需要目标，则把target置为nil
                    -- 如果这个技能需要有目标，并且不是以攻击对象为攻击目标，则需要找一下目标
                    local skillConfig = AutoSkillProperties.get(object.attackMode_[index])
                    if not skillConfig.target then
                        target = nil
                    elseif skillConfig.target and skillConfig.target ~= 1 then
                        local isEnough, newTarget = SkillFactory.checkIsSkillPowerEnough(object, skillId, skillConfig.powerCost)
                        target = newTarget
                    end

                    -- print("释放套路技能 id = "..tostring(object.attackMode_[index]))
                    SkillFactory.playSkillAni(object, tostring(object.attackMode_[index]), 
                        MapConstants.SKILL_TYPE_AUTO, object.mapRuntime_, object, target, nil, nil, true)
                end
                return false
            end
        else
            return true
        end
    end
    object:bindMethod(self, "getAttackMode", getAttackMode)

    -- local function showDestroyedStatus(object, skipAnim)
    --     local shipWavesUp = object:getDecoration("ShipWavesUp")
    --     local shipWaves = object:getDecoration("ShipWaves")
    --     if skipAnim then
    --         object:getView():setVisible(false)
    --         shipWavesUp:setVisible(false)
    --         shipWaves:setVisible(false)
    --     else
    --         transition.fadeOut(object:getView(), {time = 1.0})
    --         transition.stopTarget(shipWavesUp:getView())
    --         shipWavesUp:setVisible(false)
    --         transition.stopTarget(shipWaves:getView())
    --         shipWaves:setVisible(false)
    --     end
    -- end
    -- object:bindMethod(self, "showDestroyedStatus", showDestroyedStatus)

    local function showBornStatus(object)
        transition.fadeIn(object:getView(), {delay = 0.3, time = 0.5})
        transition.fadeIn(object:getDecoration("ShipWavesUp"):getView(), {delay = 0.3, time = 1.0})
        transition.fadeIn(object:getDecoration("ShipWaves"):getView(), {delay = 0.3, time = 1.0})
    end
    object:bindMethod(self, "showBornStatus", showBornStatus)

    local function vardump(object, state)
        state.npcId = object.npcId_
        return state
    end
    object:bindMethod(self, "vardump", vardump)
end

function MonsterBehavior:unbind(object)
    object.npcId_ = nil

    object:unbindMethod(self, "getNPCId")
    object:unbindMethod(self, "setNPCId")
    object:unbindMethod(self, "initMonsterSkillAndBuff")
    object:unbindMethod(self, "tick")
    object:unbindMethod(self, "showDestroyedStatus")
    object:unbindMethod(self, "showBornStatus")
    object:unbindMethod(self, "vardump")
end

function MonsterBehavior:reset(object)
    -- object:setNPCId(object:getNPCId())
    object:setNPCId()
end

return MonsterBehavior
