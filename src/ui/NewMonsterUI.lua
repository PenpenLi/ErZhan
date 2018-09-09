local MonsterData = require("app.properties.MonsterProperties")
local GlobalData  = require("tools.GlobalData")
local NewMonsterUI = class("ui/NewMonsterUI.lua")

function NewMonsterUI:ctor(self,id,func)
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function () 
                if node:getName() == "Button" then
                    if func then
                        func()
                    end
                    viewMgr.hide(viewMgr.def.NEWMONSTER_UI)
                    return
                end    
            end         
        end      
    end
    local result = import("ui.NewMonsterStudio").create(clickBack)
    self.page = result.root
    local Image_1 = result.Image_1
    utils.playAction(self.page,Image_1,true)
    local name        = result.Text_9
    name:setFontName(GLOBAL_FONTNAME)
    local info_Text   = result.info_Text
    info_Text:setFontName(GLOBAL_FONTNAME)
    info_Text:ignoreContentAdaptWithSize(false); 
    info_Text:setContentSize(cc.size(350,90)); 
    local hp_Text     = result.hp_Text
    hp_Text:setFontName(GLOBAL_FONTNAME)
    local attack_Text = result.attack_Text
    attack_Text:setFontName(GLOBAL_FONTNAME)
    local define_Text = result.define_Text
    define_Text:setFontName(GLOBAL_FONTNAME)
    local speed_Text  = result.speed_Text
    speed_Text:setFontName(GLOBAL_FONTNAME)
    local skill_Text  = result.skill_Text
    skill_Text:setFontName(GLOBAL_FONTNAME)

    local frame       = result.Image_5
    local frameSize   = frame:getContentSize() 
    local data = MonsterData.get(id)
    if data then
        local idx = utils.getName("name")
        name:setString(data[idx])
        local idxInfo = utils.getName("feature")
        info_Text:setString(data[idxInfo])

        hp_Text:setString(data.maxHp)
        attack_Text:setString(data.attack)
        define_Text:setString(data.armor)
        speed_Text:setString(data.speed)
        skill_Text:setString(data.passValue)
        local imageName = string.format("ui/Icons/monsterIcon/big/%s.jpg",data.mainID)
        local image = cc.Sprite:create(imageName)
        image:setPosition(cc.p(frameSize.width/2,frameSize.height/2))
        frame:addChild(image)
    end
end
function NewMonsterUI:getPage()
    return self.page
end
return NewMonsterUI
