
local MapEvent     = require("app.map.MapEvent")
local MapConstants = require("app.map.MapConstants")
local Decoration   = require("app.map.Decoration")
local ObjectBase   = require("app.map.ObjectBase")
local math2d       = require("math2d")
local ObjectType   = require("app.map.ObjectType")
local EventNames   = require("tools.EventNames")
local NotifyCenter = require("tools.NotifyCenter")
local Timer        = require("tools.Timer")
local ObjectState  = require("app.map.ObjectState")
local BulletBase   = require("app.map.bullets.BulletBase")
local Tomb         = require("app.map.Tomb")
local BuffBase     = require("app.map.skills.BuffBase")
local BattleDataManager = require("app.map.data.BattleDataManager")
local SkillBase    = require("app.map.skills.SkillBase")
local SkillFactory = require("app.map.skills.SkillFactory")
local Collision    = require("app.map.Collision")

local socket = require("socket")


local MapRuntime = class("MapRuntime",function()
    return display.newNode()
end)

local MAP_EVENT_COLLISION_BEGAN = 1
local MAP_EVENT_COLLISION_ENDED = 2
local MAP_EVENT_FIRE            = 3
local MAP_EVENT_NO_FIRE_TARGET  = 4

local kMapEventCollisionBegan    = 1
local kMapEventCollisionEnded    = 2
local kMapEventCollisionFire     = 3
local kMapEventCollisionNoTarget = 4

-- copy global to local
local kMapObjectClassIndexPath       = kMapObjectClassIndexPath
local kMapObjectClassIndexRange      = kMapObjectClassIndexRange
local kMapObjectClassIndexStatic     = kMapObjectClassIndexStatic

local CLASS_INDEX_PATH   = ObjectBase.CLASS_INDEX_PATH
local CLASS_INDEX_RANGE  = ObjectBase.CLASS_INDEX_RANGE
local CLASS_INDEX_STATIC = ObjectBase.kMapObjectClassIndexStatic -- ObjectBase.CLASS_INDEX_STATIC

-- EditorScene中每次PlayMap都会重新创建一个rt
function MapRuntime:ctor(map, mapCoinfig, collisionEngine)
    cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()

    self.debug_                = map:isDebug()
    self.map_                  = map
    self.mapCoinfig_           = mapCoinfig -- 关卡配置信息
    self.batch_                = map:getBatchLayer()
    self.camera_               = map:getCamera()
    self.starting_             = false
    self.over_                 = false
    self.paused_               = false
    self.promptTarget_         = nil -- 战场提示
    self.time_                 = 0 -- 地图已经运行的时间
    self.lastSecond_           = 0 -- 用于触发 OBJECT_IN_RANGE 事件
    self.dispatchCloseHelp_    = 0
    self.towers_               = {} -- 所有的塔，在玩家触摸时显示开火范围
    self.bullets_              = {} -- 所有的子弹对象
    self.areaObjects_          = {} -- 所有的区域对象
    self.skills_               = {} -- 所有的上帝技能对象
    self.racePersonnel_        = {}
    self.raceRank_             = {}
    self.disableList_          = {{}, {}, {}, {}, {}}
    self.decreaseCooldownRate_ = 1 -- 减少上帝技能冷却时间百分比
    self.skillCoolDown_        = {0, 0, 0, 0, 0}
    self.skillNeedTime_        = {0, 0, 0, 0, 0}
    self.colls_                = {} -- 用于跟踪碰撞状态
    self.hasSelectedASkill     = false   -- 默认是没有选中技能的
    self.selectedSkillId       = nil     -- 当前选中的技能id
    self.tombs                 = {}      -- 存储地图上的墓碑
    self.canTouchRanges        = {}      -- 记录当前地图上可以点击的range区域，目前用到的是任务处理
    self.nowHeroTask           = nil     -- 记录英雄现在正在做的任务
    self.taskSpentTime         = 0       -- 记录这个任务还需要多久完成

    self.timers_               = {} -- 定时器的集合，元素死了以后过1秒钟再消失

    self.roundAllMonsterAppeared = false -- 当前波的怪物是不是都刷出来了
    self.collisionEngine_       = collisionEngine -- C里面的碰撞检测引擎

    -- 载入 MapA0001Events 地图事件
    -- local eventHandlerModuleName = string.format("maps.Map%sEvents", map:getId())
    -- local eventHandlerModule = require(eventHandlerModuleName)
    -- self.handler_ = eventHandlerModule.new(self, map)  -- 为 MapA0001Events 等地图事件

    -- 修改为载入NormalMapEventHandler
    local eventHandlerModuleName = "app.map.NormalMapEventHandler"
    local eventHandlerModule = require(eventHandlerModuleName)
    self.handler_ = eventHandlerModule.new(self, map)  -- 为 MapA0001Events 等地图事件

    -- 创建物理调试视图
    -- self.debugView_ = self:createDebugNode()
    -- self.debugView_:setVisible(false)
    -- self:addChild(self.debugView_)

    -- 启用节点事件，确保 onExit 时停止
    -- self:setNodeEventEnabled(true)


end

function MapRuntime:onExit()
    self:stopPlay()
    -- add by Owen, 2015.7.30， 退出游戏的时候应该需要删掉所有的物体
    self.map_:removeAllObjects()
end

function MapRuntime:preparePlay()
    self.handler_:preparePlay()
    self:dispatchEvent({name = MapEvent.MAP_PREPARE_PLAY})

    for id, object in pairs(self.map_:getAllObjects()) do
        object:validate()
        object:preparePlay()
        object:updateView()
    end

    self.camera_:setOffset(0, 0)

    self.time_          = 0
    self.lastSecond_    = 0

    -- 遍历已创建的对象，添加 rt 引用
    for k, object in pairs(self.map_.objects_) do
        object.mapRuntime_ = self

        -- hero:initSkillAndBuff(mapRuntime)
        if object:hasBehavior("HeroBehavior") then
            -- 初始化技能、被动技能、光环
            -- 只有第一次的时候会新建，死亡复活的时候不会新建
            -- 这样需要在英雄死亡的时候做如下特殊处理：不触发CD技能，光环不进行判断
            -- object:initSkillAndBuff(self)
            SkillFactory.initSkillAndBuff(object, self)
        end
    end
end

--[[--

开始运行地图

]]
function MapRuntime:startPlay()
    -- self.debugView_:setVisible(true)

    self.starting_    = true
    self.over_        = false
    self.paused_      = false
    self.towers_ = {}

    for id, object in pairs(self.map_:getAllObjects()) do
        object:startPlay()
        object.updated__ = true
    --     if object.classIndex_ == CLASS_INDEX_STATIC and object:hasBehavior("TowerBehavior") then
    --         self.towers_[id] = {
    --             object.x_ + object.radiusOffsetX_,
    --             object.y_ + object.radiusOffsetY_,
    --             object.radius_ + 20,
    --         }
        -- end
    end

    self.handler_:startPlay(state)
    self:dispatchEvent({name = MapEvent.MAP_START_PLAY})

    
    -- self:start() -- start physics world
end

--[[--

停止运行地图

]]
function MapRuntime:stopPlay()
    -- self.debugView_:setVisible(false)
    -- self:stop() -- stop physics world

    for id, object in pairs(self.map_:getAllObjects()) do
        object:stopPlay()
    end

    -- change by Owen, 2015.6.24, 清空正在飞行的子弹
    for i = #self.bullets_, 1, -1 do
        local bullet = self.bullets_[i]
        bullet:removeView()
        table.remove(self.bullets_, i)
    end

    self.handler_:stopPlay()
    self:dispatchEvent({name = MapEvent.MAP_STOP_PLAY})
    self:removeAllEventListeners()

    -- 清空英雄配对的怪物列表
    local heros = self.map_:getHero()
    for i, hero in ipairs (heros) do
        -- if self.map_:getHero() then
        if hero then
            BattleDataManager:setHeroWillAttackTarget(hero, nil)
        end
    end
    -- 清空当前地图中塔的数量
    BattleDataManager:clearTowerNum()

    self.starting_ = false
end

-- 移动主角到 xy
function MapRuntime:moveSingleHeroTo(hero,x, y)
    hero:nofind()
    if hero and hero.isDead_ == false and not hero._isComa then
        -- 移动后将英雄的配对怪物、近战攻击对象置nil
        BattleDataManager:setHeroWillAttackTarget(hero, nil)
        BattleDataManager:setHeroNearAttTarget(hero, nil)
        -- 更新英雄的拔刀范围
        hero.patrolX_ = x
        hero.patrolY_ = y
        -- 切换移动图片
        hero:setState(ObjectState.MOVE)
        -- 第三个参数表示中断之前的动画
        hero:playAni("Move", true, true)
        print("MapRuntime:moveSingleHeroTo")
        hero:moveTo(x, y)
    end
end

-- function MapRuntime:onTouch(event, x, y)
--     if self.over_ or self.paused_ or event ~= "began" then return end
--     -- 将触摸的屏幕坐标转换为地图坐标
--     local x, y = self.camera_:convertToMapPosition(x, y)
    
--     -- 如果选中了技能，那么释放技能
--     if self.hasSelectedASkill == true then
--         SkillFactory.releaseSkill(nil,self.selectedSkillId, MapConstants.SKILL_TYPE_MANUAL, self, nil, nil, x, y)
--         --SkillFactory.newSkill(self.selectedSkillId, MapConstants.SKILL_TYPE_MANUAL, self, nil, nil, x, y)
--         self.hasSelectedASkill = false
--         self.selectedSkillId   = nil
--         return false

--         -- local skillConfig  = ManualSkillProperties.get(self.selectedSkillId)
--         -- if string.len(skillConfig.bulletType) > 0 then
--         --     BulletSkill.new(self, self.selectedSkillId, x, y)
--         --     self.hasSelectedASkill = false
--         --     self.selectedSkillId   = nil
--         --     return false
--         -- end
--     end


--     local minDist = 999999

--     --检查是否选中了某个塔
--     local selectedTowerId
--     local selectedStandRange
--     if (self.towers_~={}) then 
--         for id, tower in pairs(self.towers_) do
--             local dist = math2d.dist(x, y, tower[1], tower[2])
--             if dist < minDist and dist <= tower[3] then
--                 minDist = dist
--                 selectedTowerId = id
--                 selectedStandRange = tower[4]  --将选中塔的信息转换为选中坑位
--             end
--         end
--     end

--     -- 检查是否选中了摸个可以造塔的坑位
--     --local selectedStandRange
--     for id, standRange in pairs(self:getAllStandRange()) do
--         local dist = math2d.dist(x, y, standRange.x_, standRange.y_)
--         if dist < minDist and dist <= standRange.radius_ then
--             minDist = dist
--             selectedStandRange = standRange
--         end
--     end
--     -- dump(selectedStandRange, "dump selectedStandRange")
--     if (selectedStandRange ~= nil) then
--         -- 对选中的坑做操作
--         -- print(format("MapRuntime:onTouch 已选中坑 id({1})", selectedStandRange.id_))
--         -- name, userData
--         NotifyCenter.notify(EventNames.RT_CHOOSED_TOWER_LOCATION, selectedStandRange)


--         return false
--     end

    -- 判定是不是选中了可以点击的区域
    -- for i, v in ipairs(self.canTouchRanges) do
        
    --     -- 选中了任务区域
    --     if v.rangeType_ == MapConstants.TASK_RANGE and v._canTouch then
    --         print("点击了任务区域，需要弹出确认页面，是否让英雄去做任务")
    --     end

    -- end
    

--     -- 把英雄移动到这个位置
--     if self.moveHero_ then 
--         self:moveMasterTo(x, y)
--         --self.moveHero_ = false
--      end

-- end

-- 处理object的buff
function MapRuntime:tickAllBuff(dt)
    --刷新手动技能的CD
    if self.map_.manualSkills then 
        for key,skill in pairs(self.map_.manualSkills) do
            if skill[3]>0 then 
                skill[3] = skill[3]- dt*1000
            end
        end
    end

    --[[ 当上一帧object在区域中时，这一帧，把基础属性还原
         遍历区域，将区域的状态付给rangeBuff_, 这一帧离开了区域的对象属性就还原了

         当timeBuff_时间到了时，把物体的基础属性都还原
         遍历object的timeBuff_，跑持续时间

         如果object有rangeBuff_或者timeBuff_,那么更新基础属性
        ]]

    -- 清空object中的所有区域附加的基础状态
    -- for i, object in pairs(self.map_.objects_) do
    --     if object.buffs_ and object.buffs_.rangeBuff_ and
    --         table.nums(object.buffs_.rangeBuff_) > 0 then
    --         object.buffs_.rangeBuff_ = nil
    --         -- 如果上一帧在区域中，那么这一帧把基础属性都还原
    --         if object.originalPro_ then
    --             for i, v in pairs (object.originalPro_) do
    --                 object[i.."_"] = v
    --             end
    --         end
    --     end
    -- end

    -- tick所有的区域对象, 里面会给object添加上区域修改的基础属性
    for i, object in pairs(self.map_.objects_) do
        if object:getClassId() == "areaobject" then
            object:tickArea(dt)
        end
    end
    -- for i = #self.areaObjects_, 1, -1 do
    --     local area = self.areaObjects_[i]
    --     area:tick(dt)
    --     if area:isOver() then
    --         table.remove(self.areaObjects_, i)
    --     end
    -- end

    -- 处理时间buff，buff间隔伤害，狂奔伤害次数，时间到了删除
    for i, object in pairs(self.map_.objects_) do
        if object.buffs_ and object.buffs_.timeBuff_ and table.nums(object.buffs_.timeBuff_) > 0 then
            -- 跑时间状态的CD
            BuffBase.tickBuffBase(object)
        end
    end

    -- -- 根据物体身上的所有buff，重新计算自己的数值
    for i, object in pairs(self.map_.objects_) do
        -- if object.buffs_ then
        --     BuffBase.updateBuffData(object)
        -- end
        if object.buffs_ and ( (object.buffs_.timeBuff_ and table.nums(object.buffs_.timeBuff_) > 0)
            or (object.buffs_.rangeBuff_ and table.nums(object.buffs_.rangeBuff_) > 0) ) then
            --print("mapRuntime:tickAllBuff BuffBase.updateBuffData(object)")
            BuffBase.updateBuffData(object)
        end
    end

end

-- 测试内存泄露的测试代码
function MapRuntime:doUpdate(dt)
    local result1 = {}
    local result2 = {}
    local result3 = {}
    local result4 = {}
    local result5 = {}
    local result6 = {}
    local result7 = {}
    local result8 = {}
    local result9 = {}
    local result10 = {}

    local target = {}
    for k,v in pairs(target) do
    end

end

function MapRuntime:tick(dt)

    local handler = self.handler_

    self.time_ = self.time_ + dt
    local secondsDelta = self.time_ - self.lastSecond_
    -- 通过这个计算时间，来每秒执行一次MapEventHandler的time()函数
    -- 现在改成没0.1秒执行一次，为了可以实现连续的刷怪
    if secondsDelta >= 0.1 then  -- 1.0 then
        self.lastSecond_ = self.lastSecond_ + secondsDelta
        if not self.over_ then
            -- 执行NormalMapEventHandler中的time函数
            -- print("MapRuntime:newTick 0")
            handler:time(self.time_, secondsDelta)
            -- print("MapRuntime:newTick 0-1")
        end
    end

    local maxZOrder = MapConstants.MAX_OBJECT_ZORDER

    for i, object in pairs(self.map_.objects_) do
        if object.tick then
            object.updated__ = true
            object:tick(dt)
            if object.updated__ and object.sprite_ and object.viewZOrdered_ then
                self.batch_:reorderChild(object.sprite_, maxZOrder - (object.y_ + object.offsetY_))
            end
            if object.fastUpdateView and object.map_ ~= nil then
                object:fastUpdateView()
            end
        end
    end


    -- 通过碰撞引擎获得事件，使用C里面的函数
    local beginTime = socket.gettime()

    local events
    if not self.over_ then
        -- events = self.collisionEngine_:tick(self.map_.checkobjects_, self.colls_, dt)
        events = self.collisionEngine_:newTick(self.map_.checkobjects_, self.colls_, 
            self.map_.addedCheckObjs_, self.map_.removeCheckObjs_, dt)
        self.map_.addedCheckObjs_  = {}
        self.map_.removeCheckObjs_ = {}
        -- dump(events, "dump events")
    end


    -- local events
    -- if not self.over_ then
    --     events = Collision.check(self.map_.checkobjects_, self.colls_, dt)
    --     -- dump(events)
    -- end





    local endTime1 = socket.gettime()
    print("beginTime = "..beginTime.." endTime1 = "..endTime1.." 耗时 = "..(endTime1 - beginTime))
    -- dump(events, " hahaha dump events")


    if events and #events > 0 then
        for i, t in ipairs(events) do
            -- local event, object1, object2 = t[1], t[2], t[3]
            local event, object1 = t[1], self.map_:getObject(t[2])
            -- object1、object2可能会不存在，因为物体可能进入终点消失了
            if object1 then
                if event == kMapEventCollisionBegan then --MAP_EVENT_COLLISION_BEGAN then
                    local object2 = self.map_:getObject(t[3])
                    if object2 then
                        if object2.classIndex_ == kMapObjectClassIndexRange then -- CLASS_INDEX_RANGE then
                            handler:objectEnterRange(object1, object2)
                            self:dispatchEvent({name = MapEvent.OBJECT_ENTER_RANGE, object = object1, range = object2})
                        else
                            handler:objectCollisionBegan(object1, object2)
                            self:dispatchEvent({
                                name = MapEvent.OBJECT_COLLISION_BEGAN,
                                object1 = object1,
                                object2 = object2,
                            })
                        end
                    end
                elseif event == kMapEventCollisionEnded then -- MAP_EVENT_COLLISION_ENDED then
                    local object2 = self.map_:getObject(t[3])
                    if object2 then
                        local object2 = self.map_:getObject(t[3])
                        if object2.classIndex_ == kMapObjectClassIndexRange then -- CLASS_INDEX_RANGE then
                            handler:objectExitRange(object1, object2)
                            self:dispatchEvent({name = MapEvent.OBJECT_EXIT_RANGE, object = object1, range = object2})
                        else
                            handler:objectCollisionEnded(object1, object2)
                            self:dispatchEvent({
                                name = MapEvent.OBJECT_COLLISION_ENDED,
                                object1 = object1,
                                object2 = object2,
                            })
                        end
                    end
                elseif event == kMapEventCollisionFire then -- MAP_EVENT_FIRE then
                    local object2 = {}
                    local nilObjCount = 0
                    for i = 1, #t[3] do
                        local obj = self.map_.checkobjects_[t[3][i]]
                        if obj then
                            object2[i - nilObjCount] = obj
                        else
                            nilObjCount = nilObjCount + 1
                        end
                    end
                    if #object2 > 0 then
                        handler:fire(object1, object2)
                    end
                elseif event == kMapEventCollisionNoTarget then -- MAP_EVENT_NO_FIRE_TARGET then
                    handler:noTarget(object1)
                end
            end
        end
    end

    local endTime2 = socket.gettime()
    print("beginTime = "..beginTime.." endTime1 = "..endTime1.." 耗时 2 = "..(endTime2 - endTime1))

    if not test_co then
        test_co = coroutine.create(self.newTick)
        -- setfenv(1, self.class)
            -- coroutine.resume(test_co, dt, self)
    end
    if not self.starting_ or self.paused_ then return end
    -- print("dt = "..tostring(dt))
    self.dt = dt
    -- coroutine.resume(test_co, dt, self)
end


function MapRuntime.newTick(dt, self)

    while (true) do
        -- print("MapRuntime:newTick self.dt = "..self.dt)
        -- dump(dt, "dump dt")
        -- dump(self, "dump self")
        dt = self.dt
    
    --[[ 测试内存泄露的测试代码
        self.time_ = self.time_ + dt
        local testMemory = collectgarbage("count")
        print(tostring(testMemory))

        if not self.count then
            self.beginCount = testMemory
            self.count = testMemory
            self.testCountTime = self.time_
        end
        if self.time_ - self.testCountTime > 10 then 
            print("10s内增加了内存"..tostring( testMemory - self.count)
                .. " 当前内存"..tostring(testMemory))
            self.count = testMemory
            self.testCountTime = self.time_

            -- if testMemory - self.beginCount > 500 then
            --     -- 大于500k的时候就强制执行一次垃圾回收
            --     collectgarbage("collect")
            --     self.beginCount = testMemory
            -- end

        end
    ]]


    -- if not self.starting_ or self.paused_ then return end
    -- print("MapRuntime:newTick 0-0-0-0")
    local handler = self.handler_
    -- print("MapRuntime:newTick 0-0-0")
    local beginTime1 = socket.gettime()
    -- print("MapRuntime:newTick 0-0")

    self.time_ = self.time_ + dt
    local secondsDelta = self.time_ - self.lastSecond_
    -- 通过这个计算时间，来每秒执行一次MapEventHandler的time()函数
    -- 现在改成没0.1秒执行一次，为了可以实现连续的刷怪
    if secondsDelta >= 0.1 then  -- 1.0 then
        self.lastSecond_ = self.lastSecond_ + secondsDelta
        if not self.over_ then
            -- 执行NormalMapEventHandler中的time函数
            -- print("MapRuntime:newTick 0")
            handler:time(self.time_, secondsDelta)
            -- print("MapRuntime:newTick 0-1")
        end
    end
    -- print("MapRuntime:newTick 1")
	self:tickAllBuff(dt)
    -- print("MapRuntime:newTick 2")

    -- 更新所有对象后
    local maxZOrder = MapConstants.MAX_OBJECT_ZORDER
    for i, object in pairs(self.map_.objects_) do
        if object.tick then
            -- add by Owen, 2015.8.17, 跑物体身上的技能CD
            SkillFactory.reduceSkilCD(object, dt)
            
            -- add by Owen, 2015.7.23, 如果是修改了速度属性，需要调用object:setSpeed()函数
            if object:hasBehavior("MovableBehavior") then                
                object:setSpeed(object["speed_"])
            end
            -- change by Owen, 2015.5.28, 如果是英雄的话，需要判定拔刀范围内是否有敌方单位
            -- if object:hasBehavior("HeroBehavior") 
            --     and object.curState ~= ObjectState.MOVE 
            --     and not object._isComa
            --     and object.curState ~= ObjectState.ATTACK 
            --     -- and BattleDataManager:isHeroHasTarget(self.map_:getHero().id_) == false then
            --     and BattleDataManager:isHeroHasTarget(object.id_) == false then
            --     if object.isDead_ == true then
            --         -- -- 英雄死亡了，处理复活CD
            --         -- object.reviveTime_ = object.reviveTime_ - dt
            --         -- print("英雄死亡了，处理复活CD")
            --         -- if object.reviveTime_ <= 0 then
            --         --     print("英雄活了")
            --         --     object.reviveTime_ = 0
            --         --     object.isDead_ = false
            --         --     object:reset()
            --         --     object:resetAllBehaviors()
            --         --     object:changeView("hero/"..object.defineId_.."-3.png")
            --         --     object:changeView("hero/"..object.defineId_.."-3.png")
            --         -- end
            --     else
            --         -- print("判定拔刀范围馁是否有敌方单位")
            --         -- 判定拔刀范围馁是否有敌方单位
            --         local targets = self:getRangeTargets(object, true, object.patrolX_, 
            --             object.patrolY_, object.patrolRange_)
            --         -- 把第一个作为英雄将要攻击的对象
            --         if targets and #targets > 0 then
            --             -- -- 记录在这个英雄的拔刀范围内的所有怪物
            --             -- object.patrolList = targets
            --             for i,v in ipairs(targets) do
            --                 -- 逃跑怪和空中怪不能作为英雄的配对怪物
            --                 -- print("v.walkLayer_ = "..v.walkLayer_.." AImode_ = "..v.AImode_)
            --                 if v.AImode_ ~= MapConstants.MONSTER_AI_MODE_ONE
            --                     and v.walkLayer_ ~= MapConstants.MONSTER_WALK_LAYER_SKY
            --                     and v.isHide ~= true
            --                     and not v._isImpact then
            --                     -- 这个怪物没被其他英雄配对才能配对
            --                     if BattleDataManager:isMonsterInHeroTarget(v.id_) == false then
            --                         -- print("英雄的配对怪物, id = "..tostring(v.id_))
            --                         BattleDataManager:setHeroWillAttackTarget(object, v)

            --                         break
            --                     end
            --                 end
            --             end
            --             -- 没有配对的敌人，但是拔刀范围内有敌人targets
            --             if BattleDataManager:getHeroWillAttackTarget(object.id_) == nil then
            --                 -- 拔刀范围内有敌人，但是都已经被其他人配对了
            --                 if BattleDataManager:getHeroNearAttTarget(object.id_) == nil then
            --                     -- 记录自己将要近战攻击的敌人
            --                     for i,v in ipairs(targets) do
            --                         -- 逃跑怪和空中怪不能作为英雄的配对怪物
            --                         if v.AImode_ ~= MapConstants.MONSTER_AI_MODE_ONE
            --                             and v.walkLayer_ ~= MapConstants.MONSTER_WALK_LAYER_SKY
            --                             and v.isHide ~= true then
            --                                 BattleDataManager:setHeroNearAttTarget(object, v)
            --                         end
            --                     end
            --                 end
            --             end
            --         else
            --             -- 拔刀范围内没有敌人，回到驻扎地点
            --             if (object.x_ ~= object.patrolX_ or object.y_ ~= object.patrolY_)
            --                 and object:getCurState() ~= ObjectState.MOVE_TO_PATROL then
            --                 print("move to partrol state = "..object:getCurState())
            --                 object:setState(ObjectState.MOVE_TO_PATROL)
            --                 object:playAni("Move", true)
            --                 object:moveTo(object.patrolX_, object.patrolY_)
            --             end
            --         end
            --     end
            -- end
            local lx, ly = object.x_, object.y_
            if object:hasBehavior("HeroBehavior") == true and object.isDead_ == true  then
                -- 英雄死了，不执行英雄的tick函数
            else
                object:tick(dt)
            end
            object.updated__ = lx ~= object.x_ or ly ~= object.y_

            -- 只有当对象的位置发生变化时才调整对象的 ZOrder
            if object.updated__ and object.sprite_ and object.viewZOrdered_ then
                self.batch_:reorderChild(object.sprite_, maxZOrder - (object.y_ + object.offsetY_))
            end



            -- 判定所有塔的过一段时间后就加金币的功能
            if self.handler_.roundStarted and object:hasBehavior("TowerBehavior") then
                if object.addGold_[1] ~= 0 then
                    -- 给塔赋一个生金币的倒计时
                    local goldAdd = object:updateGoldProduce(dt*1000)
                    if (goldAdd~=nil and goldAdd>0) then
                        BattleDataManager:addGold(goldAdd)
                        self:flyGold(object, goldAdd, object.y_ + 75)
                    end
                end
            end
        end




        -- 更新所有对象显示的位置
        -- change by Owen, 2015.7.30, 增加object.map_的判定，
        -- 因为召唤兵是在上一个for循环中直接调用MapEvent:hit处理时间到了死亡的
        if object.fastUpdateView and object.map_ ~= nil then
            object:fastUpdateView()
        end

        -- 清空bList,等待下一次事件收集,bList是object可以攻击的目标,在mapEventHandler:fire中赋值
        object.bList = nil  -- 放到mapEventHandler:noTarget() 中去处理
        object.patrolList = nil
    end

    -- print("MapRuntime:newTick 3")
    local beginTime = socket.gettime()
    -- print("self.map_.checkobjects_ size = "..table.nums(self.map_.checkobjects_)
    --     .." 耗时 0 = "..(beginTime - beginTime1))

    -- -- 通过碰撞引擎获得事件，使用C里面的函数
    -- -- local events
    -- -- if not self.over_ then
    -- --     -- events = self.collisionEngine_:tick(self.map_.checkobjects_, self.colls_, dt)
    -- --     events = self.collisionEngine_:newTick(self.map_.checkobjects_, self.colls_, 
    -- --         self.map_.addedCheckObjs_, self.map_.removeCheckObjs_, dt)
    -- --     self.map_.addedCheckObjs_  = {}
    -- --     self.map_.removeCheckObjs_ = {}
    -- --     -- dump(events, "dump events")
    -- -- end


    -- local events
    -- if not self.over_ then
    --     events = Collision.check(self.map_.checkobjects_, self.colls_, dt)
    --     -- dump(events)
    -- end





    -- local endTime1 = socket.gettime()
    -- print("beginTime = "..beginTime.." endTime1 = "..endTime1.." 耗时 = "..(endTime1 - beginTime))
    -- -- dump(events, " hahaha dump events")


    -- if events and #events > 0 then
    --     for i, t in ipairs(events) do
    --         local event, object1, object2 = t[1], t[2], t[3]
    --         -- local event, object1 = t[1], self.map_:getObject(t[2])
    --         -- object1、object2可能会不存在，因为物体可能进入终点消失了
    --         if object1 then
    --             if event == kMapEventCollisionBegan then --MAP_EVENT_COLLISION_BEGAN then
    --                 local object2 = self.map_:getObject(t[3])
    --                 if object2 then
    --                     if object2.classIndex_ == kMapObjectClassIndexRange then -- CLASS_INDEX_RANGE then
    --                         handler:objectEnterRange(object1, object2)
    --                         self:dispatchEvent({name = MapEvent.OBJECT_ENTER_RANGE, object = object1, range = object2})
    --                     else
    --                         handler:objectCollisionBegan(object1, object2)
    --                         self:dispatchEvent({
    --                             name = MapEvent.OBJECT_COLLISION_BEGAN,
    --                             object1 = object1,
    --                             object2 = object2,
    --                         })
    --                     end
    --                 end
    --             elseif event == kMapEventCollisionEnded then -- MAP_EVENT_COLLISION_ENDED then
    --                 local object2 = self.map_:getObject(t[3])
    --                 if object2 then
    --                     local object2 = self.map_:getObject(t[3])
    --                     if object2.classIndex_ == kMapObjectClassIndexRange then -- CLASS_INDEX_RANGE then
    --                         handler:objectExitRange(object1, object2)
    --                         self:dispatchEvent({name = MapEvent.OBJECT_EXIT_RANGE, object = object1, range = object2})
    --                     else
    --                         handler:objectCollisionEnded(object1, object2)
    --                         self:dispatchEvent({
    --                             name = MapEvent.OBJECT_COLLISION_ENDED,
    --                             object1 = object1,
    --                             object2 = object2,
    --                         })
    --                     end
    --                 end
    --             elseif event == kMapEventCollisionFire then -- MAP_EVENT_FIRE then
    --                 -- local object2 = {}
    --                 -- local nilObjCount = 0
    --                 -- for i = 1, #t[3] do
    --                 --     local obj = self.map_.checkobjects_[t[3][i]]
    --                 --     if obj then
    --                 --         object2[i - nilObjCount] = obj
    --                 --     else
    --                 --         nilObjCount = nilObjCount + 1
    --                 --     end
    --                 -- end
    --                 if #object2 > 0 then
    --                     handler:fire(object1, object2)
    --                 end
    --             elseif event == kMapEventCollisionNoTarget then -- MAP_EVENT_NO_FIRE_TARGET then
    --                 handler:noTarget(object1)
    --             end
    --         end
    --     end
    -- end

    local endTime1 = socket.gettime()
    -- print("newTick 4")

    -- 更新所有的子弹对象
    for i = #self.bullets_, 1, -1 do
        local bullet = self.bullets_[i]
        bullet:tick(dt)
        if bullet:isOver() then
            table.remove(self.bullets_, i)
        end
    end
    -- print("newTick 5")

    -- 更新所有的墓碑
    for i=#self.tombs,1,-1 do
        local tomb = self.tombs[i]
        tomb:tick(dt)
        if tomb:isOver() then
            table.remove(self.tombs,i)
        end
    end
    -- print("newTick 6")

    
    -- 还没有开始刷怪的时候是不需要做这个判定的
    if BattleDataManager:getCurRound() ~= 0 then
        -- 判定是否要显示任务区域
        local taskRanges = self.map_:getRanges(MapConstants.TASK_RANGE)
        for i, v in ipairs(taskRanges) do
            -- 如果这个任务有出现的时间
            local quickPassTime =  BattleDataManager:getAddedPasstime()
            if v.appearTime_/MapConstants.MILLISECOND < (self.time_ - self._gameStartTime) + quickPassTime
                and v:isVisible() == false then
                -- print("把任务置为可见")
                v:setVisible(true)
                v._canTouch = true
                -- 插入可以点击的区域table中
                table.insert(self.canTouchRanges, v)
            end 
        end

        -- 判断机关技能区域是否可以点击
        local skillRanges = self.map_:getRanges(MapConstants.SKILL_RANGE)
         for i, v in ipairs(skillRanges) do
            -- 如果这个任务有出现的时间
            local quickPassTime =  BattleDataManager:getAddedPasstime()
            v._clickCD = v._clickCD - dt * MapConstants.MILLISECOND
            if v._clickCD <= 0 and v._canTouch == false then
                v._clickCD = 0
                v._canTouch = true
                -- print("把机关置为可点击")
                -- 插入可以点击的区域table中
                table.insert(self.canTouchRanges, v)
            end 
        end
    end

    
    -- print("newTick 7")

    -- 如果英雄正在做任务，判定任务有没有结束
    if self.taskSpentTime > 0 then
        self:checkHeroTaskOver(dt)
    end
    -- print("newTick 8")

    --更新所有的定时器
    for i=#self.timers_,1,-1 do
        local timer = self.timers_[i]
        timer:tick(dt)
        if timer:isOver() then
            table.remove(self.timers_,i)
        end
    end

    local endTime2 = socket.gettime()
    -- print(" cast time 2 = "..(endTime2 - endTime1))

    coroutine.yield()
    end
end

-- 获得范围内可以攻击的对象
-- object 为以该目标范围和视野进行计算；为nil则以x,y为中心点，range为半径计算
-- enemy true为返回敌方，false则返回范围内的所有单位
-- 目前只用来计算英雄的拔刀范围内是否有怪物
-- noOffset 表示是否需要根据object的radius offset来进行修正
function MapRuntime:getRangeTargets(object,enemy,x,y,range, noOffset, campId)
    local x = x or object.x_
    local y = y or object.y_

    local obj = {
        x_ = x,
        y_ = y,
        -- radiusOffsetX_= object.radiusOffsetX_,  --  0,
        -- radiusOffsetY_= object.radiusOffsetY_,  --  0,
    }
    -- 在判定英雄拔刀范围、子弹爆炸范围的时候要用到这个，爆炸时可能攻击方已经销毁了
    if object then
        obj.radiusOffsetX_ = object.radiusOffsetX_
        obj.radiusOffsetY_ = object.radiusOffsetY_
    end
    if noOffset then
        obj.radiusOffsetX_ = 0
        obj.radiusOffsetY_ = 0
    end
    local targets = {}
    local result = {}
    local firerange = range or object.fireVision_

    self.collisionEngine_:getFireTargets(obj, self.map_.checkobjects_, targets, firerange)
   
    -- print(format("MapRuntime:getRangeTargets object id({1})", object:getId()))
    -- print(format("MapRuntime:getRangeTargets count({1})", #targets))

    for k, target in pairs(targets) do
        if not target:isDestroyed() then 
            if enemy then
                -- 根据阵营Id，campId 来获得敌方单位
                if object == nil then
                    if (campId == MapConstants.TOWER_CAMP 
                            or campId == MapConstants.HERO_CAMP
                            or campId == MapConstants.SOLDIER_CAMP) 
                        and (target.campId_ == MapConstants.MONSTER_CAMP
                            or target.campId_ == MapConstants.BOSS_CAMP) then

                        result[#result+1] = target

                    elseif (campId == MapConstants.MONSTER_CAMP 
                            or campId == MapConstants.BOSS_CAMP)
                        and (target.campId_ == MapConstants.HERO_CAMP
                            or target.campId_ == MapConstants.SOLDIER_CAMP) then
                        
                        result[#result+1] = target

                    end
                elseif target:hasBehavior("CampBehavior") and object:canAttack(target) then
                    -- result[#result+1] = target
                    -- print(format("MapRuntime:getRangeTargets id({1}) canAttack({2})", target:getId(), object:canAttack(target)))                    
                    result[#result+1] = target
                end
            else
                -- 如果没有说返回地方单位，那么就返回所有的单位
                -- if target:hasBehavior("CampBehavior") and not object:canAttack(target) then
                    result[#result+1] = target
                -- end
            end
       
       end
    end
    
    return result
end

-- 移动主角到 xy
function MapRuntime:moveMasterTo(x, y)
    -- do
    --     return
    -- end
    -- print("MapRuntime:moveMasterTo(x, y)")
    local heros = self.map_:getHero()
    -- if (master:isDestroyed()) then
    --     -- 死亡不能移
    --     return
    -- end
    -- print("MapRuntime:moveMasterTo(x, y) 1")
    -- if (master.currentCasting) then
    --     -- 释放中不能移
    --     return
    -- end
    -- print("MapRuntime:moveMasterTo(x, y) 2 master.stat = "..tostring(master.stat).." master.movingLocked_ = "..tostring(master.movingLocked_))
    -- if (master.state == ObjectState.STOP or master.movingLocked_ > 0) then
    --     -- 这个状态也不能移
    --     return
    -- end
    -- 记录英雄移动的位置，给英雄复活以后移动用
    self.heroX = x
    self.heroY = y 
    local pos = self.map_:calPos(x, y,"hero")
    for i,master in ipairs(heros) do 
        -- print("MapRuntime:moveMasterTo(x, y) 3")
        master:nofind()
        -- print("MapRuntime:moveMasterTo(x, y) 4 x = "..tostring(x).." y = "..tostring(y))
        if master and master.isDead_ == false and not master._isComa then
            -- 移动后将英雄的配对怪物、近战攻击对象置nil
            BattleDataManager:setHeroWillAttackTarget(master, nil)
            BattleDataManager:setHeroNearAttTarget(master, nil)
            local newX = pos[i].x
            local newY = pos[i].y
            -- 更新英雄的拔刀范围
            master.patrolX_ = newX
            master.patrolY_ = newY
            -- 切换移动图片
            master:setState(ObjectState.MOVE)
            master:playAni("Move", true, true)
            master:moveTo(newX, newY)

            -- print("MapRuntime:moveMasterTo(x, y) 5")
        end
    end
end

-- 点击了任务区域，英雄去做任务
function MapRuntime:heroDoTask(range)
    -- 跟中了消失的buff一样处理
    print("MapRuntime:heroDoTask")
    dump(range, "dump range")
    for i, object in ipairs(self.map_:getHero()) do
        if not object.isDead_ then
            object._isComa    = true
            if object:hasBehavior("MovableBehavior") then
                object:setState(ObjectState.STOP)
                -- 英雄被击晕了，需要解除绑定的路径
                if object:hasBehavior("HeroBehavior") then
                    object:unbindPath()
                end
            end
            object._disappeerX = object.x_
            object._disappeerY = object.y_
            -- 把物体的坐标 x, y 都置为10000
            object.x_ = MapConstants.FOUDATION_PERCENT
            object.y_ = MapConstants.FOUDATION_PERCENT
            object.patrolX_ = object.x_
            object.patrolY_ = object.y_

            -- 让物体跟新位置
            object.updated__ = true
            object:fastUpdateView()

            if object:hasBehavior("HeroBehavior") then
                -- 清空配对列表、近战攻击列表
                BattleDataManager:setHeroWillAttackTarget(object, nil)
                BattleDataManager:setHeroNearAttTarget(object, nil)
            end
        end
    end
    -- 如果英雄死亡了，墓碑也要移走
    for i=#self.tombs,1,-1 do
        local tomb = self.tombs[i]
        tomb._disappeerX = tomb.x
        tomb._disappeerY = tomb.y
        -- 把物体的坐标 x, y 都置为10000
        tomb.x = MapConstants.FOUDATION_PERCENT
        tomb.y = MapConstants.FOUDATION_PERCENT
        tomb:changePosition(tomb.x, tomb.y)
    end


    -- 显示在“任务中”三个字
    local taskLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "任务中",
        font = "Arial",
        color = cc.c3b(255, 255, 255),
        x = 0,
        y = 50,
    })
    range:getView():addChild(taskLabel)
    range._taskLabel = taskLabel

    range._canTouch = false

    self.nowHeroTask = range
    self.taskSpentTime = range.spendTime_/MapConstants.MILLISECOND
end

-- 检查任务是不是已经做完了
function MapRuntime:checkHeroTaskOver(dt)
    -- 如果英雄正在做任务，判定一下任务有没有结束
    if self.taskSpentTime > 0 then
        -- 每个英雄给任务扣的时间是不一样的
        for i, object in ipairs(self.map_:getHero()) do
            if not object.isDead_ then
                local reduce = object.questSpeed_[2] * object.questSpeed_[1]/MapConstants.MILLISECOND
                reduce = reduce * dt
                self.taskSpentTime = self.taskSpentTime - reduce
            end
        end
        if self.taskSpentTime <= 0 then
            self.taskSpentTime = 0
            for i, object in ipairs(self.map_:getHero()) do
                if not object.isDead_ then
                    object._isComa    = nil

                    -- 把物体的坐标 x, y 设为原来消失的位置
                    object.x_ = object._disappeerX
                    object.y_ = object._disappeerY
                    object.patrolX_ = object.x_
                    object.patrolY_ = object.y_
                    object._disappeerX = nil
                    object._disappeerY = nil
                    -- 让物体跟新位置
                    object.updated__ = true
                    object:fastUpdateView()
                end
            end
            -- 还有墓碑的话回到原位
            for i=#self.tombs,1,-1 do
                local tomb = self.tombs[i]
                tomb.x = tomb._disappeerX
                tomb.y = tomb._disappeerY
                tomb._disappeerX = nil
                tomb._disappeerY = nil
                tomb:changePosition(tomb.x, tomb.y)
            end
            self.nowHeroTask._taskLabel:removeSelf()
            self.nowHeroTask:setVisible(false)
            -- 增加金币
            BattleDataManager:addGold(self.nowHeroTask.awardCount_) 
            self.map_:removeObject(self.nowHeroTask)
        end
    end
end

-- 点击机关区域后，释放区域技能
function MapRuntime:releaseRangeSkill(range, skillId)

    -- 释放了这个区域技能，把这个区域置为不可点击
    for i = #self.canTouchRanges, 1, -1 do
        local v = self.canTouchRanges[i]
        if v.id_ == range.id_ then
            table.remove(self.canTouchRanges, i)
        end
    end

    range._clickCD = range.rangeClickCD_
    range._canTouch = false
    print("MapRuntime:releaseRangeSkill skillId = "..tostring(skillId))
    SkillFactory.releaseSkill(range, skillId, MapConstants.SKILL_TYPE_AUTO, self, range, nil, range.x_, range.y_)

end

-- 但用户点击快进的时候需要做一些处理，leftTime 为快进的时间，单位为毫秒
function MapRuntime:dealQuickPass(leftTime)
    -- 记录玩家总共快进了多少秒
    BattleDataManager:addPasstime(leftTime)
end

function MapRuntime:getMap()
    return self.map_
end

function MapRuntime:getCamera()
    return self.map_:getCamera()
end

function MapRuntime:getTime()
    return self.time_
end

--[[--

用于运行时创建新对象并放入地图

]]
function MapRuntime:newObject(classId, state, id)
    local object = self.map_:newObject(classId, state, id)

    object.mapRuntime_ = self

    object:preparePlay()
    if self.starting_ then object:startPlay() end

    if object.sprite_ and object.viewZOrdered_ then
        self.batch_:reorderChild(object.sprite_, MapConstants.MAX_OBJECT_ZORDER - (object.y_ + object.offsetY_))
    end
    object:updateView()

    return object
end

--[[--

删除对象及其视图

]]
-- 怪物被击杀、怪物走到终点，都会调用这个函数
function MapRuntime:removeObject(object, delay)

    object:setCollisionEnabled(false)
    
    if object:hasBehavior("HeroBehavior") then
        object.curState = ObjectState.DEATH
        if not string.find(object.imageName_, "png") then
            object:playAni("Death", false, false, nil, function ()
                object.curState = ObjectState.DEATHED
                -- 如果是英雄的话显示一个尸体状态
                object:playAni("Deathed", false, false)
            end, nil)
        end
    end
    if object:hasBehavior("MonsterBehavior") then
        object.curState = ObjectState.DEATH
        if not string.find(object.imageName_, "png") then
            object:playAni("Death", false, false, nil, function ()
                object:setVisible(false)
                object:getView():performWithDelay(function()
                    print("移除动画")
                    object:removeView()
                end, 0.1)
            end, nil)
        end
    end

    -- 英雄死了，把怪物攻击对象清空
    if object:hasBehavior("HeroBehavior") then
        -- print("英雄死亡 object.reviveTime_ = "..tostring(object.reviveTime_))
        BattleDataManager:setHeroWillAttackTarget(object, nil)
        BattleDataManager:setHeroNearAttTarget(object, nil)
        object.isDead_ = true

        local isSkillRevive = false
        local reviveSkillCD = 0
        if object.hpTriggerSkill then
            for i,v in ipairs(object.hpTriggerSkill) do
                -- 如果是血量为0时触发的技能，也就是英雄死亡是触发的技能
                if string.sub(v[2], 1, 5) == "13020" then
                    -- 判断消耗品是否满足了
                    local isPowerEnough, target = SkillFactory.checkIsSkillPowerEnough(object, v[2], v[5])
                    if isPowerEnough == true then
                        if v[3] <= 0 then
                            -- 重置技能的CD
                            v[3] = v[4]
                            print("触发了重生技能")
                            isSkillRevive = true
                        end
                    end
                    reviveSkillCD = v[3]
                end
            end
        end

        -- 记录还有多长时间复活
        if not object._isSoldier then
            object.reviveTime_ = object.liveCd_/1000
            
            -- 如果是技能的复活，那么墓碑时间改为0.2秒
            if isSkillRevive then
                object.reviveTime_ = 0.2
            end
            
            local tomb = Tomb.new(object, self, self.map_, isSkillRevive, reviveSkillCD)
            table.insert(self.tombs, tomb)
        end

        -- local sprite = display.newSprite("hero/tomb.png")
        -- self.map_:getBatchLayer():addChild(sprite)
        -- sprite:setPosition(object.x_, object.y_)
        -- object:changeView("hero/tomb.png")
    end

    if object:hasBehavior("MonsterBehavior") then
        if BattleDataManager:isMonsterInHeroTarget(object.id_) then
            -- 如果死亡的怪物是英雄的配对对象，将其置nil
            BattleDataManager:clearHeroTargetThroughMonster(object)
        end
        if BattleDataManager:isMonsterInHeroNearAttTarget(object.id_) then
            -- 如果死亡的怪物是英雄的近战对象，将其置nil
            BattleDataManager:clearHeroNearAttTargetThroughMonster(object)
        end

        -- 怪物死了，把它从英雄的射击范围内移出
        local heros = self.map_:getHero()
        for i, hero in ipairs (heros) do
            if hero then
                hero:noLook(object)
            end
        end
        -- if hero then
        --     hero:noLook(object)
        -- end

        -- add by Owen, 2015.8.17, 怪物死后加入Timer，在rt:tick()函数中过了10s以后，将object置nil  
        -- 置不置nil，一关玩完以后，lua占用的内存都从5兆涨到25兆，所以就先不注nil
        -- local callback = function()
        --     print("怪物死亡10s以后，领 object = nil，object.mainID = "..tostring(object.mainID_))
        --     for k,v in pairs(object) do
        --         if type(v) == "table" then
        --             v = nil
        --         end
        --     end
        --     object.mapRuntime_ = nil
        --     object = nil
        -- end
        -- local timer = Timer.new({callback=callback,delay=10})
        -- self:addTimer(timer)

    end

    if object:hasBehavior("MonsterBehavior") or object:hasBehavior("BossBehavior") then
        -- 记录这一波消失的怪物数量
        self.map_:addDestroyedMonsterCount()
    end

    -- -- 如果是英雄，则不清除掉
    -- if object:hasBehavior("HeroBehavior") then

    -- else

        if delay then
            object:getView():performWithDelay(function()
                self.map_:removeObject(object)
            end, delay)
        else
            self.map_:removeObject(object)
        end
    -- end

    -- 判定游戏是否通关
    local isWinGame = self:checkPassGame()
        -- print("test isWinGame = "..tostring(isWinGame))
        if self:checkPassGame() then
            self:winGame()
    end
end

--[[--

创建一个装饰对象并放入地图

]]
function MapRuntime:newDecoration(decorationName, target, x, y)
    local decoration = Decoration.new(decorationName)
    decoration:createView(self.batch_)

    local view = decoration:getView()
    if target then
        local targetView = target:getView()
        self.batch_:reorderChild(view, targetView:getLocalZOrder() + decoration.zorder_)
        local ox, oy = checknumber(x), checknumber(y)
        x, y = target:getPosition()
        x = math.floor(x)
        y = math.floor(y)
        view:setPosition(x + ox + decoration.offsetX_, y + oy + decoration.offsetY_)
        view:setScaleX(targetView:getScaleY() * decoration.scale_)
    else
        view:setPosition(x + decoration.offsetX_, y + decoration.offsetY_)
        view:setScaleX(decoration.scale_)
    end

    return decoration
end

function MapRuntime:addBullet(bullet)
    self.bullets_[#self.bullets_ + 1] = bullet
end

function MapRuntime:addAreaObject(area)
    self.areaObjects_[#self.areaObjects_ + 1] = area
end

local function checkStiaticObjectCollisionEnabled(obj)
    return obj.classIndex_ == CLASS_INDEX_STATIC
        and (not obj.destroyed_)
        and obj.collisionEnabled_
        and obj.collisionLock_ <= 0
end

-- 记录当前是否选中了一个技能
function MapRuntime:selectOneSkill(skillId)
    if self.hasSelectedASkill == false then
        self.hasSelectedASkill = true
        self.selectedSkillId   = skillId
    elseif self.selectedSkillId~= skillId then 
        self.selectedSkillId = skillId
    else
        self.hasSelectedASkill = false
        self.selectedSkillId   = nil
    end
end

-- 碰撞检测
function MapRuntime:tickCollider(objects, colls, dt)
    -- dump(colls, " dump MapRuntime:tickCollider colls")
    -- dump(objects, "dump MapRuntime:tickCollider objects")
    local dists = {}
    local sqrt = math.sqrt

    -- 遍历所有对象，计算静态对象与其他静态对象或 Range 对象之间的距离
    for id1, obj1 in pairs(objects) do
        while true do
            if not checkStiaticObjectCollisionEnabled(obj1) then
                break
            end

            local x1, y1 = obj1.x_ + checknumber(obj1.radiusOffsetX_), obj1.y_ + checknumber(obj1.radiusOffsetY_)
            local campId1 = checkint(obj1.campId_)
            dists[obj1] = {}

            for id2, obj2 in pairs(objects) do
                while true do
                    if obj1 == obj2 then break end

                    local ci = obj2.classIndex_
                    if ci ~= CLASS_INDEX_STATIC and ci ~= CLASS_INDEX_RANGE then break end
                    if ci == CLASS_INDEX_STATIC and not checkStiaticObjectCollisionEnabled(obj2) then break end
                    if campId1 ~= 0 and campId1 == obj2.campId_ then break end

                    local x2, y2 = obj2.x_ + checknumber(obj2.radiusOffsetX_), obj2.y_ + checknumber(obj2.radiusOffsetY_)
                    local dx = x2 - x1
                    local dy = y2 - y1
                    local dist = sqrt(dx * dx + dy * dy)
                    dists[obj1][obj2] = dist

                    break -- stop while
                end
            end -- for id2, obj2 in pairs(objects) do

            break -- stop while
        end
    end -- for id1, obj1 in pairs(objects) do

    -- 检查碰撞和开火
    local events = {}
    for obj1, obj1targets in pairs(dists) do
        local fireRange1 = checknumber(obj1.fireRange_)
        local radius1 = checknumber(obj1.radius_)
        local checkFire1 = obj1.fireEnabled_ and checknumber(obj1.fireLock_) <= 0 and fireRange1 > 0 and checknumber(obj1.fireCooldown_) <= 0

        -- 从 obj1 的目标中查找距离最近的
        local minTargetDist = 999999
        local fireTarget = nil

        -- 初始化碰撞目标数组
        if not colls[obj1] then colls[obj1] = {} end
        local obj1colls = colls[obj1]

        -- 检查 obj1 和 obj2 的碰撞关系
        for obj2, dist1to2 in pairs(obj1targets) do
            local radius2 = obj2.radius_
            local isCollision = dist1to2 - radius1 - radius2 <= 0

            local event = 0
            local obj2CollisionWithObj1 = obj1colls[obj2]
            if isCollision and not obj2CollisionWithObj1 then
                -- obj1 和 obj2 开始碰撞
                event = MAP_EVENT_COLLISION_BEGAN
                obj1colls[obj2] = true
            elseif not isCollision and obj2CollisionWithObj1 then
                -- obj1 和 obj2 结束碰撞
                event = MAP_EVENT_COLLISION_ENDED
                obj1colls[obj2] = nil
            end

            if event ~= 0 then
                -- 记录事件
                events[#events + 1] = {event, obj1, obj2}
            end

            -- 检查 obj1 是否可以对 obj2 开火
            if checkFire1 and obj2.classIndex_ == CLASS_INDEX_STATIC then
                local dist = dist1to2 - fireRange1 - radius2
                if dist <= 0 and dist < minTargetDist then
                    minTargetDist = dist
                    fireTarget = obj2
                end
            end
        end

        if fireTarget then
            events[#events + 1] = {MAP_EVENT_FIRE, obj1, fireTarget}
        elseif checkFire1 then
            events[#events + 1] = {MAP_EVENT_NO_FIRE_TARGET, obj1}
        end
    end

    return events
end

function MapRuntime:getStandRangeById(rangeId)
    return self:getObject(rangeId)
end

function MapRuntime:getAllStandRange()
    return  self.map_:getObjectsByClassId(ObjectType.TOWER_LOCATION)   -- "standrange")
end



function MapRuntime:addTimer(timer)
    self.timers_[#self.timers_ + 1] = timer
end



function MapRuntime:isObjectExists(id)
    return self.map_:isObjectExists(id)
end

-- 对象被摧毁,在MapEventHandler:hit() 中调用
-- 只有是被击杀的时候调用这个函数
-- 走到终点了销毁，调用的是MapRuntime:removeObject()函数
function MapRuntime:objectDestroyed(object)
    if not self.map_:isObjectExists(object:getId()) then return end
    
    object:setCollisionEnabled(false)

    if object:hasBehavior("MonsterBehavior") then
        -- 怪物死了，把它从英雄的射击范围内移出
        -- local hero = self.map_:getHero()
        -- if hero then
        --     hero:noLook(object)
        -- end

        -- 杀了怪物要添加金币,object.deadGold_是在NormalMapEventHandler:addMonsterToMap()函数中
        -- 配置在怪物队列属性中
        BattleDataManager:addGold(object.deadGold_)
        self:flyGold(object, object.deadGold_, object.y_ + 35)
        -- local goldCountLabel = cc.ui.UILabel.new({
        --     UILabelType = 1,
        --     text = tostring(object.deadGold_),
        --     font = "UIFont.fnt",
        --     x = object:getPositionX(),
        --     y = object:getPositionY() + 25,
        -- })
        -- object:getView():addChild(goldCountLabel)
    end

    -- if object:hasBehavior("MonsterBehavior") or object:hasBehavior("BossBehavior") then
    --     -- 记录这一波击杀的怪物数量
    --     self.map_:addKilledMonsterCount()
    -- end

    -- object:removeAllStateEffect()
    
    -- if object:hasBehavior("CatchKingBehavior") then
    --     object:catchKing(nil)
    -- end

    -- -- 清理召唤出来的小怪
    -- object:killAllSummons()

    self:removeObject(object) -- , 0.5)

    -- local time =2 
    -- if object.gid_ then
    --     time = 1
    -- end
    -- local callback = function()
    --     self:removeObject(object)
       
    --     -- 判断这个回合有没有结束，也就是配置的这一波怪物有没有都被杀了
    --     -- if self:checkRoundOver() then
    --     --     self:winRound()
    --     -- end
    --     -- local isWinGame = self:checkGameOver()
    --     -- print("test isWinGame = "..tostring(isWinGame))
    --     -- if self:checkGameOver() then
    --     --     self:winGame()
    --     -- end
    -- end
    -- local timer = Timer.new({callback=callback,delay=time})
    -- self:addTimer(timer)
end

-- 飘金币效果
function MapRuntime:flyGold(object, goldNum, poxY)
    local time = 1.2 
    -- 显示金币数
    local goldCountLabel = cc.ui.UILabel.new({
        UILabelType = 1,
        text = tostring(goldNum),
        font = "UIFont.fnt",
        x = object.x_,
        y = poxY,
    })
    self.batch_:addChild(goldCountLabel, object:getView():getLocalZOrder() + 1)
    local callback = function()
        goldCountLabel:removeSelf()
    end
    local timer = Timer.new({callback=callback,delay=time})
    self:addTimer(timer)
end

-------------------------------------- 关卡配置相关 Begin ------------------------------------


function MapRuntime:addSubRoundTotalMonster(monster)
    for k,v in ipairs(monster) do
        self:setTotalMonster(self:getTotalMonster() + v.num)
    end
end

function MapRuntime:setRoundMonsterFinished(isFinished)
    -- 这一波所有的怪物都刷出来了
    self.roundAllMonsterAppeared = isFinished
end
-------------------------------------- 关卡配置相关 End ------------------------------------

------------------------------------- 游戏回合输赢判定 Begin ---------------------------------

-- 一波的结束也不需要判定了
-- 判断这一波怪物是不是都杀死了,在rt:objectDestroyed()函数中调用这个函数
-- function MapRuntime:checkRoundOver()
--     print("MapRuntime:checkRoundOver()")
--     if self.roundAllMonsterAppeared == false then
--         -- 这一波怪物还没有全部刷出来
--         print("MapRuntime:checkRoundOver() 1")
--         return false
--     end
--     if self.map_:getKilledMonsterCount() ~= self.map_:getTotalMonsterCountInThisRound() then
--         -- 未全部击杀
--         print("MapRuntime:checkRoundOver() 2")
--         return false
--     end
--     -- 这一波结束了
--     return true
-- end

-- 漏了一个怪后检测是否结束
function MapRuntime:checkHp()
    if BattleDataManager:getHp() <= 0 then
        self:loseGame()
    end
end

-- 判断这一关是不是通过了
function MapRuntime:checkPassGame()
    if BattleDataManager:getCurRound() ~= BattleDataManager:getTotalRound() then
        -- 推测，未完成全部回合
        -- print("MapRuntime:checkPassGame() 1")
        return false
    end
    if self.roundAllMonsterAppeared == false then
        -- 推测，未全部上阵
        -- print("MapRuntime:checkPassGame() 2")
        return false
    end
    if self.map_:getDestroyedMonsterCount() ~= self.map_:getTotalMonsterCountInThisMap() then
        -- 推测，刷出的怪未全部消失
        -- print("self.map_:getDestroyedMonsterCount() = "..tostring(self.map_:getDestroyedMonsterCount()))
        -- print("self.map_:getTotalMonsterCountInThisMap() = "..tostring(self.map_:getTotalMonsterCountInThisMap()))
        -- print("MapRuntime:checkPassGame() 3")
        return false
    end
    --推测，结束
    -- print("MapRuntime:checkPassGame() 4")
    return true
end

-- 这一关卡通关了
function MapRuntime:winGame(player)
    -- print("MapRuntime:winGame(player)")
    if self.over_ then return end
    self.over_ = true
    self:dispatchEvent({name = MapEvent.MAP_WIN})
    self:pausePlay()
    self.map_.uiLayer:showWinLayer(self.mapCoinfig_)
end

function MapRuntime:loseGame(player)
    if self.over_ then return end
    self.over_ = true
    self:dispatchEvent({name = MapEvent.MAP_LOSE})
    self:pausePlay()
    self.map_.uiLayer:showLoseLayer(self.mapCoinfig_)
end

function MapRuntime:pausePlay()
    if not self.paused_ then
        self:dispatchEvent({name = MapEvent.MAP_PAUSE_PLAY})
    end
    self.paused_ = true
end

function MapRuntime:resumePlay()
    if self.paused_ then
        self:dispatchEvent({name = MapEvent.MAP_RESUME_PLAY})
    end
    self.paused_ = false
end

-- 重新开始这一关卡
function MapRuntime:restart()
    print("MapRuntime:restart()")
    
    self:stopPlay()

    -- 隐藏任务区域
    local taskRanges = self.map_:getRanges(MapConstants.TASK_RANGE)
    for i, v in ipairs(taskRanges) do
        v:setVisible(false)
        v._canTouch = false
    end
    -- 清除当前可以点击的区域
    for i=#self.canTouchRanges,1,-1 do
        table.remove(self.canTouchRanges,i)
    end


    self._gameStartTime = 0
    self.time_          = 0


    -- 移除墓碑
    for i=#self.tombs,1,-1 do
        local tomb = self.tombs[i]
        tomb:removeView()
        table.remove(self.tombs,i)
    end
    self.map_:removeAllObjects()
    self.map_:init()
    self.map_:resetDestroyedMonsterCount()
    self.map_:resetTotalMonsterCountInThisMap()

    -- 初始生命等关卡数据
    BattleDataManager:setConfig(BattleDataManager:getConfig())
    -- 从第一个回合开始
    BattleDataManager:resetCurRound()

    self:preparePlay()
    self:startPlay()

    -- 这条语句的位置是有影响的，因为会重置heros等信息
    NotifyCenter.notify(EventNames.RT_RESTART,nil)


end

------------------------------------- 游戏回合输赢判定 End ---------------------------------

return MapRuntime
