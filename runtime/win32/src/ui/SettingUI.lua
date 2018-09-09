local setting = class("ui.SettingUI")
local globleData = require("tools.GlobalData")
--self 类对象
--开启类型 1.暂停 2.设置
function setting:ctor(self,type,param)
    self.all = 1
    local clickBack = function(luaFileName,node,callbackName)
        return function()
            if callbackName == "clickEvent" then
                AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                if node:getName() == "close" then
                    if param then
                        if globleData.getMusicOn() then
                            AudioEngine.resumeMusic()
                        end
                        param:resumePlay()
                    end
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    return
                end
                if node:getName() == "backBtn" then
                    if param then
                        if globleData.getMusicOn() then
                            AudioEngine.resumeMusic()
                        end
                        param:resumePlay()
                    end
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    return
                end
                if node:getName() == "rePlayBtn" then
                    if param then
                        local level = utils.getSDKLevelID()
                        umengSdk.setLevelStart(level,3)
                        param:restart()
                    end
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    return
                end
                if node:getName() == "menuBtn" then
                    local level = utils.getSDKLevelID()
                    umengSdk.setLevelStart(level,3)
                    local BenchmarkScene = require("hall.HallScene")
                    display.replaceScene(BenchmarkScene.new())
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    return
                end
                if node:getName() == "backBtn_1" then
                    if param then
                        param:resumePlay()
                    end
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    return
                end
                if node:getName() == "exit" then
                    local BenchmarkScene = require("ui.EnterChooseUI")
                    display.replaceScene(BenchmarkScene.new(true))
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                end
            end
         end  
    end
    local result = import("ui.SettingStudio").create(clickBack)
    self.page = result.root
    local panel_Pause = result.Panel_1
    local titleFrame = result.Panel_5  
    local titleID = result.passID          
    local image = result.Image_1

    local backTxt   = result.backTxt
    local str = WordLanguage.Back
    if type == 1 then
        str = WordLanguage.continue
    end
    backTxt:setFontName(GLOBAL_FONTNAME)
    backTxt:setString(str)
    backTxt:enableOutline(cc.c4b(0,0,0,255),2)

    local rePlayTxt = result.rePlayTxt
    local str = WordLanguage.rePlay
    rePlayTxt:setFontName(GLOBAL_FONTNAME)
    rePlayTxt:setString(str)
    rePlayTxt:enableOutline(cc.c4b(0,0,0,255),2)

    local menuTxt   = result.menuTxt
    local str = WordLanguage.menu
    menuTxt:setFontName(GLOBAL_FONTNAME)
    menuTxt:setString(str)
    menuTxt:enableOutline(cc.c4b(0,0,0,255),2)

    utils.playAction(self.page,image,true)
    if device.platform == "" then
        local function sliderChangedEvent(sender,eventType)
            local name = sender:getName()
            if eventType == ccui.SliderEventType.percentChanged then
                local percent = sender:getPercent()
                if name == "Slider_Music" then
                    AudioEngine.setMusicVolume(percent/100)
                    globleData.setMusicVolume(percent)
                elseif name == "Slider_Effect" then
                    globleData.setEffVolume(percent)
                    AudioEngine.setEffectsVolume(percent/100)
                end
            end
        end
        local effect = result.effect
        effect:setVisible(true)
        local music = result.music
        music:setVisible(true)
        local slider_Music  = result.Slider_Music
        slider_Music:setVisible(true)
        slider_Music:addEventListener(sliderChangedEvent)
        local delta = globleData.getMusicVolume()
        slider_Music:setPercent(delta)
        --设置音量
        local slider_Effect = result.Slider_Effect
        slider_Effect:setVisible(true)
        slider_Effect:addEventListener(sliderChangedEvent)
        local delta = globleData.getEffVolume()
        slider_Effect:setPercent(delta)
    else
        local musicTxt = ccui.Text:create(WordLanguage.Music,GLOBAL_FONTNAME,45)
        musicTxt:setTextColor(cc.c4b(36,6,6,255))
        musicTxt:setPosition(cc.p(175,230))
        panel_Pause:addChild(musicTxt)

        local effTxt = ccui.Text:create(WordLanguage.SoundEffect,GLOBAL_FONTNAME,45)
        effTxt:setTextColor(cc.c4b(36,6,6,255))
        effTxt:setPosition(cc.p(423,230))
        panel_Pause:addChild(effTxt)

        local function musicEvent(sender,eventType)
            if eventType == ccui.CheckBoxEventType.selected then
                globleData.setMusicOn(true)
                AudioEngine.playMusic(globleData.getMusicName(),true)
            elseif eventType == ccui.CheckBoxEventType.unselected then
                globleData.setMusicOn(false)
                AudioEngine.stopMusic()
            end
        end
        local function effEvent(sender,eventType)
            if eventType == ccui.CheckBoxEventType.selected then
                AudioMgr.setSoundOn(true)
            elseif eventType == ccui.CheckBoxEventType.unselected then
                AudioMgr.setSoundOn(false)
                AudioMgr.stopAllSound()
            end
        end
        local musicBox = ccui.CheckBox:create("ui/set/goukuang.png","ui/set/gou.png")
        musicBox:setName("musicBox")
        musicBox:setPosition(cc.p(270,230))
        panel_Pause:addChild(musicBox)
        musicBox:addEventListener(musicEvent) 
        local effBox = ccui.CheckBox:create("ui/set/goukuang.png","ui/set/gou.png")
        effBox:setName("effBox")
        effBox:setPosition(cc.p(530,230))
        panel_Pause:addChild(effBox)
        effBox:addEventListener(effEvent) 
        local effOn = AudioMgr.getSoundOn()
        if effOn then
            effBox:setSelected(true)
        else
            effBox:setSelected(false)
        end
        local musicOn = globleData.getMusicOn()
        if musicOn then
            musicBox:setSelected(true)
        else
            musicBox:setSelected(false)
        end
    end
    --
    local backBtn_1 = result.backBtn_1
    local exit      = result.exit
    local backBtn   = result.backBtn
    local rePlayBtn = result.rePlayBtn
    local menuBtn   = result.menuBtn

    local backTxt_1 = result.backTxt_1
    local str = WordLanguage.Back
    backTxt_1:setFontName(GLOBAL_FONTNAME)
    backTxt_1:setString(str)
    backTxt_1:enableOutline(cc.c4b(0,0,0,255),2)

    local exitTxt = result.exitTxt
    local str = WordLanguage.exit
    exitTxt:setFontName(GLOBAL_FONTNAME)
    exitTxt:setString(str)
    exitTxt:enableOutline(cc.c4b(0,0,0,255),2)

    if type == 1 then
        titleFrame:setVisible(true) 
        titleID:setString(globleData.getGameLv())
        backBtn_1:setVisible(false)
        exit:setVisible(false)
        backBtn:setVisible(true)
        rePlayBtn:setVisible(true)
        menuBtn:setVisible(true)
    else
        titleFrame:setVisible(false)
        backBtn_1:setVisible(true)
        exit:setVisible(true)
        backBtn:setVisible(false)
        rePlayBtn:setVisible(false)
        menuBtn:setVisible(false)
    end
end
function setting:getPage()
    return self.page
end
return setting
