

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

    -- NotifyCenter.register(EventNames.REFRUSH_WORLDHALL, handler(self, self.updateData), itemStoreStudio)

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
            elseif name == "Button_hero" then
                if not self.heroHome then
                    local heroHomeStudio = HeroHomePanelTest.new()
                    local page = heroHomeStudio:getPage()
                    self.page:addChild(page)
                    self.heroHome = chooseMode
                    if self.m_ClipNode then
                        self.m_ClipNode:removeFromParent()
                        self.m_ClipNode = nil
                    end
                else
                    self.heroHome:setVisible(true)
                end
            elseif name == "Button_icon" then
                if not self.heroHome then
                    viewMgr.show(viewMgr.def.HANDBOOK_UI)
                else
                    self.heroHome:setVisible(true)
                end
            elseif name == "Button_item" then
                -- 点击了道具商店按钮
                viewMgr.show(viewMgr.def.ITEMSTORE_UI)
                if self.m_ClipNode then
                    self.m_ClipNode:removeFromParent(true)
                    self.m_ClipNode = nil
                end
                local finger = self.Button_item:getChildByName("finger_1")
                if finger then
                    finger:removeFromParent(true)
                    finger = nil
                end
            elseif name == "Button_jigsaw" then
                -- 点击了道具商店按钮
                -- 如果有对话框的话，需要把对话框隐藏掉
                if self.Button_jigsaw.dialog then
                    self.Button_jigsaw.dialog:removeSelf()
                    self.Button_jigsaw.dialog = nil
                end
                -- 根据第六关模式1有没有通关来判定是显示拼图页面，还是模式解锁页面
                local lv6Star = GlobalData.getLvStar(6)
                if lv6Star[1][1] == 0 and lv6Star[1][2] == 0 then
                    viewMgr.show(viewMgr.def.JIGSAW_UI)
                else
                    viewMgr.show(viewMgr.def.OPENMODE_UI)
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

    if stepID == 2 then
        -- 在B2位置显示提示按钮
        local btn = self.studioPage.Button_B_2
        local size = btn:getContentSize()
        self._tipFrame:setPosition(cc.p(size.width/2,size.height/2))
        self._tipFrame:removeFromParent()
        btn:addChild(self._tipFrame,1)
    end

end

-- 记录所有的控件
function ItemStoreUI:getAllElemets()
    -- -- 关闭按钮
    -- local closeBtn  = self.studioPage["closeBtn"]
    -- closeBtn:addClickEventListener(function (params )
    --     if self.finc then
    --         self.finc()
    --     end

    --     -- 显示了第三关完成了点击道具商店的指引之后，就需要把新通关的关卡由 3 置为0
    --     if GlobalData.getNewThroughLv() == 3 then
    --         GlobalData.setNewThroughLv(0)
    --         -- 友盟统计，新手引导第四步已经结束了
    --         umengSdk.setLevelStart(umengSdk.newGuide.guide04,1)
    --         umengSdk.setLevelStart(umengSdk.newGuide.guide04,2)
    --     end

    --     AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
    --     viewMgr.hide(viewMgr.def.ITEMSTORE_UI)
    -- end)

    -- -- 获得钻石按钮
    -- local diamondBtn = self.studioPage["diamondBtn"]
    -- diamondBtn:addClickEventListener(function (params )
    --     AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
    --     viewMgr.show(viewMgr.def.STORE_UI)
    -- end)


end

-- 生成3个道具技能的描述
function ItemStoreUI:dealSkillExplan()

    self.richTexts = {}
    for i = 1, 3 do
        local skillConfig = RMBSkillProperties.get("710"..tostring(i).."01")

        self.itemSkillName:setString(skillConfig.name)

        self.richTexts[i] = ccui.RichText:create()
        -- self.richTexts[i]:setOutLine(cc.c4b(0,0,0,255),2)
        self.richTexts[i]:setContentSize(cc.size(220,90))
        self.richTexts[i]:ignoreContentAdaptWithSize(false)
        self.richTexts[i]:setPosition(cc.p(0, 20))
        self.itemExplanLab:addChild(self.richTexts[i])

        local text = string.split(skillConfig.skillText,"$")
        local re1 = nil
        for j = 1,#text do
            if j % 2 == 0 or text[j] == "-" then
                -- 绿色
                -- re1 = ccui.RichElementText:create(j, cc.c3b(188, 231, 53), 255,text[j],GLOBAL_FONTNAME,24)
                -- 红色
                re1 = ccui.RichElementText:create(j, cc.c3b(156, 0, 0), 255,text[j],GLOBAL_FONTNAME,24)
            else
                -- 咖啡色
                re1 = ccui.RichElementText:create(j, cc.c3b(72, 49, 30), 255,text[j],GLOBAL_FONTNAME,24)
            end
            self.richTexts[i]:pushBackElement(re1)
        end
    end
end
function ItemStoreUI:updateData()
    self.itemCountLabs[1]:setString(GlobalData.getSkillItemsCount(1))
    self.itemCountLabs[2]:setString(GlobalData.getSkillItemsCount(2))
    self.itemCountLabs[3]:setString(GlobalData.getSkillItemsCount(3))

    -- 更新当前的钻石数量
    self.allHasDiamondLab:setString(GlobalData.getDiamondCount())
end

-- 点击道具按钮
function ItemStoreUI:onClickItemBtn(itemIndex)
    print("ItemStoreUI:onClickItemBtn itemIndex = "..tostring(itemIndex))
    local skillConfig = RMBSkillProperties.get("710"..tostring(itemIndex).."01")

    self.itemSkillName:setString(skillConfig.name)

    -- 更新右边显示的item道具的icon
    self.right_itemIcon:loadTexture("ui/Icons/rmbSkillIcon/710"..tostring(itemIndex).."01.png")

    self.itemExplanLab:setString("")
    -- 显示对应的道具技能描述
    for i = 1, 3 do
        if i == itemIndex then
            self.richTexts[i]:setVisible(true)
            self.itemBtns[i]:loadTextureNormal("ui/Icons/rmbSkillIcon/"
                .."710"..tostring(i).."01_off.png", 0)
        else
            self.richTexts[i]:setVisible(false)
            self.itemBtns[i]:loadTextureNormal("ui/Icons/rmbSkillIcon/"
                .."710"..tostring(i).."01.png", 0)
        end
    end

    -- 购买这个道具需要多少钻石
    self.needDiamondCount = skillConfig.powerCost[2]
    -- 当前选中的是第几个道具
    self.curItemIndex = itemIndex
end

-- 点击购买按钮
function ItemStoreUI:onClickBuy()
    print("ItemStoreUI:onClickItemBtn")

    if self.needDiamondCount > GlobalData.getDiamondCount() then
        -- 钻石不够，显示购买钻石页面
        viewMgr.show(viewMgr.def.STORE_UI,func)
    else
        GlobalData.addDiamondCount(0 - self.needDiamondCount)
        GlobalData.changeSkillItemsCount(self.curItemIndex, 1)

        -- 买了这个item，左侧的icon需要缩放一下
        if not self.isIconInActions[self.curItemIndex] then
            self.isIconInActions[self.curItemIndex] = true
            local scale = self.itemIcons[self.curItemIndex]:getScale()
            local scaleto1 = cc.ScaleTo:create(0.2, 1.2*scale) -- 0.5, 1.5)
            local scaleto2 = cc.ScaleTo:create(0.2, 1.0*scale) -- 0.5,1.3)
            local function finc( ... )
                self.isIconInActions[self.curItemIndex] = false
            end
            local act3 = cc.CallFunc:create(finc)
            local squence = cc.Sequence:create(scaleto1,scaleto2,act3)
            self.itemIcons[self.curItemIndex]:runAction(squence)
        end

        -- 发信号出去刷新页面
        NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)

        -- 飘一个往上的tips
        utils.createAniFont(WordLanguage.SucceeBuyItem,self.studioNode)
    end
end


-- 获得node页面
function ItemStoreUI:getPage()
    print("ItemStoreUI:getPage()")
    return self.studioNode
end

return ItemStoreUI