--region NewFile_1.lua
--Author : wanggangdan
--Date   : 2016/4/6
local GlobalData             = require("tools.GlobalData")
local AchieveUI = class("ui.AchieveUI.lua")
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local achieveData = nil
if device.platform == "windows" and GLOBAL_SHOW_WIN_TYPE then
    achieveData= require("app.properties.AchievementsProperties_PC")
else
    achieveData= require("app.properties.AchievementsProperties")
end
local globalData = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
function AchieveUI:ctor()
    
    self.isRefrush = true
    local clickBack = function(luaFileName,node,callbackName)
        return function()
                if callbackName == "clickEvent" then
                    if node:getName() == "btn_close" then
                        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                        viewMgr.hide(viewMgr.def.ACHIEVE_UI)
                        return
                    end
                    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
                    if node:getName() == "btn_Left" then
                        local pageNumber = tonumber(self.pageNum_2:getString())
                        if pageNumber > 1 then
                            self.isRefrush = false
                            self.pageNum_2:setString(pageNumber - 1)
                            self:refrushData()
                        end
                    end
                    if node:getName() == "btn_Right" then
                        local pageNumber = tonumber(self.pageNum_2:getString())
                        if pageNumber < self.pageCount then
                            self.isRefrush = false
                            self.pageNum_2:setString(pageNumber + 1)
                            self:refrushData()
                        end
                    end
                    if self.pageNum_2 then
                        local pageNumber = tonumber(self.pageNum_2:getString())
                        if pageNumber<= 1 then
                            self.btn_Left:setVisible(false)
                        else
                            self.btn_Left:setVisible(true)
                        end
                        if pageNumber >= self.pageCount then
                            self.btn_Right:setVisible(false)
                        else
                            self.btn_Right:setVisible(true)
                        end
                    end
                end
             end  
    end
    local reslut = import("ui.AchieveStudio.lua").create(clickBack)
    self.page = reslut.root
    self.bg2 = reslut.bg_2
    self.bg = reslut.bg
    local title = reslut.title
    local path = "ui/achieve/"..utils.getName("title","png")
    title:loadTexture(path)
    local bgFrame = reslut.bgFrame
    utils.playAction(self.page,bgFrame,true)
    self.pageNum_1 = reslut.pageNum_1
    self.pageNum_2 = reslut.pageNum_2
    self.pageNum_2:setString(1)

    self.btn_Left  = reslut.btn_Left
    self.btn_Right = reslut.btn_Right
    --第一页所有的icon
    self.icons    = {}
    --第一页所有的简介
    self.infos    = {}
    --第一页所有的金币数量label
    self.texts    = {}
    --第一页所有领奖btn
    self.awardBtn = {}
    --第一页所有已领讲角标
    self.flags    = {}
    --钻石图
    self.diamonds ={}
    --彩字
    self.colorFonts = {}

    for i = 1,8 do
        local iconName       = string.format("img_%d",i)
        local infoName       = string.format("info_%d",i)
        local awardBtnName   = string.format("getAward_%d",i)
        local flagName       = string.format("already_%d",i)
        local textName       = string.format("awardText_%d",i)
        local diamondName    = string.format("diamond_Image_%d",i)
        local fontName       = string.format("award_%d",i)

        self.icons[i] = reslut[iconName]
        self.infos[i] = reslut[infoName]     
        self.awardBtn[i] = reslut[awardBtnName]   
        local font = reslut[fontName]
        local path = "ui/achieve/"..utils.getName("award","png")
        font:setTexture(path)
        local size = self.awardBtn[i]:getContentSize()
        local node = self.awardBtn[i]:getParent()
        local content = WordLanguage.get
        local text = ccui.Text:create(content,GLOBAL_FONTNAME,24)
        text:enableOutline(cc.c4b(0,0,0,255),2)
        text:setPosition(cc.p(size.width/2,size.height/2))
        self.awardBtn[i]:addChild(text)  
        local posx,posy = self.awardBtn[i]:getPosition()
        self.flags[i] = reslut[flagName]
        path = "ui/achieve/"..utils.getName("already","png")
        self.flags[i]:setTexture(path)
        self.flags[i]:setPosition(cc.p(posx,posy))
        self.texts[i] = reslut[textName]

        self.texts[i]:setFontName(GLOBAL_FONTNAME)
        self.texts[i]:setTextColor(cc.c4b(246,255,0,255))
        self.texts[i]:enableOutline(cc.c4b(36,6,6,255),2)

        self.texts[i].x = self.texts[i]:getPositionX()
        self.texts[i].y = self.texts[i]:getPositionY()

        self.infos[i]:setFontName(GLOBAL_FONTNAME)
        self.infos[i]:setContentSize(cc.size(160,50))
        self.infos[i]:ignoreContentAdaptWithSize(false)

        self.diamonds[i] = reslut[diamondName]
        self.diamonds[i].x = self.diamonds[i]:getPositionX()
        self.diamonds[i].y = self.diamonds[i]:getPositionY()
        self.colorFonts[i] = reslut[fontName]
    end
    self.effAniData   = require("app.properties.EffectProperties")
    local language = GlobalData.getLanguage()
    if language == "CN" then
        EffectAniCache.addEffectAniCache("eff_yiwancheng",self.effAniData.eff_yiwancheng)
    else  
        EffectAniCache.addEffectAniCache("eff_yilingqu_2",self.effAniData.eff_yilingqu_2)  
    end
    for key,value in pairs(self.awardBtn) do
        local function btnBack(sender)
            sender:setVisible(false)
            if globalData.getAchieve(sender.id) == 1 then
                if sender.id then
                    local function aniBack()                 
                        self.flags[key]:setVisible(true)
                    end
                    local x,y = sender:getPosition()
                    local effect,offsetY,offsetX = nil
                    local language = GlobalData.getLanguage()
                    if language == "CN" then
                        effect,offsetY,offsetX = EffectAniCache.getEffectAniCache("eff_yiwancheng",false,aniBack)
                        effect:setPosition(cc.p(x-0.5,y))
                    else  
                        effect,offsetY,offsetX = EffectAniCache.getEffectAniCache("eff_yilingqu_2",false,aniBack)  
                        effect:setPosition(cc.p(x+0.5,y-0.5))
                    end
                    globalData.setAchieve(sender.id,2)
                    local money = achieveData.get(sender.id).award.diamond
                    if money > 0 then
                        globalData.addDiamondCount(money)
                        umengSdk.bonus(tostring(money),umengSdk.bonusType.ach)
                    end
                    local heroID = achieveData.get(sender.id).award.hero
                    if heroID then
                        if not globalData.getHeroActive(heroID) then
                            globalData.setCurActiveHero(heroID)
                        end
                    end
                    sender.id = nil
                    NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)   
                    effect:setRotation(30)
                    local node = sender:getParent()
                    node:addChild(effect) 
                    NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL)              
                end
            end
        end 
        value:addClickEventListener(btnBack)               
    end
    self:refrushData()
    --self.pageCount
    local pageNumber = tonumber(self.pageNum_2:getString())
    if pageNumber<= 1 then
        self.btn_Left:setVisible(false)
    end
    if pageNumber >= self.pageCount then
        self.btn_Right:setVisible(false)
    end
end
function AchieveUI:refrushData()
    if self.isRefrush then
        self:refrush()
    end
    local pageNumber = tonumber(self.pageNum_2:getString())
    local posX = (pageNumber*14)-self.pageSize.width/2 + 42 + (pageNumber-1)*1.8
    self.pageNum_2:setPositionX(posX)
    for i = 1,8 do
        local index = (pageNumber - 1) * 8 + i
        local data = self.allData[index]
        if data then
            self.icons[i]:setVisible(true)
            self.infos[i]:setVisible(true)
            self.texts[i]:setVisible(true)
            self.colorFonts[i]:setVisible(true)
            self.awardBtn[i]:setVisible(false)
            self.awardBtn[i].id = data.mainID
            self.flags[i]:setVisible(false)
            local flag = globalData.getAchieve(data.mainID)
            if flag == 0 then
                --self.infos[i]:enableOutline(cc.c4b(36,6,6,255),2)
                --self.infos[i]:setTextColor(cc.c4b(255,255,255,255))
            elseif flag == 1 then
                --self.infos[i]:disableEffect()
                --self.infos[i]:setTextColor(cc.c4b(36,6,6,255))
                self.awardBtn[i]:setVisible(true)
            else
                --self.infos[i]:disableEffect()
                --self.infos[i]:setTextColor(cc.c4b(36,6,6,255))
                self.flags[i]:setVisible(true)
            end
            self.infos[i]:setTextColor(cc.c4b(36,6,6,255))
            self.icons[i]:loadTexture(string.format("ui/Icons/achieveIcon/%s.png",data.mainID))
            self.icons[i]:setContentSize(cc.size(100,100))
            local key = utils.getName("name")
            self.infos[i]:setString(data[key])
            --if data.award.diamond > 0 then
                self.diamonds[i]:setVisible(true)
                self.diamonds[i]:setTexture("ui/achieve/diamond.png")
                self.diamonds[i]:setScale(1)
                self.diamonds[i]:setPosition(cc.p(self.diamonds[i].x,self.diamonds[i].y))
                self.texts[i]:setVisible(true)
                self.texts[i]:setPosition(cc.p(self.texts[i].x,self.texts[i].y))
                self.texts[i]:setString(data.award.diamond)
            if data.award.hero then
                self.diamonds[i]:setVisible(true)
                local hero = HeroProperties.get(data.award.hero)
                local key = utils.getName("name")
                self.texts[i]:setVisible(true)
                self.texts[i]:setString(WordLanguage.hero)
                self.texts[i]:setPosition(cc.p(self.texts[i].x+10,self.texts[i].y))
                local size = self.texts[i]:getContentSize()
                local path = string.format("ui/Icons/heroIcon/%s.png",data.award.hero)
                self.diamonds[i]:setTexture(path)
                self.diamonds[i]:setScale(0.3)
                self.diamonds[i]:setPosition(cc.p(self.diamonds[i].x+size.width/2,self.diamonds[i].y+3))
            end
            if data.award.diamond == 0 and data.award.hero == nil then
                self.texts[i]:setVisible(false)
                self.diamonds[i]:setVisible(false)
                self.colorFonts[i]:setVisible(false)
            end
        else
            self.icons[i]:setVisible(false)
            self.infos[i]:setVisible(false)
            self.texts[i]:setVisible(false)
            self.diamonds[i]:setVisible(false)
            self.colorFonts[i]:setVisible(false)
            self.awardBtn[i]:setVisible(false)
            self.awardBtn.id = nil
            self.flags[i]:setVisible(false)
        end
    end 
end
function AchieveUI:refrush()
    --id排序
    self.allData = {}
    local tempData = {}
    for key,value in pairs(achieveData.getAll()) do
        table.insert(tempData,value)
    end
    table.sort(tempData,function(first,second)
             return tonumber(first.mainID) < tonumber(second.mainID)
    end)
    if #tempData > 0 then
        for i = 1,#tempData do
            if globalData.getAchieve(tempData[i].mainID) == 1 then
                table.insert(self.allData,tempData[i])
            end
        end
    end
    if #tempData > 0 then
        for i = 1,#tempData do
            if globalData.getAchieve(tempData[i].mainID) ~= 1 then
                table.insert(self.allData,tempData[i])
            end
        end
    end
    local pageNum = 0
    self.pageCount = math.ceil(#self.allData/8)
    for i = 1,self.pageCount do
        pageNum = pageNum * 10 + i
    end
    self.pageNum_1:setString(pageNum)
    self.pageSize = self.pageNum_1:getContentSize()
end
function AchieveUI:getPage()
    return self.page
end
return AchieveUI