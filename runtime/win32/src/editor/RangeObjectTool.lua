local StaticObjectsProperties = require("app.properties.StaticObjectsProperties")
local RangeObjectsProperties  = require("app.properties.RangeObjectsProperties")
local math2d = require("math2d")
local ToolBase = require("editor.ToolBase")
local GlobalData            = require("tools.GlobalData")
local CsbAni                = require("app.map.spine.CsbAni")
local RangeObject           = require("app.map.RangeObject")
local RangeObjectTool = class("RangeObjectTool", ToolBase)

RangeObjectTool.TOOLBOX_PADDING     = 118 -- 98
RangeObjectTool.TOOLBOX_ICON_SIZE   = 116 -- 96
RangeObjectTool.TOOLBOX_MAX_COLUMNS = 8
RangeObjectTool.TOOLBOX_ZORDER      = 20000


-- 点击以后，有个一对话框，可以选择不同样式的Range/NPC
function RangeObjectTool:ctor(toolbar, map)
    RangeObjectTool.super.ctor(self, "RangeObjectTool", toolbar, map)

    self.currentRangeObject_ = nil
    self.drag_         = nil

    self.buttons = {
        -- {
        --     name          = "CreateRangeObject",
        --     image         = "#MapEditor.CreateNpcButton",
        --     imageSelected = "#MapEditor.CreateNpcButtonSelected",
        -- },
        -- {
        --     name          = "SelectRangeObject",
        --     image         = "#MapEditor.SelectNpcButton",
        --     imageSelected = "#MapEditor.SelectNpcButtonSelected",
        -- },
        -- {
        --     name          = "RemoveRangeObject",
        --     image         = "#MapEditor.RemoveNpcButton",
        --     imageSelected = "#MapEditor.RemoveNpcButtonSelected",
        -- }
        {
            name          = "CreateRangeObject",
            image         = "#MapEditor.CreateNpcButton",
            imageSelected = "#MapEditor.CreateNpcButtonSelected",
        },
        {
            name          = "SelectRangeObject",
            image         = "#MapEditor.SelectNpcButton",
            imageSelected = "#MapEditor.SelectNpcButtonSelected",
        },
        {
            name          = "RemoveRangeObject",
            image         = "#MapEditor.RemoveNpcButton",
            imageSelected = "#MapEditor.RemoveNpcButtonSelected",
        }
    }
end

function RangeObjectTool:selected(selectedButtonName)
    RangeObjectTool.super.selected(self, selectedButtonName)
    -- self.map_:enableIgnoredMove(true)
    if selectedButtonName ~= "SelectRangeObject" then
        self:setCurrentRangeObject()
    end
    self:removeToolbox()
end

function RangeObjectTool:unselected()
    print("RangeObjectTool:unselected()")
    self:setCurrentRangeObject()
    self:removeToolbox()
end

function RangeObjectTool:setCurrentRangeObject(rangeObject)
    if self.currentRangeObject_ and self.currentRangeObject_ ~= rangeObject then
        self.currentRangeObject_:setSelected(false)
        self.currentRangeObject_:updateView()
        self.toolbar_:dispatchEvent({name = "UNSELECT_RANGE"})
    end
    self.currentRangeObject_ = rangeObject
    self.currentRangeObjectResize_ = nil
    if rangeObject then
        rangeObject:setSelected(true)
        rangeObject:updateView()
        
          self.toolbar_:dispatchEvent({name = "SELECT_RANGE",object = rangeObject})
    end
    
end

function RangeObjectTool:onTouchCreateRangeObject(event, x, y)
    if event == "began" then
--        local RangeObject = self.map_:newObject("rangeobject", {x = x, y = y})
--        self:setCurrentRangeObject(RangeObject)
--        self.toolbar_:selectButton("RangeObjectTool", 2)
--        return true
         if not self.toolbox_ then
            self:removeToolbox()
            self:showToolbox(x, y)
            return false
        else
            local object = self.toolbox_:checkPoint(x, y)
            if object then
                self:setCurrentRangeObject(object)
                self:removeToolbox()
                self.toolbar_:selectButton("RangeObjectTool", 2)
                return true
            end
            return RangeObjectTool.TOUCH_IGNORED
        end
    end
end

function RangeObjectTool:onTouchSelectRangeObject(event, x, y)
    if event == "began" then
        if self.currentRangeObject_ and self.currentRangeObject_:checkPointInHandler(x, y) then
            self.currentRangeObjectResize_ = {lastX = x}
            return true
        end

        for id, RangeObject in pairs(self.map_:getObjectsByClassId("rangeobject")) do
            if RangeObject:checkPointIn(x, y) then
                self:setCurrentRangeObject(RangeObject)
                local RangeObjectX, RangeObjectY = RangeObject:getPosition()
                self.drag_ = {
                    startX  = RangeObjectX,
                    startY  = RangeObjectY,
                    offsetX = RangeObjectX - x,
                    offsetY = RangeObjectY - y
                }
                -- RangeObject:openGate()
                return true
            end
        end

        return RangeObjectTool.TOUCH_IGNORED

    elseif event == "moved" then
    
        
        
        if not self.currentRangeObjectResize_ then
            if not self.drag_ then return end
            local nx, ny = x + self.drag_.offsetX, y + self.drag_.offsetY
            self.currentRangeObject_:setPosition(nx, ny)
            self.currentRangeObject_:updateView()
            
        else
            local offset = x - self.currentRangeObjectResize_.lastX
            self.currentRangeObjectResize_.lastX = x
            self.currentRangeObject_:setRadius(self.currentRangeObject_:getRadius() + offset)
            self.currentRangeObject_:updateView()
           
            
        end
    elseif event == "ended" then
        -- 发这个信号出去，会实时的跟新ObjectTool页面上显示的物体信息
        self.toolbar_:dispatchEvent({name = "UPDATE_RANGE", object = self.currentRangeObject_})
        if not self.currentRangeObject_ then return end
        local ids = {}
        for id, path in pairs(self.map_:getObjectsByClassId("path")) do
           local px,py = path:getPoint(1)
           if math2d.dist(x,y,px,py) <= self.currentRangeObject_:getRadius() then
                ids[#ids+1] = path:getId()
           end
           
        end
        self.currentRangeObject_:addPathIds(ids)
    end
end



function RangeObjectTool:onTouchRemoveRangeObject(event, x, y)
    if event == "began" then
        for id, rangeObject in pairs(self.map_:getObjectsByClassId("rangeobject")) do
            if rangeObject:checkPointIn(x, y) then
                self:setCurrentRangeObject()
                self.map_:removeObject(rangeObject)
                return false
            end
        end
        return RangeObjectTool.TOUCH_IGNORED
    end
end

function RangeObjectTool:onTouch(event, x, y)


    
    local x, y = self.map_:getCamera():convertToMapPosition(x, y)

    if self.selectedButtonName_ == "CreateRangeObject" then
        return self:onTouchCreateRangeObject(event, x, y)
    elseif self.selectedButtonName_ == "SelectRangeObject" then
        return self:onTouchSelectRangeObject(event, x, y)
    elseif self.selectedButtonName_ == "RemoveRangeObject" then
        return self:onTouchRemoveRangeObject(event, x, y)
    end
end


function RangeObjectTool:removeToolbox()
    if self.toolbox_ then
        self.toolbox_:removeSelf()
        self.toolbox_ = nil
    end
end

function RangeObjectTool:showToolbox(mapX, mapY)
    print("RangeObjectTool:showToolbox(mapX, mapY)")
    assert(self.toolbox_ == nil)
    local layer = display.newNode()
    layer:setPosition(mapX, mapY)

    -- local allIds = StaticObjectsProperties.getRangeIds(self.map_.id_)
    -- 改为基于image

    -- 改成跟ObjectTool一样，后期再根据image来读
    -- local allIds = StaticObjectsProperties.getRangeIdsByMapName(self.map_.imageName_)
    -- local allIds = StaticObjectsProperties.getRangeIds()
    local allIds = RangeObjectsProperties.getAllIds()

    -- add by Owen, 2016.5.3, 把不是这张地图、这个模式的打野元素，从allIds中删除
    for i = #allIds, 1, -1 do
        local define = RangeObjectsProperties.get(allIds[i])
        
        -- add by owen, 2016.3.18, 增加打野元素的判定，只显示这一关这一模式的打野元素
        if define.rangeType == RangeObject.DAYE_RANGE then
            local isThisMap = false
            for i2, v2 in pairs(define.mapId) do
                if v2 == self.map_.id_ then
                    print("这个打野元素是属于这张地图里面的")
                    isThisMap = true
                    break
                end
            end

            local isThisMode = false
            for i2, v2 in pairs(define.modeId) do
                if v2 == GlobalData.getGameMode() then
                    print("这个打野元素是属于这个模式里面的")
                    isThisMode = true
                    break
                end
            end

            if not isThisMap
                or not isThisMode then
                table.remove(allIds, i)
            end

            -- if not isThisMode then
            --     table.remove(allIds, i)
            -- end
        end
    end

    -- print("----------------------------------------------------------------------------------------------------")
    -- print(format("RangeObjectTool:showToolbox imageName({1})", self.map_.imageName_))
    -- print("----------------------------------------------------------------------------------------------------")
    local count = #allIds
    local maxColumns = math.ceil(math.sqrt(count))
    if maxColumns > RangeObjectTool.TOOLBOX_MAX_COLUMNS then
        maxColumns = RangeObjectTool.TOOLBOX_MAX_COLUMNS
    end
    local rows = math.ceil(count / maxColumns)
    local columns = maxColumns
    if count < maxColumns then columns = count end

    local x = -(columns / 2) * RangeObjectTool.TOOLBOX_PADDING + RangeObjectTool.TOOLBOX_PADDING / 2
    local y = (rows / 2) * RangeObjectTool.TOOLBOX_PADDING - RangeObjectTool.TOOLBOX_PADDING / 2
    local width, height = self.map_:getSize()

    local minX = RangeObjectTool.TOOLBOX_PADDING / 2
    if mapX + x < minX then x = minX - mapX end

    local maxX = width - (columns - 0.5) * RangeObjectTool.TOOLBOX_PADDING
    if mapX + x > maxX then x = maxX - mapX end

    local minY = (rows - 0.5) * RangeObjectTool.TOOLBOX_PADDING
    if mapY + y < minY then y = minY - mapY  end

    local maxY = height - RangeObjectTool.TOOLBOX_PADDING / 2
    if mapY + y > maxY then y = maxY - mapY end

    local left = mapX + x - RangeObjectTool.TOOLBOX_PADDING / 2
    local top = mapY + y + RangeObjectTool.TOOLBOX_PADDING / 2

    local bgWidth = columns * RangeObjectTool.TOOLBOX_PADDING + 4
    local bgHeight = rows * RangeObjectTool.TOOLBOX_PADDING + 4
    -- local rect = display.newRect(bgWidth, bgHeight)
    -- rect:setFill(true)
    -- rect:setLineColor(ccc4FFromccc4B(ccc4(120, 120, 120, 80)))
    -- rect:setOpacity(80)
    -- rect:setPosition(x + bgWidth / 2 - RangeObjectTool.TOOLBOX_PADDING / 2 - 2,
    --                  y - bgHeight / 2 + RangeObjectTool.TOOLBOX_PADDING / 2 + 2)

    local rect = utils.drawRect(
                cc.rect(x - RangeObjectTool.TOOLBOX_PADDING / 2 - 2,
                    y - bgHeight + RangeObjectTool.TOOLBOX_PADDING / 2 + 2,
                    bgWidth,
                    bgHeight),
                {fillColor = cc.c4f(1,1,1,80/255),
                borderColor = cc.c4f(0.5,0.5,0.5,80/255)})

    layer:addChild(rect)
    

    

    local col = 0
    for i, id in ipairs(allIds) do
        -- local define = StaticObjectsProperties.get(id)
        -- local sprite = ResourceManager.getView(define.imageName,define.dir)
        
        -- if sprite:hasAnimation("open") then
        --     sprite:play("open")
        -- end
        local define = RangeObjectsProperties.get(id)
        
        -- add by owen, 2016.3.18, 增加打野元素的判定，只显示这一关这一模式的打野元素
        if define.rangeType == RangeObject.DAYE_RANGE then

                local sprite
                if define.framesName then
                    sprite = display.newSprite("#" .. string.format(define.framesName, define.framesBegin))
                else
                    local imageName = define.imageName
                    if type(imageName) == "table" then
                        imageName = imageName[1]
                    end
                    if string.find(imageName, "png") then
                        sprite = display.newSprite(imageName)
                    elseif string.find(imageName, "csb") then
                        sprite = CsbAni.new(id, imageName)
                        sprite:playAni("Idle", true)
                    end
                end
                
                local size   = sprite:getContentSize()
                local scale  = 1
                if size.width > RangeObjectTool.TOOLBOX_ICON_SIZE then
                    scale = RangeObjectTool.TOOLBOX_ICON_SIZE / size.width
                end

                if size.height * scale > RangeObjectTool.TOOLBOX_ICON_SIZE then
                    scale = RangeObjectTool.TOOLBOX_ICON_SIZE / size.height
                end
                sprite:setScale(scale)

                -- local rect = display.newRect(RangeObjectTool.TOOLBOX_ICON_SIZE,
                --                              RangeObjectTool.TOOLBOX_ICON_SIZE)
                -- rect:setFill(true)
                -- rect:setLineColor(ccc4FFromccc4B(ccc4(32, 32, 32, 120)))
                -- rect:setOpacity(70)
                -- rect:setPosition(x, y)

                local rect = utils.drawRect(
                    cc.rect(x - RangeObjectTool.TOOLBOX_ICON_SIZE/2,
                        y - RangeObjectTool.TOOLBOX_ICON_SIZE/2,
                        RangeObjectTool.TOOLBOX_ICON_SIZE,
                        RangeObjectTool.TOOLBOX_ICON_SIZE),
                    {fillColor = cc.c4f(1,1,1,70/255),
                    borderColor = cc.c4f(32/255, 32/255, 32/255, 120/255)})

                layer:addChild(rect)
                
                layer:addChild(sprite)
                sprite:setPosition(x, y)
                
                -- local name = LayoutParser.createLabel2({color="#ffffff", parent=layer, align="center",size=12,outlineColor="#000000",outlineSize=2})
                -- name:setPosition(ccp(x,y))
                -- name:setString(define.imageName)
            
                -- sprite:setScale(0.4)
                col = col + 1
                if col >= columns then
                    x = x - RangeObjectTool.TOOLBOX_PADDING * (columns - 1)
                    y = y - RangeObjectTool.TOOLBOX_PADDING
                    col = 0
                else
                    x = x + RangeObjectTool.TOOLBOX_PADDING
                end
        else
            local sprite
            if define.framesName then
                sprite = display.newSprite("#" .. string.format(define.framesName, define.framesBegin))
            else
                local imageName = define.imageName
                if type(imageName) == "table" then
                    imageName = imageName[1]
                end
                if string.find(imageName, "png") then
                    sprite = display.newSprite(imageName)
                elseif string.find(imageName, "csb") then
                    sprite = CsbAni.new(id, imageName)
                    sprite:playAni("Idle", true)
                end
            end


            
            local size   = sprite:getContentSize()
            local scale  = 1
            if size.width > RangeObjectTool.TOOLBOX_ICON_SIZE then
                scale = RangeObjectTool.TOOLBOX_ICON_SIZE / size.width
            end

            if size.height * scale > RangeObjectTool.TOOLBOX_ICON_SIZE then
                scale = RangeObjectTool.TOOLBOX_ICON_SIZE / size.height
            end
            sprite:setScale(scale)

            -- local rect = display.newRect(RangeObjectTool.TOOLBOX_ICON_SIZE,
            --                              RangeObjectTool.TOOLBOX_ICON_SIZE)
            -- rect:setFill(true)
            -- rect:setLineColor(ccc4FFromccc4B(ccc4(32, 32, 32, 120)))
            -- rect:setOpacity(70)
            -- rect:setPosition(x, y)

            local rect = utils.drawRect(
                cc.rect(x - RangeObjectTool.TOOLBOX_ICON_SIZE/2,
                    y - RangeObjectTool.TOOLBOX_ICON_SIZE/2,
                    RangeObjectTool.TOOLBOX_ICON_SIZE,
                    RangeObjectTool.TOOLBOX_ICON_SIZE),
                {fillColor = cc.c4f(1,1,1,70/255),
                borderColor = cc.c4f(32/255, 32/255, 32/255, 120/255)})

            layer:addChild(rect)
            
            layer:addChild(sprite)
            sprite:setPosition(x, y)
            
            -- local name = LayoutParser.createLabel2({color="#ffffff", parent=layer, align="center",size=12,outlineColor="#000000",outlineSize=2})
            -- name:setPosition(ccp(x,y))
            -- name:setString(define.imageName)
        
            -- sprite:setScale(0.4)
            col = col + 1
            if col >= columns then
                x = x - RangeObjectTool.TOOLBOX_PADDING * (columns - 1)
                y = y - RangeObjectTool.TOOLBOX_PADDING
                col = 0
            else
                x = x + RangeObjectTool.TOOLBOX_PADDING
            end

        end

        
    end

    local map = self.map_
    function layer:checkPoint(x, y)
        local col = math.floor((x - left) / RangeObjectTool.TOOLBOX_PADDING) + 1
        local row = math.floor((top - y) / RangeObjectTool.TOOLBOX_PADDING) + 1
        if col < 1 or col > columns or row < 1 or row > rows then
            return
        end

        local index = (row - 1) * columns + col
  
        if not allIds[index] then return end

        local resourceId = allIds[index]
     
        local define = RangeObjectsProperties.get(resourceId)
        -- define.resourceId = resourceId
        define.defineId = resourceId
        define.resId = resourceId
        define.x = mapX
        define.y = mapY
        -- local object = map:newObject("rangeobject", define)
        local object = map:newObject(define.classId, define)
        
        --  if object:getView():hasAnimation("open") then
        --     object:play("open")
        -- end
        map:setAllObjectsZOrder()
        return object
    end

    self.toolbox_ = layer
    self.map_:getMarksLayer():addChild(self.toolbox_, RangeObjectTool.TOOLBOX_ZORDER)
    -- self.map_:getDebugLayer():addChild(self.toolbox_, RangeObjectTool.TOOLBOX_ZORDER);
end

return RangeObjectTool
