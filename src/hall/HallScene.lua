
require "cocos.spine.SpineConstants"



--local ChooseModePanel = require("hall.ChooseModePanel")
local HeroHomeTest    = require("hall.HeroHomeTest")
local Ani_100401      = require("app.animation.Ani_100401")
local math2d          = require("math2d")
local GlobalData      = require("tools.GlobalData")
local EffectAniCache  = require("app.map.spine.EffectAniCache")

local hall                = require("hall.worldHall") 
local ChooseModePanelTest = require("hall.ChooseModePanelTest")
local HeroHomePanelTest   = require("hall.HeroHomePanelTest")
local FirstGuideAni       = require("ui.FirstGuideAni")

local socket = require("socket")




local HallScene = class("HallScene", function()
    return display.newScene("HallScene")
end)

local random = math.random

function HallScene:ctor(showNextLv)
    self:setName("HallScene")
    print("HallScene:ctor showNextLv = "..tostring(showNextLv))

    -- change by Owen, 2016.5.10, 语言包放到hallScene里面去Require
    if GlobalData.getLanguage() == "CN" then
        WordLanguage = require("tools.Language")
    else
        WordLanguage = require("tools.Language_EN")
    end
    -- 载入cocostudio中导出的世界地图页面
    local worldUI = hall:new(showNextLv)
    local page = worldUI:getPage()
    page:setPosition(cc.p(display.cx,display.cy))
    self:addChild(page)

    -- 如果剧情引导没有显示过，则需要显示剧情引导
    if NEED_NEW_GUIDE and not GlobalData.getStoryGuideHasShow() then
        print("worldUI = "..tostring(worldUI))
        local firstGuideAni = FirstGuideAni:new(worldUI)
        self:addChild(firstGuideAni)
    end
end
function HallScene:onEnter()
    -- 播放音乐
    if GlobalData.getMusicOn() then
        AudioEngine.playMusic("music/hall.mp3", true)
        local percent = GlobalData.getMusicVolume()
        AudioEngine.setMusicVolume(percent/100)
    end
    GlobalData.setMusicName("music/hall.mp3")

    viewMgr.show(viewMgr.def.MOUSE_UI)
end
function HallScene:onExit()
end

return HallScene
