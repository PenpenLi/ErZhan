

local GlobalData            = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
local GroupProperties       = require("app.properties.GroupProperties")
local GroupDetailPanel      = require("hall.GroupDetailPanel")
--local ChooseModeRightPanel  = require("hall.ChooseModeRightPanel")
local MapConstants          = require("app.map.MapConstants")
local MapConfig             = require("maps.MapConfig")

local ChooseModePanelTest = class("ChooseModePanelTest")

local EffectAniCache        = require("app.map.spine.EffectAniCache")
local HeroProperties        = require("app.properties.HeroProperties")
-- 加载studio导出的选关页面
function ChooseModePanelTest:ctor(self,lv,showHeroMusic)
    self.timeHeroCount = 0
    self.towGuide = false   --是否在第二关引导内
    self.showHeroMusic = showHeroMusic
    self.guideEnd = false
    self.effAniData   = require("app.properties.EffectProperties")
    EffectAniCache.addEffectAniCache("ui_relation",self.effAniData.ui_relation)
    EffectAniCache.addEffectAniCache("ui_relation_3",self.effAniData.ui_relation_3)
    EffectAniCache.addEffectAniCache("ui_relation_2",self.effAniData.ui_relation_2)
    EffectAniCache.addEffectAniCache("ui_relation_1",self.effAniData.ui_relation_1)
    --EffectAniCache.addEffectAniCache("ui_battle",self.effAniData.ui_battle)

    self.studioPage = import("hall.ChooseModePanelStudio").create()
    local chooseModePanelStudio = self.studioPage.root
    self.gameMode = 1
    self.passID = self.studioPage.BitmapFontLabel_1

    chooseModePanelStudio:setTouchEnabled(true)
    chooseModePanelStudio:setTouchSwallowEnabled(true) 

    chooseModePanelStudio:retain()
    local panel = self.studioPage["Panel_1"]
    self.studioNode = chooseModePanelStudio
    self.studioNode.onEnter = self:onEnter()
    --self.studioNode:setScale(GLOBAL_HALL_UI_SCALE2)
    -- 获得Studio中的所有控件
    self:getAllElemets()

    -- 难度模式，1表示简单，2表示困难
    self.hardMode = MapConstants.DIFFICULTY_MODE_EASY
    -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3
    self.gameMode = MapConstants.GAME_MODE_ONE  

    --三个发光框
    self.light_1 = self.studioPage["light_1"]
    self.light_1:setVisible(true)
    self.light_2 = self.studioPage["light_2"]
    self.light_2:setVisible(true)
    self.light_3 = self.studioPage["light_3"]
    self.light_3:setVisible(true)
    local Panel_1 = self.studioPage.Panel_1
    utils.playAction(self.studioNode,Panel_1,true)
    --简介大底框
    self.titleFrame = self.studioPage["titleFrame"]
    self.heros                 = {}                -- 记录总共有几个英雄
    self.selectedHeroBtns      = {}                -- 记录已选中英雄按钮
    self.selectedHeros         = {}                -- 记录已选中英雄id
    self.bottomHeroBtns        = {}                -- 记录底部的12个按钮
    self.bottomHeroOuts        = {}                -- 记录底部的12个按钮的选中图片
    self.upHeroImgs            = {}                -- 记录已选中的英雄按钮的头像
    self.upHeroOuts            = {}                -- 记录已选中的英雄按钮的外发光
    self.groupOpenImgs         = {}                -- 记录6个羁绊图标
    self.groupOpenSkill        = {}                -- 记录当前激活的羁绊技能

    local orderHeros = GlobalData.getHeroOrder()
    local heroInfight = GlobalData.getHeroInFight()
    for i = 1, 8 do
        self.heros[i] = HeroProperties.get(orderHeros[i])

        if i < 4 then
            if #heroInfight == 0 then
                -- 第一次进入这个页面，默认把前三个英雄选中
                self.selectedHeros[i] = self.heros[i].mainID
                self.middleHeroIcons[i]:setVisible(true)
                self.middleHeroIcons[i]:setTexture("ui/Icons/heroIcon/"..self.selectedHeros[i]..".png")
            else
                self.selectedHeros[i] = heroInfight[i]
                -- 如果有这个位置有英雄上阵
                if heroInfight[i] ~= 0 then
                    self.middleHeroIcons[i]:setVisible(true)
                    self.middleHeroIcons[i]:setTexture("ui/Icons/heroIcon/"..self.selectedHeros[i]..".png")
                end
            end
        end
    end
    -- 根据上阵的英雄，去掉滚动条中选中的图标
    for i = 1, 8 do
        local mainID = tostring(self.scrollHeroBtns[i]:getTag())
        print("mainID = "..tostring(mainID))
        local isSelected = false
        for k, v in pairs(self.selectedHeros) do
            if v == mainID then
                isSelected = true
                print("isSelected = true")
            end
        end
        if not isSelected then
            self.scrollSelectedImgs[i]:setVisible(false)
        end
    end
    self:setLv(lv)
    -- 记录激活的羁绊，以及羁绊图标的显示
    self:declGroups()
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
end
function ChooseModePanelTest:onUpdateHero()
    self.showHeroMusic = false
    self:setLineUp(self.gameMode)
end
function ChooseModePanelTest:onEnter()
    NotifyCenter.register(EventNames.REFRUSH_WORLDHALL, handler(self, self.onUpdateHero), self.studioNode)
end

-- add by Owen, 2016.7.20, 显示 “恭喜解锁新英雄” 页面
function ChooseModePanelTest:showUnlockNewHero(heroID, finc)
    if not NEED_NEW_GUIDE then return end
    viewMgr.show(viewMgr.def.GETNEWHERO_UI, heroID, finc)
end

-- 在第一次进入第二关选关页面，显示在下方 羁绊按钮上面的感叹号 新手引导
function ChooseModePanelTest:newGuide()
    -- change by Owen, 2016.7.20, 把第3个英雄下阵
    if not NEED_NEW_GUIDE then return end
    self:clickMiddleHero(3)

    -- 设置 第二关获得新英雄引导 已经显示过了
    GlobalData.setOpenLv2GuideHasShow()

    local function finc( ... )
        -- 显示英雄上阵引导
        self:heroFightGuide()
    end
    self.towGuide = true
    -- 显示 “恭喜解锁新英雄” 页面
    self:showUnlockNewHero("110101", finc)    
end

-- add by Owen, 2016.7.20, 显示英雄上阵引导
function ChooseModePanelTest:heroFightGuide()

    -- 获得滚动条上，矮人按钮
    local heroIndex = 0
    local Container  = self.scrollView:getInnerContainer()
    self.scrollView:setEnabled(false)
    local tainerSize = Container:getContentSize()
    local scrollSize = self.scrollView:getContentSize()
    local distance   = tainerSize.height - scrollSize.height
    local btn
    for i = 1, 8 do
        local tag = self.scrollHeroBtns[i]:getTag()
        if tag == 110101 then
            btn = self.scrollHeroBtns[i]
            heroIndex = self.timeHeroCount + i
            break
        end
    end
    local x = -527
    local y = 0
    if heroIndex == 2 then
        y = 140
    elseif heroIndex == 3 then
        y = 10
    elseif heroIndex == 4 then
        y = -120
    else
    end
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    local scale = self.studioNode:getScale()
    layer:setScale(1/scale)
    layer:setPosition(cc.p(-display.cx*(1/scale),-display.cy*(1/scale)))
    
    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.studioNode:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local image = cc.Sprite:create("ui/common/mask_img.png")
    image:setScale(1.2)
    local imageSize = image:getContentSize()
    local node = cc.Node:create()
    node:addChild(image)

    --
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(130,130))
    frame:setPosition(cc.p(x,y))
    self.m_ClipNode:addChild(frame)

    node:setPosition(cc.p(x,y))
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local rect = btn:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            self.scrollView:setEnabled(true)
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
    finger:setName("finger")
    btn:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end

--引导手指点击
function ChooseModePanelTest:newGuide_1(fourModeData,fiveModeData)
    if not NEED_NEW_GUIDE then return end
    if self.beginBtn:getChildByName("finger_1") then return end
    local size = self.beginBtn:getContentSize()
    local EffectAniCache    = require("app.map.spine.EffectAniCache")
    local finger = EffectAniCache.getFingerInHall()
    finger:setName("finger_1")
    self.beginBtn:addChild(finger)
    finger:setPosition(cc.p(size.width/2,size.height/2))
    if fourModeData and fiveModeData then
        if fourModeData > 0 and fiveModeData <= 0 then
            local limitNum = GlobalData.getTimeHeroNum("110301")
            if limitNum and limitNum > 0 then
                self:clickMiddleHero(3)             
                self:clickScrollHero("110301",3)
            end
        end
    end
end
--三个星星
function ChooseModePanelTest:getAllStar(passID,mode,hard)
    self.gameMode = mode
    local starTable = GlobalData.getLvStar(passID)
    local curStar = 0
    if mode == 1 then
        if hard == nil then
            curStar = starTable[mode][1]
        else
            curStar = starTable[mode][2]
        end
    elseif mode == 2 or mode == 3 then
        curStar = starTable[mode]
    end
    for i = 1,3 do
        local name = "star_"..i
        local node = self.studioPage[name]
        if node then
            if i <= curStar then
                node:setVisible(true)
            else
                node:setVisible(false)
            end
        end
    end
end
--特效
function ChooseModePanelTest:playEffect(node,idx)
    --特效框
    local name = tostring(idx)
    local eff = node:getChildByName(name)
    if eff then
        eff:removeFromParent()
        eff = nil
    end
    local effect = EffectAniCache.getEffectAniCache("ui_relation",true)
    effect:setName(idx)
    local size = node:getContentSize()
    effect:setPosition(cc.p(size.width/2+1,size.height/2+5))
    node:addChild(effect)
    --特效六芒星
    local index = nil
    local posx = 0
    local posy = 0
    if idx == 2 then
        index = 3
        posx = 50
        posy = 95
    elseif idx == 3 then
        index = 2
        posx = -10
        posy = 34
    else
        index = 1
        posx = 110
        posy = 24
    end
    local effName = "ui_relation_"..index
    if node:getChildByName(effName) then return end
    local effect_1,offsetY_1,offsetX_1 = EffectAniCache.getEffectAniCache(effName,true)
    effect_1:setName(effName)
    effect_1:setPosition(cc.p(posx,posy))
    node:addChild(effect_1)
end
-- 记录所有的控件
function ChooseModePanelTest:getAllElemets()
    -- 关闭按钮
    local closeBtn  = self.studioPage["close_btn"]
    closeBtn:addClickEventListener(function (params )
        --self.studioNode:setVisible(false)
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        viewMgr.hide(viewMgr.def.CHOOSE_UI)
        return
    end) 
    --三个星星
    --新手引导使用
    --self.sprite = self.studioPage["jiban_bg_1_7"]
    --通关条件
    local str = WordLanguage.title
    local title = self.studioPage["title"]
    title:setString(str)
    title:setFontName(GLOBAL_FONTNAME)
    title:enableOutline(cc.c4b(0,0,0,255),2)
    --中间锁卡位
    self.middleLock = {}
    for i = 1,3 do
        local name = string.format("lock_%d",i)
        self.middleLock[i] = self.studioPage[name]
        self.middleLock[i]:setVisible(false)
    end
    local di_1 = self.studioPage["di_1"]
    local guan_2 = self.studioPage["guan_2"]
    local language = GlobalData.getLanguage()
    if language == "EN" then
        di_1:setTexture("ui/hall/chooseModel/level.png")
        di_1:setPosition(di_1:getPositionX()+30,di_1:getPositionY())
        self.passID:setPosition(self.passID:getPositionX()+50,self.passID:getPositionY())
        guan_2:setVisible(false)
    end
    -- add by Owen, 2016.5.20, 英文的时候，把第几关改为 Level 1
    local di_1 = self.studioPage["di_1"]
    local guan_2 = self.studioPage["guan_2"]
    local language = GlobalData.getLanguage()
    if language == "EN" then
        di_1:setTexture("ui/hall/chooseModel/level.png")
        di_1:setPosition(di_1:getPositionX()+30,di_1:getPositionY())
        self.passID:setPosition(self.passID:getPositionX()+50,self.passID:getPositionY())
        guan_2:setVisible(false)
    end

    -------------------------------- 滚动条 ------------------------------------------
    -- 滚动控件
    self.scrollView = self.studioPage["hero_ScrollView"]
    -- 记录左边的8个按钮，和8个选中的图片
    self.scrollHeroBtns     = {}    -- 8个滚动按钮
    self.scrollSelectedImgs = {}    -- 8个滚动按钮的选中图片
    self.leftLock           = {}    --左侧锁图标   
    self.heroIcon           = {}    --英雄图标
    self.Original           = {}    --原始排序
    self.OriginalId         = {}    --排序之后的id
    self.allPos             = {}
    local orderHeros = GlobalData.getHeroOrder()
    for i = 1, 8 do
        local btnName  = "btn_"..orderHeros[i]
        local iconName = "Image_"..orderHeros[i]
        self.scrollHeroBtns[i] = self.studioPage[btnName]
        self.heroIcon[i] = self.studioPage[iconName]
        local lockName = "lock_"..orderHeros[i]
        self.leftLock[i] = self.studioPage[lockName] 
        if device.platform == "windows"then
            if language == "EN" then
                self.leftLock[i]:setTexture("ui/hall/chooseModel/lockHero_EN.png")
            else
                self.leftLock[i]:setTexture("ui/hall/chooseModel/lockHero.png")
            end
            self.leftLock[i]:setPosition(cc.p(54,21))
        end

        local limitFlag = ccui.ImageView:create("ui/common/limit.png")
        limitFlag:setName("limitFlag")
        limitFlag:setVisible(false)
        local size = self.scrollHeroBtns[i]:getContentSize()            
        limitFlag:setPosition(cc.p(size.width/2,size.height/2))
        self.scrollHeroBtns[i]:addChild(limitFlag)  
        self.allPos[i] = self.scrollHeroBtns[i]:getPositionY()
        self.scrollSelectedImgs[i] = self.studioPage["img_leftSelected"..i]
        self.scrollHeroBtns[i]:addClickEventListener(function (params )
            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
            local active = GlobalData.getHeroActive(orderHeros[i])
            local limitNum = GlobalData.getTimeHeroNum(orderHeros[i])
            if active or (limitNum and limitNum > 0) then
                self:clickScrollHero(self.scrollHeroBtns[i]:getTag(), i)
            else                
                viewMgr.show(viewMgr.def.GETTIPS_UI,orderHeros[i])
            end
        end) 
        self.leftLock[i]:setVisible(false)
    end
    self.Original = clone(self.scrollHeroBtns)
    self.OriginalId = clone(orderHeros)
    local allTimeHeros = {}
    if GlobalData.getTimeHeroTable() then
        local tempHero = nil
        local num = 0
        for key,value in pairs(GlobalData.getTimeHeroTable()) do
            local active = GlobalData.getHeroActive(key)           
            num= GlobalData.getTimeHeroNum(key)
            if not active and num > 0 then
                table.insert(allTimeHeros,key)
            end
        end
        self.timeHeroCount = #allTimeHeros
        local pos = 0
        for i = 1,self.timeHeroCount do
            local hero1_x,hero1_y = self.Original[1]:getPosition()
            local heroId = allTimeHeros[i]
            if heroId then
                for j = 1,8 do
                    if heroId == self.OriginalId[j] then
                        pos = j
                        break
                    end
                end
                if pos ~= 0 then
                    tempHero = self.Original[pos]
                    tempId   = self.OriginalId[pos]                    
                    for key = pos-1,1,-1 do
                        if self.Original[key] then
                            self.Original[key+1] = self.Original[key]                         
                            self.OriginalId[key+1] = self.OriginalId[key] 
                        end
                    end
                    self.Original[1] = tempHero
                    self.OriginalId[1] = tempId
                    for k1 = 1,#self.Original do
                        self.Original[k1]:setPositionY(self.allPos[k1])
                    end
                end
            end 

        end
    end
    self.hex_3 = self.studioPage["hex_3"]
    self.hex_3:setVisible(true)
    ------------------------------- 中间区域 ----------------------------------------
    
    self.middleHeroBtns      = {}   -- 3个英雄按钮
    self.middleHeroIcons     = {}   -- 3个英雄图标
    self.middleSelectedImgs  = {}   -- 3个英雄选中的图标
    self.middleJibanBtns     = {}   -- 3个羁绊按钮
    self.middleJibanIcons    = {}   -- 3个羁绊图标

    for i = 1, 3 do
        self.middleHeroBtns[i]     = self.studioPage["bnt_selectedHero"..i]
        self.middleHeroIcons[i]    = self.studioPage["img_bigHeroIcon"..i]
        self.middleHeroIcons[i]:setVisible(false)
        self.middleHeroBtns[i]:addClickEventListener(function (params )
            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
            self:clickMiddleHero(i)
        end) 
        self.middleJibanBtns[i]    = self.studioPage["btn_jiban_"..i]
        self.middleJibanIcons[i]   = self.studioPage["jibanIcon_"..i]
        self.middleJibanIcons[i]:setVisible(true)
        self.middleJibanBtns[i]:addClickEventListener(function (params )
            self:clickJibanBtn(i)
        end) 
    end

    -- 详情按钮
    local moreInfoBtn = self.studioPage["btn_moreInfo"]
    moreInfoBtn:addClickEventListener(function (params )
        --self:clickMoreInfo()
        AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
        viewMgr.show(viewMgr.def.INFORMATE_UI)
    end)



    ------------------------------- 右边区域 ----------------------------------------
    -- 缩略图
    self.smallImg   = self.studioPage["img_small"]

    ------------------------- 文字 -------------------
    -- 文字内容
    self.txtContent = self.studioPage["txt_content"]
    -- 内容文字要自动换行
    self.txtContent:ignoreContentAdaptWithSize(false); 
    self.txtContent:setFontSize(22)
    -- 设置描边
    self.txtContent:enableOutline(cc.c4b(0, 255, 0, 255), 1)
    -- 设置字体
    self.txtContent:setFontName(GLOBAL_FONTNAME)
    self.txtContent:setContentSize(cc.size(350,50)); 
    local txtSize = self.txtContent:getContentSize()
    

    -------------------- 简单和苦难按钮 --------------
    -- 简单按钮
    self.easyBtn  = self.studioPage["btn_easy"]
    local str = WordLanguage.Easy
    local easyText = self.studioPage["easyText"]
    easyText:setString(str)
    easyText:setFontName(GLOBAL_FONTNAME)
    easyText:enableOutline(cc.c4b(0,0,0,255),2)
    self.easyBtn:addClickEventListener(function (params )
        self:getAllStar(self.lv,1,nil)
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        self:clickEasyBtn()
    end) 
    -- 简单的选中图片
    self.easySelected = self.studioPage["easySelected"]

    -- 困难按钮
    self.hardBtn  = self.studioPage["btn_hard"]
    str = WordLanguage.Hard
    local hardText = self.studioPage["hardText"]
    hardText:setString(str)
    hardText:setFontName(GLOBAL_FONTNAME)
    hardText:enableOutline(cc.c4b(0,0,0,255),2)
    self.hardBtn:addClickEventListener(function (params )
        self:getAllStar(self.lv,1,true)
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        self:clickHardBtn()
    end) 
    -- 困难的选中图片
    self.hardSelected = self.studioPage["hardSelected"]
    self.hardSelected:setVisible(false)

    -------------------- 三种模式的箭头 ----------------
    self.arrowIcons = {}
    for i = 1, 3 do
        self.arrowIcons[i] = self.studioPage["arrowIcon_"..i]
    end


    ----------------------- 模式按钮 -----------------
    self.modelBtns = {}
    self.modelIcons = {}           -- 模式的图标
    self.modelSelectedImgs = {}    -- 模式的选中图片
    for i = 1, 3 do
        self.modelBtns[i] = self.studioPage["btn_mode"..i]
        self.modelBtns[i]:addClickEventListener(function (params )
                AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
                self:clickModelBtn(i)
        end) 

        self.modelSelectedImgs[i] = self.studioPage["modeSelected_"..i]
        if (i ~= 1) then
            self.modelSelectedImgs[i]:setVisible(false)
        else
            self.modelSelectedImgs[i]:setVisible(true)
        end
    end
    --self.modelSelectedImgs[1]:setVisible(true)
    ------------------- 开始游戏按钮 ------------------
    self.beginBtn    = self.studioPage["btn_begin"]
    local str = WordLanguage.chooseBegin
    local beginText = self.studioPage["beginText"]
    beginText:setString(str)
    beginText:setFontName(GLOBAL_FONTNAME)
    beginText:enableOutline(cc.c4b(0,0,0,255),2)
    self.beginBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
        self:clickBeginBtn(i)
    end) 
end

-- 点击滚动区域中的按钮
function ChooseModePanelTest:clickScrollHero(mainID, leftIndex,needRepond)
    
    if self.m_ClipNode then
        self.m_ClipNode:removeFromParent()
        self.m_ClipNode = nil
    end
    local towData = GlobalData.getLvStar(2)
    local towModeData = towData[1][1] + towData[1][2]
    if towModeData <= 0 and self.lv == 2 then           
        local finger = self.scrollHeroBtns[2]:getChildByName("finger")
        if finger then
            finger:removeFromParent()
            finger = nil
            local spriteSize = self.light_2:getContentSize()
            local tips = ccui.ImageView:create()
            tips:setName("finger_2")
            tips:setScale(0.8)
            tips:loadTexture("ui/hall/wordMap/handTips.png")
            tips:setPosition(cc.p(spriteSize.width-10,spriteSize.height-20))
            self.light_2:addChild(tips,1)
            local jump_1 = cc.JumpTo:create(0.8,cc.p(tips:getPositionX(),tips:getPositionY()),15,2)
            local delay   = cc.DelayTime:create(0.25)
            local seq = cc.Sequence:create(jump_1,delay)
            local action = cc.RepeatForever:create(seq)
            tips:runAction(action)

            utils.createAniFont("激活英雄羁绊技能",self.light_2)
        end
        
    end      
    if needRepond == nil then
        needRepond = true
    end
    if mainID == nil then
        return
    end
    if self.leftLock[leftIndex]:isVisible() then
        --添加弹出界面处理
        return
    end
    print("ChooseModePanelTest:clickScrollHero target = "..mainID
        .." leftIndex = "..tostring(leftIndex))
    local mainID = tostring(mainID)

    -- 这个英雄是不是已经上阵了
    local upIndex = 0    -- 中间的英雄按钮的索引
    for i = 1, 3 do
        if mainID == self.selectedHeros[i] then
            upIndex = i
            break
        end
    end

    print("upIndex = "..tostring(upIndex))

    if upIndex ~= 0 then
        -- 已经在阵上了,按照点击中间的英雄按钮处理
        if needRepond then
            self:clickMiddleHero(upIndex)
            return
        else
            return
        end
    else
        -- 处理上阵 
        for i = 1, 3 do
            if not self.middleLock[i]:isVisible() then
                if self.selectedHeros[i] == 0 then
                    local upIndex = i
                    -- 记录位置选中的英雄
                    self.selectedHeros[upIndex] = mainID
                    -- 中间的英雄头像图片置为可见
                    self.middleHeroIcons[upIndex]:setVisible(true)
                    self.middleHeroIcons[i]:setTexture("ui/Icons/heroIcon/"..self.selectedHeros[upIndex]..".png")
                    local data = HeroProperties.get(mainID)
                    if self.showHeroMusic then
                        AudioMgr.playSound(data.sound_battle,false)
                    end
                    -- 左侧的选中图片置为可见
                    self.scrollSelectedImgs[leftIndex]:setVisible(true)
                    -- 重新计算激活的羁绊
                    self:declGroups()
                    break
                end
            end
        end
    end
    --AudioMgr.playSound(AudioMgr.allUIEffect.Element_battle,false)
end

-- 点击上阵的英雄按钮
function ChooseModePanelTest:clickMiddleHero(i)
    local index = i
    if self.selectedHeros[index] == 0 then
        -- 这个位置上没有英雄
        return
    else
        -- 中间的英雄头像图片置为不可见
        self.middleHeroIcons[index]:setVisible(false)
        --self.middleJibanIcons[index].id = nil
        if index == 1 then
            self.middleJibanIcons[1].id = nil
            self.middleJibanIcons[3].id = nil
        elseif index == 2 then
            self.middleJibanIcons[1].id = nil
            self.middleJibanIcons[2].id = nil
        else
            self.middleJibanIcons[3].id = nil
            self.middleJibanIcons[2].id = nil
        end
        -- 左边的选中图片去掉
        local heroBtnIndex
        for i = 1, 8 do
            if self.selectedHeros[index] == self.heros[i].mainID then
                heroBtnIndex = i
                break
            end
        end
        self.scrollSelectedImgs[heroBtnIndex]:setVisible(false)

        -- 把该位置选中的英雄置空
        self.selectedHeros[index] = 0

        -- 重新计算激活的羁绊
        local lineUp = false
        for k = 1,#self.selectedHeros do
            if self.selectedHeros[k] and self.selectedHeros[k] ~= 0 then
                lineUp = true
                break
            end        
        end
        self:declGroups()
        if index == 3 then
            local finger = self.light_2:getChildByName("finger_2")
            if finger then
                finger:removeFromParent()
            end
        end
    end

end

-- 点击羁绊按钮
function ChooseModePanelTest:clickJibanBtn(i)
    local skill = self.groupOpenSkill[i]
    if skill ~= nil then
        AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
        viewMgr.show(viewMgr.def.TIPS_UI,2,skill)
        local finger = self.light_2:getChildByName("finger_2")
        if finger then
            finger:removeFromParent()
        end
    else
        AudioMgr.playSound(AudioMgr.allUIEffect.Error,false)    
    end
end
-- 点击简单按钮
function ChooseModePanelTest:clickEasyBtn()
    print("ChooseModePanelTest:clickEasyBtn()")
    -- 难度模式，1表示简单，2表示困难
    self.hardMode = MapConstants.DIFFICULTY_MODE_EASY
    self.easySelected:setVisible(true)
    self.hardSelected:setVisible(false)
end

-- 点击困难按钮
function ChooseModePanelTest:clickHardBtn()
    -- 难度模式，1表示简单，2表示困难
    self.hardMode = MapConstants.DIFFICULTY_MODE_HARD
    self.easySelected:setVisible(false)
    self.hardSelected:setVisible(true)
end

-- 点击模式按钮
function ChooseModePanelTest:clickModelBtn(mode)
    -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3
    --self.gameMode = self.mode -- MapConstants.GAME_MODE_ONE  
    for i = 1, 3 do
        if i == mode then
            self.modelSelectedImgs[i]:setVisible(true)
            -- 把对应的模式箭头置为可见
            self.arrowIcons[i]:setVisible(true)
        else
            self.modelSelectedImgs[i]:setVisible(false)
            self.arrowIcons[i]:setVisible(false)
        end
    end
    if mode == 1 then
        self.titleFrame:setVisible(false)
        self.easyBtn:setVisible(true)
        self.hardBtn:setVisible(true)
    else
        self.titleFrame:setVisible(true)
        self.easyBtn:setVisible(false)
        self.hardBtn:setVisible(false)
    end
    local key = utils.getName("text")
    self.txtContent:setString(self.modeMapConfig[mode][key])
    self:setLineUp(mode)
end

-- 点击开始按钮
function ChooseModePanelTest:clickBeginBtn()
    local heros = GlobalData.getHeroInFight()
    local curTowerData = GlobalData.getLvStar(1)
    local heroCount = 3
    for i, v in ipairs(heros) do
        if v == 0 then
            -- 表示上阵数量没到3个
            heroCount = heroCount - 1
        end
    end
    local function beginGame()
        local group = GlobalData.getActiveGroup()

        local mapName
        if self.lv < 10 then
            mapName ="A000"..tostring(self.lv)
        elseif self.lv >= 10 and self.lv < 100 then
            mapName ="A00"..tostring(self.lv)
        else
            mapName ="A0"..tostring(self.lv)
        end

        -- 处理被羁绊修改的技能、Buff、Area
        GlobalData.setChangesData({})

        -- 记录是第几关, 什么模式，什么难度
        GlobalData.setGameLv(self.lv)
        GlobalData.setGameMode(self.gameMode)
        GlobalData.setHardMode(self.hardMode)

        -- 停止背景音乐
        AudioEngine.stopMusic()

        viewMgr.hide(viewMgr.def.CHOOSE_UI)
        display.replaceScene(require("transition.TransitionScene").new({mapId = mapName
            , modeId = self.gameMode, isEnterFight = true}))
    end
    if (curTowerData[1][1] + curTowerData[1][2]) == 0 and self.lv == 1 then
        if heroCount == 0 or (heros[1] and heros[1] ~= "110202") then
            AudioMgr.playSound(AudioMgr.allUIEffect.Error,false)
            local node = self.studioPage["beginLight_2"]
            utils.createAniFont("请选择英雄塔奈尔上阵",node,30,GLOBAL_FONTNAME)
            return
        else
            beginGame()
        end
    else
        beginGame()
    end
end

-- 获得node页面
function ChooseModePanelTest:getPage()
    return self.studioNode
end

-- 设置点击的是第几关
function ChooseModePanelTest:setLv(lv)
    self.lv = lv
    self.studioNode:setVisible(true)

    -- 更新地图的缩略图
    self.smallImg:setTexture("ui/hall/chooseModel/smallMap/s"
        ..tostring(lv)..".jpg")

    local lvStar = GlobalData.getLvStar(lv)

    self.mode1EasyStar = lvStar[1][1]
    self.mode1HardStar = lvStar[1][2]
    local mode2Star = lvStar[2]
    local mode3Star = lvStar[3]
    
    -- 根据每种模式的星星数量，来确定下一关是不是要开放
    -- change by Owen, 2016.7.26 不需要显示引导的时候，直接开放模式2和模式3
    if not NEED_NEW_GUIDE then
        local image = self.modelBtns[2]:getChildByName("imageLock")
        if image then
            image:removeFromParent()
        end
        self.modelBtns[2]:setTouchEnabled(true)
        self.modelBtns[2]:loadTextures("ui/hall/chooseModel/mode_2.png","ui/hall/chooseModel/mode_2.png",nil)

        local image = self.modelBtns[3]:getChildByName("imageLock")
        if image then
            image:removeFromParent()
        end
        self.modelBtns[3]:setTouchEnabled(true)
        self.modelBtns[3]:loadTextures("ui/hall/chooseModel/mode_3.png","ui/hall/chooseModel/mode_3.png",nil)
    else
    
        -- 根据每种模式的星星数量，来确定下一关是不是要开放3
        local allData = GlobalData.getLvStar(6)
        local starCount = allData[1][1]+allData[1][2]
        if starCount > 0 then
          self.guideEnd = true
        end
        if self.mode1EasyStar + self.mode1HardStar > 0 and self.guideEnd then
            local image = self.modelBtns[2]:getChildByName("imageLock")
            if image then
                image:removeFromParent()
            end
            self.modelBtns[2]:setTouchEnabled(true)
            self.modelBtns[2]:loadTextures("ui/hall/chooseModel/mode_2.png","ui/hall/chooseModel/mode_2.png",nil)
        else
            self.modelBtns[2]:setTouchEnabled(false)
            self.modelBtns[3]:setTouchEnabled(false)
            local imageLock_2 = ccui.ImageView:create()
            imageLock_2:setName("imageLock")
            imageLock_2:loadTexture("ui/hall/chooseModel/unOpen.png")
            imageLock_2:setScale(0.9)
            local imageLock_3 = ccui.ImageView:create()
            imageLock_3:setName("imageLock")
            imageLock_3:loadTexture("ui/hall/chooseModel/unOpen.png")
            imageLock_3:setScale(0.9)
            self.modelBtns[2]:loadTextures("ui/hall/chooseModel/mode_2_off.png","ui/hall/chooseModel/mode_2_off.png",nil)
            local size_2 = self.modelBtns[2]:getContentSize()
            imageLock_2:setPosition(cc.p(size_2.width/2+5,size_2.height/2+5))
            self.modelBtns[2]:addChild(imageLock_2)
            self.modelBtns[3]:loadTextures("ui/hall/chooseModel/mode_3_off.png","ui/hall/chooseModel/mode_3_off.png",nil)
            local size_3 = self.modelBtns[3]:getContentSize()
            imageLock_3:setPosition(cc.p(size_3.width/2+5,size_3.height/2+5))
            self.modelBtns[3]:addChild(imageLock_3)
        end
        if mode2Star > 0  and self.guideEnd then
            local image = self.modelBtns[3]:getChildByName("imageLock")
            if image then
                image:removeFromParent()
            end
            self.modelBtns[3]:setTouchEnabled(true)
            self.modelBtns[3]:loadTextures("ui/hall/chooseModel/mode_3.png","ui/hall/chooseModel/mode_3.png",nil)
        else
            local imageLock_3 = ccui.ImageView:create()
            imageLock_3:setName("imageLock")
            imageLock_3:loadTexture("ui/hall/chooseModel/unOpen.png")
            imageLock_3:setScale(0.9)
            self.modelBtns[3]:setTouchEnabled(false)
            self.modelBtns[3]:loadTextures("ui/hall/chooseModel/mode_3_off.png","ui/hall/chooseModel/mode_3_off.png",nil)
            local size_3 = self.modelBtns[3]:getContentSize()
            imageLock_3:setPosition(cc.p(size_3.width/2+5,size_3.height/2+5))
            self.modelBtns[3]:addChild(imageLock_3)
        end
        if self.guideEnd then 
            local curPass = GlobalData.getNewThroughMode(lv)
            if curPass >0 and curPass < 3 then
                local image = self.modelBtns[curPass+1]:getChildByName("imageLock")
                if image then
                    image:removeFromParent()
                end
                local function actBack()
                    GlobalData.setNewThroughMode(lv,0)
                end
                self.modelBtns[curPass+1]:runAction(cc.Sequence:create(cc.FadeOut:create(0.01),cc.FadeIn:create(1),cc.CallFunc:create(actBack)))
            end
        end
    end
    -- 获得地图配置
    local mapName
    if self.lv < 10 then
        mapName ="A000"..tostring(self.lv)
    elseif self.lv >= 10 and self.lv < 100 then
        mapName ="A00"..tostring(self.lv)
    else
        mapName ="A0"..tostring(self.lv)
    end
    self.mapId = mapName

    -- 地图配置
    self.modeMapConfig = {}
    self.modeMapConfig[1] = MapConfig.get(mapName, 1)
    self.modeMapConfig[2] = MapConfig.get(mapName, 4)
    self.modeMapConfig[3] = MapConfig.get(mapName, 5)


    dump(self.modeMapConfig[1], "dump self.modeMapConfig[1]")
    self.txtContent:setString(self.modeMapConfig[1].text)

    -- 把模式1的箭头置为可见
    self.arrowIcons[1]:setVisible(true)
    self.arrowIcons[2]:setVisible(false)
    self.arrowIcons[3]:setVisible(false)

    -- 把简单和困难按钮置为可见, 并默认选中模式1简单难度
    self.easyBtn:setVisible(true)
    self.hardBtn:setVisible(true)
    self:clickEasyBtn()
    self:clickModelBtn(1)

    -- CCLabelAtlas通过png文件作为资源创建文本，参数:显示内容，图片、单个数字宽度、  
    -- 高度、图片中第一个字符的ASCII码，如字符为"."，可以传入46或者'.'都可以。  
    if self.passID then
        self.passID:setString(lv)
    end
    for i= 1,3 do 
        if (i ~= 1) then
            self.modelSelectedImgs[i]:setVisible(false)
        else
            self.modelSelectedImgs[i]:setVisible(true)
        end
    end
    local mode = self.chooseMode or 1
end


-- 重新计算激活的羁绊
function ChooseModePanelTest:declGroups()
    
    -- 羁绊图标都置为不可见
    for i = 1, 3 do
        self.middleJibanIcons[i]:setVisible(false)
        self.middleJibanBtns[i]:setTouchEnabled(false)
    end

    -- 根据上阵英雄，计算那几个羁绊被激活了
    local hero1 = self.selectedHeros[1]
    local hero2 = self.selectedHeros[2]
    local hero3 = self.selectedHeros[3]
    local groups = GroupProperties.getAll()
    local conditions = {}
    local groupIDs   = {}    -- 所有激活的羁绊
    local groupID
    for i,v in pairs(groups) do
        conditions = v.activateHero
        groupID = v.mainID
        if conditions[1] == hero1 or conditions[1] == hero2 or conditions[1] == hero3 then
            if conditions[2] == hero1 or conditions[2] == hero2 or conditions[2] == hero3 then
                groupIDs[#groupIDs + 1] = groupID
              
                -- groupID 这个羁绊被激活了，需要把对应的羁绊图标给点亮
                local group = GroupProperties.get(groupID)
                local heros = group.activateHero
                -- 1/2之间的羁绊图标
                if group[tostring(hero1)] and group[tostring(hero2)] then -- hero1 ~= 0 and hero2 ~= 0 then
                    if group[tostring(hero1)] then
                        self.middleJibanIcons[1]:setVisible(true)
                        self.middleJibanBtns[1]:setTouchEnabled(true)
                        print("self.groupOpenImgs[1]:setVisible(true)")
                        self.middleJibanIcons[1]:setTexture("ui/Icons/groupIcon/"..
                            group[tostring(hero1)].icon..".png")
                        self.groupOpenSkill[1] = group
                        if self.middleJibanIcons[1].id then
                            if  self.middleJibanIcons[1].id~= groupID then
                                self:playEffect(self.middleJibanIcons[1],1)
                                self.middleJibanIcons[1].id = groupID
                            end
                        else
                            self:playEffect(self.middleJibanIcons[1],1)
                            self.middleJibanIcons[1].id = groupID
                        end
                    else
                        self.groupOpenSkill[1] = nil
                        self.middleJibanIcons[1].id = nil
                    end
                end
                -- 2/3之间的羁绊图标
                if group[tostring(hero2)] and group[tostring(hero3)] then -- hero2 ~= 0 and hero3 ~= 0 then
                    if group[tostring(hero2)] then
                        print("test 4 group.mainID = "..tostring(group.mainID))
                        self.middleJibanIcons[2]:setVisible(true)
                        self.middleJibanBtns[2]:setTouchEnabled(true)
                        self.middleJibanIcons[2]:setTexture("ui/Icons/groupIcon/"..
                            group[tostring(hero2)].icon..".png")
                        self.groupOpenSkill[2] = group
                        if self.middleJibanIcons[2].id then
                            if  self.middleJibanIcons[2].id~= groupID then
                                self:playEffect(self.middleJibanIcons[2],2)
                                self.middleJibanIcons[2].id = groupID
                            end
                        else
                            self:playEffect(self.middleJibanIcons[2],2)
                            self.middleJibanIcons[2].id = groupID
                        end
                    else
                        self.groupOpenSkill[2] = nil
                        self.middleJibanIcons[2].id = nil
                    end
                end
                -- 1/3之间的羁绊图标
                if group[tostring(hero1)] and group[tostring(hero3)] then -- hero1 ~= 0 and hero3 ~= 0 then
                    if group[tostring(hero1)] then
                        self.middleJibanIcons[3]:setVisible(true)
                        self.middleJibanBtns[3]:setTouchEnabled(true)
                        self.middleJibanIcons[3]:setTexture("ui/Icons/groupIcon/"..
                            group[tostring(hero1)].icon..".png")
                        self.groupOpenSkill[3] = group
                        if self.middleJibanIcons[3].id then
                            if  self.middleJibanIcons[3].id~= groupID then
                                self:playEffect(self.middleJibanIcons[3],3)
                                self.middleJibanIcons[3].id = groupID
                            end
                        else
                            self:playEffect(self.middleJibanIcons[3],3)
                            self.middleJibanIcons[3].id = groupID
                        end
                    else
                        self.groupOpenSkill[3] = nil
                        self.middleJibanIcons[3].id = nil
                    end
                end
            end
        end
    end
    GlobalData.setActiveGroup(groupIDs)

    -- 设置上阵的英雄
    GlobalData.setHeroInFight(self.selectedHeros)


end
--一个表中是否存在某个值
function ChooseModePanelTest:isExist(val,tab)
     for key,value in pairs(tab) do
        if val == value then
            return true
        end
     end
     return false
end
function ChooseModePanelTest:setLineUp(mode)
      local isHard = nil
      if self.hardMode == MapConstants.DIFFICULTY_MODE_HARD then
          isHard = true
      end   
      self:getAllStar(self.lv,mode,isHard)
      --未获得的英雄显示flag
      for key,value in pairs(self.heros) do
          local id = value.mainID
          local btnName = string.format("btn_%s",id)
          local btn = self.studioPage[btnName]
          if btn:getChildByName("limitFlag") then
              btn:getChildByName("limitFlag"):setVisible(false)
          end
          btn:setTouchEnabled(true)
          local active = GlobalData.getHeroActive(id)
          local limitNum = GlobalData.getTimeHeroNum(id)
          local node = self.heroIcon[key]:getChildByName("NumImage")
          if active then
              if node then
                 node:removeFromParent()
              end
              self.leftLock[key]:setVisible(false)
              local path = string.format("ui/Icons/heroIcon/%s.png",id)
              self.heroIcon[key]:loadTexture(path)
          else
              if limitNum and limitNum > 0 then
                 self.leftLock[key]:setVisible(false)
                 local path = string.format("ui/Icons/heroIcon/%s.png",id)
                 self.heroIcon[key]:loadTexture(path)

                 local size = self.heroIcon[key]:getContentSize()
                 local scale = self.heroIcon[key]:getScale()
                 local NumImage = ccui.ImageView:create("ui/hall/chooseModel/heroNum.png")
                 NumImage:setScale(1/scale)
                 NumImage:setPosition(cc.p(size.width/2,5))
                 NumImage:setName("NumImage")
                 local num = GlobalData.getTimeHeroNum(id)
                 local str = string.format("体验次:%d",num)
                 local text = ccui.Text:create(str,GLOBAL_FONTNAME,16)
                 text:enableOutline(cc.c4b(0,0,0,255),2)
                 local textSize = text:getContentSize()
                 text:setPosition(cc.p(textSize.width/2+17,textSize.height/2+3))
                 NumImage:addChild(text)
                 self.heroIcon[key]:addChild(NumImage)
              else
                  if node then
                     node:removeFromParent()
                  end
                  local path = string.format("ui/Icons/heroIcon/%shui.png",id)
                  self.heroIcon[key]:loadTexture(path)
                  self.leftLock[key]:setVisible(true)
                  local node = self.heroIcon[key]:getChildByName("NumImage")
                  if node then
                      node:removeFromParent()
                  end
              end 
          end
      end
      for key,value in pairs(self.scrollHeroBtns) do
          value:setTouchEnabled(true)
      end
      --模式二三有可能限制英雄上阵
      self.middleLock[1]:setVisible(false)
      self.middleLock[2]:setVisible(false)
      self.middleLock[3]:setVisible(false)

      local activeHero = GlobalData.getCurActiveHero()
      
      local limitData = self.modeMapConfig[mode].heroLimit
      if limitData ~= nil then
          local limitHero = limitData.cantUp
          local countHero = limitData.count
          if countHero > 0 then
              if countHero == 1 then
                  self:clickMiddleHero(2)
                  self:clickMiddleHero(3)
                  self.middleLock[2]:setVisible(true)
                  self.middleLock[3]:setVisible(true)
              elseif countHero == 2 then
                  self:clickMiddleHero(1)
                  self.middleLock[1]:setVisible(true)
              else
                  self.middleLock[1]:setVisible(false)
                  self.middleLock[2]:setVisible(false)
                  self.middleLock[3]:setVisible(false)
              end
              for key,value in pairs(self.selectedHeros) do
                  for k,v in pairs(limitHero) do
                      if v == value then
                          self:clickMiddleHero(key)
                      end
                   end
              end
          else
               self.middleLock[1]:setVisible(true)
               self.middleLock[2]:setVisible(true)
               self.middleLock[3]:setVisible(true)
               for key,value in pairs(self.selectedHeros) do
                   self:clickMiddleHero(key)
               end
               for key,value in pairs(self.heros) do
                   local id  = value.mainID
                   local btnName = string.format("btn_%s",id)
                   local btn = self.studioPage[btnName]
                   local lockName = string.format("lock_%s",id)
                   local lock = self.studioPage[lockName]
                   --限制英雄上阵时 锁定角标不同 待资源上传做判定 英雄激活后和英雄没激活两种情况
                   lock:setVisible(true)    
               end           
          end
          for key,value in pairs(limitHero) do
             if self:isExist(value,activeHero) then
                 local btnName = string.format("btn_%s",value)
                 local btn = self.studioPage[btnName]
                 if btn:getChildByName("limitFlag") then
                     btn:getChildByName("limitFlag"):setVisible(true)
                 end
                 btn:setTouchEnabled(false)
             end
         end   
      else
      end
      local allData = GlobalData.getLvStar(6)
      local starCount = allData[1][1]+allData[1][2]
      if GLOBAL_PUBLISH then
        if mode == 1 and starCount <= 0 then
              for key,value in pairs(self.selectedHeros) do
                 if not GlobalData.getHeroActive(value) then
                     self:clickMiddleHero(key)
                 end
              end
              local passData = self.modeMapConfig[mode]
              local needPond = false
              if passData.id == "A0001-1" then
                 if activeHero[2] == nil then
                    needPond = true
                 end
                 self:clickMiddleHero(1)
                 self:clickMiddleHero(2)
                 self:clickMiddleHero(3)
                 self.middleLock[1]:setVisible(false)
                 self.middleLock[2]:setVisible(true)
                 self.middleLock[3]:setVisible(true)
                 self:clickScrollHero(activeHero[1],1,needPond)
              elseif passData.id == "A0002-1" then
                 if activeHero[3] == nil then
                    needPond = true
                 end
                 self:clickMiddleHero(1)
                 self:clickMiddleHero(2)
                 self:clickMiddleHero(3)
                 self.middleLock[1]:setVisible(true)
                 self.middleLock[2]:setVisible(false)
                 self.middleLock[3]:setVisible(false)
                 self:clickScrollHero(activeHero[1],1,needPond)
                 self:clickScrollHero(activeHero[2],2,needPond)
              elseif passData.id == "A0003-1" then
                 self:clickMiddleHero(1)
                 self:clickMiddleHero(2)
                 self:clickMiddleHero(3)
                 self.middleLock[1]:setVisible(false)
                 self.middleLock[2]:setVisible(false)
                 self.middleLock[3]:setVisible(false)
                 self:clickScrollHero(activeHero[1],1)
                 self:clickScrollHero(activeHero[2],2)
                 self:clickScrollHero(activeHero[3],3)
              else
                 self.middleLock[1]:setVisible(false)
                 self.middleLock[2]:setVisible(false)
                 self.middleLock[3]:setVisible(false)
              end
         end   
      end 
      local towData = GlobalData.getLvStar(2)
      local towModeData = towData[1][1] + towData[1][2]
      local threeData = GlobalData.getLvStar(3)
      local threeModeData = threeData[1][1] + threeData[1][2]
      local fourData = GlobalData.getLvStar(4)
      local fourModeData = fourData[1][1] + fourData[1][2]
      local fiveData = GlobalData.getLvStar(5)
      local fiveModeData = fiveData[1][1] + fiveData[1][2]
      if towModeData <= 0 and self.lv == 2 and not GlobalData.getOpenLv2GuideHasShow() then
            -- 显示第二关获得新英雄引导
            self:newGuide()
      end  
      if threeModeData <= 0 and self.lv == 3 and GlobalData.getNewThroughLv() == 2 then
            -- change by Owen, 2016.7.24, 显示第三关 “恭喜解锁新英雄” 页面
            -- 新通关了第二关的时候，才需要显示获得第三个英雄的页面
            self:showUnlockNewHero("110201")

            -- 显示了第3关的获得英雄奖励页面以后，要把新通关了第2关数据置为0
            GlobalData.setNewThroughLv(0)
      end
      if not self.showHeroMusic then
          self.showHeroMusic = true
      end
      local oneData = GlobalData.getLvStar(1)
      local oneModeData = oneData[1][1] + oneData[1][2]
      if oneModeData <= 0 or (fourModeData > 0 and fiveModeData <= 0) then
         self:newGuide_1(fourModeData,fiveModeData)
      else  
         local finger = self.beginBtn:getChildByName("finger_1")
         if finger then
            finger:removeFromParent(true)
         end
      end
end
return ChooseModePanelTest