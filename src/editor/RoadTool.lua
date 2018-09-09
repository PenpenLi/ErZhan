
local EditorConstants = require("editor.EditorConstants")
local ToolBase = require("editor.ToolBase")
local RoadTool = class("RoadTool", ToolBase)

function RoadTool:ctor(toolbar, map)
    RoadTool.super.ctor(self, "RoadTool", toolbar, map)

    self.currentPointIndex_ = nil
    self.buttons = {
        {
            name          = "AddRoad",
            image         = "#MapEditor.CreateRoadtileButton",
            imageSelected = "#MapEditor.CreateRoadtileButtonSelected",
        },
        {
            name          = "ChangeRoad",
            image         = "#MapEditor.CreateRoadtileButton",
            imageSelected = "#MapEditor.CreateRoadtileButtonSelected",
        },
        {
            name          = "CreateRoadtile",
            image         = "#MapEditor.CreateRoadtileButton",
            imageSelected = "#MapEditor.CreateRoadtileButtonSelected",
        },
        {
            name          = "RemoveRoadtile",
            image         = "#MapEditor.RemoveRoadtileButton",
            imageSelected = "#MapEditor.RemoveRoadtileButtonSelected"
        },
    }

    self.road = nil
end

-- 设置当前编辑的 Road
function RoadTool:setRoad(value)
    self.road = value
end

-- 获得当前编辑的 Road
function RoadTool:getRoad()
    return self.road
end

function RoadTool:checkPointAtRoadtile(x, y)
    for id, Roadtile in pairs(self.map_:getObjectsByClassId("road")) do
        local index = Roadtile:checkPointAtPoint(x, y)
        if index then return Roadtile, index end
    end
    return nil
end

function RoadTool:onTouch(event, x, y)
    
    -- 设置地图禁止拖动
    self.map_:enableIgnoredMove(true)

    local x, y = self.map_:getCamera():convertToMapPosition(x, y)
    print(string.format("source = %s-%s",x,y))

    x = math.floor(x/EditorConstants.MAP_ROADTILE_WIDTH)*EditorConstants.MAP_ROADTILE_WIDTH + EditorConstants.MAP_ROADTILE_WIDTH/2.0
    y = math.floor(y/EditorConstants.MAP_ROADTILE_WIDTH)*EditorConstants.MAP_ROADTILE_WIDTH + EditorConstants.MAP_ROADTILE_WIDTH/2.0

    print(string.format("result = %s-%s",x,y))


    if self.selectedButtonName_ == "CreateRoadtile" then
        return self:onTouchCreateRoadtile(event, x, y)

    elseif self.selectedButtonName_ == "RemoveRoadtile" then
        return self:onTouchRemoveRoadtile(event, x, y)
    end 
end

-- 选中了下面的一个按钮后，就会调用这个函数
function RoadTool:selected(selectedButtonName)
    RoadTool.super.selected(self, selectedButtonName)

    if selectedButtonName == "AddRoad" then
        self:onAddRoad()
    elseif selectedButtonName == "ChangeRoad" then
        self:onChangeRoad()
    end
end

function RoadTool:unselected()
end

function RoadTool:onAddRoad()
    print("RoadTool:onAddRoad")
    self:setRoad(self.map_:newRoad())
    -- new 了一个road以后，把工具栏切到添加可行走区域的那里
    self.toolbar_:selectButton("RoadTool", 3)
end

function RoadTool:onChangeRoad()
    print("RoadTool:onChangeRoad")
    local roads = table.values(self.map_:getObjectsByClassId("road"))

    -- 确保id数字小的排在前面
    table.sort(roads, function (a, b)
        -- id_ = "road:8", 我们截取后面的数字
        local a_id = string.sub(a.id_, 6, -1)
        local b_id = string.sub(b.id_, 6, -1)
        print("a_id = "..tostring(a_id).." b_id = "..tostring(b_id))
        return tonumber(a_id) < tonumber(b_id)
    end)
    -- dump(roads, "RoadTool:onChangeRoad dump roads")

    local curRoadId = self.road:getId()
    local nexRoad
    for i, road in ipairs(roads) do
        print("road:getId() = "..tostring(road:getId()).." i = "..tostring(i))
        if curRoadId == road:getId() then
            -- 获得当前道路后面的那条路
            print("获得当前道路后面的那条路")
            if i < #roads then
                nextRoad = roads[i+1]
            else 
                nextRoad = roads[1]
            end
            break
        end
    end
    self:setRoad(nextRoad)
    self.toolbar_:selectButton("RoadTool", 3)

end

function RoadTool:onTouchCreateRoadtile(event, x, y)
    if event == "began" or  event == "moved" then
        if self:checkPointAtRoadtile(x,y) == nil then
            self.road:appendPoint(x, y)
            self.road:updateView()
        end
        return true
    end
end



function RoadTool:onTouchRemoveRoadtile(event, x, y)
    if event == "began" or event == "moved" then
        local index = self.road:checkPointAtPoint(x, y)
        if index then
            -- 删除选中的点
            self.road:removePoint(index)
            
            self.road:updateView()
            
            return false
        end

        return RoadTool.TOUCH_IGNORED
    end
end

function RoadTool:setInfo(value)

    -- dp 用来储存当前地图中所有的road
    local dp = {}
    
    local roads = table.values(self.map_:getObjectsByClassId("road"))

    -- 确保默认项排到第一个
    table.sort(roads, function (a, b)
        return a:getIsDefault() and not b:getIsDefault()
    end)

    for i, road in ipairs(roads) do
        local label = road:getId()
        if (road:getIsDefault()) then
            label = label .. "*"
        end
        dp[#dp + 1] = {label=format(LABEL_FORMAT, label, road.color), data=road:getId()}
    end

    -- 增加道路
    -- dp[#dp + 1] = {label=format(LABEL_FORMAT, "+", "#666666"), onClick=function (who)
    --     who:setIsToggled(false)
    --     self:addRoad()
    -- end}

    -- self.buttonBar:setDataProvider(dp)
    -- self.buttonBar:setSelectedIndex(1, false, true)
end

return RoadTool
