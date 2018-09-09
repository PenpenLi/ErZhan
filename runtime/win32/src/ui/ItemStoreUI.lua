

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
    -- 关闭页面的回调函数
    self.finc = finc
    -- 需要默认选中第几个道具
    self.itemIndex = itemIndex

    self.studioPage = import("ui.FightNode").create()
    local itemStoreStudio = self.studioPage.root
    
    print("ItemStoreUI:ctor 1")
    -- --local path = utils.getName("sdfdf")
    -- itemStoreStudio:setTouchEnabled(true)
    -- itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    -- self.studioNode.onEnter = self:onEnter()

    -- -- 获得Studio中的所有控件
    self:getAllElemets()

    -- NotifyCenter.register(EventNames.REFRUSH_WORLDHALL, handler(self, self.updateData), itemStoreStudio)

    -- 做适配动画
    -- local panel = self.studioPage["bgBottom"]
    -- utils.playAction(self.studioNode, panel)
    print("ItemStoreUI:ctor 3")
end

function ItemStoreUI:onEnter()
    
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