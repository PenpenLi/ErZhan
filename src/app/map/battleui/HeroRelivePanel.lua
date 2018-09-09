
-- 英雄复活确认页面
local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local TowerSkillDetailPanel   = require("app.map.battleui.TowerSkillDetailPanel")
local StableGameProperties    = require("app.properties.StableGameProperties")
local GlobalData              = require("tools.GlobalData")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local EffectAniCache          = require("app.map.spine.EffectAniCache")

local HeroRelivePanel = class("HeroRelivePanel", function()
    return display.newNode()
end)


function HeroRelivePanel:ctor(battleui, hero, isGuide)

    self.battleui = battleui
    -- 记录玩家想要复活的英雄
    self.hero     = hero

    -- 记录一下是不是英雄复活引导
    self.isGuide = isGuide

	self:setContentSize(cc.size(display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setTouchEnabled(true)

    -- -- 在地图放大了的屏幕上，战斗UI需要放大显示
    -- if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    --     self:setScale(GLOBAL_FIGHT_UI_SCALE)
    -- end

    self:createView()
	-- self:setVisible(false)  
end

-- 创建控件
function HeroRelivePanel:createView()
    -- 显示这个页面的时候，需要把游戏暂停
    self.battleui.rt:pausePlay()

        -- 获得玩家通过钻石复活了几次英雄
    local reliveCount = BattleDataManager:getHeroDiamonReliveCount()
    -- 下一次复活的index
    reliveCount = reliveCount + 1

    -- 获得以下钻石消耗总共设定了几个等级
    local maxIndex = #StableGameProperties.HERO_RELIVE_NEED_DIAMOND
    if reliveCount > maxIndex then
        reliveCount = maxIndex
    end

    -- 获得本次复活需要消耗的钻石数量
    self.needDiamondCount = StableGameProperties.HERO_RELIVE_NEED_DIAMOND[reliveCount]
    -- print("本次复活需要消耗的钻石数量 self.needDiamondCount = "
    --     ..tostring(self.needDiamondCount))

    local tempsprite = display.newSprite("ui/fight/heroRelive/bg.png")
        :addTo(self)
        :pos(display.cx, display.cy)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        tempsprite:setScale(GLOBAL_FIGHT_UI_SCALE)
    end


    -- 消耗钻石立即复活的文字
    self.richText = ccui.RichText:create()
    self.richText:setOutLine(cc.c4b(0,0,0,255),3)
    self.richText:setContentSize(cc.size(420,90))
    self.richText:ignoreContentAdaptWithSize(false)
    -- self.richText:setPosition(display.cx + 30, display.cy + 50)
    -- self:addChild(self.richText)
    self.richText:setPosition(546/2 + 30, 197/2 + 30)
    tempsprite:addChild(self.richText)

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255,
        WordLanguage.Cost,GLOBAL_FONTNAME, 35)
    self.richText:pushBackElement(re1)

    local re2 = ccui.RichElementImage:create(2,
        cc.c3b(255, 255, 255), 255, "ui/store/diamond.png")
    self.richText:pushBackElement(re2)

    local re3 = ccui.RichElementText:create(3, cc.c3b(252, 255, 0), 255,
        self.needDiamondCount, GLOBAL_FONTNAME, 42)
    self.richText:pushBackElement(re3)

    local re4 = ccui.RichElementText:create(3, cc.c3b(255, 255, 255), 255,
        WordLanguage.ReliveImmediately, GLOBAL_FONTNAME, 35)
    self.richText:pushBackElement(re4)


    -------------------------------- 确认按钮 --------------------------------
    local confirmBtn = cc.ui.UIPushButton.new({normal = "ui/fight/heroRelive/btn.png",
        pressed = "ui/fight/heroRelive/btn_on.png",
        disabled = "ui/fight/heroRelive/btn_on.png"})
        :onButtonClicked(function(...)
            -- print("游戏中点击暂停按钮")
            self:onClickConfirm()
        end)
        :addTo(tempsprite)
        :pos(190, 60)
        -- :scale(GLOBAL_FIGHT_UI_SCALE)

    -- 确认文字
    local confirmLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.Confirm,
        font = GLOBAL_FONTNAME,
        size = 28,
        -- x = diffX - 10,
        -- y = diffY,
    }):align(display.CENTER)
    confirmBtn:setButtonLabel("normal", confirmLabel)
    confirmLabel:enableOutline(cc.c4b(0, 0,0,255), 1)


    -------------------------------- 取消按钮 --------------------------------
    local cancelBtn = cc.ui.UIPushButton.new({normal = "ui/fight/heroRelive/btn2.png",
        pressed = "ui/fight/heroRelive/btn2_on.png",
        disabled = "ui/fight/heroRelive/btn2_on.png"})
        :onButtonClicked(function(...)
            self.battleui.rt:resumePlay()
            self:removeSelf()
        end)
        :addTo(tempsprite)
        :pos(370, 60)
        -- :scale(GLOBAL_FIGHT_UI_SCALE)

    -- 取消文字
    local cancelLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.Cancel,
        font = GLOBAL_FONTNAME,
        size = 28,
        -- x = diffX - 10,
        -- y = diffY,
    }):align(display.CENTER)
    cancelBtn:setButtonLabel("normal", cancelLabel)
    confirmLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

    -- add by Owen, 2016.7.15, 如果是英雄复活引导，则在“确认”按钮上添加一个手指动画，
    -- 取消按钮变为不可点击
    if self.isGuide then
        self.finger = EffectAniCache.getEffectAniCache("Finger", true)
        confirmBtn:addChild(self.finger)
        self.finger:setPosition(0, 0)

        cancelBtn:setTouchEnabled(false)
    else
        cancelBtn:setTouchEnabled(true)
    end

end

-- 游戏中点击复活的确认按钮
function HeroRelivePanel:onClickConfirm()

    -- add by Owen, 2016.7.15, 如果是英雄复活引导，不消耗钻石直接复活
    if self.isGuide then
        -- 标记已经执行过一次英雄复活引导了
        GlobalData.setHasShowReliveGuide()

        if self.finger then
            self.finger:removeSelf()
            self.finger = nil
        end

        -- 直接把这个英雄复活
        local tombs = self.battleui.rt.tombs
        -- print("self.hero.mainID_ = "..tostring(self.hero.mainID_))
        for i, v in ipairs(tombs) do
            -- print("v.mainID = "..tostring(v.mainID))
            if v.mainID == self.hero.mainID_ then
                -- 把墓碑倒计时置为0
                v.reviveTime = 0

                -- 显示 “太棒啦！获得50钻石奖励”
                self:showAwardTips()

                self.battleui.rt:resumePlay()
                self:removeSelf()
                return
            end
        end
    end

    -- 如果钻石不够，那么就显示钻石购买页面
    if GlobalData.getDiamondCount() < self.needDiamondCount then
        local function func( ... )
            -- self.rt:resumePlay()
        end
        viewMgr.show(viewMgr.def.STORE_UI, func)
    else
        -- 直接把这个英雄复活
        local tombs = self.battleui.rt.tombs
        -- print("self.hero.mainID_ = "..tostring(self.hero.mainID_))
        for i, v in ipairs(tombs) do
            -- print("v.mainID = "..tostring(v.mainID))
            if v.mainID == self.hero.mainID_ then
                -- 把墓碑倒计时置为0
                v.reviveTime = 0
                -- 消耗钻石
                GlobalData.addDiamondCount(0 - self.needDiamondCount)
                -- 发信号出去战斗UI更新钻石数量
                NotifyCenter.notify(EventNames.UI_UPDATE_DIAMOND_COUNT)
                
                -- 记录消耗钻石复活的次数
                BattleDataManager:addHeroDiamonReliveCount()
                -- 继续游戏
                self.battleui.rt:resumePlay()
                self:removeSelf()
                break
            end
        end
    end

end

-- add by Owen, 2016.7.15, -- 显示 “太棒啦！获得50钻石奖励”
function HeroRelivePanel:showAwardTips()

    -- 英雄复活引导，奖励的钻石数量
    local awardDiamondCount = 50
    -- 给玩家增加钻石
    GlobalData.addDiamondCount(awardDiamondCount)
    -- 发信号出去战斗UI更新钻石数量
    NotifyCenter.notify(EventNames.UI_UPDATE_DIAMOND_COUNT)

    local bg = display.newSprite("ui/fight/objectDetail/objectDetailBg.png")
        :addTo(self.battleui)
        :pos(display.cx, display.cy)
        :setScale(GLOBAL_FIGHT_UI_SCALE)

    -- “太棒啦！获得50钻石奖励”
    self.richText = ccui.RichText:create()
    self.richText:setOutLine(cc.c4b(0,0,0,255),3)
    self.richText:setContentSize(cc.size(520,90))
    self.richText:ignoreContentAdaptWithSize(false)
    -- self.richText:setPosition(display.cx + 30, display.cy + 50)
    -- self:addChild(self.richText)
    self.richText:setPosition(636/2, 78/2 - 5)
    bg:addChild(self.richText)

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255,
        "完成指引，获得奖励", GLOBAL_FONTNAME, 36)
    self.richText:pushBackElement(re1)

    local re2 = ccui.RichElementText:create(3, cc.c3b(252, 255, 0), 255,
        awardDiamondCount, GLOBAL_FONTNAME, 36)
    self.richText:pushBackElement(re2)

    local re3 = ccui.RichElementImage:create(2,
        cc.c3b(255, 255, 255), 255, "ui/store/diamond.png")
    self.richText:pushBackElement(re3)

    -- local re4 = ccui.RichElementText:create(3, cc.c3b(252, 255, 255), 255,
    --     "奖励", GLOBAL_FONTNAME, 36)
    -- self.richText:pushBackElement(re4)


    -- 跑一个向上飘的action
    local move = cc.MoveBy:create(2,cc.p(0,50))
    local function later()
        if bg then
           bg:removeFromParent()
        end
    end
    local action = cc.Sequence:create(move,cc.CallFunc:create(later))
    bg:runAction(action)

end

return HeroRelivePanel