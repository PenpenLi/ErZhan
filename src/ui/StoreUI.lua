--region NewFile_1.lua
--Author : GangDan_Wang
--Date   : 2016/3/18
--此文件由[BabeLua]插件自动生成
local StoreData  = require("app.properties.DiamondProperties")
local globalData = require("tools.GlobalData")
local StoreUI = class("ui.StoreUI")
local EffectAniCache        = require("app.map.spine.EffectAniCache")
function StoreUI:ctor(self,func)
    self.effAniData   = require("app.properties.EffectProperties")
    EffectAniCache.addEffectAniCache("ui_diamonds_4",self.effAniData.ui_diamonds_4)
    EffectAniCache.addEffectAniCache("ui_diamonds_3",self.effAniData.ui_diamonds_3)
    EffectAniCache.addEffectAniCache("ui_diamonds_2",self.effAniData.ui_diamonds_2)
    EffectAniCache.addEffectAniCache("ui_diamonds_1",self.effAniData.ui_diamonds_1)

    local clickBack = function(luaFileName,node,callbackName)  
        -- if callbackName == "ClickEvent" then
        --     return function ()
        --         if node:getName() == "Close" then  
        --             if func then
        --                 func()
        --             end  
        --             viewMgr.hide(viewMgr.def.STORE_UI)
        --             AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        --             return
        --         end 
        --         local networkStr = WordLanguage.netWork
        --         local curScence  = display.getRunningScene()
        --         local allData = StoreData:getAll()  
        --         viewMgr.show(viewMgr.def.Touch_UI)
        --         AudioMgr.pauseAllAudio()
        --         if node:getName() == "Button_1" then
        --             if device.platform ~= "windows" then
        --                 local networkState = network.getInternetConnectionStatus()
        --                 if 0 ~= networkState then
        --                     globalData.setCurBuyGoods(goodsGiveId.diamond_1)
        --                     local args = {goodsGiveId.diamond_1}
        --                     local sigs = "(Ljava/lang/String;)V"
        --                     local luaj = require "cocos.cocos2d.luaj"
        --                     local className = "org.cocos2dx.lua.AppActivity"
        --                     local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
        --                     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        --                     print(ok)
        --                 else                        
        --                     utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
        --                     viewMgr.hide(viewMgr.def.Touch_UI)
        --                 end
        --             else
        --                 globalData.setCurBuyGoods(goodsGiveId.diamond_1)
        --                 RechargeBack("success")
        --             end
        --         end
        --         if node:getName() == "Button_2" then
        --             if device.platform ~= "windows" then
        --                 local networkState = network.getInternetConnectionStatus()
        --                 if 0 ~= networkState then
        --                     globalData.setCurBuyGoods(goodsGiveId.diamond_2)
        --                     local args = {goodsGiveId.diamond_2}
        --                     local sigs = "(Ljava/lang/String;)V"
        --                     local luaj = require "cocos.cocos2d.luaj"
        --                     local className = "org.cocos2dx.lua.AppActivity"
        --                     local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
        --                     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        --                     print(ok)
        --                 else
        --                     utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
        --                     viewMgr.hide(viewMgr.def.Touch_UI)
        --                 end
        --             else
        --                 globalData.setCurBuyGoods(goodsGiveId.diamond_2)
        --                 RechargeBack("success")
        --             end
        --         end
        --         if node:getName() == "Button_3" then 
        --             if device.platform ~= "windows" then
        --                 local networkState = network.getInternetConnectionStatus()
        --                 if 0 ~= networkState then
        --                     globalData.setCurBuyGoods(goodsGiveId.diamond_3)
        --                     local args = {goodsGiveId.diamond_3}
        --                     local sigs = "(Ljava/lang/String;)V"
        --                     local luaj = require "cocos.cocos2d.luaj"
        --                     local className = "org.cocos2dx.lua.AppActivity"
        --                     local ok,ret  = luaj.callStaticMethod(className,"sdkPay",args,sigs)
        --                     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        --                     print(ok)
        --                 else
        --                     utils.createAniFont(networkStr,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5)
        --                     viewMgr.hide(viewMgr.def.Touch_UI)
        --                 end
        --             else
        --                 globalData.setCurBuyGoods(goodsGiveId.diamond_3)
        --                 RechargeBack("success")
        --             end
        --         end
        --         --AudioMgr.resumeAllAudio() 
        --         --NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL) 
        --     end         
        -- end      
    end
    local result = import("ui.FightNode").create(clickBack)
    self.page = result.root
    -- self.diamond_1 = result.diamond_6
    -- self.diamond_2 = result.diamond_7
    -- self.diamond_3 = result.diamond_8

    -- self.goods_1 = result.goods_1_3
    -- self.goods_2 = result.goods_2_4
    -- self.goods_3 = result.goods_3_5

    -- for i = 1,3 do
    --     local name = string.format("diamond_%d",i)
    --     local node = self[name]
    --     if node then
    --         local effect,offsetY,offsetX = EffectAniCache.getEffectAniCache("ui_diamonds_4",true)
    --         local size = effect:getContentSize()
    --         effect:setPosition(cc.p(size.width/2,size.height/2))
    --         node:addChild(effect)
    --     end
    --     local name_1 = string.format("goods_%d",i)
    --     local node_1 = self[name_1]
    --     if node_1 then
    --         local effName = string.format("ui_diamonds_%d",4-i)
    --         local effect,offsetY,offsetX = EffectAniCache.getEffectAniCache(effName,true)
    --         local size = effect:getContentSize()
    --         local posx = 0
    --         local posy = 0
    --         if i == 1 then
    --             posx = size.width - 13
    --             posy = size.height +14 
    --         elseif i == 2 then
    --             posx = size.width - 58
    --             posy = size.height +38 
    --         else
    --             posx = size.width/2 - 17
    --             posy = size.height/2 + 13
    --         end
    --         effect:setPosition(cc.p(posx,posy))
    --         node_1:addChild(effect)
    --     end
    -- end

 --    local panel = result.Panel_1
 --    local bg = result.Image_27
 --    local storeTitle = result.storeTitle
 --    local path = utils.getName("ui/store/store","png")
 --    storeTitle:setTexture(path)
 --    utils.playAction(self.page,bg,true)
 --    local function Close(target,event)
 --        if event == ccui.TouchEventType.ended then
 --            if func then
 --               func()
 --            end
 --            viewMgr.hide(viewMgr.def.STORE_UI)
 --        end
 --    end
 --    panel:addTouchEventListener(Close)
 --    local allData = StoreData:getAll()
 --    for key,value in pairs(allData) do
 --        local index = value.GoodsId
 --        local diaCount = string.format("Text_%d",index)
 --        local Text = result[diaCount]
 --        Text:setFontName(GLOBAL_FONTNAME)
 --        Text:enableOutline(cc.c4b(0,0,0,255),2)
 --        local buyTxtName = string.format("buy_%d",index)
 --        local buyTxt = result[buyTxtName]
 --        buyTxt:setFontName(GLOBAL_FONTNAME)
 --        buyTxt:enableOutline(cc.c4b(0,0,0,255),2)
 --        local awardName = string.format("award_%d",index)
 --        local awardTxt = result[awardName]
 --        if value.addCount > 0 then    
 --            if awardTxt then
 --                awardTxt:setFontName(GLOBAL_FONTNAME)
 --                awardTxt:setFontSize(20)
 --                awardTxt:enableOutline(cc.c4b(0,0,0,255),2)
 --                local str = WordLanguage.give
 --                awardTxt:setString(string.format("%s%d",str,value.addCount))
 --            end
 --        else            
 --        end
 --        Text:setString(value.count)
 --        local str = string.format("%s%.2f",WordLanguage.sign,value.money)
 --        buyTxt:setString(str)
 --    end
 --    local function onNodeEvent(event)
	-- 	if event == "enter" then
	-- 		self:onEnter()
	-- 	elseif event == "exit" then
	-- 		self:onExit()
	-- 	end
	-- end
    self.page:registerScriptHandler(onNodeEvent)
end
function StoreUI:onEnter()
end
function StoreUI:onExit()
end
function StoreUI:getPage()
    return self.page
end
return StoreUI
