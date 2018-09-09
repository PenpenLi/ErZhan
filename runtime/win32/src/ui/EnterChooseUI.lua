
-- change by Owen, 2016.6.29, require的这些文件需要放到这里来，不能放到main里面
-- 不然的话这些文件会更新不到

-- 本地存储
UserLocalStorage = require("tools.LocalStorage").new("mine")

require("utils")
require("tools.EventNames")
require("tools.tableFunc")
require("tools.NotifyCenter")

print("Language = "..tostring(Language))

require("tools.AudioMgr")

-- change by Owen, 2016.5.10, 语言包放到hallScene里面去Require
-- WordLanguage = require("tools.Language")
require("goodsGive")

require "viewMgr.lua"
require "sdk.umeng.lua"

-- add by Owen, 2016.6.17, 调用一下友盟sdk的打开游戏的接口
umengSdk.setLogin_1()


local GlobalData            = require("tools.GlobalData")
local painterData           = require("app.properties.PainterProperties")
local scheduler = cc.Director:getInstance():getScheduler()
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local SpineCache            = require("app.map.spine.SpineCache")
local ChooseUI = class("ui.EnterChooseUI.lua",function()
    return display.newScene("HallScene")
end)
local result = nil

local device = require("framework.device")
local lfs = require("lfs")
local json = require("cjson")

function ChooseUI:ctor(flag)
    self.flag = flag
    -- 记录用户点击的次数
    self.clickCount = 0
	self.flag_1 = 0
    self.flag_2 = 0
    self.flag_3 = 0
    self.layer = display.newLayer()
    self.layer:setAnchorPoint(cc.p(0.5,0.5))
    self.layer:setContentSize(cc.size(1350,720))
    self.layer:setPosition(cc.p(display.width/2,display.height/2))
    self:addChild(self.layer,2)

    -- 用来做漫画的屏幕适配
    self.layer:setScale(GLOBAL_HALL_UI_SCALE2)

    -- 记录一下漫画是不是已经显示过了
    self.painterHasShow = GlobalData.getPainterHasShow()
    self.layer:setTouchEnabled(true)

    -- add by Owen, 2016.6.29, 向服务器请求版本号，用来确认下次是否要更新
    -- self:doDownLoad()
end

local function makePathDirIfNeed(path)
    local pathSeg = string.split(path, device.directorySeparator)
    local p = ""
    for i = 1,#pathSeg - 1 do
        p = p .. pathSeg[i] .. device.directorySeparator
        -- lfs.attributes 获取路径p 指定属性mode
        local mode = lfs.attributes(p, "mode")
        --不是目录，则删除之
        if mode ~= "directory" then
            os.remove(p)
        end
        if (not mode) then
            lfs.mkdir(p)
        end
    end
end

-- 根据文件名获取完整路径
local function getFullPath(filename)
    return string.gsub(device.writablePath, "[\\\\/]+$", "") .. "/" .. filename
end

--下载一个文件
--url 请求url
--savePath 本地保存的相对路径
--checkSize 需要校验的文件大小数值
--callback 成功后的回调函数
function ChooseUI:doDownLoad(url, savePath, checkSize, callback)

    --资源目录
    self.resDir = device.writablePath.."res"

    -- 下载的版本文件url路径前面的固定网址
    local stableUrl = "https://raw.githubusercontent.com/xiaoiOwen/test/master/"

    local request = network.createHTTPRequest(
        function(event)
            -- dump(event, "dump network.createHTTPRequest event")
            if event.name == "completed" then

                -- 没有获得
                local str = event.request:getResponseString()
                print("版本返回串:"..tostring(str))
                local obj = json.decode(str)
                if not obj then return end
                if obj["error"] then return end
                if not obj["version"] then return end

                print("Http 服务器版本文件请求，获得了正确的数据")
                local savePath = getFullPath("newVersion.json")

                -- local savePath = self.resDir..device.directorySeparator.."version.json"
                print("savePath = "..tostring(savePath))
                makePathDirIfNeed(savePath)
                event.request:saveResponseData(savePath)
                

                print("savePath2 = "..tostring(savePath))
                local content = io.readfile(savePath)
                if (content) then
                    self.data = json.decode(content)
                    dump(self.data, "dump self.data")
                else
                    print("下载下来的json版本文件为空")
                end

                -- local fileSize = lfs.attributes(savePath, "size")
                -- if fileSize > 0 then
                --     --执行下载的updateInfo.lua
                --     local getUpdateInfo = loadfile(self.resDir..device.directorySeparator.."updateInfo.lua")
                --     if getUpdateInfo then
                --         print("http 下载文件成功")
                --         dump(getUpdateInfo, "dump getUpdateInfo")
                --         -- self.updateInfo = getUpdateInfo()
                --         -- self:choiceUpdate()
                --     else
                --         -- reTry("101")
                --     end
                    
                -- else
                --     -- reTry("102")
                -- end
            elseif event.name == "progress" then
                --donothing
            else
                print("event.name = "..tostring(event.name))
                print("HTTP请求失败:")
                for k,v in pairs(event) do
                    print(tostring(k).."="..tostring(v))
                end
                -- reTry("103")
            end
        end,
        -- self.params.url.."/updateInfo.lua")
        -- "https://github.com/xiaoiOwen/test/blob/master/updateInfo.lua")
        stableUrl.."version.json")

    request:start()
end

function ChooseUI:onEnter()
    local CallBack = function(luaFileName, node, callbackName)
        if callbackName == "clickEvent" then
            return function()
                if self.gameName:getChildByName("colorLayer") then return end
                AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
                if node:getName() == "choose" then
                    local language = GlobalData.getLanguage()
                    if language == "CN" then
                        GlobalData.setLanguage("EN")
                    else
                        GlobalData.setLanguage("CN")
                    end
                    language = GlobalData.getLanguage()
                    if language == "CN" then
                        self.textHint:setString("中文")
                        self.gameName:setTexture("ui/Language/name_CN.png")
                        self.chooseBtn:loadTextures("ui/Language/cn.png","ui/Language/cn.png",nil)
                    else
                        self.textHint:setString("EN")
                        self.gameName:setTexture("ui/Language/name_EN.png")
                        self.chooseBtn:loadTextures("ui/Language/en.png","ui/Language/en.png",nil)
                    end
                end
                if node:getName() == "enter" then
                    if not self.painterHasShow then
                        -- 显示第一幅漫画
                        if  self.root then
                            self.root:setVisible(false)
                        end
                        self:doShowPainterOne()
                    else
                        local function callBack(args)
                            local gameScene = require("hall.HallScene")
                            AudioEngine.stopMusic()
                            display.replaceScene(gameScene.new())
                        end
                        if self.flag == nil  then
                            self:loadingRes(callBack)
                        else
                            callBack()
                        end
                    end
                end
            end
        end
    end
    result = import("ui.ChooseLanguage").create(CallBack)
    self.root = result.root
    self.root:setPosition(cc.p(display.cx,display.cy))
    self.root:setScale(GLOBAL_HALL_UI_SCALE2)

    --监听退出
    --快捷键esc
    if device.platform ~= "windows" then
        self.root:setKeypadEnabled(true)
        self.root:addNodeEventListener(cc.KEYPAD_EVENT, function (event)
            local key = tonumber(event.code)
            local params = {}
            if key == tonumber(cc.KeyCode.KEY_ESCAPE) then
                local args = {}
                local sigs = "()V"
                local luaj = require "cocos.cocos2d.luaj"
                local className = "org.cocos2dx.lua.AppActivity"
                local ok,ret  = luaj.callStaticMethod(className,"oppoExit",args,sigs)
            end
        end)
    end
    --进度条
    self.schedulerEntry = nil
    self.progressOut = display.newSprite("loadingAni/progressOut.png")
        :pos(0,-110)
        --:addTo(self.root)
    self.root:addChild(self.progressOut)
    self.progress = display.newProgressTimer("loadingAni/progress.png",
        display.PROGRESS_TIMER_BAR)
        :pos(833/2, 39/2)
        :addTo(self.progressOut,10)
    self.progressOut:setVisible(false)
    self.progress:setBarChangeRate(cc.p(1, 0))
    self.progress:setMidpoint(cc.p(0, 0))

    -- 记录当前正在播放的动画，用来做点击以后的动画快进
    self.allPainter = nil
    self.curProcess = 1
    self.curImage = nil
    self.maxIdxGroup = {}
    self.allPainter = painterData.getAll()
    --用来设置层级 出现越早层级越高 这样左侧进入的时候不会挡住前面的图
    self.zOrder = #self.allPainter
    self.allGroup = painterData.getGroup()
    for k = 1,self.allGroup do
        self.maxIdxGroup[k] = painterData.getPageNum(k)
    end
    self.idx = 1
    self.idxLoad = 0
    self:showChoosePage()

    viewMgr.show(viewMgr.def.MOUSE_UI)
    -- 播放音乐
    AudioEngine.preloadMusic("music/begin.mp3", true)
    
    if GlobalData.getMusicOn() then
        AudioEngine.playMusic("music/begin.mp3", true)
        local percent = GlobalData.getMusicVolume()
        AudioEngine.setMusicVolume(percent/100)
    end
    GlobalData.setMusicName("music/begin.mp3")
    GlobalData.setLanguage("CN")
    self.gameName:setTexture("ui/Language/name_CN.png")
    self.layer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return self:onTouch(event.name, event.x, event.y)
    end)
end
function ChooseUI:onExit()
    self.idxLoad = 0
    if self.schedulerEntry ~= nil then
        scheduler:unscheduleScriptEntry(self.schedulerEntry)
        self.schedulerEntry = nil
    end
end
-- 点击了漫画的页面，根据点击的次数来处理
function ChooseUI:onTouch(event, x, y)
    if event == "began" then
        return true
    elseif event == "moved" then
    elseif event == "ended" then
        local image = self.layer:getChildByTag(self.curProcess)
        if image and self.curProcess <= #self.allPainter then
            self.curImage:stopActionByTag(self.curProcess)
        end
        self:setImage()
        if self.maxIdxGroup[self.idx] then
            if self.curProcess > self.maxIdxGroup[self.idx] then
                self.idx = self.idx + 1
                self.layer:removeAllChildren()
                self:doShowPainterOne()
            end
        end
		if x <= self.middlePos_X and y >= self.middlePos_Y then
            if (self.flag_1 == 0 and self.flag_2 == 0 and self.flag_3 == 0)
                or(self.flag_1 == 1 and self.flag_2 == 1 and self.flag_3 == 0) then
                self.flag_1 = self.flag_1 + 1
            end
        elseif x >= self.middlePos_X and y >= self.middlePos_Y then
            if (self.flag_1 == 1 and self.flag_2 == 0 and self.flag_3 == 0)
                or(self.flag_1 == 2 and self.flag_2 == 1 and self.flag_3 == 0) then
                self.flag_2 = self.flag_2 + 1
            end
        elseif x <= self.middlePos_X and y <= self.middlePos_Y then
            if self.flag_1 == 2 and self.flag_2 == 2 and self.flag_3 == 0 then
                self.flag_3 = self.flag_3 + 1
            end
        end
        if self.flag_1 > 2 or self.flag_2 > 2 or self.flag_3 > 1 then
            self.flag_1 = 0
            self.flag_2 = 0
            self.flag_3 = 0
        end
        if self.flag_1 == 2 and self.flag_2 == 2 and self.flag_3 == 1 then
            local colorLayer = cc.LayerColor:create(cc.c4b(0, 0, 0,0))
            colorLayer:setName("colorLayer")
            local nameSize = self.gameName:getContentSize()
            colorLayer:setOpacity(180)
            local text_1 = ccui.Text:create("杭州米趣网络科技有限公司",GLOBAL_FONTNAME,20)
            colorLayer:setPosition(cc.p(-380,-205))
            text_1:setPosition(cc.p(self.bgSize.width/2,self.bgSize.height/2+20))
            colorLayer:addChild(text_1)
            local text_2 = ccui.Text:create("http://www.miqtech.com",GLOBAL_FONTNAME,20)
            text_2:setPosition(cc.p(self.bgSize.width/2,self.bgSize.height/2-20))
            colorLayer:addChild(text_2)
            self.gameName:addChild(colorLayer)
            self.flag_1 = 0
            self.flag_2 = 0
            self.flag_3 = 0
        end
    end
end

-- 做开场动画的分帧显示
function ChooseUI:doShowPainterOne()

    local function showPainter()
        
        if self.maxIdxGroup[self.idx] ~= nil and self.curProcess <= self.maxIdxGroup[self.idx] then
            local curData = painterData.get(self.curProcess)  
            if curData.ShowType ==  painterData.aniType.fadeIn then
                self:doFadeAni(curData,showPainter)
            elseif  curData.ShowType ==  painterData.aniType.leftIn then
                self:doLeftToRightAni(curData,showPainter)
            elseif  curData.ShowType ==  painterData.aniType.Scale then
                self:doScaleAni(curData,showPainter)
            else
                self:doLeftShowAni(curData,showPainter)
            end  
            self.curProcess = self.curProcess + 1 
        end 
    end
    if self.maxIdxGroup[self.idx] ~= nil then 
        if self.maxIdxGroup[self.idx] ~= nil then            
            showPainter()
        else
            local function callBack(args)
                local gameScene = require("hall.HallScene")
                AudioEngine.stopMusic()
                display.replaceScene(gameScene.new())
            end
            self:loadingRes(callBack)
        end
    else
        local function callBack(args)
            local gameScene = require("hall.HallScene")
            AudioEngine.stopMusic()
            display.replaceScene(gameScene.new())
        end
        GlobalData.setPainterHasShow()
        self:loadingRes(callBack)        
    end
end
--快速关闭动画后
function ChooseUI:setImage()
    local curData = painterData.get(self.curProcess)  
    if curData then
        if self.curImage and self.curImage.seq then
            AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
            local act = cc.Speed:create(self.curImage.seq,1000.0)
            self.curImage:runAction(act)
            self.curImage.seq = nil
        end
    end
end
-- 制作隐现的动画
function ChooseUI:doFadeAni(data,func)
    
    local imgName = data.Path
    local LanFlag = GlobalData.getLanguage()
    local path = string.split(data.Path,"painter/")
    for i = 1,#path do
        if i == 1 then
            imgName = "painter/"..LanFlag.."/"
        else
            imgName = imgName..path[i]
        end
    end
    local posX = data.Pos_X
    local posY = 1280 - data.Pos_Y
    local img = display.newSprite(imgName)
        :setTag(self.curProcess)
        :addTo(self.layer)
        :pos(posX + 35, posY - 554)
    self.curImage = img
    img:setOpacity(0)
    local function func1()
        if func then
            self.seq = nil
            img.seq = nil
            func()
        end
    end
    local act1 = cc.FadeIn:create(data.Time/1000)
    local act2 = cc.CallFunc:create(func1)
    local seq  = cc.Sequence:create(act1,act2)
    self.seq = seq
    img.seq = seq
    seq:setTag(self.curProcess)
    img:runAction(seq)
end

-- 制作从左到右出现的动画
function ChooseUI:doLeftToRightAni(data,func)
   local imgName = data.Path
    local LanFlag = GlobalData.getLanguage()
    local path = string.split(data.Path,"painter/")
    for i = 1,#path do
        if i == 1 then
            imgName = "painter/"..LanFlag.."/"
        else
            imgName = imgName..path[i]
        end
    end
    local posX = data.Pos_X
    local posY = 1280 - data.Pos_Y
    local img = display.newSprite(imgName)
        :setTag(self.curProcess)
        :addTo(self.layer)
    local size = img:getContentSize()
    img:setPosition(cc.p(-size.width/2, posY - 554))    
    self.curImage = img
    local function func1()
        if func then
            self.seq = nil
            img.seq = nil
            func()
        end
    end
    local act1 = cc.MoveTo:create(data.Time/1000,cc.p(posX + 35, posY - 554))
    local act2 = cc.CallFunc:create(func1)
    local seq  = cc.Sequence:create(act1,act2)
    --local img1 = ccui.LayoutComponent:bindLayoutComponent(img)
    --img1:setPositionPercentX( 100 )
    self.seq = seq
    img.seq = seq
    seq:setTag(self.curProcess)
    img:runAction(seq)
end
--快速缩放
function ChooseUI:doScaleAni(data,func)
   local imgName = data.Path
    local LanFlag = GlobalData.getLanguage()
    local path = string.split(data.Path,"painter/")
    for i = 1,#path do
        if i == 1 then
            imgName = "painter/"..LanFlag.."/"
        else
            imgName = imgName..path[i]
        end
    end
    local posX = data.Pos_X
    local posY = 1280 - data.Pos_Y
    local img = display.newSprite(imgName)
        :setTag(self.curProcess)
        :pos(posX + 35, posY - 554)
        :setScale(0.3)
        :addTo(self.layer)
    self.curImage = img
    local function func1()
        if func then
            func()
        end
    end
    local act1 = cc.ScaleTo:create(data.Time/1000,data.Scale)
    local act2 = cc.CallFunc:create(func1)
    local seq  = cc.Sequence:create(act1,act2)
    self.seq = seq
    img.seq = seq
    seq:setTag(self.curProcess)
    img:runAction(seq)
end
--从左显现
function ChooseUI:doLeftShowAni(data,func)
   local imgName = data.Path
    local LanFlag = GlobalData.getLanguage()
    local path = string.split(data.Path,"painter/")
    for i = 1,#path do
        if i == 1 then
            imgName = "painter/"..LanFlag.."/"
        else
            imgName = imgName..path[i]
        end
    end
    local posX = data.Pos_X
    local posY = 1280 - data.Pos_Y
    local img = display.newSprite(imgName)
        :setTag(self.curProcess)
        :addTo(self.layer)
    local size = img:getContentSize()
    local x = posX + 35-size.width/2
    img:setPosition(cc.p(x, posY - 554))    
    self.curImage = img
    img:setOpacity(0)
    local function func1()
        if func then
            self.seq = nil
            img.seq = nil
            func()
        end
    end
    local act_1 = cc.MoveTo:create(data.Time/1000,cc.p(posX + 35, posY - 554))
    local act_2 = cc.FadeIn:create(data.Time/1000)
    local act1 = cc.Spawn:create(act_1,act_2)
    local act2 = cc.CallFunc:create(func1)
    local seq  = cc.Sequence:create(act1,act2)
    self.seq = seq
    img.seq = seq
    seq:setTag(self.curProcess)
    img:runAction(seq)
end
-- 显示选择语言页面
function ChooseUI:showChoosePage( ... )
 
    --左侧精灵
    self.m1 = result.m1
    local x_1,y_1 = self.m1:getPosition()
    local m1_size = self.m1:getContentSize()
    self.m1:setPosition(cc.p(-m1_size.width*2,y_1))
    --右侧精灵
    self.m2 = result.m2
    local x_2,y_2 = self.m2:getPosition()
    local m2_size = self.m2:getContentSize()
    self.m2:setPosition(cc.p(display.width+m2_size.width,y_1))
    --中间图
    self.gameName = result.gameName
    self.gameName:setScale(0.5)
    --开始游戏
    self.enter = result.enter
    self.enter:setVisible(false)
    local fadeOut = cc.FadeOut:create(0.01)
    self.enter:runAction(fadeOut)
    self.bg = result.Image_2

    self.bgSize = self.bg:getContentSize()
    self.middlePos_X = self.bgSize.width/2
    self.middlePos_Y = self.bgSize.height/2

    --开场动画
    local scale_1 = cc.ScaleTo:create(0.3,1.2)
    local scale_2 = cc.ScaleTo:create(0.15,1)
    local function scaleBack()
        local move_1 = cc.MoveTo:create(0.5,cc.p(x_1,y_1))
        self.m1:runAction(move_1)
        local move_2 = cc.MoveTo:create(0.5,cc.p(x_2,y_2))
        local function moveBack()
            self.enter:setVisible(true)
            local fadeIn = cc.FadeIn:create(0.1)
            self.enter:runAction(fadeIn)        
        end
        local fadeIn = cc.Sequence:create(move_2,cc.CallFunc:create(moveBack))
        self.m2:runAction(fadeIn)
    end
    local function moveBack()
        local fadeIn = cc.FadeIn:create(0.1)
        self.enter:runAction(fadeIn)        
    end
    local scale = cc.Sequence:create(scale_1,scale_2,cc.CallFunc:create(scaleBack))
    self.gameName:runAction(scale)

    self.textHint = result.Text_7
    self.textHint:setFontName(GLOBAL_FONTNAME)
    self.chooseBtn = result.choose
    self.chooseBtn:setVisible(false)
    self.textHint:setVisible(false)
    --[[local language = GlobalData.getLanguage()
    if language == "EN" then
        self.textHint:setString("EN")
        self.chooseBtn:loadTextures("ui/Language/en.png","ui/Language/en.png",nil)
        self.gameName:setTexture("ui/Language/name_EN.png")
    else
        self.textHint:setString("中文")
        self.chooseBtn:loadTextures("ui/Language/cn.png","ui/Language/cn.png",nil)
        self.gameName:setTexture("ui/Language/name_CN.png")
    end--]] 
    self:addChild(result.root)
end
function ChooseUI:barSet()
    self.enter:setVisible(false)
    self.gameName:setVisible(false)
    self.m1:setVisible(false)
    self.m2:setVisible(false)
    local node = cc.CSLoader:createNode("tower/jitan.csb")
    local action = cc.CSLoader:createTimeline("tower/jitan.csb")
    node:runAction(action)
    action:gotoFrameAndPlay(0)
    node:setPosition(cc.p(675,430))
    self.bg:addChild(node,100)
    self.bg:loadTexture("loadingAni/bg.jpg")
end
function ChooseUI:font()
    local LoadingTips    = require("app.properties.LoadingTips")
    -- 提示文字
    local tips = LoadingTips.getAll()
    if GlobalData.getLanguage() == "CN" then
        tips = tips["CN"]
    else
        tips = tips["EN"]
    end
    math.randomseed(os.time())
    local index = math.random(#tips)
    local loadingTips = display.newTTFLabel({
        text = tips[index],
        font = GLOBAL_FONTNAME,
        size = 22,
    })
    :pos(0,-60)
    loadingTips:enableOutline(cc.c4b(0, 0, 0, 255), 1)
    return loadingTips
end
function ChooseUI:loadingRes(callBack)
    self:barSet()
    self.root:setVisible(true)
    self.idxLoad = 0
    self.effAniData   = require("app.properties.EffectProperties")
    self.schedulerEntry = nil
    local node = self:font()
    self.root:addChild(node,11)
    if self.progressOut and self.progress then
        self.progressOut:setVisible(true)
        local function loadcallback()
            if self.idxLoad == nil then return end
            self.idxLoad = self.idxLoad + 1
            if self.idxLoad > 10 then
                if self.schedulerEntry ~= nil then
                    scheduler:unscheduleScriptEntry(self.schedulerEntry)
                    self.schedulerEntry = nil
                end
                if callBack then
                    callBack()
                end
                return
            end
            self.progress:setPercentage(self.idxLoad * 10)
            local function onStart()
                if self.schedulerEntry ~= nil then
                    scheduler:unscheduleScriptEntry(self.schedulerEntry)
                    self.schedulerEntry = nil
                end
                if self.idxLoad == 1 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/chooseModel/bg.png",loadcallback)
                elseif self.idxLoad == 2 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/encyclopedia/bg.png", loadcallback)
                elseif self.idxLoad == 3 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/heroHome/bg1350.jpg", loadcallback)
                elseif self.idxLoad == 4 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/wordMap/bg.jpg", loadcallback)
                elseif self.idxLoad == 5 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/informate/bg.png", loadcallback)
                elseif self.idxLoad == 6 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/wordMap/ditu2.png", loadcallback)
                elseif self.idxLoad == 7 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/wordMap/ditu3.png", loadcallback)
                elseif self.idxLoad == 8 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/wordMap/ditu4.png", loadcallback)
                elseif self.idxLoad == 9 then
                    cc.Director:getInstance():getTextureCache():addImageAsync("ui/hall/wordMap/ditu5.png", loadcallback)
                elseif self.idxLoad == 10 then
                    for i = 1,6 do
                        if i ~= 4 and i ~= 5 then
                            local name = string.format("ui_map_%d",i)
                            EffectAniCache.addEffectAniCache(name,self.effAniData[name])
                        end
                    end
                    --local skeletonNode_1 = sp.SkeletonAnimation:create("ui/hall/heroHome/ui_hero_background.json","ui/hall/heroHome/ui_hero_background.atlas",1.3)
                    --SpineCache.addSpineCache("ui_hero_background",skeletonNode_1)
                    --local skeletonNode_2 = sp.SkeletonAnimation:create("ui/hall/heroHome/ui_hero_background_2.json","ui/hall/heroHome/ui_hero_background_2.atlas",0.8)
                    --SpineCache.addSpineCache("ui_hero_background",skeletonNode_1)
                    --SpineCache.addSpineCache("ui_hero_background_2",skeletonNode_2)
                    EffectAniCache.addEffectAniCache("eff_package_2",self.effAniData.eff_package_2)
                    EffectAniCache.addEffectAniCache("eff_package_1",self.effAniData.eff_package_1)
                    loadcallback()
                else
                    return
                end
            end
            self.schedulerEntry = scheduler:scheduleScriptFunc(onStart,0, false)
        end
        loadcallback()
    end
end
return ChooseUI