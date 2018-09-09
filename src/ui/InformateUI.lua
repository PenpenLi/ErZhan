--region NewFile_1.lua
--Author : wanggangdan
--Date   : 2016/4/7
local InformateUI = class("ui.InformateUI.lua")
local globalData  = require("tools.GlobalData")
local groupData   = require("app.properties.GroupProperties")
function InformateUI:ctor()
     local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function ()
                if node:getName() == "closeBtn" then
                    AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                    viewMgr.hide(viewMgr.def.INFORMATE_UI)
                end  
            end         
        end      
     end
     local result = import("ui.InformateStudio.lua").create(clickBack)
     self.page = result.root
     local panal = result.panal
     panal:setOpacity(0)
     utils.playAction(self.page,panal,true)
     self.scrollView = result.scrollView
     local title = result.title
     local language = globalData.getLanguage()
     if language == "EN" then
         title:setTexture("ui/informate/title_EN.png")
     end
     local topFrame = result.topFrame
     self.size = self.scrollView:getContentSize()
     self.width = self.size.width/9
     self.height = self.size.height*2/8
     --保存英雄id
     self.data = globalData.getHeroOrder()
     --激活的技能
     self.groupSkill = {}
     local curActiveSkill = globalData.getActiveGroup()
     for i = 1,#curActiveSkill do
        self.groupSkill[i] = groupData.get(curActiveSkill[i])
     end
     --第一列
     local activeCount  = 0
     local activeHeros = globalData.getHeroInFight()
     self.saveLineData = clone(activeHeros)
     for i = #self.saveLineData,1,-1 do
        if self.saveLineData[i] == 0 then
            table.remove(self.saveLineData,i)
        else
            activeCount = activeCount + 1
        end
     end
     --第一行
     for i = 1,8 do
        local image = ccui.ImageView:create()
        if self:isExist(self.data[i],activeHeros) then
            image:loadTexture(string.format("ui/Icons/heroIcon/%s.png",self.data[i]))
        else
            image:loadTexture(string.format("ui/Icons/heroIcon/%shui.png",self.data[i]))
        end
        image:setScale(0.8)
        local imageSize = image:getContentSize()
        image:setPosition(cc.p((i+1)*self.width-imageSize.width/2-(i-1)*5+13,imageSize.height/2+5))
        topFrame:addChild(image)        
     end
     for i = 1,8 do
        if not self:isExist(self.data[i],self.saveLineData) then
            table.insert(self.saveLineData,self.data[i])
        end
     end
     for i = 1,8 do 
        local image = ccui.ImageView:create()
        image:loadTexture(string.format("ui/Icons/heroIcon/%s.png",self.saveLineData[i]))
        image:setScale(0.85)
        local imageSize = image:getContentSize()
        image:setPosition(cc.p(imageSize.width/2+21,self.size.height*2-i*(self.height-11)+imageSize.height/2-10))

        local frame = ccui.ImageView:create("ui/informate/IconFrame.png")
        --frame:setScale(0.9)
        local frameSize = image:getContentSize()
        frame:setPosition(cc.p(frameSize.width/2+20,self.size.height*2-i*(self.height-11)+frameSize.height/2-10))
        self.scrollView:addChild(frame)
        self.scrollView:addChild(image)

        local light = ccui.ImageView:create("ui/informate/light.png")
        light:setScale(0.9)
        local size = light:getContentSize()
        light:setPosition(cc.p(imageSize.width/2+21,self.size.height*2-i*(self.height-11)+imageSize.height/2-10))
        self.scrollView:addChild(light)
        if activeCount > 0 then
            if i <= activeCount then
                light:setVisible(true)
            else
                light:setVisible(false)
            end
        else
            light:setVisible(false)
        end          
     end
     self:frushData()
end
--排列数据显示数据
function InformateUI:frushData()
    local group = groupData.getAll()
    local heroId_1 = nil
    local heroId_2 = nil 
    local skillId = nil
    local data = nil
    for i = 1,8 do
        local heroId_1 = self.data[i]
        for j = 1,8 do
            heroId_2 = self.saveLineData[j]
            if heroId_1 ~= heroId_2 then
                for key,value in pairs(group) do
                    if self:isExist(heroId_1,value.activateHero) and
                       self:isExist(heroId_2,value.activateHero) then
                            skillId = value[heroId_1].icon
                            data = value
                            break
                    else
                        skillId = nil
                        data    = nil
                    end
                end
            else
                skillId = nil
                data    = nil
            end    
            local pos = cc.p(i*self.width-(i-1)*4,self.size.height*2-j*(self.height-10))
            self:drawIcon(skillId,pos,data,i)
        end
    end
end
--一个表中是否存在某个值
function InformateUI:isExist(val,tab)
     for key,value in pairs(tab) do
        if val == value then
            return true
        end
     end
     return false
end
--一个技能控件
function InformateUI:drawIcon(id,pos,data,index)
    
    if id then
        local path = nil
        if self:isExist(data.mainID,globalData.getActiveGroup()) then
            path = string.format("ui/Icons/groupIcon/%s.png",id)
        else
            path = string.format("ui/Icons/groupIcon/%soff.png",id)
        end
        local btn = ccui.Button:create(path,path,nil)
        local size = btn:getContentSize()
        btn:setPosition(cc.p(pos.x+size.width/2+20,pos.y+size.height/2))
        self.scrollView:addChild(btn)
        local hero = globalData.getHeroOrder()
        local function btnBack(sender)          
            viewMgr.show(viewMgr.def.TIPS_UI,2,data,hero[index])        
        end
        btn:addClickEventListener(btnBack)
    else
        local frame = ccui.ImageView:create()
        frame:loadTexture("ui/informate/buttomFrame.png")
        local size = frame:getContentSize()
        frame:setPosition(cc.p(pos.x+size.width/2+20,pos.y+size.height/2))
        self.scrollView:addChild(frame)
    end
    
end
function InformateUI:getPage()
    return self.page
end
return InformateUI