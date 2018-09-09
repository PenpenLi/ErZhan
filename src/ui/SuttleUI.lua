local SuttleUI = class("ui.SuttleUI.lua")

function SuttleUI:ctor(self,isSuccess,starNum,func)
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
    self.starNum = starNum
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function () 
                if node:getName() == "btn_Back" then
                    viewMgr.hide(viewMgr.def.SUTTLE_UI)
                    return
                end 
                if node:getName() == "btn_Replay" then
                    if func then
                        func()
                    end
                    viewMgr.hide(viewMgr.def.SUTTLE_UI)
                    return
                end    
            end         
        end      
    end
    self.result = import("ui.SuttleStudio").create(clickBack)
    local bg = self.result.bg
    self.page = self.result.root
    utils.playAction(self.page,bg,true) 
    local Replay = self.result.Replay
    Replay:setFontName(GLOBAL_FONTNAME)
    Replay:enableOutline(cc.c4b(0,0,0,255),2)
    local str = WordLanguage.rePlay
    Replay:setString(str)
    local Back   = self.result.Back
    Back:setFontName(GLOBAL_FONTNAME)
    Back:enableOutline(cc.c4b(0,0,0,255),2)
    str = WordLanguage.Back
    Back:setString(str)
    
    --三颗星
    for i = 1,3 do
        local name = "star_"..tostring(i)
        local star = self.result[name]
        if i <= self.starNum then
        else
            local path = nil
            if i == 1 or i == 3 then
                path = "ui/fight/wingame/starRightGray.png"
            else
                path = "ui/fight/wingame/starGray.png"
            end
            star:loadTexture(path)
        end
    end
    self.curActionStar = 0
    self:createStar(1)
end
function SuttleUI:createStar(idx)
    if self.starNum > 0 then
        --放大动画
        self.curActionStar = idx
        local name = "star_"..tostring(self.curActionStar)
        local star = self.result[name]

        local scale_1 = cc.ScaleTo:create(0.2,2)
        local scale_2 = cc.ScaleTo:create(0.1,0.8)
        local scale_3 = cc.ScaleTo:create(0.1,1)
        local function starBack()
            if self.curActionStar < self.starNum then
                self:createStar(self.curActionStar+1)
            end
        end
        local action_1 = cc.Spawn:create(scale_3,cc.CallFunc:create(starBack))
        local starAction = cc.Sequence:create(scale_1,scale_2,action_1)
        star:runAction(starAction)
    end
end
function SuttleUI:getPage()
    return self.page
end
return SuttleUI