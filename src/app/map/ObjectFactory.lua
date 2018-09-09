
local StaticObject  = require("app.map.StaticObject")
local TowerObject   = require("app.map.TowerObject")
local Path          = require("app.map.Path")
local Range         = require("app.map.Range")
local TowerLocation = require("app.map.TowerLocation")
local ObjectType    = require("app.map.ObjectType")
local RangeObject   = require("app.map.RangeObject")
local Road          = require("app.map.Road")
local AreaObject    = require("app.map.skills.AreaObject")

--[[
    在ObjectFactory文件中主要定义了这个函数。 
    输入4个参数classId,id,state,map. 
    根据map是否是debug，设置变量debug.  
    根据classId的三个字符串static,path,range设置3条执行路径。 
    分别是  StaticObject.new(id, state, map) 
            Path.new(id, state, map) 
            Range.new(id, state, map)  
    注：StaticObject，Path，Range都是基于ObjectBase的 类, 
    最后返回得到一个object对象，
    然后调用object:init(). 
    如果不是三个字符串static,path,range字符串中一个则退出。 
    此外还判断是否是isDebug，
    如果是调试则分别执行:  
    object:bindBehavior("StaticObjectEditorBehavior") 
    object:bindBehavior("PathEditorBehavior") 
    object:bindBehavior("RangeEditorBehavior") 
]]

local ObjectFactory = {}

ObjectFactory.ObjectClassIdEnum = {
    Decoration = "decoration",
    RangeObject = "rangeobject",
    Path = "path"
}

function ObjectFactory.newObject(classId, id, state, map)
    local debug = map:isDebug()
    local object

    if classId == "static" then
        -- TO-DO 手机版通过这个让地图中展示的元素保持设计大小
        -- state.scale = 2.0
        object = StaticObject.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("StaticObjectEditorBehavior")
        end
    elseif classId == "towerobject" then
        -- print("ObjectFactory.newObject classId == towerobject")
        -- 新建一个塔
        object = TowerObject.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("TowerObjectEditorBehavior")
        end
    -- elseif classId == "path" then
    -- add by Owen, 2015.5.5, for AStar path  begin 
    elseif classId == "path" or classId == "apath" then
         
        if classId == "apath" then
            state.default = false
        else
            state.default = true
        end
        -- add by Owen, 2015.5.5, for AStar path  end
        
        object = Path.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("PathEditorBehavior")
        end

    elseif classId == "range" then    -- 这种类型已经废弃了，游戏中不会新建range
        object = Range.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("RangeEditorBehavior")
        end
    elseif classId == "towerlocation" then
        -- 可以造塔的坑位
        object = TowerLocation.new(id, state, map)
        object:init()
        object:bindBehavior("TowerLocationBehavior")
        
        if debug then
            object:bindBehavior("TowerLocationEditorBehavior")
        end
    elseif classId == "rangeobject" then
        object = RangeObject.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("RangeObjectEditorBehavior")
        end
    elseif classId == "areaobject" then
        -- add by Owen, 2015.8.19, 
        object = AreaObject.new(id, state, map)
        object:init()
        -- if debug then
        --     object:bindBehavior("RangeObjectEditorBehavior")
        -- end
    elseif classId == "road" then
        -- 新建可行走的区域    
        object = Road.new(id, state, map)
        object:init()
        if debug then
            object:bindBehavior("RoadEditorBehavior")
        end
    else
        assert(false, string.format("Map:newObject() - invalid classId %s", tostring(classId)))
    end

    return object
end

return ObjectFactory
