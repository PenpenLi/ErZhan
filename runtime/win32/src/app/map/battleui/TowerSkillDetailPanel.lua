
-- 在选择造塔页面，选中了一个塔以后，显示在旁边的塔的详细信息页面
local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local GlobalData              = require("tools.GlobalData")
-- TowerSkillDetailPanel
local TowerSkillDetailPanel = class("TowerSkillDetailPanel", function()
    return display.newNode()
end)

local PaddingX = 450    -- 塔基的x位置小于350的时候，塔的详细信息显示在右边，否则在左边
local DiffX    = 250    -- 详细信息的框和塔基位置之间的偏移，设为250

function TowerSkillDetailPanel:ctor()
    -- print("TowerSkillDetailPanel:ctor()")
    self.towerLocation = nil    -- 选中的是哪个坑位,self.towerLocation.tower就是在这个坑位上造的塔
    self.tower         = nil    -- 在这个坑位上造的塔
    self.upLevelGoldCost = nil  -- 升到下一等级所需要的金币数
    self.prepareToHide = false
    self:setContentSize(cc.size(100,100))

    self:createView()
    self:setVisible(false)

end

-- 创建控件
function TowerSkillDetailPanel:createView()


    ------------------------------------- 九宫格背景图 --------------------------------------
    local bgImg = display.newScale9Sprite("ui/hall/heroHome/rightBg.png", 
        0, 0, cc.size(500, 300))--, cc.rect(30,30, 70,70))
    self:addChild(bgImg)
    self.bgImg = bgImg
    -- rightBgImg:setPosition(720, 900)

    -- 天赋名称
    self.talentName1 = cc.ui.UILabel.new({
        text  = WordLanguage.Talent..": ",
        font  = GLOBAL_FONTNAME,
        x     = 20,
        y     = 50,
    })
    bgImg:addChild(self.talentName1,1)

    -- 天赋名称
    self.talentName2 = cc.ui.UILabel.new({
        text  = "",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        x     = 90,
        y     = 50,
    })
    bgImg:addChild(self.talentName2,1)
    self.talentName2:setAnchorPoint(0, 0.5)


    -- 天赋简介，自动换行
    self.talentTxt = cc.ui.UILabel.new({text = "花果山的猴兵身手敏捷，尤其擅长击杀快速目标。",
        font = GLOBAL_FONTNAME, size = 20, dimensions = CCSize(260, 0)})
    self.talentTxt:setPosition(20, 300)
    bgImg:addChild(self.talentTxt)

    -- 当前效果
    self.nowLab = cc.ui.UILabel.new({
        text  = WordLanguage.CurrentEff..": ",
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 20,
        y     = 50,
    })
    bgImg:addChild(self.nowLab,1)

    -- 当前效果
    self.nowEffectLab = cc.ui.UILabel.new({
        text  = "",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 120,
        y     = 50,
    })
    bgImg:addChild(self.nowEffectLab,1)
    self.nowEffectLab:setAnchorPoint(0, 0.5)
    -- 根据不同的语言，修改天赋技能描述文字的位置
    if GlobalData.getLanguage() == "CN" then
        self.nowEffectLab:setPositionX(110)
    else
        self.nowEffectLab:setPositionX(100)
    end

    -- 下级效果
    self.nextLab = cc.ui.UILabel.new({
        text  = WordLanguage.NextLvEff..": ",
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 20,
        y     = 50,
    })
    bgImg:addChild(self.nextLab,1)

    -- 下级效果
    self.nextEffectLab = cc.ui.UILabel.new({
        text  = "",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 120,
        y     = 20,
    })
    bgImg:addChild(self.nextEffectLab,1)
    self.nextEffectLab:setAnchorPoint(0, 0.5)
    -- 根据不同的语言，修改天赋技能描述文字的位置
    if GlobalData.getLanguage() == "CN" then
        self.nextEffectLab:setPositionX(110)
    else
        self.nextEffectLab:setPositionX(100)
    end

end

-- 在指定塔基处显示
function TowerSkillDetailPanel:show(tower, index, towerX, towerY)
    -- print("TowerSkillDetailPanel:show")
    self.talentConfig = talentConfig
    self.towerX = towerX
    self.towerY = towerY

    -- 转换成屏幕坐标
    local x, y = self.rt.camera_:convertToWorldPosition(towerX, towerY)
    self.bgImg:setPosition(x - DiffX, y)
    if x < PaddingX * GLOBAL_FIGHT_UI_SCALE then
        self.bgImg:setPosition(x + DiffX, y)
    end


    local nowTalentConfig
    local nextTalentConfig
    if not tower.talent_[index] then
        -- 还没学这个天赋
        nextTalentConfig = TowerTalentProperties.get(tower.towerTalent_[index])
    elseif string.len(tower.talent_[index].nextLvID) == 0 then
        -- 这个天赋已经到顶级了
        nowTalentConfig = tower.talent_[index]
    else
        nowTalentConfig = tower.talent_[index]
        nextTalentConfig = TowerTalentProperties.get(tower.talent_[index].nextLvID)
    end

    -- 更新显示的各种文字
    local textLength
    local nameKey       = utils.getName("name")
    local textKey       = utils.getName("text")
    local effectTextKey = utils.getName("effectText")
    if nowTalentConfig then
        self.talentName2:setString(nowTalentConfig[nameKey])
        self.talentTxt:setString(nowTalentConfig[textKey])
        self.nowEffectLab:setString(nowTalentConfig[effectTextKey])
        textLength = string.len(nowTalentConfig[textKey])
    else
        self.talentName2:setString(nextTalentConfig[nameKey])
        self.talentTxt:setString(nextTalentConfig[textKey])
        -- “还未学习” 文字
        self.nowEffectLab:setString(WordLanguage.NotLearn)
        textLength = string.len(nextTalentConfig[textKey])
    end
    if nextTalentConfig then
        self.nextEffectLab:setString(nextTalentConfig[effectTextKey])
    else
        -- “已经满级” 文字
        self.nextEffectLab:setString(WordLanguage.FullLevel)
    end

    -- 根据塔描述文字的长度来重新布局位置
    local height
    if (textLength > 40) then
        -- 需要两行显示
        self.bgImg:setContentSize(320, 180)
        height = 180
        self.talentName1:setPositionY(height - 30)
        self.talentName2:setPositionY(height - 30)
        self.talentTxt:setPositionY(height - 80)
        self.nowLab:setPositionY(55)
        self.nowEffectLab:setPositionY(55)
        self.nextLab:setPositionY(30)
        self.nextEffectLab:setPositionY(30)
    else
        -- 详细信息只需要一行就够显示了
        self.bgImg:setContentSize(320, 220)
        self.bgImg:setContentSize(320, 160)
        height = 160
        self.talentName1:setPositionY(height - 30)
        self.talentName2:setPositionY(height - 30)
        self.talentTxt:setPositionY(height - 70)
        self.nowLab:setPositionY(55)
        self.nowEffectLab:setPositionY(55)
        self.nextLab:setPositionY(30)
        self.nextEffectLab:setPositionY(30)
    end

    self:setVisible(true)
end


function TowerSkillDetailPanel:hide()
    self:setVisible(false)
end

function TowerSkillDetailPanel:tick(dt)

    if (self.rt) and (self:isVisible()) then
        -- 转换成屏幕坐标
        local x, y = self.rt.camera_:convertToWorldPosition(self.towerX, self.towerY)
        self.bgImg:setPosition(0 - DiffX, 0)
        if x < PaddingX * GLOBAL_FIGHT_UI_SCALE then
            self.bgImg:setPosition(0 + DiffX, 0)
        end

        -- self.bgImg:setPosition(0, 0)
    end
end

-- 设置 MapRuntime
function TowerSkillDetailPanel:setRuntime(rt)
    -- print("TowerSkillDetailPanel:setRuntime")
    self.rt = rt

end


return TowerSkillDetailPanel