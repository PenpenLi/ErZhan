
local HeroProperties      = require("app.properties.HeroProperties")
local SoldierProperties   = require("app.properties.SoldierProperties")
local HeroGrowth          = require("app.properties.HeroGrowth")
local MapConstants        = require("app.map.MapConstants")
local BehaviorBase        = require("app.map.behaviors.BehaviorBase")
local SkillFactory        = require("app.map.skills.SkillFactory")
local BattleDataManager   = require("app.map.data.BattleDataManager")
local AutoSkillProperties = require("app.properties.AutoSkillProperties")
local BuffProperties      = require("app.properties.BuffProperties")
local BuffBase            = require("app.map.skills.BuffBase")
local SkillBase           = require("app.map.skills.SkillBase")
local AreaProperties      = require("app.properties.AreaProperties")
local ObjectState         = require("app.map.ObjectState")
local EffectAniCache      = require("app.map.spine.EffectAniCache")
local PassiveSkillProperties  = require("app.properties.PassiveSkillProperties")
local StableGameProperties    = require("app.properties.StableGameProperties")
local GlobalData              = require("tools.GlobalData")
local math2d       = require("math2d")

require "socket"      -- 把这个require进来，是为了获得毫秒时间


local HeroBehavior = class("HeroBehavior", BehaviorBase)

function HeroBehavior:ctor()
    local depends = {
        "DestroyedBehavior",
        "FireBehavior",
        "MovableBehavior",
        -- "DecorateBehavior",
    }
    HeroBehavior.super.ctor(self, "HeroBehavior", depends, 100)
end

function HeroBehavior:bind(object)

    object.campId_ = MapConstants.HERO_CAMP
    object.maskId_ = MapConstants.HERO_CAMP_MASK

    -- 战斗中默认自动释放主动技能
    object.isAutoCast = false

    -- 战斗中自动跟踪
    object.isAutoTrack = true

    -- 是否启用 AI
    object.isAIEnabled = true

    -- 死亡后是否显示墓碑并自动复活
    object.isRevive = true

    -- 还有多久时间复活
    object.reviveTime = 0

    if type(object.defineId_) ~= "string" then object.defineId_ = "" end

    -- local function getNPCId(object)
    --     return object.npcId_
    -- end
    -- object:bindMethod(self, "getNPCId", getNPCId)

    local function initBehavior(object, defineId_)

        local define = HeroProperties.get(object.defineId_)
        -- print("yaoxiaoyang testBug object.mainID_ = "..tostring(object.defineId_))
        if not define then
            -- change by Owen, 2015.7.14, 英雄列表中取不到属性，就去召唤兵的列表中找
            define = SoldierProperties.get(object.defineId_)
            object._isSoldier = true
        end
        for k, v in pairs(define) do
            local kn = k .. "_"
            object[kn] = v
            object.state_[k] = v
        end

       
        -- change by Owen, 2015.7.9, 手动添加英雄经验值字段
        object.level_         = 1
        object.exp_           = 0
        object.isDead_        = false  -- 英雄当前是否死亡
        object.reviveTime_    = 0      -- 英雄还有多久时间复活
        object.attackCount_   = 0      -- 记录英雄总共攻击了几次,在套路判定中用到
        object.mp_            = 0      -- 记录英雄的能量
        object.heroDeadCount_ = 0      -- 记录英雄总共死亡了几次
        object.addHpTime_     = 0      -- 记录英雄的回血倒计时
        object.danceTime_     = 0      -- 记录英雄舞蹈动作倒计时, 移动、攻击、释放技能会清零
        object.isOutFight_    = false  -- 记录英雄是否是脱战状态
        object.restorHPTime_ = 0      -- 记录英雄开始回血的倒计时
        object:heroDataInit()
    end
    object:bindMethod(self, "initBehavior", initBehavior)


    local function heroDataInit(object)

        -- local define = HeroProperties.get(object.defineId_)
        -- if not define then

        --     -- print(" 找不到define, 可能是召唤兵或者升级错误，object.mainID_ = "..tostring(object.defineId_ ))
        --     -- change by Owen, 2015.7.14, 英雄列表中取不到属性，就去召唤兵的列表中找
        --     define = SoldierProperties.get(object.defineId_)
        --     object._isSoldier = true
        -- end

        -- for k, v in pairs(define) do
        --     local kn = k .. "_"
        --     object[kn] = v
        --     object.state_[k] = v
        -- end

        -- add by Owen, 2015.7.27, 修改召唤士兵的存活时间为毫秒
        if object._isSoldier then
            -- 记录这个召唤兵可以存活的时间，因为liveTime_在一直倒计时，所以需要多一个变量记录
            object.oriLiveTime_ = object.liveTime_/MapConstants.MILLISECOND
            object.liveTime_    = object.liveTime_/MapConstants.MILLISECOND

        end

        -- add by Owen, 2015.6.29，具体的6个属性到HeroGrowth表中去读取
        -- print("object.mainID_ = "..tostring(object.defineId_))
        if object._isSoldier == nil then
            local growth = HeroGrowth.get(object.defineId_)
            define = growth[1][object.level_]       -- 一星一级的品质
            -- dump(define, "dump define")
            --dump(define, "dump 英雄当前等级的属性")

            --处理英雄最大生命值变化后生命的变化(如升级、复活)
            if(define.maxHp~= object.maxHp_) then
                object.hp_ = object.hp_+define.maxHp-object.maxHp_
            end

            for k, v in pairs(define) do
                local kn = k .. "_"
                if object.originalPro_ then
                    object.originalPro_[k] = v    -- 记录的基础属性也需要相应的修改
                end
                object[kn] = v
                object.state_[k] = v
            end

            -- add by Owen, 2016.7.21, 英雄升级以后，要重新初始化技能、羁绊等
            -- 否则英雄升级以后，就没有羁绊的效果了
            if object.level_ > 1 then
                SkillFactory.initSkillAndBuff(object, object.mapRuntime_)
            end
        end
    end
    object:bindMethod(self, "heroDataInit", heroDataInit)


    -- change by Owen, 2015.7.15, 添加英雄的tick函数，用来处理召唤兵的死亡
    local function tick(object, dt)
        if object._isSoldier then
            object.liveTime_ = object.liveTime_ - dt
            -- print("召唤兵存活时间 object.liveTime_ = "..tostring(object.liveTime_))
            if object.liveTime_ <= 0 then
                -- 给召唤兵造成当前血量的伤害，让士兵死亡
                -- 召唤兵死亡
                object.mapRuntime_.handler_:hit(nil, object, object.hp_)

                -- change by Owen, 2015.7.27, 不能直接伤害，要调用近战子弹
                -- 在for k,v in pairs() 循环中，把v=nil，好像对后面的循环不会有影响
                -- 所以这里先暂时不改成子弹的形式
                -- local bulletConfig = BulletProperties.get(StableGameProperties.NEAR_ATTACK_BULLET)
                -- local bullet = BulletFactory.newBullets(BulletType.DIRECT, 
                --     object, v, 0, bulletConfig, object.trajectory_)
                -- if bullet:getView() then
                --     object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
                -- end
                -- object.mapRuntime_:addBullet(bullet)
            end
            
            -- print("DestroyedBehavior:updateView object.mainID_ = "..tostring(object.mainID_))
            -- 如果是通过祭坛塔，召唤出来的士兵的话显示一个时间条的倒计时
            if object.mainID_ == "170106" or object.mainID_ == "170204"
                or object.mainID_ == "170301" then

                -- print("object.liveTime_ = "..tostring(object.liveTime_)
                --     .." object.oriLiveTime_ = "..tostring(object.oriLiveTime_))
                object.timeLineSprite_:setScaleX(object.liveTime_ / object.oriLiveTime_)
            end
        end

        -- 处理英雄能量回复
        if object.maxMP_ then
            local restore = object.restoreMP_[2] * (1/(object.restoreMP_[1]/MapConstants.MILLISECOND))
            object.mp_ = object.mp_ + restore * dt
            if object.mp_ >= object.maxMP_ then
                object.mp_ = object.maxMP_
            end
        end

        -- 处理英雄restoreHP字段的回血，每过一段时间后回血
        if object.restoreHP_ and object.restoreHP_ ~= 0 then
            object.addHpTime_ = object.addHpTime_ + dt
            if object.addHpTime_ >= StableGameProperties.RESTORE_HP_TIME/MapConstants.MILLISECOND 
                and object.hp_ < object.originalPro_.maxHp then
                object.addHpTime_ = 0
                object:increaseHp(object.restoreHP_)
                -- 添加回血的特效
                local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Treat",
                    nil, nil, object)
                object.sprite_:addChild(effect)
                effect:setPosition(offsetX, offsetY)
            end
        end

        -- 处理英雄跳舞倒计时
        if not object._isSoldier and not object.isDead_ then
            object.danceTime_ = object.danceTime_ + dt
            -- 只有IDLE状态下才可以播放舞蹈动作
            -- 防止控制英雄长时间移动的过程中播放Dance, 进而修改了物体的状态
            if object.danceTime_ > 5 and object.curState == ObjectState.IDLE then
                object.isOutFight_ = true
                object.danceTime_ = 0
                object.curState = ObjectState.DANCE
                object:playAni("Dance", false, false, nil, function ( ... )
                    object.curState = ObjectState.IDLE
                    object:playAni("Idle", true, false)
                end, nil)
            end
            -- add by Owen, 2016.2.2, 处理英雄脱战以后的回血功能
            if object.isOutFight_ then
                object.restorHPTime_ = object.restorHPTime_ + dt
                -- 如果到了回血的CD时间, 回复万分比
                if object.restorHPTime_ >= StableGameProperties.IDLE_RESTORE_HP_TIME/1000 
                    and object.hp_ < object.originalPro_.maxHp then
                    object:increaseHp( object.originalPro_.maxHp *
                        (object.idleRestoreHP_/MapConstants.FOUDATION_PERCENT) )
                    object.restorHPTime_ = 0

                    -- 添加回血的特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Treat",
                        nil, nil, object)
                    object.sprite_:addChild(effect)
                    effect:setPosition(offsetX, offsetY)
                end
            end
        end
    end
    object:bindMethod(self, "tick", tick)


    -- 增加英雄经验，2015.7.9新加
    local function heroAddExp(object, count)
        local bHasAddExp = false
        if not count then
            if object.level_ < BattleDataManager:getMaxHeroLevel() then
                object.exp_ = object.exp_ + BattleDataManager:getHeroAddExp()
                bHasAddExp = true
            end
        else
            if object.level_ < BattleDataManager:getMaxHeroLevel() then
                object.exp_ = object.exp_ + count
                bHasAddExp = true
            end
        end

        -- 到达升下一级所需的经验了
        if bHasAddExp then
            if object.exp_ >= BattleDataManager:getHeroLevelNeedExp(object.level_ + 1) then
                -- 播放升级特效
                local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Lv_up", nil, nil, object)
                object.sprite_:addChild(effect)
                effect:setPosition(offsetX, offsetY)

                object:heroUpLevel()
            end
        end
    end
    object:bindMethod(self, "heroAddExp", heroAddExp)

    -- 升级英雄，2015.7.9新加
    local function heroUpLevel(object)
        -- print("HeroBehavior heroUpLevel, object.mainID_ = "..tostring(object.mainID_)..
        --     " level = "..tostring(object.level_))

        -- add by Owen, 2016.4.23, 英雄升级的时候，需要播放音效
        AudioMgr.playSound("Upgrade")

        object.level_ = object.level_ + 1
        object.exp_   = 0
        object:heroDataInit()

        -- 处理成就，第一次将英雄升级到3级
        if object.level_ == 3 then
            local state1 = GlobalData.getAchieve("141204") 
            if state1 == 0 then
                GlobalData.setAchieve("141204", 1)
            end
        end
        -- 处理成就，第一次将英雄升级到5级
        if object.level_ == 5 then
            local state1 = GlobalData.getAchieve("141215") 
            if state1 == 0 then
                GlobalData.setAchieve("141215", 1)
            end
        end
    end
    object:bindMethod(self, "heroUpLevel", heroUpLevel)


    -- change by Owen, 2015.7.15, 添加英雄的获得当前套路函数
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

        -- 如果是士兵
        if object._isSoldier then
            -- 兵塔召唤出来的大水元素，如果攻击次数到了20次那么就让它死亡
            object.attackCount_ = object.attackCount_ + 1
            if object.mainID_ == "170204" 
                and object.attackCount_ >= StableGameProperties.WATER_ELENTAL_ATT_COUNT then
                
                object.mapRuntime_.handler_:hit(nil, object, object.hp_)
                -- 自己死亡就不能攻击和放技能了
                return false
            end

            -- 处理士兵的攻击触发技能
            if object.attackTriggerSkill and #object.attackTriggerSkill > 0 then
                local hasReleaseSkill = SkillFactory.checkAttackTriggerSkill(object, target)
                -- 如果普攻触发了技能，则返回false
                if hasReleaseSkill then
                    return false
                end
            end
            -- 如果普攻没有触发技能，则返回true
            return true
        end

        if object.attackMode_ then
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
                -- print("")
                if target ~= nil then
                    -- 清零舞蹈倒计时
                    object.danceTime_ = 0

                    -- change by Owen, 2016.4.14, 如果套路技能不需要目标，则把target置为nil
                    -- 如果需要目标，则一定是自己的攻击目标。
                    -- 为了配合德鲁伊的套路荆棘球，用子弹来召唤荆棘球
                    local skillConfig = AutoSkillProperties.get(object.attackMode_[index])
                    if not skillConfig.target then
                        target = nil
                    end

                    -- print("释放套路技能 id = "..tostring(object.attackMode_[index]))
                    SkillFactory.playSkillAni(object, tostring(object.attackMode_[index]), 
                        MapConstants.SKILL_TYPE_AUTO, object.mapRuntime_, object, target, nil, nil, true)
                end
                return false
            end
        end
    end
    object:bindMethod(self, "getAttackMode", getAttackMode)

    -- 初始化召唤兵的技能，因为CallUnitSkill中直接包含SkillFactory会出错，所以绕一个弯
    local function initMonsterSkillAndBuff(object, mapRuntime)
        -- print("HeroBehavior:initMonsterSkillAndBuff")
        SkillFactory.initSkillAndBuff(object, mapRuntime)
    end
    object:bindMethod(self, "initMonsterSkillAndBuff", initMonsterSkillAndBuff)

    -- local function showDestroyedStatus(object, skipAnim)
    --     -- change by Owen, 2015.7.10, 测试代码，英雄死了以后不播放死亡动画
    --     -- do 
    --     --     return
    --     -- end

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
        state.mainID = object.mainID_
        return state
    end
    object:bindMethod(self, "vardump", vardump)
end

function HeroBehavior:unbind(object)
    object.mainID_ = nil

    object:unbindMethod(self, "initBehavior")
    --object:unbindMethod(self, "setNPCId")
    object:unbindMethod(self, "heroDataInit")
    object:unbindMethod(self, "heroAddExp")
    object:unbindMethod(self, "heroUpLevel")
    object:unbindMethod(self, "tick")
    object:unbindMethod(self, "getAttackMode", getAttackMode)
    object:unbindMethod(self, "initMonsterSkillAndBuff", initMonsterSkillAndBuff)
    object:unbindMethod(self, "showDestroyedStatus")
    object:unbindMethod(self, "showBornStatus")
    object:unbindMethod(self, "vardump")
end

-- ObjectBase:bindBehavior会调用这个，在Map:newObject会调用这个，
-- 在ObjectInspector中修改物体的属性后会调用这个
function HeroBehavior:reset(object)
    -- object:setNPCId(object:getNPCId())
    object:initBehavior()
end

return HeroBehavior