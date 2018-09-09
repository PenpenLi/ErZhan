--local ChooseModePanel        = require("hall.ChooseModePanel")
local StableGameProperties   = require("app.properties.StableGameProperties")
local ChooseModePanelTest    = require("hall.ChooseModePanelTest")
local HeroHomePanelTest      = require("hall.HeroHomePanelTest")
local GlobalData             = require("tools.GlobalData")
local StoreUI                = require("ui.StoreUI")
local EffectAniCache         = require("app.map.spine.EffectAniCache")   

-- 是否开放所有关卡
local openAllTower           = true
if not NEED_NEW_GUIDE then
    openAllTower           = true
else
    openAllTower           = false
end
local achieveData = nil
if device.platform == "windows" and GLOBAL_SHOW_WIN_TYPE then
    achieveData= require("app.properties.AchievementsProperties_PC")
else
    achieveData= require("app.properties.AchievementsProperties")
end
local posAni = {{x=-315,y=55},{x=-301,y=-231},{x=135,y=-175},{x=416,y=16},{x=98,y=256},{x=142,y=48}}
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local scheduler = cc.Director:getInstance():getScheduler()
local worldHall = class("hall.worldHall")
function worldHall:ctor(onSelf,showNextLv)
    --设置时间戳
    self.showNextLv = showNextLv
    GlobalData.getTimeStamp()
    self.effAniData   = require("app.properties.EffectProperties")
    self.schedulerEntry = nil
    self.schedulerTime  = nil
    local callBack = function(luaFileName,node,callbackName)
          if callbackName == "clickEvent" then
             return function()
                 if self.showNextLv and self.showNextLv > 0 then return end
                 for i = 1,15 do
                    local name = string.format("towerBtn_%d",i)
                    if node:getName() == name then
                        if i > 1 then
                            local curTowerData = GlobalData.getLvStar(i-1)
                            if curTowerData[1][1] > 0 or curTowerData[1][2] > 0 or curTowerData[2] > 0 or curTowerData[3] > 0 or openAllTower then
                                self:changMap(i)
                                return
                            else
                            end 
                        else
                            self:changMap(i)
                            return
                        end
                    end
                 end
                 AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
                if node:getName() == "setBtn" then
                    viewMgr.show(viewMgr.def.SETTING_UI)  
                    --[[if device.platform == "android" then
                        local args = {"通知","出来了",0,0,10}
                        local sigs = "(Ljava/lang/String;Ljava/lang/String;III)V"
                        local luaj = require "cocos.cocos2d.luaj"
                        local className = "org.cocos2dx.lua.AppActivity"
                        local ok,ret  = luaj.callStaticMethod(className,"addNoticfy",args,sigs)
                        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                        print(ok)
                    end--]]                
                end
                if node:getName() == "diamondBtn" then
                    viewMgr.show(viewMgr.def.STORE_UI)
                    --[[if device.platform == "android" then
                        local Grlstate = GlobalData.getGrlState()
                        local args = {Grlstate}
                        local sigs = "(Z)V"
                        local luaj = require "cocos.cocos2d.luaj"
                        local className = "org.cocos2dx.lua.AppActivity"
                        local ok,ret  = luaj.callStaticMethod(className,"isSend",args,sigs)
                        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
                        print(ok)
                    end--]]  
                end
                if node:getName() == "starFrame" then
                    viewMgr.show(viewMgr.def.SHOWSTAR_UI)
                    --GlobalData.setGrlState(true)
                end
                if node:getName() == "boxBtn" then
                    viewMgr.show(viewMgr.def.Package_UI,2)
                end
                if node:getName() == "onceBtn" then
                    local lastTime = GlobalData.getBuyTime()
                    local delta = utils.isExcDay(lastTime)
                    if delta then
                        viewMgr.show(viewMgr.def.Package_UI,1)
                    else
                        utils.createAniFont("今日已达领取上限",node)
                    end
                end
                if node:getName() == "btnDaily" then
                    local needGuide = false
                    local finger = self.Button_Daily:getChildByName("finger_2")
                    if finger then
                        finger:removeFromParent(true)
                        finger = nil
                        needGuide = true
                    end
                    if self.m_ClipNode then
                        self.m_ClipNode:removeFromParent(true)
                        self.m_ClipNode = nil
                    end
                    viewMgr.show(viewMgr.def.DailyAward,needGuide)
                end
             end
          end
    end
    local result = import("hall.worldMapStudio.lua").create(callBack)
    self.result = result
    self.page = result.root
    self.bg = result.bg
    self:setMapEff(6,true)
    --local starCount = allData[1][1]+allData[1][2]
    for i = 1,3 do
        local allData = GlobalData.getLvStar(i)
        local starCount = allData[1][1]+allData[1][2]
        local tower = result[string.format("towerBtn_%d",i)]
        if starCount <= 0 and tower then
            local boxImg = display.newScale9Sprite("ui/common/tipsBox.png", 
                                                    0,0,cc.size(150,40))
            boxImg:setScale(0.8)
            local tipsArrow = display.newSprite("ui/common/arrow.png")
            :pos(35,77)
            :setScale(0.8)
            local text = cc.ui.UILabel.new({
                        text  = WordLanguage.ClickToStart,
                        color = cc.c3b(156, 25, 9),
                        font  = GLOBAL_FONTNAME,
                        size  = 24,
                        x     = 75,
                        y     = 20,
                    })
            text:setAnchorPoint(0.5, 0.5)
            boxImg:addChild(text,1)
            boxImg:setPosition(cc.p(35,100))
            local scale_1 = cc.ScaleTo:create(0.38, 1.01)
            local scale_2 = cc.ScaleTo:create(0.38, 0.99)
            local act_1 = cc.Sequence:create(scale_1,scale_2)
            local action = cc.RepeatForever:create(act_1)
            local node = cc.Node:create()
            node:addChild(tipsArrow)
            node:addChild(boxImg)
            node:setName("flagArraw")
            tower:addChild(node)
            node:runAction(action)
            break
        else
            local node = tower:getChildByName("flagArraw")
            if node then
                node:removeFromParent(true)
            end
        end
    end
    local function listener(event)
        local name = event.name 
        if name == "enter" then
            self:onEnter()
        elseif name == "exit" then
            self:onExit()
        elseif name == "enterTransitionFinish" then
            self:enterTransitionFinish()
        end
    end
    self.page:setNodeEventEnabled(true,listener)
    self.page:setScale(GLOBAL_HALL_UI_SCALE2)
    local heroIcon = result.hero
    local handIcon = result.handIcon
    local achIcon  = result.ach
    --两个礼包
    self.package_1 = result.onceBtn
    self.package_2 = result.boxBtn
    self.package_1:setLocalZOrder(11)
    self.package_2:setLocalZOrder(11)
    if GlobalData.getOneBuyTime() <= 0 then
        self.package_2:removeFromParent()
        self.package_2 = nil
    else
        local effect_2,offsetY_2,offsetX_2 = EffectAniCache.getEffectAniCache("eff_package_2",true)
        effect_2:setName("effect_2")
        local size = self.package_2:getContentSize()
        effect_2:setPosition(cc.p(size.width/2-2,size.height/2+5))
        self.package_2:addChild(effect_2)
    end
    local timeStamp = GlobalData.getTimeStamp()
    self.time = timeStamp + 7*86400
    local str,timeExist = utils.totalTime(self.time)
    --倒计时
    self.timeTxt = result.timeTxt
    self.timeTxt:setLocalZOrder(3)
    self.timeTxt:setFontName(GLOBAL_FONTNAME)
    self.timeTxt:enableOutline(cc.c4b(0,0,0,255),2)
    if GlobalData.getLimitBuyNum() > 0 and timeExist then
        self.timeTxt:setString(str)
    end
    local lastTime = GlobalData.getBuyTime()
    local delta = utils.isExcDay(lastTime)
    local effect = self.package_1:getChildByName("effect_1")
    if not delta then
        self.package_1:loadTextures("ui/hall/wordMap/oncePressoff.png","ui/hall/wordMap/oncePressoff.png","ui/hall/wordMap/oncePressoff.png")
        if effect then
            effect:setVisible(false)
        end
    else
        self.package_1:loadTextures("ui/hall/wordMap/onceNormal.png","ui/hall/wordMap/oncePress.png","ui/hall/wordMap/oncePressoff.png")
        if effect then
            effect:setVisible(true)
        end
    end
    if GlobalData.getLimitBuyNum() <= 0 or not timeExist then
        self.package_1:removeFromParent()
        self.package_1 = nil
        self.timeTxt = nil
    else
        local effect_1,offsetY_1,offsetX_1 = EffectAniCache.getEffectAniCache("eff_package_1",true)
        effect_1:setName("effect_1")
        local size = self.package_1:getContentSize()
        effect_1:setPosition(cc.p(size.width/2-7,size.height/2+5))
        self.package_1:addChild(effect_1)
    end
    --英文版
    local language = GlobalData.getLanguage()
    if language == "EN" then
        heroIcon:setTexture("ui/hall/wordMap/hero_EN.png")
        handIcon:setTexture("ui/hall/wordMap/handIcon_EN.png")
        achIcon:setTexture("ui/hall/wordMap/ach_EN.png")
    end
    --钻石文本
    self.diamondTxt = result.diamond_Txt
    self.diamondTxt:setFontName(GLOBAL_FONTNAME)
    self.diamondTxt:enableOutline(cc.c4b(0,0,0,255),2)
    --星星文本
    self.starTxt = result.star_Txt
    self.starTxt:setFontName(GLOBAL_FONTNAME)
    self.starTxt:enableOutline(cc.c4b(0,0,0,255),2)

    self:setStar()
    self:setDiamond()
    --按钮的发光效果
    self.light_ach  = result.light_ach
    self.light_ach:setVisible(false)
    self.light_hero = result.light_hero
    self.light_hero:setVisible(false)
    self.light_icon = result.light_icon
    self.light_icon:setVisible(false)
    self.light_item = result.light_itemStore
    self.light_item:setVisible(false)
    --快捷键esc
    self.page:setKeypadEnabled(true)
    self.page:addNodeEventListener(cc.KEYPAD_EVENT, function (event)
        local key = tonumber(event.code)
        local params = {}
        if key == tonumber(cc.KeyCode.KEY_ESCAPE) then
            local setUI = viewMgr.find(viewMgr.def.SETTING_UI)
            if setUI then
                viewMgr.hide(viewMgr.def.SETTING_UI)
            else
                viewMgr.show(viewMgr.def.SETTING_UI,2)
            end
        end
    end)
    local function callBack(sender,eventType)
        if self.showNextLv and self.showNextLv > 0 then return end
        local name = sender:getName()
        if eventType == ccui.TouchEventType.began then
            if name == "Button_ach" then
                self.light_ach:setVisible(true)
                self.light_hero:setVisible(false)
                self.light_icon:setVisible(false)
                self.light_item:setVisible(false)
            elseif name == "Button_hero" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(true)
                self.light_icon:setVisible(false)
                self.light_item:setVisible(false)
            elseif name == "Button_icon" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(false)
                self.light_icon:setVisible(true)
                self.light_item:setVisible(false)
            elseif name == "Button_item" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(false)
                self.light_icon:setVisible(false)
                self.light_item:setVisible(true)
            end
        end
        if eventType == ccui.TouchEventType.ended then
            self.light_ach:setVisible(false)
            self.light_hero:setVisible(false)
            self.light_icon:setVisible(false)
            self.light_item:setVisible(false)
            if name == "Button_ach" then
                viewMgr.show(viewMgr.def.ACHIEVE_UI)
            elseif name == "Button_hero" then
                if not self.heroHome then
                    local heroHomeStudio = HeroHomePanelTest.new()
                    local page = heroHomeStudio:getPage()
                    self.page:addChild(page)
                    self.heroHome = chooseMode
                    if self.m_ClipNode then
                        self.m_ClipNode:removeFromParent()
                        self.m_ClipNode = nil
                    end
                else
                    self.heroHome:setVisible(true)
                end
            elseif name == "Button_icon" then
                if not self.heroHome then
                    viewMgr.show(viewMgr.def.HANDBOOK_UI)
                else
                    self.heroHome:setVisible(true)
                end
            elseif name == "Button_item" then
                -- 点击了道具商店按钮
                viewMgr.show(viewMgr.def.ITEMSTORE_UI)
                if self.m_ClipNode then
                    self.m_ClipNode:removeFromParent(true)
                    self.m_ClipNode = nil
                end
                local finger = self.Button_item:getChildByName("finger_1")
                if finger then
                    finger:removeFromParent(true)
                    finger = nil
                end
            elseif name == "Button_jigsaw" then
                -- 点击了道具商店按钮
                -- 如果有对话框的话，需要把对话框隐藏掉
                if self.Button_jigsaw.dialog then
                    self.Button_jigsaw.dialog:removeSelf()
                    self.Button_jigsaw.dialog = nil
                end
                -- 根据第六关模式1有没有通关来判定是显示拼图页面，还是模式解锁页面
                local lv6Star = GlobalData.getLvStar(6)
                if lv6Star[1][1] == 0 and lv6Star[1][2] == 0 then
                    viewMgr.show(viewMgr.def.JIGSAW_UI)
                else
                    viewMgr.show(viewMgr.def.OPENMODE_UI)
                end
                
            end
        end
        if eventType == ccui.TouchEventType.canceled then
            self.light_ach:setVisible(false)
            self.light_hero:setVisible(false)
            self.light_icon:setVisible(false)
            self.light_item:setVisible(false)
        end
    end
    self.Button_ach = result.Button_ach
    self.Button_ach:setLocalZOrder(11)
    self.Button_hero = result.Button_hero
    self.Button_hero:setLocalZOrder(11)
    self.Button_icon = result.Button_icon
    self.Button_icon:setLocalZOrder(11)
    self.Button_item = result.Button_item
    self.Button_item:setLocalZOrder(11)
    self.Button_jigsaw = result.Button_jigsaw
    self.Button_jigsaw:setLocalZOrder(11)
    self.Button_Daily = result.btnDaily
    self.Button_Daily:setLocalZOrder(11)
    self.Button_Daily:setVisible(false)

    self.Button_hero:setTouchEnabled(true)
    self.Button_ach:addTouchEventListener(callBack)
    self.Button_hero:addTouchEventListener(callBack)
    self.Button_icon:addTouchEventListener(callBack)
    self.Button_item:addTouchEventListener(callBack)
    self.Button_jigsaw:addTouchEventListener(callBack)
    --开启第一个英雄
    local allHero = GlobalData.getHeroOrder()
    if not GlobalData.getHeroActive(allHero[1]) then
        GlobalData.setCurActiveHero(allHero[1])
    end
    self:setTips()
    --控制显示
    for i = 1,15 do
        while true do
            local curTowerData = GlobalData.getLvStar(i)
            local pathName = string.format("Sprite_%d",i)
            local path = result[pathName]
            local towerName = string.format("towerBtn_%d",i)
            local tower = result[towerName]
            tower:setLocalZOrder(3)
            local allData = GlobalData.getLvStar(i)
            local starCount = allData[3]+allData[2]+allData[1][1]+allData[1][2]
            self:setEveryStar(starCount,tower)
            if starCount > 0 then
                local index = nil
                if i == 1 or i == 2 then
                    index = i + 1
                    if not GlobalData.getHeroActive(allHero[index]) then
                        GlobalData.setCurActiveHero(allHero[index])
                    end
                end
            end
            --模式三
            if curTowerData[3] > 0 then
                tower:loadTextures("ui/hall/wordMap/flag4.png","ui/hall/wordMap/flag4.png")
                break;
            --模式二
            elseif curTowerData[2] > 0 then
                tower:loadTextures("ui/hall/wordMap/flag3.png","ui/hall/wordMap/flag3.png")
                break;
            --模式一
            elseif curTowerData[1] ~= nil then
                local flag_1 = math.ceil(i / 3)
                local flag_2 = i % 3
                if flag_2 == 0 then
                    flag_2 = 3
                end
                local iconName = string.format("icon%d_%d",flag_1,flag_2)
                local icon = result[iconName]

                if curTowerData[1][2] > 0 then
                    tower:loadTextures("ui/hall/wordMap/flag2.png","ui/hall/wordMap/flag2.png")
                    break
                elseif curTowerData[1][1] >0 then
                    if icon then
                        icon:setPositionY(icon:getPositionY()-3)
                    end
                    tower:loadTextures("ui/hall/wordMap/flag1.png","ui/hall/wordMap/flag1.png")
                    break
                else            
                    if path then
                        path:setVisible(false)        
                    end
                    if icon then
                        icon:setVisible(false)
                    end
                    local lastData = GlobalData.getLvStar(i-1) 
					local lastCount = nil
					if lastData then
                        lastCount = lastData[3]+lastData[2]+lastData[1][1]+lastData[1][2]
					end	
                    if openAllTower then
                        for k = 1,4 do
                            local name = string.format("seal_%d",k+1)
                            local block = result[name]
                            if block then
                                block:setVisible(false)
                            end
                        end                
                        tower:setVisible(true)
                    else
                        if i <= 1 or (lastCount and lastCount > 0) then 
                            tower:setVisible(true)
                        else
                            tower:setVisible(false)
                        end
                    end 
                    break           
                end
                break
            end
        end
    end


    --记录当前开启到哪一关
    local curOpenPass = 0
    for i = 1,15 do
        local allData = GlobalData.getLvStar(i)
        if allData then
            local starCount = allData[3]+allData[2]+allData[1][1]+allData[1][2]
            curOpenPass = curOpenPass + 1
            if starCount <= 0 then
                break
            end
        end
    end

    -- add by Owen, 2016.7.27, 前6关，没过一关的时候，
    -- 需要在拼图按钮边上加一个对话框提示
    self:dealPinTu(curOpenPass)

    if GlobalData.getNewThroughLv() == 1 then
        self:newGuide()
        self.showNextLv = 0
    end

    --当前关卡的旗子亮 
    local tower = result[string.format("towerBtn_%d",curOpenPass)]
    if tower then
        local lightFlag = ccui.ImageView:create("ui/hall/wordMap/flagLight.png")
        local size = tower:getContentSize()
        lightFlag:setPosition(cc.p(size.width/2,size.height/2))
        tower:addChild(lightFlag,-1)
    end
    --应该开启的地块
    local curBlock = math.ceil(curOpenPass / 3)
    for i = 1,curBlock do
        if i ~= 1 then
            local name = string.format("seal_%d",i)
            local block = result[name]
            if block then
                block:setVisible(false)
            end
        end
        if i ~= 2 then
            self:setMapEff(i,true)
        else
            local function unpause()
                self:setMapEff(2,false)
            end
            if self.schedulerEntry == nil then
                self.schedulerEntry = scheduler:scheduleScriptFunc(unpause,5.0, false)
            end
        end
    end
    local threeData = GlobalData.getLvStar(3)
    local threeModeData = threeData[1][1] + threeData[1][2]
    local fourData = GlobalData.getLvStar(4)
    local fourModeData = fourData[1][1] + fourData[1][2]
    local fiveData = GlobalData.getLvStar(5)
    local fiveModeData = fiveData[1][1] + fiveData[1][2]
    -- 新通关了第3关，才需要显示第3关完成指引
    if threeModeData > 0 and fourModeData <= 0 and GlobalData.getNewThroughLv() == 3 then
        self:newGuide_3_1()
    end
    if fourModeData > 0 then
        self.Button_Daily:setVisible(true)
    end
    -- change by Owen, 2016.7.29, 判定一下第四关出战场后，签到引导有没有走过
    if fourModeData > 0 and fiveModeData <= 0 and not GlobalData.getFinishLv4GuideHasShow() then
        local time = GlobalData.getSignTime()
        local canSign = utils.isExcDay(time)
        if canSign then
            self:newGuide_4_1()
        end
    end
    self:showGuideTips()
end

-- add by Owen, 2016.7.27, 前6关，没过一关的时候，
-- 需要在拼图按钮边上加一个对话框提示
-- curOpenPass 表示当前开启的是第几关
function worldHall:dealPinTu(curOpenPass)
    print("worldHall:dealPinTu curOpenPass = "..tostring(curOpenPass))
    local newThrough = GlobalData.getNewThroughLv()
    if curOpenPass <= 6 and curOpenPass > 1 then
        local dialog = display.newSprite("ui/jigsaw/dialog.png")
            :addTo(self.Button_jigsaw)
            :pos(225, 100)
        self.Button_jigsaw.dialog = dialog

        -- 闪烁的特效
        local scaleto1 = cc.ScaleTo:create(0.3, 1.05) -- 0.5, 1.5)
        local scaleto2 = cc.ScaleTo:create(0.3, 0.95) -- 0.5,1.3)
        local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
        local repeatForever1 = cc.RepeatForever:create(squence)
        dialog:runAction(repeatForever1)

        local txtLab = cc.ui.UILabel.new({
            UILabelType = 2,
            text = StableGameProperties.PINGTU_GUIDE_WORD[curOpenPass - 1],
            align = cc.ui.TEXT_ALIGN_RIGHT,
            font = GLOBAL_FONTNAME,
            size = 22,
            x = 168/2,
            y = 65/2 + 5,
        }):align(display.CENTER_RIGHT)
        :addTo(dialog)
        txtLab:enableOutline(cc.c4b(71, 40,0,255), 2)
        txtLab:setAnchorPoint(0.5, 0.5)
    end

    -- 第六关已经通过了，需要把拼图按钮 改为 模式解锁按钮
    if curOpenPass > 6 then
        -- self.Button_jigsaw:removeSelf()

        self.Button_jigsaw:loadTextureNormal("ui/jigsaw/icon2.png",0)
        self.Button_jigsaw:loadTexturePressed("ui/jigsaw/icon2_off.png",0)
    end
end

function worldHall:showGuideTips()
    if not NEED_NEW_GUIDE then return end
    local allData = GlobalData.getLvStar(1)
    local starCount = allData[1][1]+allData[1][2]
    if starCount <= 0 then
        self.Button_hero:setTouchEnabled(false)
        local size = self.Button_hero:getContentSize()
        local lock = cc.Sprite:create("ui/common/suo.png")
        EnableGraySprite(lock)
        lock:setScale(1.2)       
        lock:setPosition(cc.p(size.width/2,size.height/2))
        self.Button_hero:addChild(lock)
    else
        self.Button_hero:setTouchEnabled(true)
    end
end
function worldHall:setMapEff(idx,isLoop)
    
    local effect
    local fadeIn  = cc.FadeIn:create(0.8)
    local fadeOut = cc.FadeOut:create(0.8)
    local action  = cc.RepeatForever:create(cc.Sequence:create(fadeIn,fadeOut))
    if idx == 4 then
        effect = ccui.ImageView:create("ui/hall/wordMap/ui_map_4.png")
        effect:setPosition(posAni[idx])
        effect:runAction(action)
    elseif idx == 5 then
        effect = ccui.ImageView:create("ui/hall/wordMap/ui_map_5.png")
        effect:setPosition(posAni[idx])
        effect:runAction(action)
    else
        local name = string.format("ui_map_%d",idx)
        if isLoop then
            effect = EffectAniCache.getEffectAniCache(name,isLoop)
        else
            effect = EffectAniCache.getEffectAniCache(name,false)
        end
        if idx == 3 then
            effect:setOpacity(128)
        end
        local size = effect:getContentSize()
        effect:setPosition(posAni[idx])
    end
    self.page:addChild(effect)
end
--设置角标
function worldHall:setTips()
    self:onUpdateDiamondCount()
    local tips1 = self.Button_ach:getChildByName("tips_ach")
    local tips2 = self.Button_hero:getChildByName("tips_hero")
    local tips3 = self.Button_icon:getChildByName("tips_icon")
    local allData = {}
    local achieveNum = 0
    for key,value in pairs(achieveData.getAll()) do
        local flag = GlobalData.getAchieve(value.mainID)
        if flag == 1 then
            achieveNum = achieveNum + 1
        end
    end
    local str = tostring(achieveNum)
    if achieveNum > 9 then
        str = "9+"
    end
    if tips1 then
        if str ~= "0" then
            tips1:setVisible(true)
            local text = tips1:getChildByName("text")
            text:setString(str)
        else
            tips1:setVisible(false)
        end
    else
        if str ~= "0" then
            local text = ccui.Text:create(str,GLOBAL_FONTNAME,24)
            text:setName("text")
            text:enableOutline(cc.c4b(0,0,0,255),2)
            local tips = ccui.ImageView:create()
            tips:setName("tips_ach")
            tips:loadTexture("ui/hall/wordMap/achTips.png")
            local textSize = tips:getContentSize()
            text:setPosition(cc.p(textSize.width/2,textSize.height/2))
            local size = self.Button_ach:getContentSize()
            tips:setPosition(cc.p(size.width-20,size.height-20))
            tips:addChild(text)
            local scale_1 = cc.ScaleTo:create(0.1,1.2)
            local scale_2 = cc.ScaleTo:create(0.6,1)
            local delay   = cc.DelayTime:create(0.25)
            local seq = cc.Sequence:create(scale_1,scale_2,delay)
            local action = cc.RepeatForever:create(seq)
            tips:runAction(action)
            self.Button_ach:addChild(tips)
        end
    end
    local showTips2 = false
    local starNum = GlobalData.getTotalStar()
    for key,value in pairs(GlobalData.getCurActiveHero()) do
        local star = GlobalData.getHeroStar(value)
        if star * 2 <= starNum and star < 5 then
            showTips2 = true
            break
        end
    end
    local allData = GlobalData.getLvStar(2)
    local starCount = allData[1][1]+allData[1][2]
    if starCount > 0 then
        if tips2 then
            if showTips2 then
                tips2:setVisible(true)
            else
                tips2:setVisible(false)
            end
        else
            if showTips2 then
                local tips = ccui.ImageView:create()
                tips:setName("tips_hero")
                tips:loadTexture("ui/hall/wordMap/heroTips.png")
                local size = self.Button_hero:getContentSize()
                tips:setPosition(cc.p(size.width-20,size.height-20))
                self.Button_hero:addChild(tips)
                local rotate_1 = cc.FadeTo:create(0.5,150)
                local rotate_2 = cc.FadeTo:create(0.5,255)
                local seq_1 = cc.Sequence:create(rotate_1,rotate_2)
                local scale_1 = cc.ScaleTo:create(0.5,0.8)
                local scale_2 = cc.ScaleTo:create(0.5,1)
                local seq_2 = cc.Sequence:create(scale_1,scale_2)
                local action_1 = cc.Spawn:create(seq_1, seq_2)
                --local rotate_3 = cc.RotateTo:create(0.1,0)
                local delay   = cc.DelayTime:create(0.25)
                local seq = cc.Sequence:create(action_1,delay)
                local action = cc.RepeatForever:create(seq)
                tips:runAction(action)
            end
        end
    else
        if tips2 then
            tips2:setVisible(false)
        end
    end
    local id = GlobalData.getUnlockOneMonster()
    if tips3 then
        if id and id ~= "0" then
            tips3:setVisible(true)
        else
            tips3:setVisible(false)
        end
    else
        if id and id ~= "0" then
            local tips = ccui.ImageView:create()
            tips:setName("tips_icon")
            tips:loadTexture("ui/hall/wordMap/handTips.png")
            local size = self.Button_icon:getContentSize()
            tips:setPosition(cc.p(size.width-20,size.height-20))
            self.Button_icon:addChild(tips)
            local jump_1 = cc.JumpTo:create(0.8,cc.p(tips:getPositionX(),tips:getPositionY()),15,2)
            local delay   = cc.DelayTime:create(0.25)
            local seq = cc.Sequence:create(jump_1,delay)
            local action = cc.RepeatForever:create(seq)
            tips:runAction(action)
        end
    end
    if self.package_2 then
        if GlobalData.getOneBuyTime() <= 0 then
            self.package_2:removeFromParent()
            self.package_2 = nil
        end
    end
    self:cacleTime()
end
function worldHall:changMap(lv)
    local node = self.result.towerBtn_1
    local finger = node:getChildByName("finger_tower")
    if finger then
        finger:removeFromParent(true)
        finger = nil
    end
    if self.m_ClipNode then
        self.m_ClipNode:removeFromParent(true)
        self.m_ClipNode = nil
    end
    viewMgr.show(viewMgr.def.CHOOSE_UI,lv,false)
end
--第三关完成引导
function worldHall:newGuide_3_1()
    if not NEED_NEW_GUIDE then return end
    local layout = ccui.ImageView:create("ui/common/mask_img.png")
    layout:setTouchEnabled(true)
    layout:setScale9Enabled(true)
    layout:setCapInsets(cc.rect(20,20,20,20))
    layout:setContentSize(cc.size(1350,860))
    self.page:addChild(layout,15)
    local function touchBack()
        if layout then
            layout:removeFromParent(true)
        end
        self:newGuide_3_2()
    end
    layout:addClickEventListener(touchBack)
    --sprite
    local sprite = ccui.ImageView:create("ui/Icons/bigIcon/110205.png")
    sprite:setPosition(cc.p(420,290))
    layout:addChild(sprite)
    --frame
    local txtFrame = ccui.ImageView:create("ui/common/dialog.png")
    txtFrame:setPosition(cc.p(800,600))
    layout:addChild(txtFrame)
    --text
    local text = ccui.Text:create(StableGameProperties.PROP_GUIDE_WORD[1],GLOBAL_FONTNAME,20)
    text:ignoreContentAdaptWithSize(false)
    text:setContentSize(cc.size(400,170))
    text:enableOutline(cc.c4b(0,0,0,255),2)
    text:setPosition(cc.p(230,70))
    txtFrame:addChild(text)
end
function worldHall:newGuide_3_2()
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.page:getScale()
    layer:setScale(1/scale)
    layer:setPosition(cc.p(-display.cx*(1/scale),-display.cy*(1/scale)))
    local x,y = self.Button_item:getPosition()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.page:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScale(1.5)
    local node = cc.Node:create()
    node:addChild(image)

    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(140,140))
    frame:setPosition(x,y)
    self.m_ClipNode:addChild(frame)

    node:setPosition(x,y)   
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local pos = self.Button_item:convertToNodeSpace(touch:getLocation())
        local rect = self.Button_item:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    local finger = EffectAniCache.getFingerInHall()
    local spriteSize = self.Button_item:getContentSize()
    finger:setName("finger_1")
    self.Button_item:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
function worldHall:newGuide_4_1()
    if not NEED_NEW_GUIDE then return end
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.page:getScale()
    layer:setScale(1/scale)
    layer:setPosition(cc.p(-display.cx*(1/scale),-display.cy*(1/scale)))
    local x,y = self.Button_Daily:getPosition()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.page:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScale(1.5)
    local node = cc.Node:create()
    node:addChild(image)

    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(140,140))
    frame:setPosition(x,y)
    self.m_ClipNode:addChild(frame)

    node:setPosition(x,y)   
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local pos = self.Button_Daily:convertToNodeSpace(touch:getLocation())
        local rect = self.Button_Daily:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    local finger = EffectAniCache.getFingerInHall()
    local spriteSize = self.Button_Daily:getContentSize()
    finger:setName("finger_2")
    self.Button_Daily:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
function worldHall:newGuide()
    if not NEED_NEW_GUIDE then return end
    umengSdk.setLevelStart(umengSdk.newGuide.guide02,1)
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.page:getScale()
    layer:setScale(1/scale)
    layer:setPosition(cc.p(-display.cx*(1/scale),-display.cy*(1/scale)))
    local x,y = self.Button_hero:getPosition()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.page:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScale(1.5)
    local node = cc.Node:create()
    node:addChild(image)

    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(140,140))
    frame:setPosition(x,y)
    self.m_ClipNode:addChild(frame)

    node:setPosition(x,y)   
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local pos = self.Button_hero:convertToNodeSpace(touch:getLocation())
        local rect = self.Button_hero:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            local finger = self.Button_hero:getChildByName("finger")
            if finger then
                finger:removeFromParent()
                finger = nil
            end
            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    local finger = EffectAniCache.getFingerInHall()
    local spriteSize = self.Button_hero:getContentSize()
    finger:setName("finger")
    self.Button_hero:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
function worldHall:newGuide_1()
    if not NEED_NEW_GUIDE then return end
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.page:getScale()
    layer:setScale(1/scale)
    layer:setPosition(cc.p(-display.cx*(1/scale),-display.cy*(1/scale)))
    local btn = self.result.towerBtn_1
    local x,y = btn:getPosition()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.page:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScale(1.5)
    local node = cc.Node:create()
    node:addChild(image)

    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(140,140))
    frame:setPosition(x,y+20)
    self.m_ClipNode:addChild(frame)

    node:setPosition(x,y+20)   
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local rect = btn:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    local finger = EffectAniCache.getFingerInHall()
    local spriteSize = btn:getContentSize()
    finger:setName("finger_tower")
    btn:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
--星星
function worldHall:setEveryStar(count,root)
    if count > 0 then
        local rootSize = root:getContentSize()
        local frame = ccui.ImageView:create("ui/hall/wordMap/frame.png")
        frame:setScaleX(1.2)
        local size = frame:getContentSize()
        frame:setPosition(cc.p(rootSize.width/2,-size.height/2))
        root:addChild(frame)
        local richText = ccui.RichText:create()
        richText:setPosition(cc.p(22,10))
        local text1 = ccui.Text:create(count,GLOBAL_FONTNAME,20)
        local text2 = ccui.Text:create("/12",GLOBAL_FONTNAME,20)
        local elem1 = ccui.RichElementCustomNode:create(1, cc.c3b(104, 231, 24),255,text1)
        local elem2 = ccui.RichElementCustomNode:create(2, cc.c3b(255, 255, 255),255,text2) 
        richText:pushBackElement(elem1)
        richText:pushBackElement(elem2)
        local size = richText:getContentSize()
        frame:addChild(richText)
        local starImage = ccui.ImageView:create("ui/hall/chooseModel/star.png")
        local imageSize = starImage:getContentSize()
        starImage:setScaleY(0.6)
        starImage:setScaleX(0.5)
        starImage:setPosition(cc.p(size.width+imageSize.width+15,12))
        frame:addChild(starImage)
    end
end
function worldHall:setStar()
    local lastCount = 0
    for i = 1,15 do 
        local lastData = GlobalData.getLvStar(i) 					
	    if lastData then
            lastCount = lastData[3]+lastData[2]+lastData[1][1]+lastData[1][2] + lastCount
	    end	
    end
    local str = string.format("%d/180",lastCount)
    self.starTxt:setString(str)
end
function worldHall:setDiamond()
    local allDiamond = GlobalData.getDiamondCount()
    self.diamondTxt:setString(allDiamond)
end
function worldHall:cacleTime()
    if self.package_1 and self.timeTxt then
        local str,timeExist = utils.totalTime(self.time)
        local lastTime = GlobalData.getBuyTime()
        local delta = utils.isExcDay(lastTime)
        local effect = self.package_1:getChildByName("effect_1")
        if not delta then
            self.package_1:loadTextures("ui/hall/wordMap/oncePressoff.png","ui/hall/wordMap/oncePressoff.png","ui/hall/wordMap/oncePressoff.png")
            if effect then
                effect:setVisible(false)
            end
        else
            self.package_1:loadTextures("ui/hall/wordMap/onceNormal.png","ui/hall/wordMap/oncePress.png","ui/hall/wordMap/oncePressoff.png")
            if effect then
                effect:setVisible(true)
            end
        end
        if GlobalData.getLimitBuyNum() <= 0 or not timeExist then
            self.package_1:removeFromParent()
            self.package_1 = nil
            self.timeTxt = nil
            if self.schedulerTime then
                scheduler:unscheduleScriptEntry(self.schedulerTime)
                self.schedulerTime = nil
            end
        end
        if self.timeTxt then
            self.timeTxt:setString(str)
        end
    else
        if self.schedulerTime then
            scheduler:unscheduleScriptEntry(self.schedulerTime)
            self.schedulerTime = nil
        end
    end
end
function worldHall:onEnter()
    NotifyCenter.register(EventNames.REFRUSH_WORLDHALL,handler(self, self.setTips),self.page)
    NotifyCenter.register(EventNames.BUY_HERO_SUCCESS,handler(self, self.setTips),self.page)
    if self.schedulerTime == nil then
        self.schedulerTime = scheduler:scheduleScriptFunc(handler(self,self.cacleTime),1, false)
    end
end
function worldHall:enterTransitionFinish()
    if self.showNextLv and self.showNextLv > 0 then
        local function removeThis()
            viewMgr.show(viewMgr.def.CHOOSE_UI,self.showNextLv,false)
            self.showNextLv = nil
            if self.openChoose then
                scheduler:unscheduleScriptEntry(self.openChoose)
                self.openChoose = nil
            end
        end
        if self.openChoose == nil then
            self.openChoose = scheduler:scheduleScriptFunc(removeThis,0,false)
        end
    end

    -- 新通关了第6关，那么要显示 “恭喜获得弓箭手” 页面
    if GlobalData.getNewThroughLv() == 6 then
        local function removeThis()
            -- viewMgr.show(viewMgr.def.JIGSAW_UI)

            viewMgr.show(viewMgr.def.GETNEWHERO_UI, "110204")

            if self.openJigsaw then
                scheduler:unscheduleScriptEntry(self.openJigsaw)
                self.openJigsaw = nil
            end
        end
        if self.openJigsaw == nil then
            self.openJigsaw = scheduler:scheduleScriptFunc(removeThis,0,false)
        end
        
    end
end
function worldHall:onExit()
    if self.schedulerEntry then
        scheduler:unscheduleScriptEntry(self.schedulerEntry)
        self.schedulerEntry = nil
    end  
    if self.schedulerTime then
        scheduler:unscheduleScriptEntry(self.schedulerTime)
        self.schedulerTime = nil
    end  
end
function worldHall:onUpdateDiamondCount()
    self:setDiamond()
end
function worldHall:getPage()
    return self.page
end
return worldHall
