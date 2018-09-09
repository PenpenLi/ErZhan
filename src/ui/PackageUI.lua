local GlobalData             = require("tools.GlobalData")
local scheduler = cc.Director:getInstance():getScheduler()
local PackageUI = class("ui.PackageUI")
function PackageUI:ctor(onSelf,flag)
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function ()
                if node:getName() == "skillBtn_1" then
                    if self.manualSkillPro then
                        viewMgr.show(viewMgr.def.TIPS_UI,1,self.manualSkillPro)
                    end
                end
                if node:getName() == "skillBtn_2" then
                    if self.autoSkillPro then
                        viewMgr.show(viewMgr.def.TIPS_UI,1,self.autoSkillPro)
                    end
                end
                if node:getName() == "skillBtn_3" then
                    if self.passiveSkillPro then
                        viewMgr.show(viewMgr.def.TIPS_UI,1,self.passiveSkillPro)
                    end
                end
                local networkStr = WordLanguage.netWork
                local curScence  = display.getRunningScene()
                if node:getName() == "buyBtn" then
                    viewMgr.show(viewMgr.def.Touch_UI)
                    if flag == 1 then
                        local num = GlobalData.getLimitBuyNum()
                        local lastTime = GlobalData.getBuyTime()
                        local flag = utils.isExcDay(lastTime)
                        if num > 0 and flag then
                            if device.platform ~= "windows" then
                                local networkState = network.getInternetConnectionStatus()
                                if 0 ~= networkState then
                                    AudioMgr.pauseAllAudio()
                                    GlobalData.setCurBuyGoods(goodsGiveId.pack_1)
                                    local args = {goodsGiveId.pack_1}
                                    local sigs = "(Ljava/lang/String;)V"
                                    local luaj = require "cocos.cocos2d.luaj"
                                    local className = "org.cocos2dx.lua.AppActivity"
                                    local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
                                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                                    print(ok)
                                else                        
                                    utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
                                    viewMgr.hide(viewMgr.def.Touch_UI)
                                end
                            else
                                GlobalData.setCurBuyGoods(goodsGiveId.pack_1)
                                RechargeBack("success")
                            end                 
                        end
                    elseif flag == 2 then
                        local num = GlobalData.getOneBuyTime()
                        if num > 0 then
                            if device.platform ~= "windows" then
                                local networkState = network.getInternetConnectionStatus()
                                if 0 ~= networkState then
                                    AudioMgr.pauseAllAudio()
                                    GlobalData.setCurBuyGoods(goodsGiveId.pack_2)
                                    local args = {goodsGiveId.pack_2}
                                    local sigs = "(Ljava/lang/String;)V"
                                    local luaj = require "cocos.cocos2d.luaj"
                                    local className = "org.cocos2dx.lua.AppActivity"
                                    local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
                                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                                    print(ok)
                                else                        
                                    utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
                                    viewMgr.hide(viewMgr.def.Touch_UI)
                                end
                            else
                                GlobalData.setCurBuyGoods(goodsGiveId.pack_2)
                                RechargeBack("success")
                            end          
                        end
                    end                   
                    --AudioMgr.playSound(AudioMgr.allUIEffect.Purchase,false)
                    --AudioMgr.resumeAllAudio()
                    viewMgr.hide(viewMgr.def.Package_UI)
                    return
                end
                if node:getName() == "Image" then
                    viewMgr.hide(viewMgr.def.Package_UI)
                    return
                end
            end         
        end      
    end
    local result = import("ui.PackageStudio").create(clickBack)
    self.page = result.root
    local function listener(event)
        local name = event.name 
        if name == "enter" then
            self:onEnter()
        elseif name == "exit" then
            self:onExit()
        end
    end
    self.page:setNodeEventEnabled(true,listener)
    local Image = result.Image
    local bg = result.bg
    local Tips = result.flag
    utils.playAction(self.page,Image,true)
    self.timeTxt = result.timeTxt
    self.timeTxt:setFontName(GLOBAL_FONTNAME)
    self.timeTxt:enableOutline(cc.c4b(0,0,0,255),2)
    local timeStamp = GlobalData.getTimeStamp()
    self.time = timeStamp + 7*86400
    local str,timeExist = utils.totalTime(self.time)
    if GlobalData.getLimitBuyNum() > 0 and timeExist then
        self.timeTxt:setString(str)
    end
    local skillIcon_1 = result.Image_1
    local skillIcon_2 = result.Image_2
    local skillIcon_3 = result.Image_3
    local buyBtn      = result.buyBtn
    local ManualSkillProperties  = require("app.properties.ManualSkillProperties")
    local AutoSkillProperties    = require("app.properties.AutoSkillProperties")
    local PassiveSkillProperties = require("app.properties.PassiveSkillProperties")
    if flag == 1 then
        bg:loadTexture("ui/package/1.png")
        bg:setContentSize(cc.size(982,609))
        self.manualSkillPro = ManualSkillProperties.get("130171")
        skillIcon_1:loadTexture("ui/Icons/heroSkillIcon/"..self.manualSkillPro.icon..".png")

        self.autoSkillPro = AutoSkillProperties.get("130701")
        skillIcon_2:loadTexture("ui/Icons/heroSkillIcon/"..self.autoSkillPro.icon..".png")

        self.passiveSkillPro = AutoSkillProperties.get("130291")
        skillIcon_3:loadTexture("ui/Icons/heroSkillIcon/"..self.passiveSkillPro.icon..".png")

    elseif flag == 2 then
        skillIcon_1:setPosition(cc.p(-100,150))
        bg:loadTexture("ui/package/2.png")
        bg:setContentSize(cc.size(961,609))
        Tips:setPosition(cc.p(Tips:getPositionX()+42,Tips:getPositionY()))
        Tips:setTexture("ui/package/flag1.png")
        self.timeTxt:setVisible(false)
        buyBtn:setPositionX(buyBtn:getPositionX()+30)
        buyBtn:loadTextures("ui/package/btn_30_off.png","ui/package/btn_30_on.png",nil)
        skillIcon_2:setPosition(cc.p(-40,30))
        skillIcon_3:setPosition(cc.p(-100,-100))

        self.manualSkillPro = ManualSkillProperties.get("130151")
        skillIcon_1:loadTexture("ui/Icons/heroSkillIcon/"..self.manualSkillPro.icon..".png")

        self.autoSkillPro = AutoSkillProperties.get("130271")
        skillIcon_2:loadTexture("ui/Icons/heroSkillIcon/"..self.autoSkillPro.icon..".png")

        self.passiveSkillPro = PassiveSkillProperties.get("130331")
        skillIcon_3:loadTexture("ui/Icons/heroSkillIcon/"..self.passiveSkillPro.icon..".png")
    end
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
end
function PackageUI:cacleTime()
    local str,timeExist = utils.totalTime(self.time)
    if GlobalData.getLimitBuyNum() <= 0 or not timeExist then
        self.timeTxt = nil
        if self.schedulerTime then
            scheduler:unscheduleScriptEntry(self.schedulerTime)
            self.schedulerTime = nil
        end
    end
    if self.timeTxt then
        self.timeTxt:setString(str)
    end
end
function PackageUI:onEnter()
    if self.timeTxt:isVisible() then
        if self.schedulerTime == nil then
            self.schedulerTime = scheduler:scheduleScriptFunc(handler(self,self.cacleTime),1, false)
        end
    end
end
function PackageUI:onExit()
    if self.schedulerTime then
        scheduler:unscheduleScriptEntry(self.schedulerTime)
        self.schedulerTime = nil
    end
end
function PackageUI:getPage()
    return self.page
end
return PackageUI