local globalData = require("tools.GlobalData")
local GetTips = class("ui.GetTipsUI")
local getWayData = nil
--if device.platform == "windows" then
--    getWayData= require("app.properties.HeroGetWayProperties_PC")
--else
    getWayData= require("app.properties.HeroGetWayProperties")
--end
local HeroProperties         = require("app.properties.HeroProperties")
local buyType = {
    DEFAULT = 0,
    DIAMOND = 1,
    MONEY   = 2
}
local GlobalData            = require("tools.GlobalData")
function GetTips:ctor(onSelf,id)
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "ClickEvent" then
            return function ()
                if node:getName() == "buyBtn" then
                    if self.Goods and self.Goods == buyType.DIAMOND then
                        if self.isCount then
                            if not GlobalData.getHeroActive(id) then
                                AudioMgr.playSound(AudioMgr.allUIEffect.Purchase,false)
                                GlobalData.setCurActiveHero(id)
                                GlobalData.addDiamondCount(-self.needDIaCount)
                                NotifyCenter.notify(EventNames.BUY_HERO_SUCCESS)
                                local strId = string.format("hero_%s",id)
                                umengSdk.buy(strId,1,tostring(self.needDIaCount))
                                NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
                                viewMgr.show(viewMgr.def.GETNEWHERO_UI,id)
                                viewMgr.hide(viewMgr.def.GETTIPS_UI)
                            end
                        else
                            viewMgr.show(viewMgr.def.STORE_UI)
                        end
                    else
                        local networkStr = WordLanguage.netWork
                        local curScence  = display.getRunningScene()
                        AudioMgr.pauseAllAudio()
                        if device.platform ~= "windows" then
                            viewMgr.show(viewMgr.def.Touch_UI)
                            local networkState = network.getInternetConnectionStatus()
                            if 0 ~= networkState then
                                if not GlobalData.getHeroActive(id) then
                                    local heroId = string.format("hero_%s",id)
                                    globalData.setCurBuyGoods(heroId)
                                    local args = {heroId}
                                    local sigs = "(Ljava/lang/String;)V"
                                    local luaj = require "cocos.cocos2d.luaj"
                                    local className = "org.cocos2dx.lua.AppActivity"
                                    local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
                                end
                            else 
                                utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
                                viewMgr.hide(viewMgr.def.Touch_UI)
                            end
                        else
                            local heroId = string.format("hero_%s",id)
                            GlobalData.setCurBuyGoods(heroId)
                            RechargeBack("success")         
                        end
                    end
                    --AudioMgr.resumeAllAudio()
                    --NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
                    viewMgr.hide(viewMgr.def.GETTIPS_UI)
                end
                if node:getName() == "Panel_1" then
                    AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                    viewMgr.hide(viewMgr.def.GETTIPS_UI)
                    return
                end     
            end         
        end      
    end
    --什么类型货币购买
    self.Goods = buyType.DEFAULT
    --是否有足够的钻石购买
    self.isCount = false
    self.needDIaCount = 0
    local result = import("ui.GetTipsStudio").create(clickBack)
    self.page = result.root
    local textFrame = result.bg_3
    local icon = result.icon
    local buyBtn = result.buyBtn 
    local size = textFrame:getContentSize()
    local data = getWayData.get(id)
    local curField = utils.getName("text")
    if data then
        icon:loadTexture(string.format("ui/Icons/heroIcon/%d.png",data.mainID))
        local idx = utils.getName("money")
        if data[idx] > 0 then
            buyBtn:setVisible(true)
            local content = string.split(data[curField],"$")
            local richText = ccui.RichText:create()
            richText:setOutLine(cc.c4b(0,0,0,255),2)
            richText:setPosition(size.width/2,size.height/2)
            textFrame:addChild(richText)
            --钻石数量
            local curDiaCount = GlobalData.getDiamondCount()
            local needDIaCount = 0
            if content[1] then
                local elem = ccui.RichElementText:create(1, cc.c3b(255,255,255),255,content[1],GLOBAL_FONTNAME,32)
                richText:pushBackElement(elem)
            end
            needDIaCount = tonumber(content[2])
            if content[3] then
                local path = nil
                if "diamond" == content[3] then
                    self.Goods = buyType.DIAMOND
                    if needDIaCount <= curDiaCount then
                        self.isCount = true
                        self.needDIaCount = needDIaCount
                    end
                    path = "ui/getTips/zuan.png"
                elseif "money" == content[3] then
                    path = utils.getName("ui/getTips/money","png")
                    self.needDIaCount = needDIaCount
                end
                local elem = ccui.RichElementImage:create(1, cc.c3b(255, 255, 255), 255,path)
                richText:pushBackElement(elem)
            end
            if content[2] then               
                local str = string.format("%.2f",needDIaCount)
                local elem = ccui.RichElementText:create(1, cc.c3b(255,251,1),255,str,GLOBAL_FONTNAME,32)
                richText:pushBackElement(elem)
            end
            if content[4] then
                local elem = ccui.RichElementText:create(1, cc.c3b(255,255,255),255,content[4],GLOBAL_FONTNAME,32)
                richText:pushBackElement(elem)
            end
        else
            local content = data[curField]
            local text = ccui.Text:create(content,GLOBAL_FONTNAME,26)    
            text:enableOutline(cc.c4b(0,0,0,255),2)
            text:setPosition(size.width/2,size.height/2)
            textFrame:addChild(text)
            textFrame:setPositionY(textFrame:getPositionY()-20)
            buyBtn:setVisible(false)
        end
    end
    local Panel = result.Panel_1
    utils.playAction(self.page,Panel,true)
end
function GetTips:getPage()
    return self.page
end

return GetTips
