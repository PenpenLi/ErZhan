
local MapConstants  = require("app.map.MapConstants")
local BulletType    = require("app.map.bullets.BulletType")
local BulletFactory = require("app.map.bullets.BulletFactory")
local BehaviorBase  = require("app.map.behaviors.BehaviorBase")
local math2d        = require("math2d")
local BulletBase    = require("app.map.bullets.BulletBase")
local BulletType    = require("app.map.bullets.BulletType")
local SkillFactory  = require("app.map.skills.SkillFactory")
local BulletProperties  = require("app.properties.BulletProperties")
local BattleDataManager = require("app.map.data.BattleDataManager")
local StableGameProperties = require("app.properties.StableGameProperties")

-- 对象状态
-- 做成 local 提高访问速度
local ObjectState = require("app.map.ObjectState")
local MOVE              = ObjectState.MOVE
local TRACK             = ObjectState.TRACK
local ATTACK            = ObjectState.ATTACK
local FAR_ATTACK        = ObjectState.FAR_ATTACK
local STOP              = ObjectState.STOP
local MOVE_TO_PATROL    = ObjectState.MOVE_TO_PATROL
local MOVE_TO_KING      = ObjectState.MOVE_TO_KING
local IDLE              = ObjectState.IDLE
local DEATH             = ObjectState.DEATH
local RELEASE_SKILL     = ObjectState.RELEASE_SKILL
local RELIVE            = ObjectState.RELIVE
local BORN              = ObjectState.BORN
local BOSS_REST         = ObjectState.BOSS_REST
local UP_TO_LAND        = ObjectState.UP_TO_LAND
local DOWN_TO_DOWNLAND  = ObjectState.DOWN_TO_DOWNLAND

-- add by Owen, 2016.6.18, 添加一个记录FireBehavior的tick被调用了几次的变量
-- 用来制作5帧才调用一次 SkillFactory.checkTimeTriggerSkill
-- 为了提高帧率
local tickCount         = 0
local tickCountTower    = 0

local FireBehavior = class("FireBehavior", BehaviorBase)

function FireBehavior:ctor()
    FireBehavior.super.ctor(self, "FireBehavior", nil, 1)
end

-- @private
-- 辅助方法：添加 value 到 table 中，并且不会重复添加
-- @param t table
-- @param n #t
-- @param value value
-- @return 新长度
local function table_add(t, n, value)
    if (value == nil) then
        assert(false)
        return
    end
    for i = 1, n do
        -- 重复项
        if (t[i] == value) then
            return n
        end
    end
    t[n + 1] = value
    return n + 1
end

-- @private
-- 辅助方法：从 table 中删除 value
-- @param t table
-- @param n #t
-- @param value value
-- @return 新长度
local function table_remove(t, n, value)
    if (value == nil) then
        assert(false)
        return
    end
    for i = 1, n do
        -- 删除
        if (t[i] == value) then
            table.remove(t, i)
            return n - 1
        end
    end
    return n
end

-- @private
-- 辅助方法：返回 v 位于 t 的索引，如果不存 v 在返回 -1
local function table_indexOf(t, v)
    local n = #t
    for i = 1, n do
        -- 检测到要攻击的对象
        if (t[i] == v) then
            return i
        end
    end
    return -1
end

-- 按距离排序，近的在前
local function distCompare(a, b)
    if (not a) then
        return false
    end
    if (not b) then
        return true
    end
    local distA = math2d.dist(__currentSortObject.x_, __currentSortObject.y_, a.x_, a.y_)
    local distB = math2d.dist(__currentSortObject.x_, __currentSortObject.y_, b.x_, b.y_)
    return distA < distB
end

-- 检查 b 是否还在视野里
local function isLooking(object, target)
    for i = 1, object.numLooks do
        if (object.lookList[i] == target) then
            return true
        end
    end
    return false
end

-- 检查 b 是否还在仇恨列表里
local function isThreatening(object, target)
    for i = 1, object.numThreats do
        if (object.threatList[i] == target) then
            return true
        end
    end
    return false
end

-- 查找目标 (target) 进行攻击
local function find(object)
    -- print(" FireBehavior find ")
 
    -- 1.现有选择，先去掉仇恨选项，
     if (object.target) then
        if object.isHide == true then
            -- 自己隐匿了
            object:noLook(object.target)
            object.target = nil
            return
        elseif (object.target:isDestroyed()) then
            -- 目标已经死了
            object:noLook(object.target)
            object.target = nil
            -- 下一帧再打其他人
            return
        elseif object.target.isHide == true then
            -- 目标已经隐匿
            object:noLook(object.target)
            object.target = nil
            -- 下一帧再打其他人
            return
        else
            -- 检查是否还在视野范围内
            if (object:isLooking(object.target)) then
                -- print("object:isLooking 1.id = "..object.owenId_)
                return object.target
            else
                object.target:nothreaten(object)
            end
        end
    end


    -- 接下去要重新选怪了

    -- 对方仇恨数超出时不选择, 如果对方已经被这么多人在攻击了，那么我就不理他
    local MAX = 10

    -- 2.新选择
    local target

    local isHero = false
    if (isHero) then
        -- print("[find in threatList]")
        -- print("numAttackers = "..object.numAttackers)
    end

    if object.isHide == true then
        -- 自己隐匿了, 不选择新的目标
        return
    end
    
    -- 从仇恨列表中找
    if (object.numThreats > 0) then
        for i = 1, object.numThreats do
            local o = object.threatList[i]
            if (isHero) then
                print(string.format("check {1}, canAttack={2}, isLooking={3}, o.numThreats={4}/{5}",
                    o:getId(), object:canAttack(o), object:isLooking(o), o.numThreats, MAX))
            end
            
            -- 检查条件如下：
            -- 1. a 是否可攻击 target
            -- 2. target 是否在 a 视野中
            -- 3. target 仇恨数没满 或 a 已经在 target 仇恨列表中（相互仇恨）
            -- 4. target 是否隐匿
            if (object:canAttack(o) 
                and object:isLooking(o) 
                and (o.numAttackers < MAX or o:isThreatening(object))) 
                and o.isHide ~= true
                then
                if (iHero) then
                    -- print("found target in threatList")
                end
                target = o
                break
            end
        end
    end

    -- 没有 target：视野范围中找
    if (not target and object.numLooks > 0) then
        -- print("没有 target：到视野范围中找")
        -- 按距离排序
        __currentSortObject = object
        table.sort(object.lookList, distCompare)
        -- 删除中间变量
        __currentSortObject = nil

        for i = 1, object.numLooks do
            local o = object.lookList[i]
            -- canAttack()函数在CampBehavior中
            if (object:canAttack(o) and o.numThreats < MAX and o.isHide ~= true) then
                -- print("没有 target：到视野范围中找, 找到了一个目标")
                target = o
                break
            end
        end
    end

    if object.owenId_ == "Hero" or object.owenId_ == "Enemy" then
        -- print("find() object.owenId_ = "..tostring(object.owenId_)
        --     .." object.target = "..tostring(target))
    end

    object.target = target
    if (target) then
        -- 如果 target 看得到我，就加入仇恨列表
        -- 这里的 isLooking 判断暂时不用，因为引擎不会告知小怪看见了塔
        -- if (target:isLooking(object)) then
            target:threaten(object)
        -- end
        object:threaten(target)
    else
        
    end

        -- print("numLooks", object.numLooks, ", numThreats", object.numThreats)
        -- if (target) then
        --     print(object:getId() .. " found " .. target:getId())
        -- else
        --     print(object:getId() .. " found nil")
        -- end

    return object.target
end

-- 不选择
local function nofind(object)
    print(object:getId() .. "->nofind")
    object.target = nil
end

-- 获取 b 的 ID，如果 b 不存在，返回 "nil"
local function getBId(object)
    if (object.target) then
        return object.target:getId()
    end
    return "nil"
end

-- target进入了视野范围, 用来做英雄和怪物的远程攻击
local function enterVision(object, target)
    -- dump(object, "dump FireBehavior enterVision object")
    -- add by Owen, 2015.10.29, 怪物进入了英雄的视野范围，需要做行走层级的判定
    if object:hasBehavior("HeroBehavior") then
        local bCanAttack = false
        
        -- add by Owen, 2016.6.7, 远程英雄不能攻击 AImode == 5 的逃跑精灵
        if target.AImode_ == MapConstants.MONSTER_AI_MODE_Five then
            return
        end

        for i,v in ipairs(object.enemyType_) do
            if target.walkLayer_ == v then
                bCanAttack = true
                break
            end
        end

        -- 不是英雄可以攻击的层级，那么就不能插入到远程目标列表中
        if not bCanAttack then
            return
        end
    end
    object.numLooks = table_add(object.lookList, object.numLooks, target)
end

-- target离开了视野范围 leaveVision
local function noLook(object, target)
    object.numLooks = table_remove(object.lookList, object.numLooks, target)

    -- 在视野范围中，但是离开了攻击范围，怪物就不动了，
    -- 改为在tick中处理，如果没有bList，那么就把状态设为PATROL
    -- -- TO-DO,临时解决办法，视野范围中没有英雄以后，就把怪物的状态由ATTACK改为PATRAL
    -- if object:hasBehavior("MonsterBehavior") or object:hasBehavior("BossBehavior") then
    --     if object.numLooks == 0 and object.curState == ATTACK then
    --         object:setState(PATROL)
    --     end
    -- end

    -- 同时也不仇恨
    object:nothreaten(target)
end

-- 获取看对象列表 ids
local function getLookIds(object)
    local result = {}
    for i = 1, object.numLooks do
        local o = object.lookList[i]
        result[i] = o:getId()
    end
    return table.concat(result, ",")
end

-- 添加到仇恨列表
local function threaten(this, target)
    this.numThreats = table_add(this.threatList, this.numThreats, target)

    if (not target:hasBehavior("SoldierBehavior")) then
        this.numAttackers = this.numAttackers + 1
    end
end

-- 从仇恨列表删除
local function nothreaten(this, target)
    -- print(this:getId() .. "从仇恨列表删除 nothreaten " .. target:getId())
    this.numThreats = table_remove(this.threatList, this.numThreats, target)

    if (not target:hasBehavior("SoldierBehavior")) then
        this.numAttackers = this.numAttackers - 1
    end
end

-- 获取仇恨列表 ids
local function getThreatIds(this)
    local result = {}
    for i = 1, this.numThreats do
        local o = this.threatList[i]
        result[i] = o:getId()
    end
    return table.concat(result, ",")
end

-- 在MapEventHandler:hit中，如果死亡了就会调用这个函数
-- 死亡后调用
local function onDead(object)
    object:setState(STOP)

    -- 主动提醒 b 不要看自己
    if (object.target) then
        object.target:noLook(object)
    end
    -- 没有 b
    object.target = nil

    -- 清理 bList
    object.bList = nil

    -- 看到的对象列表
    object.lookList = {}

    -- lookList 长度
    object.numLooks = 0

    -- 仇恨列表
    object.threatList = {}

    -- 仇恨数
    object.numThreats = 0

    -- 攻击者数 (也就是 numThreats 不包含塔的部分)
    object.numAttackers = 0

    -- 待释放技能列表
    object.castList = {}

    -- 待释放技能数
    object.numCasts = 0

    -- 当前释放中的技能
    object.currentCasting = nil
end

-- 攻击动作结束以后，要重置攻击CD
local function resetCooldown(object)
    if object.cooldown_ then
        object.fireCooldown_ = object.cooldown_ -- * math.random(80, 120) / 100
        -- print("fire 重置cooldown_ object.cooldown_ = "..tostring(object.cooldown_))
    end
    if object.cooldown1_ then
        object.fireCooldown1_ = object.cooldown1_ -- * math.random(80, 120) / 100
    end
    if object.cooldown2_ then
        object.fireCooldown2_ = object.cooldown2_ -- * math.random(80, 120) / 100
    end
end


-- 远程攻击目标
local  function farAttack(object, heroTarget)
    if (object.state == ATTACK) then
        return
    end
    -- print(" Dragonbones FireBehavior attack 1")
    -- assert(object.target ~= nil, object:getId() .. ".attack 缺少 b")



    -- 清理
    object.lastMoveToX = nil
    object.lastMoveToY = nil


    -- 这里组装一下，变成一个table
    local target = {}
    if object:hasBehavior("MonsterBehavior") then
        -- assert(object.target ~= nil, object:getId() .. "attack.怪物 缺少 b")
        target[1] = object.target
        -- object:changeView("monster/"..object.defineId_.."-2.png")
    elseif object:hasBehavior("HeroBehavior") then
        -- TO-DO 根据英雄能同时攻击几个怪物，来获得视野范围中的怪物
        -- 暂时攻击所有视野范围中的怪物
        -- target = object.lookList

        -- change by Owen, 2015.7.9, 改成只攻击一个怪物
        target[1] = heroTarget -- object.lookList[1]  
        -- object:changeView("hero/"..object.defineId_.."-2.png")
    elseif object:hasBehavior("TowerBehavior") then
        target = heroTarget
    end

    -- 设置是否翻转
    -- print("攻击动作翻转 target[1].x_ = "..target[1].x_.." object.x_ = "..object.x_)
    if object.campId_ == MapConstants.TOWER_CAMP 
        and object.towerType_ == MapConstants.TOWER_TYPE_SPECIAL then
        -- 特殊塔，不能翻转，目前只有熔岩地图中有特殊塔
    else
        if target[1].x_ < object.x_ then
            -- object.flipSprite_ = true
            object:setFlipSprite(true)
        elseif target[1].x_ > object.x_ then
            -- object.flipSprite_ = false
            object:setFlipSprite(false)
        end
    end


    -- 记录是不是播放背面的动作
    if object.campId_ == MapConstants.TOWER_CAMP then
        if target[1].y_ < object.y_ then
            object._isPlayBackAni = false
        elseif target[1].y_ > object.y_ then
            object._isPlayBackAni = true
        end
    end

    local atkAniName = "Attack_Far"
    local idleAniName = "Idle"
    if object.campId_ == MapConstants.TOWER_CAMP then

        -- add by Owen, 2016.5.31, 记录一下塔的 FAR_ATTACK 状态存在了多久
        -- 用来防止塔播放完攻击动作以后，不会调用结束函数回到Idle状态，导致塔一直不会攻击
        object._farAttStateTime = 0

        
        atkAniName = "Attack_Far_01"    -- 正面3点钟的动作
        idleAniName = "Idle_01"

        local bHasBack   = true
        -- 4/5级炮塔是没有背面的，4级炮塔是没有人的
        if (object.towerType_ == MapConstants.TOWER_TYPE_TURRET ) then
            -- if object.level_ >= 4 then
                bHasBack = false
            -- end
        end

        -- print("farAttack bHasBack = "..tostring(bHasBack))
        -- 有背面的塔，才需要3点钟的动作
        if bHasBack then
            if target[1].y_ + target[1].offsetY_ > object.y_ + object.offsetY_ then
                atkAniName = "Attack_Far_02"    -- 被面3点钟的动作
                idleAniName = "Idle_02"
            end
        end

        -- add by Owen, 2016.5.31, 记录一下塔的Idle动画的名字，用来解决塔不攻击的Bug
        object._towerIdleName   = idleAniName
    end

    local eventFunc =  function ()
        -- change by Owen, 2016.5.26, 远程攻击的时候的音效，放到帧事件里面播放
        if object.sound_farAttack_ then
            AudioMgr.playSound(object.sound_farAttack_)
        end

        -- print("远程攻击帧事件触发")
        -- 生成子弹攻击目标
        local bullets = object:fire(target)
        -- dump(bullets, MapEventHandler:fire(object, target))
        for i, bullet in ipairs(bullets) do
            object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
            object.mapRuntime_:addBullet(bullet)
        end
        if object:hasBehavior("HeroBehavior") then
            object:heroAddExp()
        end
    end
    local finishFunc = function ()
        -- add by Owen, 2016.5.31, 记录一下塔的 FAR_ATTACK 状态存在了多久
        -- 用来防止塔播放完攻击动作以后，不会调用结束函数回到Idle状态，导致塔一直不会攻击
        object._farAttStateTime = 0

        object:setState(ObjectState.IDLE)
        object:playAni(idleAniName, true)
        resetCooldown(object)
    end

    -- 设置为攻击状态
    object:setState(FAR_ATTACK)

    if string.find(object.imageName_, "png") then
        eventFunc()
        finishFunc()
    else
        object:playAni(atkAniName, false, false, eventFunc, finishFunc)
    end


    -- print(this:getId() .. " attack " .. (b and b:getId() or "nil"))

    -- 这些情况要停止移动
    -- if (object.state == TRACK or object.state == MOVE) then
        -- 把状态改为ATTACK以后，怪物就不会移动了
        -- object:unbindPath()
        -- 设置为攻击状态
        -- object:setState(FAR_ATTACK)
    -- end


end

-- 攻击目标,在find函数中会找到一个目标target，也就是object.target
-- 然后调用这个函数来攻击它
local function attack(object)
    -- print("FireBehavior attack,目标是object.target object.owenId_ = "..tostring(object.owenId_))
        -- 已在攻击状态
    -- if (object.state == ATTACK) then
    --     return
    -- end
    -- print(" Dragonbones FireBehavior attack 1")
    assert(object.target ~= nil, object:getId() .. ".attack 缺少 b")

    -- add by Owen, 2016.4.23, 近战攻击的时候，需要播放音效
    if object.sound_attack_ then
        AudioMgr.playSound(object.sound_attack_)
    end

    -- 清理
    object.lastMoveToX = nil
    object.lastMoveToY = nil

    -- 切换近战图片
    if object:hasBehavior("MonsterBehavior") then
        -- object:changeView("monster/"..object.defineId_.."-1.png")
    elseif object:hasBehavior("HeroBehavior") then
        -- object:changeView("hero/"..object.defineId_.."-1.png")
    end
    
    
    local target = object.target
    -- print(this:getId() .. " attack " .. (b and b:getId() or "nil"))

    -- 这些情况要停止移动
    -- if (object.state == TRACK or object.state == MOVE) then
    --     object:unbindPath()
    -- end

    -- 这里组装一下，变成一个table
    local target = {}
    if object:hasBehavior("MonsterBehavior") then
        assert(object.target ~= nil, object:getId() .. "attack.怪物 缺少 b")
        target[1] = object.target
    elseif object:hasBehavior("HeroBehavior") then
        -- TO-DO 根据英雄能同时攻击几个怪物，来获得近战范围中的怪物
        -- 暂时攻击所有视野范围中的怪物
        -- target[1] = object.bList[1]

        -- change by Owen, 2015.7.9, 在tick中已经赋值了配对的对象，这边不做修改
        target[1] = object.target
    end

    local eventFunc =  function ()
        -- print("帧事件触发")
        if object:hasBehavior("HeroBehavior") then
            -- print("帧事件触发")
            -- 英雄每次攻击要增加经验
            object:heroAddExp()
        end



        -- 生成子弹攻击目标
        local bullets = object:fire(target, true)
        -- dump(bullets, MapEventHandler:fire(object, target))
        for i, bullet in ipairs(bullets) do
            if bullet:getView() then
                object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
            end
            object.mapRuntime_:addBullet(bullet)
        end
    end
    local finishFunc = function ()
        object:setState(ObjectState.IDLE)
        object:playAni("Idle", true)
        resetCooldown(object)
    end

    -- 设置是否翻转
    if object:hasBehavior("HeroBehavior") or object:hasBehavior("MonsterBehavior") then
        -- print("近战攻击动作翻转 target[1].x_ = "..target[1].x_.." object.x_ = "..object.x_)
        if target[1].x_ < object.x_ then
            -- object.flipSprite_ = true
            object:setFlipSprite(true)
        elseif target[1].x_ > object.x_ then
            -- object.flipSprite_ = false
            object:setFlipSprite(false)
        end
    end

    -- 设置为攻击状态
    object:setState(ObjectState.ATTACK)

    if string.find(object.imageName_, "png") then
        -- print("eventFunc()")
        eventFunc()
        finishFunc()
    else
        object:playAni("Attack_01", false, false, eventFunc, finishFunc)
    end






end

-- object自动释放一个自己的技能
local function selectNextSkill(object)
    -- body
end

-- 设置为 idle 状态
local function idle(object)
    -- log("{1}.idle", this:getId())
    object:setState(IDLE)
    -- this:playIdle()
end

function FireBehavior:bind(object)
    object.fireLock_ = 0

    local function getFireRange(object)
        return object.fireRange_
    end
    object:bindMethod(self, "getFireRange", getFireRange)

    local function getCooldown(object)
        return object.cooldown_
    end
    object:bindMethod(self, "getCooldown", getFireRange)

    local function addFireLock(object)
        object.fireLock_ = object.fireLock_ + 1
    end
    object:bindMethod(self, "addFireLock", addFireLock)

    local function removeFireLock(object)
        object.fireLock_ = object.fireLock_ - 1
        assert(object.collisionLock_ >= 0,
               "FireBehavior.removeFireLock() - object.fireLock_ must >= 0")
    end
    object:bindMethod(self, "removeFireLock", removeFireLock)

    local function getFireEnabled(object)
        return object.fireEnabled_
    end
    object:bindMethod(self, "getFireEnabled", getFireEnabled)

    local function setFireEnabled(object, enabled)
        object.fireEnabled_ = enabled
    end
    object:bindMethod(self, "setFireEnabled", setFireEnabled)

    -- isNearAttack 表示是不是近战攻击
    local function fire(object, target, isNearAttack)
        if not object.fireEnabled_ then
            echoError("FireBehavior.fire() - fire disabled")
            return
        end

        -- print("fire object.fireCooldown_ = "..tostring(object.fireCooldown_))

        -- if object.fireCooldown_ > 0 then
        --     -- echoError("FireBehavior.fire() - cooldown must equal zero")
        --     -- print("Error FireBehavior.fire() - cooldown must equal zero")
        --     return
        -- end

        -- if object:hasBehavior("DecorateBehavior") then
        --     local decorationName = object:getDefineId() .. "Fire"
        --     if object:isDecorationExists(decorationName) then
        --         local decoration = object:getDecoration(decorationName)
        --         local autoHide = decoration.visible_ == false
        --         if autoHide then decoration:setVisible(true) end
        --         decoration:playAnimationOnce(function()
        --             if autoHide then decoration:setVisible(false) end
        --             decoration:setDisplayFrameIndex(1)
        --         end)
        --     end

        --     local decorationName = object:getDefineId() .. "Fire2"
        --     if object:isDecorationExists(decorationName) then
        --         local decoration = object:getDecoration(decorationName)
        --         local autoHide = decoration.visible_ == false
        --         if autoHide then decoration:setVisible(true) end
        --         decoration:playAnimationOnce(function()
        --             if autoHide then decoration:setVisible(false) end
        --             decoration:setDisplayFrameIndex(1)
        --         end)
        --     end
        -- end

        -- if object.cooldown_ then
        --     object.fireCooldown_ = object.cooldown_ -- * math.random(80, 120) / 100
        --     -- print("fire 重置cooldown_ object.cooldown_ = "..tostring(object.cooldown_))
        -- end
        -- if object.cooldown1_ then
        --     object.fireCooldown1_ = object.cooldown1_ -- * math.random(80, 120) / 100
        -- end
        -- if object.cooldown2_ then
        --     object.fireCooldown2_ = object.cooldown2_ -- * math.random(80, 120) / 100
        -- end
        local delay = nil
        if object:hasBehavior("NPCBehavior") or object:hasBehavior("PlayerBehavior") then
            delay = 0
        end
        -- return BulletFactory.newBullets(object.bulletType_, object, target, delay)
        -- 多重攻击
        -- 如果target有多个，那么就同时生成多个子弹
        -- change by Owen, 改成一个table的遍历
        local bullets = {}
        -- 根据可以攻击几个，来生成对应的子弹
        local tarNum = #target
        -- print("tarNum = "..tostring(tarNum))

        -- 读取武器配置中的子弹个数
        if object.atkNumber_ then
            -- print("object.atkNumber = "..tostring(object.atkNumber_))
            tarNum = object.atkNumber_
        end

        
        if object:hasBehavior("TowerBehavior") then
            for i,v in ipairs(target) do
                local bulletConfig = BulletProperties.get(object.bulletType_)
                -- print("bulletConfig.bulletType = "..tostring(bulletConfig.bulletType))
                local bullet = BulletFactory.newBullets(bulletConfig.bulletType, 
                    object, v, delay, bulletConfig, object.trajectory_)
                table.insert(bullets, bullet)
            end

            -- -- 如果是塔的话，需要根据优先目标来做一次筛选
            -- tarNum = object.atkNumber_
            -- local priority = object.atkPriority_
            -- local atkNum = 0
            -- for i,v in ipairs (priority) do
            --     if atkNum > tarNum then
            --         break
            --     end
            --     for i2,v2 in ipairs(target) do
            --         -- print("v2.AImode_  = "..tostring(v2.AImode_ ))
            --         if v2.AImode_ == v and atkNum < tarNum then
            --             local bulletConfig = BulletProperties.get(object.bulletType_)
            --             -- print("bulletConfig.bulletType = "..tostring(bulletConfig.bulletType))
            --             local bullet = BulletFactory.newBullets(bulletConfig.bulletType, 
            --                 object, v2, delay, bulletConfig, object.trajectory_)
            --             table.insert(bullets, bullet)
                        
            --             atkNum = atkNum + 1
            --         end
            --     end
            -- end
        else
            -- 英雄和怪物，直接攻击就好了
            for i,v in ipairs(target) do
                -- 配了可以同时攻击几个
                if i <= tarNum and isNearAttack == nil then
                    local bulletConfig = BulletProperties.get(object.bulletType_)
                    -- print("object.id_ = "..tostring(object.id_))
                    local bullet = BulletFactory.newBullets(bulletConfig.bulletType, 
                        object, v, delay, bulletConfig, object.trajectory_)
                    table.insert(bullets, bullet)
                    
                elseif isNearAttack then
                    -- 近战的话，不生成子弹，直接对目标产生伤害

                    -- local isHit, att = BulletBase.damage(object, v)
                    
                    -- print("近战攻击，id = "..object.mainID_.." isHit = "..tostring(isHit).." att = "..tostring(att))
                    -- object.mapRuntime_.handler_:hit(object, v, att)
                    
                    -- change by Owen, 2015.7.27, 修改为使用近战子弹来处理，不能直接调用伤害
                    local bulletConfig = BulletProperties.get(StableGameProperties.NEAR_ATTACK_BULLET)
                    local bullet = BulletFactory.newBullets(BulletType.DIRECT, 
                        object, v, 0, bulletConfig, object.trajectory_)
                    table.insert(bullets, bullet)
                end
            end
        end
        return bullets
        
    end
    object:bindMethod(self, "fire", fire)

    local function tick(object, dt)
        -- print(" FireBehavior tick ")
        -- if object.owenId_ == "Hero" then
        --     -- print("tick 1 object.owenId_ = "..tostring(object.owenId_).." object.target = "
        --         ..tostring(target).." state = "..tostring(object.curState))
        -- end
        -- chang by Owen, 2015.8.26, 在播放攻击动画和技能动画的时候不需要tick fireBehavior
        local curState = object.curState

        -- add by Owen, 2016.5.31, 记录一下塔的 FAR_ATTACK 状态存在了多久
        -- 用来防止塔播放完攻击动作以后，不会调用结束函数回到Idle状态，导致塔一直不会攻击
        if object.campId_ == MapConstants.TOWER_CAMP and curState == FAR_ATTACK then
            object._farAttStateTime = object._farAttStateTime + dt
            if object._farAttStateTime >= object.cooldown_/1000 then
                -- print("出现了塔不攻击的Bug, 触发了保护机制")
                object._farAttStateTime = 0

                object:setState(ObjectState.IDLE)
                object:playAni(object._towerIdleName, true)
                resetCooldown(object)
            end
        end

        -- print("fireBehavior object.curState = "..tostring(object.curState))
        if object:hasBehavior("MonsterBehavior") or object:hasBehavior("HeroBehavior")
            or object.campId_ == MapConstants.TOWER_CAMP then
            if curState == ATTACK or curState == FAR_ATTACK
                or curState == RELEASE_SKILL or curState == BORN 
                or object._needRest   -- 如果Boss需要休息了，就不进行下面的操作
                or curState == BOSS_REST    -- Boss正在休息，不能进行下面的操作
                or curState == DOWN_TO_DOWNLAND
                or curState == UP_TO_LAND
                or object._isImpact
                then
                return
            end
        end

        if object:hasBehavior("MonsterBehavior") then
            tickCount = tickCount + 1
            if object._isComa then
                -- 如果被晕眩了，则什么也不处理
            else 
                -- add by Owen, 2016.6.18, 每5帧的时候才执行一个怪物的CD技能判定，为了提高帧率
                -- 怪物是否要进行正常的tick函数
                local needNormalTick = true
                if tickCount >= 5 then
                    if SkillFactory.checkTimeTriggerSkill(object, dt) == true then
                        -- 释放由CD触发的技能, 在checkTimeTriggerSkill()函数中已处理
                        needNormalTick = false
                        tickCount = 0
                    end
                end
                -- 怪物没有释放技能，才需要进行正常的tick函数
                if needNormalTick then

                    if BattleDataManager:isMonsterInHeroTarget(object.id_) then
                        if object.bList ~= nil then
                            if object.fireCooldown1_ <= 0 then
                                -- 这里不需要做CD的判定，因为有bList就表示肯定CD到了
                                -- print("怪物开始近战攻击")

                                -- 判定怪物的套路
                                if object:getAttackMode() == true then
                                    object.target = object.bList[1]
                                    object:attack()
                                end
                            end
                            -- print("monster.fireCooldown1_ = "..tostring(object.fireCooldown1_))
                        else
                            -- 把状态置为IDLE，这样怪物就不会移动了
                            -- 怪物是英雄的攻击对象，但是英雄未进入怪物的攻击范围，或者怪物的攻击CD没到
                            -- 都会走入这个分支，因为在C的碰撞检测腮红，如果CD没到，bList就为nil
                            -- print("怪物进入了英雄的拔刀范围，停在这里等英雄")
                            -- 防止多次调用导致怪物停在那里不动
                            if curState ~= ObjectState.IDLE then
                                object:setState(IDLE)
                                object:playAni("Idle", true)
                            end
                        end
                    else
                        -- if object.AImode_ == MapConstants.MONSTER_AI_MODE_ONE then

                        if object.AImode_ == MapConstants.MONSTER_AI_MODE_TWO
                            or object.AImode_ == MapConstants.MONSTER_AI_MODE_THREE then
                            -- 在视野范围(远程攻击范围)内寻找下一个目标
                            object:find()
                            -- 英雄在我的远程攻击范围内
                            if object.target then
                                
                                if object.fireCooldown2_ <= 0 then
                                    -- 如果到了开火时间就开始攻击
                                    -- print("怪物开始远程攻击")
                                    -- 判定怪物的套路
                                    if object:getAttackMode() == true then
                                        object:farAttack()
                                    end
                                elseif object.AImode_ == MapConstants.MONSTER_AI_MODE_TWO then
                                    -- print("远1怪就停在原地等待下一个开火时间")
                                elseif object.AImode_ == MapConstants.MONSTER_AI_MODE_THREE then
                                    -- print("远2怪沿着路径接着往前走")
                                    if curState ~= MOVE
                                        and curState ~= DEATH
                                        and curState ~= ATTACK
                                        and curState ~= FAR_ATTACK
                                        and curState ~= RELEASE_SKILL then
                                        -- 攻击完了以后要先判定是否需要翻转回来
                                        object:checkFlip()
                                        object:setState(MOVE)
                                        object:playAni("Move_Side", true)
                                    end
                                    -- 切换移动图片
                                    -- object:changeView("monster/"..object.defineId_.."-3.png")
                                end
                            else
                                -- print("怪物视野范围内没有敌方单位，接着沿路径走")
                                if curState ~= MOVE
                                    and curState ~= DEATH
                                    and curState ~= ATTACK
                                    and curState ~= FAR_ATTACK
                                    and curState ~= RELEASE_SKILL then
                                    -- 攻击完了以后要先判定是否需要翻转回来
                                    object:checkFlip()
                                    object:setState(MOVE)
                                    object:playAni("Move_Side", true)
                                end

                                -- 切换移动图片
                                -- object:changeView("monster/"..object.defineId_.."-3.png")
                            end
                        elseif object.AImode_ == MapConstants.MONSTER_AI_MODE_FOUR then
                            -- 近战怪
                            -- print("近战怪不在英雄的配对列表中，接着沿路径走")
                            if curState ~= MOVE
                                and curState ~= DEATH
                                and curState ~= ATTACK
                                and curState ~= FAR_ATTACK
                                and curState ~= RELEASE_SKILL then
                                -- 攻击完了以后要先判定是否需要翻转回来
                                object:checkFlip()
                                object:setState(MOVE)
                                object:playAni("Move_Side", true)
                            end
                            -- 切换移动图片
                            -- object:changeView("monster/"..object.defineId_.."-3.png")
                        end
                    end
                end
            end

        elseif object:hasBehavior("HeroBehavior") and curState ~= MOVE and curState ~= RELIVE 
            and curState ~= RELEASE_SKILL then
            if object.isDead_ == true or object._isComa then
                -- 英雄死亡了，或者昏迷了，不能攻击
            elseif SkillFactory.checkTimeTriggerSkill(object, dt) == true then
                -- 释放由CD触发的技能, 在checkTimeTriggerSkill()函数中已处理
            else
                -- 如果英雄配对了一个怪物
                if BattleDataManager:isHeroHasTarget(object.id_) then
                    -- change by Owen, 2016.3.17, 英雄配对了怪物，要移动到怪物的左右以后，
                    -- 再开始攻击，防止上下攻击
                    if curState == TRACK then
                        -- 防止怪物远程射击的子弹getFuturePosition后，射到英雄的前面去了 
                        return
                    elseif curState == IDLE then
                        object:unbindPath()
                    end

                    if object.bList ~= nil then
                        if object.fireCooldown1_ <= 0 then
                        -- 这里不需要做CD的判定，因为有bList就表示肯定CD到了
                            -- print("英雄近战攻击怪物")
                            object.target = object.bList[1]
                            if (curState == TRACK or curState == MOVE) then
                                -- 防止怪物远程射击的子弹getFuturePosition后，射到英雄的前面去了
                                object:unbindPath()
                            end
                            -- print("object.mainID = "..tostring(object.mainID_))

                            -- 英雄当前攻击套路中配的是普攻, 
                            -- 里面会判定如果是士兵则始终返回true，并处理士兵的攻击触发技能
                            if object:getAttackMode() == true then
                                -- 清零舞蹈倒计时
                                object.danceTime_ = 0
                                -- 记录目前是战斗状态
                                object.isOutFight_     = false
                                object.restorHPTime_ = 0
                                -- attack()函数中会把状态改为ATTACK
                                object:attack()
                            end
                        else
--                           -- print("英雄近战范围内有怪物，但CD没到，停止英雄的移动")
                            if (curState == TRACK or curState == MOVE) then
                                object:unbindPath()
                                object:setState(ObjectState.IDLE)
                                object:playAni("Idle", true)
                            end
                        end
                    else
                        -- 调用的是MoveableBehavior中的track()函数
                        if curState ~= TRACK then -- ATTACK then
                            -- print("英雄向一个怪物靠近")
                            -- 清零舞蹈倒计时
                            object.danceTime_ = 0
                            -- 记录目前是战斗状态
                            object.isOutFight_     = false
                            object.restorHPTime_ = 0

                            object.target = object.map_:getObject(
                                BattleDataManager:getHeroWillAttackTarget(object.id_).id_)
                            object:setState(ObjectState.TRACK)
                            object:track()
                            -- 切换移动图片
                            -- object:changeView("hero/"..object.mainID_.."-3.png")
                            object:playAni("Move_Side", true)
                        end
                    end
                else
                    if BattleDataManager:isHeroHasNearAttTarget(object.id_) then
                        -- change by Owen, 2016.3.17, 英雄配对了怪物，要移动到怪物的左右以后，
                        -- 再开始攻击，防止上下攻击
                        if curState == TRACK then
                            -- 防止怪物远程射击的子弹getFuturePosition后，射到英雄的前面去了 
                            return
                        elseif curState == IDLE then
                            object:unbindPath()
                        end
                    
                        -- 配了近战攻击的怪物
                        -- 那么就走过去A他
                        if object.bList ~= nil then
                            if object.fireCooldown1_ <= 0 then
                                -- 这里不需要做CD的判定，因为有bList就表示肯定CD到了
                                -- print("222 英雄近战攻击怪物")
                                object.target = object.bList[1]
                                -- for i,v in ipairs(object.patrolList) do
                                --     -- print("拔刀范围内的怪物有： i = "..tostring(i).." id = "..tostring(v.id_))
                                -- end
                                if (curState == TRACK or curState == MOVE) then
                                    -- 防止怪物远程射击的子弹getFuturePosition后，射到英雄的前面去了 
                                    object:unbindPath()
                                end
                                
                                -- 英雄当前攻击套路中配的是普攻, 
                                -- 里面会判定如果是士兵则始终返回true，并处理士兵的攻击触发技能
                                if object:getAttackMode() == true then
                                    -- 清零舞蹈倒计时
                                    object.danceTime_ = 0
                                    -- 记录目前是战斗状态
                                    object.isOutFight_     = false
                                    object.restorHPTime_ = 0
                                    -- attack()函数中会把状态改为ATTACK
                                    object:attack()
                                end
                            else
                                -- print("222 英雄近战范围内有怪物，但CD没到，停止英雄的移动")
                                if (curState == TRACK or curState == MOVE) then
                                    object:unbindPath()
                                    object:setState(ObjectState.IDLE)
                                    object:playAni("Idle", true)
                                end
                            end
                        elseif curState ~= TRACK then -- ATTACK then
                            -- print("222 英雄向一个怪物靠近 object._isSoldier = "..tostring(object._isSoldier))
                            -- 清零舞蹈倒计时
                            object.danceTime_ = 0
                            -- 记录目前是战斗状态
                            object.isOutFight_     = false
                            object.restorHPTime_ = 0

                            object.target = object.map_:getObject(
                                BattleDataManager:getHeroNearAttTarget(object.id_).id_)
                            object:setState(ObjectState.TRACK)
                            object:track()
                            -- 切换移动图片
                            object:playAni("Move_Side", true)
                        end

                    elseif #object.lookList > 0 and object.fireVision_ ~= 80 then
                        -- 在视野范围(射击攻击范围)内有目标, 并且自己是远程英雄    
                        if object.fireCooldown2_ <= 0 then
                            -- 如果到了开火时间就开始攻击
                            -- print("英雄开始远程攻击")

                            -- 英雄射击的目标
                            local target  = nil
                            local AIOne   = nil    -- 记录一下里面是不是有逃跑的怪物
                            local firstIn = nil    -- 记录一下第一个进入射程的怪物
                            for i,v in ipairs(object.enemyType_) do
                                -- add by Owen, 2016.6.7, 英雄远程攻击，要优先攻击逃跑怪物

                                for i2, v2 in ipairs(object.lookList) do
                                    -- change by Owen, 2015.12.4, 添加是否隐藏的判定，
                                    -- 防止攻击跳跃后还未现身的怪物
                                    -- print("v2.AImode_ = "..tostring(v2.AImode_))

                                    if v2.walkLayer_ == v and not v2.isHide then
                                        -- print("v2.isHide = "..tostring(v2.isHide).." v2.id_ = "..v2.id_)
                                        -- target = v2
                                        -- break

                                        -- 如果没有记录过第一个进入射程的怪物，则记录一下
                                        if not firstIn then
                                            firstIn = v2
                                        end
                                        -- 如果没有记录过第一个进入射程的逃跑怪物，则记录一下
                                        
                                        if not AIOne and v2.AImode_ == MapConstants.MONSTER_AI_MODE_ONE then
                                            -- print("如果没有记录过第一个进入射程的逃跑怪物，则记录一下")
                                            AIOne = v2
                                        end
                                    end
                                end
                                -- 把攻击目标置为第一个进入视野的怪物
                                if firstIn then
                                    target = firstIn
                                end
                                -- 把攻击目标置为第一个进入视野的逃跑怪物
                                if AIOne then
                                    target = AIOne
                                end
                                if AIOne ~= nil then
                                    break
                                end
                            end
                            if target then 
                                -- 英雄当前攻击套路中配的是普攻, 
                                -- 里面会判定如果是士兵则始终返回true，并处理士兵的攻击触发技能
                                if object:getAttackMode() == true then
                                    -- 清零舞蹈倒计时
                                    object.danceTime_ = 0
                                    -- 记录目前是战斗状态
                                    object.isOutFight_     = false
                                    object.restorHPTime_ = 0
                                    object:farAttack(target)
                                end
                            end
                        else
                            -- print("英雄视野范围内有怪物，但开火时间没到，在原地不动")
                        end

                    else
                        -- print("英雄视野范围内没有敌方单位不做任何处理")
                        -- 切换移动图片
                        -- object:changeView("hero/"..object.mainID_.."-3.png")
                    end
                    
                end
            end
        elseif object:hasBehavior("TowerBehavior") then


            tickCountTower = tickCountTower + 1

            -- add by Owen, 2016.6.18, 每5帧的时候才执行一个塔的CD技能判定，为了提高帧率
            -- 怪物是否要进行正常的tick函数
            local needNormalTick = true
            if tickCountTower >= 5 then
                if SkillFactory.checkTimeTriggerSkill(object, dt) == true then
                    -- 释放由CD触发的技能, 在checkTimeTriggerSkill()函数中已处理
                    needNormalTick = false
                    tickCountTower = 0
                end
            end

            -- -- 更新可攻击列表, MapEventHandler:fire()中处理
            -- BattleDataManager:updateCanAttackList(object, object.bList, true)
            -- print("tower fireCooldown_ = "..tostring(object.fireCooldown_))
            -- add by Owen, 2015.8.10, 增加塔的时间触发的技能
            -- if SkillFactory.checkTimeTriggerSkill(object, dt) == true then
            --     -- 释放由CD触发的技能, 在checkTimeTriggerSkill()函数中已处理
            -- elseif object.fireCooldown_ <= 0  then

            -- change by Owen, 2016.6.30, 塔没有释放技能，且攻击CD到了之后，才需要跑下面的逻辑
            if needNormalTick and object.fireCooldown_ <= 0  then

                if string.sub(object.mainID_, 1, 4) == "1604" then
                    -- 祭坛塔不能攻击，直接 return 掉
                    -- print("string.sub(object.mainID_, 1, 4) == 1604 return")
                    return
                end

                -- 取得的targets已经经过一次筛选了，都是自己可以攻击的目标，只是需要再做一次优先级判定
                local targets = BattleDataManager:getCanAttackList(object)

                -- change by Owen, 2016.2.16, 只有4级箭塔才需要筛选目标，其他的已经在C++里面筛选过了
                -- 根据塔的优先级来重新获得塔应该攻击的目标
                local finalTargets = targets
                if object.mainID_ == "160104" then
                    finalTargets = object:checkAttackTargets(targets)
                end
                if finalTargets and #finalTargets > 0 then
                    -- 给塔赋值bList，用来在触发技能，判定技能目标的时候用到
                    object.bList = finalTargets
                    -- 判定普攻是否触发了技能
                    local hasReleaseSkill = false
                    if object.attackTriggerSkill and #object.attackTriggerSkill > 0 then
                        hasReleaseSkill = SkillFactory.checkAttackTriggerSkill(object, finalTargets[1])
                    end
                    object.bList = nil    -- 塔技能用完以后，就把bList置为nil
                    -- 如果普攻没有触发技能，那么塔才可以普通攻击
                    if not hasReleaseSkill then
                        -- change by Owen, 2015.12.31, 塔攻击的时候也需要播放攻击动画
                        object:farAttack(finalTargets)

                        -- local bullets = object:fire(finalTargets)
                        -- -- dump(bullets, MapEventHandler:fire(object, target))
                        -- for i, bullet in ipairs(bullets) do
                        --     object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
                        --     object.mapRuntime_:addBullet(bullet)
                        -- end
                    else
                        -- print("塔普攻触发了技能")
                    end
                end

                -- if targets and #targets > 0 then
                --     -- print("#targets = "..tostring(#targets))
                --     for i = #targets, 1, -1 do
                --         -- print("targets[i].isHide = "..tostring(targets[i].isHide))
                --         if targets[i].isHide == true then
                --             -- print("targets[i].isHide == true")
                --             table.remove(targets, i)
                --         end
                --     end
                --     if targets and #targets > 0 then

                --         -- 塔 需要根据优先目标来做一次筛选
                --         local tarNum = object.atkNumber_
                --         local finalTargets = {}    -- 根据优先级以及可以攻击的个数来获得最终目标

                --         local priority = object.atkPriority_
                --         local atkNum = 0
                --         for i,v in ipairs (priority) do
                --             if atkNum > tarNum then
                --                 break
                --             end
                --             for i2,v2 in ipairs(targets) do
                --                 -- print("v2.AImode_  = "..tostring(v2.AImode_ ))
                --                 if v2.AImode_ == v and atkNum < tarNum then
                --                     finalTargets[#finalTargets + 1] = v2
                --                     atkNum = atkNum + 1
                --                 end
                --             end
                --         end

                --         if #finalTargets > 0 then
                --             -- 给塔赋值bList，用来在触发技能，判定技能目标的时候用到
                --             object.bList = finalTargets
                --             -- 判定普攻是否触发了技能
                --             local hasReleaseSkill = false
                --             if object.attackTriggerSkill and #object.attackTriggerSkill > 0 then
                --                 hasReleaseSkill = SkillFactory.checkAttackTriggerSkill(object, finalTargets[1])
                --             end
                --             object.bList = nil    -- 塔技能用完以后，就把bList置为nil
                --             -- 如果普攻没有触发技能，那么塔才可以普通攻击
                --             if not hasReleaseSkill then
                --                 local bullets = object:fire(finalTargets)
                --                 -- dump(bullets, MapEventHandler:fire(object, target))
                --                 for i, bullet in ipairs(bullets) do
                --                     object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
                --                     object.mapRuntime_:addBullet(bullet)
                --                 end
                --             else
                --                 -- print("塔普攻触发了技能")
                --             end
                --         end
                --     end
                -- end
            end
        end


        -- -- 原来在noLook函数中处理，在视野范围中，但是离开了攻击范围，怪物就不动了，
        -- -- 改为在tick中处理，如果没有bList，那么就把状态设为PATROL
        -- -- -- TO-DO,临时解决办法，视野范围中没有英雄以后，就把怪物的状态由ATTACK改为PATRAL
        -- if object:hasBehavior("MonsterBehavior") or object:hasBehavior("BossBehavior") then
        --     if object.bList == nil and object.curState ~= MOVE_TO_KING then
        --         object:setState(PATROL)
        --     end
        -- end

        -- 这些状态下将选择目标，然后自动跟踪
        -- if (object.curState == PATROL
        --  or object.curState == TRACK
        --  or object.curState == MOVE_TO_KING
        --  or object.curState == MOVE_TO_HOME
        --  or object.curState == IDLE) then
        -- if true then

        --     -- print("tick 2 object.curState = "..tostring(object.curState).." object.owenId_ = "
        --     --             ..tostring(object.owenId_).." target = "..tostring(object.target))

        --     -- 在视野范围(远程攻击范围)内寻找下一个目标
        --     object:find()
        --                 -- 找到了 b：检查是否可以攻击
        --     if (object.target) then
        --         if object:hasBehavior("MonsterBehavior") then
        --             -- print("这个怪物有target")
        --             if object.bList then
        --                 -- print("这个怪物有bList")
        --             end
        --         end
        --         -- print("object:find() 有一个目标进入了我的视野")
        --         -- 放下国王
        --         if (object.king) then
        --             object:catchKing(nil)
        --         end
        --         -- b 在 bList 中
        --         -- object.bList 是碰撞引擎传进来的，如果为空也是不可以攻击的
        --         -- print("tick 3 object.bList = "..tostring(object.bList))
        --         if object.bList ~= nil then
        --             -- print("tick 4 object.bList = "..tostring(object.bList).." object.owenId_ = "
        --             --     ..tostring(object.owenId_).." target = "..tostring(object.target))
        --         end
        --         if (object.bList and table_indexOf(object.bList, object.target) >= 1
        --             and object:hasBehavior("MonsterBehavior")) then

                    

        --             -- 是否自动释放技能
        --             if (object.isAutoCast) then
        --                 selectNextSkill(object)
        --             end

        --             -- 如果前面一步没有选择到技能就普攻
        --             if (object.numCasts == 0) then
        --                 -- object:attack()
        --                 -- 测试移动
        --                 object:setState(MOVE_TO_HOME)
        --                 self.hahaOwen = 1
        --                 -- print("在我的近战范围内，我要开始近战攻击了 id = "..object.owenId_)
        --             else
        --                 return
        --             end


        --         elseif (object.isAutoTrack) then
        --             -- b 不在 bList 中，跟踪过去
        --             -- 可以跟踪的话就跟踪
        --             -- print("object:find() 准备自动跟踪")
        --             -- 调用的是MoveableBehavior中的track()函数
        --             object:track()
        --         else
                    
        --             -- 怪物，且AI类型为1，主动进攻型，那么就停下来A英雄
        --             if object:hasBehavior("MonsterBehavior") and object.AImode_ == 1
        --                 and self.hahaOwen == nil then
        --                 object:setState(ATTACK)  -- 把状态设为攻击，这样就不会移动了
        --                 object:farAttack()       -- 调用远程攻击函数
        --                 -- print("在我的远程攻击范围内，我要开始远程攻击了 id = "..object.owenId_)
        --             end
        --         end
        --     else
        --         -- 可以抓国王
        --         local canCatchKing = object:hasBehavior("MonsterBehavior") or object:hasBehavior("BossBehavior")
        --         -- local king = this.map_.king_
        --         if (canCatchKing) then -- and king) then
        --             -- -- 国王被抓，回家
        --             -- if (state ~= MOVE_TO_HOME and king:isCatched()) then
        --             --     this:moveToHome()
        --             -- elseif (state ~= MOVE_TO_KING and not king:isCatched()) then
        --             --     this:moveToKing()
        --             -- end
        --             -- print("canCatchKing and object.lastState == ATTACK")
        --             -- 怪物出生的时候，状态时MOVE_TO_KING
        --             if (object.curState ~= MOVE_TO_KING) then
        --                 -- 怪物的话就走到配置文件中设置的Path的终点去
        --                 -- local pathId = string.format("path:%d", object.pathId)
        --                 local path = object.map_:getObject(object.pathId) -- pathId)
        --                 local count = path:getPointsCount()
        --                 local endPointX, endPointY = path:getPoint(count)
        --                 object:moveTo(endPointX, endPointY, MOVE_TO_KING)
        --             end


        --         -- 不是跟随者的 AI
        --         elseif (object.lastState == ATTACK) then
        --             -- 塔和英雄播放 idle
        --             object:idle()
        --         end
        --     end
        -- end

        -- 跑攻击的冷却时间
        -- local fireCooldown = object.fireCooldown_
        --     if fireCooldown and fireCooldown > 0 then
        --         -- change by Owen, 2015.5.11, 把dt的单位由秒改为毫秒，因为配置文件中都是毫秒
        --         fireCooldown = fireCooldown - dt*1000
        --         if fireCooldown <= 0 then fireCooldown = 0 end
        --         object.fireCooldown_ = fireCooldown
        --     end
        -- end
        local function coolDownFunc(cooldown_, dt)
            local fireCooldown = cooldown_
            if fireCooldown and fireCooldown > 0 then
                -- change by Owen, 2015.5.11, 把dt的单位由秒改为毫秒，因为配置文件中都是毫秒
                fireCooldown = fireCooldown - dt*1000
                if fireCooldown <= 0 then fireCooldown = 0 end
                return fireCooldown
            end
            return 0
        end
        object.fireCooldown_ = coolDownFunc(object.fireCooldown_, dt)
        object.fireCooldown1_ = coolDownFunc(object.fireCooldown1_, dt)
        object.fireCooldown2_ = coolDownFunc(object.fireCooldown2_, dt)
    end
    object:bindMethod(self, "tick", tick)


    object:bindMethod(self, "find", find)
    object:bindMethod(self, "nofind", nofind)
    object:bindMethod(self, "getBId", getBId)
    object:bindMethod(self, "enterVision", enterVision)
    object:bindMethod(self, "noLook", noLook)
    object:bindMethod(self, "getLookIds", getLookIds)
    object:bindMethod(self, "onDead", onDead)
    object:bindMethod(self, "threaten", threaten)
    object:bindMethod(self, "nothreaten", nothreaten)
    object:bindMethod(self, "getThreatIds", getThreatIds)
    object:bindMethod(self, "isLooking", isLooking)
    object:bindMethod(self, "isThreatening", isThreatening)
    object:bindMethod(self, "attack", attack)
    object:bindMethod(self, "selectNextSkill", selectNextSkill)
    object:bindMethod(self, "idle", idle)
    object:bindMethod(self, "farAttack", farAttack)


    self:reset(object)
end

function FireBehavior:unbind(object)
    object.fireOffsetX_   = nil
    object.fireOffsetY_   = nil
    object.fireOffsetX_L_ = nil
    object.fireOffsetY_L_ = nil
    object.fireRange_     = nil
    object.cooldown_      = nil
    object.fireCooldown_  = nil
    object.fireCooldown1_  = nil
    object.fireCooldown2_  = nil
    object.fireEnabled_   = nil

    object.minDamage_     = nil
    object.maxDamage_     = nil
    -- object.hitrate_       = nil
    object.critical_      = nil
    object.criticalPower_ = nil

    object:unbindMethod(self, "getFireRange")
    object:unbindMethod(self, "getCooldown")
    object:unbindMethod(self, "addFireLock")
    object:unbindMethod(self, "removeFireLock")
    object:unbindMethod(self, "getFireEnabled")
    object:unbindMethod(self, "setFireEnabled")
    object:unbindMethod(self, "fire")
    object:unbindMethod(self, "tick")

    object:unbindMethodunbindMethod(self, "find", find)
    object:unbindMethod(self, "nofind", nofind)
    object:unbindMethod(self, "getBId", getBId)
    object:unbindMethod(self, "enterVision", enterVision)
    object:unbindMethod(self, "noLook", noLook)
    object:unbindMethod(self, "getLookIds", getLookIds)
    object:unbindMethod(self, "onDead", onDead)
    object:unbindMethod(self, "threaten", threaten)
    object:unbindMethod(self, "nothreaten", nothreaten)
    object:unbindMethod(self, "getThreatIds", getThreatIds)
    object:unbindMethod(self, "isLooking", isLooking)
    object:unbindMethod(self, "isThreatening", isThreatening)
    object:unbindMethod(self, "attack", attack)
    object:unbindMethod(self, "selectNextSkill", selectNextSkill)
    object:unbindMethod(self, "idle", idle)
    object:unbindMethod(self, "farAttack", farAttack)
end

function FireBehavior:reset(object)
    object.fireOffsetX_   = checkint(object.state_.fireOffsetX)
    object.fireOffsetY_   = checkint(object.state_.fireOffsetY)
    object.fireOffsetX_L_ = checkint(object.state_.fireOffsetX_L)
    object.fireOffsetY_L_ = checkint(object.state_.fireOffsetY_L)

    if object.staticIndex_ then
        local index = object.staticIndex_
        if type(object.state_.fireOffsetX) == "table" then
            object.fireOffsetX_ = object.state_.fireOffsetX[index]
        end
        if type(object.state_.fireOffsetY) == "table" then
            object.fireOffsetY_ = object.state_.fireOffsetY[index]
        end
    end
    object.fireRange_     = checkint(object.state_.fireRange) 
    object.cooldown_      = checknumber(object.state_.cooldown)
    object.fireCooldown_  = 0
    object.fireCooldown1_  = 0
    object.fireCooldown2_  = 0
    object.fireEnabled_   = object.state_.fireEnabled

    object.minDamage_     = checkint(object.state_.minDamage)
    object.maxDamage_     = checkint(object.state_.maxDamage)
    -- object.hitrate_       = checkint(object.state_.hitrate)
    object.critical_      = checkint(object.state_.critical)
    object.criticalPower_ = checknumber(object.state_.criticalPower)
    -- print("object.criticalPower_ = "..tostring(object.criticalPower_))

    if type(object.fireEnabled_) ~= "boolean" then
        object.fireEnabled_ = true
    end

    ----------- change by Owen, 为了查找物体，然后相互靠近加的，初始化一些信息 -----------
    -- 放技能时的圈
    object.fireRangeSprite_ = nil

    -- 引擎会用到，所以还不能删除
    object.fireLock_ = 0

    -- 死一次以便清理
    onDead(object)

    -- 默认是巡逻模式
    object:setState(IDLE)

    -- -- 技能释放完毕后调用
    -- object.onCastComplete = Signal.new()

    -- 召唤物数目
    object.numSummons = 0
    --------------------------- change by Owen End ----------------------------------
end

return FireBehavior
