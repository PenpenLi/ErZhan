
-- 点击一个坑位上的塔以后，弹出的升级、删除页面
local TowerProperties        = require("app.properties.TowerProperties")
local BattleDataManager      = require("app.map.data.BattleDataManager")
local TowerDetailPanel       = require("app.map.battleui.TowerDetailPanel")
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local GlobalData             = require("tools.GlobalData")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
-- TowerControlPanel
local TowerControlPanel = class("TowerControlPanel", function()
    return display.newNode()
end)


local TwoBtnPosX  = 80      -- 只有升级和售出按钮的时候，两者的配置
local ThreeBtnPosX  = 75    -- 3级塔升4-5级的时候，两个升级按钮X坐标
local ThreeBtnPosY  = 60    -- 3级塔升4-5级的时候，两个升级按钮Y坐标

function TowerControlPanel:ctor()
	-- print("TowerControlPanel:ctor()")
	self.towerLocation = nil    -- 选中的是哪个坑位,self.towerLocation.tower就是在这个坑位上造的塔
	self.tower         = nil    -- 在这个坑位上造的塔
	self.upLevelGoldCost = nil  -- 升到下一等级所需要的金币数
    self.prepareToHide = false
	self:setContentSize(cc.size(100,100))
    if not self.view then
        self.view = display.newNode()
        self:addChild(self.view)
    end

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    end

    -- add by Owen, 2016.4.20, 记录原始的缩放大小，用来做页面的缩放弹出特效
    self.orignalScale = self:getScale()

    self:createShowedItem()
	self:setVisible(false)
end

-- 在指定 sr 处显示
function TowerControlPanel:show(location)
    self.towerLocation = location
    self.tower = location.tower

    -- 隐藏掉选中图标
    self.buildSprite1:setVisible(false)
    self.buildSprite2:setVisible(false)
    self.buildSprite3:setVisible(false)

    -- 显示升级和出售图片
    self.upImg1:setVisible(true)
    self.upImg2:setVisible(true)
    self.removeImg:setVisible(true)

    -- self:updateShowedItem()
    self.buildSprite1:setVisible(false)
    self.buildSprite2:setVisible(false)

    self.levelupPreview:setVisible(false)
    self.nextLevelRangeCircle:setVisible(false)

    self.upLevelBtn1:setVisible(true)
    self.upLevelBtn1:setPosition(-TwoBtnPosX, 0)
    self.removeBtn:setPosition(TwoBtnPosX, 0)
    self.upLevelBtn2:setVisible(false)

    self.goldCostLabel1:setVisible(true)
    self.towerRangeCircle:setScaleY(0.8)
    self.lock1:setVisible(false)
    self.lock2:setVisible(false)

    self.towerRangeCircle:setScaleX(self.tower.fireRange_/self.towerRangeCircle.r)
    self.towerRangeCircle:setScaleY(0.8*self.tower.fireRange_/self.towerRangeCircle.r)

    self.upImg1:setTexture("ui/fight/tower/levelup_Btn.png")

    if self.tower.level_ < 4 then
        local nextLevelID1 = string.sub(self.tower.mainID_, 1, 5)..tostring(self.tower.level_ + 1)

        self.nextLevelTower1 = TowerProperties.get(nextLevelID1)
        -- 显示升级消耗金币数量
        self.upLevelGoldCost1 = self.nextLevelTower1.levelGold
        self.goldCostLabel1:setString(self.upLevelGoldCost1)


        self.nextLevelTower2 = nil
        -- 如果这个塔是第三级，可以升级到两种不同的塔
        -- print("string.sub(self.tower.mainID_, 6, 6) = "..string.sub(self.tower.mainID_, 6, 6))
        if string.sub(self.tower.mainID_, 6, 6) == "3" then
            -- print("这个塔是第三级，可以升级到两种不同的塔")
            local nextLevelID2 = string.sub(self.tower.mainID_, 1, 5)..tostring(self.tower.level_ + 2)
            self.upLevelBtn1:setPosition(-ThreeBtnPosX, ThreeBtnPosY)
            self.upLevelBtn2:setVisible(true)
            self.goldCostLabel2:setVisible(true)
            self.removeBtn:setPosition(0, -ThreeBtnPosY - 20)
            self.nextLevelTower2 = TowerProperties.get(nextLevelID2)
            self.upLevelGoldCost2 = self.nextLevelTower2.levelGold
            self.goldCostLabel2:setString(self.upLevelGoldCost2)

            self.upImg1:setTexture("ui/fight/tower/"..nextLevelID1..".png")
            self.upImg2:setTexture("ui/fight/tower/"..nextLevelID2..".png")

            -- 金币数量少于升级塔需要的金币时，把图片和文字都置灰
            if BattleDataManager:getGoldCount() < self.upLevelGoldCost2 then
                EnableGraySprite(self.upImg2)
                self.goldCostLabel2:setColor(cc.c3b(155, 155, 155))
                self.isGray2 = true
            else
                DisableGraySprite(self.upImg2)
                self.goldCostLabel2:setColor(cc.c3b(255, 255, 255))
                self.isGray2 = false
            end
        end

        -- 金币数量少于升级塔需要的金币时，把图片和文字都置灰
        if BattleDataManager:getGoldCount() < self.upLevelGoldCost1 then
            EnableGraySprite(self.upImg1)
            self.goldCostLabel1:setColor(cc.c3b(155, 155, 155))
            self.isGray1 = true
        else
            DisableGraySprite(self.upImg1)
            self.goldCostLabel1:setColor(cc.c3b(255, 255, 255))
            self.isGray1 = false
        end

    end

    -- 判断塔的等级限制
    self:checkLevelLimits(self.tower.level_)

    self.sellGold = self.tower.sellGold
    self.sellGoldLabel:setString(self.sellGold)

    self:setPosition(location.x_,location.y_)
    self:setVisible(true)

    self.view:setScale(0.5)
    -- change by Owen, 2016.5.9, 因为self已经setScale过了，this.view就不需要再缩放了
    local action = cc.ScaleTo:create(0.21, 1.0) -- self.orignalScale)
    -- self:runAction(action)
    self.view:runAction(action)

    self.towerRangeCircle:setVisible(true)


    -- local action2 = cc.ScaleTo:create(0.21, 1.0)
    -- self.towerRangeCircle:runAction(action2)
    -- self.nextLevelRangeCircle:stopAllActions()

    -- 增加一个标识自己是否隐藏了的变量，用来防止页面已经显示了
    -- 然后点击其他区域，将页面隐藏，在页面隐藏的动画过程中又点击了一次按钮
    -- 这样就选中了一个按钮
    self.isHide = false
end

-- 点击了升级按钮的时候，要对页面中的元素进行更新，btnIndex表示点击的是第几个升级按钮
function TowerControlPanel:updateShowedItem(btnIndex)

    local nextLevelTower
    if btnIndex == 1 then
        nextLevelTower = self.nextLevelTower1
    else
        nextLevelTower = self.nextLevelTower2
    end

    local fireRange = self.tower.fireRange_
    if self.tower.level_ < 4 then 

        local nextLevelFireRange = nextLevelTower.fireRange

        -- 从配置TowerObjectsProperties中获得图片、偏移等属性
        local towerObjectId = string.sub(self.tower.mainID_, 1, 5)..tostring(1)
        local nextProp = TowerObjectsProperties.get(towerObjectId)
        local index = nextLevelTower.level
        self.nextLevelmainID = string.sub(self.tower.mainID_, 1, 5)..tostring(index)
        self.nextLevelImage = nextProp.imageName[index]
        self.nextLvoffsetX = nextProp.offsetX[index]
        self.nextLvoffsetY = nextProp.offsetY[index]
        self.nextLvRadiusOffsetX = nextProp.radiusOffsetX[index]
        self.nextLvRadiusOffsetY = nextProp.radiusOffsetY[index]

        -- self.nextLevelImage = TowerObjectsProperties.get(nextLevelTower.mainID).imageName
        -- -- print("nextLevelTower.mainID = "..nextLevelTower.mainID.." offsetY = "..nextLevelTower.offsetX)
        -- self.nextLvoffsetX = TowerObjectsProperties.get(nextLevelTower.mainID).offsetX
        -- self.nextLvoffsetY = TowerObjectsProperties.get(nextLevelTower.mainID).offsetY

        -- 显示两个塔的范围
        self.towerRangeCircle:setScaleX(fireRange/self.towerRangeCircle.r)
        self.towerRangeCircle:setScaleY(0.8*fireRange/self.towerRangeCircle.r)
        self.nextLevelRangeCircle:setScaleX(nextLevelFireRange/self.nextLevelRangeCircle.r)
        self.nextLevelRangeCircle:setScaleY(0.8*nextLevelFireRange/self.nextLevelRangeCircle.r)

    end
end


function TowerControlPanel:createShowedItem( ... )

    -- 下一等级的攻击范围
    self.nextLevelRangeCircle = display.newNode()
        :setVisible(false)
        -- :addTo(self.view)
        :addTo(self)
    for i=1,4 do
        local tempsprite = display.newSprite("ui/fight/tower/fireRange2.png")
            :setAnchorPoint(0,0)
            :addTo(self.nextLevelRangeCircle)
        tempsprite:setRotation(90*i)
        self.nextLevelRangeCircle.r=tempsprite:getContentSize().width
    end

    --创建当前攻击范围
    self.towerRangeCircle = display.newNode()
        -- :addTo(self.view)
        :addTo(self)
        :setPosition(0,0)
    for i=1,4 do
        local tempsprite = display.newSprite("ui/fight/tower/fireRange.png")
            :setAnchorPoint(0,0)
            :addTo(self.towerRangeCircle)
        tempsprite:setRotation(90*i)
        self.towerRangeCircle.r=tempsprite:getContentSize().width
    end
    
    -- 一个圆圈
    local towerCircle =  display.newSprite("ui/fight/tower/towerCircle.png")
    self.view:addChild(towerCircle)

    --创建升级按钮
    self.upLevelBtn1 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png") -- levelup_Btn.png")
    :onButtonClicked(function(event)
        self:onClickFirstBtn(1)
    end)
    :pos(-125,0)
    :addTo(self.view,1)
    self.upImg1 = display.newSprite("ui/fight/tower/levelup_Btn.png")
    self.upLevelBtn1:addChild(self.upImg1)

    -- 显示造塔消耗金币数量的框
    self.towerMoneyImg1 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.upLevelBtn1:addChild(self.towerMoneyImg1)
    self.towerMoneyImg1:setPositionY(-30)

    --创建升级金钱标签
    self.goldCostLabel1 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -15,
        y = -30,
        })
        :addTo(self.upLevelBtn1)


    ----------------------------------- 第二个升级按钮 --------------------------------------

    -- 如果这个塔可以升级到两个完全不同的塔, 左右两种塔可以升级，2表示是右边那个
    self.upLevelBtn2 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickFirstBtn(2)
    end)
    :pos(ThreeBtnPosX, ThreeBtnPosY)
    :addTo(self.view,1)
    self.upLevelBtn2:setVisible(false)
    self.upImg2 = display.newSprite("ui/fight/tower/levelup_Btn.png")
    self.upLevelBtn2:addChild(self.upImg2)

    -- 显示造塔消耗金币数量的框
    self.towerMoneyImg2 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.upLevelBtn2:addChild(self.towerMoneyImg2)
    self.towerMoneyImg2:setPositionY(-30)

    --创建升级金钱标签
    self.goldCostLabel2 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -15,
        y = -30,
        })
        :addTo(self.upLevelBtn2)


    ------------------------------------ 创建移除按钮 -----------------------------------

    -- 创建移除按钮
    self.removeBtn = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        -- self.map_:setDebugViewEnabled(not self.map_:isDebugViewEnabled())
        self:onClickSceondBtn()
    end)
    :pos(125,0)
    :addTo(self.view,1)
    self.removeImg = display.newSprite("ui/fight/tower/sell_Btn.png")
    self.removeBtn:addChild(self.removeImg)


    --创建出售塔的价格标签
    self.sellGoldLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        x = 0,
        y = 50
        })
    self.removeBtn:addChild(self.sellGoldLabel)


    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite1 = display.newSprite("ui/fight/tower/build.png")
        :addTo(self.upLevelBtn1)
        :setVisible(false)

    self.buildSprite2 = display.newSprite("ui/fight/tower/build.png")
        :addTo(self.upLevelBtn2)
        :setVisible(false)

    self.buildSprite3 = display.newSprite("ui/fight/tower/build.png")
        :addTo(self.removeBtn)
        :setVisible(false)

    -- 点击选中按钮以后，塔基上要显示下一等级的塔的图片，用来预览
    self.levelupPreview = display.newSprite()
        :addTo(self.view)
        :setVisible(false)



    -- 如果塔的等级有限制的话
    self.lock1 = display.newSprite("ui/fight/lock.png")
    self.upLevelBtn1:addChild(self.lock1)
    self.lock1:setVisible(false)

    self.lock2 = display.newSprite("ui/fight/lock.png")
    self.upLevelBtn2:addChild(self.lock2)
    self.lock2:setVisible(false)

    -- windows平台上面，塔按钮UI要缩放0.85
    if (device.platform == "mac" or device.platform == "windows") then
        self.upLevelBtn1:setScale(0.85)
        self.upLevelBtn2:setScale(0.85)
        self.removeBtn:setScale(0.85)
    end

end
-- 点第一个的时候出现相关控件
function TowerControlPanel:onClickFirstBtn(btnIndex)
    -- print("点击了第几个升级按钮 btnIndex = "..btnIndex)

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

    -- 隐藏掉删除按钮的选中图标
    self.buildSprite3:setVisible(false)
    self.removeImg:setVisible(true)

    if btnIndex == 1 then
        -- 把第二个升级按钮的选中图片隐藏, 
        self.buildSprite2:setVisible(false)
        
        -- 第二个按钮没锁的时候才能把up图片显示出来
        if not self.lock2:isVisible() then
            self.upImg2:setVisible(true)
        end

        -- 如果锁的图标不可见，也就是可以升级
        if not self.lock1:isVisible() then
            if self.buildSprite1:isVisible() then -- 如果已经点击过了，那么效果相当于点击建造按钮
                self:onClickBuildBtn(btnIndex) 
            else 
                -- 更新数据
                self:updateShowedItem(btnIndex)
                
                self.buildSprite1:setVisible(true)
                self.upImg1:setVisible(false)
                --self.upLevelBtn:setVisible(false)
                self.nextLevelRangeCircle:setVisible(true)

                -- Csb动画，用_View图片来作为预览
                if string.find(self.nextLevelImage, "csb") then
                    local testhaha = self.nextLevelImage.."_View.png"
                    -- print("testhaha = "..testhaha)
                    local textureName = "tower/"..self.nextLevelmainID.."_View.png"
                    -- print("testhaha 2 = "..textureName)
                    self.levelupPreview:setTexture("tower/"..self.nextLevelmainID.."_View.png")
                else
                    self.levelupPreview:setTexture(self.nextLevelImage)
                end
                -- self.levelupPreview:setTexture(self.nextLevelImage)
                
                self.levelupPreview:setPosition(self.nextLvoffsetX, 
                    self.nextLvoffsetY - self.nextLvRadiusOffsetY)
                self.levelupPreview:setVisible(true)
                self.tower.sprite_:setVisible(false)

                -- 显示塔的详细信息页面
                self:showTowerDetail(btnIndex)
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    else
        -- 把第一个升级按钮的选中图片隐藏
        self.buildSprite1:setVisible(false)
        
        -- 第一个按钮没锁的时候才能把up图片显示出来
        if not self.lock1:isVisible() then
            self.upImg1:setVisible(true)
        end

        -- 如果锁的图标不可见，也就是可以升级
        if not self.lock2:isVisible() then
            if self.buildSprite2:isVisible() then -- 如果已经点击过了，那么效果相当于点击建造按钮
                self:onClickBuildBtn(btnIndex) 
            else 
                -- 更新数据
                self:updateShowedItem(btnIndex)
                
                self.buildSprite2:setVisible(true)
                self.upImg2:setVisible(false)
                --self.upLevelBtn:setVisible(false)
                self.nextLevelRangeCircle:setVisible(true)

                -- Csb动画，用_View图片来作为预览
                if string.find(self.nextLevelImage, "csb") then
                    local textureName = "tower/"..self.nextLevelmainID.."_View.png"
                    -- print("testhaha 3 = "..textureName)

                    self.levelupPreview:setTexture("tower/"..(self.nextLevelmainID).."_View.png")
                else
                    self.levelupPreview:setTexture(self.nextLevelImage)
                end
                -- self.levelupPreview:setTexture(self.nextLevelImage)
                
                self.levelupPreview:setPosition(self.nextLvoffsetX, 
                    self.nextLvoffsetY - self.nextLvRadiusOffsetY)
                self.levelupPreview:setVisible(true)
                self.tower.sprite_:setVisible(false)
                
                -- 显示塔的详细信息页面
                self:showTowerDetail(btnIndex)
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    end
end

function TowerControlPanel:showTowerDetail(btnIndex)
        -- 选中一个要造的塔以后，显示的塔的详细信息
    if not self.towerDetailPanel then
        self.towerDetailPanel = TowerDetailPanel.new()
        self.towerDetailPanel:setRuntime(self.rt)
        self:addChild(self.towerDetailPanel)
    end

    local towerConfig
    if btnIndex == 1 then
        towerConfig = self.nextLevelTower1
    else
        towerConfig = self.nextLevelTower2
    end
    self.towerDetailPanel:show(towerConfig, self.towerLocation.x_,
        self.towerLocation.y_)
end

function TowerControlPanel:onClickBuildBtn(btnIndex)

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

	-- print("TowerControlPanel:onClickFirstBtn()  1")
    if (btnIndex == 1 and self.needGold1) or (btnIndex == 2 and self.needGold2)  then 
        -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        AudioMgr.playSound("Error")

        local tipLabel = cc.ui.UILabel.new({
            UILabelType = 2,
            text = "no gold",
            font = GLOBAL_FONTNAME,
            x = 0,
            y = 50,
        })
        tipLabel:setAnchorPoint(0.5, 0.5)
        local clickedBtn
        if btnIndex == 1 then
            clickedBtn = self.upLevelBtn1
        elseif btnIndex == 2 then
            clickedBtn = self.upLevelBtn2
        end
        clickedBtn:addChild(tipLabel)

        if GlobalData.getLanguage() == "CN" then
            tipLabel:setString("金币不够")
        end

        transition.fadeOut(tipLabel, {
            time = 0.5,
            delay = 0.2, -- math.random(30, 100) / 100,
            onComplete = function()
                if not tolua.isnull(tipLabel) then
                    tipLabel:removeSelf()
                end
            end
        })
    else
        local nextID
        if btnIndex == 1 then
            nextID = self.nextLevelTower1.mainID
        else
            nextID = self.nextLevelTower2.mainID
        end

        -- 如果这个塔在光环里面
        local towerObj = self.towerLocation.tower
        local towerInAureoles = {}    -- 记录这个塔在的光环
        if towerObj._aureoleImage then
            local map = self.rt.map_
            for aureMainId, img in pairs(towerObj._aureoleImage) do
                if map.objectsByClass_["areaobject"] then
                    for i, object in pairs(map.objectsByClass_["areaobject"]) do
                        if object.mainID_ == aureMainId then
                            towerInAureoles[#towerInAureoles + 1] = object
                            -- 塔离开了这个光环
                            object:objectExitRange(towerObj)
                        end
                    end
                end
            end
        end

        -- change by Owen, 2016.5.23, 因为升级塔做了特效，
        -- 把数值的修改放到 TowerObject:changeView() 中删除老的塔之后处理
        -- 升级塔
        -- self.towerLocation.tower:upLevel(nextID)

        -- 塔升级的时候，也播放造塔的音效
        AudioMgr.playSound("Tower")

    	-- 更新剩余金币数
        if btnIndex == 1 then
    	    BattleDataManager:costGold(self.upLevelGoldCost1)
            -- 更新图片和偏移位置
            self.towerLocation.tower:changeView(self.nextLevelImage, nextID, towerInAureoles) -- self.nextLevelTower1.imageName)
        else
            BattleDataManager:costGold(self.upLevelGoldCost2)
            -- 更新图片和偏移位置
            self.towerLocation.tower:changeView(self.nextLevelImage, nextID, towerInAureoles) -- self.nextLevelTower2.imageName)
        end

        -- -- 塔进入了这个光环
        -- for i,v in ipairs(towerInAureoles) do
        --     v:objectEnterRange(self.towerLocation.tower)
        -- end

        -- 播放塔升级特效
        -- print("播放塔升级特效")
        local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_tower_upgrade", nil, nil, towerObj)
        towerObj.sprite_:addChild(effect)
        effect:setPosition(offsetX, offsetY)
        
        self:hide()
    end
end


-- 点击出售按钮
function TowerControlPanel:onClickSceondBtn()

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end
    
    -- 隐藏掉其他的选中图标
    self.buildSprite1:setVisible(false)
    self.buildSprite2:setVisible(false)

    -- 把升级图片置为可见
    -- 第一个按钮没锁的时候才能把up图片显示出来
    if not self.lock1:isVisible() then
        self.upImg1:setVisible(true)
    end
    if not self.lock2:isVisible() then
        self.upImg2:setVisible(true)
    end


    -- 隐藏掉下一级塔的攻击范围
    self.nextLevelRangeCircle:setVisible(false)
    
    if not self.buildSprite3:isVisible() then
        self.removeImg:setVisible(false)
        self.buildSprite3:setVisible(true)
    else
        -- 删除塔
        self.towerLocation:removeTower(self.rt)
        -- 删除记录的当前地图中这个塔的数量
        local towerId = self.tower.towerId_
        BattleDataManager:removeTowerNum(towerId)
        -- 增加金币
        BattleDataManager:addGold(self.tower.sellGold_)
        self:hide()
    end
end




function TowerControlPanel:hide()
    -- self.prepareToHide = true

    self.isHide = true

    local scaleTo = cc.ScaleTo:create(0.1, 0.5)
    local function callback( ... )
        self:setVisible(false)
    end
    local cal    = cc.CallFunc:create(callback)
    local seq    = cc.Sequence:create(scaleTo, cal);

    self.view:runAction(seq)

    self.levelupPreview:setVisible(false)

    self.towerRangeCircle:setVisible(false)
    self.nextLevelRangeCircle:setVisible(false)


    if self.tower and self.tower.sprite_ then
        self.tower.sprite_:setVisible(true)
    end
    if self.towerDetailPanel and self.towerDetailPanel:isVisible() then
        self.towerDetailPanel:hide()
    end
	-- self:setVisible(false)
end

-- 为减少闭包创建做的中间变量
local _dt = 0
local function callTick(icon)
	icon:tick(_dt)
end

function TowerControlPanel:checkLevelLimits(nowLevel)
    -- print("TowerControlPanel:checkLevelLimits nowLevel = "..tostring(nowLevel))
    local towerLimit = BattleDataManager:getTowerLimit()
    self.levelLimited = false 
    local level = self.tower.level_
    local limitLevel = 1
    for i,v in ipairs (towerLimit) do
        if string.sub(self.tower.defineId_, 1, 5).."1" == v.id then
            limitLevel = v.level
            -- print("limitLevel = "..limitLevel)
            break
        end
    end

    if nowLevel < 3 then
        if limitLevel == nowLevel then
            self.lock1:setVisible(true)
            self.upImg1:setVisible(false)
            self.towerMoneyImg1:setVisible(false)
            self.goldCostLabel1:setVisible(false) 
        else
            self.lock1:setVisible(false)
            self.upImg1:setVisible(true)
            self.towerMoneyImg1:setVisible(true)
            self.goldCostLabel1:setVisible(true) 
        end
    end

    if nowLevel == 3 then
        self.lock1:setVisible(false)
        self.upImg1:setVisible(true)
        self.towerMoneyImg1:setVisible(true)
        self.goldCostLabel1:setVisible(true)

        self.lock2:setVisible(false)
        self.upImg2:setVisible(true)
        self.towerMoneyImg2:setVisible(true)
        self.goldCostLabel2:setVisible(true)

        if limitLevel == 3 then
            self.lock1:setVisible(true)
            self.upImg1:setVisible(false)
            self.towerMoneyImg1:setVisible(false)
            self.goldCostLabel1:setVisible(false)

            self.lock2:setVisible(true)
            self.upImg2:setVisible(false)
            self.towerMoneyImg2:setVisible(false)
            self.goldCostLabel2:setVisible(false)
        elseif limitLevel == 4 then
            self.lock2:setVisible(true)
            self.upImg2:setVisible(false)
            self.towerMoneyImg2:setVisible(false)
            self.goldCostLabel2:setVisible(false)
        end
    end

    -- 升到4级就不能再往上升了
    if nowLevel == 4 then
        if limitLevel == 4 then
            self.lock2:setVisible(true)
            self.upImg2:setVisible(false)
            self.towerMoneyImg2:setVisible(false)
            self.goldCostLabel2:setVisible(false)
        else
            self.lock2:setVisible(false)
            self.upImg2:setVisible(true)
            self.towerMoneyImg2:setVisible(true)
            self.goldCostLabel2:setVisible(true)
        end
    end

end

function TowerControlPanel:tick(dt)

    -- if self.prepareToHide == true then --处理删除
    --     if self.view then 
    --         self.view:removeSelf()
    --         self.view = nil
    --     end 
    --     self.prepareToHide = false
    --     self:setVisible(false)
    -- end

	if (self.towerLocation) and self:isVisible() and self.towerLocation.tower then
		local x, y = self.rt.camera_:convertToWorldPosition(
            self.towerLocation.x_ + self.towerLocation.tower.radiusOffsetX_,   -- offsetX_,
            self.towerLocation.y_ + self.towerLocation.tower.radiusOffsetY_)   -- offsetY_)

		-- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
		self:setPosition(x,y)

        if self.towerDetailPanel and self.towerDetailPanel:isVisible() then
            self.towerDetailPanel:tick(dt)
        end

        -- add by Owen, 2016.5.14, 如果塔中了冰冻的Buff，那么就需要把塔升级的页面隐藏掉
        local towerObj = self.towerLocation.tower
        -- 有时间buff或者区域buff在身上，那么要updateBuffData
        if not towerObj.destroyed_ and towerObj.buffs_ and towerObj.buffs_.timeBuff_ 
            and table.nums(towerObj.buffs_.timeBuff_) > 0 then
            dump(towerObj.buffs_.timeBuff_, "dump towerObj.buffs_.timeBuff_")
            if towerObj.buffs_.timeBuff_[48] then
                self:hide()
            end
        end

        -- 判定这个按钮能否点击
        -- 根据当前的塔等级，显示升级的费用
        local level = self.tower.level_
        -- 刷新金币和等级限制的标记
        self.needGold1 = false
        self.needGold2 = false
        -- local nextLevelTowerId = self.tower.defineId_..tostring(level + 1)
        if level < 4 then 

            if self.upLevelGoldCost1 > BattleDataManager:getGoldCount() then
                self.needGold1 = true
                if not self.isGray1 then
                    -- 金币数量少于升级塔需要的金币时，把图片和文字都置灰
                    EnableGraySprite(self.upImg1)
                    self.goldCostLabel1:setColor(cc.c3b(155, 155, 155))

                    EnableGraySprite(self.buildSprite1)
                    self.isGray1 = true
                end
            else
                if self.isGray1 then
                    DisableGraySprite(self.upImg1)
                    self.goldCostLabel1:setColor(cc.c3b(255, 255, 255))

                    DisableGraySprite(self.buildSprite1)
                    self.isGray1 = false
                end
            end
            if self.nextLevelTower2 and self.upLevelGoldCost2 > BattleDataManager:getGoldCount() then
                self.needGold2 = true
                if not self.isGray2 then
                    -- 金币数量少于升级塔需要的金币时，把图片和文字都置灰
                    EnableGraySprite(self.upImg2)
                    self.goldCostLabel2:setColor(cc.c3b(155, 155, 155))
                    
                    EnableGraySprite(self.buildSprite2)
                    self.isGray2 = true
                end
            else
                if self.isGray2 then
                    DisableGraySprite(self.upImg2)
                    self.goldCostLabel2:setColor(cc.c3b(255, 255, 255))
                    
                    DisableGraySprite(self.buildSprite2)
                    self.isGray2 = false
                end
            end
        end

    end
end

-- 设置 MapRuntime
function TowerControlPanel:setRuntime(rt)
	-- print("TowerControlPanel:setRuntime")
	self.rt = rt

end


return TowerControlPanel