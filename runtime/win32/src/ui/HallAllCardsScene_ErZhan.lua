

local GlobalData             = require("tools.GlobalData")
local RMBSkillProperties     = require("app.properties.RMBSkillProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local HallAllCardsScene_ErZhan = class("HallAllCardsScene_ErZhan")

local scheduler = require("framework.scheduler")
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 第3个参数表示是通过战斗页面点击进来的，点击了第几个道具，然后要默认选中这个道具
function HallAllCardsScene_ErZhan:ctor(self, finc, itemIndex)
    
    print("HallAllCardsScene_ErZhan:ctor")
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
    self.studioPage = import("ui.HallAllCardsNode.lua").create(clickBack)
    local itemStoreStudio = self.studioPage.root
   
 
    print("HallAllCardsScene_ErZhan:ctor 1")
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
            if name == "Button_1" then
                -- Button_1 点击日军
                self:onClickRiJun()
            elseif name =="Button_2" then
                -- Button_1 点击国军
                self:onClickGuoJun()
            end
        end
        if eventType == ccui.TouchEventType.canceled then
        end
    end
    -- Button_1 点击日军
    self.studioPage.Button_1:addTouchEventListener(callBack)
    -- Button_1 点击国军
    self.studioPage.Button_2:addTouchEventListener(callBack)


    print("HallAllCardsScene_ErZhan:ctor 3")



end

function HallAllCardsScene_ErZhan:onEnter()
    -- 提示玩家点击哪个按钮的图片
    print("HallAllCardsScene_ErZhan:onEnter()")
    print("HallAllCardsScene_ErZhan:onEnter() 1")
    print("HallAllCardsScene_ErZhan:onEnter() 2")


end

-- 点击日军按钮, 显示日军卡片
function HallAllCardsScene_ErZhan:onClickRiJun()
    
    self.studioPage.guoJun_1_1:setTexture("hallAllCards/riJun/riJun_1.png")
    self.studioPage.guoJun_1_2:setTexture("hallAllCards/riJun/riJun_2.png")
    self.studioPage.guoJun_1_3:setTexture("hallAllCards/riJun/riJun_3.png")
    self.studioPage.guoJun_1_4:setTexture("hallAllCards/riJun/riJun_4.png")
    self.studioPage.guoJun_1_5:setTexture("hallAllCards/riJun/riJun_5.png")
    self.studioPage.guoJun_1_6:setTexture("hallAllCards/riJun/riJun_6.png")
    self.studioPage.guoJun_1_7:setTexture("hallAllCards/riJun/riJun_7.png")
    self.studioPage.guoJun_1_8:setTexture("hallAllCards/riJun/riJun_8.png")
    self.studioPage.guoJun_1_9:setTexture("hallAllCards/riJun/riJun_9.png")
    self.studioPage.guoJun_1_10:setTexture("hallAllCards/riJun/riJun_10.png")

end

-- 点击国军按钮, 显示国军卡片
function HallAllCardsScene_ErZhan:onClickGuoJun()
    self.studioPage.guoJun_1_1:setTexture("hallAllCards/guoJun_1.png")
    self.studioPage.guoJun_1_2:setTexture("hallAllCards/guoJun_2.png")
    self.studioPage.guoJun_1_3:setTexture("hallAllCards/guoJun_3.png")
    self.studioPage.guoJun_1_4:setTexture("hallAllCards/guoJun_4.png")
    self.studioPage.guoJun_1_5:setTexture("hallAllCards/guoJun_5.png")
    self.studioPage.guoJun_1_6:setTexture("hallAllCards/guoJun_6.png")
    self.studioPage.guoJun_1_7:setTexture("hallAllCards/guoJun_7.png")
    self.studioPage.guoJun_1_8:setTexture("hallAllCards/guoJun_8.png")
    self.studioPage.guoJun_1_9:setTexture("hallAllCards/guoJun_9.png")
    self.studioPage.guoJun_1_10:setTexture("hallAllCards/guoJun_10.png")
end

-- 记录所有的控件
function HallAllCardsScene_ErZhan:getAllElemets()

end

-- 获得node页面
function HallAllCardsScene_ErZhan:getPage()
    print("HallAllCardsScene_ErZhan:getPage()")
    return self.studioNode
end

return HallAllCardsScene_ErZhan