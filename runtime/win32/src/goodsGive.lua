local GlobalData = require("tools.GlobalData")
local StoreData  = require("app.properties.DiamondProperties")
local getWayData = nil
--if device.platform == "windows" then
--    getWayData= require("app.properties.HeroGetWayProperties_PC")
--else
    getWayData= require("app.properties.HeroGetWayProperties")
--end
--1 充值成功 2 充值失败
goodsGiveId = {
    pack_1 = "package01",
    pack_2 = "package02",
    diamond_1 = "1",
    diamond_2 = "2",
    diamond_3 = "3",
    hero_1    = "hero_110203",
    hero_2    = "hero_110301",
    hero_3    = "hero_110205"
}
function RechargeBack(flag)
    print(">>>>>>>>>>>>>>>RechargeBack(flag)<<<<<<<<<<<<<<<<<<<")
    if flag == "success" then
        local str_1 = WordLanguage.buySuccess
        local str_2 = WordLanguage.buyStr_1
        local curScence = display.getRunningScene()
        local goodsType = GlobalData.getCurBuyGoods()
        if goodsType == goodsGiveId.pack_1 then
            local num = GlobalData.getLimitBuyNum()
            GlobalData.addDiamondCount(20)
            GlobalData.setTimeHero("110205",5,true)    
            GlobalData.setLimitBuyNum(num-1)  
            GlobalData.setBuyTime()
            umengSdk.pay(tostring(1),tostring(20),PAYCHANNEL)
            local string = string.format("%s,%s:%s",str_1,str_2,"超值礼包")
            utils.createAniFont(string,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.pack_2 then
            local num = GlobalData.getOneBuyTime()
            GlobalData.addDiamondCount(300)
            if not GlobalData.getHeroActive("110203") then
                GlobalData.setCurActiveHero("110203")
            end
            GlobalData.setOneBuyTime(num-1)
            umengSdk.pay(tostring(30),tostring(300),PAYCHANNEL)
            local string = string.format("%s,%s:%s",str_1,str_2,"每日礼包")
            utils.createAniFont(string,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.diamond_1 then
            local allData = StoreData:getAll()  
            local buyCount = allData[1].addCount + allData[1].count
            GlobalData.addDiamondCount(buyCount)
            umengSdk.pay(tostring(allData[1].money),tostring(buyCount),PAYCHANNEL)
            local str_3 = WordLanguage.diamond
            local str = string.format("%s,%s:%d%s",str_1,str_2,90,str_3)
            utils.createAniFont(str,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.diamond_2 then
            local allData = StoreData:getAll() 
            local buyCount = allData[2].addCount + allData[2].count 
            GlobalData.addDiamondCount(buyCount)
            umengSdk.pay(tostring(allData[2].money),tostring(buyCount),PAYCHANNEL)
            local str_3 = WordLanguage.diamond
            local str = string.format("%s,%s:%d%s",str_1,str_2,300,str_3)
            utils.createAniFont(str,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.diamond_3 then
            local allData = StoreData:getAll()  
            local buyCount = allData[3].addCount + allData[3].count 
            GlobalData.addDiamondCount(buyCount)
            umengSdk.pay(tostring(allData[3].money),tostring(buyCount),PAYCHANNEL)
            local str_3 = WordLanguage.diamond
            local str = string.format("%s,%s:%d%s",str_1,str_2,550,str_3)
            utils.createAniFont(str,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.hero_1 then
            local id  = string.split(goodsGiveId.hero_1,"_")[2]
            GlobalData.setCurActiveHero(id)          
            local data = getWayData.get(id)
            local curField = utils.getName("text")
            local needDIaCount = string.split(data[curField],"$")[2]
            local num = GlobalData.getOneBuyTime()
            GlobalData.setOneBuyTime(num-1)
            umengSdk.moneyPay(tostring(needDIaCount),goodsGiveId.hero_1,1,tostring(15*needDIaCount),PAYCHANNEL)
            local string = string.format("%s,%s:%s",str_1,str_2,"英雄凯尔")
            utils.createAniFont(string,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        elseif goodsType == goodsGiveId.hero_2 then
            local id  = string.split(goodsGiveId.hero_2,"_")[2]
            GlobalData.setCurActiveHero(id)     
            local data = getWayData.get(id)
            local curField = utils.getName("text")
            local needDIaCount = string.split(data[curField],"$")[2]
            umengSdk.moneyPay(tostring(needDIaCount),goodsGiveId.hero_2,1,tostring(15*needDIaCount),PAYCHANNEL) 
            local string = string.format("%s,%s:%s",str_1,str_2,"英雄赛尔瑞")
            utils.createAniFont(string,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)       
        elseif goodsType == goodsGiveId.hero_3 then
            local id  = string.split(goodsGiveId.hero_3,"_")[2]
            GlobalData.setCurActiveHero(id)
                       
            local data = getWayData.get(id)
            local curField = utils.getName("text")
            local needDIaCount = string.split(data[curField],"$")[2]
            umengSdk.moneyPay(tostring(needDIaCount),goodsGiveId.hero_3,1,tostring(15*needDIaCount),PAYCHANNEL)
            local string = string.format("%s,%s:%s",str_1,str_2,"英雄爱丽丝")
            utils.createAniFont(string,curScence,nil,nil,cc.p(display.cx,display.cy), 1.5, 2.0)
        end
        GlobalData.setCurBuyGoods(0)
        NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
        viewMgr.hide(viewMgr.def.Touch_UI)
    else
        -- change by Owen, 2016.6.26, oppo sdk购买失败之后，需要将 "正在处理中" 的遮罩隐藏掉
        viewMgr.hide(viewMgr.def.Touch_UI)
    end
end
function hideTouch()
    viewMgr.hide(viewMgr.def,Touch_UI)
end