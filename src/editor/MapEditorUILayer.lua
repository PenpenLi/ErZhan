
-- local RoadListPanel = require("editor.RoadListPanel")

local MapEvent          = require("app.map.MapEvent")
local EditorConstants   = require("editor.EditorConstants")
local EventNames        = require("tools.EventNames")
local NotifyCenter      = require("tools.NotifyCenter")

local MapEditorUILayer = class("MapEditorUILayer", function()
    return display.newNode()
end)


function MapEditorUILayer:ctor()
    -- display.addSpriteFramesWithFile("ui/MapEditor.plist", "ui/MapEditor.png")
    self.toolbarLines = 1
    self.editorUIScale = 1    -- 显示在下面的toolBar的缩放比例
    self.statusCount_ = 1
    -- 不吞噬点击事件
    self:setTouchSwallowEnabled(false)
    if (device.platform == "ios" and device.model == "iphone") or device.platform == "android" then
        self.editorUIScale = 2
        self.toolbarLines = 2
    end
end

function MapEditorUILayer:onExit()
    self.objectInspector_:removeAllEventListeners()
    self.toolbar:removeAllEventListeners()
end


function MapEditorUILayer:onTouch(event,x,y)
    x, y = math.round(x), math.round(y)
    if event == "began" then
        if self.objectInspector:getView():isVisible() and self.objectInspector:checkPointIn(x, y) then
            return self.objectInspector:onTouch(event, x, y)
        end
    end
 
    self.toolbar:onTouch(event, x, y)
  return true
end

function MapEditorUILayer:createView(parent,map)
    -- self.view_ 用于显示编辑器的 UI（工具栏等）
    if self.view_ then return end
    self.view_ = display.newNode()


    -- -- 创建工具栏
    -- self.toolbar_ = require("editor.Toolbar").new(self.map_)
    -- self.toolbar_:addTool(require("editor.GeneralTool").new(self.toolbar_, self.map_))
    -- self.toolbar_:addTool(require("editor.ObjectTool").new(self.toolbar_, self.map_))
    -- self.toolbar_:addTool(require("editor.PathTool").new(self.toolbar_, self.map_))
    -- self.toolbar_:addTool(require("editor.RangeTool").new(self.toolbar_, self.map_))

    -- -- 创建工具栏的视图
    -- self.toolbarView_ = self.toolbar_:createView(self.uiLayer_, "#ToolbarBg.png", EditorConstants.TOOLBAR_PADDING, self.editorUIScale, self.toolbarLines)
    -- self.toolbarView_:setPosition(display.c_left, display.c_bottom)
    -- self.toolbar_:setDefaultTouchTool("GeneralTool")
    -- self.toolbar_:selectButton("GeneralTool", 1)



    self.toolbarViewCtlBtn = cc.ui.UIPushButton.new("delete.png")
        :onButtonClicked(function(...)
            print("隐藏/显示工具栏")
            self:toolbarViewChange()
        end)
        :pos(display.width/2 - 80, -display.height/2+80*2)
        :addTo(self.view_)
        :setScale(1.0)
    self.toolbarState = true

      -- -- 创建工具栏
    self.toolbar = require("editor.Toolbar").new(map)

    -- 保存、play等工具
    self.toolbar:addTool(require("editor.GeneralTool").new(self.toolbar, map))
    -- self.toolbar:addTool(require("editor.ObjectTool").new(self.toolbar, map))
    -- 添加个各种塔
    self.toolbar:addTool(require("editor.TowerObjectTool").new(self.toolbar, map))
    
    self.toolbar:addTool(require("editor.PathTool").new(self.toolbar, map))
   
    -- NPC
    -- self.toolbar:addTool(require("editor.RangeTool").new(self.toolbar, map))
    self.toolbar:addTool(require("editor.RangeObjectTool").new(self.toolbar, map))

    -- 添加坑的操作,先隐藏掉，放到添加各种塔的工具栏中去了
    -- self.toolbar:addTool(require("editor.TowerLocationTool").new(self.toolbar, map))

    -- Road 相关，实际为可行走区域
    local roadTool = require("editor.RoadTool").new(self.toolbar, map)
    self.toolbar:addTool(roadTool)
        -- 设置路
    local roads = table.values(map:getObjectsByClassId("road"))
    roadTool:setRoad(roads[1])


    -- self.toolbar:addTool(require("editor.PointTool").new(self.toolbar, map))
    -- -- 添加装饰物
    -- self.toolbar:addTool(require("editor.DecorationTool").new(self.toolbar, map))
    
    
    -- -- Road 相关
    -- local roadTool = require("editor.RoadTool").new(self.toolbar, map)
    -- self.toolbar:addTool(roadTool)

    -- -- 创建工具栏的视图
    self.toolbarView_ = self.toolbar:createView(self.view_, "#ToolbarBg.png", EditorConstants.TOOLBAR_PADDING, self.editorUIScale, self.toolbarLines)
    self.toolbarView_:setPosition(display.c_left, display.c_bottom)
    self.toolbar:setDefaultTouchTool("GeneralTool")
    self.toolbar:selectButton("GeneralTool", 1)
    -- -- 创建工具栏的视图
    -- self.toolbar:createView(self.view_, "MapEditor.ToolbarBg", 30)
    -- self.toolbar:setDefaultTouchTool("GeneralTool")
    -- self.toolbar:selectButton("GeneralTool", 1)

    -- 新增 RoadListPanel
    -- local roadListPanel = RoadListPanel.new()
    -- roadListPanel:setPosition(display.right - roadListPanel:getWidth() - 10, display.top - roadListPanel:getHeight() - 10)
    -- self.view_:addChild(roadListPanel)
    -- roadListPanel.onChange:add(function (index)
    --     roadTool:setRoad(roadListPanel:getSelectedRoad()) 
    -- end)
    -- self.roadListPanel = roadListPanel
   
    -- -- 创建对象信息面板
    self.objectInspector = require("editor.ObjectInspector").new(map, self.editorUIScale, self.toolbarLines)
    self.objectInspector:addEventListener("UPDATE_OBJECT", function(event)
        self.toolbar:dispatchEvent(event)
    end)
    self.objectInspector:createView(self.view_)

    -- -- 创建地图名称文字标签
    -- self.mapNameLabel = cc.ui.newTTFLabelWithOutline({
    --     text  = string.format("module: %s, image: %s", map.mapModuleName_,map.imageName_),
    --     size  = 16,
    --     align = ui.TEXT_ALIGN_LEFT,
    --     x     = display.left + 100,
    --     y     = display.bottom + 20,
    -- })
    -- self.view_:addChild(self.mapNameLabel)
        -- 创建地图名称文字标签
    self.mapNameLabel_ = cc.ui.UILabel.new({
        text  = string.format("module: %s, image: %s", map.mapModuleName_, map.imageName_),
        size  = 16 * self.editorUIScale,
        align = cc.ui.TEXT_ALIGN_LEFT,
        x     = display.left + 10,
        y     = display.c_top - 50,
        -- y     = display.bottom + EditorConstants.MAP_TOOLBAR_HEIGHT * self.editorUIScale * self.toolbarLines + 20,
    }):align(display.CENTER)
    self.mapNameLabel_:enableOutline(cc.c4b(255, 0, 0), 2)
    self.view_:addChild(self.mapNameLabel_)

    -- 注册工具栏事件
    self.toolbar:addEventListener("SELECT_OBJECT", function(event)
        self.objectInspector:setObject(event.object)
    end)
    self.toolbar:addEventListener("UPDATE_OBJECT", function(event)
        self.objectInspector:setObject(event.object)
    end)
    self.toolbar:addEventListener("UNSELECT_OBJECT", function(event)
        self.objectInspector:removeObject()
    end)
    self.toolbar:addEventListener("PLAY_MAP", function(event)
        self:tapPlayMap()
    end)

    -- 选择塔工具
    self.toolbar:addEventListener("SELECT_TOWER_OBJECT", function(event)
        self.objectInspector:setObject(event.object)
    end)
    self.toolbar:addEventListener("UPDATE_TOWER_OBJECT", function(event)
        self.objectInspector:setObject(event.object)
    end)
    self.toolbar:addEventListener("UNSELECT_TOWER_OBJECT", function(event)
        self.objectInspector:removeObject()
    end)

    
    
    -- 选择 range
    self.toolbar:addEventListener("SELECT_RANGE", function(event)
        self.objectInspector:setRange(event.object)
    end)
    self.toolbar:addEventListener("UPDATE_RANGE", function(event)
        self.objectInspector:setRange(event.object)
    end)
    self.toolbar:addEventListener("UNSELECT_RANGE", function(event)
        self.objectInspector:removeObject()
    end)

    -- -- 坑选中操作
    -- self.toolbar:addEventListener("SELECT_STANDRANGE", function(event)
    --     self.objectInspector:setStandRange(event.object)
    -- end)
    -- self.toolbar:addEventListener("UPDATE_STANDRANGE", function(event)
    --     self.objectInspector:setStandRange(event.object)
    -- end)
    -- self.toolbar:addEventListener("UNSELECT_STANDRANGE", function(event)
    --     self.objectInspector:removeObject()
    -- end)

    -- -- 点选中操作
    -- self.toolbar:addEventListener("SELECT_POINT", function(event)
    --     self.objectInspector:setPoint(event.object)
    -- end)
    -- self.toolbar:addEventListener("UPDATE_POINT", function(event)
    --     self.objectInspector:setPoint(event.object)
    -- end)
    -- self.toolbar:addEventListener("UNSELECT_POINT", function(event)
    --     self.objectInspector:removeObject()
    -- end)

    -- -- 装饰物操作
    -- self.toolbar:addEventListener("SELECT_DECORATION", function(event)
    --     self.objectInspector:setShowView_TypeDecoration(event.object)
    -- end)
    -- self.toolbar:addEventListener("UPDATE_DECORATION", function(event)
    --     self.objectInspector:setShowView_TypeDecoration(event.object)
    -- end)
    -- self.toolbar:addEventListener("UNSELECT_DECORATION", function(event)
    --     self.objectInspector:removeObject()
    -- end)

    -- 添加160*160的网格
    local params = {
        borderColor = cc.c4f(0,0,0,0.2),
        radius = 0.5,
        scale = 1.0,
    }
    local cell   = 100
    local countX = math.floor(2048/cell)
    local countY = math.floor(1536/cell)
    for i=1,countX do 
        local points = {{i*cell, 0}, {i*cell, 1536}}
        local line = display.newLine(points, params)
        -- object.radiusCircle_ = display.newCircle(object.radius_) -- utils.drawCircle(object.radius_)
        map:getDebugLayer():addChild(line)
    end
    for i=1,countY do 
        local points = {{0, i*cell}, {2048, i*cell}}
        local line = display.newLine(points, params)
        -- object.radiusCircle_ = display.newCircle(object.radius_) -- utils.drawCircle(object.radius_)
        map:getDebugLayer():addChild(line)
    end

    parent:addChild(self.view_)
    self.view_:setPosition(display.cx, display.cy)
    
    -- self:hideMapEditorLayer_()
    
    -- NotifyCenter.register(self.view_,handler(self,self.showMapEditorLayer_),MapEvent.SHOW_MAP_EDITOR_EVENT)
    -- NotifyCenter.register(self.view_,handler(self,self.hideMapEditorLayer_),MapEvent.MAP_START_PLAY)
    -- NotifyCenter.register(self.view_,handler(self,self.hideMapEditorLayer_),MapEvent.MAP_RESUME_PLAY)
end

-- 点击运行按钮
function MapEditorUILayer:tapPlayMap()
    -- 取消所有的选中状态
    
    NotifyCenter.notify(EventNames.RT_PLAY_MAP)
    -- local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    -- eventDispatcher:dispatchCustomEvent("hahahaha")

end

function MapEditorUILayer:removeView()
    -- NotifyCenter.unregister(self.view_)
end

function MapEditorUILayer:showMapEditorLayer_(event,obj)
    if self.view_ then
        self.view_:setVisible(true)
    end

    -- 显示 Road 列表
    self.roadListPanel:setInfo(self.toolbar.map_)
end

function MapEditorUILayer:hideMapEditorLayer_(event,obj)
    if self.view_ then
        self.view_:setVisible(false)
    end
end

function MapEditorUILayer:getView()
    return self.view_
end


function MapEditorUILayer:toolbarViewChange()
    if self.toolbarState == true then 
        self.toolbarView_:setVisible(false)
        self.toolbarState = false
    else
        self.toolbarView_:setVisible(true)
        self.toolbarState = true
    end
end
return MapEditorUILayer
