local ShowStarUI = class("ui.ShowStarUI")

function ShowStarUI:ctor()
    AudioMgr.playSound(AudioMgr.allUIEffect.Function,false)
    local reslut = require("ui.ShowStarSutdio.lua").create()
    self.page = reslut.root
    local panel = reslut.panle
    local function BackFunc()
        viewMgr.hide(viewMgr.def.SHOWSTAR_UI)
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        return
    end
    panel:addClickEventListener(BackFunc)
    for i = 1,10 do
        local name = string.format("Text_star_%d",i)
        local text = reslut[name]
        if text then
            text:setFontName(GLOBAL_FONTNAME)
            text:enableOutline(cc.c4b(0,0,0,255),2)
        end
    end
    utils.playAction(self.page,panel)
end
function ShowStarUI:getPage()
    return self.page
end
return ShowStarUI
