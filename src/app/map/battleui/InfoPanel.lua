

-- 左上角的血量、金币的显示信息的界面

local BattleDataManager      = require("app.map.data.BattleDataManager")
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local TowerProperties        = require("app.properties.TowerProperties")
local GlobalData             = require("tools.GlobalData")
local StableGameProperties   = require("app.properties.StableGameProperties")
local BuffBase               = require("app.map.skills.BuffBase")
local MapConstants           = require("app.map.MapConstants")
local BuffProperties         = require("app.properties.BuffProperties")
local SkillFactory           = require("app.map.skills.SkillFactory")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local ObjectDetailPanel      = require("app.map.battleui.ObjectDetailPanel")
local InfoPanel = class("InfoPanel", function()
    return display.newNode()
end)

function InfoPanel:ctor(battleUI)
	print("infoPanel:ctor()")
    self.infoPanel = display.newNode()
    self:addChild(self.infoPanel)

    self.battleUI = battleUI

    local diffX = 30
    local diffY = 13

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    -- windows平台上面，战斗UI要缩放0.8
    if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        self:setScale(0.8)
    end

    local sprite = display.newSprite("ui/fight/infoPanel.png")
    self.infoPanel:addChild(sprite)


    ---------------------------------- 波数 -------------------------------
    local diffX = 25    -- x轴位置
    local diffY = 32    -- y轴位置
    local waveImg = display.newSprite("ui/fight/monsterIcon.png")
    sprite:addChild(waveImg)
    -- waveImg:setScale(0.4)
    waveImg:setPosition(diffX + 85, diffY + 53)

    -- 当前波数
    self.curRoundLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "2",
        align = cc.ui.TEXT_ALIGN_RIGHT,
        font = GLOBAL_FONTNAME,
        size = 22,
        x = diffX - 10,
        y = diffY,
    }):align(display.CENTER_RIGHT)
    :addTo(self.infoPanel)
    self.curRoundLabel:enableOutline(cc.c4b(71, 40,0,255), 2)
    local divison = cc.ui.UILabel.new({
        text = "/",
        align = cc.ui.TEXT_ALIGN_LEFT,
        font = GLOBAL_FONTNAME,
        size = 22,
        x = diffX - 10,
        y = diffY,
    })
    :addTo(self.infoPanel)
    divison:enableOutline(cc.c4b(71, 40,0,255), 2)
    -- 总波数
    self.totalRoundLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = BattleDataManager:getTotalRound(),
        align = cc.ui.TEXT_ALIGN_LEFT,
        font = GLOBAL_FONTNAME,
        size = 22,
        x = diffX,
        y = diffY,
    })
    :addTo(self.infoPanel)
    self.totalRoundLabel:enableOutline(cc.c4b(71, 40,0,255), 2)
    -- 波怪物
    self.totalWordLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
        -- UILabelType = 2,
        text = WordLanguage.WaveMonster,
        color = cc.c3b(255,214,0),
        font = GLOBAL_FONTNAME,
        size = 18,
        x = diffX + 45,
        y = diffY,
    })
    :addTo(self.infoPanel)
    self.totalWordLabel:enableOutline(cc.c4b(71, 40, 0, 255), 2) 
    -- self.currentPointLabel_:enableOutline(cc.c4b(255, 255, 255, 255), 2)

    -- 根据不同的语言，修改天赋技能描述文字的位置
    if GlobalData.getLanguage() == "EN" then
        self.totalWordLabel:setVisible(false)
    end

    

    ------------------------------- 血量和金币数 ----------------------------
    local posX = 92     -- 第一个的血量图片的X位置
    local diffX1 = 20    -- 血量图片和血量文字的间隔
    local diffX2 = 78    -- 血量图片和金币图片的间隔
    local posY   = 47    -- 第一个的血量图片的Y位置

    local lifeImg = display.newSprite("ui/fight/life.png")
    sprite:addChild(lifeImg)
    lifeImg:setPosition(posX, posY)

    local goldImg = display.newSprite("ui/fight/gold.png")
    sprite:addChild(goldImg)
    goldImg:setPosition(posX + diffX2, posY)

    -- print("BattleUI:createChildren()")
    -- 显示剩余血量
    self.hpLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "20",
        font = GLOBAL_FONTNAME,
        size = 24,
        x = posX + diffX1,
        y = posY + 1,
    })
    :addTo(sprite)
    -- self.hpLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1) 

    -- 显示金币数
    self.goldCountLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "20",
        font = GLOBAL_FONTNAME,
        size = 24,
        x = posX + diffX1 + diffX2,
        y = posY + 1,
    })
    :addTo(sprite)
    -- self.goldCountLabel:enableOutline(cc.c4b(0, 0, 0, 255), 1) 

 

    ---------------------------------- 显示天气 --------------------------------
    -- local weather = cc.ui.UILabel.new({
    --     -- UILabelType = 2,
    --     text = "天气",
    --     -- font = GLOBAL_FONTNAME,
    --     x = 160,
    --     y = -35
    -- })
    -- :addTo(self.infoPanel)

    local diffX = 30
    local diffY = 13

    self.weatherSprite = display.newSprite("ui/weather/sun.png")
    :addTo(self.infoPanel, -1)
    :setScale(0.8)
    :pos(diffX - 123, diffY - 4)
    self.weatherImgPos = {diffX - 123, diffY - 4}

    self.weatherSprite2 = display.newSprite("ui/weather/sun.png")
    :addTo(self.infoPanel, -1)
    :setScale(0.8)
    :pos(diffX - 123 + 50, diffY - 4)
    self.weatherImgPos2 = {diffX - 123 + 50, diffY - 4}

    self.imageName = {
        "sun",
        "night",
        "rain",
        "snow",
        "wind",
    }
    local weather = BattleDataManager:getWeather()
    self.weatherSprite:setTexture("ui/weather/"..self.imageName[weather+1]..".png")
    -- self.weatherSprite:setVisible(false)


    self.weatherLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        size = 50,
        x = diffX + 220,
        y = diffY -35
    })
    :addTo(self.infoPanel)
    self.weatherLabel:setVisible(false)

    self.gameLv = GlobalData.getGameLv()
    self.mode   = GlobalData.getGameMode()

    -- 记录后面不进行自己的天气变化倒计时机制
    self.changeBySelf = true
    -- 记录机器改变天气的持续时间
    self.machineRetainTime = 0

    -- 处理模式3的UI
    if self.mode == 3 then
        self:dealThreeMode()
    end

end

function InfoPanel:changeWeather( ... )
    local weather = BattleDataManager:getWeather()
    -- print("InfoPanel:changeWeather weather = "..tostring(weather))

    -- add by Owen, 2016.6.1, 增加一个天气变化的时候，icon移动的效果
    self.weatherSprite2:setTexture("ui/weather/"..self.imageName[weather+1]..".png")

    -- 天气图标移动的距离
    local diffX = self.weatherImgPos2[1] - self.weatherImgPos[1]

    -- 第一个天气图标要往前移
    local moveAction = cc.MoveTo:create(0.5, cc.p(self.weatherImgPos2[1], 
    self.weatherImgPos2[2]))
    self.weatherSprite:runAction(moveAction)
    -- 第二个天气图标要往前移
    local act1 = cc.MoveTo:create(0.5, cc.p(self.weatherImgPos[1], 
        self.weatherImgPos[2]))
    local function finc( ... )
        local testSprite    = self.weatherSprite
        self.weatherSprite  = self.weatherSprite2
        self.weatherSprite2 = testSprite
        -- self.weatherSprite2:setPositionX(self.weatherImgPos[1])
    end
    local act2 = cc.CallFunc:create(finc)
    local seq  = cc.Sequence:create(act1, act2)
    self.weatherSprite2:runAction(seq)






    -- self.weatherSprite:setTexture("ui/weather/"..self.imageName[weather+1]..".png")
    



    -- add by Owen, 2016.5.24, 风天的特效不需要一直存在，需要过一会再出现
    if self.rt and not self.rt.paused_ then
        -- 如果还没有点击开始按钮，那么先不切换天气
        if not BattleDataManager:getIsRoundStarted() then
            return
        end

        -- 记录天气变化后过了多久，在关卡中，每过一段时间需要随机修改天气


        if weather == 4 then
            -- 记录播放风天特效后过了多久，到达一定时间后，才需要又显示一次风天特效
            self.beWindTime = 0
            -- 记录当前是不是风天
            self.isWind = true

            local function finc( ... )
                self.windEff = nil
            end

            -- 显示风天特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_windy", false, finc)
            self.battleUI:addChild(effect, -1)
            effect:setScale(1)
            effect:setPosition(display.cx, display.height/2 - 100)
            self.windEff = effect
            -- 风天效果要根据战斗UI缩放
            if GLOBAL_FIGHT_UI_SCALE ~= 1 then
                self.windEff:setScale(GLOBAL_FIGHT_UI_SCALE)
            end
        else
            self.isWind = false
            if self.windEff then
                -- self.windEff:stopAllActions()
            end
        end
    end

    -- if weatherIndex == 0 then
    --     name = "sun"
    -- elseif weatherIndex == 1 then
    --     name = "night"
    -- elseif weatherIndex == 2 then
    --     name = "yu"
    -- elseif weatherIndex == 3 then
    --     name = "xue"
    -- elseif weatherIndex == 4 then
    --     name = "wind"
    -- end

    -- add by Owen, 2016.5.13, 如果是第8关模式3，变换天气的时候要给怪物加Buff
    if self.gameLv == 8  and self.mode == 3 and self.rt then
        -- print("InfoPanel:changeWeather 2")

        local monsters = self.rt.map_.simpleMonsters
        for k, object in pairs(monsters) do
            
            -- 晴天-光之精灵 ID=100207, +30%伤害减免
            if object.mainID_ == "100207" then
                if weather == 0 then
                    local buff  = BuffProperties.get("220909")
                    BuffBase.addTimeBuff(object, buff, object)
                else
                    local buff  = BuffProperties.get("220909")
                    BuffBase.clearOneTimeBuff(object, buff.occupied)
                end
            end

            -- 雨天-水之精灵 ID=100208, 每秒恢复10%生命
            if object.mainID_ == "100208" then
                if weather == 2 then
                    local buff  = BuffProperties.get("220910")
                    BuffBase.addTimeBuff(object, buff, object)
                else
                    local buff  = BuffProperties.get("220910")
                    BuffBase.clearOneTimeBuff(object, buff.occupied)
                end
            end

            -- 夜晚-暗之精灵 ID=100209, 变成地下怪物
            if object.mainID_ == "100209" then
                -- print("InfoPanel:changeWeather mainID_ = 100209")
                if weather == 1 then
                    object.walkLayer_ = MapConstants.MONSTER_WALK_LAYER_UNDER
                    object.sprite_:setOpacity(100)
                else
                    object.walkLayer_ = MapConstants.MONSTER_WALK_LAYER_EARTH
                    object.sprite_:setOpacity(255)
                end
            end

            -- 雪天-冰之精灵ID=100210, 变成地下怪物
            -- 雪天期间，冰之精灵自动释放，冷却3秒
            -- 使范围内的建筑塔被冻结无法攻击，持续3秒，玩家可以手动点击移除
            if object.mainID_ == "100210" then
                if weather == 3 then
                    -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
                    SkillFactory.addAISkill(object, {{3, 3000, "130438"}})
                else
                    SkillFactory.clearAISkill(object)
                end
            end


            -- 风天-风之精灵（ID=100211） 释放机制：风天期间，风之精灵自动释放，冷却3秒
            -- 使范围内的精灵移动速度+50%，持续3秒
            if object.mainID_ == "100211" then
                if weather == 4 then
                    -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
                    SkillFactory.addAISkill(object, {{3, 3000, "130439"}})
                else
                    SkillFactory.clearAISkill(object)
                end
            end

        end
    end
end 

-- 通过点击天气制造机的按钮来改变天气
function InfoPanel:changeWeatherByMachine()
    -- print("InfoPanel:changeWeatherByMachine()")
    -- 记录机器改变天气的持续时间
    self.machineRetainTime = StableGameProperties.MACHINE_RETAIN_TIME/1000
    -- 记录后面不进行自己的天气变化倒计时机制
    self.changeBySelf = false
end

-- add by Owen, 2016.5.13, 如果是第8关模式3，那么每隔一段时间需要修改天气
function InfoPanel:tick(dt)
    -- add by Owen, 2016.5.24, 风天的特效不需要一直存在，需要过一会再出现
    if self.rt and not self.rt.paused_ then
        -- 如果还没有点击开始按钮，那么先不切换天气
        if not BattleDataManager:getIsRoundStarted() then
            return
        end

        -- 处理第九关模式3法阵倒计时进度条
        if self.lv9Progress and self.lv9FaZhenTime > 0 then
            self.lv9FaZhenTime = self.lv9FaZhenTime - dt
            self.lv9Progress:setPercentage(100 * (self.lv9FaZhenTime/self.faZhenRetainTime))
            -- 时间到了就把法阵倒计时进度条给隐藏掉
            if self.lv9FaZhenTime <= 0 then
                self:hideFaZhenTime()
            end
        end

        -- 每一关里面，要根据 mapConfig 中的changeWeaTime配置，来每过一段时间修改天气
        -- 对第八关模式3无效
        if self.gameLv ~= 8  and self.mode ~= 3 then
            -- 记录天气变化后过了多久，时间到了后需要自动变化天气
            if not self.weatherChangeTime1 then
                self.weatherChangeTime1 = 0
            end
            self.weatherChangeTime1 = self.weatherChangeTime1 + dt

            -- 配置的过了多久以后需要变化天气
            local needChangeTime = BattleDataManager:getWeatherChangeTime()
            -- print("配置的过了多久以后需要变化天气 needChangeTime = "..tostring(needChangeTime))
            if needChangeTime and self.weatherChangeTime1 >= needChangeTime/1000 then
                
                local index = math.random(1000)
                index = math.ceil(index/200)
                index = index - 1
                -- print("InfoPanel:tick 变换天气，index = "..tostring(index))
                BattleDataManager:setWeather(index)

                self.weatherChangeTime1 = 0
            end
        end


        if self.isWind then

            self.beWindTime = self.beWindTime + dt

            -- 如果是风天的时候，每过这么久的时间，需要显示一次风天的特效
            if self.beWindTime >= StableGameProperties.WINDY_EFF_SHOW_TIME/1000 then
                self.beWindTime = 0

                local function finc( ... )
                    self.windEff = nil
                end

                -- 显示风天特效
                local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_windy", false, finc)
                self.battleUI:addChild(effect, -1)
                effect:setScale(1)
                effect:setPosition(display.cx, display.height/2 - 100)
                self.windEff = effect
            end

        end
    end

    if self.gameLv == 8  and self.mode == 3 and self.rt and not self.rt.paused_ then
        -- 如果还没有点击开始按钮，那么先不切换天气
        if not BattleDataManager:getIsRoundStarted() then
            return
        end

        -- 记录天气变化后过了多久，时间到了后需要自动变化天气
        if not self.weatherChangeTime then
            self.weatherChangeTime = 0
        end
        self.weatherChangeTime = self.weatherChangeTime + dt

        -- 记录天气制造机制造的天气的倒计时
        if self.machineRetainTime > 0 then
            self.machineRetainTime = self.machineRetainTime - dt
            if self.machineRetainTime <= 0 then
                self.machineRetainTime = 0

                -- 记录后面开始进入自己的天气变化倒计时机制
                self.changeBySelf = true
            end
        end

        -- 是自己改变天气的
        if self.changeBySelf 
            and self.weatherChangeTime >= StableGameProperties.CHANGE_WEATHER_AUTO_TIME/1000 then
            
            local index = math.random(1000)
            index = math.ceil(index/200)
            index = index - 1
            -- print("InfoPanel:tick 变换天气，index = "..tostring(index))
            BattleDataManager:setWeather(index)

            self.weatherChangeTime = 0
        end
    end
end

-- add by Owen, 2016.5.30, 用来做第7关的模式3，误杀了逃跑精灵要记录
function InfoPanel:updateKillElves()
    self.killElvesCount = self.killElvesCount + 1
    self.curKillElves:setString(self.killElvesCount)
end

-- add by Owen, 2016.6.8, 用来做第12关的模式3，每杀死一个怪物都需要更新一下数量
function InfoPanel:updateTwelveThree()
    -- 判定当前是不是有钥匙没有被使用
    if not self.hasKeyNotUse then

        self.twelveKillCount = self.twelveKillCount + 1
        if self.twelveKeyCount < #StableGameProperties.KILL_MONSTER_COUNT then
            -- 更新当前已经杀死的怪物数量
            self.curKillElves:setString(self.twelveKillCount)
            -- 开启下一把钥匙需要杀死多少怪物
            local needCount = StableGameProperties.KILL_MONSTER_COUNT[self.twelveKeyCount + 1]
            
            if self.twelveKillCount == needCount then
                -- 判定当前是不是有钥匙没有被使用
                self.hasKeyNotUse = true

                -- 给所有的塔基上面显示一把钥匙
                for id, standRange in pairs(self.rt:getAllStandRange()) do
                    if standRange.isLock then
                        standRange:showKey()
                    end
                end
            end
        end
    end
end

-- add by Owen, 2016.6.14, 用来做第14关的模式3，更新宝箱的图片显示
-- isSuccess == true,  表示守护成功
-- isSuccess == false, 表示宝物被怪物抢走了
function InfoPanel:updateFourteenThree(isSuccess)
    local image = self.blackBoxs[self.fourteenBoxIndex]
    if isSuccess then
        -- 根据是守护成功还是失败，把第几个宝箱置为对应的图片
        image:setTexture("ui/fight/threeMode/fourteen/success.png")
        self.selectImgs[self.fourteenBoxIndex]:setVisible(true)
    else
        image:setTexture("ui/fight/threeMode/fourteen/failed.png")

        -- 记录失败被抢了几个宝箱
        self.fourteenFailedBox = self.fourteenFailedBox + 1
    end
    self.fourteenBoxIndex = self.fourteenBoxIndex + 1
    if self.fourteenBoxIndex > StableGameProperties.TREASURE_NEED_COUNT then
        self.fourteenBoxIndex = StableGameProperties.TREASURE_NEED_COUNT
    end
end

-- add by Owen, 2016.6.12, 制作12关模式3，只有当前的钥匙使用之后，才能更新下一把
function InfoPanel:showNextKeyCount()
    -- 判定当前是不是有钥匙没有被使用
    self.hasKeyNotUse = false

    -- 数量达标之后，就开启了一把新的钥匙
    self.twelveKeyCount = self.twelveKeyCount + 1

    -- print("InfoPanel:showNextKeyCount self.twelveKeyCount = "..tostring(self.twelveKeyCount))

    -- 还有下一把钥匙需要开启, 则更新UI上的显示数据
    if self.twelveKeyCount < #StableGameProperties.KILL_MONSTER_COUNT then
        -- 开启下一把钥匙需要杀死多少怪物
        local newNeedCount = StableGameProperties.KILL_MONSTER_COUNT[self.twelveKeyCount + 1]
        self.needKillLabel:setString(newNeedCount)
    else
        -- 所有的钥匙都开启以后，就把左上角的UI给隐藏掉
        self.lv12mode3Bg:setVisible(false)
    end
end

-- add by Owen, 2016.5.30, 用来做第3关的模式3，更新血量进度条和血条提示的位置
function InfoPanel:updateLvThreeHp()
    if self.gameLv == 3 and self.mode == 3 then
        local hp = BattleDataManager:getHp()

        -- print("InfoPanel:updateLvThreeHp hp = "..tostring(hp)
        --     .." self.maxHp = "..tostring(self.maxHp))
        -- 更新血量进度条
        self.lv3Progress:setPercentage(100 * (hp/self.maxHp))

        -- 更新血量图片的位置
        self.lv3HpImg:setPositionX(self.lv3BgWidth 
            - ( (self.maxHp - hp)/self.maxHp)*self.lv3ProWidth
            - (self.lv3BgWidth - self.lv3ProWidth)/2 )
    end
end

function InfoPanel:dealThreeMode()
    if self.gameLv == 3 then
        -- 第3关第3模式，需要显示血量与通关获得星星数量之间的关系
        local lv3mode3Bg = display.newSprite("ui/fight/threeMode/three/bg.png")
            :addTo(self.infoPanel)
            :pos(20, -62)

        -- 进度条
        self.lv3Progress = display.newProgressTimer("ui/fight/threeMode/three/progress.png",
            display.PROGRESS_TIMER_BAR)
            :pos(219/2, 22/2)
            :addTo(lv3mode3Bg)
        -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
        self.lv3Progress:setBarChangeRate(cc.p(1, 0))
        -- 设置进度条的起始位置, ccp(0,0)表示下面
        self.lv3Progress:setMidpoint(cc.p(0, 0))
        self.lv3Progress:setPercentage(100)


        local hp = BattleDataManager:getHp()
        local mapConfig = BattleDataManager:getConfig()
        local maxHp     = mapConfig.maxHp
        local hpRating  = mapConfig.hpRating

        -- 记录这一关的最大血量
        self.maxHp = maxHp

        local bgWidth    = 219
        local proWidth   = 199
        -- 记录两个宽度变量
        self.lv3BgWidth  = bgWidth
        self.lv3ProWidth = proWidth

        local diffX    = bgWidth - proWidth
        -- 三个分割线的X轴的位置
        local posX1    = (hpRating[1]/maxHp) * proWidth + diffX
        local posX2    = (hpRating[2]/maxHp) * proWidth + diffX
        local posX3    = (hpRating[3]/maxHp) * proWidth + diffX
        
        local posY     = 11     -- 分割线的Y轴的位置
        local posY1    = 40     -- 显示在上面的血量图片的位置
        local posY2    = -21    -- 显示在下面的星星的位置

        -- 血量图片
        self.lv3HpImg = display.newSprite("ui/fight/threeMode/three/hp.png")
            :addTo(lv3mode3Bg)
            :pos(bgWidth - (bgWidth - proWidth)/2 , posY1)

        -- 隔断
        local divison1 = display.newSprite("ui/fight/threeMode/three/divison.png")
            :addTo(lv3mode3Bg)
            :pos(posX1, posY)
        -- 1颗星的图片
        local star1 = display.newSprite("ui/fight/threeMode/three/star1.png")
            :addTo(lv3mode3Bg)
            :pos(posX1, posY2)

        -- 隔断
        local divison2 = display.newSprite("ui/fight/threeMode/three/divison.png")
            :addTo(lv3mode3Bg)
            :pos(posX2, posY)
        -- 2颗星的图片
        local star2 = display.newSprite("ui/fight/threeMode/three/star2.png")
            :addTo(lv3mode3Bg)
            :pos(posX2, posY2)

        -- 隔断
        local divison3 = display.newSprite("ui/fight/threeMode/three/divison.png")
            :addTo(lv3mode3Bg)
            :pos(posX3, posY)
        -- 3颗星的图片
        local star3 = display.newSprite("ui/fight/threeMode/three/star3.png")
            :addTo(lv3mode3Bg)
            :pos(posX3, posY2)





    elseif self.gameLv == 7 or self.gameLv == 10 then    -- or self.gameLv == 14 then
        -- 第7关第3模式，需要显示误杀的逃跑精灵数量
        local lv7mode3Bg = display.newSprite("ui/fight/threeMode/seven/bg.png")
            :addTo(self.infoPanel)
            :pos(20, -70)

        self.lv7mode3Bg = lv7mode3Bg

        local posX  = 20        -- 误杀的逃跑精灵数量  文字的X轴位置
        local posY  = 25       -- 误杀的逃跑精灵数量  文字的Y轴位置
        local diffX = 165      -- 文字与数字之间的间隔
        

        local wuShaString = cc.ui.UILabel.new({
            UILabelType = 2,
            text = WordLanguage.ManslaughterElves,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        wuShaString:enableOutline(cc.c4b(0,0,0,255), 2)

        -- 当前杀死的逃跑精灵数量
        self.curKillElves = cc.ui.UILabel.new({
            UILabelType = 2,
            text = "0",
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX + diffX,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        self.curKillElves:enableOutline(cc.c4b(0,0,0,255), 2)

        self.killElvesCount = 0
        
        -- 当前杀死的逃跑精灵数量
        
        local divison = cc.ui.UILabel.new({
            text = "/",
            align = cc.ui.TEXT_ALIGN_LEFT,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX + diffX + 10,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        divison:enableOutline(cc.c4b(0,0,0,255), 2)

        -- 总共能杀死的逃跑精灵的数量
        local totalElvesLabel = cc.ui.UILabel.new({
            UILabelType = 2,
            text = StableGameProperties.WUSHA_ELVES_COUNT,
            align = cc.ui.TEXT_ALIGN_LEFT,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX + diffX + 20,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        totalElvesLabel:enableOutline(cc.c4b(0,0,0,255), 2)

        if self.gameLv == 10 then
            -- 第十关的时候，显示精华收集的数量

            -- 修改背景图片的位置
            lv7mode3Bg:setPosition(400, 0)
            
            -- 把“杀死的逃跑精灵”文字，改为“收集的精华数量”
            wuShaString:setString(WordLanguage.CollectedEssence)
            -- 总共需要收集的精华数量
            totalElvesLabel:setString(StableGameProperties.Essence_NEED_COUNT)
            -- 记录已经手机的精华数量
            self.killElvesCount = 0

        elseif self.gameLv == 14 then
            -- 第十四关的时候，显示守护的宝物数量
            -- 把“杀死的逃跑精灵”文字，改为“收集的精华数量”
            wuShaString:setString(WordLanguage.TreasuresCount)
            -- 总共需要守护的宝物数量
            totalElvesLabel:setString(StableGameProperties.TREASURE_NEED_COUNT)
            -- 记录已经守护的宝物数量
            self.killElvesCount = 0
        end

    elseif self.gameLv == 9 then
        -- add by Owen, 2016.6.19, 第9关模式3要显示法阵倒计时
        local lv3mode3Bg = display.newSprite("ui/fight/threeMode/three/bg.png")
            :addTo(self.infoPanel)
            :pos(display.cx - 219/2, -10)
            :setVisible(false)

        -- "法阵倒计时文字"
        self.totalWordLabel = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
            -- UILabelType = 2,
            text = WordLanguage.FaZhenCountdown,
            color = cc.c3b(255,214,0),
            font = GLOBAL_FONTNAME,
            size = 20,
            x = 219/2,
            y = 40,
        })
        :addTo(lv3mode3Bg)
        self.totalWordLabel:enableOutline(cc.c4b(71, 40, 0, 255), 2) 

        

        self.lv9mode3Bg = lv3mode3Bg

        -- 进度条
        self.lv9Progress = display.newProgressTimer("ui/fight/threeMode/three/progress.png",
            display.PROGRESS_TIMER_BAR)
            :pos(219/2, 22/2)
            :addTo(lv3mode3Bg)
        -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
        self.lv9Progress:setBarChangeRate(cc.p(1, 0))
        -- 设置进度条的起始位置, ccp(0,0)表示下面
        self.lv9Progress:setMidpoint(cc.p(0, 0))
        self.lv9Progress:setPercentage(100)

        -- 法阵倒计时时间
        self.lv9FaZhenTime = 0
        -- 配置的法阵需要持续的时间
        self.faZhenRetainTime = StableGameProperties.FA_ZHEN_RETAIN_TIME/1000

    elseif self.gameLv == 11 then
        -- add by Owen, 2016.6.19, 第11关模式3要一直在头顶上显示英雄的数值
        self.objectDetailPanel = ObjectDetailPanel.new()
        self.battleUI:addChild(self.objectDetailPanel)
        self.objectDetailPanel:setPosition((180 + 444 + 35)*GLOBAL_FIGHT_UI_SCALE, 
            display.height - 76 * GLOBAL_FIGHT_UI_SCALE)

    elseif self.gameLv == 12 then
        -- 第12关第3模式，需要显示杀死怪物的数量，以及开启钥匙需要的数量
        local lv7mode3Bg = display.newSprite("ui/fight/threeMode/twelve/bg.png")
            :addTo(self.infoPanel)
            :pos(20, -70)

        self.lv12mode3Bg = lv7mode3Bg

        local posX  = 46        -- 误杀的逃跑精灵数量  文字的X轴位置
        local posY  = 25       -- 误杀的逃跑精灵数量  文字的Y轴位置
        local diffX = 68      -- 文字与数字之间的间隔
        

        local wuShaString = cc.ui.UILabel.new({
            UILabelType = 2,
            text = WordLanguage.KillMonsterCount,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        wuShaString:enableOutline(cc.c4b(0,0,0,255), 2)

        -- 当前杀死的怪物的数量
        self.curKillElves = cc.ui.UILabel.new({
            UILabelType = 2,
            text = "0",
            font = GLOBAL_FONTNAME,
            align = cc.ui.TEXT_ALIGN_RIGHT,
            size = 20,
            x = posX + diffX + 17,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        self.curKillElves:setAnchorPoint(1.0, 0.5)
        self.curKillElves:enableOutline(cc.c4b(0,0,0,255), 2)

        self.killElvesCount = 0
        
        -- 当前杀死的逃跑精灵数量
        local divison = cc.ui.UILabel.new({
            text = "/",
            align = cc.ui.TEXT_ALIGN_LEFT,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX + diffX + 15,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        divison:enableOutline(cc.c4b(0,0,0,255), 2)

        -- 获得当前钥匙需要杀死的怪物数量
        self.needKillLabel = cc.ui.UILabel.new({
            UILabelType = 2,
            text = StableGameProperties.KILL_MONSTER_COUNT[1],
            align = cc.ui.TEXT_ALIGN_LEFT,
            font = GLOBAL_FONTNAME,
            size = 20,
            x = posX + diffX + 25,
            y = posY,
        })
        :addTo(lv7mode3Bg)
        self.needKillLabel:enableOutline(cc.c4b(0,0,0,255), 2)

        -- 记录第12关模式3，已经杀死的怪物的数量
        self.twelveKillCount = 0
        -- 记录第12关模式3，已经获得的钥匙的数量
        self.twelveKeyCount = 0

        -- 判定当前是不是有钥匙没有被使用
        self.hasKeyNotUse   = false

    elseif self.gameLv == 14 then
        -- 14关模式3，要显示守护的箱子的数量
        local lv14mode3Bg = display.newSprite("ui/fight/threeMode/fourteen/bg.png")
            :addTo(self.infoPanel)
            :pos(20, -70)

        self.lv14mode3Bg = lv14mode3Bg

        local posX  = 40     -- 第一个黑色的槽的X位置
        local diffX = 55     -- 两个槽之间的间隔
        local posY  = 25     -- 第一个黑色的槽的Y位置

        -- 5个黑色的槽
        self.blackBoxs  = {}
        -- 5个勾的图片
        self.selectImgs = {}

        local black
        local selectImg
        for i = 1, StableGameProperties.TREASURE_NEED_COUNT do
            black = display.newSprite("ui/fight/threeMode/fourteen/black.png")
                :addTo(lv14mode3Bg)
                :pos(posX + diffX*(i-1), posY)

            selectImg = display.newSprite("ui/fight/threeMode/fourteen/select.png")
                :setVisible(false)
                :addTo(lv14mode3Bg)
                :pos(posX + diffX*(i-1) + 15, posY + 15)

            self.blackBoxs[i]  = black
            self.selectImgs[i] = selectImg
        end
        -- 记录出现的是第几个宝箱
        self.fourteenBoxIndex  = 1
        -- 记录失败被抢了几个宝箱
        self.fourteenFailedBox = 0
    end
end

-- add by Owen, 2016.6.19, 11关模式3要一直显示英雄的属性
function InfoPanel:showElevenThree()
    -- 显示英雄的详细信息
    if self.objectDetailPanel then
        local heros = self.rt.map_:getHero()
        self.objectDetailPanel:show(heros[1], true)
    end
end

-- add by Owen, 2016.6.19, 第9关模式3显示法阵倒计时
function InfoPanel:showFaZhenTime()
    print("InfoPanel:showFaZhenTime()")
    self.lv9Progress:setVisible(true)
    self.lv9Progress:setPercentage(100)
    self.lv9mode3Bg:setVisible(true)

    -- 法阵倒计时时间
    self.lv9FaZhenTime = StableGameProperties.FA_ZHEN_RETAIN_TIME/1000
end

-- add by Owen, 2016.6.19, 第9关模式3隐藏法阵倒计时
function InfoPanel:hideFaZhenTime()
    print("InfoPanel:hideFaZhenTime()")
    self.lv9Progress:setPercentage(100)
    self.lv9mode3Bg:setVisible(false)
    -- 法阵倒计时时间
    self.lv9FaZhenTime = 0
end

function InfoPanel:setRuntime(rt)
    self.rt = rt
end

function InfoPanel:onRestart()
    -- 这个变量也用来记录, 已经收集的精华数量
    if self.killElvesCount then
        self.killElvesCount = 0
        self.curKillElves:setString("0")
    end
    -- 清空记录第12关模式3，已经获得的钥匙的数量
    if self.twelveKeyCount then
        self.killElvesCount = 0

        -- 已经杀死的怪物数量
        self.twelveKillCount = 0
        -- 已经获得的钥匙数量
        self.twelveKeyCount = 0
        -- 判定当前是不是有钥匙没有被使用
        self.hasKeyNotUse   = false
        -- 更新界面显示
        self.lv12mode3Bg:setVisible(true)
        self.curKillElves:setString(0)
        self.needKillLabel:setString(StableGameProperties.KILL_MONSTER_COUNT[1])
    end

    -- 隐藏掉第九关模式3的法阵时间倒计时进度条
    if self.lv9Progress then
        self.lv9Progress:setPercentage(100)
        self.lv9Progress:setVisible(false)
        -- 法阵倒计时时间
        self.lv9FaZhenTime = 0

        self.lv9mode3Bg:setVisible(false)
    end

    -- 记录14关模式3出现的是第几个宝箱
    if self.fourteenBoxIndex then
        self.fourteenBoxIndex = 1

        -- 记录失败被抢了几个宝箱
        self.fourteenFailedBox = 0

        for i = 1, StableGameProperties.TREASURE_NEED_COUNT do
            self.blackBoxs[i]:setTexture("ui/fight/threeMode/fourteen/black.png")
            self.selectImgs[i]:setVisible(false)
        end
    end
end


return InfoPanel