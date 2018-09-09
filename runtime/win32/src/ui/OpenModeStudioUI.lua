

local GlobalData             = require("tools.GlobalData")
local OpenModeStudioUI = class("OpenModeStudioUI")

local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
function OpenModeStudioUI:ctor()
    print("OpenModeStudioUI:ctor")


    self.studioPage = import("ui.OpenModeStudio").create()
    local itemStoreStudio = self.studioPage.root
    
    itemStoreStudio:setTouchEnabled(true)
    itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(80)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()
    
    self:getAllElemets()
    
    local panel = self.studioPage["panel"]

    -- 做适配动画
    utils.playAction(self.studioNode, panel)
end

function OpenModeStudioUI:onEnter()
    
end

-- 记录所有的控件
function OpenModeStudioUI:getAllElemets()
    -- 好的按钮
    local okBtn = self.studioPage["okBtn"]
    okBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        viewMgr.hide(viewMgr.def.OPENMODE_UI)
    end)

end

-- 获得node页面
function OpenModeStudioUI:getPage()
    return self.studioNode
end

return OpenModeStudioUI