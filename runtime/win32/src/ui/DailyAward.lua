local DailyAward = class("ui.DailyAward")
local StableGameProperties   = require("app.properties.StableGameProperties")
local EffectAniCache = require("app.map.spine.EffectAniCache")
local DailyData      = require("app.properties.DailyPackageProperties")
local GlobalData             = require("tools.GlobalData")
local ManualSkillProperties  = require("app.properties.ManualSkillProperties")
local AutoSkillProperties    = require("app.properties.AutoSkillProperties")
local PassiveSkillProperties = require("app.properties.PassiveSkillProperties")
function DailyAward:ctor(onSelf,isGuide)
    local clickBack = function(luaFileName,node,callbackName)
        return function()
            if callbackName == "clickEvent" then
                if node:getName() == "colseBtn" then
                    viewMgr.hide(viewMgr.def.DailyAward)
                end
                if node:getName() == "getAward" then
                    self.ScrollView:setEnabled(true)
                    if self.canSign then
                         self.canSign = false
                         self.btn:setTouchEnabled(false)
                         local award = DailyData.get(self.nextDay)
                         if award.diamond then
                            GlobalData.addDiamondCount(award.diamond)
                         end
                         if award.hero then
                            for i = 1,#award.hero do
                                local id = award.hero[i]
                                local count = award.hero[i+1]
                                if count and count == 0 and id then
                                    if not GlobalData.getHeroActive(id) then
                                        GlobalData.getHeroActive(id)
                                    end
                                elseif count and id then
                                    if not GlobalData.getHeroActive(id) then
                                        GlobalData.setTimeHero(id,count,true)
                                    end
                                end
                                i = i + 2
                            end
                         end
                         NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
                         GlobalData.setSignNum()
                         GlobalData.setSignTime()
                         local image = self.result[string.format("image_%d",self.nextDay)]
                         image:loadTexture("ui/sign/unChoose.png")
                         local size = image:getContentSize()
                         local function effLater()
                             image:loadTexture("ui/sign/uiChoose.png")
                             self.btn:setTouchEnabled(true)
                             local flag = ccui.ImageView:create("ui/sign/get.png")
                             flag:setRotation(30)  
                             flag:setPosition(cc.p(size.width-49.5,size.height-44))
                             image:addChild(flag)
                         end
                         local effect,offsetY,offsetX = EffectAniCache.getEffectAniCache("eff_yilingqu",false,effLater)  
                         effect:setRotation(30)                       
                         effect:setPosition(cc.p(size.width-49.5,size.height-44))
                         image:addChild(effect)
                    else
                        utils.createAniFont("已签到",self.page)
                    end
                    local finger = self.btn:getChildByName("finger")
                    if finger then
                        finger:removeFromParent()
                        finger = nil
                    end
                    if self.m_ClipNode then
                        self.m_ClipNode:removeFromParent()
                        self.m_ClipNode = nil
                        self:newGuide_1()
                    end
                end
            end
         end  
    end
    local result = import("ui.signStudio").create(clickBack)
    self.result = result
    local bg = result.bg
    self.page = result.root
    self.btn = result.getAward
    self.ScrollView = result.ScrollView
    self.image_1 = result.image_1
    self.effAniData   = require("app.properties.EffectProperties")
    EffectAniCache.addEffectAniCache("eff_yilingqu",self.effAniData.eff_yilingqu)
    local time = GlobalData.getSignTime()
    self.canSign = utils.isExcDay(time)
    if not self.canSign then
        self.btn:setEnabled(false)
    end
    self.readyDay = GlobalData.getSignNum()
    self.nextDay = self.readyDay + 1
    for i = 1,7 do
        local data = DailyData.get(i)
        --日期
        local dayName = string.format("day_%d",i)
        local dayTxt = result[dayName]
        dayTxt:setFontName(GLOBAL_FONTNAME)
        dayTxt:enableOutline(cc.c4b(0,0,0,255),2)
        dayTxt:setString(string.format("第%d日",i))
        --奖励名字
        local awardName = string.format("name_%d",i)
        local awardTxt = result[awardName]
        awardTxt:setFontName(GLOBAL_FONTNAME)
        awardTxt:enableOutline(cc.c4b(0,0,0,255),2)
        awardTxt:setFontSize(16)
        awardTxt:setString(data.name)
        --图
        local imageName = string.format("image_%d",i)
        local image = result[imageName]
        local size = image:getContentSize()
        local iconPath = string.format("ui/sign/%s",data.path)
        local icon = ccui.ImageView:create(iconPath)
        icon:setPosition(cc.p(size.width/2,size.height/2))
        image:addChild(icon)
        if i < self.nextDay then
            local flag = ccui.ImageView:create("ui/sign/get.png")
            flag:setPosition(cc.p(size.width-49.5,size.height-44))
            flag:setRotation(30)
            image:addChild(flag)
            dayTxt:setTextColor(cc.c4b(36,6,6,255))
            dayTxt:disableEffect()
        elseif i == self.nextDay then
            if self.canSign then
                image:loadTexture("ui/sign/Choose.png")
            end
        else
            dayTxt:setTextColor(cc.c4b(36,6,6,255))
            dayTxt:disableEffect()
            --local flag = ccui.ImageView:create("ui/sign/get.png")
            --flag:setPosition(cc.p(size.width/2,size.height/2))
            --image:addChild(flag) 
        end
    end
    utils.playAction(self.page,bg)
    if isGuide then
        self:newGuide()
    end
end
function DailyAward:newGuide()

    if not NEED_NEW_GUIDE then return end
    umengSdk.setLevelStart(umengSdk.newGuide.guide05,1)
    self.ScrollView:setEnabled(false)
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.page:getScale()
    layer:setScale(1/scale+0.2)
    layer:setPosition(cc.p(-display.cx*(1/scale+0.2),-display.cy*(1/scale+0.2)))
    local x,y = self.btn:getPosition()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.page:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScaleX(2.2)
    image:setScaleY(0.8)
    local node = cc.Node:create()
    node:addChild(image)

    local image = cc.Sprite:create("ui/sign/unChoose.png")
    image:setScale(0.95)
    image:setPosition(cc.p(-311,188))
    node:addChild(image)
    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(210,80))
    frame:setPosition(x,y)
    self.m_ClipNode:addChild(frame)

    node:setPosition(x,y)   
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local pos = self.btn:convertToNodeSpace(touch:getLocation())
        local rect = self.btn:getCascadeBoundingBox()
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
    local spriteSize = self.btn:getContentSize()
    finger:setName("finger")
    self.btn:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
function DailyAward:newGuide_1()
    if not NEED_NEW_GUIDE then return end
    local layout = ccui.ImageView:create("ui/common/mask_img.png")
    layout:setTouchEnabled(true)
    layout:setScale9Enabled(true)
    layout:setCapInsets(cc.rect(20,20,20,20))
    layout:setContentSize(cc.size(1350,860))
    self.page:addChild(layout,15)
    local sprite = ccui.ImageView:create("ui/Icons/bigIcon/110301.png")
    sprite:setPosition(cc.p(900,350))
    layout:addChild(sprite)
    --frame
    local txtFrame = ccui.ImageView:create("ui/common/dialog.png")
    txtFrame:setFlippedX(true)
    txtFrame:setPosition(cc.p(550,550))
    layout:addChild(txtFrame)
    --text
    local text_1 = ccui.Text:create(StableGameProperties.DAILY_GUIDE_WORD[1],GLOBAL_FONTNAME,20)
    text_1:setFlippedX(true)
    text_1:ignoreContentAdaptWithSize(false)
    text_1:setContentSize(cc.size(400,50))
    text_1:enableOutline(cc.c4b(0,0,0,255),2)
    text_1:setPosition(cc.p(200,170))
    txtFrame:addChild(text_1)

    local HeroProperties = require "app.properties.HeroProperties"
    local skillData      = HeroProperties.get("110301").activeOrder
    for i = 1,3 do
        local icon = self:icon(i,skillData[i])
        txtFrame:addChild(icon)
    end
    local text_2 = ccui.Text:create(StableGameProperties.DAILY_GUIDE_WORD[2],GLOBAL_FONTNAME,20)
    text_2:setFlippedX(true)
    text_2:ignoreContentAdaptWithSize(false)
    text_2:setContentSize(cc.size(400,50))
    text_2:enableOutline(cc.c4b(0,0,0,255),2)
    text_2:setPosition(cc.p(200,45))
    txtFrame:addChild(text_2)

    local btn = ccui.Button:create("ui/common/7.png","ui/common/7.png","ui/common/7.png")
    btn:setTitleText(StableGameProperties.DAILY_GUIDE_WORD[3])
    btn:setTitleFontSize(30)
    btn:setTitleFontName(GLOBAL_FONTNAME)
    btn:setScale(0.8)
    btn:setPosition(cc.p(940,200))
    layout:addChild(btn)
    local function btnBack()
        if layout then
            layout:removeFromParent(true)
            layout = nil

            -- change by Owen, 2016.7.30, 点击了“继续第五关之后，就表示完成了友盟第五步引导
            umengSdk.setLevelStart(umengSdk.newGuide.guide05,2)

            viewMgr.show(viewMgr.def.CHOOSE_UI,5,false)
            viewMgr.hide(viewMgr.def.DailyAward)
        end
    end
    btn:addClickEventListener(btnBack)
end
function DailyAward:icon(key,Id)
    local skillPro = nil
    if key == 1 then
        skillPro  = ManualSkillProperties.get(Id)
    elseif key == 2 then
        skillPro  = AutoSkillProperties.get(Id)
    elseif key == 3 then
        skillPro  = PassiveSkillProperties.get(Id)
        if skill3Pro == nil then
            skill3Pro = AutoSkillProperties.get(Id)
        end
    end
    local icon = ccui.ImageView:create("ui/Icons/heroSkillIcon/"..skillPro.icon..".png")
    icon:setTouchEnabled(true)
    icon:setPosition(cc.p(key*115,120)) 
    local function iconBack(args)
        viewMgr.show(viewMgr.def.TIPS_UI,1,skillPro)
    end 
    icon:addClickEventListener(iconBack)
    return icon
end
function DailyAward:getPage()
    return self.page
end

return DailyAward