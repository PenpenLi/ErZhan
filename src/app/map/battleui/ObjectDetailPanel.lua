
-- 在选择了英雄、怪物或者塔以后，显示在最下面的物体细信息页面
local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local MapConstants            = require("app.map.MapConstants")
local GlobalData              = require("tools.GlobalData")

-- ObjectDetailPanel
local ObjectDetailPanel = class("ObjectDetailPanel", function()
    return display.newNode()
end)


local DiffX    = 250    -- 详细信息的框和塔基位置之间的偏移，设为250

local type_maxHp        = 1
local type_attack       = 2
local type_amor         = 3
local type_speed        = 4
local type_speedText    = 5
local type_fireRange    = 6

local richTxtSize = cc.size(100, 23)

function ObjectDetailPanel:ctor()
    print("ObjectDetailPanel:ctor()")
    self.towerLocation = nil    -- 选中的是哪个坑位,self.towerLocation.tower就是在这个坑位上造的塔
    self.tower         = nil    -- 在这个坑位上造的塔
    self.upLevelGoldCost = nil  -- 升到下一等级所需要的金币数
    self.prepareToHide = false
    self:setContentSize(cc.size(200,100))

    self:createView()
    self:setVisible(false)

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

end

-- 创建控件
function ObjectDetailPanel:createView()
    print("ObjectDetailPanel:createView()")

    ------------------------------------- 九宫格背景图 --------------------------------------
    -- local bgImg = display.newScale9Sprite("ui/hall/heroHome/rightBg.png", 
    --     0, 0, cc.size(400, 80))--, cc.rect(30,30, 70,70))
    -- self:addChild(bgImg)
    -- self.bgImg = bgImg

    local bgImg = display.newSprite("ui/fight/objectDetail/objectDetailBg.png")
        :addTo(self)
    bgImg:setPosition(0, bgImg:getContentSize().height/2)
    self.bgImg = bgImg

    local posX = 260    -- 第一个图标的x坐标
    if GlobalData.getLanguage() == "CN" then
        posX = 235
    end

    local posY = 40
    local diffX1 = -10    -- 图标和文字之间的间隔
    local diffX2 = 145    -- 两个图标之间的间隔


    -- 选中物体的名字
    self.objectNamelab = cc.ui.UILabel.new({
        text  = "10",
        -- color = cc.c3b(0,255,0),
        font  = GLOBAL_FONTNAME,
        size  = 24,
        x     = posX - 140,
        y     = posY,
    })
    self.objectNamelab:setAnchorPoint(0.5, 0.5)
    bgImg:addChild(self.objectNamelab,1)
    self.objectNamelab:enableOutline(cc.c4b(0, 0, 0, 255), 1) 


    -- 攻击力图片
    self.img1 = display.newSprite("ui/fight/attack.png")
    self.img1:setPosition(posX, posY)
    bgImg:addChild(self.img1)

    -- 攻击力数字
    -- self.lab1 = cc.ui.UILabel.new({
    --     text  = "10",
    --     -- color = cc.c3b(0,255,0),
    --     font  = GLOBAL_FONTNAME,
    --     size  = 24,
    --     x     = posX + diffX1,
    --     y     = posY,
    -- })
    -- bgImg:addChild(self.lab1,1)
    self.lab1 = ccui.RichText:create()
    self.lab1:ignoreContentAdaptWithSize(false)
    self.lab1:setContentSize(richTxtSize)
    self.lab1:setAnchorPoint(cc.p(0, 0.5))
    self.lab1:setPosition(cc.p(posX + diffX1, posY))
    bgImg:addChild(self.lab1,1)

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255, "1",GLOBAL_FONTNAME, 20)
    local re2 = ccui.RichElementText:create(2, cc.c3b(188, 231, 53), 255,"+1",GLOBAL_FONTNAME, 20)
    self.lab1:pushBackElement(re1)
    self.lab1:pushBackElement(re2)


    -- 攻击速度图片
    self.img2 = display.newSprite("ui/fight/speed.png")
    self.img2:setPosition(posX + diffX2, posY)
    bgImg:addChild(self.img2)

    -- 攻击速度文字
    -- self.lab2 = cc.ui.UILabel.new({
    --     text  = "很快",
    --     -- color = cc.c3b(0,255,0),
    --     font  = GLOBAL_FONTNAME,
    --     size  = 24,
    --     x     = posX + diffX2 + diffX1,
    --     y     = posY,
    -- })
    -- bgImg:addChild(self.lab2,1)
    self.lab2 = ccui.RichText:create()
    self.lab2:ignoreContentAdaptWithSize(false)
    self.lab2:setContentSize(richTxtSize)
    self.lab2:setAnchorPoint(cc.p(0, 0.5))
    self.lab2:setPosition(cc.p(posX + diffX2 + diffX1, posY))
    bgImg:addChild(self.lab2,1)

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255, "1",GLOBAL_FONTNAME, 20)
    local re2 = ccui.RichElementText:create(2, cc.c3b(188, 231, 53), 255,"+1",GLOBAL_FONTNAME, 20)
    self.lab2:pushBackElement(re1)
    self.lab2:pushBackElement(re2)

    -- 记录第二个文字的X轴的位置，在显示塔的攻击速度的时候，要用到这个来修正位置
    self.lab2Posx = posX + diffX2 + diffX1

    -- 攻击速度图片
    self.img3 = display.newSprite("ui/fight/cooldown.png")
    self.img3:setPosition(posX + 2*diffX2, posY)
    bgImg:addChild(self.img3)

    -- 攻击速度文字
    -- self.lab3 = cc.ui.UILabel.new({
    --     text  = "很快",
    --     -- color = cc.c3b(0,255,0),
    --     font  = GLOBAL_FONTNAME,
    --     size  = 24,
    --     x     = posX + 2*diffX2 + diffX1,
    --     y     = posY,
    -- })
    -- bgImg:addChild(self.lab3,1)
    self.lab3 = ccui.RichText:create()
    self.lab3:ignoreContentAdaptWithSize(false)
    self.lab3:setContentSize(richTxtSize)
    self.lab3:setAnchorPoint(cc.p(0, 0.5))
    self.lab3:setPosition(cc.p(posX + 2*diffX2 + diffX1, posY))
    bgImg:addChild(self.lab3,1)

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255, "1",GLOBAL_FONTNAME, 20)
    local re2 = ccui.RichElementText:create(2, cc.c3b(188, 231, 53), 255,"+1",GLOBAL_FONTNAME, 20)
    self.lab3:pushBackElement(re1)
    self.lab3:pushBackElement(re2)

    print("ObjectDetailPanel:createView() end")
end

-- 显示指定物体的详细信息
-- change by Owen, 2016.6.19, 增加第二个变量notNeedMove，
-- 用来表示显示的时候不需要runAction，在第11关模式3的时候要用到
function ObjectDetailPanel:show(object, notNeedMove)
    print("ObjectDetailPanel:show object.campId_ = "..tostring(object.campId_))

    -- 更新物体的名字
    local nameKey = utils.getName("name")
    nameKey = nameKey.."_"
    self.objectNamelab:setString(object[nameKey])

    print("ObjectDetailPanel:show 1")

    local campId = object.campId_
    if campId == MapConstants.HERO_CAMP then
        -- 英雄需要显示：生命、攻击、防御(护甲)
        self.img1:setTexture("ui/fight/hp.png")
        self.img2:setTexture("ui/fight/attack.png")
        self.img3:setTexture("ui/fight/armor.png")
        print("ObjectDetailPanel:show 2")
        self:changeStr(object, campId)
        print("ObjectDetailPanel:show 3")
    elseif campId == MapConstants.MONSTER_CAMP then
        -- 怪物需要显示：生命、防御(护甲)、移动
        self.img1:setTexture("ui/fight/hp.png")
        self.img2:setTexture("ui/fight/armor.png")
        self.img3:setTexture("ui/fight/speed.png")
        self:changeStr(object, campId)
    elseif campId == MapConstants.TOWER_CAMP then
        -- 塔需要显示：攻击、攻击频率、攻击射程
        self.img1:setTexture("ui/fight/attack.png")
        self.img2:setTexture("ui/fight/cooldown.png")
        self.img3:setTexture("ui/fight/fireRangeIcon.png")
        self:changeStr(object, campId)
    end

    print("ObjectDetailPanel:show 4")

    self:setVisible(true)

    -- 制作往上移的动画
    -- change by Owen, 2016.6.19, 11关模式3最上面一直显示的英雄属性页不需要移动
    if not notNeedMove then
        local action = cc.MoveTo:create(0.2, cc.p(self:getPositionX(), 0))
        self:runAction(action)
    else
        -- change by Owen, 2016.6.23, 每次11关模式3, 不显示护甲
        if not self.hasChangePos then
            
            local posX = 260    -- 第一个图标的x坐标
            if GlobalData.getLanguage() == "CN" then
                posX = 235
            end

            local posY = 40
            local diffX1 = -10    -- 图标和文字之间的间隔
            local diffX2 = 145    -- 两个图标之间的间隔
            local addDiff = 20    -- 第一个攻击力的图片需要往右移多少
            local addDiff2 = 50    -- 第二个攻击力的图片需要往右移多少


            self.img1:setPosition(posX + addDiff, posY)
            self.lab1:setContentSize(richTxtSize)
            self.lab1:setPosition(cc.p(posX + diffX1 + addDiff, posY))


            self.img2:setPosition(posX + diffX2 + addDiff2, posY)
            local richTxtSize2 = cc.size(180, 23)
            self.lab2:setContentSize(richTxtSize2)
            self.lab2:setPosition(cc.p(posX + diffX2 + diffX1, posY))



            self.img3:setVisible(false)
            self.lab3:setVisible(false)
            -- 记录一下11关模式3的顶部的属性栏是不是已经修改过位置了
            self.hasChangePos = true
        end


        -- change by Owen, 2016.6.23, 每次11关模式3的更新英雄的数值的时候，都需要给数值闪烁一下
        local act1 = cc.ScaleTo:create(0.3, 1.2)
        local act2 = cc.ScaleTo:create(0.3, 1.0)
        local seq  = cc.Sequence:create(act1, act2)
        self.lab1:runAction(seq)

        local act1 = cc.ScaleTo:create(0.3, 1.2)
        local act2 = cc.ScaleTo:create(0.3, 1.0)
        local seq  = cc.Sequence:create(act1, act2)
        self.lab2:runAction(seq)
    end

    -- 记录这个页面显示了多久
    self.showTime = 0
    print("ObjectDetailPanel:show end")
end

-- 需要把属性变成基础属性 +- 修改的属性
function ObjectDetailPanel:changeStr(object, campId)

    -- 显示英雄的数据
    if campId == MapConstants.HERO_CAMP then
        print("ObjectDetailPanel:changeStr 1")
        -- 显示英雄的最大血量
        self.lab1:removeElement(0)
        self.lab1:removeElement(0)
        local re1, re2 = self:calString(object, type_maxHp)
        self.lab1:pushBackElement(re1)
        self.lab1:pushBackElement(re2)

        print("ObjectDetailPanel:changeStr 2")

        -- 显示英雄的攻击力
        self.lab2:removeElement(0)
        self.lab2:removeElement(0)
        local re1, re2 = self:calString(object, type_attack)
        self.lab2:pushBackElement(re1)
        self.lab2:pushBackElement(re2)
        self.lab2:setPositionX(self.lab2Posx)

        print("ObjectDetailPanel:changeStr 3")

        -- 显示英雄的护甲
        self.lab3:removeElement(0)
        self.lab3:removeElement(0)
        local re1, re2 = self:calString(object, type_amor)
        self.lab3:pushBackElement(re1)
        self.lab3:pushBackElement(re2)

        print("ObjectDetailPanel:changeStr 4")
    elseif campId == MapConstants.MONSTER_CAMP then
        -- 显示怪物的生命
        self.lab1:removeElement(0)
        self.lab1:removeElement(0)
        local re1, re2 = self:calString(object, type_maxHp)
        self.lab1:pushBackElement(re1)
        self.lab1:pushBackElement(re2)

        -- 显示怪物的防御
        self.lab2:removeElement(0)
        self.lab2:removeElement(0)
        local re1, re2 = self:calString(object, type_amor)
        self.lab2:pushBackElement(re1)
        self.lab2:pushBackElement(re2)
        self.lab2:setPositionX(self.lab2Posx)

        -- 显示怪物的、移动
        self.lab3:removeElement(0)
        self.lab3:removeElement(0)
        local re1, re2 = self:calString(object, type_speed)
        self.lab3:pushBackElement(re1)
        self.lab3:pushBackElement(re2)


    
    elseif campId == MapConstants.TOWER_CAMP then
        -- 显示塔的攻击
        self.lab1:removeElement(0)
        self.lab1:removeElement(0)
        local re1, re2 = self:calString(object, type_attack)
        self.lab1:pushBackElement(re1)
        self.lab1:pushBackElement(re2)

        -- 显示塔的攻击频率
        self.lab2:removeElement(0)
        self.lab2:removeElement(0)
        local re1, re2 = self:calString(object, type_speedText)
        self.lab2:pushBackElement(re1)
        self.lab2:pushBackElement(re2)

        self.lab2:setPositionX(self.lab2Posx - 15)

        -- 显示塔的攻击射程
        self.lab3:removeElement(0)
        self.lab3:removeElement(0)
        local re1, re2 = self:calString(object, type_fireRange)
        self.lab3:pushBackElement(re1)
        self.lab3:pushBackElement(re2)
    end

end

function ObjectDetailPanel:calString(object, data_type)
    -- body
    local foundation = 0 
    local change     = 0

    if data_type == type_maxHp then
        foundation = object.originalPro_.maxHp
        change     = 0
    elseif data_type == type_attack then
        foundation = object.originalPro_.attack
        change     = object.attack_ - foundation
    elseif data_type == type_amor then
        foundation = object.originalPro_.armor
        change     = object.armor_ - foundation
    elseif data_type == type_speed then
        foundation = object.originalPro_.speed
        change     = object.speed_ - foundation
    elseif data_type == type_speedText then
        local speedTextKey = utils.getName("speedText")
        speedTextKey = speedTextKey.."_"
        foundation = object[speedTextKey]
        change     = 0
    elseif data_type == type_fireRange then
        foundation = object.originalPro_.fireRange
        change     = object.fireRange_ - foundation
    end

    if type(foundation) == "number" then
        foundation = math.ceil(foundation)
    end
    if type(change) == "number" then
        change = math.ceil(change)
    end

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255),
        255,tostring(foundation),GLOBAL_FONTNAME, 24)
    local textStr = ""
    if change < 0 then
        textStr = tostring(change)
    elseif change > 0 then
        textStr = "+"..tostring(change)
    end
    local re2 = ccui.RichElementText:create(2, cc.c3b(188, 231, 53),
        255, textStr,GLOBAL_FONTNAME, 24)

    return re1, re2

end


function ObjectDetailPanel:hide()
    -- 制作往上移的动画
    local action = cc.MoveTo:create(0.2, cc.p(self:getPositionX(), 
        -83 * GLOBAL_FIGHT_UI_SCALE))
    self:runAction(action)

    -- self:setVisible(false)
    self.showTime = 0
end

function ObjectDetailPanel:tick(dt)

    if (self.rt) and (self:isVisible()) then
        self.showTime = self.showTime + dt
        -- print("ObjectDetailPanel:tick self.showTime = "..self.showTime)
        -- 显示大于4秒以后就自动隐藏
        if self.showTime > 2.5 then
            self:hide()
        end
    end
end

-- 设置 MapRuntime
function ObjectDetailPanel:setRuntime(rt)
    -- print("ObjectDetailPanel:setRuntime")
    self.rt = rt

end


return ObjectDetailPanel