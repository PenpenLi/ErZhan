
local Tips = class("ui.Tips")
local GlobalData =  require("tools.GlobalData")
--type == 1 技能界面
--type == 2 羁绊界面
function Tips:ctor(self,type,data,heroId)
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function ()
                if node:getName() == "closeBtn" then
                    viewMgr.hide(viewMgr.def.TIPS_UI)
                    AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                    return
                end
                if node:getName() == "Image_1" then
                    viewMgr.hide(viewMgr.def.TIPS_UI)
                    AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                    return
                end     
            end         
        end      
    end
    local result = import("ui.TipsStudio").create(clickBack)
    self.page = result.root
    self.Frame = result.Image_1
    self.Frame:setTouchEnabled(true)

    self.flag = result.flag_1
    utils.playAction(self.page,self.Frame,true)
    self.bgImage = result.Image_bg
    --self.bgImage:setContentSize(cc.size(529,322))
    self.Panel_Content = result.Panel_Content
    self.Panel_yoke    = result.Panel_yoke
    self.closeBtn = result.closeBtn
    self.Panel_Name = result.Panel_Name
    self.skillName = result.skillName
    self.skillName:setFontName(GLOBAL_FONTNAME)
    if GlobalData.getLanguage() == "EN" then
        self.skillName:ignoreContentAdaptWithSize(false)
        self.skillName:enableOutline(cc.c4b(0,0,0,255),1)
        self.skillName:setContentSize(cc.size(170,60))
        self.skillName:setFontSize(22)
        self.skillName:setPositionY(self.skillName:getPositionY()+5)
    else
        self.skillName:enableOutline(cc.c4b(0,0,0,255),2)
    end
    self.skillWay  = result.skillWay
    self.skillWay:setFontName(GLOBAL_FONTNAME)
    self.skillWay:enableOutline(cc.c4b(0,0,0,255),2)
    if type == 1 then
        self:skillShow(result,data)
    elseif type == 2 then
        self:yokeShow(result,data,heroId)
    end
end

-- 显示英雄技能按钮
function Tips:skillShow(result,data)
    
    self.Panel_Content:setVisible(true)
    self.Panel_yoke:setVisible(false)
    local key = utils.getName("name")
    self.skillName:setString(data[key])
    self.richText = ccui.RichText:create()
    self.richText:setOutLine(cc.c4b(0,0,0,255),2)
    self.richText:setContentSize(cc.size(420,90))
    self.richText:ignoreContentAdaptWithSize(false)
    self.richText:setPosition(cc.p(-5,10))
    self.page:addChild(self.richText)
    local key = utils.getName("typeText")
    self.skillWay:setString(data[key])
    local key = utils.getName("skillText")
    local text = string.split(data[key],"$")
    local re1 = nil
    for i = 1,#text do
        if i % 2 == 0 then
            re1 = ccui.RichElementText:create(i, cc.c3b(188, 231, 53), 255,text[i],GLOBAL_FONTNAME,20)
        else
            re1 = ccui.RichElementText:create(i, cc.c3b(255, 255, 255), 255,text[i],GLOBAL_FONTNAME,20)
        end
        self.richText:pushBackElement(re1)
    end

    local panel_cd = result.Panel_CD
    local time      = result.time
    time:setFontName(GLOBAL_FONTNAME)
    time:enableOutline(cc.c4b(0,0,0,255),2)
    
    local time_1    = result.time_1
    time_1:setFontName(GLOBAL_FONTNAME)
    time_1:enableOutline(cc.c4b(0,0,0,255),2)
    local str = WordLanguage.cooling
    time_1:setString(str)
    local time_2    = result.time_2
    time_2:setFontName(GLOBAL_FONTNAME)
    time_2:enableOutline(cc.c4b(0,0,0,255),2)
    local str = WordLanguage.second
    time_2:setString(str)

    if GlobalData.getLanguage() == "EN" then
        local size = time_1:getContentSize()
        time_1:setPositionX(time_1:getPositionX()-10)
        --time:setPositionX(time:getPositionX()+10)
        time_2:setPositionX(time_2:getPositionX()+20)
    end
    local posX,posY = time_1:getPosition()
    if data.skillCD then
        time_1:setPositionX(posX)
        time_2:setVisible(true)
        time:setString(data.skillCD/1000)
    else
        if GlobalData.getLanguage() == "CN" then
            time_1:setPositionX(posX-10)
        else
            time:setPositionX(time:getPositionX()+30)
        end
        local str = WordLanguage.forever
        time:setString(str)
        time_2:setVisible(false)
    end

    local weatherFrame = result.weather_frame
    local weather = result.weather
    weather:setVisible(false)
    local x,y = weather:getPosition()
    local key = utils.getName("weatherAddition")
    if data[key] ~=nil and data[key] ~= "" then
        local rich = ccui.RichText:create()
        if GlobalData.getLanguage() == "CN" then
            rich:setOutLine(cc.c4b(0,0,0,255),2)
        else
            rich:setOutLine(cc.c4b(0,0,0,255),1)
        end       
        rich:setContentSize(cc.size(350,18))
        rich:ignoreContentAdaptWithSize(false)
        rich:setPosition(cc.p(x+40,y+3))
        weatherFrame:addChild(rich)
        
        local text = string.split(data[key],"$")
        local re1 = nil
        for i = 1,#text do
            if i % 2 == 0 then
                re1 = ccui.RichElementText:create(i,cc.c3b(188,231,53), 255,text[i],GLOBAL_FONTNAME,18)
            else
                re1 = ccui.RichElementText:create(i,cc.c3b(255,0,0), 255,text[i],GLOBAL_FONTNAME,18)
            end
            rich:pushBackElement(re1)
        end
    else
        weatherFrame:setVisible(false)
    end
end

-- 显示羁绊
function Tips:yokeShow(result,data,heroId)
    
    --羁绊是否激活
    local allSkills = GlobalData.getActiveGroup()
    --local color = {gl.GL_DST_COLOR,gl.GL_ONE}
    local active = false
    for key,value in pairs(allSkills) do
        if data.mainID == value then
            active = true
            break
        end
    end
    local str = nil
    if not active then
        EnableGraySprite(self.flag)
        str = WordLanguage.noActive
        self.skillWay:setTextColor(cc.c4b(96,96,96,255))
        self.skillName:setTextColor(cc.c4b(96,96,96,255))
        self.skillWay:setString(str)
    else
        str = WordLanguage.active
        self.skillWay:setString(str)
    end
    local re1 = nil
    self.Panel_Content:setVisible(false)
    self.Panel_yoke:setVisible(true)
    local key = utils.getName("groupName")
    self.skillName:setString(data[key])
    local Data = nil
    --local Data = data.activateHero
    if heroId then
        local tempData = {}
        for i = 1,2 do
            local hero = data.activateHero[i]
            if heroId == hero then
                tempData[1] = hero
            else
                tempData[2] = hero
            end
        end
        Data = tempData
    else
        Data = data.activateHero
    end
    local icon_1 = result.icon_1
    local path = string.format("ui/Icons/heroIcon/%s.png",Data[1])
    icon_1:loadTexture(path)
    local icon_2 = result.icon_2
    path = string.format("ui/Icons/heroIcon/%s.png",Data[2])
    icon_2:loadTexture(path)

    local name_1 = result.name_1
    path = string.format("ui/common/name_%s.png",Data[1])
    name_1:loadTexture(path)
    local name_2 = result.name_2
    path = string.format("ui/common/name_%s.png",Data[2])
    name_2:loadTexture(path)

    -- 第一个羁绊技能的描述文本
    local skilldes_1 = result.skilldes_1
    local key = utils.getName("name")
    local text1 = string.split(data[Data[1]][key],"$")
    skilldes_1:ignoreContentAdaptWithSize(false)
    local size1 = skilldes_1:getContentSize()

    local richText_1 = ccui.RichText:create()
    richText_1:setOutLine(cc.c4b(0,0,0,255),2)
    richText_1:setContentSize(cc.size(size1.width,size1.height))
    richText_1:ignoreContentAdaptWithSize(false)
    richText_1:setPosition(cc.p(size1.width/2,size1.height/2))
    skilldes_1:addChild(richText_1)
    for i = 1,#text1 do
        if i % 2 == 0 then
            re1 = ccui.RichElementText:create(i, cc.c3b(12, 214, 17), 255,text1[i],GLOBAL_FONTNAME,18)
        else
            re1 = ccui.RichElementText:create(i, cc.c3b(255, 255, 255), 255,text1[i],GLOBAL_FONTNAME,18)
        end
        richText_1:pushBackElement(re1)
    end
    skilldes_1:setString("")
    skilldes_1:setFontName(GLOBAL_FONTNAME)
    skilldes_1:enableOutline(cc.c4b(0,0,0,255),1)
    local skilldes_2 = result.skilldes_2
    local key = utils.getName("name")
    local text2 = string.split(data[Data[2]][key],"$")
    skilldes_2:ignoreContentAdaptWithSize(false)
    local size2 = skilldes_2:getContentSize()
    
    skilldes_2:setFontName(GLOBAL_FONTNAME)
    skilldes_2:enableOutline(cc.c4b(0,0,0,255),1)
    local richText_2 = ccui.RichText:create()
    richText_2:setOutLine(cc.c4b(0,0,0,255),2)
    richText_2:setContentSize(cc.size(size2.width,size2.height))
    richText_2:ignoreContentAdaptWithSize(false)
    richText_2:setPosition(cc.p(size2.width/2,size2.height/2))
    skilldes_2:addChild(richText_2)
    for i = 1,#text2 do
        if i % 2 == 0 then
            re1 = ccui.RichElementText:create(i, cc.c3b(12, 214, 17), 255,text2[i],GLOBAL_FONTNAME,18)
        else
            re1 = ccui.RichElementText:create(i, cc.c3b(255, 255, 255), 255,text2[i],GLOBAL_FONTNAME,18)
        end
        richText_2:pushBackElement(re1)
    end
    skilldes_2:setString("")
end
function Tips:getPage()
     return self.page
end
return Tips

