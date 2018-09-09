
--[[--

Map 对象的生命周期

Map.new() 创建 Map 对象实例
Map:init() 初始化 Map 对象
Map:createView() 创建 Map 对象的视图
Map:removeView() 删除 Map 对象的视图
Map:updateView() 更新 Map 对象的视图
Map:destroy() 销毁 Map 对象

Map:newObject() 创建新的地图子对象，并绑定行为
                如果此时视图已经创建，则调用子对象的 createView()

]]

local MapConstants      = require("app.map.MapConstants")
local MapCamera         = require("app.map.MapCamera")
local ObjectFactory     = require("app.map.ObjectFactory")
local Path              = require("app.map.Path")
local Tips              = require("ui.Tips")
local math2d            = require("math2d")
local RangeObject       = require("app.map.RangeObject")
local BattleDataManager = require("app.map.data.BattleDataManager")
local SkillBase         = require("app.map.skills.SkillBase")
local SkillFactory      = require("app.map.skills.SkillFactory")

local Map = class("Map")

--[[
    id:      地图id，为maps目录下的文件
    debug:   是否是编辑器模式
    mapType: 地图类型，现在只有normal和rush，正常关卡和无尽模式
    level:   关卡难度
    round：  第几回合，均为1
]]
function Map:ctor(id, modeId, debug, mapType, mode, round)
    self.id_               = id
    self.modeId_           = modeId
    self.debug_            = debug
    self.debugViewEnabled_ = debug
    self.ready_            = false
    self.mapModuleName_    = string.format("maps.Map%s-%sData", id, modeId) -- 地图文件名字
    -- self.eventModuleName_  = string.format("maps.Map%sEvents", id)   -- 没有用到这个

    self.mapType_          = mapType    -- 地图类型
    self.mode_             = mode       -- 地图模式，简单、征程、困难等
    BattleDataManager:setCurRound(round)   -- 第几回合

    self.totalMonsterCount = 0   -- 记录这张地图总共有多少怪
    self.killedMonsterCount = 0     -- 记录杀了多少怪 
    self.destroyedMonsterCount = 0     -- 记录消失了多少怪,包括击杀和漏掉的


    ------------------------------ 关卡配置相关 End -------------------------------

    local ok, data = pcall(function() return require(self.mapModuleName_) end)
    if not ok or type(data) ~= "table" then
        data = {
            size    = {width = CONFIG_SCREEN_WIDTH, height = CONFIG_SCREEN_HEIGHT},
            objects = {},
        }
    end
    self.data_ = clone(data)
end

function Map:init()
    self.width_             = self.data_.size.width
    self.height_            = self.data_.size.height
    self.imageName_         = self.data_.imageName
    if not self.imageName_ then
        self.imageName_ = string.format("Map%sBg.png", self.id_)
    end

    -- self.bgSprite_          = nil
    -- self.batch_             = nil
    -- self.marksLayer_        = nil
    -- self.promptLayer_       = nil
    -- self.debugLayer_        = nil

    self.objects_           = {}    -- 地图中所有的物体，id为自增的，通过map自身来维护，而不是外面传进来的
    self.checkobjects_      = {}    -- 需要进行碰撞检测的物体
    self.addedCheckObjs_    = {}    -- 添加的需要碰撞检测的物体
    self.removeCheckObjs_   = {}    -- 需要移除的碰撞检测的物体
    self.objectsByClass_    = {}
    self.heros              = {}    -- 存储地图中的英雄
    self.nextObjectIndex_   = 1

    -- 逻辑2.对特定ObjectInstacne进行处理（rangeobject)
    -- 逻辑3.对KingBehavior行为的处理
    -- 添加地图数据中的对象
    for id, state in pairs(self.data_.objects) do
        local classId = unpack(string.split(id, ":"))
        -- print(" hahaha   id = "..tostring(id))
        self:newObject(classId, state, id)
        

        -- 逻辑2
        if classId == "rangeobject" and object and not object:hasBehavior("KingBehavior") and state.rangeType == 2 then
            object:bindBehavior("KingBehavior")
            -- dump(state)
        end
        -- 逻辑3
        if object and object:hasBehavior("KingBehavior") then
            self.king_ = object
        end
    end



    -- 验证所有的路径
    -- 把所有的path的id给存起来
    self.pathids = {}

    for i, path in pairs(self:getObjectsByClassId("path")) do
        path:validate()
        if not path:isValid() then
            echoInfo(string.format("Map:init() - invalid path %s", path:getId()))
            self:removeObject(path)
        else
            table.insert(self.pathids,path:getId())
        end
    end

    -- 验证其他对象
    for id, object in pairs(self.objects_) do
        local classId = object:getClassId()
        if classId ~= "path" then
            object:validate()
            if not object:isValid() then
                echoInfo(string.format("Map:init() - invalid object %s", object:getId()))
                self:removeObject(object)
            end
        end
    end

    -- 计算地图位移限定值
    self.camera_ = MapCamera.new(self)
    self.camera_:resetOffsetLimit()


    -- 根据传入的地图参数，来读取对应的关卡配置，回合数、怪物等
    if self.mapType_ == MapConstants.MAP_TYPE_NORMAL then
        self.monsterModuleName_ = string.format("maps.Map%s-%sMonster", self.id_,self.mode_)
        -- print("self.monsterModuleName_ = "..tostring(self.monsterModuleName_))
        -- TO-DO 判定对应的脚本文件是否存在
        -- if (ResourceManager.hasScript(self.monsterModuleName_)) then
            local enemyData_        = {objects={total=0}}  -- 怪物数据
            enemyData_ = clone(require(self.monsterModuleName_))
            BattleDataManager:setMonsterData(enemyData_)
        -- end
    end

    -- 这张地图总共有几波怪物
    -- self.totalRound_ = self.enemyData_["objects"]["total"]
    -- BattleDataManager:setTotalRound(self.enemyData_["objects"]["total"])




    -- 创建一个可以移动的船作为英雄
    -- local state = {
    --     defineId = "110101",
    --     owenId   = "Hero",
    --     behaviors = "HeroBehavior",
    --     x = 2253,
    --     y = 399,
    --     patrolX = 2253,
    --     patrolY = 399,
    --     patrolRange = 163,
    -- }
    -- -- 第三个参数一定要传一个id
    -- self.hero_ = self:newObject("static", state, "static:1")
    -- self.hero_.patrolRange = 163



    self.gridOffset_ = 100;
        --for astar
    self.numCols_         = math.floor( (self.width_ + self.gridOffset_*2 )/self:getTileSize())
    self.numRows_         = math.floor( (self.height_ + self.gridOffset_*2)/self:getTileSize())
   
   -- change by Owen, 2015.8.20, 没有寻路，这个函数就不需要执行了
    -- self:initGrid()

    -- 地图已经准备好
    self.ready_ = true
end


function Map:newHero(state, mapRuntime)
    local hero
    if #self.heros < 3 then
        hero = self:newObject("static", state, "static:"..tostring(#self.heros + 1))
        table.insert(self.heros, hero)
    else
        for i,v in ipairs(self.heros) do
            if v.mainID_ == state.defineId then
                -- print(" 新建了一个英雄，id = static:"..tostring(i))
                hero = self:newObject("static", state) -- , "static:"..tostring(i))
                hero.mapRuntime_ = mapRuntime
                self.heros[i] = hero 
                -- 初始化技能、被动技能、光环
                -- 只有第一次的时候会新建，死亡复活的时候不会新建
                -- 这样需要在英雄死亡的时候做如下特殊处理：不触发CD技能，光环不进行判断
                -- hero:initSkillAndBuff(mapRuntime)
                SkillFactory.initSkillAndBuff(hero, mapRuntime)
                break
            end
        end
    end

    return hero
end

-- 根据位置，计算3个英雄站立的位置
function Map:calPos(posX, posY,object)
    local pos = {}
    if object == "hero" then
        local diffX = 85
        pos[1] = {x = posX, y = posY}
        pos[2] = {x = posX - diffX, y = posY}
        pos[3] = {x = posX + diffX, y = posY}
    else
        local diffY = 65
        local diffX = 85
        pos[1] = {x = posX, y = posY + diffY}
        pos[2] = {x = posX - diffX, y = posY - diffY + 10}
        pos[3] = {x = posX + diffX, y = posY - diffY - 8}
    end
    return pos
end

-- 获得英雄数据
function Map:getHero()
    if self.heros == nil or #self.heros == 0  then --or self.heros[1].map_ == nil
        return nil
    else
        return self.heros
    end
    -- if self.hero_.map_ == nil then
    --     return nil
    -- else
    --     return self.hero_
    -- end
end

--[[--

返回地图的 Id

]]
function Map:getId()
    return self.id_
end

--[[--

返回地图尺寸

]]
function Map:getSize()
    return self.width_, self.height_
end

--[[--

返回摄像机对象

]]
function Map:getCamera()
    return self.camera_
end

--[[--

确认地图是否处于 Debug 模式

]]
function Map:isDebug()
    return self.debug_
end

--[[--

确认是否允许使用调试视图

]]
function Map:isDebugViewEnabled()
    return self.debugViewEnabled_
end

--[[--

设置地图调试模式

]]
function Map:setDebugViewEnabled(isDebugViewEnabled)
    self.debugViewEnabled_ = isDebugViewEnabled
    for id, object in pairs(self.objects_) do
        object:setDebugViewEnabled(isDebugViewEnabled)
    end
    if self:getDebugLayer() then
        self:getDebugLayer():setVisible(isDebugViewEnabled)
    end
end

--[[--

确认地图是否已经创建了视图

]]
function Map:isViewCreated()
    return self.batch_ ~= nil
end

--[[--

创建新的对象，并添加到地图中

]]
function Map:newObject(classId, state, id)
    -- print("Map:newObject classId = "..tostring(classId))
    if not id then
        id = string.format("%s:%d", classId, self.nextObjectIndex_)
        self.nextObjectIndex_ = self.nextObjectIndex_ + 1
    end

    local object = ObjectFactory.newObject(classId, id, state, self)
    object:setDebug(self.debug_)
    object:setDebugViewEnabled(self.debugViewEnabled_)
    object:resetAllBehaviors()

    -- validate max object index
    local index = object:getIndex()
    if index >= self.nextObjectIndex_ then
        self.nextObjectIndex_ = index + 1
    end

    -- add object
    self.objects_[id] = object
    if not self.objectsByClass_[classId] then
        self.objectsByClass_[classId] = {}
    end
    self.objectsByClass_[classId][id] = object

    -- 这些东西是不需要做碰撞检测的
    if classId ~= "road" and classId ~= "path" and classId ~= "apath" 
        and classId ~= "towerlocation" then

        -- 如果是rangeobject，那么只有怪物终点、减速区域、跳跃、隐藏、暗道入口和出口需要做碰撞检测
        if classId == "rangeobject" then
            local rangeType = object:getRangeType()
            if rangeType == MapConstants.END_RANGE or rangeType == MapConstants.SLOW_DOWN_RANGE
                or rangeType == MapConstants.JUMP_RANGE or rangeType == MapConstants.HIDE_RANGE
                or rangeType == MapConstants.ENTER_RANGE or rangeType == MapConstants.OUT_RANGE then
                print("添加checkobjects object.mainID_ = "..tostring(object.mainID_)
                    .." object.id = "..id)
                self.checkobjects_[id] = object
                self.addedCheckObjs_[id] = object
            end
        else
            print("添加checkobjects object.mainID_ = "..tostring(object.mainID_)
                .." object.id = "..id)
            self.checkobjects_[id] = object
            self.addedCheckObjs_[id] = object
        end
    end

    -- validate object
    if self.ready_ then
        object:validate()
        if not object:isValid() then
            echoInfo(string.format("Map:newObject() - invalid object %s", id))
            -- print(string.format("Map:newObject() - invalid object %s", id))
            self:removeObject(object)  
            return nil
        end

        -- create view
        if self:isViewCreated() then
            object:createView(self.batch_, self.marksLayer_, self.debugLayer_)
            object:updateView()
        end
    end
    return object
end

-- 创建一个新的空 Road
function Map:newRoad()
    return self:newObject("road", {points={{-1, -1}}})
end

function Map:checkUnbindPath(pathid)
    local object = self:getObject(pathid)
    if not object:isDefault() then
        self:removeObject(object)
        print("checkUnbindPath remove object pathid = "..tostring(pathid))
        return true
    else
        return false
    end
end

--[[--

从地图中删除一个对象

]]
function Map:removeObject(object)
    if object.map_ == nil then
        -- assert(false, "不可重复删除")
        -- 因为是在MapEventHandler:hit()中调用的，可以会多次调用，猜测是这个原因
        return
    end
    local id = object:getId()
    assert(self.objects_[id] ~= nil, string.format("Map:removeObject() - object %s not exists", tostring(id)))

    -- print("Map:removeObject id = "..tostring(id).." classId = "..tostring(object:getClassId()))
    self.objects_[id] = nil
    self.objectsByClass_[object:getClassId()][id] = nil
    if object:isViewCreated() then object:removeView() end

    if classId ~= "road" and classId ~= "path" and classId ~= "apath" 
        and classId ~= "towerlocation" then
        self.checkobjects_[id] = nil
        self.removeCheckObjs_[id] = object
    end
    object.map_ = nil
end

--[[--

从地图中删除指定 Id 的对象

]]
function Map:removeObjectById(objectId)
    self:removeObject(self:getObject(objectId))
end

--[[--

删除所有对象

]]
function Map:removeAllObjects()
    for id, object in pairs(self.objects_) do
        self:removeObject(object)
    end
    self.objects_           = {}
    self.objectsByClass_    = {}
    self.nextObjectIndex_   = 1
    self.crossPointsOnPath_ = {}
end

--[[--

检查指定的对象是否存在

]]
function Map:isObjectExists(id)
    return self.objects_[id] ~= nil
end

--[[--

返回指定 Id 的对象

]]
function Map:getObject(id)
    assert(self:isObjectExists(id), string.format("Map:getObject() - object %s not exists", tostring(id)))
    return self.objects_[id]
end

--[[--

返回地图中所有的对象

]]
function Map:getAllObjects()
    return self.objects_
end

--[[--

返回地图中特定类型的对象

]]
function Map:getObjectsByClassId(classId)
    -- dump(self.objectsByClass_[classId])
    return self.objectsByClass_[classId] or {}
end

----------------------------------------- 关卡配置相关 Begin --------------------------------------


function Map:getPathIds()
    return self.pathids
end

function Map:resetTotalMonsterCountInThisMap()
    self.totalMonsterCount = 0
end

-- 记录一下这一波总共需要刷几个怪物
function Map:addTotalMonsterCountInThisMap(num)
    print("这一波"..tostring(BattleDataManager:getCurRound())
        .."总共有"..tostring(num).."个小怪")
    self.totalMonsterCount = self.totalMonsterCount + num
end

function Map:getTotalMonsterCountInThisMap()
    return self.totalMonsterCount
end

-- 记录这一波开始后消失的怪物数量，走到终点的怪这里也会加1
function Map:addKilledMonsterCount()
    self.killedMonsterCount = self.killedMonsterCount + 1
end

function Map:getKilledMonsterCount()
    return self.killedMonsterCount
end

function Map:resetDestroyedMonsterCount()
    self.destroyedMonsterCount = 0
end

function Map:addDestroyedMonsterCount()
    self.destroyedMonsterCount = self.destroyedMonsterCount + 1
end

function Map:getDestroyedMonsterCount()
    return self.destroyedMonsterCount
end

-- 每一波开始以后，重置一下杀怪的数量
function Map:resetKilledMonsterCount()
    self.killedMonsterCountInThisRound = 0
end

----------------------------------------- 关卡配置相关 End ----------------------------------------

------------------------------------------- A*寻路 Begin ------------------------------------------
-- 初始化寻路网格，在 Map:init() 中调用
-- 开始的时候只初始化默认的路，其他的路等后面调用fillGrid() 来添加
function Map:initGrid()
    self.grid_ = AStarNodeGrid:create(self.numCols_, self.numRows_)
    -- self.grid_:retain()   -- 把这个retain放到C++里面去了

    -- 取出所有的 Road 到数组
    local roads = table.values(self:getObjectsByClassId("road"))

    -- 向前兼容：如果只有一个 road，设置为 isDefault
    if (#roads == 1) then
        roads[1]:setIsDefault(true)
    end

    -- 使用默认道路填充
    for i, road in ipairs(roads) do
        if (road:getIsDefault()) then
            self:fillGrid(road, true)
            break
        end
    end
end

-- 使用 Road 填充到网格
-- @param road
-- @param isReset
function Map:fillGrid(road, isReset)
    if (isReset) then
        self.grid_:setSize(self.numCols_, self.numRows_)
    end
    local points = road:getPoints()
    if points then
        for i=1,#points do
            local point = points[i]

            local col,row = self:xyConvToGrid(point[1],point[2])
            self.grid_:setWalkable(col,row,true)
        end
    end
end

function Map:getTileSize()
    return MapConstants.MAP_TILE_SIZE
end

function Map:xyConvToGrid(x,y)
    x = x - self:getTileSize()/2 + self.gridOffset_
    y = y - self:getTileSize()/2 + self.gridOffset_
    local gridX = math.floor((x + self:getTileSize()/2) / self:getTileSize())
    local gridY = math.floor((y + self:getTileSize()/2) / self:getTileSize())
    return gridX,gridY
end

function Map:gridConvToXY(col,row)
    local x = col * self:getTileSize() + self:getTileSize()/2.0 - self.gridOffset_
    local y = row * self:getTileSize() + self:getTileSize()/2.0 - self.gridOffset_
    return x,y
end

function Map:isWalkable(x,y)
    -- change by Owen, 2015.8.20, 判断x,y是不是可以行走的区域，改为遍历road，不用grid了
    -- 取出所有的 Road 到数组
    print("Map:isWalkable x = "..x.." y = "..y)
    local roads = table.values(self:getObjectsByClassId("road"))
    for i, v in ipairs(roads) do
        local points = v:getPoints()
        for i2, point in ipairs(points) do
            if math.abs(x - point[1]) <= MapConstants.MAP_TILE_SIZE
                and math.abs(y - point[2]) <= MapConstants.MAP_TILE_SIZE then
                -- x,y 两者的差都在格子的大小内，则表示x,y是在road里面的
                return true
            end
        end
    end
    return false

    -- local endPosX,endPosY = self:xyConvToGrid(x,y)

    -- local endNode = self.grid_:getNode(endPosX, endPosY)
    -- if (endNode==nil) then
       
    --     return false
    -- end
    -- if( endNode.walkable == false ) then
    --     return false
    -- end
    -- return true
end

-- 通过A星算法，获得一个新的路径
function Map:newAstarPath(srcx,srcy,x,y,replace)
    -- print("--------------------------------------------------------------")
    -- print("代码点 Map:newAstarPath")
    local replace = replace or false
    local playerX,playerY = srcx,srcy

    local startPosX,startPosY = self:xyConvToGrid(playerX,playerY)

    local startNode = self.grid_:getNode(startPosX, startPosY)

    local endPosX,endPosY = self:xyConvToGrid(x,y)
 
    local endNode = self.grid_:getNode(endPosX, endPosY)
    if (endNode==nil) then
        print("end node is nil")
        return nil
    end
    if endNode.walkable == false then
        if replace then
            self.replacer = self.grid_:findReplacer(startNode, endNode)
            if self.replacer then
                endPosX = self.replacer.x
                endPosY = self.replacer.y
            else
                print("can't find replacer 3")
                return nil
            end
        else
           print("no path find 2")
            return nil
        end
    end
    self.grid_:setStartNode(startPosX, startPosY)
    self.grid_:setEndNode(endPosX, endPosY)
    local state = { points = {}}
    
    local pathObject = self:newObject("apath",state)
    pathObject:appendPoint(srcx,srcy)
    local astar = AStar:create()
    -- print("AStar:create() --------- 1")
    if astar:findPath(self.grid_)  then
        -- print("AStar:create() --------- 2")
        local path = astar:getFloydPath()
        --得到平滑路径
        astar:floyd()
        local path_x , path_y = 0,0 
        -- 把CCArray中废弃的方法，封装成自己的方法
        -- for i =1,path:count()-1 do
        for i =1,astar:getCount()-1 do
            -- local node = tolua.cast(path:objectAtIndex(i),"ANode")
            local node = astar:getNodeAtIndex(i)
            -- path_x,path_y = self:gridConvToXY(node.x,node.y)
            path_x,path_y = self:gridConvToXY(node:getX(),node:getY())
            pathObject:appendPoint(path_x, path_y)

        end
        if pathObject:getPointsCount() > 1 then
            -- print("AStar:create() --------- 3")
            return pathObject
        else    
            self:checkUnbindPath(pathObject:getId())
            -- print("no path point count <=1  ")
            return nil
        end
    else
        print(string.format("cant find path 1 ({1}) ({2}) ({3}) ({4}) ({5})", srcx, srcy, x, y, replace))
        return nil
    end
end

------------------------------------------- A*寻路 End ------------------------------------------------

--[[--

获取指定路径开始，下一个点的坐标
reverseAtEnd这个参数两个地方传进来的都是true,
返回的movingForward是没有用到的.

一个是在MovableBehavior:setNextPosition中调用的这个函数
一个在MovableBehavior:getFuturePosition中调用，这个是在CurvedBulletBase:fireBegan()
    中调用，用来计算子弹的掉落位置

return nil,表示没有pathId了，不在行走，然后上述两个调用函数中单独处理返回nil的情况
    在setNextPosition中，可以设置走到了终点以后的特殊处理

]]
function Map:getNextPointIndexOnPath(pathId, pointIndex, movingForward, reverseAtEnd)
    local path = self:getObject(pathId)

    -- if movingForward then
        pointIndex = pointIndex + 1
        local count = path:getPointsCount()
        if pointIndex > count then
            pointIndex = count
            if reverseAtEnd then
                -- 如果初始点和末尾点的距离小于20个像素，那么就认为是一个环形的地图
                local endPointX, endPointY = path:getPoint(pointIndex)
                local beginPointX, beginPointY = path:getPoint(1)
                local dist = math2d.dist(endPointX, endPointY, beginPointX, beginPointY)
                if dist < 10 and path.default_ then
                    -- 让怪物移动到第一个点去
                    pointIndex = 1
                    movingForward = false
                else
                    -- 让怪物从最后一个点逆着走回出生点
                    -- pointIndex = pointIndex - 1
                    -- movingForward = false
                    -- 让怪物停在最后一个点上
                    return nil,pointIndex,movingForward
                end
            end
        end
    -- else
    --     pointIndex = pointIndex - 1
    --     if pointIndex < 1 then
    --         pointIndex = 1
    --         if reverseAtEnd then
    --             pointIndex = 2
    --             movingForward = true
    --         end
    --     end
    -- end

    return path, pointIndex, movingForward
end

--[[--

建立地图的视图

]]
function Map:createView(parent)
    assert(self.batch_ == nil, "Map:createView() - view already created")

    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565)
    self.bgSprite_ = display.newSprite(self.imageName_)
    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

    self.bgSprite_:addNodeEventListener(cc.NODE_EVENT, function(event)
        -- 地图对象删除时，自动从缓存里卸载地图材质
        if event.name == "exit" then
            display.removeSpriteFrameByImageName(self.imageName_)
        end
    end)

    self.bgSprite_:align(display.LEFT_BOTTOM, 0, 0)
    parent:addChild(self.bgSprite_)
    -- self.bgSprite_:setScale(0.5)

    -- self.batch_ = display.newBatchNode("SheetMapBattle.png", 1000)
    self.batch_ = display.newNode()
    parent:addChild(self.batch_)

    self.marksLayer_ = display.newNode()
    parent:addChild(self.marksLayer_)

    if self.debug_ then
        self.debugLayer_ = display.newNode()
        parent:addChild(self.debugLayer_)
    end

    for id, object in pairs(self.objects_) do
        object:createView(self.batch_, self.marksLayer_, self.debugLayer_)
        object:updateView()
    end

    self:setAllObjectsZOrder()
end

--[[--

删除视图

]]
function Map:removeView()
    assert(self.batch_ ~= nil, "Map:removeView() - view not exists")

    for id, object in pairs(self.objects_) do
        if object:isViewCreated() then object:removeView() end
    end

    self.bgSprite_:removeSelf()
    self.batch_:removeSelf()
    self.marksLayer_:removeSelf()
    if self.debugLayer_ then self.debugLayer_:removeSelf() end

    self.bgSprite_   = nil
    self.batch_      = nil
    self.marksLayer_ = nil
    self.debugLayer_ = nil
end

--[[--

调用地图中所有对象的 updateView()

]]
function Map:updateView()
    assert(self.batch_ ~= nil, "Map:removeView() - view not exists")

    for id, object in pairs(self.objects_) do
        object:updateView()
    end
end

--[[--

按照 Y 坐标重新排序所有可视对象

]]
function Map:setAllObjectsZOrder()
    local batch = self.batch_
    for id, object in pairs(self.objects_) do
        local view = object:getView()
        if view then
            if object.viewZOrdered_ then
                batch:reorderChild(view, MapConstants.MAX_OBJECT_ZORDER - object.y_)
            elseif type(object.zorder_) == "number" then
                batch:reorderChild(view, object.zorder_)
            else
                batch:reorderChild(view, MapConstants.DEFAULT_OBJECT_ZORDER)
            end
            object:updateView()
        end
    end
end

--[[--

返回背景图

]]
function Map:getBackgroundLayer()
    return self.bgSprite_
end

--[[--

返回地图的批量渲染层

]]
function Map:getBatchLayer()
    return self.batch_
end

--[[--

返回用于显示地图标记的层

]]
function Map:getMarksLayer()
    return self.marksLayer_
end

--[[--

放回用于编辑器的批量渲染层

]]
function Map:getDebugLayer()
    return self.debugLayer_
end

-- 获得国王
function Map:getKing()
    return self:getRanges(RangeObject.TYPE_CASTLE)[1]
end

-- 获取当前地图所有 RangeObject
function Map:getRanges(type)
    local result = {}
    for i, range in pairs(self:getObjectsByClassId("rangeobject")) do
        if (range:getRangeType() == type) then
            result[#result + 1] = range
        end
    end
    return result
end

-- 根据门 ID 获得对应的 RangeObject
function Map:getGateByGateID(gateid)
    local objects = self:getObjectsByClassId("rangeobject")
     for i,object in pairs(objects) do
        if object.gateId_ == gateid then
           return object
        end
    end
end

function Map:getPathIdByGateID(gateid)
    local gateObj = nil

    local objects = self:getObjectsByClassId("rangeobject")
    local ids = nil
    for i,object in pairs(objects) do
        if object.gateId_ == gateid then
            ids =  object.pathIds_ 
            gateObj = object
            break
        end
    end
    if (#ids == 0) then
        return nil
    end
    local id = math.random(1, #ids)
    if self.lastpid_ then
        for i=1,10 do
            if id == self.lastpid_ then
                id = math.random(1, #ids)
            else
                break
            end
        end
    end
    self.lastpid_ = id
    return ids[id]
end


function Map:getGatesByType(type)
    local objects = self:getObjectsByClassId("rangeobject")
    local result = {}
    for i,object in pairs(objects) do
        if object.rangeType_ == type then
            result[#result+1] = object
        end
    end
    return result
end

function Map:getGateByID(gateid)
    local objects = self:getObjectsByClassId("rangeobject")
    for i,object in pairs(objects) do
        if object.gateId_ == gateid then
            return object 
        end
    end
    return nil
end

-- 设置地图禁止拖动
function Map:enableIgnoredMove(flag)
    flag = checkbool(flag)
    self.camera_:enableIgnoredMove(flag)
end

function Map:setUILayer(ui)
    self.uiLayer = ui
end

--[[--

返回地图的数据

]]
function Map:vardump()
    local state = {
        objects   = {},
        size      = {width = self.width_, height = self.height_},
        imageName = self.imageName_,
    }
    for id, object in pairs(self.objects_) do
        -- change by Owen, 2015.7.8, 不把英雄存进去，这个函数只在EditorScene中被调用
        if object:hasBehavior("HeroBehavior") == false then
            state.objects[id] = object:vardump()
        end
    end
    return state
end

--[[--

导出地图数据

]]
function Map:dump()
    local lines = {}

    lines[#lines + 1] = ""
    lines[#lines + 1] = string.format("------------ MAP %s ------------", self.id_)
    lines[#lines + 1] = ""
    lines[#lines + 1] = "local map = {}"
    lines[#lines + 1] = ""
    lines[#lines + 1] = string.format("map.size = {width = %d, height = %d}", self.width_, self.height_)
    lines[#lines + 1] = string.format("map.imageName = \"%s\"", self.imageName_)
    lines[#lines + 1] = ""

    -- objects
    -- dump(self.objects_, "dump self.objects_")
    local allid = table.keys(self.objects_)
    table.sort(allid)
    lines[#lines + 1] = "local objects = {}"
    for i, id in ipairs(allid) do
        -- change by Owen, 2015.6.19, 英雄不写到地图数据里面
        if (not self.objects_[id]:hasBehavior("HeroBehavior")) then
            lines[#lines + 1] = ""
            lines[#lines + 1] = self.objects_[id]:dump("local object")
            lines[#lines + 1] = string.format("objects[\"%s\"] = object", id)
            lines[#lines + 1] = ""
            lines[#lines + 1] = "----"
        end
    end
    lines[#lines + 1] = ""
    lines[#lines + 1] = "map.objects = objects"
    lines[#lines + 1] = ""
    lines[#lines + 1] = "return map"
    lines[#lines + 1] = ""
    return table.concat(lines, "\n")
end

--[[--

从 package.path 中查找指定模块的文件名，如果失败返回 false。

@param string moduleName
@return string

]]
function Map:findModulePath(moduleName)
    print("Map:findModulePath(moduleName) moduleName = "..tostring(moduleName))
    local filename = string.gsub(moduleName, "%.", "/") .. ".lua"
    local paths = string.split(package.path, ";")
    -- dump(paths, "dump map paths")

    -- 给策划的找文件版本
    -- for i, path in ipairs(paths) do
    --         print(" path 0 = "..tostring(path))
    --     if string.sub(path, -5) == "?.lua" then
    --         path = string.sub(path, 1, -6)
    --         print(" path 1 = "..tostring(path))
    --         if not string.find(path, "?", 1, true) then
    --             print(" path 2 = "..tostring(path))
    --             -- add 
    --             path = string.sub(path, 1, -5)
    --             path = path.."src/"
    --             -- add end

    --             local fullpath = path .. filename
    --             print("fullpath = "..tostring(fullpath))
    --             if io.exists(fullpath) then
    --                 return fullpath
    --             end
    --         end
    --     end
    -- end
    -- return false

    -- 自己用的找文件版本
    for i, path in ipairs(paths) do
        print("path = "..tostring(path))
        -- 在windows平台下面，路径有问题，不能做这个判定
        if device.platform == "windows" or string.sub(path, -5) == "?.lua" then
            if device.platform ~= "windows" then
                path = string.sub(path, 1, -6)
            end
            if not string.find(path, "?", 1, true) then

                local fullpath = path .. filename
                print("fullpath = "..tostring(fullpath))
                if device.platform == "windows" then
                    fullpath = "F:/SVN/cehua/src/src/"..path..filename
                    -- fullpath = "E:/work/towerdefence/runtime/win32/src/"..path..filename
                end
                print("fullpath = "..tostring(fullpath))
                if io.exists(fullpath) then
                    return fullpath
                end
            end
        end
    end

    -- for i, path in ipairs(paths) do
    --     if string.sub(path, -5) == "?.lua" then
    --         print("path 1  = "..tostring(path))
    --         path = string.sub(path, 1, -6)
    --         print("path 2 = "..tostring(path))
    --         if not string.find(path, "?", 1, true) then
    --             local fullpath = path .. filename
    --             print("fullpath = "..tostring(fullpath))
    --             -- if io.exists(fullpath) then
    --                 return fullpath
    --             -- end
    --         end
    --     end
    -- end
    return false
end

--[[--

导出地图数据到文件

]]
function Map:dumpToFile()
    local contents = self:dump()
    local path = self:findModulePath(self.mapModuleName_)
    if path then
        printf("save data filename \"%s\" [%s]", path, os.date("%Y-%m-%d %H:%M:%S"))
        io.writefile(path, contents)
        return true
    else
        printf("not found module file, dump [%s]", os.date("%Y-%m-%d %H:%M:%S"))
        -- echo("\n\n" .. contents .. "\n")
        -- local tipStr = "not found module file, os.date = "..tostring(os.date("%Y-%m-%d %H:%M:%S"))
        -- local tip = Tips.new({text=tipStr,showBg=false})
        -- self.bgSprite_:addChild(tip)
        local testLabel_ = cc.ui.UILabel.new({
            UILabelType = 1,
            text = "Error not found module file, dump [%s]"..tostring(os.date("%Y-%m-%d %H:%M:%S")),
            font = "UIFont.fnt",
            -- x = display.cx - 100,
            -- y = display.top - 140,
            x = display.cx - 200,
            y = display.cy,
        })
        self.bgSprite_:addChild(testLabel_)
        return false
    end
end

--[[--

重置地图状态

]]
function Map:reset(state)
    self:removeAllObjects()
    if self:isViewCreated() then self:removeView() end

    self.data_ = clone(state)
    self.ready_ = false
    self:init()
end

return Map
