

local GlobalData             = require("tools.GlobalData")
local RMBSkillProperties     = require("app.properties.RMBSkillProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local ItemStoreUI = class("ItemStoreUI")

local scheduler = require("framework.scheduler")
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
            -- 播放点击按钮音效
            AudioMgr.playSound("Hemorrhage")

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
            print("click end name = "..tostring(name).." self._stepID = "..tostring(self._stepID))
            if name == "Button_My_Card_5" then
                print("click end studioPage.Button_My_Card_5")
                if self._stepID == 1 then
                    self._tipFrame:setVisible(false)
                    self:doStep(2)
                end
            elseif name == "Button_B_2" then
                if self._stepID == 2 then
                    self._tipFrame:setVisible(false)
                    self:doStep(3)
                elseif self._stepID == 17 then
                    self._tipFrame:setVisible(false)
                    -- B2大刀队移动至C2
                    self:doStep(18)
                elseif self._stepID == 30 then
                    self._tipFrame:setVisible(false)
                    -- 我方第三回合, 引导点击B2, 狙击队部署于B2
                    self:addCardToTable("KP1007", "B_2", 1)
                    local function finc_My_3_3( ... )
                        -- 轮到敌方第三回合
                        self:showTurnTip(true)
                    end
                    self._tipFrame:setVisible(false)
                    scheduler.performWithDelayGlobal(finc_My_3_3, 1.5, false)
                elseif self._stepID == 31 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 引导点击B2狙击队, 狙击牵制A2特攻队
                    self:doStep(32)
                elseif self._stepID == 39 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, 引导点击A2特工队, B2狙击队继续狙击牵制A2特攻队
                    self:doStep(40)
                end
            elseif name =="Button_My_Card_4" then
                if self._stepID == 3 then
                    self._tipFrame:setVisible(false)
                    self:doStep(4)
                end
            elseif name =="Button_B_3" then
                if self._stepID == 4 then
                    self._tipFrame:setVisible(false)
                    self:doStep(5)
                end
            elseif name =="Button_My_Card_3" then
                if self._stepID == 5 then
                    self._tipFrame:setVisible(false)
                    self:doStep(6)
                end
            elseif name =="Button_B_4" then
                if self._stepID == 6 then
                    self._tipFrame:setVisible(false)
                    self:doStep(7)
                elseif self._stepID == 34 then
                    self._tipFrame:setVisible(false)
                    -- 第四回合, 点击了B4位13师团, A4位105mm炮远程攻击消灭B4位13师团
                    local function finc_My_4_2( ... )
                        -- 引导点击第一张手牌, C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位
                        self:doStep(35)
                    end
                    self:attack(0.5, "KP1005", "KP2003", "A_4", "B_4", finc_My_4_2, 0, nil, true)
                elseif self._stepID == 44 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, 引导点击 B4位部署M3坦克
                    self:addCardToTable("KP1004", "B_4", 1)

                    local function finc_My_5_4( ... )
                        -- 轮到敌方第六回合
                        self:showTurnTip(true)
                    end
                    self._tipFrame:setVisible(false)
                    scheduler.performWithDelayGlobal(finc_My_5_4, 1, false)
                elseif self._stepID == 45 then
                    self._tipFrame:setVisible(false)
                    -- B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
                    self:doStep(46)
                end
            elseif name =="Button_My_Card_2" then
                if self._stepID == 7 then
                    self._tipFrame:setVisible(false)
                    self:doStep(8)
                end
            elseif name =="Button_A_4" then
                if self._stepID == 8 then
                    self._tipFrame:setVisible(false)
                    self:doStep(9)
                elseif self._stepID == 21 then
                    self._tipFrame:setVisible(false)
                    -- 我方第二回合, 玩家点击了A4位105mm炮后, 引导远程攻击C4位13师团（-5剩4血）。
                    self:doStep(22)
                elseif self._stepID == 25 then
                    self._tipFrame:setVisible(false)
                    -- 我方第三回合, 引导玩家点击A4位105炮远程攻击D3位95式坦克，并将其击毁。
                    self:doStep(26)
                elseif self._stepID == 33 then
                    self._tipFrame:setVisible(false)
                    -- 引导点击B4位13师团, A4位105mm炮远程攻击消灭B4位13师团
                    self:doStep(34)
                elseif self._stepID == 46 then
                    self._tipFrame:setVisible(false)
                    -- 我方第六回和, 引导点击A4, B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
                    local function finc_My_6_1( ... )
                        local function finc_My_6_2( ... )
                            -- 引导点击D4, D4骑兵营攻占E4位大本营
                            self:doStep(47)
                        end
                        -- B4位M3坦克前进至C4。
                        self:moveTableCard(0.5, "KP1004", "B_4", "C_4", finc_My_6_2)
                    end
                    self:attack(0.5, "KP1004", "KP2007", "B_4", "A_4", finc_My_6_1, 0, nil, false)
                end
            elseif name =="Button_My_Card_1" then
                if self._stepID == 9 then
                    self._tipFrame:setVisible(false)
                    self:doStep(10)
                elseif self._stepID == 11 then
                    self._tipFrame:setVisible(false)
                    self:doStep(12)
                elseif self._stepID == 19 then
                    self._tipFrame:setVisible(false)
                    -- 我方第一回合
                    -- C3位置部署机枪阵地
                    self:doStep(20)
                elseif self._stepID == 23 then
                    self._tipFrame:setVisible(false)
                    -- 我方第二回合, 部署工兵连于B5, 点击B5
                    self:doStep(24)
                elseif self._stepID == 29 then
                    self._tipFrame:setVisible(false)
                    -- 我方第三回合, 引导点击B2, 狙击队部署于B2
                    self:doStep(30)
                elseif self._stepID == 35 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 引导点击C4, C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位
                    self:doStep(36)
                elseif self._stepID == 43 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, 引导点击 B4位部署M3坦克
                    self:doStep(44)
                end
            elseif name =="Button_B_5" then
                if self._stepID == 10 then
                    self._tipFrame:setVisible(false)
                    self:doStep(11)
                elseif self._stepID == 14 then
                    self._tipFrame:setVisible(false)
                    -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
                    self:doStep(15)
                elseif self._stepID == 24 then
                    self._tipFrame:setVisible(false)
                    -- 部署工兵连于B5
                    self:addCardToTable("KP1006", "B_5", 1)
                    local function timer( ... )
                        -- 轮到敌方第三回合
                        self:showTurnTip(true)
                    end
                    self._tipFrame:setVisible(false)
                    scheduler.performWithDelayGlobal(timer,3, false)
                elseif self._stepID == 27 then
                    self._tipFrame:setVisible(false)
                    -- 我方第三回合, 引导点击C4位
                    self:doStep(28)
                end
            elseif name =="Button_A_3" then
                if self._stepID == 12 then
                    self._tipFrame:setVisible(false)
                    self:doStep(13)
                end
            elseif name == "Button_C_4" then
                if self._stepID == 15 then 
                    self._tipFrame:setVisible(false)
                    -- 引导玩家侦察C4位置的单位（暴露13师团），然后移动至C5
                    self:doStep(16)
                elseif self._stepID == 22 then
                    self._tipFrame:setVisible(false)
                    -- 我方第二回合, A4 105mm炮远程攻击C4位13师团（-5剩4血）。
                    local function finc_My_2_1( ... )
                        -- 部署工兵连于B5
                        self:doStep(23)
                    end
                    self:attack(0.5, "KP1005", "KP2003", "A_4", "C_4", finc_My_2_1, 4, nil, false)
                elseif self._stepID == 28 then
                    self._tipFrame:setVisible(false)
                    -- 我放第三回合, B5工兵连移动至C4位
                    local function finc_My_3_2( ... )
                        -- 我方第三回合, 引导点击第一张手牌, 狙击队部署于B2
                        self:doStep(29)
                    end
                    self:moveTableCard(0.5, "KP1006", "B_5", "C_4", finc_My_3_2)
                elseif self._stepID == 36 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 点击了C4, C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位
                    self:addCardToTable("KP1008", "C_4", 1)
                    -- 0.5s 后引导点击C4位置的骑兵营
                    local function timer( ... )
                        -- 轮到敌方第三回合
                        self:doStep(37)
                    end
                    scheduler.performWithDelayGlobal(timer, 0.5, false)
                elseif self._stepID == 37 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 点击了C4位置的骑兵营, 引导点击D4, 突击消灭D4位105mm炮，并坚守该位
                    self:doStep(38)
                end

            elseif name == "Button_C_5" then
                -- 引导玩家点击B5侦察排 然后移动至C5
                if self._stepID == 16 then
                    self._tipFrame:setVisible(false)
                    local function callFunc( ... )
                        -- B2大刀队移动至C2
                        self:doStep(17)
                    end
                    self:moveTableCard(0.5, "KP1001", "B_5", "C_5", callFunc)
                end
            elseif name == "Button_C_2" then
                -- 引导玩家点击B5侦察排 然后移动至C5
                if self._stepID == 18 then
                    self._tipFrame:setVisible(false)
                    local function callFunc( ... )
                        self:doStep(19)
                    end
                    self:moveTableCard(0.5, "KP1002", "B_2", "C_2", callFunc)
                elseif self._stepID == 41 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, 引导点击D2, C2 29军大刀队攻击消灭D2狙击手，然后移动至E2
                    self:doStep(42)
                end

            elseif name == "Button_C_3" then
                -- C3位置部署机枪阵地
                if self._stepID == 20 then
                    self._tipFrame:setVisible(false)
                    self:addCardToTable("KP1009", "C_3", 1)
                    local function timer( ... )
                        -- 轮到敌方第二回合
                        self:showTurnTip(true)
                    end
                    self._tipFrame:setVisible(false)
                    scheduler.performWithDelayGlobal(timer,3, false)
                end
                
            elseif name == "Button_A_2" then
                if self._stepID == 32 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 引导点击A2  B2狙击队狙击牵制A2特攻队
                    -- TO-DO 狙击
                    -- 引导点击A4位105mm炮, 远程攻击消灭B4位13师团
                    local function finc_My_4_1( ... )
                        -- 引导点击A4位105mm炮
                        self:doStep(33)
                    end
                    self:juJi(0.5, "KP1007", "KP2002", "B_2", "A_2", finc_My_4_1, 3)
                elseif self._stepID == 40 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, 点击了A2特工队, B2狙击队继续狙击牵制A2特攻队
                    local function finc_My_5_1( ... )
                        -- 引导点击C2, 29军大刀队攻击消灭D2狙击手，然后移动至E2
                        self:doStep(41)
                    end
                    self:juJi(0.5, "KP1007", "KP2002", "B_2", "A_2", finc_My_5_1, 2, nil, false)
                end
            elseif name == "Button_D_4" then
                if self._stepID == 38 then
                    self._tipFrame:setVisible(false)
                    -- 我方第四回合, 点击D4, C4位置的骑兵营突击消灭D4位105mm炮，并坚守该位
                    local function finc_My_4_3( ... )
                        local function finc_My_4_4( ... )
                            -- 敌方回合
                            self:showTurnTip(true)
                        end
                        self._tipFrame:setVisible(false)
                        -- 攻击结束后移动到D4
                        self:moveTableCard(0.5, "KP1008", "C_4", "D_4", finc_My_4_4)
                    end
                    self:attack(0.5, "KP1008", "KP2004", "C_4", "D_4", finc_My_4_3, 0, nil, true)
                elseif self._stepID == 47 then
                    self._tipFrame:setVisible(false)
                    -- 我方第六回合, 引导点击E4, D4骑兵营攻占E4位大本营
                    self:doStep(48)
                end
            elseif name == "Button_D_2" then
                if self._stepID == 42 then
                    self._tipFrame:setVisible(false)
                    -- 我方第五回合, B2 29军大刀队攻击消灭D2狙击手，然后移动至E2
                    local function finc_My_5_2( ... )
                        -- C2 29军大刀队移动至E2
                        local function finc_My_5_3( ... )
                            -- 引导点击自己的手牌 B4位部署M3坦克
                            self:doStep(43)
                        end
                        self:moveTableCard(2.5, "KP1002", "B_2", "E_2", finc_My_5_3)
                    end
                    self:attack(0.5, "KP1002", "KP2006", "B_2", "D_2", finc_My_5_2, 0, nil, true)
                end
            elseif name == "Button_E_4" then
                -- 我方第六回合, 引导点击E4, D4骑兵营攻占E4位大本营
                if self._stepID == 48 then
                    self._tipFrame:setVisible(false)
                    local function finc_My_6_3( ... )
                        -- 引导点击自己的手牌 B4位部署M3坦克
                        self:moveTableCard(0.1, "KP1008", "D_4", "E_4")
                        -- 显示结算页面
                        self.studioPage.resultImgNode:setVisible(true)
                        self.studioPage.resultImg:setVisible(true)
                    end
                    self:attack(0.5, "KP1008", "KP2000", "D_4", "E_4", finc_My_6_3, 0, nil, true)
                end
            elseif name == "Button_D_3" then
                if self._stepID == 26 then
                    self._tipFrame:setVisible(false)
                    -- 我方第三回合, 引导玩家A4 105mm炮攻击D3位95式坦克，并将其击毁。
                    local function finc_My_3_1( ... )
                        -- 引导点击B5工兵连移动至C4位
                        self:doStep(27)
                    end
                    self:attack(0.5, "KP1005", "KP2005", "A_4", "C_3", finc_My_3_1, 0, nil, true)
                end
            end
        end
        if eventType == ccui.TouchEventType.canceled then
            -- self.light_ach:setVisible(false)
            -- self.light_hero:setVisible(false)
            -- self.light_icon:setVisible(false)
            -- self.light_item:setVisible(false)
        end
    end
    self.studioPage.Button_My_Card_1:addTouchEventListener(callBack)
    self.studioPage.Button_My_Card_2:addTouchEventListener(callBack)
    self.studioPage.Button_My_Card_3:addTouchEventListener(callBack)
    self.studioPage.Button_My_Card_4:addTouchEventListener(callBack)
    self.studioPage.Button_My_Card_5:addTouchEventListener(callBack)

    self.studioPage.Button_A_1:addTouchEventListener(callBack)
    self.studioPage.Button_A_2:addTouchEventListener(callBack)
    self.studioPage.Button_A_3:addTouchEventListener(callBack)
    self.studioPage.Button_A_4:addTouchEventListener(callBack)
    self.studioPage.Button_A_5:addTouchEventListener(callBack)

    self.studioPage.Button_B_1:addTouchEventListener(callBack)
    self.studioPage.Button_B_2:addTouchEventListener(callBack)
    self.studioPage.Button_B_3:addTouchEventListener(callBack)
    self.studioPage.Button_B_4:addTouchEventListener(callBack)
    self.studioPage.Button_B_5:addTouchEventListener(callBack)

    self.studioPage.Button_C_1:addTouchEventListener(callBack)
    self.studioPage.Button_C_2:addTouchEventListener(callBack)
    self.studioPage.Button_C_3:addTouchEventListener(callBack)
    self.studioPage.Button_C_4:addTouchEventListener(callBack)
    self.studioPage.Button_C_5:addTouchEventListener(callBack)

    self.studioPage.Button_D_1:addTouchEventListener(callBack)
    self.studioPage.Button_D_2:addTouchEventListener(callBack)
    self.studioPage.Button_D_3:addTouchEventListener(callBack)
    self.studioPage.Button_D_4:addTouchEventListener(callBack)
    self.studioPage.Button_D_5:addTouchEventListener(callBack)

    self.studioPage.Button_E_1:addTouchEventListener(callBack)
    self.studioPage.Button_E_2:addTouchEventListener(callBack)
    self.studioPage.Button_E_3:addTouchEventListener(callBack)
    self.studioPage.Button_E_4:addTouchEventListener(callBack)
    self.studioPage.Button_E_5:addTouchEventListener(callBack)


    -- self.studioPage.Button_A_5:addTouchEventListener(callBack)
    -- self.studioPage.Button_A_5:addTouchEventListener(callBack)
    -- self.studioPage.Button_A_5:addTouchEventListener(callBack)
    -- self.studioPage.Button_A_5:addTouchEventListener(callBack)
    -- self.studioPage.Button_A_5:addTouchEventListener(callBack)
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
    -- btn:addChild(self._tipFrame,1)
    -- self:showGuideTip(btn)
    self._tipFrame:setTouchEnabled(false)
    self._tipFrame:setSwallowTouches(false)
    print("ItemStoreUI:onEnter() 3")

    -- print("ItemStoreUI:onEnter()")
    -- local finger = EffectAniCache.getFingerInHall()
    -- print("ItemStoreUI:onEnter("))
    -- finger:setName("finger_1")
    -- self.studioPage.bgBottom.Button_My_Card_5:addChild(finger)
    -- finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))

    -- self.studioPage.Img_Turn_Img:setVisible(false)

    -- 自己有多少手牌
    self.myHandCount = 5
    -- 敌方有多少手牌
    self.enemyHandCount = 5
    -- 所有在牌桌上面的牌
    self.allCardsInTable = {}
    -- 场上所有已经暴露的牌
    self.openedCards = {}

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
        self.studioPage.Button_My_Card_5:removeAllChildren()
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
        self:addCardToTable("KP1000", "A_3", 1)
        -- 摆拍结束显示敌方放的所有的牌
        self:showEnemyCards()
    elseif stepID == 14 then
        -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
        self:showGuideTip(self.studioPage.Button_B_5)
    elseif stepID == 15 then
        -- 引导玩家侦察C4位置的单位（暴露13师团），然后移动至C5
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 16 then
        -- 暴露C4位置的13师团，然后移动至C5
        self:openTableCards("KP2003", true)
        self:showGuideTip(self.studioPage.Button_C_5)
    elseif stepID == 17 then
        -- B2大刀队移动至C2
        self:showGuideTip(self.studioPage.Button_B_2)
    elseif stepID == 18 then
        -- B2大刀队移动至C2
        self:showGuideTip(self.studioPage.Button_C_2)
    elseif stepID == 19 then
        -- 我放第一回合, 引导玩家点击自己的手牌
        self:showGuideTip(self.studioPage.Button_My_Card_1)
    elseif stepID == 20 then
        -- C3位置部署机枪阵地
        self:showGuideTip(self.studioPage.Button_C_3)

    elseif stepID == 21 then
        -- 开始我方第二回合
        -- 引导玩家点击A4位105mm炮远程攻击C4位13师团（-5剩4血）。
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 22 then
        -- 我方第二回合, 玩家点击了A4位105mm炮后, 引导远程攻击C4位13师团（-5剩4血）。
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 23 then
        -- 我方第二回合, 部署工兵连于B5
        self:showGuideTip(self.studioPage.Button_My_Card_1)
    elseif stepID == 24 then
        -- 我方第二回合, 部署工兵连于B5
        self:showGuideTip(self.studioPage.Button_B_5)

    elseif stepID == 25 then
        -- 我放第三回合 引导玩家点击A4位105炮远程攻击D3位95式坦克，并将其击毁。
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 26 then
        -- 我方第三回合, 引导玩家点击D3位95式坦克，并将其击毁。
        self:showGuideTip(self.studioPage.Button_D_3)
    elseif stepID == 27 then
        -- 我方第三回合, 引导点击B5工兵连移动至C4位
        self:showGuideTip(self.studioPage.Button_B_5)
    elseif stepID == 28 then
        -- 我方第三回合, 引导点击C4位
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 29 then
        -- 我方第三回合, 引导点击第一张手牌, 狙击队部署于B2
        self:showGuideTip(self.studioPage.Button_My_Card_1)
    elseif stepID == 30 then
        -- 我方第三回合, 引导点击B2, 狙击队部署于B2
        self:showGuideTip(self.studioPage.Button_B_2)

    elseif stepID == 31 then
        -- 我方第四回合, 引导点击B2狙击队, 狙击牵制A2特攻队
        self:showGuideTip(self.studioPage.Button_B_2)
    elseif stepID == 32 then
        -- 我方第四回合, 引导点击A2  B2狙击队狙击牵制A2特攻队
        self:showGuideTip(self.studioPage.Button_A_2)
    elseif stepID == 33 then
        -- 引导点击A4位105mm炮, 远程攻击消灭B4位13师团
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 34 then
        -- 引导点击B4位13师团, A4位105mm炮远程攻击消灭B4位13师团
        self:showGuideTip(self.studioPage.Button_B_4)
    elseif stepID == 35 then
        -- 引导点击第一张手牌, C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位
        self:showGuideTip(self.studioPage.Button_My_Card_1)
    elseif stepID == 36 then
        -- 我方第四回合, 引导点击C4, C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 37 then
        -- 我方第四回合, 引导点击C4位置的骑兵营, 突击消灭D4位105mm炮，并坚守该位
        self:showGuideTip(self.studioPage.Button_C_4)
    elseif stepID == 38 then
        -- 我方第四回合, 引导点击D4, C4位置的骑兵营突击消灭D4位105mm炮，并坚守该位
        self:showGuideTip(self.studioPage.Button_D_4)
    elseif stepID == 39 then
        -- 我方第五回合, 引导点击B2狙击队, B2狙击队继续狙击牵制A2特攻队
        self:showGuideTip(self.studioPage.Button_B_2)
    elseif stepID == 40 then
        -- 我方第五回合, 引导点击A2特工队, B2狙击队继续狙击牵制A2特攻队
        self:showGuideTip(self.studioPage.Button_A_2)
    elseif stepID == 41 then
        -- 我方第五回合, 引导点击C2, 29军大刀队攻击消灭D2狙击手，然后移动至E2
        self:showGuideTip(self.studioPage.Button_C_2)
    elseif stepID == 42 then
        -- 我方第五回合, 引导点击D2, C2 29军大刀队攻击消灭D2狙击手，然后移动至E2
        self:showGuideTip(self.studioPage.Button_D_2)
    elseif stepID == 43 then
        -- 引导点击自己的手牌 B4位部署M3坦克
        self:showGuideTip(self.studioPage.Button_My_Card_1)
    elseif stepID == 44 then
        -- 我方第五回合, 引导点击 B4位部署M3坦克
        self:showGuideTip(self.studioPage.Button_B_4)
    elseif stepID == 45 then
        -- 我方第六回和, 引导点击B4, B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
        self:showGuideTip(self.studioPage.Button_B_4)
    elseif stepID == 46 then
        -- 我方第六回和, 引导点击A4, B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
        self:showGuideTip(self.studioPage.Button_A_4)
    elseif stepID == 47 then
        -- 我方第六回和, 引导点击D4, D4骑兵营攻占E4位大本营
        self:showGuideTip(self.studioPage.Button_D_4)
    elseif stepID == 48 then
        -- 我方第六回合, 引导点击E4, D4骑兵营攻占E4位大本营
        self:showGuideTip(self.studioPage.Button_E_4)
    end

end

function ItemStoreUI:showGuideTip(fatherNode)
    self._tipFrame:setVisible(true)
    local size = fatherNode:getContentSize()
    self._tipFrame:removeFromParent()
    fatherNode:addChild(self._tipFrame,1)
    -- self.studioPage["bottomContainer"]:addChild(self._tipFrame,1)
    self._tipFrame:setPosition(cc.p(size.width/2, size.height/2))
end

function ItemStoreUI:showDBY_inHand(fatherNode)
    -- 在手牌的这个位置显示大本营
end

-- 修改卡牌的纹理
function ItemStoreUI:changeHandCardTex(cardNod, cardID, texPath)
    if cardID and not texPath then
        texPath = "fightImgs/tableCards/"..cardID..".png"
    end
    cardNod:loadTextureNormal(texPath,0)
    cardNod:loadTexturePressed(texPath,0)
    cardNod:loadTextureDisabled(texPath,0)
end

-- 卡牌暴露了
function ItemStoreUI:openTableCards(cardID, isEnemy)
    print("ItemStoreUI:openTableCards 卡牌暴露了 cardID = "..tostring(cardID)
        .." isEnemy = "..tostring(isEnemy))
    local cardNode = self.allCardsInTable[cardID]

    if not self.openedCards[cardID] then
        self.openedCards[cardID] = true
        -- TO-DO 修改卡牌的纹理
        if string.find(cardID, "KP2") then
            -- 表示是敌方的卡牌暴露了
            local backCard = cardNode:getChildByName("backCard")
            if backCard then
                backCard:setVisible(false)
            end
        else
            -- 表示是我方的卡牌暴露了
            local upBg   = cardNode:getChildByName("upBg")
            local eyeImg = upBg:getChildByName("eye")
            if eyeImg then
                eyeImg:setVisible(true)
            end
        end
    end
end

-- 摆拍结束显示地方放的所有的牌
function ItemStoreUI:showEnemyCards()
    local function timer()
        -- 特攻队D1, 狙击小队D2, 95式坦克D3, 105mm炮D4, 13师团D5, 大本营E4
        self:addCardToTable("KP2002", "D_1", 5, true)
        self:addCardToTable("KP2006", "D_2", 5, true)
        self:addCardToTable("KP2005", "D_3", 4, true)
        self:addCardToTable("KP2004", "D_4", 3, true)
        self:addCardToTable("KP2003", "D_5", 2, true)
        self:addCardToTable("KP2000", "E_4", 1, true)

        self:showTurnTip(true)
    end
    self._tipFrame:setVisible(false)
    -- 延迟3s显示对方手牌
    scheduler.performWithDelayGlobal(timer,3, false)
end

-- 放一张手牌到牌桌上面
-- handIndex 表示是第几张手牌
-- isEnemy true 表示是敌方放牌到牌桌上
function ItemStoreUI:addCardToTable(cardID, posID, handIndex, isEnemy)
    print("ItemStoreUI:addCardToTable cardID = "..tostring(cardID).." posID = "..tostring(posID))
    local card = self.studioPage["cardKuang"]:clone()  -- ccui.ImageView:create("fightImgs/tableCards/"..cardID..".png")
    card:retain()
    
    card:setTouchEnabled(false)
    local cardImg = card:getChildByName("cardImg")
    cardImg:loadTexture("fightImgs/tableCards/"..cardID..".png")
    self.studioPage["Panel_Cards"]:addChild(card)
    card:setPosition(self.studioPage["Button_"..posID]:getPosition())

    self.allCardsInTable[cardID] = card
    self._cardsNode[cardID] = card

    -- 设置每一张卡牌各可以移动几步
    self:setMoveCount(cardID)

    -- 移除手牌
    if not isEnemy then
        if self.myHandCount >= 1 then
            print("self.myHandCount = "..tostring(self.myHandCount))
            self.studioPage["Button_My_Card_"..self.myHandCount]:setVisible(false)
            self.myHandCount = self.myHandCount - 1
        end
    else
        if self.enemyHandCount >= 1 and self.enemyHandCount <= 5 then
            print("self.enemyHandCount = "..tostring(self.enemyHandCount))
            self.studioPage["enemy_Hand_Card_"..self.enemyHandCount]:setVisible(false)
            self.enemyHandCount = self.enemyHandCount - 1
        end

        -- 敌方卡牌覆盖一个背景图片
        local backCard = ccui.ImageView:create("fightImgs/44.png")
        backCard:setName("backCard")
        self.allCardsInTable[cardID]:addChild(backCard)
        backCard:setPosition(60, 90)

        -- 地方卡牌要显示日军的旗帜在上面
        local countryImg = card:getChildByName("countryImg")
        countryImg:loadTexture("cardImgs/japan.png")
    end

    -- 第一回合日军行动结束后, 国军开始行动
    if cardID == "KP2001" then
        self:showTurnTip()
    end
end

-- 显示自己回合/敌方回合
function ItemStoreUI:showTurnTip(isEnemy)
    print("ItemStoreUI:showTurnTip isEnemy = "..tostring(isEnemy))
    
    -- 重置每一张牌的可以移动步数
    self:showAllStep()

    if not self.turnCount then
        self.turnCount = 0
    end
    self.studioPage["Panel_Turn"]:setVisible(true)
    if isEnemy then
        self.turnCount = self.turnCount + 1
        self.studioPage["Img_Turn_Img"]:loadTexture("fightImgs/yourTurnImg.png")

        local function timer()
            self.studioPage["Panel_Turn"]:setVisible(false)
            self:enemyTurn()
        end
        -- 延迟3s显示对方手牌
        scheduler.performWithDelayGlobal(timer,1.5, false)
        
    else
        self.studioPage["Img_Turn_Img"]:loadTexture("fightImgs/myTurnImg.png")
        self.studioPage["turnImg"]:loadTexture("fightImgs/turn"..self.turnCount..".png")

        local function timer()
            self.studioPage["Panel_Turn"]:setVisible(false)
            self:myTurn()
        end
        -- 延迟3s显示对方手牌
        scheduler.performWithDelayGlobal(timer,1.5, false)
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
        scheduler.performWithDelayGlobal(timer,1, false)
 
        local function finc1( ... )
            -- 侦察小队部署于D5
            self:addCardToTable("KP2001", "D_5", 1, true)
        end
        -- D5位置13师团移动至C4位, 回调函数里面部署D5
        self:moveTableCard(2.5, "KP2003", "D_5", "C_4", finc1)
    elseif self.turnCount == 2 then
        -- 敌方抓一张手牌
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟1s 抓手牌
        scheduler.performWithDelayGlobal(timer,1, false)

        local function finc1( ... )
            local function finc2( ... )
                local function finc3( ... )
                    self:showTurnTip()
                end
                -- D4位105mm炮远程攻击C3机枪阵地并将其消灭, 消灭后要进到这个位置
                self:attack(0.5, "KP2004", "KP1009", "D_4", "C_3", finc3, 0, nil, true)
            end
            -- C4位13师团进攻并消灭C5侦察排后，再回防C4位
            self:attack(0.5, "KP2003", "KP1001", "C_4", "C_5", finc2, 0, nil, true)
        end
        -- D3位95式坦克进攻C3位机枪阵地
        self:attack(1.5, "KP2005", "KP1009", "D_3", "C_3", finc1, 1, nil, false)
    elseif self.turnCount == 3 then
        -- 敌方第三回合
        --[[
            A.D3位95式坦克进攻B3远征军
                1)95式坦克-2剩3血  B3远征军-3剩8血。
            B.C4位13师团进攻B4位，触雷被炸停1回合，
                1)13师团-1剩3血。
            D1特攻队移动至B1。
        ]]
        -- 敌方抓一张手牌
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟1s 抓手牌
        scheduler.performWithDelayGlobal(timer,1, false)

        local function finc1( ... )
            local function finc2( ... )
                local function finc3( ... )
                    local function finc4( ... )
                        -- 轮到我放第三回合
                        self:showTurnTip()
                    end
                    -- D1特攻队移动至B1
                    self:moveTableCard(0.5, "KP2002", "D_1", "B_1", finc4)
                end
                -- 13师团停在B4
                self:moveTableCard(0.5, "KP2003", "C_4", "B_4", finc3)
            end
            -- C4位13师团进攻B4位，触雷被炸停1回合，13师团-1剩3血。
            self:attack(0.5, "KP2003", "KP1010", "C_4", "B_4", finc2, 0, 3, true)
        end
        -- D3位95式坦克进攻B3远征军
        self:attack(1.5, "KP2005", "KP1003", "D_3", "B_3", finc1, 8, 3, false)
    elseif self.turnCount == 4 then
        -- 敌方第四回合
        --[[
            A.B1特攻队移动至A2。
            B.D4位105mm炮远程攻击远征军
            1.远征军-5剩3血
            C.D2狙击手狙击消灭C4工兵连。
            1)工兵连-1死亡
        ]]
        -- 敌方抓一张手牌
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟1s 抓手牌
        scheduler.performWithDelayGlobal(timer,1, false)

        local function finc1( ... )
            local function finc2( ... )
                local function finc3( ... )
                    -- 轮到我放第四回合
                    self:showTurnTip()
                end
                -- D2狙击手狙击消灭C4工兵连。
                self:attack(0.5, "KP2006", "KP1006", "D_2", "C_4", finc3, 0, nil, true)
            end
            -- D4位105mm炮远程攻击B3远征军
            self:attack(0.5, "KP2004", "KP1003", "D_4", "B_3", finc2, 3, nil, false)
        end
        -- B1特攻队移动至A2。
        self:moveTableCard(0.5, "KP2002", "B_1", "A_2", finc1)
    elseif self.turnCount == 5 then
        -- 敌方第五回合
        --[[
            A.  D2狙击手狙击牵制住了D4骑兵营
            1)  骑兵营-1剩2血。
            B.  D5侦察小队移动至B5
            C.  骑兵小队从D5突击行至A5。

        ]]
        -- 敌方抓一张手牌
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟1s 抓手牌
        scheduler.performWithDelayGlobal(timer,1, false)

        local function finc1( ... )
            local function finc2( ... )
                self:addCardToTable("KP2007", "D_5", 1, true)
                local function finc3( ... )
                    -- 轮到我放第四回合
                    self:showTurnTip()
                end
                -- 骑兵小队从D5突击行至A5
                self:moveTableCard(0.5, "KP2007", "D_5", "A_5", finc3)
            end
            -- D5侦察小队移动至B5
            self:moveTableCard(0.5, "KP2001", "D_5", "B_5", finc2)
        end
        -- D2狙击手狙击牵制住了D4骑兵营
        self:juJi(0.5, "KP2006", "KP1008", "D_2", "D_4", finc1, 2, nil, false)
    elseif self.turnCount == 6 then
        -- 敌方第六回合
        --[[
            A.A5骑兵小队消灭A4位105mm炮。
            1)105mm炮-4死亡
            B.B5侦察小队进攻B4位的M3斯图亚特坦克被消灭。
            1)侦察小队-4死亡。M3坦克-1留4
            C.E3部署机枪阵地。

        ]]
        -- 敌方抓一张手牌
        local function timer()
            self:addCardToHand("KP2001", true)
        end
        -- 延迟1s 抓手牌
        scheduler.performWithDelayGlobal(timer,1, false)

        local function finc1( ... )
            local function finc2( ... )
                local function finc3( ... )
                    -- E3部署机枪阵地
                    self:addCardToTable("KP2009", "E_3", 1, true)
                    local function finc4()
                        -- 轮到我放第六回合
                        self:showTurnTip()
                    end
                    -- 延迟1s 抓手牌
                    scheduler.performWithDelayGlobal(finc4,1, false)
                end
                -- B5侦察小队进攻B4位的M3斯图亚特坦克被消灭
                self:attack(0.5, "KP2001", "KP1004", "B_5", "B_4", finc3, 4, 0, false)
            end

            -- A5骑兵移动到A4位
            self:moveTableCard(0.5, "KP2007", "A_5", "A_4", finc2)
        end
        -- A5骑兵小队消灭A4位105mm炮。
        self:attack(0.5, "KP2007", "KP1005", "A_5", "A_4", finc1, 0, nil, true)
    end
end

-- 轮到自己操作
function ItemStoreUI:myTurn( ... )
    self._tipFrame:setVisible(true)
    if self.turnCount == 1 then
        self:addCardToHand("KP1009")
        -- 引导玩家点击B5侦察排, 侦察C4位置的单位（暴露13师团），然后移动至C5
        self:doStep(14)
    elseif self.turnCount == 2 then
        -- 我方第二回合
        --[[
        1.我方/敌方回合 文字闪过屏幕
        2.屏幕中出现一张牌，显示为工兵连，进入我方卡牌中
        3.行动：
            A.A4位105mm炮远程攻击C4位13师团（-5剩4血）。
            1)13师团-5血剩4血）
            B.部署工兵连于B5。 
        4.回合结束
        ]]
        self:addCardToHand("KP1006")
        -- 引导玩家点击A4位105mm炮远程攻击C4位13师团（-5剩4血）。
        self:doStep(21)
    elseif self.turnCount == 3 then
        -- 我方第三回合
        --[[
        2.狙击队进入我方卡牌中
        3.行动：
        A.A4位105炮远程攻击C3位95式坦克，并将其击毁。
        1)95式坦克-5点血
        B.B5工兵连移动至C4位。
        C.狙击队部署于B2
        ]]
        self:addCardToHand("KP1007")
        -- 引导玩家点击A4位105炮远程攻击C3位95式坦克，并将其击毁。
        self:doStep(25)
    elseif self.turnCount == 4 then
        -- 我方第四回合
        --[[
        2.骑兵队，进入我方卡牌中
        3.行动：
        A.B2狙击队狙击牵制A2特攻队
        1)特攻队-1剩3血。
        B.A4位105mm炮远程攻击消灭B4位13师团。
        1)13师团-5死亡
        C.C4位部署骑兵营，突击消灭D4位105mm炮，并坚守该位。
        1)105mm炮-4死亡
        ]]
        self:addCardToHand("KP1008")
        -- B2狙击队狙击牵制A2特攻队
        self:doStep(31)
    elseif self.turnCount == 5 then
        -- 我方第五回合
        --[[
            A.  B2狙击队继续狙击牵制A2特攻队
            1)  特攻队-1剩2血。
            B.  29军大刀队攻击消灭D2狙击手，然后移动至E2。
            1)  狙击手-3死亡
            C.  B4位部署M3坦克。
        ]]
        self:addCardToHand("KP1004")
        -- 引导点击B2狙击队, B2狙击队继续狙击牵制A2特攻队
        self:doStep(39)
    elseif self.turnCount == 6 then
        -- 我方第六回合
        --[[
            A.B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
            1)骑兵小队-4死亡
            B.D4骑兵营攻占E4位大本营。
            1)大本营-1爆炸
        ]]
        -- B4位M3坦克碾压消灭A4骑兵小队，然后前进至C4。
        self:doStep(45)
    end
end

function ItemStoreUI:addCardToHand(cardID, isEnemy)
    print("ItemStoreUI:addCardToHand cardID = "..tostring(cardID)
        .." isEnemy = "..tostring(isEnemy))
    if not isEnemy then
        print("self.myHandCount = "..tostring(self.myHandCount))
        self.myHandCount = self.myHandCount + 1
        self.studioPage["Button_My_Card_"..self.myHandCount]:setVisible(true)
        -- self:changeHandCardTex(self.studioPage["Button_My_Card_"..self.myHandCount], cardID)

    else
        print("self.enemyHandCount = "..tostring(self.enemyHandCount))
        self.enemyHandCount = self.enemyHandCount + 1
        self.studioPage["enemy_Hand_Card_"..self.enemyHandCount]:setVisible(true)
    end

end

-- 延迟几秒把敌方的卡片移动到目标位置
function ItemStoreUI:moveTableCard(delayTime, cardID, nowPos, toPos, callFunc)
    print("ItemStoreUI:moveTableCard cardID = "..tostring(cardID).." nowPos = "
        ..tostring(nowPos).." toPos = "..tostring(toPos))
    dump(self.allCardsInTable, "dump self.allCardsInTable")
    local cardNode = self.allCardsInTable[cardID]
    cardNode:setLocalZOrder(2)

    -- 显示可以移动的步数
    self:calMoveCount(cardNode)

    local x,y = cardNode:getPosition()
    print("nowPos x = "..tostring(x).." y = "..tostring(y))
    if not self._enemyMoveIndex then
        self._enemyMoveIndex = 1
    end

    local act1 = cc.DelayTime:create(delayTime)
    local function finc1( ... )
        cardNode:setLocalZOrder(1)
        if callFunc then
            callFunc()
        end
    end
    local act2 = cc.CallFunc:create(finc1)
    local x,y = self.studioPage["Button_"..toPos]:getPosition()
    print("toPos x = "..tostring(x).." y = "..tostring(y))
    local moveAction = cc.MoveTo:create(0.5, cc.p(x, y))
    local seq  = cc.Sequence:create( act1, moveAction, act2)
    cardNode:runAction(seq)
    self._enemyMoveIndex = self._enemyMoveIndex + 1
end

-- bDead true表示被攻击的卡牌直接打死了
-- leftBlood 表示被攻击的卡牌还剩多少血
-- myLeftBlood 表示攻击的卡牌还剩多少血, nil表示这次攻击没扣
function ItemStoreUI:attack(delayTime, fromID, attID, fromPos, attPos, callFunc, leftBlood, myLeftBlood, bDead)
    print("ItemStoreUI:attack fromID = "..tostring(fromID)
        .." attID = "..tostring(attID)
        .." fromPos = "..tostring(fromPos)
        .." attPos = "..tostring(attPos)
        .." bDead = "..tostring(bDead))
    -- 攻击和被攻击的卡牌都要暴露出来
    self:openTableCards(fromID)
    self:openTableCards(attID)

    local fromNode = self.allCardsInTable[fromID]
    fromNode:setLocalZOrder(2)
    -- 显示可以移动的步数
    self:calMoveCount(fromNode)
    local x,y = fromNode:getPosition()

    local act1 = cc.DelayTime:create(delayTime)

    local function finc1( ... )
        self:playAttackedAni(attID, bDead)
        
        -- 发动攻击的卡片更新血量显示
        local upBg = self.allCardsInTable[fromID]:getChildByName("upBg")
        local xueTiaoFrom = upBg:getChildByName("xueTiao_progress")
        if myLeftBlood then
            xueTiaoFrom:setPercent(myLeftBlood/self.allCardsInTable[fromID].allBlood * 100)
        end
        -- 被攻击的卡片更新血量显示
        local upBg = self.allCardsInTable[attID]:getChildByName("upBg")
        local xueTiaoBeAtt = upBg:getChildByName("xueTiao_progress")
        if leftBlood then
            xueTiaoBeAtt:setPercent(leftBlood/self.allCardsInTable[attID].allBlood * 100)
        end

	-- 发起攻击的卡片自己被消灭了
        if myLeftBlood and myLeftBlood == 0 then
            local fromNode = self.allCardsInTable[fromID]
            fromNode:setVisible(false)
        end
    end
    local act2 = cc.CallFunc:create(finc1)
    

    local function finc2( ... )
        fromNode:setLocalZOrder(1)
        if callFunc then
            callFunc()
        end
    end
    local act3 = cc.CallFunc:create(finc2)
    local toX, toY = self.allCardsInTable[attID]:getPosition()
    print("toPos x = "..tostring(x).." y = "..tostring(y))
    local moveAction1 = cc.MoveTo:create(0.5, cc.p(toX, toY))
    local moveAction2 = cc.MoveTo:create(0.5, cc.p(x, y))

    local seq  = cc.Sequence:create(act1, moveAction1, act2, moveAction2, act3)
    fromNode:runAction(seq)
end

-- 狙击
function ItemStoreUI:juJi(delayTime, fromID, attID, fromPos, attPos, callFunc, leftBlood, bDead)
    print("ItemStoreUI:juJi fromID = "..tostring(fromID)
        .." attID = "..tostring(attID)
        .." fromPos = "..tostring(fromPos)
        .." attPos = "..tostring(attPos))

    -- 被狙击的卡牌要暴露出来
    self:openTableCards(attID)

    local fromNode = self.allCardsInTable[fromID]
    fromNode:setLocalZOrder(2)

    -- 显示可以移动的步数
    self:calMoveCount(fromNode)


    local x,y = fromNode:getPosition()

    local act1 = cc.DelayTime:create(delayTime)

    local function finc1( ... )
        self:playAttackedAni(attID, bDead)
    end
    local act2 = cc.CallFunc:create(finc1)
    

    local function finc2( ... )
        fromNode:setLocalZOrder(1)
        if callFunc then
            callFunc()
        end
    end
    local act3 = cc.CallFunc:create(finc2)
    local toX, toY = self.allCardsInTable[attID]:getPosition()
    print("toPos x = "..tostring(x).." y = "..tostring(y))
    local moveAction1 = cc.MoveTo:create(0.5, cc.p(toX, toY))
    local moveAction2 = cc.MoveTo:create(0.5, cc.p(x, y))

    local seq  = cc.Sequence:create(act1, moveAction1, act2, moveAction2, act3)
    fromNode:runAction(seq)
end

-- 播放被攻击的动画
function ItemStoreUI:playAttackedAni(cardID, bDead)
    print("ItemStoreUI:playAttackedAni 播放被攻击的动画 cardID = "
        ..tostring(cardID).." bDead = "..tostring(bDead))
    if bDead then
        self.allCardsInTable[cardID]:setVisible(false)
    end 
end

function ItemStoreUI:setMoveCount(cardID)
    if cardID == "KP1000" or cardID == "KP1009" or cardID == "KP1010"
        or cardID == "KP2000" or cardID == "KP2009" or cardID == "KP2010" then
        self.allCardsInTable[cardID].cardMoveCount = 0
        self.allCardsInTable[cardID].canMoveCount = 0

    elseif cardID == "KP1005" or cardID == "KP2004" then
        self.allCardsInTable[cardID].cardMoveCount = 1
        self.allCardsInTable[cardID].canMoveCount = 1

    elseif cardID == "KP1001" or cardID == "KP1002" or cardID == "KP1003"
        or cardID == "KP1006" or cardID == "KP1007" or cardID == "KP2001"
        or cardID == "KP2002" or cardID == "KP2003" or cardID == "KP2006"
        or cardID == "KP2008" then
        self.allCardsInTable[cardID].cardMoveCount = 2
        self.allCardsInTable[cardID].canMoveCount = 2

    elseif cardID == "KP1004" or cardID == "KP1008" or cardID == "KP2005"
        or cardID == "KP2007"  then
        self.allCardsInTable[cardID].cardMoveCount = 3
        self.allCardsInTable[cardID].canMoveCount = 3
    end

    print("ItemStoreUI:setMoveCount cardID = "..tostring(cardID)
        .." self.allCardsInTable[cardID].cardMoveCount = "..tostring(self.allCardsInTable[cardID].cardMoveCount))
    for i = 1, 3 do
        print("i = "..tostring(i))
        local bottomBg = self.allCardsInTable[cardID]:getChildByName("bottomBg")
        local moveImg = bottomBg:getChildByName("move_"..i)
        if i <= self.allCardsInTable[cardID].cardMoveCount then
            moveImg:setVisible(true)
        else
            moveImg:setVisible(false)
        end
    end

    -- 配置血量
    if cardID == "KP1000" then
        self.allCardsInTable[cardID].allBlood = 0
    elseif cardID == "KP1001" then
        self.allCardsInTable[cardID].allBlood = 3
    elseif cardID == "KP1002" then
        self.allCardsInTable[cardID].allBlood = 4
    elseif cardID == "KP1003" then
        self.allCardsInTable[cardID].allBlood = 11
    elseif cardID == "KP1004" then
        self.allCardsInTable[cardID].allBlood = 5
    elseif cardID == "KP1005" then
        self.allCardsInTable[cardID].allBlood = 1
    elseif cardID == "KP1006" then
        self.allCardsInTable[cardID].allBlood = 1
    elseif cardID == "KP1007" then
        self.allCardsInTable[cardID].allBlood = 3
    elseif cardID == "KP1008" then
        self.allCardsInTable[cardID].allBlood = 3
    elseif cardID == "KP1009" then
        self.allCardsInTable[cardID].allBlood = 4
    elseif cardID == "KP1010" then
        self.allCardsInTable[cardID].allBlood = 0

    elseif cardID == "KP2000" then
        self.allCardsInTable[cardID].allBlood = 0
    elseif cardID == "KP2001" then
        self.allCardsInTable[cardID].allBlood = 2
    elseif cardID == "KP2002" then
        self.allCardsInTable[cardID].allBlood = 2
    elseif cardID == "KP2003" then
        self.allCardsInTable[cardID].allBlood = 2
    elseif cardID == "KP2004" then
        self.allCardsInTable[cardID].allBlood = 1
    elseif cardID == "KP2005" then
        self.allCardsInTable[cardID].allBlood = 3
    elseif cardID == "KP2006" then
        self.allCardsInTable[cardID].allBlood = 2
    elseif cardID == "KP2007" then
        self.allCardsInTable[cardID].allBlood = 3
    elseif cardID == "KP2008" then
        self.allCardsInTable[cardID].allBlood = 2
    elseif cardID == "KP2009" then
        self.allCardsInTable[cardID].allBlood = 0
    elseif cardID == "KP2010" then
        self.allCardsInTable[cardID].allBlood = 0
    end    

end

-- 显示可以移动的步数
function ItemStoreUI:calMoveCount(cardNode)
    cardNode.canMoveCount = cardNode.canMoveCount - 1
    for i = 1, 3 do
        local bottomBg = cardNode:getChildByName("bottomBg")
        local moveImg = bottomBg:getChildByName("move_"..i)
        if i <= cardNode.canMoveCount then
            moveImg:setVisible(true)
        else
            moveImg:setVisible(false)
        end
    end
end

-- 每一局开始, 所有的卡牌上面的移动力都会满的
function ItemStoreUI:showAllStep( ... )
    for k,v in pairs(self.allCardsInTable) do
        for i = 1, 3 do
            local bottomBg = v:getChildByName("bottomBg")
            local moveImg = bottomBg:getChildByName("move_"..i)

            if i <= v.cardMoveCount then
                moveImg:setVisible(true)
                v.canMoveCount = i
            else
                moveImg:setVisible(false)
            end
        end
    end
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