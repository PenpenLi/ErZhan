
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

    -- self.layer:setTouchEnabled(true)
    -- viewMgr.show(viewMgr.def.MOUSE_UI)

end



function ChooseUI:onEnter()
    local CallBack = function(luaFileName, node, callbackName)
        -- if callbackName == "clickEvent" then
        --     return function()
        --         if self.gameName:getChildByName("colorLayer") then return end
        --         AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
        --         if node:getName() == "choose" then
        --             local language = GlobalData.getLanguage()
        --             if language == "CN" then
        --                 GlobalData.setLanguage("EN")
        --             else
        --                 GlobalData.setLanguage("CN")
        --             end
        --             language = GlobalData.getLanguage()
        --             if language == "CN" then
        --                 self.textHint:setString("中文")
        --                 self.gameName:setTexture("ui/Language/name_CN.png")
        --                 self.chooseBtn:loadTextures("ui/Language/cn.png","ui/Language/cn.png",nil)
        --             else
        --                 self.textHint:setString("EN")
        --                 self.gameName:setTexture("ui/Language/name_EN.png")
        --                 self.chooseBtn:loadTextures("ui/Language/en.png","ui/Language/en.png",nil)
        --             end
        --         end
        --         if node:getName() == "enter" then
        --             if not self.painterHasShow then
        --                 -- 显示第一幅漫画
        --                 if  self.root then
        --                     self.root:setVisible(false)
        --                 end
        --                 self:doShowPainterOne()
        --             else
        --                 local function callBack(args)
        --                     local gameScene = require("hall.HallScene")
        --                     AudioEngine.stopMusic()
        --                     display.replaceScene(gameScene.new())
        --                 end
        --                 if self.flag == nil  then
        --                     self:loadingRes(callBack)
        --                 else
        --                     callBack()
        --                 end
        --             end
        --         end
        --     end
        -- end
    end
    viewMgr.show(viewMgr.def.MOUSE_UI)
    viewMgr.show(viewMgr.def.ITEMSTORE_UI)

    -- result = import("ui.FightNode").create(CallBack)
    -- self.root = result.root
    -- self.root:setPosition(cc.p(display.cx,display.cy))
    -- self.root:setScale(GLOBAL_HALL_UI_SCALE2)

    -- self.layer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
    --     return self:onTouch(event.name, event.x, event.y)
    -- end)
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
    end
end

return ChooseUI