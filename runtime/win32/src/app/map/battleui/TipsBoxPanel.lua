
-- 游戏中显示的Tips的框，比如刷怪按钮 上面要显示 “点击开始” 文字框

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local MapConstants      = require("app.map.MapConstants")
local GameTips          = require("app.map.battleui.GameTips")

local TipsBoxPanel = class("TipsBoxPanel", function()
    return display.newNode()
end)

-- boxType = 1  表示 “点击开始”
-- boxType = 2  表示 “点击技能”
-- boxType = 3  表示 “建造1个造塔”
-- boxType = 4  表示 “建造魔法塔”
-- boxType = 5  表示 “建造战争古树”
-- boxType = 6  表示 “召唤援兵”

function TipsBoxPanel:ctor(battleUI, boxType)

    -- print("TipsBoxPanel:ctor 显示游戏中的Tips isGuide = "..tostring(isGuide)
    --     .." tipsType = "..tostring(tipsType))

    -- change by Owen, 2016.6.12, 新手引导的装文字的Box，
    -- 不需要缩放，因为父节点都缩放了
    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    -- if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    --     self:setScale(1/GLOBAL_FIGHT_UI_SCALE)
    -- end

    -- 记录一下battleUI, 用来点击完以后，显示tips
    self.battleUI = battleUI

    local arrowPosY = -28

    -- 箭头图片
    self.tipsArrow = display.newSprite("ui/common/arrow.png")
        :addTo(self)
        :pos(0, arrowPosY)

    -- 框的大小
    local bgWidth  = 150
    local bgHeight = 40

    -- Tips文本框
    ------------------------------------- 九宫格背景图 --------------------------------------
    local boxImg = display.newScale9Sprite("ui/common/tipsBox.png", 
        0, 0, cc.size(bgWidth, bgHeight))--, cc.rect(30,30, 70,70))
    self:addChild(boxImg, -1)
    self.boxImg = boxImg


    -- 点击开始
    self.tipsName = cc.ui.UILabel.new({
        text  = WordLanguage.ClickToStart,
        color = cc.c3b(156, 25, 9),
        font  = GLOBAL_FONTNAME,
        size  = 24,
        x     = bgWidth/2,
        y     = bgHeight/2,
    })
    self.tipsName:setAnchorPoint(0.5, 0.5)
    boxImg:addChild(self.tipsName,1)

    if boxType == 1 then
        -- boxType = 1  表示 “点击开始”
        self.tipsName:setString(WordLanguage.ClickToStart)
        self.tipsArrow:setPosition(40, arrowPosY)

        -- 闪烁的特效
        -- change by Owen, 2016.6.12, 新手引导的装文字的Box，
        -- 不需要缩放，因为父节点都缩放了
        local scaleto1 = cc.ScaleTo:create(0.38, 1.01) -- * GLOBAL_FIGHT_UI_SCALE) -- 0.5, 1.5)
        local scaleto2 = cc.ScaleTo:create(0.38, 0.99) -- * GLOBAL_FIGHT_UI_SCALE) -- 0.5,1.3)
        local squence = cc.Sequence:create(scaleto1,scaleto2)
        local repeatForever1 = cc.RepeatForever:create(squence)
        self:runAction(repeatForever1)

    elseif boxType == 2 then
        -- boxType = 2  表示 “点击技能”
        self.tipsName:setString(WordLanguage.ClickSkillBtn)
        self.tipsArrow:setPosition(-40, arrowPosY)

        -- 闪烁的特效
        -- change by Owen, 2016.6.12, 新手引导的装文字的Box，
        -- 不需要缩放，因为父节点都缩放了
        local scaleto1 = cc.ScaleTo:create(0.38, 1.01)
        local scaleto2 = cc.ScaleTo:create(0.38, 0.99)
        -- windows平台上面，战斗UI要缩放0.8, 但提示框不缩放
        if (device.platform == "mac" or device.platform == "windows") then
            scaleto1 = cc.ScaleTo:create(0.38, (1/0.8) * 1.01 * GLOBAL_FIGHT_UI_SCALE)
            scaleto2 = cc.ScaleTo:create(0.38, (1/0.8) * 0.99 * GLOBAL_FIGHT_UI_SCALE)
        end
        
        local squence = cc.Sequence:create(scaleto1,scaleto2)
        local repeatForever1 = cc.RepeatForever:create(squence)
        self:runAction(repeatForever1)
    elseif boxType == 3 or boxType == 4 or boxType == 5 or boxType == 6 then
        -- boxType = 3  表示 “点击造塔”
        if boxType == 3 then
            self.tipsName:setString(WordLanguage.ClickToBuildTower)
        elseif boxType == 4 then
            self.tipsName:setString(WordLanguage.BuildMagicTower)
        elseif boxType == 5 then
            self.tipsName:setString(WordLanguage.BuildBurstTower)
        elseif boxType == 6 then
            self.tipsName:setString(WordLanguage.CallSummon)
        end
        self.tipsArrow:setPosition(0, arrowPosY)

        -- 闪烁的特效
        -- change by Owen, 2016.6.12, 新手引导的装文字的Box，
        -- 不需要缩放，因为父节点都缩放了
        local scaleto1 = cc.ScaleTo:create(0.38, 1.01) -- * GLOBAL_FIGHT_UI_SCALE) -- 0.5, 1.5)
        local scaleto2 = cc.ScaleTo:create(0.38, 0.99) -- * GLOBAL_FIGHT_UI_SCALE) -- 0.5,1.3)
        local squence = cc.Sequence:create(scaleto1,scaleto2)
        local repeatForever1 = cc.RepeatForever:create(squence)
        self:runAction(repeatForever1)
    end



end

function TipsBoxPanel:show(boxType)

end

function TipsBoxPanel:tick(boxType)

end

return TipsBoxPanel