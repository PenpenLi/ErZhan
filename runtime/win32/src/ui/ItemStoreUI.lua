

local GlobalData             = require("tools.GlobalData")
local RMBSkillProperties     = require("app.properties.RMBSkillProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local ItemStoreUI = class("ItemStoreUI")

local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 第3个参数表示是通过战斗页面点击进来的，点击了第几个道具，然后要默认选中这个道具
function ItemStoreUI:ctor(self, finc, itemIndex)
    
    print("ItemStoreUI:ctor")
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
                if node:getName() == "Button_My_Card_5" and self._stepID == 1 then
                    self:doStep(2)
                end
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
    self.studioPage = import("ui.FightNode.lua").create(clickBack)
    local itemStoreStudio = self.studioPage.root
   
 
    print("ItemStoreUI:ctor 1")
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
            elseif name == "Button_hero" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(true)
                self.light_icon:setVisible(false)
                self.light_item:setVisible(false)
            elseif name == "Button_icon" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(false)
                self.light_icon:setVisible(true)
                self.light_item:setVisible(false)
            elseif name == "Button_item" then
                self.light_ach:setVisible(false)
                self.light_hero:setVisible(false)
                self.light_icon:setVisible(false)
                self.light_item:setVisible(true)
            end
        end
        if eventType == ccui.TouchEventType.ended then
            if name == "Button_My_Card_5" then
                print("click end studioPage.Button_My_Card_5")
                if self._stepID == 1 then
                    self:doStep(2)
                end
            elseif name == "Button_B_2" then
                if self._stepID == 2 then
                    self:doStep(3)
                end
            elseif name =="Button_My_Card_4" then
                if self._stepID == 3 then
                    self:doStep(4)
                end
            elseif name =="Button_B_3" then
                if self._stepID == 4 then
                    self:doStep(5)
                end
            elseif name =="Button_My_Card_3" then
                if self._stepID == 5 then
                    self:doStep(6)
                end
            elseif name =="Button_B_4" then
                if self._stepID == 6 then
                    self:doStep(7)
                end
            elseif name =="Button_My_Card_2" then
                if self._stepID == 7 then
                    self:doStep(8)
                end
            elseif name =="Button_A_4" then
                if self._stepID == 8 then
                    self:doStep(9)
                end
            elseif name =="Button_My_Card_1" then
                if self._stepID == 9 then
                    self:doStep(10)
                end
            elseif name =="Button_B_5" then
                if self._stepID == 10 then
                    self:doStep(11)
                end
            elseif name =="Button_My_Card_1" then
                if self._stepID == 11 then
                    self:doStep(12)
                end
            elseif name =="Button_A_3" then
                if self._stepID == 12 then
                    self:doStep(13)
                end
            end
        end
        if eventType == ccui.TouchEventType.canceled then
            self.light_ach:setVisible(false)
            self.light_hero:setVisible(false)
            self.light_icon:setVisible(false)
            self.light_item:setVisible(false)
        end
    end
    self.studioPage.Button_My_Card_5:addTouchEventListener(callBack)
    print("ItemStoreUI:ctor 3")



end

function ItemStoreUI:onEnter()
    -- 提示玩家点击哪个按钮的图片
    print("ItemStoreUI:onEnter()")
    self._tipFrame = ccui.ImageView:create("fightImgs/62.png")
    self._tipFrame:retain()
    print("ItemStoreUI:onEnter() 1")
    local btn = self.studioPage.Button_My_Card_5
    local size = btn:getContentSize()
    print("ItemStoreUI:onEnter() 2")
    self._tipFrame:setPosition(cc.p(size.width/2,size.height/2))
    btn:addChild(self._tipFrame,1)
    self._tipFrame:setTouchEnabled(false)
    self._tipFrame:setSwallowTouches(false)
    print("ItemStoreUI:onEnter() 3")

    -- print("ItemStoreUI:onEnter()")
    -- local finger = EffectAniCache.getFingerInHall()
    -- print("ItemStoreUI:onEnter("))
    -- finger:setName("finger_1")
    -- self.studioPage.bgBottom.Button_My_Card_5:addChild(finger)
    -- finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))

    self:doStep(1)
end

-- 1 提示自己的第五张牌, 然后放到
function ItemStoreUI:doStep(stepID)
    print("ItemStoreUI:doStep stepID = "..tostring(stepID))
    self._stepID = stepID

    if stepID == 1 then
        -- 在第五张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_5)
    elseif stepID == 2 then
        -- TO-DO第五张手牌显示选中状态
        -- 在B2位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_2)
    elseif stepID == 3 then
        -- TO-DO 在B2位置显示卡牌 29军大刀队
        -- 在第四张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_4)
        self:showDBY_inHand(self.studioPage.Button_My_Card_5)
    elseif stepID == 4 then
        -- TO-DO第四张手牌显示选中状态
        -- 在B3位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_3)
    elseif stepID == 5 then
        -- TO-DO 在B3位置显示卡牌 远征军
        -- 在第三张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_3)
        self:showDBY_inHand(self.studioPage.Button_My_Card_4)
    elseif stepID == 6 then
        -- TO-DO第三张手牌显示选中状态
        -- 在B4位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_4)
    elseif stepID == 7 then
        -- TO-DO 在B4位置显示卡牌 地雷
        -- 在第二张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_2)
        self:showDBY_inHand(self.studioPage.Button_My_Card_3)
    elseif stepID == 8 then
        -- TO-DO第二张手牌显示选中状态
        -- 在A4位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 9 then
        -- TO-DO 在A4位置显示卡牌 S105mm炮
        -- 在第一张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_1)
        self:showDBY_inHand(self.studioPage.Button_My_Card_2)
    elseif stepID == 10 then
        -- TO-DO第一张手牌显示选中状态
        -- 在B5位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_5)
    elseif stepID == 11 then
        -- TO-DO 在B5位置显示卡牌 侦察排
        -- 在第一张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_1)
        self:showDBY_inHand(self.studioPage.Button_My_Card_1)
    elseif stepID == 12 then
        -- TO-DO第一张手牌显示选中状态
        -- 在A3位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_A_3)
    elseif stepID == 13 then
        -- TO-DO 在A3位置显示卡牌 大本营
        -- 摆拍结束显示地方放的所有的牌
        self:showEnemyCards()
    end

end

function ItemStoreUI:showGuideTip(fatherNode)
    local size = fatherNode:getContentSize()
    self._tipFrame:removeFromParent()
    fatherNode:addChild(self._tipFrame,1)
    self._tipFrame:setPosition(cc.p(size.width/2,size.height/2))
end

function ItemStoreUI:showDBY_inHand(fatherNode)
    -- 在手牌的这个位置显示大本营
end

-- 修改卡牌的纹理
function ItemStoreUI:changeCardTex(cardNod, cardID, texPath)
    if cardID and not texPath then
        texPaht = ""..cardID..".png"
    end
    cardNod:loadTextureNormal(texPath,0)
    cardNod:loadTexturePressed(texPath,0)
    cardNod:loadTextureDisabled(texPath,0)
end

-- 摆拍结束显示地方放的所有的牌
function ItemStoreUI:showEnemyCards()
    local function timer()
        -- 特攻队D1, 狙击小队D2, 95式坦克D3, 105mm炮D4, 13师团D5, 大本营E4
        self:addCardToTable(cardID, "C_4")
        -- 显示完地方卡牌之后, 敌方开始移动
        self:moveEnemyCard(2, "D5", "C4")
    end
    -- 延迟3s显示对方手牌
    scheduler:scheduleScriptFunc(timer,3, false)
end

-- 放一张手牌到牌桌上面
function ItemStoreUI:addCardToTable(cardID, posID)
    local card = ccui.ImageView:create("ui/sign/get.png")
    self.studioPage["Button_"..posID]:addChild(card)
    self._cardsNode[cardID] = card
end

-- 延迟几秒把敌方的卡片移动到目标位置
function ItemStoreUI:moveEnemyCard(delayTime, cardNode, posTo, callFunc)
    local function timer()
        -- 显示完地方卡牌之后, 敌方开始移动
        self:moveEnemyCard(2, "D5", "C4")
    end
    -- 延迟3s显示对方手牌
    scheduler:scheduleScriptFunc(timer,3, false)

    local act1 = cc.DelayTime:create(delayTime)
    local function finc1( ... )
        if callFunc then
            callFunc()
        end
    end
    local act2 = cc.CallFunc:create(finc1)
    local moveAction = cc.MoveTo:create(0.5, posTo)
    local seq  = cc.Sequence:create( act1, moveAction, act2)
    self.root:runAction(seq)
end

-- 记录所有的控件
function ItemStoreUI:getAllElemets()

end

-- 获得node页面
function ItemStoreUI:getPage()
    print("ItemStoreUI:getPage()")
    return self.studioNode
end

return ItemStoreUI