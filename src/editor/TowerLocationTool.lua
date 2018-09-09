
local ToolBase = require("editor.ToolBase")
local TowerLocationTool = class("TowerLocationTool", ToolBase)
local ObjectType = require("app.map.ObjectType")

function TowerLocationTool:ctor(toolbar, map)
    TowerLocationTool.super.ctor(self, "TowerLocationTool", toolbar, map)

    self.currentRange_ = nil
    self.drag_         = nil

    -- self.buttons = {
    --     {
    --         name          = "CreateStandRange",
    --         image         = "#CreateRangeButton.png",
    --         imageSelected = "#CreateRangeButtonSelected.png",
    --     },
    --     {
    --         name          = "SelectStandRange",
    --         image         = "#SelectRangeButton.png",
    --         imageSelected = "#SelectRangeButtonSelected.png",
    --     },
    --     {
    --         name          = "RemoveStandRange",
    --         image         = "#RemoveRangeButton.png",
    --         imageSelected = "#RemoveRangeButtonSelected.png",
    --     }
    -- }
    self.buttons = {
        {
            name          = "CreateStandRange",
            image         = "#MapEditor.CreateStandRangeButton",
            imageSelected = "#MapEditor.CreateStandRangeButtonSelected",
        },
        {
            name          = "SelectStandRange",
            image         = "#MapEditor.SelectStandRangeButton",
            imageSelected = "#MapEditor.SelectStandRangeButtonSelected",
        },
        {
            name          = "RemoveStandRange",
            image         = "#MapEditor.RemoveStandRangeButton",
            imageSelected = "#MapEditor.RemoveStandRangeButtonSelected",
        }
    }
end

function TowerLocationTool:selected(selectedButtonName)
    TowerLocationTool.super.selected(self, selectedButtonName)
    -- map 里面还没有实现这个方法
    -- self.map_:enableIgnoredMove(true)
    if selectedButtonName ~= "SelectRange" then
        self:setCurrentRange()
    end
end

function TowerLocationTool:unselected()
    self:setCurrentRange()
end

function TowerLocationTool:setCurrentRange(range)
    print("TowerLocationTool:setCurrentRange(range) 1")
    if self.currentRange_ and self.currentRange_ ~= range then
        print("TowerLocationTool:setCurrentRange(range) 2")
        self.currentRange_:setSelected(false)
        self.currentRange_:updateView()
    end
    print("TowerLocationTool:setCurrentRange(range) 3")
    self.currentRange_ = range
    self.currentRangeResize_ = nil
    if range then
        print("TowerLocationTool:setCurrentRange(range) 4")
        range:setSelected(true)
        range:updateView()
         self.toolbar_:dispatchEvent({name = "SELECT_STANDRANGE",object = range})
    end
end

function TowerLocationTool:onTouchCreateStandRange(event, x, y)
    if event == "began" then
        local range = self.map_:newObject(ObjectType.TOWER_LOCATION, {x = x, y = y})
        self:setCurrentRange(range)
        self.toolbar_:selectButton("TowerLocationTool", 2)
        return true
    end
end

function TowerLocationTool:onTouchSelectStandRange(event, x, y)
    print("TowerLocationTool:onTouchSelectStandRange(event, x, y)")
    if event == "began" then
        if self.currentRange_ and self.currentRange_:checkPointInHandler(x, y) then
            self.currentRangeResize_ = {lastX = x}
            return true
        end

        for id, range in pairs(self.map_:getObjectsByClassId(ObjectType.TOWER_LOCATION)) do
            print("id, range in pairs(self.map_:getObjectsByClassId")
            if range:checkPointIn(x, y) then
                self:setCurrentRange(range)
                local rangeX, rangeY = range:getPosition()
                self.drag_ = {
                    startX  = rangeX,
                    startY  = rangeY,
                    offsetX = rangeX - x,
                    offsetY = rangeY - y
                }
                return true
            end
        end

        return TowerLocationTool.TOUCH_IGNORED

    elseif event == "moved" then
        if not self.currentRangeResize_ then
            local nx, ny = x + self.drag_.offsetX, y + self.drag_.offsetY
            self.currentRange_:setPosition(nx, ny)
            self.currentRange_:updateView()
        else
            local offset = x - self.currentRangeResize_.lastX
            self.currentRangeResize_.lastX = x
            self.currentRange_:setRadius(self.currentRange_:getRadius() + offset)
            self.toolbar_:dispatchEvent({name = "UPDATE_STANDRANGE",object = self.currentRange_})
            self.currentRange_:updateView()
        end
    end 
end

function TowerLocationTool:onTouchRemoveStandRange(event, x, y)
    print("TowerLocationTool:onTouchRemoveStandRange(event, x, y)")
    if event == "began" then
        for id, range in pairs(self.map_:getObjectsByClassId(ObjectType.TOWER_LOCATION)) do
            if range:checkPointIn(x, y) then
                self:setCurrentRange()
                self.map_:removeObject(range)
                return false
            end
        end
        return TowerLocationTool.TOUCH_IGNORED
    end
end

function TowerLocationTool:onTouch(event, x, y)

  
    
    local x, y = self.map_:getCamera():convertToMapPosition(x, y)

    if self.selectedButtonName_ == "CreateStandRange" then
        return self:onTouchCreateStandRange(event, x, y)
    elseif self.selectedButtonName_ == "SelectStandRange" then
        return self:onTouchSelectStandRange(event, x, y)
    elseif self.selectedButtonName_ == "RemoveStandRange" then
        return self:onTouchRemoveStandRange(event, x, y)
    end
end

return TowerLocationTool
