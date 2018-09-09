
local BattleDataManager   = require("app.map.data.BattleDataManager")
local GlobalData          = require("tools.GlobalData")
local MapConstants        = require("app.map.MapConstants")
local HeroRelivePanel     = require("app.map.battleui.HeroRelivePanel")
local EffectAniCache      = require("app.map.spine.EffectAniCache")
local GroupProperties     = require("app.properties.GroupProperties")

local HeroControlPanel = class("HeroControlPanel", function()
    return display.newNode()
end)

-- 战斗界面左上角的3个英雄按钮

function HeroControlPanel:ctor(battleUI)

	self.battleUI = battleUI

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    -- windows平台上面，战斗UI要缩放0.8
    if  GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        self:setScale(0.7)
    end



    -- 3个英雄按钮，1/2/3分别表示左下、右下、上
    local posX      = 50
    local posY      = 150
    local diffY     = 140   -- 两个英雄按钮之间的间隔
    local btnRadius = 50    -- 英雄按钮的半径
    local expDiffX  = 28    -- 经验条外框图片的偏移
    local expDiffY  = -5    -- 经验条外框图片的偏移
    local expDiffX2 = 27    -- 经验条图片的偏移
    local expDiffY2 = -1    -- 经验条图片的偏移

    local heroIconDiffX = -1   -- 英雄头像X轴偏移
    local heroIconDiffY = 2    -- 英雄头像Y轴偏移
    local heroIconScale = 0.95 -- 英雄头像缩放比例

    local lvIconDiffX = 0   -- 小旗帜X轴偏移
    local lvIconDiffY = -48    -- 小旗帜Y轴偏移

    ---------------------------- 左下英雄按钮 ------------------------------------------
    -- 获得地图血量、英雄限制等的配置
    local mapConfig = BattleDataManager:getConfig()
    -- dump(mapConfig, "dump HeroControlPanel mapConfig")
    local heroCountLimit = 3
    if mapConfig.heroLimit and mapConfig.heroLimit.count then
        heroCountLimit = mapConfig.heroLimit.count
    end


    if heroCountLimit == 0 then
        -- 第一个英雄不能上阵
        local heroLock1 = display.newSprite("ui/fight/heroControl/canotHero.png")
            :addTo(self)
            :pos(posX, posY)
    else
        -- 经验条
        self.expOutline1 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
            :pos(posX + expDiffX, posY + expDiffY)
            :addTo(self)
        self.expSprite1 = display.newProgressTimer("ui/fight/heroControl/heroExp.png",
            display.PROGRESS_TIMER_BAR)
            :pos(posX + expDiffX2, posY + expDiffY2)
            :addTo(self)
        -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
        self.expSprite1:setBarChangeRate(cc.p(0, 1))
        -- 设置进度条的起始位置, ccp(0,0)表示下面
        self.expSprite1:setMidpoint(cc.p(0, 0))

        -- EXP 文字
        local EXPLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
            -- UILabelType = 2,
            text = "EXP",
            color = cc.c3b(255,214,0),
            font = GLOBAL_FONTNAME,
            size = 16,
        })
        :setVisible(false)
        :addTo(self, 10)
        :pos(posX + expDiffX2 + 12, posY + expDiffY2 - 50)
        EXPLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
        self.expLabel1 = EXPLabel

        -- 血条
        self.hpOutline1 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
            :pos(posX - expDiffX - 2, posY + expDiffY)
            :addTo(self)
            :setScaleX(-1)
        self.hpSprite1 = display.newProgressTimer("ui/fight/heroControl/heroHp.png",
            display.PROGRESS_TIMER_BAR)
            :pos(posX - expDiffX2 - 2, posY + expDiffY2)
            :addTo(self)
        -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
        self.hpSprite1:setBarChangeRate(cc.p(0, 1))
        -- 设置进度条的起始位置, ccp(0,0)表示下面
        self.hpSprite1:setMidpoint(cc.p(0, 0))
        self.hpSprite1:setPercentage(100)

        -- HP 文字
        local hpLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
            -- UILabelType = 2,
            text = "HP",
            color = cc.c3b(0,255,0),
            font = GLOBAL_FONTNAME,
            size = 16,
        })
        :addTo(self, 10)
        :setVisible(false)
        :pos(posX - expDiffX2 - 12, posY + expDiffY2 - 50)
        hpLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
        self.hpLabel1 = hpLabel


        self.heroBtn1 = cc.ui.UIPushButton.new("ui/fight/heroControl/heroBtnBg.png")
            :onButtonClicked(function(...)
                self:heroBtnClicked(1)
            end)
            :pos(posX, posY)
            :addTo(self)
            
        -- 选中图片
        self.heroSelectImg1 = display.newSprite("ui/fight/heroControl/heroSelect.png")
        self.heroSelectImg1:setVisible(false)
        self.heroBtn1:addChild(self.heroSelectImg1, -1)

        -- 选中的转圈效果
        -- 英雄选中的旋转表示
        local act1 = cc.RotateBy:create(1, 360)
        local seq  = cc.Sequence:create(act1)
        local rotateAction = cc.RepeatForever:create(seq)
        self.heroSelectImg1_2 = display.newSprite("ui/fight/heroControl/heroSelect2.png")
        self.heroSelectImg1_2:setVisible(false)
        self.heroBtn1:addChild(self.heroSelectImg1_2, -1)
        self.heroSelectImg1_2:runAction(rotateAction)

        -- 英雄头像
        self.heroImg1 = display.newSprite("ui/Icons/heroIcon/110101.png")
            :pos(heroIconDiffX, heroIconDiffY)
            :addTo(self.heroBtn1)
            :setScale(0.7)
        -- 小旗帜，用来放等级文字的图片
        self.lvImg1 = display.newSprite("ui/fight/heroControl/110101_LvImg.png")
            :pos(lvIconDiffX, lvIconDiffY)
            :addTo(self.heroBtn1)
        -- 等级文字
        self.lvlabel1 = cc.ui.UILabel.new({
                UILabelType = 2,
                font = GLOBAL_FONTNAME,
                text = "1",
                size = 22,
                color = cc.c3b(255, 255, 0),
            })
        self.lvlabel1:setPosition(15, 23)
        self.lvImg1:addChild(self.lvlabel1)
        self.lvlabel1:enableOutline(cc.c4b(0, 0,0,255), 1)


        -- -- 选中的感叹号
        -- self.exclamation1 = display.newSprite("ui/fight/exclamation.png")
        -- self.exclamation1:setVisible(false)
        -- self.exclamation1:setPositionY(50)
        -- self.heroBtn1:addChild(self.exclamation1, -1)
    end

    -- 新手引导功能，如果是第一关，且第六关的模式1没有通关，那么不显示第二个和第三个英雄
    local needNewTwoBtn = true
    if GlobalData.getGameLv() == 1 and GlobalData.getGameMode() == MapConstants.GAME_MODE_ONE then
        local lvStar = GlobalData.getLvStar(6)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            needNewTwoBtn = false
        end
    end

    ---------------------------- 中间英雄按钮 ------------------------------------------
    if needNewTwoBtn then
        if heroCountLimit < 2 then
            -- 第二个英雄不能上阵
            self.heroLock2 = display.newSprite("ui/fight/heroControl/canotHero.png")
                :addTo(self)
                :pos(posX, posY - diffY)
        else
            -- 经验条
            self.expOutline2 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
                :pos(posX + expDiffX, posY - diffY + expDiffY)
                :addTo(self)
            self.expSprite2  = display.newProgressTimer("ui/fight/heroControl/heroExp.png",
                display.PROGRESS_TIMER_BAR)
                :pos(posX + expDiffX2, posY - diffY + expDiffY2)
                :addTo(self)
            -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
            self.expSprite2:setBarChangeRate(cc.p(0, 1))
            -- 设置进度条的起始位置, ccp(0,0)表示下面
            self.expSprite2:setMidpoint(cc.p(0, 0))

            -- EXP 文字
            local EXPLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
                -- UILabelType = 2,
                text = "EXP",
                color = cc.c3b(255,214,0),
                font = GLOBAL_FONTNAME,
                size = 16,
            })
            :addTo(self, 10)
            :setVisible(false)
            :pos(posX + expDiffX2 + 12, posY - diffY + expDiffY2 - 50)
            EXPLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
            self.expLabel2 = EXPLabel

            -- 血条
            self.hpOutline2 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
                :pos(posX - expDiffX - 2, posY - diffY + expDiffY)
                :addTo(self)
                :setScaleX(-1)
            self.hpSprite2 = display.newProgressTimer("ui/fight/heroControl/heroHp.png",
                display.PROGRESS_TIMER_BAR)
                :pos(posX - expDiffX2 - 2, posY - diffY + expDiffY2)
                :addTo(self)
            -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
            self.hpSprite2:setBarChangeRate(cc.p(0, 1))
            -- 设置进度条的起始位置, ccp(0,0)表示下面
            self.hpSprite2:setMidpoint(cc.p(0, 0))
            self.hpSprite2:setPercentage(100)

            -- HP 文字
            local hpLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
                -- UILabelType = 2,
                text = "HP",
                color = cc.c3b(0,255,0),
                font = GLOBAL_FONTNAME,
                size = 16,
            })
            :addTo(self, 10)
            :setVisible(false)
            :pos(posX - expDiffX2 - 12, posY - diffY + expDiffY2 - 50)
            hpLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
            self.hpLabel2 = hpLabel


            self.heroBtn2 = cc.ui.UIPushButton.new("ui/fight/heroControl/heroBtnBg.png")
                :onButtonClicked(function(...)
                    self:heroBtnClicked(2)
                end)
                :pos(posX, posY - diffY)
                :addTo(self)
            -- 英雄头像
            self.heroImg2 = display.newSprite("ui/Icons/heroIcon/110101.png")
                :pos(heroIconDiffX, heroIconDiffY)
                :addTo(self.heroBtn2)
                :setScale(0.7)
            -- 小旗帜，用来放等级文字的图片
            self.lvImg2 = display.newSprite("ui/fight/heroControl/110101_LvImg.png")
                :pos(lvIconDiffX, lvIconDiffY)
                :addTo(self.heroBtn2)
            -- print("posY + diffY = "..tostring(posY + diffY))
            -- 等级文字
            self.lvlabel2 = cc.ui.UILabel.new({
                    UILabelType = 2,
                    font = GLOBAL_FONTNAME,
                    text = "1",
                    size = 22,
                    color = cc.c3b(255, 255, 0),
                })
            self.lvlabel2:setPosition(15, 23)
            self.lvImg2:addChild(self.lvlabel2)
            self.lvlabel2:enableOutline(cc.c4b(0, 0,0,255), 1)

            -- self.expSprite2:align(display.LEFT_CENTER, 0, 0)
            -- -- self.expSprite2:align(display.LEFT_CENTER, 0, 0)
            -- self.expOutline2:setPosition(0, btnRadius + 10)
            -- self.expSprite2:setPosition(-expImgWidth/2, btnRadius + 10)
            -- self.heroBtn2:addChild(self.expOutline2)
            -- self.heroBtn2:addChild(self.expSprite2)
            -- 选中图片
            self.heroSelectImg2 = display.newSprite("ui/fight/heroControl/heroSelect.png")
            self.heroSelectImg2:setVisible(false)
            self.heroBtn2:addChild(self.heroSelectImg2, -1)

            -- 选中的转圈效果
            -- 英雄选中的旋转表示
            local act1 = cc.RotateBy:create(1, 360)
            local seq  = cc.Sequence:create(act1)
            local rotateAction = cc.RepeatForever:create(seq)
            self.heroSelectImg2_2 = display.newSprite("ui/fight/heroControl/heroSelect2.png")
            self.heroSelectImg2_2:setVisible(false)
            self.heroBtn2:addChild(self.heroSelectImg2_2, -1)
            self.heroSelectImg2_2:runAction(rotateAction)

            -- -- 选中的感叹号
            -- self.exclamation2 = display.newSprite("ui/fight/exclamation.png")
            -- self.exclamation2:setVisible(false)
            -- self.exclamation2:setPositionY(50)
            -- self.heroBtn2:addChild(self.exclamation2, -1)
        end
    end



    -- 新手引导功能，如果是第二关, 且第六关的简单和困难的星星数量都是0，那么不显示第三个英雄
    local needNewThreeBtn = true
    if GlobalData.getGameLv() == 2 and GlobalData.getGameMode() == MapConstants.GAME_MODE_ONE then
        local lvStar = GlobalData.getLvStar(6)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            needNewThreeBtn = false
        end
    end

	----------------------------- 右方英雄按钮 ------------------------------------------
    if needNewTwoBtn and needNewThreeBtn then
        if heroCountLimit < 3 then
            -- 第三个英雄不能上阵
            self.heroLock3 = display.newSprite("ui/fight/heroControl/canotHero.png")
                :addTo(self)
                :pos(posX, posY - 2*diffY)
        else
            -- 经验条
            self.expOutline3 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
                :pos(posX + expDiffX, posY - 2*diffY + expDiffY)
                :addTo(self)
            self.expSprite3  = display.newProgressTimer("ui/fight/heroControl/heroExp.png",
                display.PROGRESS_TIMER_BAR)
                :pos(posX + expDiffX2, posY - 2*diffY + expDiffY2)
                :addTo(self)
            -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
            self.expSprite3:setBarChangeRate(cc.p(0, 1))
            -- 设置进度条的起始位置, ccp(0,0)表示下面
            self.expSprite3:setMidpoint(cc.p(0, 0))

            -- EXP 文字
            local EXPLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
                -- UILabelType = 2,
                text = "EXP",
                color = cc.c3b(255,214,0),
                font = GLOBAL_FONTNAME,
                size = 16,
            })
            :addTo(self, 10)
            :setVisible(false)
            :pos(posX + expDiffX2 + 12, posY - 2*diffY + expDiffY2 - 50)
            EXPLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
            self.expLabel3 = EXPLabel

            -- 血条
            self.hpOutline3 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
                :pos(posX - expDiffX - 2, posY - 2*diffY + expDiffY)
                :addTo(self)
                :setScaleX(-1)
            self.hpSprite3 = display.newProgressTimer("ui/fight/heroControl/heroHp.png",
                display.PROGRESS_TIMER_BAR)
                :pos(posX - expDiffX2 - 2, posY - 2*diffY + expDiffY2)
                :addTo(self)
            -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
            self.hpSprite3:setBarChangeRate(cc.p(0, 1))
            -- 设置进度条的起始位置, ccp(0,0)表示下面
            self.hpSprite3:setMidpoint(cc.p(0, 0))
            self.hpSprite3:setPercentage(100)

            -- HP 文字
            local hpLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
                -- UILabelType = 2,
                text = "HP",
                color = cc.c3b(0,255,0),
                font = GLOBAL_FONTNAME,
                size = 16,
            })
            :addTo(self, 10)
            :setVisible(false)
            :pos(posX - expDiffX2 - 12, posY - 2*diffY + expDiffY2 - 50)
            hpLabel:enableOutline(cc.c4b(0, 0, 0, 155), 1) 
            self.hpLabel3 = hpLabel

            self.heroBtn3 = cc.ui.UIPushButton.new("ui/fight/heroControl/heroBtnBg.png")
                :onButtonClicked(function(...)
                    self:heroBtnClicked(3)
                end)
                :pos(posX, posY - 2*diffY)
                :addTo(self)
            -- 英雄头像
            self.heroImg3 = display.newSprite("ui/Icons/heroIcon/110101.png")
                :pos(heroIconDiffX, heroIconDiffY)
                :addTo(self.heroBtn3)
                :setScale(0.7)

            -- 小旗帜，用来放等级文字的图片
            self.lvImg3 = display.newSprite("ui/fight/heroControl/110101_LvImg.png")
                :pos(lvIconDiffX, lvIconDiffY)
                :addTo(self.heroBtn3)
            -- 等级文字
            self.lvlabel3 = cc.ui.UILabel.new({
                    UILabelType = 2,
                    font = GLOBAL_FONTNAME,
                    text = "1",
                    size = 22,
                    color = cc.c3b(255, 255, 0),
                    x    = -10,
                })
            self.lvlabel3:setPosition(15, 23)
            self.lvImg3:addChild(self.lvlabel3)
            self.lvlabel3:enableOutline(cc.c4b(0, 0,0,255), 1)


            -- self.expSprite3:align(display.LEFT_CENTER, 0, 0)
            -- self.expOutline3:setPosition(0, btnRadius + 10)
            -- self.expSprite3:setPosition(-expImgWidth/2, btnRadius + 10)
            -- self.heroBtn3:addChild(self.expOutline3)
            -- self.heroBtn3:addChild(self.expSprite3)
            -- 选中图片
            self.heroSelectImg3 = display.newSprite("ui/fight/heroControl/heroSelect.png")
            self.heroSelectImg3:setVisible(false)
            self.heroBtn3:addChild(self.heroSelectImg3, -1)

            -- 选中的转圈效果
            -- 英雄选中的旋转表示
            local act1 = cc.RotateBy:create(1, 360)
            local seq  = cc.Sequence:create(act1)
            local rotateAction = cc.RepeatForever:create(seq)
            self.heroSelectImg3_2 = display.newSprite("ui/fight/heroControl/heroSelect2.png")
            self.heroSelectImg3_2:setVisible(false)
            self.heroBtn3:addChild(self.heroSelectImg3_2, -1)
            self.heroSelectImg3_2:runAction(rotateAction)
        end
    end

    -- -- 选中的感叹号
    -- self.exclamation3 = display.newSprite("ui/fight/exclamation.png")
    -- self.exclamation3:setVisible(false)
    -- self.exclamation3:setPositionY(50)
    -- self.heroBtn3:addChild(self.exclamation3, -1)





    -- -- 闪烁的特效
    -- local scaleto1 = cc.ScaleTo:create(0.3, 1.1) -- 0.5, 1.5)
    -- local scaleto2 = cc.ScaleTo:create(0.3, 0.9) -- 0.5,1.3)
    -- local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
    -- local repeatForever1 = cc.RepeatForever:create(squence)

    -- local scaleto1 = cc.ScaleTo:create(0.3, 1.1) -- 0.5, 1.5)
    -- local scaleto2 = cc.ScaleTo:create(0.3, 0.9) -- 0.5,1.3)
    -- local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
    -- local repeatForever2 = cc.RepeatForever:create(squence)

    -- local scaleto1 = cc.ScaleTo:create(0.3, 1.1) -- 0.5, 1.5)
    -- local scaleto2 = cc.ScaleTo:create(0.3, 0.9) -- 0.5,1.3)
    -- local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
    -- local repeatForever3 = cc.RepeatForever:create(squence)

    -- self.exclamation1:runAction(repeatForever1)
    -- self.exclamation2:runAction(repeatForever2)
    -- self.exclamation3:runAction(repeatForever3)

    -- 记录选中图片
    self.heroSelectImgs = {}
    if self.heroSelectImg1 then
        self.heroSelectImgs[1] = self.heroSelectImg1
    end
    if self.heroSelectImg2 then
        -- print("self.heroSelectImg2 添加第二个英雄的选中图片")
        self.heroSelectImgs[2] = self.heroSelectImg2
    end
    if self.heroSelectImg3 then
        self.heroSelectImgs[3] = self.heroSelectImg3
    end

    -- 记录选中图片2
    self.heroSelectImgs2 = {}
    if self.heroSelectImg1_2 then
        self.heroSelectImgs2[1] = self.heroSelectImg1_2
    end
    if self.heroSelectImg2_2 then
        self.heroSelectImgs2[2] = self.heroSelectImg2_2
    end
    if self.heroSelectImg3_2 then
        self.heroSelectImgs2[3] = self.heroSelectImg3_2
    end

    -- -- 记录感叹号图片
    -- self.exclamations = {}
    -- self.exclamations[1] = self.exclamation1
    -- self.exclamations[2] = self.exclamation2
    -- self.exclamations[3] = self.exclamation3


    -- print("self.heroBtn1.posX = "..tostring(self.heroBtn1:getPositionX()))
    -- print("self.heroBtn2.posX = "..tostring(self.heroBtn2:getPositionX()))
    -- print("self.heroBtn3.posX = "..tostring(self.heroBtn3:getPositionX()))


    self.lv1 = 1
    self.lv2 = 1
    self.lv3 = 1


    --  add by Owen, 2016.4.13, windows平台的话，需要增加快捷键
    if (device.platform == "mac" or device.platform == "windows") then
        self:setKeypadEnabled(true)
        self:addNodeEventListener(cc.KEYPAD_EVENT, function (event)
            -- dump(event, "dump keypad event")
            -- print("keypad event.code = "..tostring(event.code))
            -- print("cc.KeyCode.KEY_F1 = "..tostring(cc.KeyCode.KEY_F1))
            local key = tonumber(event.code) - 3
            if key == cc.KeyCode.KEY_F1 then
                -- f1表示第一个英雄
                self:heroBtnClicked(1)
            elseif key == cc.KeyCode.KEY_F2 then
                -- f2表示第一个英雄
                self:heroBtnClicked(2)
            elseif key == cc.KeyCode.KEY_F3 then
                -- f3表示第一个英雄
                self:heroBtnClicked(3)
            end
        end)
    end


end

-- 点击英雄按钮，btnIndex，表示点击的是第几个, 
-- btnIndex对应的就是map_.getHeros()中对应的table index
function HeroControlPanel:heroBtnClicked(btnIndex)
    -- add by Owen, 2016.4.13, 增加外面这层判定，
    -- 这个位置没有英雄上阵的话就不能点击
    -- print("HeroControlPanel:heroBtnClicked btnIndex = "..tostring(btnIndex))
    local heros = self.rt.map_:getHero()
    if heros[btnIndex] then
        -- 如果点击了一个已经死亡的英雄
        if heros[btnIndex].isDead_ then
            -- PC 版没有通过钻石让英雄快速复活的功能
            if GLOBAL_SHOW_WIN_TYPE 
                and (device.platform == "mac" or device.platform == "windows") then

                -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
                AudioMgr.playSound("Error")
                return
            else
                -- TO-DO, 弹出通过钻石立即复活页面
                local heroRelivePanel = HeroRelivePanel.new(self.battleUI, heros[btnIndex])
                self.battleUI:addChild(heroRelivePanel)
                -- heroRelivePanel:setPosition(display.cx, display.cy)
                return
            end
        end

    	if not self.heroSelectImgs[btnIndex]:isVisible() then
            for i = 1, #self.heroSelectImgs do
                self.heroSelectImgs[i]:setVisible(false)
                self.heroSelectImgs2[i]:setVisible(false)
                -- self.exclamations[i]:setVisible(false)
            end
    		self.heroSelectImgs[btnIndex]:setVisible(true)
            self.heroSelectImgs2[btnIndex]:setVisible(true)
            -- self.exclamations[btnIndex]:setVisible(true)
    		self.battleUI:assembleHeroSelected(btnIndex)
    	else
    		self.heroSelectImgs[btnIndex]:setVisible(false)
            self.heroSelectImgs2[btnIndex]:setVisible(false)
            -- self.exclamations[btnIndex]:setVisible(false)
            self.battleUI:heroAssembleCancel()
    	end
    end
end

-- 设置选中取消选中状态, 但选中英雄以后，这个函数已废弃
function HeroControlPanel:setSelected(value, index)

    for i, v in ipairs(self.heroSelectImgs) do
        if i == index then
            v:setVisible(value)
        else
            -- 如果是置为true，可见的话，则其他的选中图片要置为不可见
            if value then
                v:setVisible(not value)
            end
        end
    end

    for i, v in ipairs(self.heroSelectImgs2) do
        if i == index then
            v:setVisible(value)
        else
            -- 如果是置为true，可见的话，则其他的选中图片要置为不可见
            if value then
                v:setVisible(not value)
            end
        end
    end



	-- if self.heroSelectImg1 then
 --       self.heroSelectImg1:setVisible(value)
 --   end
	-- if self.heroSelectImg2 then
 --        self.heroSelectImg2:setVisible(value)
 --    end
	-- if self.heroSelectImg3 then
 --        self.heroSelectImg3:setVisible(value)
 --    end

 --    if self.heroSelectImg1_2 then
 --        self.heroSelectImg1_2:setVisible(value)
 --    end
 --    if self.heroSelectImg2_2 then
 --        self.heroSelectImg2_2:setVisible(value)
 --    end
 --    if self.heroSelectImg3_2 then
 --        self.heroSelectImg3_2:setVisible(value)
 --    end
end

-- 操作英雄移动以后，要取消选中状态
function HeroControlPanel:cancelSeletAll()
    if self.heroSelectImg1 then
        self.heroSelectImg1:setVisible(false)
    end
    if self.heroSelectImg2 then
        self.heroSelectImg2:setVisible(false)
    end
    if self.heroSelectImg3 then
        self.heroSelectImg3:setVisible(false)
    end

    if self.heroSelectImg1_2 then
        self.heroSelectImg1_2:setVisible(false)
    end
    if self.heroSelectImg2_2 then
        self.heroSelectImg2_2:setVisible(false)
    end
    if self.heroSelectImg3_2 then
        self.heroSelectImg3_2:setVisible(false)
    end

    -- self.exclamation1:setVisible(false)
    -- self.exclamation2:setVisible(false)
    -- self.exclamation3:setVisible(false)
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
-- 引导技能的时候，英雄按钮要置为不可点击
function HeroControlPanel:setUnTouchWhenSkillGuide()
    self.heroBtn1:setTouchEnabled(false)
end

-- 引导技能结束了，英雄按钮要置为可点击
function HeroControlPanel:setTouchWhenSkillGuideOver()
    self.heroBtn1:setTouchEnabled(true)
end

-- 实时更新血量和经验进度条
function HeroControlPanel:tick(dt)
	if self.rt then
		local heros = self.rt.map_:getHero()
		local hpSprite
		local expSprite
		local lvLabel
		local lv
		for i,v in ipairs (heros) do
			if i == 1 then
				hpSprite  = self.hpSprite1
				expSprite = self.expSprite1
				lvLabel   = self.lvlabel1
				lv        = self.lv1
			elseif i == 2 then
				hpSprite  = self.hpSprite2
				expSprite = self.expSprite2
				lvLabel   = self.lvlabel2
				lv        = self.lv2
			elseif i == 3 then
				hpSprite  = self.hpSprite3
				expSprite = self.expSprite3
				lvLabel   = self.lvlabel3
				lv        = self.lv3
			end

			if not v.isDead_ then
                -- 灰色的图像这位不可见
                self.heroGrayImgs[i]:setVisible(false)
                self.reliveLabels[i]:setVisible(false)

				if v.level_ ~= lv then
					lvLabel:setString(v.level_)
					if i == 1 then
						self.lv1 = v.level_
					elseif i == 2 then
						self.lv2 = v.level_
					elseif i == 3 then
						self.lv3 = v.level_
					end
				end
				
                hpSprite:setPercentage(100 * (v.hp_ / v.maxHp_) )

                -- print("v.level_ = "..tostring(v.level_))
				if v.level_ == BattleDataManager:getMaxHeroLevel() then
					-- expSprite:setScaleX(1)	
                    -- print("英雄已经满级了")
                    expSprite:setPercentage(100)

				else
					local allExp = BattleDataManager:getHeroLevelNeedExp(v.level_ + 1)
					-- print("hero v.exp_ = "..v.exp_.." allExp = "..allExp)

					-- expSprite:setScaleX(v.exp_ / BattleDataManager:getHeroLevelNeedExp(v.level_ + 1))

                    -- print("v.exp_ / BattleDataManager:getHeroLevelNeedExp(v.level_ + 1) = "
                    --     ..tostring(v.exp_ / BattleDataManager:getHeroLevelNeedExp(v.level_ + 1)))

                    expSprite:setPercentage(100 * v.exp_ / BattleDataManager:getHeroLevelNeedExp(v.level_ + 1))


				end
			else
                -- 英雄死亡了
                hpSprite:setPercentage(100 * (v.hp_ / v.maxHp_) )

                -- 显示灰色的头像，并开始倒计时
                self.heroGrayImgs[i]:setVisible(true)

                -- PC 版没有通过钻石让英雄快速复活的功能
                if GLOBAL_SHOW_WIN_TYPE 
                    and (device.platform == "mac" or device.platform == "windows") then
                
                else
                    self.reliveLabels[i]:setVisible(true)
                end

                -- 英雄这次死亡需要多久复活
                local heroNeedTime = 0
                -- 获得墓碑的倒计时
                local leftTime     = 0
                local tombs  = self.rt.tombs
                -- 更新所有的墓碑
                for k, tomb in pairs(tombs) do
                    if tomb.mainID == v.mainID_ then
                        leftTime = tomb.reviveTime
                        heroNeedTime = tomb.allReviveTime
                        break
                    end
                end
                -- print("英雄这次死亡需要多久复活 heroNeedTime = "..tostring(heroNeedTime)
                --     .." 墓碑的倒计时 leftTime = "..tostring(leftTime))
                self.heroGrayImgs[i]:setPercentage(100*leftTime/heroNeedTime)


                -- 判定一下英雄复活引导有没有显示过
                if not GlobalData.getHasShowReliveGuide() 
                    and not self.rt.paused_ then
                    self:guideHeroRelive(i)
                end

			end
		end
	end
end

-- 显示英雄复活引导, heroIndex 表示死亡的是第几个英雄
function HeroControlPanel:guideHeroRelive(heroIndex)
    print("HeroControlPanel:guideHeroRelive heroIndex = "..tostring(heroIndex))

    -- 暂停游戏
    self.rt:pausePlay()

    local layer = display.newColorLayer(cc.c4b(0,0,0,180))

    layer:setContentSize(cc.size(display.width, display.height))
    

    local size = cc.size(60, 60)
    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.battleUI:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local heroBtn
    if heroIndex == 1 then
        heroBtn = self.heroBtn1
    elseif heroIndex == 2 then
        heroBtn = self.heroBtn2
    elseif heroIndex == 3 then
        heroBtn = self.heroBtn3
    end

    local rect = heroBtn:getCascadeBoundingBox()
    local pos = cc.p(rect.x + rect.width/2,rect.y+rect.height/2)

    local image = ccui.ImageView:create("ui/common/mask_img.png")
    image:setScale9Enabled(true)
    image:setCapInsets(cc.rect(20,20,20,20))
    image:setContentSize(cc.size(90,90))
    image:setTouchEnabled(true)
    local node = cc.Node:create()
    node:addChild(image)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        node:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        node:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    local imageSize = image:getContentSize()

    -- x = x - 140
    -- y = y - 50
    local spriteSize = heroBtn:getContentSize()
    -- 技能点击区域引导的时候，增加一个黄框在外面
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(110,110))
    frame:setPosition(pos.x, pos.y)
    self.m_ClipNode:addChild(frame)

    node:setPosition(pos.x, pos.y)
    -- node:setPosition(display.cx, display.cy)
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        --local rect = cc.rect(pos.x - imageSize.width - 35, pos.y - 35, 50, 50)
        local rect = heroBtn:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            local finger = heroBtn:getChildByName("finger")
            if finger then
                finger:removeFromParent()
                finger = nil
            end
            -- print("点击了指定的区域")
            
            -- 显示英雄复活页面
            local heros = self.rt.map_:getHero()
            local heroRelivePanel = HeroRelivePanel.new(self.battleUI, heros[heroIndex], true)
            self.battleUI:addChild(heroRelivePanel)

            self.m_ClipNode:removeSelf()


            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    local finger = EffectAniCache.getFingerInHall()
    finger:setName("finger")
    heroBtn:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end

function HeroControlPanel:setRuntime(rt)
	self.rt = rt
    local heros = self.rt.map_:getHero()

    -- add by Owen, 2016.7.21, 如果英雄有羁绊的话，需要在头像右边显示羁绊图标
    local groups = GlobalData.getActiveGroup()
    -- dump(groups, "dump MapRuntime:dealLoveRival 激活的羁绊")
    local group
    local icons = {{}, {}, {}}
    for i,v in ipairs(groups) do
        group = GroupProperties.get(v)
        for i2, v2 in ipairs(heros) do
            if group[v2.mainID_] then
                icons[i2][#icons[i2] + 1] = group[v2.mainID_].icon
            end
        end
    end

    -- 记录需要显示在头像边上的技能 icon
    local jibanIcon    -- 羁绊图标
    local needAddBtn   -- 需要添加羁绊图标的那个英雄按钮
    for i, v in ipairs(icons) do
        if i == 1 then
            needAddBtn = self.heroBtn1
        elseif i == 2 then
            needAddBtn = self.heroBtn2
        elseif i == 3 then
            needAddBtn = self.heroBtn3
        end
        
        if #v > 0 then
            for i2, v2 in ipairs(v) do
                jibanIcon = display.newSprite("ui/Icons/groupIcon/"..v2..".png")
                    :addTo(needAddBtn)
                    :setScale(0.2)
                    :pos(i2 * 25 + 25, -50)
                    -- :pos(i2 * 25 - 40, 58)    -- 放在头顶
            end
        end
    end

    local heroIconDiffX = -1   -- 英雄头像X轴偏移
    local heroIconDiffY = 2    -- 英雄头像Y轴偏移
    -- 记录灰色头像数组
    if not self.heroGrayImgs then
        self.heroGrayImgs = {}
        self.reliveLabels = {}
    end
    for i,v in ipairs(heros) do
        -- 更新英雄按钮的图片
        if i == 1 then
            self.heroImg1:setTexture("ui/Icons/heroIcon/"..v.mainID_..".png")
            if not self.heroGrayImg1 then
                local heroGrayImg1 = display.newSprite("ui/Icons/heroIcon/"..v.mainID_.."hui.png")

                local progress = cc.ProgressTimer:create(heroGrayImg1)
                progress:setType(display.PROGRESS_TIMER_BAR)
                progress:setBarChangeRate(cc.p(0,1))
                progress:setMidpoint(cc.p(0,0))
                progress:setPosition(heroIconDiffX, heroIconDiffY)
                progress:setVisible(false)
                progress:setPercentage(100)

                self.heroBtn1:addChild(progress)

                self.heroGrayImgs[1] = progress

                progress:setScale(0.7)

                -- 复活文字
                self.relivelabel1 = cc.ui.UILabel.new({
                        UILabelType = 2,
                        font = GLOBAL_FONTNAME,
                        text = WordLanguage.Relive,
                        size = 20,
                        color = cc.c3b(255, 0, 0),
                    })
                    :pos(0, 0)
                    :addTo(self.heroBtn1)
                self.relivelabel1:setAnchorPoint(0.5, 0.5)
                self.relivelabel1:enableOutline(cc.c4b(0, 0,0,255), 1)
                self.reliveLabels[1] = self.relivelabel1

                -- 闪烁的特效
                local scaleto1 = cc.ScaleTo:create(0.3, 1.2) -- 0.5, 1.5)
                local scaleto2 = cc.ScaleTo:create(0.3, 0.85) -- 0.5,1.3)
                local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
                local repeatForever1 = cc.RepeatForever:create(squence)
                self.relivelabel1:runAction(repeatForever1)
            end
            self.lvImg1:setTexture("ui/fight/heroControl/"..v.mainID_.."_LvImg.png")
        elseif i == 2 then
            self.heroImg2:setTexture("ui/Icons/heroIcon/"..v.mainID_..".png")
            -- 英雄的灰色头像
            if not self.heroGrayImg2 then
                local heroGrayImg2 = display.newSprite("ui/Icons/heroIcon/"..v.mainID_.."hui.png")

                local progress = cc.ProgressTimer:create(heroGrayImg2)
                progress:setType(display.PROGRESS_TIMER_BAR)
                progress:setBarChangeRate(cc.p(0,1))
                progress:setMidpoint(cc.p(0,0))
                progress:setPosition(heroIconDiffX, heroIconDiffY)
                progress:setVisible(false)
                progress:setPercentage(100)
                progress:setScale(0.7)

                self.heroBtn2:addChild(progress)

                self.heroGrayImgs[2] = progress

                -- 复活文字
                self.relivelabel2 = cc.ui.UILabel.new({
                        UILabelType = 2,
                        font = GLOBAL_FONTNAME,
                        text = WordLanguage.Relive,
                        size = 20,
                        color = cc.c3b(255, 0, 0),
                    })
                    :setVisible(false)
                    :pos(0, 0)
                    :addTo(self.heroBtn2)
                self.relivelabel2:setAnchorPoint(0.5, 0.5)
                self.relivelabel2:enableOutline(cc.c4b(0, 0,0,255), 1)
                self.reliveLabels[2] = self.relivelabel2
                -- 闪烁的特效
                local scaleto1 = cc.ScaleTo:create(0.3, 1.2) -- 0.5, 1.5)
                local scaleto2 = cc.ScaleTo:create(0.3, 0.85) -- 0.5,1.3)
                local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
                local repeatForever1 = cc.RepeatForever:create(squence)
                self.relivelabel2:runAction(repeatForever1)
            end
            self.lvImg2:setTexture("ui/fight/heroControl/"..v.mainID_.."_LvImg.png")
        elseif i == 3 then
            self.heroImg3:setTexture("ui/Icons/heroIcon/"..v.mainID_..".png")
            -- 英雄的灰色头像
            if not self.heroGrayImg3 then
                local heroGrayImg3 = display.newSprite("ui/Icons/heroIcon/"..v.mainID_.."hui.png")

                local progress = cc.ProgressTimer:create(heroGrayImg3)
                progress:setType(display.PROGRESS_TIMER_BAR)
                progress:setBarChangeRate(cc.p(0,1))
                progress:setMidpoint(cc.p(0,0))
                progress:setPosition(heroIconDiffX, heroIconDiffY)
                progress:setVisible(false)
                progress:setPercentage(100)
                progress:setScale(0.7)

                self.heroBtn3:addChild(progress)

                self.heroGrayImgs[3] = progress

                -- 复活文字
                self.relivelabel3 = cc.ui.UILabel.new({
                        UILabelType = 2,
                        font = GLOBAL_FONTNAME,
                        text = WordLanguage.Relive,
                        size = 20,
                        color = cc.c3b(255, 0, 0)
                    })
                    :setVisible(false)
                    :pos(0, 0)
                    :addTo(self.heroBtn3)
                self.relivelabel3:setAnchorPoint(0.5, 0.5)
                self.relivelabel3:enableOutline(cc.c4b(0, 0,0,255), 1)
                self.reliveLabels[3] = self.relivelabel3
                -- 闪烁的特效
                local scaleto1 = cc.ScaleTo:create(0.3, 1.2) -- 0.5, 1.5)
                local scaleto2 = cc.ScaleTo:create(0.3, 0.85) -- 0.5,1.3)
                local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
                local repeatForever1 = cc.RepeatForever:create(squence)
                self.relivelabel3:runAction(repeatForever1)
            end
            -- self.heroBtn3:setButtonImage("normal", "ui/fight/heroControl/"..v.mainID_..".png")
            self.lvImg3:setTexture("ui/fight/heroControl/"..v.mainID_.."_LvImg.png")
        end
    end


    local posX      = 50
    local posY      = 150
    local diffY     = 140   -- 两个英雄按钮之间的间隔
    -- 显示成未上阵图片
    -- print("HeroControlPanel 上阵英雄的数量 #heros = "..tostring(#heros))
    if #heros < 3 then
        for i = #heros + 1, 3 do
            if i == 1 and self.heroImg1 then
                self.expOutline1:setVisible(false)
                self.expSprite1:setVisible(false)
                self.hpOutline1:setVisible(false)
                self.hpSprite1:setVisible(false)
                self.heroBtn1:setVisible(false)
                self.heroImg1:setVisible(false)
                self.lvImg1:setVisible(false)
                self.lvlabel1:setVisible(false)
                self.heroSelectImg1:setVisible(false)
                self.heroSelectImg1_2:setVisible(false)
                self.hpLabel1:setVisible(false)
                self.expLabel1:setVisible(false)

                local noHero = display.newSprite("ui/fight/heroControl/noHero.png")
                    :pos(posX, posY)
                    :addTo(self)

            end
            if i == 2 and self.heroImg2 then
                self.expOutline2:setVisible(false)
                self.expSprite2:setVisible(false)
                self.hpOutline2:setVisible(false)
                self.hpSprite2:setVisible(false)
                self.heroBtn2:setVisible(false)
                self.heroImg2:setVisible(false)
                self.lvImg2:setVisible(false)
                self.lvlabel2:setVisible(false)
                self.heroSelectImg2:setVisible(false)
                self.heroSelectImg2_2:setVisible(false)
                self.hpLabel2:setVisible(false)
                self.expLabel2:setVisible(false)

                local noHero = display.newSprite("ui/fight/heroControl/noHero.png")
                    :pos(posX, posY - diffY)
                    :addTo(self)
            end
            if i == 3 and self.heroImg3 then
                self.expOutline3:setVisible(false)
                self.expSprite3:setVisible(false)
                self.hpOutline3:setVisible(false)
                self.hpSprite3:setVisible(false)
                self.heroBtn3:setVisible(false)
                self.heroImg3:setVisible(false)
                self.lvImg3:setVisible(false)
                self.lvlabel3:setVisible(false)
                self.heroSelectImg3:setVisible(false)
                self.heroSelectImg3_2:setVisible(false)
                self.hpLabel3:setVisible(false)
                self.expLabel3:setVisible(false)

                local noHero = display.newSprite("ui/fight/heroControl/noHero.png")
                    :pos(posX, posY - 2*diffY)
                    :addTo(self)
            end
        end
    end

    self.heros = heros
end

function HeroControlPanel:onRestart()
    -- print("HeroControlPanel:onRestart")
    -- 清空经验条
    if self.expSprite1 then
        self.hpSprite1:setPercentage(100)
        self.expSprite1:setPercentage(0)
    end
    if self.expSprite2 then
        self.hpSprite2:setPercentage(100)
        self.expSprite2:setPercentage(0)
    end
    if self.expSprite3 then
        self.hpSprite3:setPercentage(100)
        self.expSprite3:setPercentage(0)
    end

    self.lv1 = 1
    self.lv2 = 1
    self.lv3 = 1
    if self.lvlabel1 then
        self.lvlabel1:setString("1")
    end
    if self.lvlabel2 then
        self.lvlabel2:setString("1")
    end
    if self.lvlabel3 then
        self.lvlabel3:setString("1")
    end
end

return HeroControlPanel
