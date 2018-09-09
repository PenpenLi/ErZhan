

local GlobalData             = require("tools.GlobalData")
local HeroProperties         = require("app.properties.HeroProperties")
local GroupProperties        = require("app.properties.GroupProperties")
local GroupDetailPanel       = require("hall.GroupDetailPanel")
local MapConstants           = require("app.map.MapConstants")
local MapConfig              = require("maps.MapConfig")
local ManualSkillProperties  = require("app.properties.ManualSkillProperties")
local AutoSkillProperties    = require("app.properties.AutoSkillProperties")
local PassiveSkillProperties = require("app.properties.PassiveSkillProperties")
local HeroGrowth             = require("app.properties.HeroGrowth")
local SpineCache            = require("app.map.spine.SpineCache")
local getWayData = nil
if device.platform == "windows"then
    getWayData= require("app.properties.HeroGetWayProperties_PC")
else
    getWayData= require("app.properties.HeroGetWayProperties")
end
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local HeroHomePanelTest = class("HeroHomePanelTest")
local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()
-- 加载studio导出的选关页面
function HeroHomePanelTest:ctor(params)
    
    --记录英雄技能等级
    self.skill1Lv = 0
    self.skill2Lv = 0
    self.skill3Lv = 0

    self.upSure = false
    --特效
    self.effAniData   = require("app.properties.EffectProperties")
    --EffectAniCache.addEffectAniCache("ui_hero_background",self.effAniData.ui_hero_background)
    --EffectAniCache.addEffectAniCache("ui_hero_background_2",self.effAniData.ui_hero_background_2)
    EffectAniCache.addEffectAniCache("ui_hero_advanced",self.effAniData.ui_hero_advanced)
    EffectAniCache.addEffectAniCache("ui_advanced",self.effAniData.ui_advanced)

    self.studioPage = import("hall.HeroHomeStudio").create()
    local chooseModePanelStudio = self.studioPage.root
    
    --local path = utils.getName("sdfdf")
    chooseModePanelStudio:setTouchEnabled(true)
    chooseModePanelStudio:setTouchSwallowEnabled(true) 

    chooseModePanelStudio:retain()
    chooseModePanelStudio:setLocalZOrder(11)

    self.studioNode = chooseModePanelStudio
    self.studioNode.onEnter = self:onEnter()
    -- 获得Studio中的所有控件
    self:getAllElemets()
    -- 进来的时候默认选中第一个英雄
    self.heroConfig = HeroProperties.get("110202")
    self:clickScrollHero("110202",1)
    self.mainID = "110202"
    
    local skeletonNode_1 = sp.SkeletonAnimation:create("ui/hall/heroHome/ui_hero_background.json","ui/hall/heroHome/ui_hero_background.atlas",1.3)
    skeletonNode_1:setPosition(cc.p(340,55))
    self.bigHeroImg:addChild(skeletonNode_1,-1)
    skeletonNode_1:setAnimation(0,"Idle",true)
    -- 更新页面上显示的总共有几颗星星
    self.totalHasStarLabel:setString(GlobalData.getTotalStar())    

    --richText元素
    self.re1 = nil
    self.re2 = nil

    --可以升级的技能
    --self.upLvSkill = {}
    --self.upLvSkill = self:updateSkillLVImg()
    if GlobalData.getNewThroughLv() == 1 then
        self:newGuide()
    end
end
--首次升阶成功要出现！
function HeroHomePanelTest:newGuideAni(node)
    
    if node:getChildByName("finger_1") then 
        node:getChildByName("finger_1"):removeFromParent(true)
    end
    local spriteSize = node:getContentSize()
    local tips = ccui.ImageView:create()
    tips:setName("finger_1")
    tips:setScale(0.8)
    tips:loadTexture("ui/hall/wordMap/handTips.png")
    tips:setPosition(cc.p(spriteSize.width-10,spriteSize.height-20))
    node:addChild(tips,11)
    local jump_1 = cc.JumpTo:create(0.8,cc.p(tips:getPositionX(),tips:getPositionY()),15,2)
    local delay   = cc.DelayTime:create(0.25)
    local seq = cc.Sequence:create(jump_1,delay)
    local action = cc.RepeatForever:create(seq)
    tips:runAction(action)
    --if GlobalData.getNewThroughLv() == 1 then
    --   GlobalData.setNewThroughLv(0)
    --end
end
function HeroHomePanelTest:onUpdateHero()
    self:refrushButton(self.mainID)
    self:updateSkillLVImg(self.mainID)
end
function HeroHomePanelTest:onEnter()
    NotifyCenter.register(EventNames.REFRUSH_WORLDHALL, handler(self, self.onUpdateHero), self.studioNode)
end
-- 记录所有的控件
function HeroHomePanelTest:getAllElemets()
    -- 关闭按钮
    local closeBtn  = self.studioPage["close_btn"]
    closeBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        self.studioNode:setVisible(false)
    end) 
    self.info_1 = self.studioPage.info_1
    
    self.info_1:ignoreContentAdaptWithSize(false)
    self.info_1:setContentSize(cc.size(260,80))
    self.info_1:setFontName(GLOBAL_FONTNAME)
    self.info_2 = self.studioPage.info_2
    self.info_2:setContentSize(cc.size(260,25))
    self.info_2:ignoreContentAdaptWithSize(false)
    self.info_2:setFontName(GLOBAL_FONTNAME)
    local str = WordLanguage.heroInfo
    self.info_2:setString(str)
    self.info_3 = self.studioPage.info_3
    self.info_3:setFontName(GLOBAL_FONTNAME)
    self.info_3:setContentSize(cc.size(260,25))
    self.info_3:ignoreContentAdaptWithSize(false)
    self.info_3:setTextColor(cc.c4b(188, 231, 53,255))
     local image = self.studioPage["mengban2_8"]
    image:setFlippedX(true)
    --文字简介
    local text_1 = self.studioPage["text_1"]
    text_1:setFontName(GLOBAL_FONTNAME)
    text_1:setString(WordLanguage.Health)
    local text_4 = self.studioPage["text_4"]
    text_4:setFontName(GLOBAL_FONTNAME)
    text_4:setString(WordLanguage.Defensive)
    local text_3 = self.studioPage["text_3"]
    text_3:setFontName(GLOBAL_FONTNAME)
    text_3:setString(WordLanguage.Attack)
    local text_2 = self.studioPage["text_2"]
    text_2:setFontName(GLOBAL_FONTNAME)
    text_2:setString(WordLanguage.SRange)
    local text_5 = self.studioPage["text_5"]
    text_5:setFontName(GLOBAL_FONTNAME)
    text_5:setString(WordLanguage.LRange)
    local text_6 = self.studioPage["text_6"]
    text_6:setFontName(GLOBAL_FONTNAME)
    text_6:setString(WordLanguage.MRate)
    local text_7 = self.studioPage["text_7"]
    text_7:setFontName(GLOBAL_FONTNAME)
    text_7:setString(WordLanguage.RRate)
    local text_8 = self.studioPage["text_8"]
    text_8:setFontName(GLOBAL_FONTNAME)
    text_8:setString(WordLanguage.Speed)
    local text_9 = self.studioPage["text_9"]
    text_9:setFontName(GLOBAL_FONTNAME)
    text_9:setString(WordLanguage.CPower)
    local text_10 = self.studioPage["text_10"]
    text_10:setFontName(GLOBAL_FONTNAME)
    text_10:setString(WordLanguage.DRate)
    local text_11 = self.studioPage["text_11"]
    text_11:setFontName(GLOBAL_FONTNAME)
    text_11:setString(WordLanguage.LDrain)
    local text_12 = self.studioPage["text_12"]
    text_12:setFontName(GLOBAL_FONTNAME)
    text_12:setString(WordLanguage.TEffect)
    local text_13 = self.studioPage["text_13"]
    text_13:setFontName(GLOBAL_FONTNAME)
    text_13:setString(WordLanguage.CRate)
    local text_14 = self.studioPage["text_14"]
    text_14:setFontName(GLOBAL_FONTNAME)
    text_14:setString(WordLanguage.Resistance)

    --简介背景
    self.textBg = self.studioPage["textBg"]
    -------------------------------- 滚动条 ------------------------------------------
    -- 滚动控件
    self.scrollView = self.studioPage["hero_ScrollView"]
    local ScrollViewSize  = self.scrollView:getContentSize()
    local ScrollInnerSize = self.scrollView:getInnerContainerSize()
    local disPosY = ScrollInnerSize.height/11

    local scrollInner = self.scrollView:getInnerContainer()
    -- 记录左边的12个按钮，和12个选中的图片
    self.scrollHeroBtns      = {}    -- 8个滚动按钮
    self.scrollSelectedImgs  = {}    -- 8个滚动按钮的选中图片
    self.scrollHeroIcons     = {}    -- 8个英雄头像

    for i = 1,8 do
        local btnName = "btn_"..orderHeros[i]
        self.scrollHeroBtns[i] = self.studioPage[btnName]--heroTips_2
        self.scrollHeroBtns[i]:setSwallowTouches(false)
        local posY = ScrollInnerSize.height - 2 * disPosY - (i-1)*disPosY
        self.scrollHeroBtns[i]:setPositionY(posY)
        self.scrollSelectedImgs[i] = self.studioPage["img_leftSelected"..i]
        self.scrollSelectedImgs[i]:setVisible(false)
        self.scrollHeroIcons[i] = self.studioPage["heroIcon_"..i]
    end
    -------------------------------滑动事件------------------------------------------
    local cosAngle = self.scrollHeroBtns[1]:getPositionX()/self.scrollHeroBtns[1]:getPositionY()
    local heroSize = self.scrollHeroBtns[1]:getContentSize()
    local distance = (ScrollInnerSize.height - 4 * disPosY)/(#self.scrollHeroBtns-1)
    local delta = 0
    if display.cy == 384 then
        delta = -5
    elseif  display.cy == 160 then
        delta = 200---
    elseif  display.cy == 320 then
        if display.cx == 320 then
            delta = 55---
        else
            delta = 25
        end
    elseif  display.cy == 375 then
        delta = 0---
    elseif  display.cy == 621 then
        delta = -80---
    elseif  display.cy == 240 then
        if display.cx == 400 then
            delta = 88---
        else
            delta = 75
        end
    elseif  display.cy == 270 then
        delta = 55---
    elseif  display.cy == 300 then
        delta = 45---
    elseif  display.cy == 360 then
        delta = 5---
    elseif  display.cy == 400 then
        delta = 5---
    elseif  display.cy == 540 then
        delta = -60---
    elseif display.cy == 720 then
        delta = -105
    end
    local standardY = (display.cy+delta - distance/2/GLOBAL_HALL_UI_SCALE2)
    local permissSild = 0    --0空状态 1拖动 2点击
    local hasMsg = false
    local limitPosY = scrollInner:getPositionY()
    local function timer()
        for key,value in pairs(self.scrollHeroBtns) do             
            local curPosY = math.abs(value:convertToWorldSpace(cc.p(0.5,0.5)).y - standardY)
            local deltaCos = (curPosY)*-cosAngle
            value:setPositionX(deltaCos+heroSize.width+25)
            --value:setScale(1-deltaCos)
        end
    end
    --调整位置
    local function adjustIcon(isScroll)
        local isScroll = isScroll or false
        local posX,posY = self.scrollHeroBtns[1]:getPosition()
        local minPosY = self.scrollView:convertToWorldSpace(cc.p(0.5,0.5)).y - standardY
        local tempBtn = self.scrollHeroBtns[1]
        local absMinPosY = math.abs(minPosY)
        local index = 1
        for key,value in pairs(self.scrollHeroBtns) do               
            local curPosY = math.abs(value:convertToWorldSpace(cc.p(0.5,0.5)).y - standardY)
            local deltaCos = (curPosY)*-cosAngle
            value:setPositionX(deltaCos+heroSize.width+25)
            if curPosY <= absMinPosY then
                absMinPosY = curPosY
                minPosY = value:convertToWorldSpace(cc.p(0.5,0.5)).y - standardY
                index = key
                tempBtn = value 
            end
        end
        if isScroll then
            for key,value in pairs(self.scrollHeroBtns) do
                local curHeroImage = self.studioPage["img_leftSelected"..key]
                if index == key then
                    curHeroImage:setVisible(true)
                else
                    curHeroImage:setVisible(false)
                end
            end
        else
            return -(minPosY-12)/GLOBAL_HALL_UI_SCALE2 + 10,index,tempBtn
        end
    end
    local function ScrollBack(target,event)
        if event == ccui.ScrollviewEventType.scrolling then
            hasMsg = true
            if permissSild == 0 then
                permissSild = 1
                adjustIcon(true)
            end
            timer()
        end
        if event == ccui.ScrollviewEventType.scrollToStop then
            hasMsg = false
            if permissSild == 1 then
                local distance,index,btn = adjustIcon(false)
                local function back()
                    local curPosY = scrollInner:getPositionY()
                    timer()
                    self:clickScrollHero(self.scrollHeroBtns[index]:getTag(),index)
                    permissSild = 0
                end
                scrollInner:runAction( cc.Sequence:create(cc.MoveBy:create(0.3,cc.p(0,distance)),cc.CallFunc:create(back)))
            end
        end
        if event == ccui.ScrollviewEventType.scrollToTop then
            self:clickScrollHero(self.scrollHeroBtns[1]:getTag(),1)
            permissSild = 0
        end
        if event == ccui.ScrollviewEventType.scrollToBottom then
            self:clickScrollHero(self.scrollHeroBtns[8]:getTag(),8)
            permissSild = 0
        end
    end
    for key,value in pairs(orderHeros) do
        self.scrollHeroBtns[key]:addClickEventListener(function(sender)
        if hasMsg then
            ScrollBack(nil,ccui.ScrollviewEventType.scrollToStop)
        end
        if permissSild == 0 then
            permissSild = 2
            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
            local size = sender:getContentSize()
            AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
            self.timeSlip = scheduler:scheduleScriptFunc(timer,0, false)
            isClick = true
            local index = nil
            local tag = sender:getTag()
            if tag == tonumber(value) then
                index = key                
            end
            local function back(param)  
                self:clickScrollHero(sender:getTag(),index)                  
                if self.timeSlip then
                    scheduler:unscheduleScriptEntry(self.timeSlip)
                    self.timeSlip = nil
                end
                timer()
                permissSild = 0
            end
            local minPosY = sender:convertToWorldSpace(cc.p(0.5,0.5)).y - standardY
            local movePosY = -(minPosY-12)/GLOBAL_HALL_UI_SCALE2 + 10       
            scrollInner:runAction( cc.Sequence:create(cc.MoveBy:create(0.3,cc.p(0,movePosY)),cc.CallFunc:create(back)))
        end
    end)
    end
    self.scrollView:addEventListener(ScrollBack)
    ------------------------------- 中间区域 ----------------------------------------
    
    -- 中间的大图片
    self.bigHeroImg = self.studioPage["big_heroImg"]

    self.skillIcons          = {}   -- 3个英雄技能的Icon
    self.skill1LvImgs        = {}   -- 第一个技能的等级图标
    self.skill2LvImgs        = {}   -- 第二个技能的等级图标
    self.skill3LvImgs        = {}   -- 第三个技能的等级图标


    for i = 1, 3 do
        self.skillIcons[i]     = self.studioPage["heroSkillBg_"..i]
    end
    for i = 1, 5 do
        self.skill1LvImgs[i]   = self.studioPage["lv_small_5_"..i]
    end
    for i = 1, 4 do
        self.skill2LvImgs[i]   = self.studioPage["lv_small_4_"..i]
    end
    for i = 1, 3 do
        self.skill3LvImgs[i]   = self.studioPage["lv_small_3_"..i]
    end

     --四个箭头
    self.upLvArrow = self.studioPage.upLvArrow
    self.upLvArrow.x = self.upLvArrow:getPositionX()
    self.upLvArrow.y = self.upLvArrow:getPositionY()
    --进阶确定按钮
    local function sureBack(param)
          self.upSure = true
          self:clickUpLvBtn()
          if self.m_ClipNode then           
            self.m_ClipNode:removeFromParent()
            self.m_ClipNode = nil
            umengSdk.setLevelStart(umengSdk.newGuide.guide02,2)
          end
          if GlobalData.getNewThroughLv() == 1 then
            -- 新通关了第1关才会显示英雄大厅引导，之后要重置新通关了第几关数据
             GlobalData.setNewThroughLv(0)
          end
          local finger = self.upLv_btn:getChildByName("finger")
          if finger then
             finger:removeFromParent()
          end
    end
    self.sureBtn = self.studioPage.sureBtn
    self.sureBtn:addClickEventListener(sureBack)
    -- 升级按钮
    self.upLv_btn = self.studioPage["upLv_btn"] 
    self.upLv_btn:setScale9Enabled(true)
    self.upLv_btn:setCapInsets(cc.rect(24,24,24,24))
    self.upLv_btn:setContentSize(cc.size(246,97))
    self.heroStar = self.studioPage["heroStar_1"]
    --升级按钮发光
    self.light    = self.studioPage["LvUpBtn_light"]
    self.upLv_btn:addClickEventListener(function (params )   
        local active = GlobalData.getHeroActive(self.mainID)
        if active then 
            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
            self.sureBtn:setVisible(true)
            self.upLv_btn:setVisible(false)
            self.light:setVisible(false)
            self.heroStar:setVisible(false)
            self.upLvCastStarLabel:setVisible(false)
            self:stopAnimation(self.upLvArrow)
            for key,value in pairs(self.upLvSkill) do
                local name = string.format("upLvArrow_%d",key)
                local name1 = string.format("upLvArrow_%d",key+1)
                if self.studioPage[name] then
                    local arrow = self.studioPage[name]
                    arrow.x = self.studioPage[name]:getPositionX()
                    arrow.y = self.studioPage[name]:getPositionY()
                    self:arrowAnimation(arrow)
                end 
                if self.upLvSkill[key] then
                    if self.studioPage[name1] then
                        local arrow = self.studioPage[name1]
                        arrow.x = self.studioPage[name1]:getPositionX()
                        arrow.y = self.studioPage[name1]:getPositionY()
                        self:arrowAnimation(arrow)
                    end 
                end
            end
        else
            AudioMgr.playSound(AudioMgr.allUIEffect.Error,false)
            viewMgr.show(viewMgr.def.GETTIPS_UI,self.mainID)
        end
    end)
    
    -- 升级需要消耗的星星数量label
    self.upLvCastStarLabel = self.studioPage["star_label"]
    self.upLvCastStarLabel.x = self.upLvCastStarLabel:getPositionX()
    self.upLvCastStarLabel.y = self.upLvCastStarLabel:getPositionY()
    self.upLvCastStarLabel:setFontName(GLOBAL_FONTNAME)
    self.upLvCastStarLabel:enableOutline(cc.c4b(0,0,0,255),2)
    -- 目前总共有多少颗星星
    self.totalHasStarLabel = self.studioPage["has_Star_txt"]
    self.totalHasStarLabel:setString(GlobalData.getTotalStar())
    self.totalHasStarLabel:setFontName(GLOBAL_FONTNAME)
    self.totalHasStarLabel:enableOutline(cc.c4b(0,0,0,255),2)



    ------------------------------- 右边区域 ----------------------------------------
    -- 概述按钮
    local infoBtn = self.studioPage["info_btn"]
    infoBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        self:clickInfoBtn()
    end)
    -- 概述选中图片
    self.infoImgSelected = self.studioPage["infoImgSelected"]


    -- 属性按钮
    local attrBtn = self.studioPage["attr_Btn"]
    attrBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        self:clickAttrBtnBtn()
    end)
    -- 属性选中图片
    self.attrImgSelected = self.studioPage["attrImgSelected"]
    local language = GlobalData.getLanguage()
    if language == "EN" then
        self.infoImgSelected:setTexture("ui/hall/heroHome/infoImgSelected_EN.png")
        self.attrImgSelected:setTexture("ui/hall/heroHome/attrImgSelected_EN.png")
        infoBtn:loadTextures("ui/hall/heroHome/infoImg_EN.png","ui/hall/heroHome/infoImgSelected_EN.png",nil)
        attrBtn:loadTextures("ui/hall/heroHome/attrImg_EN.png","ui/hall/heroHome/attrImgSelected_EN.png",nil)
    end
    --五种属性
    local life       = self.studioPage["life"]
    local move       = self.studioPage["move_21"]
    local farAttack  = self.studioPage["farAttack_23"]
    local nearAttack = self.studioPage["nearAttack_22"]
    local armor      = self.studioPage["armor_20"]
    if language == "EN" then
        life:setTexture("ui/hall/heroHome/life_EN.png")
        move:setTexture("ui/hall/heroHome/move_EN.png")
        farAttack:setTexture("ui/hall/heroHome/farAttack_EN.png")
        nearAttack:setTexture("ui/hall/heroHome/nearAttack_EN.png")
        armor:setTexture("ui/hall/heroHome/armor_EN.png")
    end
    ---------------------------- 概述页面 -------------------------------
    -- 概述Panel
    self.infoPanel = self.studioPage["right_Info_Panel"]

    -- 英雄名字
    self.heroNameImg = self.studioPage["heroNameImg"]

    -- 五边形图片
    self.fivePointImg = self.studioPage["fivePointImg"]

    ---------------------------- 属性页面 -------------------------------
    -- 属性Panel
    self.attrPanel = self.studioPage["right_Attri_Panel"]
    self.attrPanel:setVisible(false)

    self.attNameLabel = {}    -- 属性名字的label
    self.attImg1s     = {}    -- 绿色条左边的三角形
    self.attImg2s     = {}    -- 绿色条中间的的长方形

    for i = 1, 14 do
        self.attNameLabel[i] = self.studioPage["text_"..i]
        self.attNameLabel[i]:setFontName(GLOBAL_FONTNAME)
        self.attNameLabel[i]:enableOutline(cc.c4b(0, 0, 0, 255), 1)
        self.attImg1s[i]     = self.studioPage["line_"..i.."_1"]
        self.attImg2s[i]     = self.studioPage["line_"..i.."_2"]
    end

    --------------------------- 获得所有属性数值label -----------------------
    -- 生命        300
    self.hpLabel = self.studioPage.Hp
    self.hpLabel:setFontName(GLOBAL_FONTNAME)
    self.hpLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 防御        30
    self.armorLabel = self.studioPage.armor
    self.armorLabel:setFontName(GLOBAL_FONTNAME)
    self.armorLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 攻击力      70
    self.attackLabel = self.studioPage.attack
    self.attackLabel:setFontName(GLOBAL_FONTNAME)
    self.attackLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 近战射程    300
    self.fireRangeLabel = self.studioPage.fireRange
    self.fireRangeLabel:setFontName(GLOBAL_FONTNAME)
    self.fireRangeLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 远程射程    300
    self.fireVisionLabel = self.studioPage.fireVision
    self.fireVisionLabel:setFontName(GLOBAL_FONTNAME)
    self.fireVisionLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 近战攻击频率    2
    self.cooldown1Label = self.studioPage.cooldown1
    self.cooldown1Label:setFontName(GLOBAL_FONTNAME)
    self.cooldown1Label:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 远程攻击频率    2
    self.cooldown2Label = self.studioPage.cooldown2
    self.cooldown2Label:setFontName(GLOBAL_FONTNAME)
    self.cooldown2Label:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 移动速度      150
    self.speedLabel = self.studioPage.speed
    self.speedLabel:setFontName(GLOBAL_FONTNAME)
    self.speedLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 暴击威力         30000%
    self.criticalPowerLabel = self.studioPage.criticalPower
    self.criticalPowerLabel:setFontName(GLOBAL_FONTNAME)
    self.criticalPowerLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 闪避率           3200%
    self.dodgeLabel = self.studioPage.dodge
    self.dodgeLabel:setFontName(GLOBAL_FONTNAME)
    self.dodgeLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 普攻吸血         10
    self.suckHpLabel = self.studioPage.suckHp
    self.suckHpLabel:setFontName(GLOBAL_FONTNAME)
    self.suckHpLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 治疗效果         1000%
    self.treatmentEffectLabel = self.studioPage.treatmentEffect
    self.treatmentEffectLabel:setFontName(GLOBAL_FONTNAME)
    self.treatmentEffectLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 暴击率           12000%
    self.criticalLabel = self.studioPage.critical
    self.criticalLabel:setFontName(GLOBAL_FONTNAME)
    self.criticalLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    -- 抵抗力           1000%
    self.resistControlLabel = self.studioPage.resistControl
    self.resistControlLabel:setFontName(GLOBAL_FONTNAME)
    self.resistControlLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1)
    ---------------------- 获得所有属性数值label End -----------------------
    local middel_Panel = self.studioPage["middel_Panel"]
    local function middleBack(sender,event)
        if event == ccui.TouchEventType.ended then
            self:updateSkillLVImg(self.mainID)
        end
    end
    middel_Panel:addTouchEventListener(middleBack)
    self:clickInfoBtn()


    -- change by Owen, 2016.7.28, 增加英雄重置按钮
    self.resetHeroBtn = self.studioPage["resetHeroBtn"]
    self.resetHeroBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        print("self:clickResetHeroBtn()")
        self:clickResetHeroBtn()
    end)

end

-- change by Owen, 2016.7.28, 增加英雄重置按钮
function HeroHomePanelTest:clickResetHeroBtn( ... )
    print("HeroHomePanelTest:clickResetHeroBtn")
    if self.selectedHeroStar > 1 then
        viewMgr.show(viewMgr.def.HERORESET_UI, self.heroConfig, self.selectedHeroStar, self)
    end
end

function HeroHomePanelTest:newGuide()
    if not NEED_NEW_GUIDE then return end
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.studioNode:getScale()
    layer:setScale(1/GLOBAL_HALL_UI_SCALE2)
    layer:setPosition(cc.p(-display.cx*(1/GLOBAL_HALL_UI_SCALE2),-display.cy*(1/GLOBAL_HALL_UI_SCALE2)))
    local pos = self.upLv_btn:convertToWorldSpace(cc.p(0.5,0.5))
    local size = self.upLv_btn:getContentSize()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.studioNode:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)
    
    local image = cc.Sprite:create("ui/common/1.png")
    local node = cc.Node:create()
    node:addChild(image)
    node:setPosition(pos.x+size.width/2,pos.y+size.height/2)
    self.m_ClipNode:setStencil(node)

    --frame
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(280,120))
    frame:setPosition(pos.x+size.width/2+2,pos.y+size.height/2)
    self.m_ClipNode:addChild(frame)

    local str = WordLanguage.store
    local text_1 = ccui.Text:create(str,GLOBAL_FONTNAME,20)
    text_1:setPosition(cc.p(-125,245))
    text_1:setColor(cc.c3b(226,200,15))
    self.m_ClipNode:addChild(text_1)
    local frame_1 = ccui.ImageView:create("ui/common/lightBox.png")
    frame_1:setScale9Enabled(true)
    frame_1:setCapInsets(cc.rect(20,20,20,20))
    frame_1:setContentSize(cc.size(320,80))
    frame_1:setPosition(cc.p(-125,295))
    self.m_ClipNode:addChild(frame_1)

    local frame_2 = ccui.ImageView:create("ui/common/lightBox.png")
    frame_2:setScale9Enabled(true)
    frame_2:setCapInsets(cc.rect(20,20,20,20))
    frame_2:setContentSize(cc.size(200,450))
    frame_2:setPosition(cc.p(140,10))
    self.m_ClipNode:addChild(frame_2)
    str = WordLanguage.upTips
    local text_2 = ccui.Text:create(str,GLOBAL_FONTNAME,20)
    text_2:setPosition(cc.p(140,245))
    text_2:setColor(cc.c3b(226,200,15))
    self.m_ClipNode:addChild(text_2)
    local function onTouchBegan(touch, event)
        local rect = self.sureBtn:getCascadeBoundingBox()
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

    local curScence = display.getRunningScene()
    local EffectAniCache    = require("app.map.spine.EffectAniCache")
    local spriteSize = self.upLv_btn:getContentSize()
    local finger = EffectAniCache.getFingerInHall()
    finger:setName("finger")
    self.upLv_btn:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end
-- 点击滚动区域中的按钮
function HeroHomePanelTest:clickScrollHero(mainID, leftIndex)
    print("HeroHomePanelTest:clickScrollHero target = "..mainID
        .." leftIndex = "..tostring(leftIndex))
  
    local mainID = tostring(mainID)
    self.mainID = mainID
    -- 获得英雄配置
    self.heroConfig = HeroProperties.get(mainID)
    local star = GlobalData.getHeroStar(mainID)
    self.selectedHeroStar = star

    -- change by Owen, 2016.7.28, 如果英雄大于1阶，洗点按钮才可以点击
    if self.selectedHeroStar > 1 then
        self.resetHeroBtn:setVisible(true)
        self.resetHeroBtn:setTouchEnabled(true)
    else
        self.resetHeroBtn:setVisible(false)
        self.resetHeroBtn:setTouchEnabled(false)
    end

    --self.upLv_btn:setEnabled(true)
    self.upLv_btn:setTouchEnabled(true)
    self.light:setVisible(true)
    -- 显示禁用状态
    --self.upLv_btn:setBright(true)
    -- 判断一下升级按钮是否可以点击
    local haveHero = GlobalData.getHeroActive(mainID)
    if haveHero and GlobalData.getTotalStar() < self.selectedHeroStar*2 then
        --self.upLv_btn:setEnabled(false)
        self.upLv_btn:setTouchEnabled(false)
        self.light:setVisible(false)
        -- 显示禁用状态
        self.upLv_btn:setBright(false)
    end
    self.bigHeroImg:loadTexture(string.format("ui/Icons/bigIcon/%s.png",mainID))
    
    ---------------------------- 显示选中图片 ----------------------------------
    for i = 1, 8 do
        if i == leftIndex then
            self.scrollSelectedImgs[i]:setVisible(true)
        else
            self.scrollSelectedImgs[i]:setVisible(false)
        end
    end


    ---------------------------- 修改技能图标 -----------------------------------
    -- 手动技能
    --技能方式
    local isAutoSkill = false
    local manualSkillPro = ManualSkillProperties.get(self.heroConfig.activeOrder[1])
    self.skillIcons[1]:loadTexture("ui/Icons/heroSkillIcon/"..manualSkillPro.icon..".png")
    -- 第二个技能
    local autoSkill  = self.heroConfig.automaticSkill
    local skill2Pro  = AutoSkillProperties.get(autoSkill[1])
    local skill3Pro  
    if #autoSkill == 1 then
        skill3Pro = PassiveSkillProperties.get(self.heroConfig.passiveSkill[1])
    elseif #autoSkill == 2 then
        isAutoSkill = true
        skill3Pro = AutoSkillProperties.get(autoSkill[2])
    end

    self.skillIcons[2]:loadTexture("ui/Icons/heroSkillIcon/"..skill2Pro.icon..".png")
    self.skillIcons[3]:loadTexture("ui/Icons/heroSkillIcon/"..skill3Pro.icon..".png")     
    
    local  function clickBack(sender,event)  
        if event == ccui.TouchEventType.ended then
            if sender:getName() == "heroSkillBg_1" then
                local manualId = tostring(tonumber(self.heroConfig.activeOrder[1]) + self.skill1Lv - 1)
                local manualSkillPro = ManualSkillProperties.get(manualId) 
                local node = self.skillIcons[1]:getChildByName("finger_1")
                if node then
                    node:removeFromParent(true)
                end
                viewMgr.show(viewMgr.def.TIPS_UI,1,manualSkillPro)
            end
            if sender:getName() == "heroSkillBg_2" then
                if self.skill2Lv == 0 then
                    self.skill2Lv = 1
                end
                local autoSkillId  = tostring(tonumber(self.heroConfig.activeOrder[2]) + self.skill2Lv-1)
                local skill2Pro  = AutoSkillProperties.get(autoSkillId)
                if skill2Pro == nil then
                    skill2Pro  = PassiveSkillProperties.get(autoSkillId)
                end
                local node = self.skillIcons[2]:getChildByName("finger_1")
                if node then
                    node:removeFromParent(true)
                end
                viewMgr.show(viewMgr.def.TIPS_UI,1,skill2Pro)
            end
            if sender:getName() == "heroSkillBg_3" then
                if self.skill3Lv == 0 then
                    self.skill3Lv = 1
                end
                local passiveId  = tostring(tonumber(self.heroConfig.activeOrder[3]) + self.skill3Lv-1)
                local skill3Pro  = PassiveSkillProperties.get(passiveId)
                if skill3Pro == nil then
                    skill3Pro  = AutoSkillProperties.get(passiveId)
                end
                local node = self.skillIcons[3]:getChildByName("finger_1")
                if node then
                    node:removeFromParent(true)
                end
                viewMgr.show(viewMgr.def.TIPS_UI,1,skill3Pro)
            end          
        end      
    end   
    local heroSkillBg_1 = self.studioPage["heroSkillBg_1"]
    heroSkillBg_1:addTouchEventListener(clickBack)
    local heroSkillBg_2 = self.studioPage["heroSkillBg_2"]
    heroSkillBg_2:addTouchEventListener(clickBack)
    local heroSkillBg_3 = self.studioPage["heroSkillBg_3"]
    heroSkillBg_3:addTouchEventListener(clickBack)
    -------------------------- 修改技能的等级图片 -----------------------------
    self.upLvSkill = self:updateSkillLVImg(mainID)

    ---------------------------- 显示概述页面 --------------------------------
    -- 显示概述页面
    self.infoPanel:setVisible(true)
    self.attrPanel:setVisible(false)
    -- 显示概述选中图片
    self.infoImgSelected:setVisible(true)
    self.attrImgSelected:setVisible(false)


    ---------------------------- 修改概述页面 -----------------------------------
    -- 修改英雄名字
    local name = utils.getName(mainID,"png")
    self.heroNameImg:setTexture("ui/hall/heroHome/heroName/"..name)

    -- 修改雷达图
    self.fivePointImg:setTexture("ui/hall/heroHome/fivePoint/"..mainID..".png")

    -- 修改描述文字
    local key = utils.getName("text")
    local disText = string.split(self.heroConfig[key],"$")
    local str = nil
    --if device.platform == "windows" then
        str = "        "..disText[1]
    --else
    --    str = "\t\t\t\t\t\t"..disText[1]
    --end
    self.info_1:setVisible(true)
    self.info_2:setVisible(true)
    self.info_3:setVisible(true)
    self.info_1:setString(str)
    self.info_3:setString(disText[2])
    ---------------------------- 修改属性页面 -----------------------------------
    local growth = HeroGrowth.get(mainID)
    self.growthDefine = growth[1][1]       -- 一星一级的品质

    -- 生命        300
    self.attImg2s[1]:setScaleX(self.growthDefine.maxHp / 300)
    self.hpLabel:setString(self.growthDefine.maxHp)
    -- 防御        30
    self.attImg2s[2]:setScaleX( self.growthDefine.armor / 25)
    self.armorLabel:setString(self.growthDefine.armor)
    -- 攻击力      70
    self.attImg2s[3]:setScaleX(self.growthDefine.attack / 70)
    self.attackLabel:setString(self.growthDefine.attack)
    -- 近战射程    300
    if self.heroConfig.fireRange and self.heroConfig.fireRange ~= 0 then
        self.attImg2s[4]:setScaleX(self.heroConfig.fireRange / 300)       
        self.fireRangeLabel:setString(self.heroConfig.fireRange)
    else
        self.fireRangeLabel:setVisible(false)
        self.attImg1s[4]:setVisible(false)
        self.attImg2s[4]:setVisible(false)
    end
    -- 远程射程    300
    if self.heroConfig.fireVision and self.heroConfig.fireVision ~= 0 then
        self.attImg2s[5]:setScaleX(self.heroConfig.fireVision / 300)
        self.fireVisionLabel:setString(self.heroConfig.fireVision)
    else
        self.fireVisionLabel:setVisible(false)
        self.attImg1s[5]:setVisible(false)
        self.attImg2s[5]:setVisible(false)
    end

    -- 近战攻击频率    2
    if self.heroConfig.cooldown1 and self.heroConfig.cooldown1 ~= 0 then
        local scale = (self.heroConfig.cooldown1/1000)/2
        self.attImg2s[6]:setScaleX(scale)
        local value = string.format("%.2f%s",self.heroConfig.cooldown1/1000,WordLanguage.Rate)
        self.cooldown1Label:setString(value)
    else
        self.cooldown1Label:setVisible(false)
        self.attImg1s[6]:setVisible(false)
        self.attImg2s[6]:setVisible(false)
    end

    -- 远程攻击频率    2
    if self.heroConfig.cooldown2 and self.heroConfig.cooldown2 ~= 0 then
        local scale = (self.heroConfig.cooldown2/1000)/2
        self.attImg2s[7]:setScaleX(scale)
        local value = string.format("%.2f%s",self.heroConfig.cooldown2/1000,WordLanguage.Rate)
        self.cooldown2Label:setString(value)
    else
        self.cooldown2Label:setString(false)
        self.attImg1s[7]:setVisible(false)
        self.attImg2s[7]:setVisible(false)
    end

    -- 移动速度      150
    self.attImg2s[8]:setScaleX(self.heroConfig.speed / 150)
    self.speedLabel:setString(self.heroConfig.speed)
    -- 暴击威力         30000%
    self.attImg2s[9]:setScaleX(self.heroConfig.criticalPower / 30000)
    local value = tostring(self.heroConfig.criticalPower/100).."%"
    self.criticalPowerLabel:setString(value)
    -- 闪避率           3200%
    self.attImg2s[10]:setScaleX(self.heroConfig.dodge / 3200)
    local str = (self.heroConfig.dodge/100).."%"
    self.dodgeLabel:setString(str)
    -- 普攻吸血         10
    if self.heroConfig.suckHp and self.heroConfig.suckHp ~= 0 then
        self.attImg2s[11]:setScaleX(self.heroConfig.suckHp / 10)
        self.suckHpLabel:setString(self.heroConfig.suckHp)
    else
        self.suckHpLabel:setVisible(false)
        self.attImg1s[11]:setVisible(false)
        self.attImg2s[11]:setVisible(false)
    end

    -- 治疗效果         1000%
    if self.heroConfig.treatmentEffect and self.heroConfig.treatmentEffect ~= 10000 then
        self.attImg2s[12]:setScaleX((self.heroConfig.treatmentEffect - 10000) / 10000)
        self.treatmentEffectLabel:setString(self.heroConfig.treatmentEffect/10000)
    else
        self.treatmentEffectLabel:setVisible(false)
        self.attImg1s[12]:setVisible(false)
        self.attImg2s[12]:setVisible(false)
    end

    -- 暴击率           12000%
    if self.growthDefine.critical and self.growthDefine.critical ~= 0 then
        self.attImg2s[13]:setScaleX(self.growthDefine.critical / 12000)
        local str = (self.growthDefine.critical/100).."%"
        self.criticalLabel:setString(str)
    else
        self.criticalLabel:setVislble(false)
        self.attImg1s[13]:setVisible(false)
        self.attImg2s[13]:setVisible(false)
    end

    -- 抵抗力           1000%
    if self.heroConfig.resistControl and self.heroConfig.resistControl ~= 0 then
        self.attImg2s[14]:setScaleX(self.heroConfig.resistControl / 10)
        self.resistControlLabel:setString(self.heroConfig.resistControl)
    else
        self.resistControlLabel:setVisible(false)
        self.attImg1s[14]:setVisible(false)
        self.attImg2s[14]:setVisible(false)
    end
    for i= 1,3 do
        local node = self.skillIcons[i]:getChildByName("finger_1")
        if node then
            node:removeFromParent(true)
        end
    end
end
--刷新下部升阶按钮
function HeroHomePanelTest:refrushButton(mainID)

    local star = GlobalData.getHeroStar(mainID)
    if self.text == nil then
        self.text = ccui.Text:create()  
        self.text:setFontName(GLOBAL_FONTNAME)  
        self.text:enableOutline(cc.c4b(0,0,0,255),2)
        self.upLv_btn:addChild(self.text)
    end

    if self.richText then
        self.richText:setVisible(false)
    end
    if self.text then
        self.text:setVisible(false)
    end
    local size = self.upLv_btn:getContentSize()
    local active = GlobalData.getHeroActive(tostring(mainID))
    if not active then
        --self.upLv_btn:setEnabled(true)
        self.upLv_btn:loadTextureNormal("ui/common/1.png")
        self.upLv_btn:setTouchEnabled(true)
        self.heroStar:setVisible(false)
        self.upLvCastStarLabel:setVisible(false)
        self:stopAnimation(self.upLvArrow)
        local data = getWayData.get(tostring(mainID))
        local money = data[utils.getName("money")]
        local content = string.split(data[utils.getName("text")],"$")
        if money > 0 then        
            if node == nil then
                self.richText = ccui.RichText:create()
                self.richText:setOutLine(cc.c4b(0,0,0,255),2)
                self.richText:setPosition(size.width/2,size.height/2)
                self.upLv_btn:addChild(self.richText)
            end
            if content[3] then
                local path = nil
                if "diamond" == content[3] then
                    path = "ui/getTips/zuan.png"
                elseif "money" == content[3] then
                    path = utils.getName("ui/getTips/money","png")
                end
                local elem = ccui.RichElementImage:create(1, cc.c3b(255, 255, 255), 255,path)
                self.richText:pushBackElement(elem)
            end
            if content[2] then
                local elem = ccui.RichElementText:create(1, cc.c3b(255,251,1),255,content[2],GLOBAL_FONTNAME,28)
                self.richText:pushBackElement(elem)
            end
            local elem = ccui.RichElementText:create(1, cc.c3b(255,255,255),255,WordLanguage.Buy,GLOBAL_FONTNAME,28)
            self.richText:pushBackElement(elem)   
            self.richText:setVisible(true)     
        else
            self.text:setOpacity(255)
            self.text:setFontSize(30)
            self.text:setPosition(size.width/2,size.height/2)
            self.text:setString(WordLanguage.Unlock)
            self.text:setVisible(true)         
        end
    else
        -- 更新星星消耗
        self.heroStar:setVisible(true)
        self.heroStar:setOpacity(255)
        self.upLvCastStarLabel:setOpacity(255)
        self.upLvCastStarLabel:setPosition(cc.p(self.upLvCastStarLabel.x,self.upLvCastStarLabel.y))
        self.upLvCastStarLabel:setVisible(true)
        self.upLvCastStarLabel:setString(self.selectedHeroStar*2)
        local curStar = GlobalData.getTotalStar()

        self.text:setFontSize(34)
        self.text:setString(WordLanguage.updata)
        self.text:setVisible(true)
        local sizeTxt = self.text:getContentSize()
        self.text:setOpacity(255)
        self.text:setPosition(cc.p(size.width/2-sizeTxt.width/2,size.height/2))
        self.upLv_btn:loadTextureNormal("ui/common/1.png")
        self.upLv_btn:setTouchEnabled(true)
        if (star >= 5) or self.selectedHeroStar*2 > curStar then
            --self.upLv_btn:setEnabled(false)
            self.upLv_btn:loadTextureNormal("ui/common/5.png")
            self.upLv_btn:setTouchEnabled(false)
            self.light:setVisible(false)
            self.heroStar:setOpacity(60)
            self.upLvCastStarLabel:setOpacity(60)
            self.text:setOpacity(60)
        end
        if star >= 5 then
            local str = WordLanguage.full
            self.upLvCastStarLabel:setString(str)
            self.upLvCastStarLabel:setPosition(cc.p(self.upLvCastStarLabel.x-30,self.upLvCastStarLabel.y))
            self.heroStar:setVisible(false)
            self.text:setVisible(false)
        end
    end
end
--左侧英雄头像右上角角标
function HeroHomePanelTest:rightTips()
    --是否显示升级提示
    local starNum = GlobalData.getTotalStar()
    for i = 1,8 do
        local curHeroStar = GlobalData.getHeroStar(orderHeros[i])
        local name = string.format("heroTips_%d",i)
        local sprite = self.studioPage[name]
        if sprite then
            local isActive = GlobalData.getHeroActive(orderHeros[i])
            if isActive then
                local path = "ui/Icons/heroIcon/"..orderHeros[i]..".png"
                self.scrollHeroBtns[i]:loadTextures(path,path,nil)
                if curHeroStar*2 <= starNum and curHeroStar < 5 then     
                    sprite:setVisible(true)
                else
                    sprite:setVisible(false)
                end
            else
                local path = "ui/Icons/heroIcon/"..orderHeros[i].."hui"..".png"
                self.scrollHeroBtns[i]:loadTextures(path,path,nil)
                sprite:setVisible(false)
            end
        end
    end
end
-- 更新技能的等级图片, 以及升级按钮的状态
function HeroHomePanelTest:updateSkillLVImg(mainID)

    -- add by Owen, 2016.7.28, 升级了英雄以后，要把重置按钮置为可见
    -- 根据英雄星阶，来控制按钮可见不可见
    if self.selectedHeroStar > 1 then
        self.resetHeroBtn:setVisible(true)
        self.resetHeroBtn:setTouchEnabled(true)
    else
        self.resetHeroBtn:setVisible(false)
        self.resetHeroBtn:setTouchEnabled(false)
    end

    local upLvTable = {}
    local skill_1 = false
    local skill_2 = false
    local skill_3 = false
    self.skill1Lv = 0
    self.skill2Lv = 0
    self.skill3Lv = 0
    for i = 1, 5 do
        if i <= self.selectedHeroStar then
            if not self.skill1LvImgs[i]:isVisible() then
                skill_1 = true
                self.skill1LvImgs[i]:setVisible(true)
                self:newGuideAni(self.skillIcons[1])   
                --GlobalData.setShowflag_1(self.mainID,1)          
            end
            self.skill1Lv = self.skill1Lv + 1
            table.insert(upLvTable,1)
        else
            --GlobalData.setShowflag(0)
            self.skill1LvImgs[i]:setVisible(false)
        end
    end
    for i = 1, 4 do
        if i <= self.selectedHeroStar - 1 then
            if not self.skill2LvImgs[i]:isVisible() then
                skill_2 = true
                self.skill2LvImgs[i]:setVisible(true)                
                self:newGuideAni(self.skillIcons[2])
                 --GlobalData.setShowflag_2(self.mainID,1)  
            end
            self.skill2Lv = self.skill2Lv + 1
            table.insert(upLvTable,2)
        else
            --GlobalData.setShowflag(0)
            self.skill2LvImgs[i]:setVisible(false)
        end
    end
    for i = 1, 3 do
        if i <= self.selectedHeroStar - 2 then
            if not self.skill3LvImgs[i]:isVisible() then
                skill_3 = true
                self.skill3LvImgs[i]:setVisible(true)               
                self:newGuideAni(self.skillIcons[3])
                 --GlobalData.setShowflag_3(self.mainID,1)  
            end
            self.skill3Lv = self.skill3Lv + 1
            table.insert(upLvTable,3)
        else
            --GlobalData.setShowflag(0)
            self.skill3LvImgs[i]:setVisible(false)
        end
    end
    if self.upSure then
        if skill_1 then
            local effect_1 = EffectAniCache.getEffectAniCache("ui_hero_advanced",false)
            local size = self.skillIcons[1]:getContentSize()
            effect_1:setPosition(cc.p(size.width/2-2,size.height/2+8))
            self.skillIcons[1]:addChild(effect_1,10)
        end
        if skill_2 then
            local effect_1 = EffectAniCache.getEffectAniCache("ui_hero_advanced",false)
            local size = self.skillIcons[2]:getContentSize()
            effect_1:setPosition(cc.p(size.width/2-2,size.height/2+8))
            self.skillIcons[2]:addChild(effect_1,10)
        end
        if skill_3 then
            local effect_1 = EffectAniCache.getEffectAniCache("ui_hero_advanced",false)
            local size = self.skillIcons[3]:getContentSize()
            effect_1:setPosition(cc.p(size.width/2-2,size.height/2+8))
            self.skillIcons[3]:addChild(effect_1,10)
        end
        self.upSure = false
    end
    self:refrushButton(self.mainID)
    self:initSkillState()
    for i = 1,5 do
        local name = string.format("upLvStone_%d",i)
        local stone = self.studioPage[name]
        if i <= self.selectedHeroStar then
            stone:setVisible(true)
        else
            stone:setVisible(false)
        end
    end
    self:rightTips()
    return upLvTable
end

-- 点击升级按钮
function HeroHomePanelTest:clickUpLvBtn()
    self:stopAnimation(self.upLvArrow)
    -- 已经升到顶级了
    if self.selectedHeroStar >= 5 then
        return
    end
    AudioMgr.playSound(self.heroConfig.sound_advance,false)
    for i = 1,3 do
        local name = string.format("upLvArrow_%d",i)
        if self.studioPage[name] then
            self:stopAnimation(self.studioPage[name])
        end
    end
    -- 消耗星星
    GlobalData.reduceTotalStar(self.selectedHeroStar*2)
    -- 更新页面上显示的总共有几颗星星
    self.totalHasStarLabel:setString(GlobalData.getTotalStar())

    -- 提升英雄的阶级
    GlobalData.setHeroStar(self.heroConfig.mainID, self.selectedHeroStar + 1)
    self.selectedHeroStar = self.selectedHeroStar + 1
    local effect = nil
    
    local name = string.format("upLvStone_%d",self.selectedHeroStar)
    local stone = self.studioPage[name]
    if stone then
        local function func()
            if effect then
                effect:removeFromParent()
                effect = nil
            end  
        end
        effect = EffectAniCache.getEffectAniCache("ui_advanced",false,func)
        local x,y = stone:getPosition()
        local pos = self.studioNode:convertToNodeSpace(cc.p(x,y))
        effect:setPosition(cc.p(x,y))
        self.studioNode:addChild(effect,3)
    end
    NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
    self.upLvSkill = self:updateSkillLVImg()

    -- add by Owen, 2016.7.28, 升级了英雄以后，要把重置按钮置为可见
    self.resetHeroBtn:setVisible(true)
    self.resetHeroBtn:setTouchEnabled(true)
end


-- 点击概述页面按钮
function HeroHomePanelTest:clickInfoBtn()
    print("HeroHomePanelTest:clickInfoBtn")
    self.infoImgSelected:setVisible(true)
    self.attrImgSelected:setVisible(false)
    self.info_1:setVisible(true)
    self.info_2:setVisible(true)
    self.info_3:setVisible(true)
    self.infoPanel:setVisible(true)
    self.attrPanel:setVisible(false)
end

-- 点击属性页面
function HeroHomePanelTest:clickAttrBtnBtn()
    print("HeroHomePanelTest:clickAttrBtnBtn")
    self.infoImgSelected:setVisible(false)
    self.attrImgSelected:setVisible(true)

    self.infoPanel:setVisible(false)
    self.attrPanel:setVisible(true)
    self.info_1:setVisible(false)
    self.info_2:setVisible(false)
    self.info_3:setVisible(false)
end

-- 获得node页面
function HeroHomePanelTest:getPage()
    return self.studioNode
end
--可以升阶时箭头动画
function HeroHomePanelTest:arrowAnimation(node)
    if node then
        if not node:isVisible() then node:setVisible(true) end
        local jump1 = cc.JumpBy:create(0.7,cc.p(0,10),0,0)
        local jump2 = jump1:reverse()
        local jump = cc.Sequence:create(jump1,jump2)
        node:runAction(cc.RepeatForever:create(jump))
    end
end
--停止箭头动画并隐藏
function HeroHomePanelTest:stopAnimation(node)
    if node then
        if node:isVisible() then node:setVisible(false) end
        node:stopAllActions()
        if node.x and node.y then
            node:setPosition(cc.p(node.x,node.y))
        end
    end
end
--技能升级初始状态
function HeroHomePanelTest:initSkillState()
    if self.sureBtn then
        self.sureBtn:setVisible(false)
    end
    if self.upLv_btn then
        self.upLv_btn:setVisible(true)
        self.light:setVisible(true)
    end
    for i = 1,3 do
        local name = string.format("upLvArrow_%d",i)
        if self.studioPage[name] then
            self:stopAnimation(self.studioPage[name])
        end
    end
    self:stopAnimation(self.upLvArrow)
end
function HeroHomePanelTest:createBrief(text,fontName,FontSize)
    local briefNode = self.textBg:getChildByName("Brief")
    local imageSize = self.textBg:getContentSize()
    local disText = {}
    disText = string.split(self.heroConfig.text,"$")
    if briefNode == nil then
        local node = cc.Node:create()
        node:setName("Brief")
        local text1 = ccui.Text:create(disText[1],fontName,FontSize)
        text1:setName("brief1")
        text1:setAnchorPoint(cc.p(0,1))
        local height1 = math.ceil(text1:getStringLength()/13)+1
        if height1 > 5 then
            height1 = 5   
        end
        text1:ignoreContentAdaptWithSize(false);
        text1:setContentSize(cc.size(270,height1*20))
        text1:setPosition(cc.p(-130,height1*20/2))
        local size = text1:getContentSize()
        node:addChild(text1)
        local text2 = ccui.Text:create(disText[2],fontName,FontSize)
        local height2 = math.ceil(text2:getStringLength()/13)
        text2:setName("brief2")
        text2:ignoreContentAdaptWithSize(false);
        text2:setContentSize(cc.size(270,height2*20))
        text2:setAnchorPoint(cc.p(0,1))
        text2:setPosition(cc.p(-130,text1:getPositionY()-height1*20))
        node:setPosition(cc.p(imageSize.width/2,(height1+height2)*20))
        node:addChild(text2)
        self.textBg:addChild(node)
    else
        local text1 = briefNode:getChildByName("brief1")
        local height1 = nil
        local height2 = nil
        if text1 then
            text1:setString(disText[1])
            local temp = text1:getStringLength()/13
            height1 = math.ceil(text1:getStringLength()/13)+1
            if height1 > 5 then
                height1 = 5   
            end
        end
        local text2 = briefNode:getChildByName("brief2")
        if text2 then
            text2:setPosition(cc.p(-130,text1:getPositionY()-height1*20))
            text2:setString(disText[2])
            height2 = math.ceil(text2:getStringLength()/13)
        end
        briefNode:setPosition(cc.p(imageSize.width/2,(height1+height2)*20))
    end
end
return HeroHomePanelTest