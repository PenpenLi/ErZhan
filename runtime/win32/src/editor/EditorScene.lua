
local scheduler = require("framework.scheduler")

local LEVEL_ID = "A0001"  --  "A0002"

local EditorConstants = require("editor.EditorConstants")

local MapEditorUILayer = require("editor.MapEditorUILayer")

local MapEvent = require("app.map.MapEvent")

local BattleUI = require("app.map.battleui.BattleUI")

local MapConstants      = require("app.map.MapConstants")
local MapConfig         = require("maps.MapConfig")
local EventNames        = require("tools.EventNames")
local NotifyCenter      = require("tools.NotifyCenter")
local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")

--[[--

编辑器场景

]]
local EditorScene = class("EditorScene", function()
    return display.newScene("EditorScene")
end)

function EditorScene:ctor(params)

    print("EditorScene:ctor(params)")
    self.mapId  = params.mapId
    print("self.mapId = "..tostring(self.mapId))
    self.modeId = params.modeId

    -- a= 1
    -- for k,v in a do 
    -- end 

    -- 关卡基础配置
    -- mapconfig配置文件中，第一个表示模式1简单，第二个表示模式1困难，第三个废弃不用
    -- 第四个表示模式2，第五个表示模式3
    local index
    if self.modeId == MapConstants.GAME_MODE_ONE then
        if GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_EASY then
            index = 1
        elseif GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_HARD then
            index = 2
        end
    elseif self.modeId == MapConstants.GAME_MODE_TWO then
        index = 4
    elseif self.modeId == MapConstants.GAME_MODE_THREE then
        index = 5
    end
    self.mapConfig_ = MapConfig.get(self.mapId, index)
    -- dump(self.mapConfig_, "dump self.mapConfig_")
    BattleDataManager:setConfig(self.mapConfig_)


    -- 根据设备类型确定工具栏的缩放比例
    self.toolbarLines = 1
    self.editorUIScale = 1.8
    self.statusCount_ = 1
    if (device.platform == "ios" and device.model == "iphone") or device.platform == "android" then
        self.editorUIScale = 2
        self.toolbarLines = 2
    end

    -- 平铺的最下面的背景层
    local bg = display.newTilesSprite("EditorBg.png")
    self:addChild(bg)

    -- mapLayer 包含地图的整个视图
    self.mapLayer_ = display.newNode()
    self.mapLayer_:align(display.LEFT_BOTTOM, 0, 0)
    self:addChild(self.mapLayer_)

    -- touchLayer 用于接收触摸事件
    self.touchLayer_ = display.newLayer()
    self.touchLayer_:setTouchSwallowEnabled(false)
    self:addChild(self.touchLayer_)

    -- uiLayer 用于显示编辑器的 UI（工具栏等）
    -- self.uiLayer_ = display.newNode()
    -- self.uiLayer_:setPosition(display.cx, display.cy)
    -- self:addChild(self.uiLayer_)

    -- 创建地图对象
    -- 参数：地图ID, 是否是编辑器模式
    local isDebug
    if (device.platform == "mac" or device.platform == "windows") then
        isDebug = true
    else
        isDebug = false
    end
    -- 第三个参数表示是不是debug，是的话，就会给物体绑上各种EditBehavior
    self.map_ = require("app.map.Map").new(self.mapId, self.modeId, isDebug, MapConstants.MAP_TYPE_NORMAL, 1, 1) --LEVEL_ID, true)
    self.map_:init()
    self.map_:createView(self.mapLayer_)

    -- 关卡基础配置
    -- mapconfig配置文件中，第一个表示模式1简单，第二个表示模式1困难，第三个废弃不用
    -- 第四个表示模式2，第五个表示模式3
    -- local index     
    -- if self.modeId == MapConstants.GAME_MODE_ONE then
    --     if GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_EASY then
    --         index = 1
    --     elseif GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_HARD then
    --         index = 2
    --     end
    -- elseif self.modeId == MapConstants.GAME_MODE_TWO then
    --     index = 4
    -- elseif self.modeId == MapConstants.GAME_MODE_THREE then
    --     index = 5
    -- end
    -- self.mapConfig_ = MapConfig.get(self.mapId, index)
    -- -- dump(self.mapConfig_, "dump self.mapConfig_")
    -- BattleDataManager:setConfig(self.mapConfig_)

    -- 战斗中的ui，点击坑以后造塔，点击塔以后进行其他操作等
    self.battleUI = BattleUI.new(self.mapLayer_)
    self.battleUI:setMapConfig(self.mapConfig_)
    self:addChild(self.battleUI)
    self.map_:setUILayer(self.battleUI)

    -- 地图编辑器层
    if (device.platform == "mac" or device.platform == "windows") then
        self.editorLayer = MapEditorUILayer.new()
        self.editorLayer:align(display.LEFT_BOTTOM, 0, 0)
        self:addChild(self.editorLayer)
        self.editorLayer:createView(self,self.map_)
    end

    -- 不吞噬点击事件
    self:setTouchSwallowEnabled(false)
    local function createPlayToolBar( ... )
        -- 创建运行地图时的工具栏
        self.playToolbar_ = display.newNode()
        if (device.platform == "mac" or device.platform == "windows") then

        -- 在游戏中显示路径的按钮
        cc.ui.UIPushButton.new({normal = "#ToggleDebugButton.png", pressed = "#ToggleDebugButtonSelected.png"})
            :onButtonClicked(function(event)
                self.map_:setDebugViewEnabled(not self.map_:isDebugViewEnabled())
            end)
            :align(display.CENTER, display.width - 280 + 32 * self.editorUIScale, display.top - 32 * self.editorUIScale)
            :addTo(self.playToolbar_)
            -- :setVisible(false)
            -- :setScale(self.editorUIScale)

        -- 游戏中停止按钮
        -- cc.ui.UIPushButton.new({normal = "#StopMapButton.png", pressed = "#StopMapButtonSelected.png"})
        --     :onButtonClicked(function(event)
        --         self:editMap()
        --     end)
        --     :align(display.CENTER, display.left + 500 + 88 * self.editorUIScale, display.top - 32 * self.editorUIScale)
        --     :addTo(self.playToolbar_)
        --     :setScale(self.editorUIScale)
        else
        -- self.recordBtnBg_ = cc.LayerColor:create(cc.c4b(255, 255, 255, 120)):addTo(self)
        -- self.recordBtnBg_:setTouchEnabled(false)
        -- self.recordBtn_ = cc.ui.UIPushButton.new("GreenButton.png", {scale9 = true})
        --     :setButtonLabel(cc.ui.UILabel.new({text = "开始性能测试", size = 20, color = display.COLOR_BLACK}))
        --     :setButtonSize(130, 40)
        --     :align(display.CENTER, display.cx, display.cy)
        --     :addTo(self.recordBtnBg_)  
        --     :onButtonClicked(function()
        --         self.mapLayer_:setPositionY(60)
        --         -- self.mapRuntime_:setPositionY(60)
        --         self.mapRuntime_:startPlay()

        --         self:disabelResult()
        --         self:disableStatus()

        --         self:showStatusCurve()
        --         self:statusTimerBegin()

        --         self.recordBtnBg_:removeSelf()
        --         self.recordBtnBg_ = nil
            -- end)

        end
-- body
    end
    if (device.platform == "mac" or device.platform == "windows") then
        createPlayToolBar()
        self.playToolbar_:setVisible(false)
        self:addChild(self.playToolbar_)
    end

    -- change by Owen, 2016.2.15, MapRuntimeC只需要在main里面新建一次就好了，
    -- 每次进入战斗的时候要清理一次数据
    -- self.collisionEngine = MapRuntimeC:create()
    -- self:addChild(self.collisionEngine)
    self.collisionEngine = GLOBAL_MapRuntimeC
    self.collisionEngine:clearData()

    if self.collisionEngine == nil then 
        print ("创建collisionEngine 失败, exit")
        return
    end

    -- 注册监听事件，触发后开始运行地图
    NotifyCenter.register(EventNames.RT_PLAY_MAP, handler(self, self.playMap), self)
    -- local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    -- local customListenerBg = cc.EventListenerCustom:create("hahahaha",
    --                             handler(self, self.playMap))
    -- eventDispatcher:addEventListenerWithFixedPriority(customListenerBg, 1)
    if (device.platform == "mac" or device.platform == "windows") then
        self:editMap()
    else
        self:playMap()
    end

    -- 场景加速，2.0表示两倍速度运行
    -- cc.Director:getInstance():getScheduler():setTimeScale(2.0)
end

-- 开始运行地图
function EditorScene:playMap(event)
    dump(event, "dump EditorScene:playMap")
    -- cc.Director:getInstance():setDisplayStats(true)

    -- 隐藏编辑器界面
    if (device.platform == "mac" or device.platform == "windows") then
        self.editorLayer:getView():setVisible(false) -- getView():isVisible() 
    end
    -- self.toolbar_:getView():setVisible(false)

    -- 保存地图当前状态
    self.mapState_ = self.map_:vardump()
    if (device.platform == "mac" or device.platform == "windows") then
        self.playToolbar_:setVisible(true)
    end
    -- self.mapNameLabel_:setVisible(false)

    self.map_:setDebugViewEnabled(false)
    self.map_:getBackgroundLayer():setVisible(true)
    self.map_:getBackgroundLayer():setOpacity(255)

    local camera = self.map_:getCamera()
    camera:setMargin(0, 0, 0, 0)
    camera:setOffset(0, 0)

    -- 显示初始配置的血量、金币等
    BattleDataManager:setConfig(self.mapConfig_)

    --根据不同平台设置缩放
    -- -- print("display.width = "..tostring(display.width).." height = "..tostring(display.height))
    -- local mapW, mapH = self.map_:getSize()
    -- -- print("map width = "..tostring(mapW).." height = "..tostring(mapH))
    -- camera:setScale(mapW/display.width) = "..tostring(mapW/display.width))
        --根据不同平台设置缩放
    --local mapW, mapH = self.map_:getSize()
    -- if device.model == "ipad" or device.platform == "windows" then--and display.width == 1024 then 
    --     -- ipad1的话*0.5
    --     camera:setScale(1)
    -- else
    --     camera:setScale(1.5)
    -- end
    
    camera:setScale(1)

    -- 强制垃圾回收
    collectgarbage()
    collectgarbage()






    -- 开始执行地图
    self.mapRuntime_ = require("app.map.MapRuntime").new(self.map_, self.mapConfig_, self.collisionEngine)
    self:addChild(self.mapRuntime_)

    -- 设置 UI 与 rt 绑定，要在preparePlay之前绑定，否则第一波刷怪的按钮出不来，因为没有map
    self.battleUI:setVisible(true)
    self.battleUI:setRuntime(self.mapRuntime_)
    if event then
        self.mapRuntime_:preparePlay()
        self.mapRuntime_:startPlay()
        
    else 
        self.playMap_ = true
        
    end
end

-- 开始编辑地图
function EditorScene:editMap()
    cc.Director:getInstance():setDisplayStats(false) -- true)

    -- self.editorLayer:getView():setVisible(true)

    if self.mapRuntime_ then
        self.mapRuntime_:stopPlay()
        self.mapRuntime_:removeSelf()
        self.mapRuntime_ = nil 
    end

    self.map_:setDebugViewEnabled(true)
    if self.mapState_ then
        -- 重置地图状态
        self.map_:reset(self.mapState_)
        self.map_:createView(self.mapLayer_)
        self.mapState_ = nil
    end

    -- self.toolbar_:getView():setVisible(true)
    if (device.platform == "mac" or device.platform == "windows") then
        self.playToolbar_:setVisible(false)
    end
    -- self.mapNameLabel_:setVisible(true)

    self.battleUI:setVisible(false)
    self.battleUI:setRuntime(nil)

    local camera = self.map_:getCamera()
    camera:setMargin(EditorConstants.MAP_PADDING,
                     EditorConstants.MAP_PADDING,
                     EditorConstants.MAP_PADDING + EditorConstants.MAP_TOOLBAR_HEIGHT * self.editorUIScale * self.toolbarLines + 20,
                     EditorConstants.MAP_PADDING)
    -- camera:setScale(1)
    -- camera:setOffset(0, 0)

    -- 根据不同平台设置缩放
    local mapW, mapH = self.map_:getSize()
    if device.model == "ipad" or device.platform == "windows" and display.width == 1024 then 
        -- ipad1的话放大2倍
        print("hahaha camera:setScale(0.5)")
        -- camera:setScale(0.5) -- display.width/mapW)
    else
        camera:setScale(1)
    end
    -- camera:setScale(1)
    camera:setOffset(0, 0)


    -- 强制垃圾回收
    collectgarbage()
    collectgarbage()


end

function EditorScene:tick(dt)

    -- 新的 ui
    self.battleUI:tick(dt)

    if self.mapRuntime_ then
        self.mapRuntime_:tick(dt)
    end
end

function EditorScene:onTouch(event, x, y)
    if self.mapRuntime_ then
        -- 如果正在运行地图，将触摸事件传递到地图
        -- if self.battleUI then
        --     self.battleUI:onTouch(event, x, y)
        -- end        -- change by Owen 2015.4.27, mapruntime里面的onTouch放到BattleUI中去
        -- if self.mapRuntime_:onTouch(event, x, y) == true then
        --     return true  -- return true，就把点击事件给吞噬掉了
        -- end
        if event == "began" then
            self.drag = {
                startX  = x,
                startY  = y,
                lastX   = x,
                lastY   = y,
                offsetX = 0,
                offsetY = 0,
            }
            if self.battleUI then
                 self.battleUI:onDown2(event, x, y)
            end  
            return true
        end

      -- change by Owen 2015.4.27, mapruntime里面的onTouch放到BattleUI中去

        if event == "moved" then
            self.drag.offsetX = x - self.drag.lastX
            self.drag.offsetY = y - self.drag.lastY
            self.drag.lastX = x
            self.drag.lastY = y
            
            -- self.map_:getCamera():moveOffset(self.drag.offsetX, self.drag.offsetY)

            -- change by Owen, 2015.12.2, 当有选中一英雄或者技能的时候，是不能移动地图的
            if self.battleUI:onMove2(event, x, y,self.drag) then
                self.map_:getCamera():moveOffset(self.drag.offsetX, self.drag.offsetY)
            end
            return true
        end

        if event == "ended" then
            self.battleUI:onUp2(event, x, y)
        else -- "ended" or CCTOUCHCANCELLED
            self.drag = nil
        end

        return
    end

    -- 如果没有运行地图，则将事件传递到工具栏
    x, y = math.round(x), math.round(y)

    if (device.platform == "mac" or device.platform == "windows") then  
        if self.editorLayer:getView():isVisible()  then
            -- print("传递事件到地图编辑器的工具栏")
            return self.editorLayer:onTouch(event, x, y)
        end
    end

    return true
end

function EditorScene:onEnter()
    -- add by Owen, 2016.4.15, 切换场景以后，要替换鼠标图片
    viewMgr.show(viewMgr.def.MOUSE_UI)

    if self.playMap_ then 
        self.mapRuntime_:preparePlay()
        self.mapRuntime_:startPlay()
   end

    self.touchLayer_:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return self:onTouch(event.name, event.x, event.y)
    end)
    self.touchLayer_:setTouchEnabled(true)
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, handler(self, self.tick))
    self:scheduleUpdate()

    -- 播放音乐
    local gameLv = GlobalData.getGameLv()
    local lv = math.ceil(gameLv/3)
    print("当前进入的是第几个场景 "..tostring(lv))
    -- 播放音乐
    if GlobalData.getMusicOn() then
        AudioEngine.playMusic("music/beforeFight.mp3", true)
        local percent = GlobalData.getMusicVolume()
        AudioEngine.setMusicVolume(percent/100)
    end
    GlobalData.setMusicName("music/beforeFight.mp3")
end

function EditorScene:onExit()
    if self.mapRuntime_ then
        self.mapRuntime_:stopPlay()
    end

    self:removeView()
    -- self.objectInspector_:removeAllEventListeners()
    -- self.toolbar_:removeAllEventListeners()
end

function EditorScene:removeView()
    -- self._fightUIViewNew:dispose()
    -- self.uiLayer:removeView()
    if (device.platform == "mac" or device.platform == "windows") then
        self.editorLayer:removeView()
    end
    -- self.map:removeView()
    self.battleUI:removeFromParent()
end


function EditorScene:showStatusCurve()
    if not self.bgStatus_ then
        self.bgStatus_ = cc.LayerColor:create(cc.c4b(255, 255, 255, 255))
        self.bgStatus_:setContentSize(display.width, 60)
        self.bgStatus_:setTouchEnabled(false)
        self:addChild(self.bgStatus_)
    end
    self.bgStatus_:setVisible(true)

    self.fpsArray_ = {}
    self.fps_ = self.fps_ or {}
    if 0 == #self.fps_ then
        table.insert(self.fps_, cc.p(0, 0))
    end

    if not self.statusDraw_ then
        if utils.useNVGDrawNode then
            self.statusDraw_ = cc.NVGDrawNode:create():addTo(self.bgStatus_)
            self.statusDraw_:drawPolygon(self.fps_, #self.fps_, false, cc.c4f(1, 0, 0, 1))
        else
            self.statusDraw_ = display.newDrawNode():addTo(self.bgStatus_)
        end
    end
    self.statusDraw_:setVisible(true)

    self.objectsCount_ = self.objectsCount_ or {}
    if 0 == #self.objectsCount_ then
        table.insert(self.objectsCount_, cc.p(0, 0))
    end

    if not self.objectsDraw_ then
        if utils.useNVGDrawNode then
            self.objectsDraw_ = cc.NVGDrawNode:create():addTo(self.bgStatus_)
            self.objectsDraw_:drawPolygon(self.objectsCount_, #self.objectsCount_, false, cc.c4f(0, 0, 1, 1))
        else
            self.objectsDraw_ = display.newDrawNode():addTo(self.bgStatus_)
        end
    end
    self.objectsDraw_:setVisible(true)

    if not self.statusLabel_ then
        self.statusLabel_ = cc.ui.UILabel.new({text = " ", size = 10, color = display.COLOR_BLACK})
        :align(display.CENTER_RIGHT, display.right - 10, 10)
        :addTo(self)
    end

    self.statusLabel_:setVisible(true)

    -- self.recordBtn_:setButtonLabel(cc.ui.UILabel.new({text = "统计中", size = 20, color = display.COLOR_BLACK}))
end

function EditorScene:disableStatus()
    self.fps_ = nil
    self.objectsCount_ = nil
    self.statusCount_ = 1
    if self.bgStatus_ then
        self.bgStatus_:setVisible(false)
    end
    if self.statusDraw_ then
        self.statusDraw_:removeFromParent()
        self.statusDraw_ = nil
    end
    if self.objectsDraw_ then
        self.objectsDraw_:removeFromParent()
        self.objectsDraw_ = nil
    end
end

function EditorScene:addFPS()
    self.statusCount_ = self.statusCount_ + 1
    local deltaTime = cc.Director:getInstance():getDeltaTime()
    local fps = 1/deltaTime

    table.insert(self.fpsArray_, fps)

    -- print(string.format("deltaTime:%f, fps:%d", deltaTime, fps))

    local pos = cc.p(display.left + display.width/60 * self.statusCount_, fps)
    table.insert(self.fps_, pos)
    if utils.useNVGDrawNode then
        self.statusDraw_:addPoint(pos)
    else
        -- print("drawnode:" .. tostring(self.statusDraw_))
        self.statusDraw_:drawSegment(
            self.fps_[#self.fps_ - 1],
            self.fps_[#self.fps_],
            0.5, cc.c4f(1, 0, 0, 1))
    end

    local count = table.nums(self.map_.objects_)
    pos = cc.p(display.left + display.width/60 * self.statusCount_, count)
    table.insert(self.objectsCount_, pos)

    if utils.useNVGDrawNode then
        self.objectsDraw_:addPoint(pos)
    else
        self.objectsDraw_:drawSegment(
            self.objectsCount_[#self.objectsCount_ - 1],
            self.objectsCount_[#self.objectsCount_],
            0.5, cc.c4f(0, 0, 1, 1))
    end

    self.statusLabel_:setString(string.format("Object:%d,FPS:%d", count, fps))

    if self.statusCount_ > 60 then
        self:statusTimerEnd()
    end
end

function EditorScene:statusTimerBegin()
    self.statusTimer_ = scheduler.scheduleGlobal(handler(self, self.addFPS), 1)
end

function EditorScene:statusTimerEnd()
    if not self.statusTimer_ then
        return
    end

    scheduler.unscheduleGlobal(self.statusTimer_)
    self.statusTimer_ = nil

    self:showResult()
end

--显示统计结果
function EditorScene:showResult()
    self.mapRuntime_:pausePlay()
    -- self.recordBtn_:setButtonLabel(cc.ui.UILabel.new({text = "统计运行状态", size = 20, color = display.COLOR_BLACK}))

    local dialogSize = cc.size(display.width/2, display.height/2)
    local bg = cc.LayerColor:create(cc.c4b(128, 128, 128, 200))
                :pos((display.width - dialogSize.width)/2, (display.height - dialogSize.height)/2)
                :addTo(self)
    bg:setContentSize(dialogSize.width, dialogSize.height)

    local totoalScore = 0
    local minScore = 60
    local maxScore = 0

    table.walk(self.fpsArray_, function(v, k)
            if v < minScore then
                minScore = v
            end
            if v > maxScore then
                maxScore = v
            end
            totoalScore = totoalScore + v
        end)

    cc.ui.UILabel.new({text = "Score:", size = 24, color = display.COLOR_BLACK})
        :align(display.CENTER_RIGHT, dialogSize.width/2 - 10, dialogSize.height - 40)
        :addTo(bg)
    cc.ui.UILabel.new({text = string.format("%d", totoalScore), size = 24, color = display.COLOR_RED})
        :align(display.CENTER_LEFT, dialogSize.width/2 + 10, dialogSize.height - 40)
        :addTo(bg)

    cc.ui.UILabel.new({text = "Min FPS:", size = 24, color = display.COLOR_BLACK})
        :align(display.CENTER_RIGHT, dialogSize.width/2 - 10, dialogSize.height - 100)
        :addTo(bg)
    cc.ui.UILabel.new({text = string.format("%d", minScore), size = 24, color = display.COLOR_RED})
        :align(display.CENTER_LEFT, dialogSize.width/2 + 10, dialogSize.height - 100)
        :addTo(bg)

    cc.ui.UILabel.new({text = "Max FPS:", size = 24, color = display.COLOR_BLACK})
        :align(display.CENTER_RIGHT, dialogSize.width/2 - 10, dialogSize.height - 160)
        :addTo(bg)
    cc.ui.UILabel.new({text = string.format("%d", maxScore), size = 24, color = display.COLOR_RED})
        :align(display.CENTER_LEFT, dialogSize.width/2 + 10, dialogSize.height - 160)
        :addTo(bg)

    cc.ui.UILabel.new({text = "Average FPS:", size = 24, color = display.COLOR_BLACK})
        :align(display.CENTER_RIGHT, dialogSize.width/2 - 10, dialogSize.height - 220)
        :addTo(bg)
    cc.ui.UILabel.new({text = string.format("%d", totoalScore/#self.fpsArray_), size = 24, color = display.COLOR_RED})
        :align(display.CENTER_LEFT, dialogSize.width/2 + 10, dialogSize.height - 220)
        :addTo(bg)

    cc.ui.UIPushButton.new("GreenButton.png", {scale9 = true})
        :setButtonLabel(cc.ui.UILabel.new({text = "结束", size = 20, color = display.COLOR_BLACK}))
        :setButtonSize(130, 40)
        :align(display.CENTER, dialogSize.width/2, dialogSize.height - 280)
        :addTo(bg)
        :onButtonClicked(function()
            cc.Director:getInstance():endToLua()
            os.exit()
        end)

    self.resultDialog_ = bg
end

function EditorScene:disabelResult()
    if self.resultDialog_ then
        self.resultDialog_:removeFromParent()
        self.resultDialog_ = nil
    end
end

return EditorScene
