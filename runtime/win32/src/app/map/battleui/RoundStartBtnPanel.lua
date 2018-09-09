
--[[刷怪倒计时的控件]]


local BattleDataManager = require("app.map.data.BattleDataManager")
local EventNames    = require("tools.EventNames")
local NotifyCenter  = require("tools.NotifyCenter")
local Timer        = require("tools.Timer")
local RangeObject       = require("app.map.RangeObject")

local RoundStartBtnPanel = class("RoundStartBtnPanel", function()
    return display.newNode()
end)

require "socket"


local DELAY_TIME = 20  --s

function RoundStartBtnPanel:ctor()
	-- print("RoundStartBtnPanel:ctor()")
	self.map = nil  --在setRuntime中被赋值
	self.rt=nil --在setRuntime中被赋值
    self.beganBtns = {}
    self.beginTime =nil--showRoundStartBtn
    self.award = nil--showRoundStartBtn
    self.bornPoints = {}
end


-- 显示刷怪倒计时按钮
function RoundStartBtnPanel:showRoundStartBtn(event)
    -- print("RoundStartBtnPanel:showRoundStartBtn(event)")
    self:hideRoundStartBtn() --应对restart等情况下未清理的bug
    local nextRoundData = event._userData

    -- dump(nextRoundData, "dump nextRoundData")

    self:getNextRoundData(nextRoundData)
    self.isFirstRound = false  --重置是否第一波的判定

    if nextRoundData.isFirstRound then  --如果是第一波，则标记
        self.isFirstRound = true
    end
    -- dump(self.bornPoints,"bornPoints")
    --遍历出生点，创建按钮
    for key,bornPoint in pairs(self.bornPoints) do 
        if bornPoint.nextMonsterNum >0 then 
            -- print("开始创建刷怪按钮")
            local function createBtn(rotation)--rotation为按钮将被放置的角度
                local btn = cc.ui.UIPushButton.new({normal = "ui/fight/roundStart.png",
                pressed = "ui/fight/roundStart.png",
                disabled = "ui/fight/roundStart.png"})
                :onButtonClicked(function(...)
                    -- print("点击刷怪按钮")
                    -- add by Owen, 2016.4.23, 点开刷怪按钮的时候，需要播放音效
                    AudioMgr.playSound("Enemies")

                    self:dealTimeChange()
                    self.rt.handler_:startRoundByClickBtn()
                    self:hideRoundStartBtn()
                end)
                btn.dirSprite = display.newSprite("ui/fight/direct.png")
                    :addTo(btn)
                    :setPosition(0,-40)
                if not self.isFirstRound then  --如果不是第一波，则刷圈
                    --local progressTo1 = cca.progressTo(DELAY_TIME,100)
                    btn.progress1 = display.newProgressTimer("ui/fight/roundTime.png",display.PROGRESS_TIMER_RADIAL)
                    btn:addChild(btn.progress1,2)
                    btn.progress1:setRotation(-rotation)
                    --btn.progress1:runAction(progressTo1)
                else --如果不是第一波，则直接填满
                    btn.sprite = display.newSprite("ui/fight/roundTime.png")
                    btn:addChild(btn.sprite)
                end 
                    btn:setPosition(0,80)
                return btn
                -- body
            end

            local btn = createBtn(bornPoint.angle)
            local scaleto1 = cc.ScaleTo:create(0.5, 1.0) -- 0.5, 1.5)
            local scaleto2 = cc.ScaleTo:create(0.5, 0.8) -- 0.5,1.3)
            local squence = cc.Sequence:create(scaleto1,scaleto2,nil)
            local repeatForever = cc.RepeatForever:create(squence)
            btn:runAction(repeatForever)

            local bornPointNode = display.newNode()
            bornPointNode:addChild(btn)
            bornPointNode.btn = btn
            bornPointNode:setVisible(true)
            -- print("bornPoint.angle = "..tostring(bornPoint.angle))
            bornPointNode:setRotation(bornPoint.angle)
            bornPointNode:setPosition(bornPoint.x,bornPoint.y)

            if GLOBAL_MOBILE_UI_CODE then -- self.map:getCamera():getScale() ~= 1 then 
                local camera = self.map:getCamera()
                local x,y  = camera:convertToWorldPosition(bornPoint.x,bornPoint.y)
                -- print("yaoxiaoyang position = "..tostring(bornPoint.x).." and "..tostring(bornPoint.y))
                local scale = camera:getScale()
                -- print("camera:getScale() = "..tostring(scale))
                bornPointNode:setScale(scale)
                --将相对于地图的位置保存给node
                bornPointNode.x = bornPoint.x
                bornPointNode.y = bornPoint.y
                local x, y = self.rt.camera_:convertToWorldPosition(bornPoint.x, bornPoint.y) 
                
                -- add by Owen, 2016.6.12, 如果刷怪按钮挡住了UI的按钮，那么需要移动刷怪的按钮
                x, y = self:reCalcPos(x, y)

                bornPointNode:setPosition(x,y)
            end     

            -- add by Owen, 2016.5.4, 为了显示新手引导的指示框，需要记录这两个数值
            self.bornPointNode = bornPointNode
            self.rotationNum   = bornPoint.angle

            self:addChild(bornPointNode)
            table.insert(self.beganBtns, bornPointNode)

            -- 在地图放大了的屏幕上，战斗UI需要放大显示
            if GLOBAL_FIGHT_UI_SCALE ~= 1 then
                bornPointNode:setScale(GLOBAL_FIGHT_UI_SCALE)
                -- bornPointNode:setPosition()
            -- elseif GLOBAL_HALL_UI_SCALE2 then
            --     bornPointNode:setScale(GLOBAL_HALL_UI_SCALE2)
            end
        end
    end

end

-- add by Owen, 2016.6.12, 如果刷怪按钮挡住了UI的按钮，那么需要移动刷怪的按钮
-- 5/7/12   挡住 左边
-- 6        挡住 右边
-- 10/15    挡住 上边
function RoundStartBtnPanel:reCalcPos(x, y)
    -- print("RoundStartBtnPanel:reCalcPos x = "..tostring(x)
    --     .." y = "..tostring(y))
    if x < 30 then
        -- 挡住了英雄操控按钮，那么需要把按钮往右边移动
        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
            if y > 200 and y < 580 then
                x = x + 110
            end
        else
            if y > 160 and y < 600 then
                x = x + 110
            end
        end

    elseif x > 1400 then
        -- 挡住了人民币技能
        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        else
            if y > 160 and y < 600 then
                x = x - 110
            end
        end
    end

    if y > 700 then
        -- 挡住了infoPanel 或者 暂停按钮
        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
            -- if x < 100 or x > 1400 then
                y = y - 30
            -- end
        else
            -- if x < 100 or x > 1400 then
                y = y - 50
            -- end
        end
    elseif y < 100 then
        -- 挡住了英雄技能
        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
            if x > 200 and x < 560 then
                y = y + 40
            end
        else
            if x > 180 and x < 580 then
                y = y + 80
            end
        end
    end
    return x, y
end

function RoundStartBtnPanel:tick( dt)
	if GLOBAL_MOBILE_UI_CODE then -- self.map:getCamera():getScale() ~= 1 then 
        for k ,v in pairs(self.beganBtns) do 
            local x, y = self.rt.camera_:convertToWorldPosition(v.x, v.y) 
            -- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
            -- add by Owen, 2016.6.12, 如果刷怪按钮挡住了UI的按钮，那么需要移动刷怪的按钮
            x, y = self:reCalcPos(x, y)

            v:setPosition(x,y)
        end
    end
    local passedTime = self.rt.time_*1000-self.beginTime
    local leftTime = DELAY_TIME*1000 - passedTime
    if not self.isFirstRound then
        for k ,v in pairs(self.beganBtns) do 
            v.btn.progress1:setPercentage(passedTime/(DELAY_TIME*1000)*100)
        end
    end

    -- body
end


function RoundStartBtnPanel:hideRoundStartBtn(event)
    -- print("RoundStartBtnPanel:hideRoundStartBtn(event)")
    for i = #self.beganBtns, 1, -1 do
        local btn = self.beganBtns[i]
        btn:removeSelf()
        table.remove(self.beganBtns, i)
    end
end
function RoundStartBtnPanel:setRuntime(rt)
    self.rt = rt
    if rt~= nil then 
        self.map = rt.map_
        self:getBornPointsData()
    end 

end



function RoundStartBtnPanel:getNextRoundData(nextRoundData)
    --先初始化每个出生点的怪物数值
    for key,bornPoint in pairs(self.bornPoints) do 
        bornPoint.nextMonster={}
        bornPoint.nextMonsterNum = 0
    end
    self.award = nextRoundData.award
    self.beginTime = self.rt.time_*1000
    --根据遍历下一波怪的每一个小队，找到相应的会出怪的BronRange，将怪物信息添加到BornRange中
    --统计每个点是否出怪和出怪的总量
    for key,value in pairs(nextRoundData) do
        -- 如果key中包含sub_round字符，就表示这是一个小队数据
        if string.find(key, "sub_round") then
            -- 根据pathId找到相应的出生点，进行处理
            local pathId = string.format("path:%d", value["pathId"])
            for key,bornPoint in pairs(self.bornPoints) do 
                for key2,path in pairs(bornPoint.pathIds) do 
                    if path == pathId then 
                        --添加该这一波怪物种类的数量
                        local MonsterId =string.format("%s",value["resourceId"])
                        if bornPoint.nextMonster[MonsterId] then 
                            bornPoint.nextMonster[MonsterId] = value.num+bornPoint.nextMonster[MonsterId]
                            bornPoint.nextMonsterNum = bornPoint.nextMonsterNum +value.num
                        else
                            bornPoint.nextMonster[MonsterId]=value.num
                            bornPoint.nextMonsterNum = bornPoint.nextMonsterNum +value.num
                        end
                    end
                end 
            end
        end
    end-- body
end

function RoundStartBtnPanel:getBornPointsData()
    self.bornPoints = {} --不重置会在restart时出bug
    local BornRanges=self.map:getRanges(RangeObject.TYPE_BORN_RANGE)
    -- dump(BornRanges[1].pathIds_, "dump BornRanges.pathIds")
    -- print("yaoxiaoyang bornRange = "..tostring(BornRanges))
    for i,BornRange in pairs(BornRanges) do 
        local bornPoint = {}
        bornPoint.pathIds = BornRange.pathIds_--得到格式为path:1

        bornPoint.x =BornRange.x_
        bornPoint.y = BornRange.y_
        --dump(BornRange,"bornRange")
        local firstpathId=BornRange.pathIds_[1]
        local path = self.map:getObject(firstpathId)
        local x1,y1 = path:getPoint(1)
        local x2,y2 = path:getPoint(2)
        local angletan=(y2-x2)/(y1-x1)
        local angle =math.atan((y2-y1)/(x2-x1))*180/3.1416
        if x2-x1<0 then
            angle = angle+180
        end
        bornPoint.angle = -angle+90
        table.insert(self.bornPoints, bornPoint)
        -- print("BornRange.pathIds")
        -- dump(self.bornPoints," bornPoint")
    end

end

-- 处理点击刷怪按钮之后，时间上快进导致的生产金币以及其他CD问题
function RoundStartBtnPanel:dealTimeChange( ... )
    local passedTime = self.rt.time_*1000-self.beginTime
    local leftTime = DELAY_TIME*1000 - passedTime

    --处理塔生金币的快进
    if not self.isFirstRound then  --第一波的时候不加钱
        for i, object in pairs(self.rt.map_.objects_) do
            if object:hasBehavior("TowerBehavior") then
                if object.addGold_[1] ~= 0 then
                    local goldAdd = object:updateGoldProduce(leftTime)
                    if (goldAdd~=nil and goldAdd>0) then
                        BattleDataManager:addGold(goldAdd)
                        -- self.rt:flyGold(object, goldAdd, object.y_ + 75)
                    end
                end
            end
        end

        -- 处理快进,leftTime是被快进的时间，单位为毫秒
        self.rt:dealQuickPass(leftTime)

        local awardGold = math.floor(self.award*leftTime/(1000*DELAY_TIME))

        BattleDataManager:addGold(awardGold)
        self:ShowAwardGold(300,display.height-300,awardGold)

        for k, v in pairs(self.map.manualSkills) do 
            v[3] = v[3]-leftTime
        end 
    end 
    -- body
end

-- 显示刷怪奖励
function RoundStartBtnPanel:ShowAwardGold(x,y,goldNum)
    -- local time = 1.2 
    -- -- 显示金币数
    -- local goldCountLabel = cc.ui.UILabel.new({
    --     UILabelType = 2,
    --     text = tostring(goldNum),
    --     font = GLOBAL_FONTNAME,
    --     size = 50,
    --     x = x,
    --     y = y
    -- })
    -- self:addChild(goldCountLabel)

    -- transition.fadeOut(goldCountLabel, {
    --     time = 0.5,
    --     delay = 0.2, -- math.random(30, 100) / 100,
    --     onComplete = function()
    --         if not tolua.isnull(tipLabel) then
    --             tipLabel:removeSelf()
    --         end
    --     end
    -- })

end
return RoundStartBtnPanel