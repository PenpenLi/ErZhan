
-- 在选择造塔页面，选中了一个塔以后，显示在旁边的塔的详细信息页面
local TowerProperties = require("app.properties.TowerProperties")
local BattleDataManager = require("app.map.data.BattleDataManager")
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
-- TowerDetailPanel
local TowerDetailPanel = class("TowerDetailPanel", function()
    return display.newNode()
end)

local PaddingX = 400    -- 塔基的x位置小于350的时候，塔的详细信息显示在右边，否则在左边
local DiffX    = 250    -- 详细信息的框和塔基位置之间的偏移，设为250

function TowerDetailPanel:ctor()
	-- print("TowerDetailPanel:ctor()")
	self.towerLocation = nil    -- 选中的是哪个坑位,self.towerLocation.tower就是在这个坑位上造的塔
	self.tower         = nil    -- 在这个坑位上造的塔
	self.upLevelGoldCost = nil  -- 升到下一等级所需要的金币数
    self.prepareToHide = false
	self:setContentSize(cc.size(100,100))

    self:createView()
	self:setVisible(false)

end

-- 创建控件
function TowerDetailPanel:createView()


    ------------------------------------- 九宫格背景图 --------------------------------------
    local bgImg = display.newScale9Sprite("ui/hall/heroHome/rightBg.png", 
        0, 0, cc.size(500, 300))--, cc.rect(30,30, 70,70))
    self:addChild(bgImg)
    self.bgImg = bgImg
    -- rightBgImg:setPosition(720, 900)

    -- 塔名称
    self.towerName = cc.ui.UILabel.new({
        text  = "1级箭塔",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        x     = 20,
        y     = 50,
    })
    bgImg:addChild(self.towerName,1)
    -- self.towerName:enableOutline(cc.c4b(0, 0, 0, 255), 1) 

    -- 塔简介，自动换行
    self.towerTxt = cc.ui.UILabel.new({text = "花果山的猴兵身手敏捷，尤其擅长击杀快速目标。",
        font = GLOBAL_FONTNAME, size = 20, dimensions = CCSize(260, 0)})
    self.towerTxt:setPosition(20, 300)
    bgImg:addChild(self.towerTxt)
    -- self.towerTxt:enableOutline(cc.c4b(0, 0, 0, 255), 1) 

    -- 攻击力图片
    self.attackImg = display.newSprite("ui/fight/attack.png")
    self.attackImg:setPosition(40, 30)
    bgImg:addChild(self.attackImg)

    -- 攻击力数字
    self.attackLab = cc.ui.UILabel.new({
        text  = "10",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 70,
        y     = 50,
    })
    bgImg:addChild(self.attackLab,1)
    -- self.attackLab:enableOutline(cc.c4b(0, 0, 0, 255), 1) 

    -- 攻击速度图片
    self.speedImg = display.newSprite("ui/fight/cooldown.png")
    self.speedImg:setPosition(150, 20)
    bgImg:addChild(self.speedImg)

    -- 攻击力数字
    self.speedLab = cc.ui.UILabel.new({
        text  = "很快",
        color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        size  = 20,
        x     = 180,
        y     = 20,
    })
    bgImg:addChild(self.speedLab,1)
    -- self.speedLab:enableOutline(cc.c4b(0, 0, 0, 255), 1)

end

-- 在指定塔基处显示
function TowerDetailPanel:show(towerConfig, towerX, towerY)
    -- print("TowerDetailPanel:show")
    self.towerConfig = towerConfig
    self.towerX = towerX
    self.towerY = towerY

    -- 转换成屏幕坐标
    local x, y = self.rt.camera_:convertToWorldPosition(towerX, towerY)
    self.bgImg:setPosition(x - DiffX, y)
    if x < PaddingX * GLOBAL_FIGHT_UI_SCALE then
        self.bgImg:setPosition(x + DiffX, y)
    end

    -- 更新显示的各种文字
    local nameKey = utils.getName("name")
    self.towerName:setString(towerConfig[nameKey])
    local textKey = utils.getName("text")
    self.towerTxt:setString(towerConfig[textKey])
    self.attackLab:setString(towerConfig.attack)
    local speedTextKey = utils.getName("speedText")
    self.speedLab:setString(towerConfig[speedTextKey])

    -- 根据塔描述文字的长度来重新布局位置
    local txtLength = string.len(towerConfig[textKey])
    -- print("txtLength = "..tostring(txtLength).." "..towerConfig[textKey])
    local height
    if (txtLength > 40) then
        -- 需要两行显示
        self.bgImg:setContentSize(300, 180)
        height = 180
        self.towerName:setPositionY(height - 30)
        self.towerTxt:setPositionY(height - 80)
        self.attackImg:setPositionY(40)
        self.attackLab:setPositionY(40)
        self.speedImg:setPositionY(40)
        self.speedLab:setPositionY(40)
    else
        -- 详细信息只需要一行就够显示了
        self.bgImg:setContentSize(300, 220)
        self.bgImg:setContentSize(300, 160)
        height = 160
        self.towerName:setPositionY(height - 30)
        self.towerTxt:setPositionY(height - 70)
        self.attackImg:setPositionY(40)
        self.attackLab:setPositionY(40)
        self.speedImg:setPositionY(40)
        self.speedLab:setPositionY(40)
    end

    self:setVisible(true)
end


function TowerDetailPanel:hide()
	self:setVisible(false)
end

function TowerDetailPanel:tick(dt)

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
function TowerDetailPanel:setRuntime(rt)
	-- print("TowerDetailPanel:setRuntime")
	self.rt = rt

end


return TowerDetailPanel