

local GlobalData            = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
local GroupProperties       = require("app.properties.GroupProperties")
local GroupDetailPanel      = require("hall.GroupDetailPanel")
local MapConstants          = require("app.map.MapConstants")

-- 点击关卡以后，显示的难度选择界面的右半部分
local ChooseModeRightPanel = class("ChooseModeRightPanel", function()
    return display.newNode()
end)



function ChooseModeRightPanel:ctor(mapId)

    -- 地图id
    self.mapId = mapId

    local pageWith   = 700
    local pageHeight = 1332
    self:setContentSize(cc.size(pageWith, pageHeight))

    self.hardMode = 1       -- 难度模式，1表示简单，2表示困难
    self.gameMode = 1       -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3


    self.star1    = {}      -- 显示的模式一获得的星星
    self.star2    = {}      -- 显示的模式一获得的星星
    self.star3    = {}      -- 显示的模式一获得的星星


    ----------------------------------- 初始化九宫格背景图 -----------------------------------
    local upBgImg = display.newScale9Sprite("ui/hall/heroHome/rightBg.png", 
        0, 0, cc.size(pageWith, pageHeight))--, cc.rect(30,30, 70,70))
    self:addChild(upBgImg)

    ----------------------------------- 地图缩略图 --------------------------------------------
    local posX  = -300
    local posY  = 260
    local diffY = -60
    local mapImg = display.newSprite("ui/hall/chooseModel/mapImg.png")
        :pos(0, 450)--, cc.rect(30,30, 70,70))
        :addTo(self)
    local mapLabel = cc.ui.UILabel.new({text = self.mapId.."-01", font = GLOBAL_FONTNAME,
        size = 60, color = cc.c3b(255,255,255)})
        :align(display.CENTER_LEFT, 30, 280)
        :addTo(mapImg)

    ----------------------------------- 通关条件文字 -----------------------------------------
    local label = cc.ui.UILabel.new({text = WordLanguage.ThroughCondition, font = GLOBAL_FONTNAME,
        size = 45, color = cc.c3b(255,255,255)})
        :align(display.CENTER_LEFT, posX, posY)
        :addTo(self)

    local label = cc.ui.UILabel.new({text = "打坏老牛的屁屁", font = GLOBAL_FONTNAME,
        size = 45, color = cc.c3b(255,255,255)})
        :align(display.CENTER_LEFT, posX, posY + diffY)
        :addTo(self)
    local label = cc.ui.UILabel.new({text = "泡上老牛的夫人", font = GLOBAL_FONTNAME,
        size = 45, color = cc.c3b(255,255,255)})
        :align(display.CENTER_LEFT, posX, posY + diffY*2)
        :addTo(self)
    local label = cc.ui.UILabel.new({text = "把红孩儿咔嚓", font = GLOBAL_FONTNAME,
        size = 45, color = cc.c3b(255,255,255)})
        :align(display.CENTER_LEFT, posX, posY + diffY*3)
        :addTo(self)

    ----------------------------------- 困难简单按钮 -----------------------------------------
    -- 背景框
    local btnBg = display.newScale9Sprite("ui/hall/chooseModel/btnBg.png", 
        0, 0, cc.size(700, 200))--, cc.rect(30,30, 70,70))
    btnBg:setPosition(0, -100)
    self.btnBg = btnBg
    self:addChild(btnBg)
    -- 简单按钮
    local easyBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/easyBtn.png"})
    :onButtonClicked(function(params)
        print("on click easyBtn")
        self:onClickEasyBtn()
    end)
    :pos(180, 100)
    :addTo(btnBg)
    -- 简单文字
    local label = cc.ui.UILabel.new({text = WordLanguage.Easy, font = GLOBAL_FONTNAME,
        size = 55, color = cc.c3b(255,255,255)})
        :align(display.CENTER, 0, 0)
        :addTo(easyBtn)
    -- 选中图标 easySelected
    self.easySelected = display.newSprite("ui/hall/chooseModel/easySelected.png")
        :addTo(easyBtn)

    -- 困难按钮
    local hardBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/easyBtn.png"})
    :onButtonClicked(function(params)
        print("on click hardBtn")
        self:onClickHardBtn()
    end)
    :pos(500, 100)
    :addTo(btnBg)
    -- 困难文字
    local label = cc.ui.UILabel.new({text = WordLanguage.Hard, font = GLOBAL_FONTNAME,
        size = 55, color = cc.c3b(255,255,255)})
        :align(display.CENTER, 0, 0)
        :addTo(hardBtn)
    -- 选中图标 easySelected
    self.hardSelected = display.newSprite("ui/hall/chooseModel/easySelected.png")
        :addTo(hardBtn)
    self.hardSelected:setVisible(false)


    ----------------------------------- 模式一按钮 -----------------------------------------
    local modeBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/mode1.png"})
    :onButtonClicked(function(params)
        print("on click onClickModeOneBtn")
        self:onClickModeOneBtn()
    end)
    :pos(-220, -300)
    :addTo(self)
    -- 选中图片
    self.modeSelected1 = display.newSprite("ui/hall/chooseModel/modeSelected.png")
        :addTo(modeBtn)
    self.modeSelected1_1 = display.newSprite("ui/hall/chooseModel/arrow.png")
        :addTo(modeBtn)
        :pos(0, 80)
    -- 下面的3个星星
    for i = 1, 3 do
        self.star1[i] = display.newSprite("ui/hall/heroHome/heroStar.png")
            :addTo(self)
            :pos(-270 + (i-1)*55, -420)
    end


    ----------------------------------- 模式二按钮 -----------------------------------------
    local modeBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/mode2.png"})
    :onButtonClicked(function(params)
        print("on click onClickModeOneBtn")
        self:onClickModeTwoBtn()
    end)
    :pos(0, -300)
    :addTo(self)
    self.modeSelected2 = display.newSprite("ui/hall/chooseModel/modeSelected.png")
        :addTo(modeBtn)
    -- 下面的3个星星
    for i = 1, 3 do
        self.star2[i] = display.newSprite("ui/hall/heroHome/heroStar.png")
            :addTo(self)
            :pos(-50 + (i-1)*55, -420)
    end

    ----------------------------------- 模式三按钮 -----------------------------------------
    local modeBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/mode3.png"})
    :onButtonClicked(function(params)
        print("on click onClickModeOneBtn")
        self:onClickModeThreeBtn()
    end)
    :pos(220, -300)
    :addTo(self)
    self.modeSelected3 = display.newSprite("ui/hall/chooseModel/modeSelected.png")
        :addTo(modeBtn)
    -- 下面的3个星星
    for i = 1, 3 do
        self.star1[i] = display.newSprite("ui/hall/heroHome/heroStar.png")
            :addTo(self)
            :pos(170 + (i-1)*55, -420)
    end


    ----------------------------------- 开始战斗按钮 -----------------------------------------
    local beginBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/begin.png"})
    :onButtonClicked(function(params)
        print("on click beginBtn")
        self:onClickBeginBtn()
    end)
    :pos(0, -550)
    :addTo(self)
    -- 开始战斗文字
    local label = cc.ui.UILabel.new({text = WordLanguage.BeginToBattle, font = GLOBAL_FONTNAME,
        size = 55, color = cc.c3b(255,255,255)})
        :align(display.CENTER, 0, 0)
        :addTo(beginBtn)





end

function ChooseModeRightPanel:onClickEasyBtn( ... )
    self.easySelected:setVisible(true)
    self.hardSelected:setVisible(false)

    -- 难度模式，1表示简单，2表示困难
    self.hardMode = MapConstants.DIFFICULTY_MODE_EASY
end

function ChooseModeRightPanel:onClickHardBtn( ... )
    self.easySelected:setVisible(false)
    self.hardSelected:setVisible(true)
    
    -- 难度模式，1表示简单，2表示困难
    self.hardMode = MapConstants.DIFFICULTY_MODE_HARD
end

function ChooseModeRightPanel:onClickModeOneBtn( ... )
    -- 模式1的难度选择按钮置为可见
    self.btnBg:setVisible(true)

    -- 修改模式选中图标的可见性
    self.modeSelected1:setVisible(true)
    self.modeSelected1_1:setVisible(true)
    self.modeSelected2:setVisible(false)
    self.modeSelected3:setVisible(false)

    -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3
    self.gameMode = MapConstants.GAME_MODE_ONE  
end

function ChooseModeRightPanel:onClickModeTwoBtn( ... )
    -- 模式1的难度选择按钮置为不可见
    self.btnBg:setVisible(false)

    -- 修改模式选中图标的可见性
    self.modeSelected1:setVisible(false)
    self.modeSelected1_1:setVisible(false)
    self.modeSelected2:setVisible(true)
    self.modeSelected3:setVisible(false)

    -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3
    self.gameMode = MapConstants.GAME_MODE_TWO  
end

function ChooseModeRightPanel:onClickModeThreeBtn( ... )
    -- 模式1的难度选择按钮置为不可见
    self.btnBg:setVisible(false)

    -- 修改模式选中图标的可见性
    self.modeSelected1:setVisible(false)
    self.modeSelected1_1:setVisible(false)
    self.modeSelected2:setVisible(false)
    self.modeSelected3:setVisible(true)

    -- 关卡模式，1表示正常模式，2表示模式2, 3表示模式3
    self.gameMode = MapConstants.GAME_MODE_THREE       
end

function ChooseModeRightPanel:onClickBeginBtn( ... )
    print("ChooseModePanel:changMode mapId = "..tostring(self.mapId))

    -- -- 上阵英雄要达到3个才能开始游戏
    -- local heros = GlobalData.getHeroInFight()
    -- for i, v in ipairs(heros) do
    --     if v == 0 then
    --         -- 表示上阵数量没到3个
    --         return
    --     end
    -- end

    local heros = GlobalData.getHeroInFight()
    dump(heros, "dump heros in ChooseModeRightPanel:onClickBeginBtn")

    local heroCount = 3
    for i, v in ipairs(heros) do
        if v == 0 then
            -- 表示上阵数量没到3个
            heroCount = heroCount - 1
            -- return
        end
    end

    -- if heroCount < 1 then
    --     return
    -- end

    local group = GlobalData.getActiveGroup()
    dump(group, "开始一关，打印激活的羁绊")

    local mapName
    if self.mapId < 10 then
        mapName ="A000"..tostring(self.mapId)
    elseif self.mapId >= 10 and self.mapId < 100 then
        mapName ="A00"..tostring(self.mapId)
    else
        mapName ="A0"..tostring(self.mapId)
    end

    -- 处理被羁绊修改的技能、Buff、Area
    GlobalData.setChangesData({})

    -- display.replaceScene(require("editor.EditorScene").new({mapId = mapName
    --     , modeId = params.target:getTag()}))

    GlobalData.setHardMode(self.hardMode)
    GlobalData.setGameMode(self.gameMode)


    display.replaceScene(require("transition.TransitionScene").new({mapId = mapName
        , modeId = self.gameMode}))
end



return ChooseModeRightPanel