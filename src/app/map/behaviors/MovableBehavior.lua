
local MapConstants    = require("app.map.MapConstants")
local math2d          = require("math2d")
local EffectAniCache  = require("app.map.spine.EffectAniCache")
local BehaviorBase    = require("app.map.behaviors.BehaviorBase")
local MovableBehavior = class("MovableBehavior", BehaviorBase)

-- 对象状态
-- 做成 local 提高速度
local ObjectState = require("app.map.ObjectState")
local FIND = ObjectState.FIND
local MOVE = ObjectState.MOVE
local TRACK = ObjectState.TRACK
local ATTACK = ObjectState.ATTACK
local STOP = ObjectState.STOP
local MOVE_TO_PATROL = ObjectState.MOVE_TO_PATROL
local IDLE = ObjectState.IDLE

MovableBehavior.MOVING_STATE_STOPPED   = 0
MovableBehavior.MOVING_STATE_SPEEDUP   = 1
MovableBehavior.MOVING_STATE_SPEEDDOWN = 2
MovableBehavior.MOVING_STATE_FULLSPEED = 3

MovableBehavior.SPEED_SCALE = 1 -- 1.0 / 60

function MovableBehavior:ctor()
    MovableBehavior.super.ctor(self, "MovableBehavior", nil, 1)
end

-- @private
-- 设置对象移动完成,不需要bind这个函数
local function moveComplete(object)
    print(object:getId(), "moveComplete")
    -- TO-DO 播放idle动画,设为idle状态
    object:setState(IDLE)
    object:playAni("Idle", true)


    -- -- -- 播放升级特效
    -- local effect, offsetY = EffectAniCache.getEffectAniCache("Lv_up")
    -- object.sprite_:addChild(effect)

    -- print("effect:getContentSize().height/2 = "..tostring(effect:getContentSize().height/2))
    -- print("offsetY = "..tostring(offsetY))
    -- effect:setPositionY(offsetY)


    -- 清零英雄的舞蹈倒计时
    if object.danceTime_ then
        object.danceTime_ = 0
        -- 记录英雄目前是战斗状态
        object.isOutFight_     = false
        object.restorHPTime_ = 0
    end

    if object:hasBehavior("HeroBehavior") then
        object.lastMoveToX = nil
        object.lastMoveToY = nil
        object.nextX_      = nil
        object.nextY_      = nil

        object.bindingPathId_     = nil
        object.bindingPointIndex_ = nil
    else
        object:unbindPath()
    end

    -- if (object.onMoveComplete) then
    --     local f = object.onMoveComplete
    --     object.onMoveComplete = nil
    --     f(object)
    -- end
end

-- 为了使怪物行走不重叠，修正一下怪物行走的路径
-- monsterIndex 表示当前怪物是这个路径上刷的第几个怪，
-- x, y 表示未修正时路径上的点
local function revisePath(monsterIndex, x, y)
    local index = monsterIndex%5

    -- print("path monster index = "..tostring(index))
    if index == 1 then
        -- 第一个怪不变
    elseif index == 2 then
        -- 第二个x-4，y-4
        x = x - 0    -- 8
        y = y - 0    -- 8
    elseif index == 3 then
        --第三个x+2, y+2
        x = x + 0    -- 4
        y = y + 0    -- 4
    elseif index == 4 then
        --第四个x+2, y+2
        x = x - 0    -- 4
        y = y - 0    -- 4
    elseif index == 0 then 
        -- 第五个x+4, y+4
        x = x + 0    -- 8
        y = y + 0    -- 8
    end
    return x, y
end

-- 在开始移动，和走到了其中的一个路径点之后开始处理
function MovableBehavior:setNextPosition(object)
    local map = object.map_
    if not object.nextPathId_ then
        object.nextPathId_        = object.bindingPathId_
        object.nextPointIndex_    = object.bindingPointIndex_
        object.nextMovingForward_ = object.bindingMovingForward_
    end

    object.currentPathId_     = object.nextPathId_
    object.currentPointIndex_ = object.nextPointIndex_

    -- 如果进入了跳跃区域，NormalMapEventHandler:objectEnterRange() 中判定是否进入了区域
    if object.needJump then
        -- 把怪物的位置直接指定到下一个路径点，并接着往下走
        object.currentPointIndex_ = object.currentPointIndex_ + 1
        local path = object.map_:getObject(object.bindingPathId_)
        object.x_, object.y_ = path:getPoint(object.currentPointIndex_)
        object.needJump = false
        -- 传送延迟时间, 在这个文件中的tick函数中处理
        if object.jumpDelayTime ~= 0 then
            object.beginTickJumpDelay = true
            -- 让其他物体搜寻不到这个怪物
            object.isHide = true
            -- TO-DO 把物体改为完全不可见
            object:setVisible(false)
        end
    end

    local nextPath,
          nextPointIndex,
          nextMovingForward = map:getNextPointIndexOnPath(object.currentPathId_,
                                                          object.currentPointIndex_,
                                                          object.nextMovingForward_,
                                                          true)
    -- 移动完成了
    -- 包括怪物走到了路径终点；英雄/怪物走到了程序中生成的路径的终点
    if not nextPath then 
        -- print("stop moving 3")
        -- print("no next path")
        -- 调用MovableBehavior:moveComplete函数
        moveComplete(object)
        return false
    end

    object.nextPathId_           = nextPath:getId()
    object.nextPointIndex_       = nextPointIndex
    object.nextMovingForward_    = nextMovingForward
    object.nextX_, object.nextY_ = nextPath:getPoint(nextPointIndex)

    -- add by Owen, 2015.6.15, 根据这条路径上刷过的怪物数量来进行位置修正
    local path = nextPath
    -- print("path.default_ = "..tostring(path.default_))
    if path and path.default_ and object:hasBehavior("MonsterBehavior") then
        -- 修正怪物的行走路径
        -- object.monsterNum_这个怪物是这条路径上刷的第几个怪
        object.nextX_, object.nextY_ = revisePath(object.monsterNum_, object.nextX_, object.nextY_)
    end
    ----------------------- add by Owen end -------------

    -- change by Owen, 2015.8.27, 角色的翻转放到这里来处理
    -- if object.nextY_ > object.y_ and (object.nextY_ - object.y_) / math.abs(object.nextX_ - object.x_) > 2 then
    --     -- print("播放Move_Up 动画")
    --     object:playAni("Move_Up", true)
    -- else
        -- object:playAni("Move_Side", true)
    -- end 
    -- 先播动画在设置是否翻转，因为翻转中用到了正在播放动画的判定
    if object.nextX_ < object.x_ then
        -- 在播放背面的时候是不需要翻转的
        -- print("当前播放的动画名字 object:getCurrentAniName(0) = "..object:getCurrentAniName(0))
        object:setFlipSprite(true)
    elseif object.nextX_ > object.x_ then
        object:setFlipSprite(false)
    end
    -- 翻转处理结束


    -- 到下一个路径点的距离、弧度，以及下一个路径点的位置
    -- radians4point求两点的夹角（弧度）
    object.nextRadians_ = math2d.radians4point(object.x_, object.y_, object.nextX_, object.nextY_)
    -- Dist函数实现两点的距离
    object.nextDist_    = math2d.dist(object.x_, object.y_, object.nextX_, object.nextY_)
    object.currentDist_ = 0
    return true
end

-- add by Owen, 2015.8.28, 怪物在FireBehavior:tick()中开始移动时，需要检查是否要翻转
-- 因为攻击的时候会根据目标位置来翻转，攻击结束后需要根据移动方向来翻转
local function checkFlip(object)
    if object.nextX_ and object.nextX_ < object.x_ then
        -- object.flipSprite_ = true
        -- 在播放背面的时候是不需要翻转的
        -- print("当前播放的动画名字 object:getCurrentAniName(0) = "..object:getCurrentAniName(0))
        if object:getCurrentAniName(0) ~= "Move_Up" then
            object:setFlipSprite(true)
        end
    elseif object.nextX_ and object.nextX_ > object.x_ then
        -- object.flipSprite_ = false
        object:setFlipSprite(false)
    end
end

-- 移动到 xy
-- @param x
-- @param y
-- @param isMoveByUser 可选，本次移动是否是玩家点击后移动的
-- @return 是否开始移动
--[[ add by Owen, 2015.12.29, 这个函数只在下面4个函数中被调用：
                MovableBehavior:track()    英雄在FireBehavior中追踪怪物
                rt:moveSingleHeroTo()      玩家操作单个英雄移动
                rt:moveMasterTo()          玩家操作英雄一起移动
                rt:tick()                  拔刀范围内没有敌人，回到驻扎地点

]]
local function moveTo(object, x, y, isMoveByUser)
    
    if not isMoveByUser then
        -- print("moveTo object._isMoveByUser == false object.lastMoveToX = "..tostring(object.lastMoveToX)
        --     .." x = "..x.." lastMoveToY = "..tostring(object.lastMoveToY).." y = "..y)
        object._isMoveByUser = false   -- 表示是否是玩家操纵英雄的移动
        -- change by Owen, 2015.12.29, 英雄移动的时候不需要生成"apath"
        -- 简化成两点之间的移动就可以了
        if object.lastMoveToX == x and object.lastMoveToY == y then
            return true
        end
        object.lastMoveToX = x
        object.lastMoveToY = y
        object.nextX_      = x
        object.nextY_      = y


        local oldX = object.x_
        local oldY = object.y_

        object.bindingPathId_ = 11111    -- 给一个pathId，防止在getFuturePosition中if返回

        -- 到下一个路径点的距离、弧度，以及下一个路径点的位置
        -- radians4point求两点的夹角（弧度）
        object.nextRadians_ = math2d.radians4point(oldX, oldY, x, y)
        -- Dist函数实现两点的距离
        object.nextDist_    = math2d.dist(oldX, oldY, x, y)
        object.currentDist_ = 0
        if x < oldX then
            -- 在播放背面的时候是不需要翻转的
            -- print("当前播放的动画名字 object:getCurrentAniName(0) = "..object:getCurrentAniName(0))
            object:setFlipSprite(true)
        else
            object:setFlipSprite(false)
        end
        do
            return
        end    
    else
        -- print("moveTo object._isMoveByUser == true")
        object._isMoveByUser = true    -- 表示是否是玩家操纵英雄的移动
        -- 下面的代码是老的英雄移动逻辑，不需要了

        local isCancel = object.lastMoveToX == x and object.lastMoveToY == y
        -- print(string.format("last({1}, {2}) current({3}, {4}) state={5} isCancel={6}", object.lastMoveToX, object.lastMoveToY, x, y, state, isCancel))


        object.lastMoveToX = x
        object.lastMoveToY = y

        local beginTime = socket.gettime()

        -- astar
        local path = object.map_:newAstarPath(object.x_, object.y_, x, y, false)
        -- change by Owen, 2015.6.4, 把astar寻路，直接改为两个点行走
        -- moveTo函数只在rt中的moveMonsterTo 和 self:track中调用，都是控制英雄的
        -- 终点肯定是可以行走的区域，所以可以直接改为按照两点组成的直线行走

        
        -- local oriBegin  = beginTime

        -- local state1 = { points = {}}
        -- local path = object.map_:newObject("apath",state1)
        -- path:appendPoint(object.x_, object.y_)
        -- path:appendPoint(x, y)
        
        -- dump(path, "dump path in moveTo")
        if (path) then
            
            object:bindPath(path, 1)
            object:startMoving()

            local endTime = socket.gettime()
            -- print("MovableBehavior:moveTo 耗时 = "..(endTime - beginTime))
            
        else
            -- print("moveTo cancel return false")
            return false
        end

        -- 设置状态
        -- object:setState(state)
        -- object:play(MapConstants.ACTION_WALK)

        return true
    end
end

local TRACK_CD = 0.5

-- 靠近目标,或者说是跟踪，两个物体看到后，相互靠近
-- 进入攻击范围后，两个开始对A
local function track(object, noOffset)
    if (object.trackCD > 0) then
        
        return
    end

    local target = object.target
    -- print(object:getId() .. ".track " .. target:getId())

    local targetX, targetY = 0,0
    -- local offset = math.random(0, 8)
    
    
    if object.x_ + object.offsetX_ > target.x_ + target.offsetX_ then
        -- 如果英雄是从右边往左移到怪物边上
        targetX = target.x_ + target.radius_ + object.radius_
    else
        -- 如果英雄是从左边往右移到怪物边上
        targetX = target.x_ - target.radius_ - object.radius_
    end
    targetY = target.y_


    local radiusOffsetY = object.radiusOffsetY_ or 0
    local radiusOffsetX = object.radiusOffsetX_ or 0
    local radius = object.radius_ or 10.0

    -- print("MovableBehavior track x = "..tostring(targetX)..", y = "..tostring(targetY))

    object:moveTo(targetX, targetY)
end

function MovableBehavior:bind(object)
    object.movingLocked_         = 0
    object.bindingPathId_        = object.state_.bindingPathId
    object.bindingPointIndex_    = object.state_.bindingPointIndex
    object.bindingMovingForward_ = object.state_.bindingMovingForward
    if type(object.bindingMovingForward_) ~= "boolean" then
        object.bindingMovingForward_ = true
    end

    object.nextPathId_           = nil
    object.nextPointIndex_       = nil
    object.nextMovingForward_    = nil
    object.nextX_, object.nextY_ = nil
    object.nextRadians_          = nil
    object.nextDist_             = 0
    object.currentDist_          = 0

    local function isBinding(objec)
        return object.bindingPathId_ ~= nil
    end
    object:bindMethod(self, "isBinding", isBinding)

    local function getBindingPathId(object)
        return object.bindingPathId_
    end
    object:bindMethod(self, "getBindingPathId", getBindingPathId)

    local function getBindingPointIndex(object)
        return object.bindingPointIndex_
    end
    object:bindMethod(self, "getBindingPointIndex", getBindingPointIndex)

    local function getCurrentPathId(object)
        return object.currentPathId_
    end
    object:bindMethod(self, "getCurrentPathId", getCurrentPathId)

    local function getCurrentPointIndex(object)
        return object.currentPointIndex_
    end
    object:bindMethod(self, "getCurrentPointIndex", getCurrentPointIndex)

    local function isMovingForward(object)
        return object.bindingMovingForward_
    end
    object:bindMethod(self, "isMovingForward", isMovingForward)

    local function setMovingForward(object, movingForward)
        object.bindingMovingForward_ = movingForward
    end
    object:bindMethod(self, "setMovingForward", setMovingForward)

    local function isMovingLocked(object)
        return object.movingLocked_ > 0
    end
    object:bindMethod(self, "isMovingLocked", isMovingLocked)

    local function addMovingLock(object)
        object.movingLocked_ = object.movingLocked_ + 1
    end
    object:bindMethod(self, "addMovingLock", addMovingLock)

    local function removeMovingLock(object)
        object.movingLocked_ = object.movingLocked_ - 1
        assert(object.movingLocked_ >= 0, "MovableBehavior.removeMovingLock() - object.movingLocked_ must >= 0")
    end
    object:bindMethod(self, "removeMovingLock", removeMovingLock)

    local function bindPath(object, path, pathPointIndex)
        -- change by Owen, 2015.5.5, pathPointIndex 默认为nil，调用path:getPoint会报错
        pathPointIndex = pathPointIndex or 1
        -- add by Owen, 2015.6.15, 如果是策划画的路径，更新一下这条路径上刷过的怪物的数量
        if path.default_ then
            path:addMonsterNum()
            if object:hasBehavior("MonsterBehavior") then
                object.monsterNum_ = path:getMonsterNum()
            end
        end
        local pathId = path:getId()
        if object.bindingPathId_ ~= pathId and object.bindingPathId_ then
            object:unbindPath()
        end
        object.bindingPathId_     = pathId
        object.bindingPointIndex_ = pathPointIndex
        local x, y = path:getPoint(pathPointIndex)
        if path.default_ and object:hasBehavior("MonsterBehavior") then
            -- 修正怪物的行走路径
            -- object.monsterNum_这个怪物是这条路径上刷的第几个怪
            x, y = revisePath(object.monsterNum_, x, y)
        end
        object:setPosition(x, y)
        -- object:setPosition(path:getPoint(pathPointIndex))

        -- add by Owen, 2016.7.13, 记录一下这个怪物总共要走多少路
        local pointCount = #path.points_
        local points = path.points_
        local x1, y1, x2, y2
        print("pointCount = "..tostring(pointCount))
        local allDist = 0    -- 记录这条路径，也就是这个怪物总共要走多长的距离
        for i = 1, pointCount - 1 do
            x1, y1 = points[i][1], points[i][2]
            x2, y2 = points[i + 1][1], points[i + 1][2]
            -- print("test by Owen x1 = "..tostring(x1).." y1 = "..tostring(y1)
            --     .." x2 = "..tostring(x2).." y2 = "..tostring(y2))
            allDist = allDist + math2d.dist(x1, y1, x2, y2)
        end
        print("allDist = "..tostring(allDist))
        -- 记录这条路径，也就是这个怪物总共要造多长的距离
        object._allPathDist = allDist
        -- 记录一下这个怪物还需要走多少距离才到终点
        object._allNeedMoveDist = allDist

        object.nextPathId_ = nil
        self:setNextPosition(object)
    end
    object:bindMethod(self, "bindPath", bindPath)

    local function unbindPath(object)
        -- change by Owen, 2015.5.19, 删除程序中生成的英雄行走路径, 
        -- 如果是11111的话，表示的是直接移动的英雄路径，不需要移除
        if not object.bindingPathId_ or object.bindingPathId_ == 11111 then return end
        -- change by Owen, 2015.5.19, 修改了英雄的移动方式
        if not object._isMoveByUser and object:hasBehavior("HeroBehavior") then
            object.nextX_      = nil
            object.nextY_      = nil
        else
            object.map_:checkUnbindPath(object.bindingPathId_)
        end
        object.lastMoveToX = nil
        object.lastMoveToY = nil

        -- change by Owen, 2016.5.11, bindingPathId_在激光技能和rmb回退技能的时候会用到，先不置为nil试试
        -- object.bindingPathId_     = nil
        object.bindingPointIndex_ = nil
    end
    object:bindMethod(self, "unbindPath", unbindPath)

    local function validate(object)
        if not object.bindingPathId_ then return end
        if not object.map_:isObjectExists(object.bindingPathId_) then
            object:unbindPath()
            return
        end

        local path = object.map_:getObject(object.bindingPathId_)
        if object.bindingPointIndex_ < 1 or object.bindingPointIndex_ > path:getPointsCount() then
            object:unbindPath()
            return
        end

        object:setPosition(path:getPoint(object.bindingPointIndex_))
    end
    object:bindMethod(self, "validate", validate)

    local function startMoving(object)
        if not object.bindingPathId_ then return end

        if object.movingState_ == MovableBehavior.MOVING_STATE_STOPPED
                or object.movingState_ == MovableBehavior.MOVING_STATE_SPEEDDOWN then
            object.movingState_ = MovableBehavior.MOVING_STATE_SPEEDUP

            if not object.currentPathId_ then
                self:setNextPosition(object)
            end
        end
    end
    object:bindMethod(self, "startMoving", startMoving)

    local function stopMoving(object)
        if object.movingState_ == MovableBehavior.MOVING_STATE_FULLSPEED
                or object.movingState_ == MovableBehavior.MOVING_STATE_SPEEDUP then
            object.movingState_ = MovableBehavior.MOVING_STATE_SPEEDDOWN
        end
    end
    object:bindMethod(self, "stopMoving", stopMoving)

    -- 在MapEventHandler:hit()中，物体死亡的时候才会调用这个函数
    local function stopMovingNow(object)
        object.movingState_ = MovableBehavior.MOVING_STATE_STOPPED
        object.currentSpeed_ = 0
    end
    object:bindMethod(self, "stopMovingNow", stopMovingNow)

    local function isMoving(object)
        -- return object.movingState_ == MovableBehavior.MOVING_STATE_FULLSPEED
        --         or object.movingState_ == MovableBehavior.MOVING_STATE_SPEEDUP
        return object.curState == ObjectState.MOVE
                or object.curState == ObjectState.TRACK
                or object.curState == ObjectState.MOVE_TO_PATROL
    end
    object:bindMethod(self, "isMoving", isMoving)

    local function tick(object, dt)

        -- if (object.trackCD > 0) then
        --     object.trackCD = object.trackCD - TRACK_CD
        --     if (object.trackCD < 0) then
        --         object.trackCD = 0
        --     end
        -- end

        -- if not object.play_ or object.movingLocked_ > 0 or not object.bindingPathId_ then return end

        -- 跳跃延迟时间内，不做处理
        if object.beginTickJumpDelay and object.beginTickJumpDelay == true then
            object.jumpDelayTime = object.jumpDelayTime - dt
            if object.jumpDelayTime <= 0 then
                object.jumpDelayTime      = 0
                object.beginTickJumpDelay = false
                object.isHide             = false
                object:setVisible(true)
            else
                return
            end
        end

        -- 这些状态下不移动
        -- if (object.curState == STOP or object.curState == ATTACK) then
        if (object.curState ~= MOVE and object.curState ~= TRACK and object.curState ~= MOVE_TO_PATROL)
            -- and not object._needRest -- Boss要准备休息了，不能移动
            or object._needRest
            then
            -- print("这些状态下不移动 state = "..tostring(object.curState).." object.mainID_ = "..object.mainID_)
            return
        end


        -- local state = object.movingState_
        -- if state == MovableBehavior.MOVING_STATE_STOPPED then return end

        -- if state == MovableBehavior.MOVING_STATE_SPEEDUP
        --         or (state == MovableBehavior.MOVING_STATE_FULLSPEED
        --             and object.currentSpeed_ < object.maxSpeed_) then
        --     object.currentSpeed_ = object.currentSpeed_ + object.speedIncr_
        --     if object.currentSpeed_ >= object.maxSpeed_ then
        --         object.currentSpeed_ = object.maxSpeed_
        --         object.movingState_ = MovableBehavior.MOVING_STATE_FULLSPEED
        --     end
        -- elseif state == MovableBehavior.MOVING_STATE_SPEEDDOWN then
        --     object.currentSpeed_ = object.currentSpeed_ - object.speedDecr_
        --     if object.currentSpeed_ <= 0 then
        --         object.currentSpeed_ = 0
        --         object.movingState_ = MovableBehavior.MOVING_STATE_STOPPED
        --     end
        -- elseif object.currentSpeed_ > object.maxSpeed_ then
        --     object.currentSpeed_ = object.currentSpeed_ - object.speedDecr_
        --     if object.currentSpeed_ < object.maxSpeed_ then
        --         object.currentSpeed_ = object.maxSpeed_
        --     end
        -- end

        -- change by Owen, 2016.5.23, 熔岩Boss休息的时候，变成地上怪物，移动的时候要变成地下的
        if object.mainID_ == "100504" then
            -- 休息的时候，就变成地上怪物了
            object.walkLayer_ = MapConstants.MONSTER_WALK_LAYER_UNDER
        end



        local x, y = object.x_, object.y_
        -- local currentDist = object.currentDist_ + object.currentSpeed_
        -- currentDist 用来记录从上一个路径点开始，走了多少距离
        local currentDist = object.currentDist_ + object.speed_ *dt
        -- 如果走的距离 > 两个路径点之间的距离

        if currentDist >= object.nextDist_ then
            -- add by Owen, 2016.7.13, 记录一下这个怪物还需要走多少距离才到终点
            if object._allNeedMoveDist then
                object._allNeedMoveDist = object._allNeedMoveDist - object.nextDist_
            end

            object.x_, object.y_ = object.nextX_, object.nextY_
            currentDist = currentDist - object.nextDist_
            -- self:setNextPosition(object)
            
            if not object._isMoveByUser and object:hasBehavior("HeroBehavior") then
                moveComplete(object)
                return
            else
                -- 后面没有路径了，就不需要再计算object的坐标了
                if not self:setNextPosition(object) then return end

                x, y = math2d.pointAtCircle(object.x_, object.y_, object.nextRadians_, currentDist)
            end
        else
            -- print(" move speedTest = "..tostring(speedTest).." curSpeed = "..tostring(object.currentSpeed_))
            -- object.currentSpeed_ 就可以理解成每一个tick的时候需要移动的距离
            -- 我们改造成 速度*dt，这样来表示一个距离
            local ox, oy = math2d.pointAtCircle(0, 0, object.nextRadians_, object.speed_ *dt) -- object.currentSpeed_) --speedTest*dt) )
            x = x + ox
            y = y + oy
        end
        object.currentDist_ = currentDist


        -- 怪物的反转应该是在走到一个路径点的时候就确定了
        -- if x < object.x_ then
        --     -- object.flipSprite_ = true
        --     object:setFlipSprite(true)
        -- elseif x > object.x_ then
        --     -- object.flipSprite_ = false
        --     object:setFlipSprite(false)
        -- end
        -- if y > object.y_ and (y - object.y_) / math.abs(x - object.x_) > 2 then
        --     object:playAni("Move_Up", true)
        -- else
        --     object:playAni("Move_Side", true)
        -- end 
        object.x_, object.y_ = x, y
    end
    object:bindMethod(self, "tick", tick)

    local function preparePlay(object)
        object.currentSpeed_       = 0
        object.movingState_ = MovableBehavior.MOVING_STATE_STOPPED
        object.nextPathId_  = nil
    end
    object:bindMethod(self, "preparePlay", preparePlay)

    local function getFuturePosition(object, time)
        local x, y = object.x_, object.y_
        
        if object:hasBehavior("HeroBehavior") then
            -- print("object.currentSpeed_ = "..object.currentSpeed_..
            --     " object.curState = "..object.curState)
        end
        
        if object.speed_ == 0 or not object.bindingPathId_ 
            -- change by Owen, 增加这两个判定条件
            or object.curState == ObjectState.STOP or object.curState == ObjectState.ATTACK
            -- 增加map的判定，可能这个已经死亡了，但子弹仍然生成
            or not object.map_ then
            return x, y
        end

        -- change by Owen, 英雄的移动方式做了修改
        if not object._isMoveByUser and object:hasBehavior("HeroBehavior") then
            -- print("获得英雄未来位置")
            local currentDist       = object.currentDist_ + object.speed_ * time
            local nextDist          = object.nextDist_
            -- print("获得英雄未来位置 currentDist = "..currentDist.." nextDist = "..nextDist)
            if currentDist >= nextDist then
                return object.nextX_, object.nextY_
            else
                local ox, oy = math2d.pointAtCircle(object.x_, object.y_, 
                    object.nextRadians_, object.speed_ *time)
                -- local x = object.x_ + ox
                -- local y = object.y_ + oy
                -- return x, y
                return ox, oy
            end
        end

        -- 到下一个路径点的距离、弧度，以及下一个路径点的位置
        local nextDist          = object.nextDist_
        local nextRadians       = object.nextRadians_
        local nextX, nextY      = object.nextX_, object.nextY_

        -- 从当前路径出发，time 时间后的距离
        local currentDist       = object.currentDist_ + object.speed_ * time -- * 60

        local map               = object.map_
        local currentPathId     = object.currentPathId_
        local currentPointIndex = object.currentPointIndex_
        local movingForward     = object.nextMovingForward_

        if currentDist < nextDist then
            currentDist = currentDist - object.currentDist_
        end

        while currentDist >= nextDist do
            x, y = nextX, nextY
            currentDist = currentDist - nextDist

            local nextPath,
                  nextPointIndex,
                  nextMovingForward = map:getNextPointIndexOnPath(currentPathId,
                                                                  currentPointIndex,
                                                                  movingForward,
                                                                  true)

            -- 后面没路径了，走到了终点，就不需要再计算xy了
            if not nextPath then
                return x,y
            end

            currentPathId     = nextPath:getId()
            currentPointIndex = nextPointIndex
            movingForward     = nextMovingForward
            nextX, nextY      = nextPath:getPoint(nextPointIndex)
            nextRadians       = math2d.radians4point(x, y, nextX, nextY)
            nextDist          = math2d.dist(x, y, nextX, nextY)
        end

        x, y = math2d.pointAtCircle(x, y, nextRadians, currentDist)
        return x, y
    end
    object:bindMethod(self, "getFuturePosition", getFuturePosition)

    -- 在self:reset()中会调用这个函数，maxSpeed也就是配置文件中设置的speed
    local function setSpeed(object, maxSpeed)
        object.speed_ = checknumber(maxSpeed)
        if object.speed_ < 0 then object.speed_ = 0 end

        -- 从静止到移动有一个加速的过程，speedIncr_就是这个过程中的加速度
        -- object.speedIncr_ = object.speed_ * 1.0 -- 0.025 -- * MovableBehavior.SPEED_SCALE
        -- object.speedDecr_ = object.speed_ * 1.0 -- 0.038 -- * MovableBehavior.SPEED_SCALE
        -- object.maxSpeed_  = object.speed_  -- * MovableBehavior.SPEED_SCALE

        object.currentSpeed_ = object.speed_
    end
    object:bindMethod(self, "setSpeed", setSpeed)

    local function vardump(object, state)
        state.bindingPathId        = object.bindingPathId_
        state.bindingPointIndex    = object.bindingPointIndex_
        state.bindingMovingForward = object.bindingMovingForward_
        return state
    end
    object:bindMethod(self, "vardump", vardump)

    -- 绑定moveTo函数,跟踪函数
    object:bindMethod(self, "moveTo", moveTo)
    object:bindMethod(self, "track", track)
    object:bindMethod(self, "checkFlip", checkFlip)

    self:reset(object)
end

function MovableBehavior:unbind(object)
    object.bindingPathId_        = nil
    object.bindingPointIndex_    = nil
    object.bindingMovingForward_ = nil

    object:unbindMethod(self, "isBinding")
    object:unbindMethod(self, "getBindingPathId")
    object:unbindMethod(self, "getBindingPointIndex")
    object:unbindMethod(self, "isMovingForward")
    object:unbindMethod(self, "setMovingForward")
    object:unbindMethod(self, "isMovingLocked")
    object:unbindMethod(self, "addMovingLock")
    object:unbindMethod(self, "removeMovingLock")
    object:unbindMethod(self, "bindPath")
    object:unbindMethod(self, "unbindPath")
    object:unbindMethod(self, "validate")
    object:unbindMethod(self, "startMoving")
    object:unbindMethod(self, "stopMoving")
    object:unbindMethod(self, "stopMovingNow")
    object:unbindMethod(self, "isMoving")
    object:unbindMethod(self, "tick")
    object:unbindMethod(self, "preparePlay")
    object:unbindMethod(self, "getFuturePosition")
    object:unbindMethod(self, "setSpeed")
    object:unbindMethod(self, "vardump")

    object:unbindMethod(self, "moveTo")
    object:unbindMethod(self, "track", track)
end

function MovableBehavior:reset(object)
    object:setSpeed(checknumber(object.state_.speed))
    object.currentSpeed_ = 0
    object.movingState_  = MovableBehavior.MOVING_STATE_STOPPED

        -- 加速度
    object.increateSpeed = 0

    -- 跟踪的 CD
    object.trackCD = 0
end

return MovableBehavior
