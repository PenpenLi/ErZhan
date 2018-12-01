

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
                -- if node:getName() == "Button_My_Card_5" and self._stepID == 1 then
                --     self:doStep(2)
                -- end
                if node:getName() == "skillBtn_2" then
                    if self.autoSkillPro then
                        viewMgr.show(viewMgr.def.TIPS_UI,1,self.autoSkillPro)
                    end
                end
                if node:getName() == "skillBtn_3" then
                    if self.passiveSkillPro then
                        viewMgr.show(viewMgr.def.TIPS_UI,1,self.passiveSkillPro)
                    end
                end
                local networkStr = WordLanguage.netWork
                local curScence  = display.getRunningScene()
                if node:getName() == "Image" then
                    viewMgr.hide(viewMgr.def.Package_UI)
                    return
                end
            end         
        end      
    end
    self.studioPage = import("ui.HallNode.lua").create(clickBack)
    local itemStoreStudio = self.studioPage.root
   
 
    print("HallScene_ErZhan:ctor 1")
    -- --local path = utils.getName("sdfdf")
    -- itemStoreStudio:setTouchEnabled(true)
    -- itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()
    -- local function listener(event)
    --     local name = event.name 
    --     if name == "enter" then
    --         self:onEnter()
    --     elseif name == "exit" then
    --         self:onExit()
    --     end
    -- end
    -- self.studioNode:setNodeEventEnabled(true,listener)

    -- -- 获得Studio中的所有控件
    self:getAllElemets()

    -- 做适配动画
    -- local panel = self.studioPage["bgBottom"]
    -- utils.playAction(self.studioNode, panel)

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
                viewMgr.show(viewMgr.def.ITEMSTORE_UI)
            elseif name =="Button_My_Cards" then
            end
        end
        if eventType == ccui.TouchEventType.canceled then
            -- self.light_ach:setVisible(false)
            -- self.light_hero:setVisible(false)
            -- self.light_icon:setVisible(false)
            -- self.light_item:setVisible(false)
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