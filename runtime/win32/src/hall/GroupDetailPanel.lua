

local GlobalData            = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
local GroupProperties       = require("app.properties.GroupProperties")

-- 点击关卡以后，显示的难度选择界面
local GroupDetailPanel = class("GroupDetailPanel", function()
    return display.newNode()
end)



function GroupDetailPanel:ctor(params)

    self:setContentSize(cc.size(display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setTouchEnabled(true)
    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return self:onTouch(event.name, event.x, event.y)
    end)
    

    ----------------------------------- 初始化九宫格背景图 -----------------------------------
    local upBgImg = display.newScale9Sprite("ui/hall/heroHome/leftBg.png", 
        0, 0, cc.size(1200, 700))--, cc.rect(30,30, 70,70))
    self:addChild(upBgImg)
    -- upBgImg:setPosition(display.cx, display.cy)


    --------------------------------------- 羁绊文字 -----------------------------------------
    local groupIDs = GlobalData.getActiveGroup()
    local diffY    = -100
    for i, v in ipairs(groupIDs) do
        local group    = GroupProperties.get(groupIDs[i])
        local heros    = group.activateHero
        

        local descLabel = cc.ui.UILabel.new({text = "", font = GLOBAL_FONTNAME, 
            size = 40, color = cc.c3b(255, 255, 255), dimensions = CCSize(1000, 0)})
        descLabel:setPosition(50, 700 + (2*i - 1)*diffY)
        upBgImg:addChild(descLabel)
        descLabel:setString(group[heros[1]].name)

        local descLabel = cc.ui.UILabel.new({text = "", font = GLOBAL_FONTNAME,
            size = 40, color = cc.c3b(255, 255, 255), dimensions = CCSize(1000, 0)})
        descLabel:setPosition(50, 700 + (2*i)*diffY)
        upBgImg:addChild(descLabel)
        descLabel:setString(group[heros[2]].name)
    end







end

function GroupDetailPanel:onTouch(event, x, y)
    if event == "began" then
        return true
    elseif event == "moved" then
        -- self.state = "IDLE"
    elseif event == "ended" then 
        self:removeSelf()
    end
end

return GroupDetailPanel