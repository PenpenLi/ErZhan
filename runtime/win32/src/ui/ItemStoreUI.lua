

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
                elseif self._stepID == 17 then
                    -- B2大刀队移动至C2
                    self:doStep(18)
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
                elseif self._stepID == 14 then
                    -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
                    self:doStep(15)
                end
            elseif name =="Button_My_Card_1" then
                if self._stepID == 11 then
                    self:doStep(12)
                end
            elseif name =="Button_A_3" then
                if self._stepID == 12 then
                    self:doStep(13)
                end
            elseif name == "Button_C_4" then
                -- 引导玩家侦察C4位置的单位（暴露13师团），然后移动至C5
                self:doStep(16)
            elseif name == "Button_C_5" then
                -- 引导玩家点击B5侦察排 然后移动至C5
                if self._stepID == 16 then
                    local function callFunc( ... )
                        -- B2大刀队移动至C2
                        self:doStep(17)
                    end
                    self:moveTableCard(2, "KP1001", "B_5", "C_5", callFunc)
                end
            elseif name == "Button_C_2" then
                -- 引导玩家点击B5侦察排 然后移动至C5
                if self._stepID == 18 then
                    local function callFunc( ... )
                        -- C3位置部署机枪阵地
                        self:doStep(19)
                    end
                    self:moveTableCard(2, "KP1002", "B_2", "C_2", callFunc)
                end

            elseif name == "Button_C_3" then
                -- C3位置部署机枪阵地
                self:addCardToTable("KP1009", "C_3", 1)
                if self._stepID == 19 then
                    local function callFunc( ... )
                        -- C3位置部署机枪阵地
                        self:showTurnTip(true)
                    end
                end
                scheduler:scheduleScriptFunc(timer,3, false)
                
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

    -- 自己有多少手牌
    self.myHandCount = 5
    -- 敌方有多少手牌
    self.enemyHandCount = 5
    -- 所有在牌桌上面的牌
    self.allCardsInTable = {}

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
        self:addCardToTable("KP1002", "B_2", 5)
        self:addCardToHand("KP1000")
        -- 在第四张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_4)
        self:showDBY_inHand(self.studioPage.Button_My_Card_5)
    elseif stepID == 4 then
        -- TO-DO第四张手牌显示选中状态
        -- 在B3位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_3)
    elseif stepID == 5 then
        -- TO-DO 在B3位置显示卡牌 远征军
        self:addCardToTable("KP1003", "B_3", 4)
        -- 在第三张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_3)
        self:showDBY_inHand(self.studioPage.Button_My_Card_4)
    elseif stepID == 6 then
        -- TO-DO第三张手牌显示选中状态
        -- 在B4位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_4)
    elseif stepID == 7 then
        -- TO-DO 在B4位置显示卡牌 地雷
        self:addCardToTable("KP1010", "B_4", 3)
        -- 在第二张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_2)
        self:showDBY_inHand(self.studioPage.Button_My_Card_3)
    elseif stepID == 8 then
        -- TO-DO第二张手牌显示选中状态
        -- 在A4位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 9 then
        -- TO-DO 在A4位置显示卡牌 S105mm炮
        self:addCardToTable("KP1005", "A_4", 2)
        -- 在第一张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_1)
        self:showDBY_inHand(self.studioPage.Button_My_Card_2)
    elseif stepID == 10 then
        -- TO-DO第一张手牌显示选中状态
        -- 在B5位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_B_5)
    elseif stepID == 11 then
        -- TO-DO 在B5位置显示卡牌 侦察排
        self:addCardToTable("KP1001", "B_5", 1)
        -- 在第一张手牌位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_My_Card_1)
        self:showDBY_inHand(self.studioPage.Button_My_Card_1)
    elseif stepID == 12 then
        -- TO-DO第一张手牌显示选中状态
        -- 在A3位置显示提示按钮
        self:showGuideTip(self.studioPage.Button_A_3)
    elseif stepID == 13 then
        -- TO-DO 在A3位置显示卡牌 大本营
        self:addCardToTable("KP1000", "A_5", 1)
        -- 摆拍结束显示地方放的所有的牌
        self:showEnemyCards()
    elseif stepID == 14 then
        -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
        self:showGuideTip(self.studioPage.Button_B_5)
    elseif stepID == 15 then
        -- 引导玩家侦察C4位置的单位（暴露13师团），然后移动至C5
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 16 then
        -- 暴露C4位置的13师团，然后移动至C5
        self:changeCardTex(self.allCardsInTable.KP2003, "KP2003")
        self:showGuideTip(self.studioPage.Button_C_5)
    elseif stepID == 17 then
        -- B2大刀队移动至C2
        self:showGuideTip(self.studioPage.Button_B_2)
    elseif stepID == 18 then
        -- B2大刀队移动至C2
        self:showGuideTip(self.studioPage.Button_C_2)
    elseif stepID == 19 then
        -- C3位置部署机枪阵地
        self:showGuideTip(self.studioPage.Button_C_3)
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
        texPath = "fightImgs/tableCards/"..cardID..".png"
    end
    cardNod:loadTextureNormal(texPath,0)
    cardNod:loadTexturePressed(texPath,0)
    cardNod:loadTextureDisabled(texPath,0)
end

-- 摆拍结束显示地方放的所有的牌
function ItemStoreUI:showEnemyCards()
    local function timer()
        -- 特攻队D1, 狙击小队D2, 95式坦克D3, 105mm炮D4, 13师团D5, 大本营E4
        self:addCardToTable("KP2002", "D_1")
        self:addCardToTable("KP2006", "D_2")
        self:addCardToTable("KP2005", "D_3")
        self:addCardToTable("KP2004", "D_4")
        self:addCardToTable("KP2003", "D_5")
        self:addCardToTable("KP2000", "E_4")

        self:showTurnTip(true)
    end
    -- 延迟3s显示对方手牌
    scheduler:scheduleScriptFunc(timer,3, false)
end

-- 放一张手牌到牌桌上面
-- handIndex 表示是第几张手牌
-- isEnemy true 表示是敌方放牌到牌桌上
function ItemStoreUI:addCardToTable(cardID, posID, handIndex, isEnemy)
    local card = ccui.ImageView:create("fightImgs/tableCards/"..cardID..".png")
    self.allCardsInTable.cardID = card
    card:setTouchEnabled(false)
    self.studioPage["Button_"..posID]:addChild(card)
    self._cardsNode[cardID] = card


    -- 移除手牌
    if not isEnemy then
        self.studioPage["Button_My_Card_"..self.myHandCount]:setVisible(false)
        self.myHandCount = self.myHandCount - 1
    else
        self.studioPage["enemy_Hand_Card_"..self.enemyHandCount]:setVisible(false)
        self.enemyHandCount = self.enemyHandCount - 1
    end

    -- 第一回合日军行动结束后, 国军开始行动
    if cardID == "KP2001" then
        self:showTurnTip()
    end
end

-- 显示自己回合/敌方回合
function ItemStoreUI:showTurnTip(isEnemy)
    if not self.turnCount then
        self.turnCount = 0
    end
    if isEnemy then
        self.turnCount = self.turnCount + 1
        self.studioPage["Img_Turn_Img"]:loadTexture("")
        self:enemyTurn()
    else
        self.studioPage["Img_Turn_Img"]:loadTexture("")
        self:myTurn()
    end

    
end

-- 轮到敌方操作
function ItemStoreUI:enemyTurn( ... )
    if self.turnCount == 1 then
        -- 敌方抓一张手牌 侦察小队
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟3s显示对方手牌
        scheduler:scheduleScriptFunc(timer,1, false)
 
        local function finc1( ... )
            -- 侦察小队部署于D5
            self:addCardToTable("KP2001", "D_5", 1, true)
        end
        -- D5位置13师团移动至C4位, 回调函数里面部署D5
        self:moveTableCard(2.5, "KP2003", "D_5", "C_4", finc1)
    end
end

-- 轮到自己操作
function ItemStoreUI:myTurn( ... )
    if self.turnCount == 1 then
        -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
        self:doStep(14)
    end
end

function ItemStoreUI:addCardToHand(cardID, isEnemy)
    if not isEnemy then
        self.myHandCount = self.myHandCount + 1
        self.studioPage["Button_My_Card_"..self.myHandCount]:setVisible(true)
        self:changeCardTex(self.studioPage["Button_My_Card_"..self.myHandCount], cardID)

    else
        self.enemyHandCount = self.enemyHandCount + 1
    end

end

-- 延迟几秒把敌方的卡片移动到目标位置
function ItemStoreUI:moveTableCard(delayTime, cardID, nowPos, toPos, callFunc)
    local cardNode = self.allCardsInTable.cardID
    if not self._enemyMoveIndex then
        self._enemyMoveIndex = 1
    end

    local act1 = cc.DelayTime:create(delayTime)
    local function finc1( ... )
        if callFunc then
            callFunc()
        end
    end
    local act2 = cc.CallFunc:create(finc1)
    local x,y = self.studioPage["Button_"..toPos]:getPosition()
    local moveAction = cc.MoveTo:create(0.5, cc.p(x, y))
    local seq  = cc.Sequence:create( act1, moveAction, act2)
    cardNode:runAction(seq)
    self._enemyMoveIndex = self._enemyMoveIndex + 1
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