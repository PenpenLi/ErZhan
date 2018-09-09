
--[[刷怪倒计时的控件]]


local BattleDataManager = require("app.map.data.BattleDataManager")
local EventNames        = require("tools.EventNames")
local NotifyCenter      = require("tools.NotifyCenter")
local Timer             = require("tools.Timer")
local RangeObject       = require("app.map.RangeObject")
local ObjectState       = require("app.map.ObjectState")
local StableGameProperties  = require("app.properties.StableGameProperties")
local MapConstants          = require("app.map.MapConstants")

local BossTimeLayer = class("BossTimeLayer", function()
    return display.newNode()
end)

require "socket"


local DELAY_TIME = 20  --s

function BossTimeLayer:ctor(battleui)
	-- print("BossTimeLayer:ctor()")
	self.map = nil  --在setRuntime中被赋值
	self.rt=nil --在setRuntime中被赋值
    self.beganBtns = {}
    self.beginTime =nil--showRoundStartBtn
    self.award = nil--showRoundStartBtn
    self.bornPoints = {}

    self.battleUI = battleui

        -- print("开始创建刷怪按钮")
    local function createBtn(rotation)--rotation为按钮将被放置的角度
        local btn = cc.ui.UIPushButton.new({normal = "ui/fight/roundStart.png",
        pressed = "ui/fight/roundStart.png",
        disabled = "ui/fight/roundStart.png"})
        :onButtonClicked(function(...)
            -- print("点击刷怪按钮")
            self:onClickBtn()
        end)
        btn.dirSprite = display.newSprite("ui/fight/direct.png")
            :addTo(btn)
            :setPosition(0,-35)

            btn.progress1 = display.newProgressTimer("ui/fight/roundTime.png",display.PROGRESS_TIMER_RADIAL)
            btn:addChild(btn.progress1,2)
            -- btn.progress1:setRotation(-rotation)

            btn:setPosition(0,80)
        return btn
        -- body
    end

    local btn = createBtn()
    -- local scaleto1 = cc.ScaleTo:create(0.5, 1.1) -- 0.5, 1.5)
    -- local scaleto2 = cc.ScaleTo:create(0.5, 0.9) -- 0.5,1.3)
    -- local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
    -- local repeatForever = cc.RepeatForever:create(squence)
    -- btn:runAction(repeatForever)

    local bornPointNode = display.newNode()
    bornPointNode:addChild(btn)
    bornPointNode.btn = btn
    bornPointNode:setVisible(true)

    self.btn = btn


    self:addChild(bornPointNode)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        bornPointNode:setScale(GLOBAL_FIGHT_UI_SCALE)
    end
    self.bornPointNode = bornPointNode
end


-- 显示刷怪倒计时按钮
function BossTimeLayer:show(boss, x, y, retainTime, needClickCount)
    -- print("BossTimeLayer:show retainTime = "..tostring(retainTime))
    if boss.mainID_ == "100504" or boss.mainID_ == "100608" then
        -- 地狱炎魔是要显示倒计时的
        self.btn:setVisible(true)
        self.boss = boss
        self.x = x
        self.y = y - 100
        self.retainTime = retainTime
        self.passedTime = 0
        self.needClickCount = needClickCount  -- 需要点击几次才能取消释放
        self.clickCount = 0    -- 记录这个按钮点击了几次

        self.btn.progress1:setPercentage(0)

        if GLOBAL_MOBILE_UI_CODE then -- self.map:getCamera():getScale() ~= 1 then 
            local camera = boss.map_:getCamera()
            
            local scale = camera:getScale()
            -- print("camera:getScale() = "..tostring(scale))
            self.bornPointNode:setScale(scale)

            local x, y = boss.mapRuntime_.camera_:convertToWorldPosition(x, y) 
            self.bornPointNode:setPosition(x,y)
        end     
    elseif boss.mainID_ == "100505" or boss.mainID_ == "100609" then
        -- 打恶魔王是不需要显示倒计时的
        self.daYeMoIsEnd = nil
        self.btn:setVisible(true)
        self.boss = boss
        self.x = x
        self.y = y - 100
        self.retainTime = retainTime
        self.passedTime = 0
        self.needClickCount = needClickCount  -- 需要点击几次才能取消释放
        self.clickCount = 0    -- 记录这个按钮点击了几次
    
    elseif boss.mainID_ == "100416" then
        -- add by Owen, 2016.5.13, 处理天气制造机，头上需要显示天气变换按钮
        self.btn:setVisible(false)
        self.boss = boss
        self.x = x
        self.y = y - 100
        self.retainTime = retainTime
        self.passedTime = 0
        self.needClickCount = needClickCount  -- 需要点击几次才能取消释放
        self.clickCount = 0    -- 记录这个按钮点击了几次



        local weatherBtn = cc.ui.UIPushButton.new({normal = "ui/weather/outImg.png",
            pressed = "ui/weather/outImg.png",
            disabled = "ui/weather/outImg.png"})
            :onButtonClicked(function(...)
                -- print("点击天气变化按钮")
                self:onClickWeatherBtn((...))
            end)

        -- 在地图放大了的屏幕上，战斗UI需要放大显示
        if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            weatherBtn:setScale(GLOBAL_FIGHT_UI_SCALE)
        end

        weatherBtn:setPosition(0, 80)
        self:addChild(weatherBtn)

        local weatherImg = display.newSprite("ui/weather/sun.png")
        weatherBtn:addChild(weatherImg)

        -- 天气按钮的倒计时遮罩
        -- local weatherMaskImg = display.newSprite("ui/weather/mask.png")
        -- weatherBtn:addChild(weatherMaskImg)
        -- weatherMaskImg:setVisible(false)
        local progress = display.newProgressTimer("ui/weather/mask.png",display.PROGRESS_TIMER_BAR)
        progress:setBarChangeRate(cc.p(0,1))
        progress:setMidpoint(cc.p(0,0))
        progress:setPosition(0,0)
        progress:setVisible(false)
        weatherBtn:addChild(progress)
        weatherMaskImg = progress


        if not self.weatherBtn then
            self.weatherBtn = {}
        end
        self.weatherBtn[#self.weatherBtn + 1] = weatherBtn
        weatherBtn.index = #self.weatherBtn

        if not self.weatherImg then
            self.weatherImg = {}
        end
        self.weatherImg[#self.weatherImg + 1] = weatherImg

        if not self.weatherMaskImg then
            self.weatherMaskImg = {}
        end
        self.weatherMaskImg[#self.weatherMaskImg + 1] = weatherMaskImg

        if not self.weatherBoss then
            self.weatherBoss = {}
        end
        self.weatherBoss[#self.weatherBoss + 1] = boss

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

        self.imageName = {
            "sun",
            "night",
            "rain",
            "snow",
            "wind",
        }

        -- 记录这个天气按钮存在了多长时间
        if not self.weatherTime then
            self.weatherTime = {}
        end
        self.weatherTime[#self.weatherTime + 1] = 0
        if not self.weatherIndex then
            self.weatherIndex = {}
        end
        self.weatherIndex[#self.weatherIndex + 1] = 1
    end

    self:setVisible(true)
end

-- 点击了Boss的倒计时按钮
function BossTimeLayer:onClickBtn()
    self.clickCount = self.clickCount + 1
    -- print("BossTimeLayer:onClickBtn self.clickCount = "..tostring(self.clickCount))

    if self.boss.mainID_ == "100504" or self.boss.mainID_ == "100608" then
        -- 如果是地狱炎魔的倒计时被点击了
        if self.clickCount >= self.needClickCount then
            -- 如果是地狱炎魔的倒计时被点击了, 要先播放Skill_02的收手动作
            -- 第三个参数为true，表示要强制打断spine动画
            local finishFunc = function ( ... )
                self.boss:playAni("Idle", true, false)
                self.boss:setState(ObjectState.IDLE)
                self:setVisible(false)
            end
            self.boss:playAni("Skill_02", false, true, nil, finishFunc)
            self:setVisible(false)
        end
    elseif self.boss.mainID_ == "100505" or self.boss.mainID_ == "100609" then
        -- 如果是地狱炎魔的倒计时被点击了
        -- print("大恶魔王被点击了 "..tostring(self.clickCount).."次")
        local bReturn = false    -- 是否要把Boss回退到原位
        local percent = 0
        if self.clickCount < 4 then
            percent = StableGameProperties.DA_E_MO_CLICK_RETURN_RANDOM[self.clickCount]
            local returnRandom = math.random(10000)
            -- print("大恶魔王回退的概率 returnRandom = "..tostring(returnRandom)
            --     .." percent = "..tostring(percent))
            if returnRandom < percent then
                bReturn = true
            end
        else
            bReturn = true
        end

        if bReturn then
            self:dealDaYeMoEnd()
        end
    end

end

-- print("点击天气变化按钮")
function BossTimeLayer:onClickWeatherBtn(params)
    local index = params.target.index
    -- print("BossTimeLayer:onClickWeatherBtn index = "..tostring(index))
    -- self.weatherBtn[index]:setVisible(false)
    -- EnableGraySprite(self.weatherImg[index])

    -- self.weatherImg[index]:
    self.weatherMaskImg[index]:setVisible(true)
    self.weatherBtn[index]:setTouchEnabled(false)


    -- print("self.weatherIndex[index] = "..tostring(self.weatherIndex[index]))
    BattleDataManager:setWeather(self.weatherIndex[index] - 1)

    self.weatherBtn[index].inVisibleTime = 0

    -- 记录点击了天气制造机的天气变换按钮以后，制造的天气持续了多长时间
    self.weatherRetainTime = 10000

    -- 通过点击天气制造机的按钮来改变天气
    self.battleUI.infoPanel:changeWeatherByMachine()

    -- self.weatherBtn[index]:removeSelf()
    -- print("self.weatherIndex[index] = "..tostring(self.weatherIndex[index]))
    -- BattleDataManager:setWeather(self.weatherIndex[index] - 1)
    -- for i = #self.weatherBtn,1,-1 do
    --     if i == index then
    --         table.remove(self.weatherBtn, index)
    --     end
    --     if i > index then
    --         self.weatherBtn[i].index = self.weatherBtn[i].index - 1
    --     end
    -- end
    -- for i = #self.weatherImg,1,-1 do
    --     if i == index then
    --         table.remove(self.weatherImg, index)
    --     end
    -- end
    -- for i = #self.weatherBoss,1,-1 do
    --     if i == index then
    --         table.remove(self.weatherBoss, index)
    --     end
    -- end
    -- for i = #self.weatherTime,1,-1 do
    --     if i == index then
    --         table.remove(self.weatherTime, index)
    --     end
    -- end
    -- for i = #self.weatherIndex,1,-1 do
    --     if i == index then
    --         table.remove(self.weatherIndex, index)
    --     end
    -- end


end

function BossTimeLayer:dealDaYeMoEnd()

    -- 第三个参数为true，表示要强制打断spine动画
    -- print("打恶魔王的时间到了 self.boss._beforeFlyPosX = "..tostring(self.boss._beforeFlyPosX)
    --     .." self.boss._beforeFlyPosY = "..tostring(self.boss._beforeFlyPosY))

    self:setVisible(false)

    -- 开始传送动画的时候，把isHide置为true
    self.boss.isHide = true


    local finishFunc = function ( ... )
        -- print("位面传送技能释放完了，要播放DeliverSkill_02动画")
        self.boss.x_ = self.boss._beforeFlyPosX
        self.boss.y_ = self.boss._beforeFlyPosY

        -- 位面传送回来的动作播放完了以后的处理
        local finishFunc2 = function ( ... )
            -- 把大恶魔王置为眩晕状态，这样就不会攻击英雄了
            self.boss._isComa = false
            -- 传送动画播放完了以后，isHide置为false
            self.boss.isHide = false

            self.boss:playAni("Move_Side", true, true)
            self.boss:setState(ObjectState.MOVE)

            -- 重置套路
            self.boss.attackCount_ = 0
            -- AI类型重新改为2，主动攻击型
            self.boss.AImode_ = MapConstants.MONSTER_AI_MODE_TWO
        end

        self.boss:playAni("DeliverSkill_02", false, false, nil, finishFunc2, nil)

    end

    -- 把Boss传送到那个位置去
    self.boss:playAni("DeliverSkill_01", false, true, nil, finishFunc, nil)

end

function BossTimeLayer:tick(dt)
    if self.boss.mapRuntime_.paused_ then
        return
    end
    -- print("BossTimeLayer:tick")
    self.passedTime = self.passedTime + dt

	if GLOBAL_MOBILE_UI_CODE then -- self.map:getCamera():getScale() ~= 1 then 

        local x, y = self.boss.mapRuntime_.camera_:convertToWorldPosition(self.x, self.y) 
        -- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
        self.bornPointNode:setPosition(x,y)
 
    end

    self.btn.progress1:setPercentage((self.passedTime/self.retainTime)*100)

    if self.passedTime >= self.retainTime and self.boss.mainID_ ~= "100416" then
        self:setVisible(false)
        if self.boss.mainID_ == "100504" or self.boss.mainID_ == "100608" then
            -- 如果是地狱炎魔的倒计时被点击了, 要先播放Skill_02的收手动作
            -- 第三个参数为true，表示要强制打断spine动画
            -- local finishFunc = function ( ... )
            --     self.boss:playAni("Idle", true, false)
            --     self.boss:setState(ObjectState.IDLE)
            --     self:setVisible(false)
            -- end
            -- self.boss:playAni("Skill_02", false, true, nil, finishFunc)
            self:setVisible(false)

        elseif self.boss.mainID_ == "100505" or self.boss.mainID_ == "100609" then
            -- 如果是打野魔王的倒计时到了
            if not self.daYeMoIsEnd then
                self.daYeMoIsEnd = true
                self:dealDaYeMoEnd()
            end
        end
    end

    -- add by Owen, 2016.5.13, 处理天气制造机，头上需要显示天气变换按钮
    if self.weatherBtn and #self.weatherBtn > 0 then

        for i, v in ipairs(self.weatherBtn) do
            if self.weatherBoss[i].destroyed_ then
                v:setVisible(false)
            end

            local boss = self.weatherBoss[i]
            local weatherBtn = self.weatherBtn[i]

            if GLOBAL_MOBILE_UI_CODE then -- self.map:getCamera():getScale() ~= 1 then 
                local x, y = boss.mapRuntime_.camera_:convertToWorldPosition(
                    boss.x_ + boss.radiusOffsetX_,
                    boss.y_ + boss.radiusOffsetY_ + boss.radius_ + 50) 
                -- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
                weatherBtn:setPosition(x,y)
            end

            -- 过了一段时间以后，又要把天气制造机头上的按钮置为可见
            if self.weatherMaskImg[i]:isVisible() and not self.weatherBoss[i].destroyed_ then
                v.inVisibleTime = v.inVisibleTime + dt

                local percent = v.inVisibleTime / (StableGameProperties.MACHINE_COOLDOWN_TIME/1000)
                if percent > 1 then
                    percent = 1
                end
                percent = 1- percent
                -- print("BossTimeLayer:tick percent = "..tostring(percent))
                self.weatherMaskImg[i]:setPercentage(100*percent)

                if v.inVisibleTime >= StableGameProperties.MACHINE_COOLDOWN_TIME/1000 then
                    -- v:setVisible(true)
                    -- DisableGraySprite(self.weatherImg[i])
                    -- print("self.weatherMaskImg[i]:setVisible(false)")
                    self.weatherMaskImg[i]:setVisible(false)
                    v:setTouchEnabled(true)
                end
            end

            self.weatherTime[i] = self.weatherTime[i] + dt
            -- print("self.weatherTime[i] = "..tostring(self.weatherTime[i]))
            if self.weatherTime[i] >= StableGameProperties.MACHINE_CHANGE_TIME/1000 then

                self.weatherTime[i] = 0
                self.weatherIndex[i] = self.weatherIndex[i] + 1
                if self.weatherIndex[i] == 6 then
                    self.weatherIndex[i] = 1
                end

                local index   = self.weatherIndex[i]
                -- print("BossTimeLayer:tick index = "..tostring(index))
                local imgName = self.imageName[index]
                -- print("BossTimeLayer:tick imgName = "..tostring(imgName))
                self.weatherImg[i]:setTexture("ui/weather/"..imgName..".png")
            end
            
        end
    end

end


function BossTimeLayer:hideRoundStartBtn(event)
    -- print("BossTimeLayer:hideRoundStartBtn(event)")
    for i = #self.beganBtns, 1, -1 do
        local btn = self.beganBtns[i]
        btn:removeSelf()
        table.remove(self.beganBtns, i)
    end
end
function BossTimeLayer:setRuntime(rt)
    self.rt = rt
    if rt~= nil then 
        self.map = rt.map_
        self:getBornPointsData()
    end 

end



return BossTimeLayer