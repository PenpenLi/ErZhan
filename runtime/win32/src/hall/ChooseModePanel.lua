

local GlobalData            = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
local GroupProperties       = require("app.properties.GroupProperties")
local GroupDetailPanel      = require("hall.GroupDetailPanel")
local ChooseModeRightPanel  = require("hall.ChooseModeRightPanel")

-- 点击关卡以后，显示的难度选择界面
local ChooseModePanel = class("ChooseModePanel", function()
    return display.newNode()
end)


-- 为了适配和屏蔽下层点击事件，在self上面加一个node
function ChooseModePanel:ctor(params)
    print("ChooseModePanel:ctor(params)")

    self:setContentSize(display.width, display.height)
    self:setTouchEnabled(true)

    self.root = display.newNode()
    self:addChild(self.root)
    self.root:setPosition(display.cx, display.cy)

    self.root:setContentSize(cc.size(2048, 1536)) -- display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self.root:setTouchEnabled(true)

    -- 设置锚点是有作用的
    -- self:setAnchorPoint(0, 0)
    self.root:setAnchorPoint(0.5, 0.5)
    self.root:setScale(GLOBAL_HALL_UI_SCALE2)
    
    self.mapId                 = params.mapId
    self.heros                 = {}                -- 记录总共有几个英雄
    self.selectedHeroBtns      = {}                -- 记录已选中英雄按钮
    self.selectedHeros         = {}                -- 记录已选中英雄id
    self.bottomHeroBtns        = {}                -- 记录底部的12个按钮
    self.bottomHeroOuts        = {}                -- 记录底部的12个按钮的选中图片
    self.upHeroImgs            = {}                -- 记录已选中的英雄按钮的头像
    self.upHeroOuts            = {}                -- 记录已选中的英雄按钮的外发光
    self.groupOpenImgs         = {}                -- 记录6个羁绊图标

    local orderHeros = GlobalData.getHeroOrder()
    local heroInfight = GlobalData.getHeroInFight()
    dump(heroInfight, "dump heroInfight")
    for i = 1, 8 do
        self.heros[i] = HeroProperties.get(orderHeros[i])

        
        if i < 4 then
            if #heroInfight == 0 then
                -- 第一次进入这个页面，默认把前三个英雄选中
                self.selectedHeros[i] = self.heros[i].mainID
            else
                self.selectedHeros[i] = heroInfight[i]
            end
        end
    end


    -- 背景图片
    self.bg = display.newSprite("ui/hall/heroHome/bg.png")
    self.bg:setPosition(1024, 768)
    self.root:addChild(self.bg)

    self.mShowFuncs = {}
    self:onEnter()

    -- ----------------------------- 初始化上面的内容 ----------------------------- 
    -- self:createUpView()

    -- ----------------------------- 初始化中间的内容 ----------------------------- 
    -- self:createMiddleView()

    -- ----------------------------- 初始化底部12个英雄按钮 ----------------------- 
    -- self:createBottomView()

    -- ----------------------------- 右边的页面 ----------------------------------- 
    -- self:createRightView()

    -- -- 记录激活的羁绊，以及羁绊图标的显示
    -- self:declGroups()

end

-- 每帧都会执行
function ChooseModePanel:tick(dt)
    print("ChooseModePanel:tick")
    if #self.mShowFuncs == 0 or self.mShowIndex > #self.mShowFuncs then
        self.mShowFuncs = {}
        self.mShowIndex = 0
        self:unscheduleUpdate()
    else
        self.mShowFuncs[self.mShowIndex]()
        self.mShowIndex = self.mShowIndex + 1
    end
end

function ChooseModePanel:onEnter()
    --   接着来看这个 cc.NODE_ENTER_FRAME_EVENT 帧事件
    -- 帧事件就是update定时器，每一帧调用，如果要使用，
    -- 除了要添加监听，还需要开启update定时器，像这样的代码，self:scheduleUpdate()
    print("ChooseModePanel:onEnter")
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt) self:tick(dt) end)
    self:scheduleUpdate()

    -- self:addFuncList(handler(self, self.initUI))

    self.mShowFuncs[#self.mShowFuncs + 1] = handler(self, self.createUpView) --self.createUpView
    self.mShowFuncs[#self.mShowFuncs + 1] = handler(self, self.createMiddleView) --self.createMiddleView
    self.mShowFuncs[#self.mShowFuncs + 1] = handler(self, self.createBottomView) --self.createBottomView
    self.mShowFuncs[#self.mShowFuncs + 1] = handler(self, self.createRightView) --self.createRightView
    self.mShowFuncs[#self.mShowFuncs + 1] = handler(self, self.declGroups) --self.declGroups

    self.mShowIndex = 1

end

function ChooseModePanel:onExit()
    print("ChooseModePanel:onExit")
    self:unscheduleUpdate()
end


-- 初始化上面的内容
function ChooseModePanel:createUpView()
        ----------------------------------- 初始化九宫格背景图 -----------------------------------
    local upBgImg = display.newScale9Sprite("ui/hall/heroHome/leftBg.png", 
        0, 0, cc.size(1950, 115))--, cc.rect(30,30, 70,70))
    self.root:addChild(upBgImg)
    upBgImg:setPosition(1024, 1427)

    --------------------------------------- 英雄升级文字 -----------------------------------------
    cc.ui.UILabel.new({text = WordLanguage.ModelLevel, font = GLOBAL_FONTNAME,
        size = 60, color = cc.c3b(255,255,255)})
    :align(display.CENTER, 400, 60)
    :addTo(upBgImg)


    --------------------------------------- 关闭按钮 ---------------------------------------------
    local closeBtn = cc.ui.UIPushButton.new({normal = "ui/hall/heroHome/close.png"})
        :onButtonClicked(function(params)
            print("on click closeBtn")
            self:removeSelf()
        end)
        :pos(1900, 80)
        :addTo(upBgImg)


end

-- 初始化中间的内容
function ChooseModePanel:createMiddleView()
    ------------------------------------- 左边的感叹号 ---------------------------------------
    local helpBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/help.png"})
        :onButtonClicked(function(params)
            print("on click onClickHelpBtn")
            self:onClickHelpBtn()
        end)
        :pos(150, 1300)
        :addTo(self)

    ------------------------------------- 羁绊图标 -------------------------------------------
    -- 图标
    local img = display.newScale9Sprite("ui/hall/heroHome/description.png", 
        0, 0, cc.size(300, 80))--, cc.rect(30,30, 70,70))
    self.root:addChild(img)
    img:setPosition(750, 1300)
    -- 人物简介文字
    local outlineLabel = cc.ui.UILabel.new({text = WordLanguage.Group, font = GLOBAL_FONTNAME,
        size = 50, color = cc.c3b(0,170,248)})
    :align(display.CENTER_TOP, 150, 65)
    :addTo(img)

    ------------------------------------- 九宫格背景图 --------------------------------------
    local rightBgImg = display.newScale9Sprite("ui/hall/heroHome/rightBg.png", 
        0, 0, cc.size(1035, 630))--, cc.rect(30,30, 70,70))
    self.root:addChild(rightBgImg)
    rightBgImg:setPosition(720, 900)

    ------------------------------------- 选中底图 ------------------------------------------
    local selectImg = display.newSprite("ui/hall/chooseModel/selectImg.png")
    selectImg:setPosition(520, 315)
    rightBgImg:addChild(selectImg)

    ------------------------------------- 三个选中按钮 --------------------------------------
    local topX   = 345
    local topY   = 570
    local diffX  = 230
    local diffY  = 320
    for i = 1, 3 do
        -- 可以点击的按钮
        local heroSelectedBtn = cc.ui.UIPushButton.new({normal = "ui/heroIcon/heroBg.png"})
        :onButtonClicked(function(params)
            print("on click onClickHelpBtn")
            self:onClickHeroSelectedBtn(params)
        end)
        :addTo(selectImg)
        heroSelectedBtn.index = i
        self.selectedHeroBtns[i] = heroSelectedBtn

        if i == 1 then
            heroSelectedBtn:setPosition(topX, topY)
        elseif i == 2 then
            heroSelectedBtn:setPosition(topX - diffX, topY - diffY)
        elseif i == 3 then
            heroSelectedBtn:setPosition(topX + diffX, topY - diffY)
        end
        

        -- 按钮上面的英雄头像
        local heroImg
        if self.selectedHeros[i] ~= 0 then
            heroImg = display.newSprite( "ui/heroIcon/"..self.selectedHeros[i]..".png")
        else
            heroImg = display.newSprite( "ui/heroIcon/heroBg.png")
        end
            
        heroImg:setPosition(heroSelectedBtn:getContentSize().width/2, 
            heroSelectedBtn:getContentSize().height/2)
        heroSelectedBtn:addChild(heroImg)
        self.upHeroImgs[i] = heroImg


        --[[
                1 2

            3         6
              4     5
        ]]
        -- 英雄头像边上的羁绊图标
        local openImg1 = display.newSprite( "ui/hall/chooseModel/groupIcon.png")
        selectImg:addChild(openImg1)
        local openImg2 = display.newSprite( "ui/hall/chooseModel/groupIcon.png")
        selectImg:addChild(openImg2)

        local diffX2 = 130
        if i == 1 then
            openImg1:setPosition(topX - diffX2 + 6, topY + 5)
            openImg2:setPosition(topX + diffX2 + 5, topY + 6)
        elseif i == 2 then
            openImg1:setPosition(topX - diffX - 22, topY - diffY + 133)
            openImg2:setPosition(topX - diffX + 110, topY - diffY - 123)
        elseif i == 3 then
            openImg1:setPosition(topX + diffX - 93, topY - diffY - 125)
            openImg2:setPosition(topX + diffX + 34, topY - diffY + 132)
        end
        self.groupOpenImgs[1 + (i-1)*2] = openImg1
        self.groupOpenImgs[2 + (i-1)*2] = openImg2


        -- 按钮选中图片
        local heroSelectedImg = display.newSprite( "ui/heroIcon/heroSelected.png")
        heroSelectedImg:setPosition(heroSelectedBtn:getContentSize().width/2, 
            heroSelectedBtn:getContentSize().height/2)
        heroSelectedBtn:addChild(heroSelectedImg)
        if self.selectedHeros[i] == 0 then
            heroSelectedImg:setVisible(false)
        end
        self.upHeroOuts[i] = heroSelectedImg
    end


    ------------------------------------- 详细按钮 ------------------------------------------
    local detailBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/yellowBtn.png"})
    :onButtonClicked(function(params)
        print("on click detailBtn")
        self:onClickDetailBtn(parmas)
    end)
    :pos(760, 80)
    :addTo(selectImg)
    -- 升阶文字
    local detailLabel = cc.ui.UILabel.new({text = WordLanguage.Detail, font = GLOBAL_FONTNAME,
        size = 50, color = cc.c3b(255,255,255)})
    :align(display.CENTER, 0, 0)
    :addTo(detailBtn)

end


----------------------------- 初始化底部12个英雄按钮 ----------------------- 
function ChooseModePanel:createBottomView()
    -- 可以点击的按钮
    local posX = 230
    local posY = 460
    local diffX = 190
    local diffY = 220
    for i = 1, 12 do
        -- 12个选择按钮
        local selectHeroBtn = cc.ui.UIPushButton.new({normal = "ui/heroIcon/heroBg.png"})
        :onButtonClicked(function(params)
            print("on click onClickHelpBtn")
            self:onClickBottomHeroBtn(params)
        end)
        :pos(posX + (i-1)*diffX, posY)
        self.root:addChild(selectHeroBtn)
        if i > 6 then
            selectHeroBtn:setPosition(posX + (i-7)*diffX, posY - diffY)
        end
        selectHeroBtn.index = i
        self.bottomHeroBtns = selectHeroBtn


        -- 英雄头像
        if i < 9 then
            local heroImg = display.newSprite( "ui/heroIcon/"..self.heros[i].mainID..".png")
            heroImg:setPosition(selectHeroBtn:getContentSize().width/2, 
                selectHeroBtn:getContentSize().height/2)
            selectHeroBtn:addChild(heroImg)
        else
            selectHeroBtn:setTouchEnabled(false)
        end

        -- 按钮选中图片
        local heroSelectedImg = display.newSprite( "ui/heroIcon/heroSelected.png")
        heroSelectedImg:setPosition(selectHeroBtn:getContentSize().width/2, 
            selectHeroBtn:getContentSize().height/2)
        selectHeroBtn:addChild(heroSelectedImg)
        heroSelectedImg:setVisible(false)
        
        if i < 9 then
            for j, v in ipairs (self.selectedHeros) do
                if v == self.heros[i].mainID then
                    heroSelectedImg:setVisible(true)
                end
            end
        end

        self.bottomHeroOuts[i] = heroSelectedImg


    end
end

-- 初始化右边的页面
function ChooseModePanel:createRightView()
    local rightView = ChooseModeRightPanel.new(self.mapId)
    rightView:setPosition(1648, 768 - 50)
    self.root:addChild(rightView)
end

-- 点击上方选中的3个英雄按钮
function ChooseModePanel:onClickHeroSelectedBtn(params)
    local index = params.target.index
    print("ChooseModePanel:onClickHeroSelectedBtn index = "..tostring(index))


    if self.selectedHeros[index] == 0 then
        -- 这个位置上没有英雄
        return
    else

        -- 上面的英雄头像图片置为不可见
        self.upHeroImgs[index]:setVisible(false)

        -- 上面的选中图片去掉
        self.upHeroOuts[index]:setVisible(false)

        -- 下面的选中图片去掉
        local heroBtnIndex
        for i = 1, 8 do
            if self.selectedHeros[index] == self.heros[i].mainID then
                heroBtnIndex = i
                break
            end
        end
        print("heroBtnIndex = "..tostring(heroBtnIndex))
        self.bottomHeroOuts[heroBtnIndex]:setVisible(false)

        -- 羁绊图片改为不显示
        -- self.groupOpenImgs[1 + (index -1)*2]:setVisible(false)
        -- self.groupOpenImgs[2 + (index -1)*2]:setVisible(false)



        -- 把该位置选中的英雄置空
        self.selectedHeros[index] = 0

        -- 重新计算激活的羁绊
        self:declGroups()
    end

end

-- 点击下方的12个英雄按钮
function ChooseModePanel:onClickBottomHeroBtn(params)
    local index = params.target.index
    print("ChooseModePanel:onClickBottomHeroBtn index = "..tostring(index))
    
    -- 这个英雄是不是已经上阵了
    local upIndex = 0
    for i = 1, 3 do
        if self.heros[index].mainID == self.selectedHeros[i] then
            upIndex = i
            break
        end
    end

    if upIndex ~= 0 then
        -- 已经在阵上了
        local data = {}
        data.target = {}
        data.target.index = upIndex
        self:onClickHeroSelectedBtn(data)
        return
    else
        -- 处理上阵
        for i = 1, 3 do
            if self.selectedHeros[i] == 0 then
                local upIndex = i

                -- 记录位置选中的英雄
                self.selectedHeros[upIndex] = self.heros[index].mainID

                -- 上面的英雄头像图片置为可见
                self.upHeroImgs[upIndex]:setVisible(true)
                self.upHeroImgs[upIndex]:setTexture("ui/heroIcon/"..self.selectedHeros[upIndex]..".png")

                -- 上面的选中图片置为可见
                self.upHeroOuts[upIndex]:setVisible(true)

                -- 下面的选中图片置为可见
                self.bottomHeroOuts[index]:setVisible(true)

                -- 羁绊图片改为可见
                -- self.groupOpenImgs[1 + (upIndex -1)*2]:setVisible(true)
                -- self.groupOpenImgs[2 + (upIndex -1)*2]:setVisible(true)



                -- 重新计算激活的羁绊
                self:declGroups()
                break
            end
        end

    end

end

-- 重新计算激活的羁绊
function ChooseModePanel:declGroups()
    print("ChooseModePanel:declGroups 1")
    
    -- 羁绊图标都置为不可见
    for i = 1, 6 do

        self.groupOpenImgs[i]:setVisible(false)
    end

    -- 根据上阵英雄，计算那几个羁绊被激活了
    local hero1 = self.selectedHeros[1]
    local hero2 = self.selectedHeros[2]
    local hero3 = self.selectedHeros[3]
    local groups = GroupProperties.getAll()
    local conditions = {}
    local groupIDs   = {}    -- 所有激活的羁绊
    local groupID
    for i,v in pairs(groups) do
        conditions = v.activateHero
        groupID = v.mainID

        if conditions[1] == hero1 or conditions[1] == hero2 or conditions[1] == hero3 then
            if conditions[2] == hero1 or conditions[2] == hero2 or conditions[2] == hero3 then
                groupIDs[#groupIDs + 1] = groupID

                -- groupID 这个羁绊被激活了，需要把对应的羁绊图标给点亮
                local group = GroupProperties.get(groupID)
                local heros = group.activateHero
                -- print("ChooseModePanel:declGroups 2")

                -- dump(group, "dump group")
                -- print("hero1 = "..hero1.." hero2 = "..tostring(hero2))
                -- 1/2之间的羁绊图标
                if group[tostring(hero1)] and group[tostring(hero2)] then -- hero1 ~= 0 and hero2 ~= 0 then
                    -- dump(group[tostring(hero1)], "dump group[hero1]")
                    -- dump(group[tostring(hero2)], "dump group[hero2]")
                    if group[tostring(hero1)] then
                        self.groupOpenImgs[1]:setVisible(true)
                        print("self.groupOpenImgs[1]:setVisible(true)")
                        self.groupOpenImgs[1]:setTexture("ui/groupIcon/"..
                            group[tostring(hero1)].icon..".png")
                    end
                    if group[tostring(hero2)] then
                        self.groupOpenImgs[3]:setVisible(true)
                        self.groupOpenImgs[3]:setTexture("ui/groupIcon/"..
                            group[tostring(hero2)].icon..".png")
                    end
                end
                -- 2/3之间的羁绊图标
                if group[tostring(hero2)] and group[tostring(hero3)] then -- hero2 ~= 0 and hero3 ~= 0 then
                    if group[tostring(hero2)] then
                        print("test 4 group.mainID = "..tostring(group.mainID))
                        self.groupOpenImgs[4]:setVisible(true)
                        self.groupOpenImgs[4]:setTexture("ui/groupIcon/"..
                            group[tostring(hero2)].icon..".png")
                    end
                    if group[tostring(hero3)] then
                        self.groupOpenImgs[5]:setVisible(true)
                        self.groupOpenImgs[5]:setTexture("ui/groupIcon/"..
                            group[tostring(hero3)].icon..".png")
                    end
                end
                -- 1/3之间的羁绊图标
                if group[tostring(hero1)] and group[tostring(hero3)] then -- hero1 ~= 0 and hero3 ~= 0 then
                    if group[tostring(hero1)] then
                        self.groupOpenImgs[2]:setVisible(true)
                        self.groupOpenImgs[2]:setTexture("ui/groupIcon/"..
                            group[tostring(hero1)].icon..".png")
                    end
                    if group[tostring(hero3)] then
                        self.groupOpenImgs[6]:setVisible(true)
                        self.groupOpenImgs[6]:setTexture("ui/groupIcon/"..
                            group[tostring(hero3)].icon..".png")
                    end
                end
            end
        end
    end
    GlobalData.setActiveGroup(groupIDs)

    -- 设置上阵的英雄
    GlobalData.setHeroInFight(self.selectedHeros)


end


-- 点击详细按钮
function ChooseModePanel:onClickDetailBtn(params)
    local groupDetailPaned = GroupDetailPanel.new()
    self.root:addChild(groupDetailPaned)
end









-- 创建选关按钮
function ChooseModePanel:createModeBtns()
    -- 新建关卡按钮，目前就三关
    for i=1,3 do 
        local btn = cc.ui.UIPushButton.new({normal = "ui/hall/cicrl.png"})
            :onButtonClicked(function(...)
                self:changMode(...)
            end)
            :pos(2*100*i, 0)
            :addTo(self.view)
            :setTag(i)
            :setScale(3)
        local label = cc.ui.UILabel.new({
                UILabelType = 2,
                text = tostring(i),
                size = 30,
                color = cc.c3b(255, 64, 64),
                x=-30
            })
        btn:addChild(label)
    end
end

-- 点击了选关按钮
function ChooseModePanel:changMode(params)
    -- 显示选难度页面
    print("ChooseModePanel:changMode btnId = "..tostring(params.target:getTag()))
    local mapName
    if self.mapId < 10 then
        mapName ="A000"..tostring(self.mapId)
    elseif self.mapId >= 10 and self.mapId < 100 then
        mapName ="A00"..tostring(self.mapId)
    else
        mapName ="A0"..tostring(self.mapId)
    end

    -- display.replaceScene(require("editor.EditorScene").new({mapId = mapName
    --     , modeId = params.target:getTag()}))

    display.replaceScene(require("transition.TransitionScene").new({mapId = mapName
        , modeId = params.target:getTag()}))

    -- display.replaceScene(require("editor.EditorScene").new({mapId="A000"..tostring(self.mapId)
    -- 	, modeId = params.target:getTag()}))
end

return ChooseModePanel