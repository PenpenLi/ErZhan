
-- 有些羁绊技能是从屏幕上方飞下来一个按钮，所有的按钮都是添加在这个FlyBtnPanel中
-- 变换天气的时候，按照 晴天/夜晚/雨天/雪天/风天 这样的顺序来变换
-- BattleDataManager 中的 weather 0/1/2/3/4依次表示 晴天/夜晚/雨天/雪天/风天

local StableGameProperties  = require("app.properties.StableGameProperties")
local EventNames            = require("tools.EventNames")
local MapConstants          = require("app.map.MapConstants")
local BattleDataManager     = require("app.map.data.BattleDataManager")
local BuffBase              = require("app.map.skills.BuffBase")
local BuffProperties        = require("app.properties.BuffProperties")
local GroupProperties       = require("app.properties.GroupProperties")
-- FlyBtnPanel
local FlyBtnPanel = class("FlyBtnPanel", function()
    return display.newNode()
end)


function FlyBtnPanel:ctor()

	self:setContentSize(cc.size(display.width, display.height))

    -- 记录正在屏幕中飘的所有的按钮
    self.allBtns = {}

    -- 记录总共生成过几个往下飘的按钮
    self.allBtnCounts = 0

end

-- 生成一个从屏幕上方飞下来的按钮
function FlyBtnPanel:createFlyBtn(btnType)
    -- print("FlyBtnPanel:createFlyBtn btnType = "..tostring(btnType))

    -- local bgImg = display.newSprite("ui/weather/outImg.png")
    --     :addTo(self)
    --     :pos(500*GLOBAL_FIGHT_UI_SCALE, display.height)
    --     :setScale(GLOBAL_FIGHT_UI_SCALE)  -- 在地图放大了的屏幕上，战斗UI需要放大显示


    -- local btn = cc.ui.UIPushButton.new("ui/fight/tower/sell_Btn.png")
    local btn = cc.ui.UIPushButton.new("ui/weather/outImg.png")
    :onButtonClicked(function(...)
        -- self.map_:setDebugViewEnabled(not self.map_:isDebugViewEnabled())
        self:onClickFlyBtn(...)
    end)
    :pos(500*GLOBAL_FIGHT_UI_SCALE, display.height) -- math.random(200, display.width - 100), display.height)
    :addTo(self)
    :setScale(GLOBAL_FIGHT_UI_SCALE)  -- 在地图放大了的屏幕上，战斗UI需要放大显示

    local btnIcon = display.newSprite("ui/fight/tower/sell_Btn.png")
        :addTo(btn)
    btn.btnIcon = btnIcon


    if btnType == MapConstants.FLY_BTN_TYPE_RETURN_GOLD then
        -- btn:setButtonImage("normal", "ui/weather/flyGold.png")
        -- btn:setButtonImage("pressed", "ui/weather/flyGold.png")
        btnIcon:setTexture("ui/weather/flyGold.png")
    elseif btnType == MapConstants.FLY_BTN_TYPE_ADD_HERO_MAX_HP then
        -- btn:setButtonImage("normal", "ui/weather/maxHp.png")
        -- btn:setButtonImage("pressed", "ui/weather/maxHp.png")
        btnIcon:setTexture("ui/weather/maxHp.png")
    elseif btnType == MapConstants.FLY_BTN_TYPE_CHANGE_WEATHER then
        -- btn:setButtonImage("normal", "ui/weather/sun.png")
        -- btn:setButtonImage("pressed", "ui/weather/sun.png")
        btnIcon:setTexture("ui/weather/sun.png")
        btn.hasShowTime  = 0    -- 这个状态已经显示了多久了
        btn.weatherIndex = 0    -- 0/1/2/3/4 分别对应 晴天/夜晚/雨天/雪天/风天
    end

    -- print("#self.allBtns 1 = "..tostring(#self.allBtns))
    self.allBtns[#self.allBtns + 1] = btn
    -- print("#self.allBtns 2 = "..tostring(#self.allBtns))
    self.allBtnCounts = self.allBtnCounts + 1
    btn.btnIndex = self.allBtnCounts     -- 这个按钮在self.allBtns 中的索引
    btn.btnType  = btnType


    -- add by Owen, 2016.6.24, 根据屏幕高度计算按钮的飞行速度
    local needFlyTime = StableGameProperties.CHANGE_WEATHER_BTN_INTERVAL/MapConstants.MILLISECOND
    needFlyTime = needFlyTime * 5
    self.flySpeed = (display.height - 30)/needFlyTime    -- 需要的飞行速度为多少像素/秒
end

-- 点击了从屏幕上面飞下来的按钮
function FlyBtnPanel:onClickFlyBtn(params)
    -- print("FlyBtnPanel:onClickFlyBtn btnType = "..tostring(params.target.btnType))
    local btnType  = params.target.btnType
    local btnIndex = params.target.btnIndex

    if btnType == MapConstants.FLY_BTN_TYPE_RETURN_GOLD then
        -- 鹏翅金羽释放后返还一片金羽，拾取后随机获得所消耗金币*5%~15%
        local skillCost = BattleDataManager:getPengMoWangCast()
        local percent = math.random(500, 1500)
        local addGold = math.ceil(skillCost * percent/MapConstants.FOUDATION_PERCENT)
        -- print("鹏翅金羽释放后返还一片金羽, 消耗金币 = "..tostring(skillCost)
        --     .." 返还金币 = "..tostring(addGold))
        BattleDataManager:addGold(addGold)
    elseif btnType == MapConstants.FLY_BTN_TYPE_ADD_HERO_MAX_HP then
        -- 雨润杏花释放后返还一朵杏花，拾取后随机使一个英雄30秒内生命上限提升35%
        local heros  = self.rt.map_:getHero()
        local index  = math.random(1, #heros)
        -- 如果随机到的英雄死亡了，那么换另一个英雄
        local bHasHeroNotDead = false
        if heros[index].isDead_ then
            for i,v in ipairs(heros) do
                if not v.isDead_ then
                    index = i
                    bHasHeroNotDead = true
                    break
                end
            end
        else
            bHasHeroNotDead = true
        end
        if bHasHeroNotDead then
            local buffID = GroupProperties.get("19")["110301"]["addBuffId"]
            -- print("buffID = "..tostring(buffID))
            local buffConfig = BuffProperties.get(buffID)
            BuffBase.addTimeBuff(heros[index], buffConfig, nil, nil)
        end
    elseif btnType == MapConstants.FLY_BTN_TYPE_CHANGE_WEATHER then
        -- 菩提祖师每次论道讲禅可能引起天变，飘下一个按钮，切换晴/雨/风/夜/雪状态，
        BattleDataManager:setWeather(params.target.weatherIndex)
        self.retunOriginalWeatherTime = 0
    end

    local btn
    for i = #self.allBtns, 1, -1 do
        btn = self.allBtns[i]
        if btn.btnIndex == btnIndex then
            btn:removeSelf()
            table.remove(self.allBtns, i)
        end
    end

end

-- 切换天气按钮显示的图片
-- 0/1/2/3/4 分别对应 晴天/夜晚/雨天/雪天/风天
-- 变换天气的时候，按照 晴天/夜晚/雨天/雪天/风天 这样的顺序来变换
function FlyBtnPanel:changeWeatherBtnImg(btn)
    local imgName
    if btn.weatherIndex == 0 then
        imgName = "sun"
    elseif btn.weatherIndex == 1 then
        imgName = "night"
    elseif btn.weatherIndex == 2 then
        imgName = "rain"
    elseif btn.weatherIndex == 3 then
        imgName = "snow"
    elseif btn.weatherIndex == 4 then
        imgName = "wind"
    end
    -- btn:setButtonImage("normal", "ui/weather/"..imgName..".png")
    -- btn:setButtonImage("pressed", "ui/weather/"..imgName..".png")

    btn.btnIcon:setTexture("ui/weather/"..imgName..".png")
end

function FlyBtnPanel:tick(dt)
    -- 暂停的话就不tick了
    if self.rt.paused_ then
        return
    end

    -- 时间到了以后需要还原这张地图原来设置的天气
    local returnTime = StableGameProperties.RETURN_ORIGINAL_WEATHER_TIME/MapConstants.MILLISECOND
    if self.retunOriginalWeatherTime and self.retunOriginalWeatherTime <= returnTime then
        
        self.retunOriginalWeatherTime = self.retunOriginalWeatherTime + dt
        
        if self.retunOriginalWeatherTime >= returnTime then
            local mapConfig = BattleDataManager:getConfig()
            BattleDataManager:setWeather(mapConfig.weather)
        end
    end

    local btn
    for i = #self.allBtns, 1, -1 do

        btn = self.allBtns[i]
        
        -- 如果是变换天气的按钮，每过一段时间后需要变换按钮
        if btn.btnType == MapConstants.FLY_BTN_TYPE_CHANGE_WEATHER then
            -- add by Owen, 2016.6.24, 根据屏幕高度计算按钮的飞行速度
            btn:setPositionY(btn:getPositionY() - self.flySpeed*dt)

            -- 这个状态已经显示了多久了
            btn.hasShowTime = btn.hasShowTime + dt
            if btn.hasShowTime >= StableGameProperties.CHANGE_WEATHER_BTN_INTERVAL/MapConstants.MILLISECOND then
                -- 时间到了，需要切换图片
                btn.hasShowTime = 0

                -- 记录当前代表的天气
                if btn.weatherIndex == 4 then
                    btn.weatherIndex = 0
                else
                    btn.weatherIndex = btn.weatherIndex + 1
                end
                self:changeWeatherBtnImg(btn)
            end
        else
            -- 更新按钮位置
            btn:setPositionY(btn:getPositionY() - StableGameProperties.FLY_BTN_SPEED*dt)
        end

        
        -- print("btn:getPositionY() = "..tostring(btn:getPositionY()))

        -- 按钮掉落到屏幕下面以后，就移除自己
        if btn:getPositionY() < -100 then
            btn:removeSelf()
            table.remove(self.allBtns, i)
        end
    end
end

-- 设置 MapRuntime
function FlyBtnPanel:setRuntime(rt)
	-- print("FlyBtnPanel:setRuntime")
	self.rt = rt

end


return FlyBtnPanel