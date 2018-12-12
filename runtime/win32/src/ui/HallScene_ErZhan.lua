

local GlobalData             = require("tools.GlobalData")
local RMBSkillProperties     = require("app.properties.RMBSkillProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local HallScene_ErZhan = class("HallScene_ErZhan")

local scheduler = require("framework.scheduler")
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 第3个参数表示是通过战斗页面点击进来的，点击了第几个道具，然后要默认选中这个道具
function HallScene_ErZhan:ctor(self, finc, itemIndex)
    
    print("HallScene_ErZhan:ctor")
    self._stepID = 0
    -- 关闭页面的回调函数
    self.finc = finc
    -- 需要默认选中第几个道具
    self.itemIndex = itemIndex

    -- 记录在场的卡牌
    self._cardsNode = {}

    local clickBack = function(luaFileName,node,callbackName)  
        print("callbackName = "..tostring(callbackName))
        if callbackName == "clickEvent" then
            return function ()
                print("node:getName() = "..tostring(node:getName()))
            end         
        end      
    end
    self.studioPage = import("ui.HallNode.lua").create(clickBack)
    local itemStoreStudio = self.studioPage.root
   
 
    print("HallScene_ErZhan:ctor 1")

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()

    -- -- 获得Studio中的所有控件
    self:getAllElemets()


    local function callBack(sender,eventType)
        if self.showNextLv and self.showNextLv > 0 then return end
        local name = sender:getName()
        if eventType == ccui.TouchEventType.began then
            if name == "Button_My_Card_5" then
                print("click begin studioPage.Button_My_Card_5")
            end
        end
        if eventType == ccui.TouchEventType.ended then
            
            print("click end name = "..tostring(name).." self._stepID = "..tostring(self._stepID))
            if name == "Button_To_Fight" then
                AudioMgr.playSound("toFightScene")
                viewMgr.show(viewMgr.def.ITEMSTORE_UI)
            elseif name =="Button_My_Cards" then
                AudioMgr.playSound("toAllCards")
                viewMgr.show(viewMgr.def.HallAllCardsScene_ErZhan)
            end
        end
        if eventType == ccui.TouchEventType.canceled then
        end
    end
    self.studioPage.Button_To_Fight:addTouchEventListener(callBack)
    self.studioPage.Button_My_Cards:addTouchEventListener(callBack)

    print("HallScene_ErZhan:ctor 3")



end

function HallScene_ErZhan:onEnter()
    -- 提示玩家点击哪个按钮的图片
    print("HallScene_ErZhan:onEnter()")
    print("HallScene_ErZhan:onEnter() 1")
    print("HallScene_ErZhan:onEnter() 2")


end



-- 记录所有的控件
function HallScene_ErZhan:getAllElemets()

end

-- 获得node页面
function HallScene_ErZhan:getPage()
    print("HallScene_ErZhan:getPage()")
    return self.studioNode
end

return HallScene_ErZhan