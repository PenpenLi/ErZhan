
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
local AchievementsProperties  = require("app.properties.AchievementsProperties")

local BossKillPanel = class("BossKillPanel", function()
    return display.newNode()
end)

-- 传进来的object是一个配置文件

function BossKillPanel:ctor(battleui, object)

    self.battleui   = battleui
    -- 记录玩家击杀了哪个boss
    self.bossConfig = object


	self:setContentSize(cc.size(display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setTouchEnabled(true)

    self:createView()
	-- self:setVisible(false)  
end

-- 创建控件
function BossKillPanel:createView()
    -- 显示这个页面的时候，需要把游戏暂停
    self.battleui.rt:pausePlay()


    local allBg = display.newSprite("ui/fight/bossKill/bg.png")
        :addTo(self)
        :pos(display.cx, display.cy)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        allBg:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        allBg:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    -- boss头像背景框
    local bossBg = display.newSprite("ui/fight/bossKill/bossBg.png")
        :addTo(allBg)
        :pos(190, 200)


    self.bossIcon = display.newSprite("ui/fight/bossKill/"..self.bossConfig.mainID..".png")
        :addTo(bossBg)
        :pos(326/2, 257/2)
        

    -- 击杀“恶魔头领”文字
    local str = WordLanguage.Kill
    str = str..self.bossConfig.name_CN

    bossNameLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = str,
        align = cc.ui.TEXT_ALIGN_RIGHT,
        font = GLOBAL_FONTNAME,
        size = 26,
        x = 190,
        y = 50,
    }):align(display.CENTER_RIGHT)
    :addTo(allBg)
    bossNameLabel:enableOutline(cc.c4b(0, 0, 0,255), 2)
    bossNameLabel:setAnchorPoint(0.5, 0.5)

    -- “成功击杀” 图片文字
    self.successKillIMg = display.newSprite("ui/fight/bossKill/successKill.png")
        :addTo(allBg)
        :pos(500, 280)

    -- "悬赏钻石" 背景图
    self.wordBg = display.newSprite("ui/fight/bossKill/wordBg.png")
        :addTo(allBg)
        :pos(500, 190)
        :setVisible(false)

    -- "悬赏钻石" 文字
    self.diamondLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.AwardDiamond,
        align = cc.ui.TEXT_ALIGN_RIGHT,
        font = GLOBAL_FONTNAME,
        color = cc.c3b(252,255,0),
        size = 26,
        x = 203,
        y = 28,
    }):align(display.CENTER_RIGHT)
    :addTo(self.wordBg)
    self.diamondLabel:enableOutline(cc.c4b(0, 0, 0,255), 2)
    self.diamondLabel:setAnchorPoint(0.5, 0.5)

    -- 钻石宝箱 图片
    self.boxImg = display.newSprite("ui/fight/bossKill/diamondBox.png")
        :addTo(allBg)
        :pos(470, 100)
        :setVisible(false)

    -- 根据成就来奖励不同的物品
    local achieveId    -- 成就id
    local objID
    objID = self.bossConfig.mainID

    if objID == "100502" then
        -- 击败 恶魔统领 的成就id
        achieveId = "141202"
    elseif objID == "100501" then
        -- 击败 比蒙皇 的成就id
        achieveId = "141209"
    elseif objID == "100503" then
        -- 击败 冰霜巨龙 的成就id
        achieveId = "141216"
    elseif objID == "100504" then
        -- 击败 地狱炎魔 的成就id
        achieveId = "141219"
    elseif objID == "100505" then
        -- 击败 大恶魔 的成就id
        achieveId = "141220"
    end
    self.achieveId = achieveId

    local achieveConfig = AchievementsProperties.get(achieveId)
    local award = achieveConfig.award
    self.award  = award
    print("award.diamond = "..tostring(award.diamond))

    if award.diamond and award.diamond ~= 0 then
        -- 悬赏钻石
        self.diamondLabel:setString(WordLanguage.AwardDiamond..tostring(award.diamond).."钻")
    elseif award.hero then
        -- 奖励英雄
        self.diamondLabel:setString(WordLanguage.AwardHero)
        self.boxImg:setTexture("ui/Icons/heroIcon/"..award.hero..".png")
    end

    -------------------------------- 领取按钮 --------------------------------
    local confirmBtn = cc.ui.UIPushButton.new({normal = "ui/fight/heroRelive/btn.png",
        pressed = "ui/fight/heroRelive/btn_on.png",
        disabled = "ui/fight/heroRelive/btn_on.png"})
        :onButtonClicked(function(...)
            -- print("游戏中点击暂停按钮")
            self:onClickConfirm()
        end)
        :addTo(allBg)
        :pos(650, 0)
        :setVisible(false)
        -- :scale(GLOBAL_FIGHT_UI_SCALE)
    confirmBtn:setTouchEnabled(false)
    self.confirmBtn = confirmBtn

    -- 确认文字
    local confirmLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.get,
        font = GLOBAL_FONTNAME,
        size = 28,
        -- x = diffX - 10,
        -- y = diffY,
    }):align(display.CENTER)
    confirmBtn:setButtonLabel("normal", confirmLabel)
    confirmLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

    -- 播放完boss头像上的飙血特效后，需要播放文字特效
    local function finc( ... )

        local function finc1( ... )
            self:doAfterAni()
        end
        local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_word_1", false, finc1)
            self.successKillIMg:addChild(effect)
            effect:setPosition(188, offsetY + 50)
    end

    -- 在boss头像上播放飙血特效
    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_blood_1", false, finc)
        self.bossIcon:addChild(effect)
        effect:setPosition(188, offsetY + 130)
    

    -- add by Owen, 2016.7.15, 如果是英雄复活引导，则在“确认”按钮上添加一个手指动画，
    -- 取消按钮变为不可点击
    -- if self.isGuide then
    --     self.finger = EffectAniCache.getEffectAniCache("Finger", true)
    --     confirmBtn:addChild(self.finger)
    --     self.finger:setPosition(0, 0)

    --     cancelBtn:setTouchEnabled(false)
    -- else
    --     cancelBtn:setTouchEnabled(true)
    -- end

end

-- 特效播放完了之后，再显示宝箱图片，把领取按钮置为可以点击
function BossKillPanel:doAfterAni( ... )
    self.wordBg:setVisible(true)
    self.wordBg:setScale(0.1)
    local act1 = cc.ScaleTo:create(0.3, 1.0)
    self.wordBg:runAction(act1)

    self.boxImg:setVisible(true)
    self.boxImg:setScale(0.1)
    local act1 = cc.ScaleTo:create(0.3, 1.0)
    self.boxImg:runAction(act1)

    self.confirmBtn:setVisible(true)
    self.confirmBtn:setScale(0.1)
    local act1 = cc.ScaleTo:create(0.3, 1.0)
    self.confirmBtn:runAction(act1)
    self.confirmBtn:setTouchEnabled(true)
end

-- 游戏中点击复活的确认按钮
function BossKillPanel:onClickConfirm()

    if self.award.diamond and self.award.diamond ~= 0 then
        -- 悬赏钻石
        GlobalData.addDiamondCount(self.award.diamond)
        
        -- 恭喜获得钻石奖励
        self:showAwardTips(self.award.diamond)

        -- 发信号出去战斗UI更新钻石数量, 道具数量
        NotifyCenter.notify(EventNames.UI_UPDATE_DIAMOND_COUNT)
    elseif self.award.hero then
        -- 奖励英雄
        GlobalData.setCurActiveHero(self.award.hero)
        -- 把这个成就的状态改为已经领取
    end
    GlobalData.setAchieve(self.achieveId, 2)

    -- add by Owen, 2016.7.29, 开始了第三步的新手引导，领取了击杀恶魔统领的奖励
    umengSdk.setLevelStart(umengSdk.newGuide.guide03, 1)
    umengSdk.setLevelStart(umengSdk.newGuide.guide03, 2)

    self.battleui.rt:resumePlay()
    self:removeSelf()
end

-- add by Owen, 2016.7.15, -- 显示 “太棒啦！获得5 个道具1”
function BossKillPanel:showAwardTips(diamondCount)


    local bg = display.newSprite("ui/fight/objectDetail/objectDetailBg.png")
        :addTo(self.battleui)
        :pos(display.cx, display.cy)
        :setScale(GLOBAL_FIGHT_UI_SCALE)

    -- “太棒啦！获得50钻石奖励”
    self.richText = ccui.RichText:create()
    self.richText:setOutLine(cc.c4b(0,0,0,255),3)
    self.richText:setContentSize(cc.size(280,90))
    self.richText:ignoreContentAdaptWithSize(false)
    -- self.richText:setPosition(display.cx + 30, display.cy + 50)
    -- self:addChild(self.richText)
    self.richText:setPosition(636/2, 78/2 - 20)
    bg:addChild(self.richText)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        bg:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        bg:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255,
        "恭喜获得", GLOBAL_FONTNAME, 32)
    self.richText:pushBackElement(re1)

    local re2 = ccui.RichElementText:create(3, cc.c3b(252, 255, 0), 255,
        tostring(diamondCount), GLOBAL_FONTNAME, 32)
    self.richText:pushBackElement(re2)

    local re3 = ccui.RichElementImage:create(2,
        cc.c3b(255, 255, 255), 255, "ui/getTips/zuan.png")
    self.richText:pushBackElement(re3)


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

return BossKillPanel