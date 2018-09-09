
-- 点击一个4/5级塔以后，弹出的选择塔技能页面
local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local TowerSkillDetailPanel   = require("app.map.battleui.TowerSkillDetailPanel")
local GlobalData              = require("tools.GlobalData")

local TowerSkillPanel = class("TowerSkillPanel", function()
    return display.newNode()
end)

local ThreeBtnPosX  = 75    -- 两个天赋按钮X坐标
local ThreeBtnPosY  = 60    -- 两个天赋按钮Y坐标

function TowerSkillPanel:ctor()
	-- print("TowerSkillPanel:ctor()")
	self.towerLocation = nil    -- 选中的是哪个坑位,self.towerLocation.tower就是在这个坑位上造的塔
	self.tower         = nil    -- 在这个坑位上造的塔
	self.upLevelGoldCost = nil  -- 升到下一等级所需要的金币数
    self.prepareToHide = false
	self:setContentSize(cc.size(100,100))

    -- add by Owen, 2016.4.22, 增加self.view控件，用来做UI的弹出和缩放效果
    -- 塔的攻击范围不需要播放动画，其他的控件都需要播放动画
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

    self:createView()
	self:setVisible(false)
end

-- 创建控件
function TowerSkillPanel:createView()

    --创建当前攻击范围
    self.towerRangeCircle = display.newNode()
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

    local talentBgPosY = 33    -- 天赋等级图片的Y轴位置
    local talentLvPosX1 = 14    -- 第一个天赋等级图片的X轴位置
    local talentLvPosY1 = 13    -- 第一个天赋等级图片的Y轴位置
    local talentLvPosX2 = 34    -- 第二个天赋等级图片的X轴位置
    local talentLvPosY2 = 18    -- 第二个天赋等级图片的Y轴位置
    local talentLvPosX3 = 54    -- 第三个天赋等级图片的X轴位置
    local talentLvPosY3 = 13    -- 第三个天赋等级图片的Y轴位置

    ------------------------------------- 第一个天赋 -------------------------------------
    -- 创建技能按钮1
    self.skillBtn1 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickSkillBtn(1)
    end)
    :pos(-ThreeBtnPosX, ThreeBtnPosY)
    :addTo(self.view,1)

    self.talentIcon1 = display.newSprite("ui/fight/tower/160104_1.png")
        :addTo(self.skillBtn1)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite1 = display.newSprite("ui/fight/tower/build.png")
        :addTo(self.skillBtn1)
        :setVisible(false)

    -- 如果限制了塔不能学这个天赋
    self.lock1 = display.newSprite("ui/fight/lock.png")
        :addTo(self.skillBtn1)
        :setVisible(false)



    -- 显示的天赋等级背景图片
    self.talentLvBg1 = display.newSprite("ui/fight/tower/talentLvBg.png")
        :addTo(self.skillBtn1)
        :pos(0, talentBgPosY)
        -- :setVisible(false)

    -- 显示的三个天赋等级图片
    local talent1_lv1 = display.newSprite("ui/fight/tower/talentLv1.png")
        :addTo(self.talentLvBg1)
        :pos(talentLvPosX1, talentLvPosY1)
        :setVisible(false)
    local talent1_lv2 = display.newSprite("ui/fight/tower/talentLv2.png")
        :addTo(self.talentLvBg1)
        :pos(talentLvPosX2, talentLvPosY2)
        :setVisible(false)
    local talent1_lv3 = display.newSprite("ui/fight/tower/talentLv3.png")
        :addTo(self.talentLvBg1)
        :pos(talentLvPosX3, talentLvPosY3)
        :setVisible(false)
    self.talent1_lvImgs = {}
    self.talent1_lvImgs[1] = talent1_lv1
    self.talent1_lvImgs[2] = talent1_lv2
    self.talent1_lvImgs[3] = talent1_lv3




    -- 显示学习天赋消耗金币数量的框
    self.towerMoneyImg1 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.skillBtn1:addChild(self.towerMoneyImg1)
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
    self.skillBtn1:addChild(self.goldCostLabel1,1)




    ------------------------------------- 第二个天赋 -------------------------------------
    -- 创建技能按钮2
    self.skillBtn2 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickSkillBtn(2)
    end)
    :pos(ThreeBtnPosX, ThreeBtnPosY)
    :addTo(self.view,1)

    self.talentIcon2 = display.newSprite("ui/fight/tower/160104_1.png")
        :addTo(self.skillBtn2)

    -- 如果限制了祭坛塔不能召唤士兵
    self.lock2 = display.newSprite("ui/fight/lock.png")
        :addTo(self.skillBtn2)
        :setVisible(false)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite2 = display.newSprite("ui/fight/tower/build.png")
    :addTo(self.skillBtn2)
    :setVisible(false)


    -- 显示的天赋等级背景图片
    self.talentLvBg2 = display.newSprite("ui/fight/tower/talentLvBg.png")
        :addTo(self.skillBtn2)
        :pos(0, talentBgPosY)
        -- :setVisible(false)

    -- 显示的三个天赋等级图片
    local talent2_lv1 = display.newSprite("ui/fight/tower/talentLv1.png")
        :addTo(self.talentLvBg2)
        :pos(talentLvPosX1, talentLvPosY1)
        :setVisible(false)
    local talent2_lv2 = display.newSprite("ui/fight/tower/talentLv2.png")
        :addTo(self.talentLvBg2)
        :pos(talentLvPosX2, talentLvPosY2)
        :setVisible(false)
    local talent2_lv3 = display.newSprite("ui/fight/tower/talentLv3.png")
        :addTo(self.talentLvBg2)
        :pos(talentLvPosX3, talentLvPosY3)
        :setVisible(false)
    self.talent2_lvImgs = {}
    self.talent2_lvImgs[1] = talent2_lv1
    self.talent2_lvImgs[2] = talent2_lv2
    self.talent2_lvImgs[3] = talent2_lv3



    -- 显示学习天赋消耗金币数量的框
    self.towerMoneyImg2 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.skillBtn2:addChild(self.towerMoneyImg2)
    self.towerMoneyImg2:setPositionY(-30)


    --创建升级金钱标签2, 左右两种塔可以升级，2表示是右边那个
    self.goldCostLabel2 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -15,
        y = -30,
    })
    self.skillBtn2:addChild(self.goldCostLabel2,1)


    ------------------------------------- 移除按钮 ---------------------------------
    -- 创建移除按钮
    self.removeBtn = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        -- self.map_:setDebugViewEnabled(not self.map_:isDebugViewEnabled())
        self:onClickRemoveBtn()
    end)
    :pos(0,-ThreeBtnPosY - 20)
    :addTo(self.view,1)

    self.sellImg = display.newSprite("ui/fight/tower/sell_Btn.png")
        :addTo(self.removeBtn)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite3 = display.newSprite("ui/fight/tower/build.png")
    :addTo(self.removeBtn)
    :setVisible(false)


    --创建出售塔的价格标签
    self.sellGoldLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        x = 0,
        y = 50
        })
    self.removeBtn:addChild(self.sellGoldLabel)


end

-- 在指定塔基处显示
function TowerSkillPanel:show(location)
    self.towerLocation = location
    self.tower = location.tower

    -- 隐藏掉选中图标
    self.buildSprite1:setVisible(false)
    self.buildSprite2:setVisible(false)
    self.buildSprite3:setVisible(false)
    -- 显示天赋图标
    self.talentIcon1:setVisible(true)
    self.talentIcon2:setVisible(true)
    -- 显示出售图片
    self.sellImg:setVisible(true)
    -- 隐藏锁图片
    self.lock1:setVisible(false)
    self.lock2:setVisible(false)
    -- 显示金币背景框和金币文字
    self.towerMoneyImg1:setVisible(true)
    self.towerMoneyImg2:setVisible(true)
    self.goldCostLabel1:setVisible(true)
    self.goldCostLabel2:setVisible(true)

    -- 两个塔天赋id
    local talentID1
    local talentID2
    if not self.tower.talent_[1] then
        talentID1 = self.tower.towerTalent_[1]
    else
        talentID1 = self.tower.talent_[1].nextLvID
    end

    if not self.tower.talent_[2] then
        talentID2 = self.tower.towerTalent_[2]
    else
        talentID2 = self.tower.talent_[2].nextLvID
    end


    -- print("talentID1 = "..tostring(talentID1))
    self.nextTalentConfig1    = TowerTalentProperties.get(talentID1)
    self.nextTalentConfig2    = TowerTalentProperties.get(talentID2)

    -- 当前已学习的天赋的等级，用来显示等级图片
    local talentLv_1
    local talentLv_2
    if self.nextTalentConfig1 then
        talentLv_1 = self.nextTalentConfig1.level - 1
    else
        talentLv_1 = 3
    end
    if self.nextTalentConfig2 then
        talentLv_2 = self.nextTalentConfig2.level - 1
    else
        talentLv_2 = 3
    end

    for i = 1, 3 do
        self.talent1_lvImgs[i]:setVisible(false)
        self.talent2_lvImgs[i]:setVisible(false)
    end
    for i = 1, talentLv_1 do
        self.talent1_lvImgs[i]:setVisible(true)
    end
    for i = 1, talentLv_2 do
        self.talent2_lvImgs[i]:setVisible(true)
    end



    -- 更新显示的塔天赋图标
    local config1 = TowerTalentProperties.get(self.tower.towerTalent_[1])
    self.talentIcon1:setTexture("ui/fight/tower/"..config1.clickIcon..".png")
    -- self.skillBtn1:setButtonImage("pressed", "ui/fight/tower/"..config1.clickIcon..".png")
    local config2 = TowerTalentProperties.get(self.tower.towerTalent_[2])
    self.talentIcon2:setTexture("ui/fight/tower/"..config2.clickIcon..".png")
    -- self.skillBtn2:setButtonImage("pressed", "ui/fight/tower/"..config2.clickIcon..".png")


    if not self.nextTalentConfig1 then
        -- 天赋1满级了
        -- self.goldCostLabel1:setString("0")
        self.towerMoneyImg1:setVisible(false)
        self.goldCostLabel1:setVisible(false)
    else
        self.goldCostLabel1:setString(self.nextTalentConfig1.levelGold)

        -- add by Owen, 2016.4.20 如果金币不够建造这个塔，那么要把图标和文字都置为灰色
        if BattleDataManager:getGoldCount() < self.nextTalentConfig1.levelGold then
            -- 把图片置为灰色
            EnableGraySprite(self.talentIcon1)
            self.goldCostLabel1:setColor(cc.c3b(155, 155, 155))
            self.isGray1 = true
        else
            DisableGraySprite(self.talentIcon1)
            self.goldCostLabel1:setColor(cc.c3b(255, 255, 255))
            self.isGray1 = false
        end
    end
    if not self.nextTalentConfig2 then
        -- self.goldCostLabel2:setString("0")
        -- 天赋2满级了
        self.towerMoneyImg2:setVisible(false)
        self.goldCostLabel2:setVisible(false)
    else
        self.goldCostLabel2:setString(self.nextTalentConfig2.levelGold)

        -- add by Owen, 2016.4.20 如果金币不够建造这个塔，那么要把图标和文字都置为灰色
        if BattleDataManager:getGoldCount() < self.nextTalentConfig2.levelGold then
            -- 把图片置为灰色
            EnableGraySprite(self.talentIcon2)
            self.goldCostLabel2:setColor(cc.c3b(155, 155, 155))
            self.isGray2 = true
        else
            DisableGraySprite(self.talentIcon2)
            self.goldCostLabel2:setColor(cc.c3b(255, 255, 255))
            self.isGray2 = false
        end
    end


    self.towerRangeCircle:setScaleX(self.tower.fireRange_/self.towerRangeCircle.r)
    self.towerRangeCircle:setScaleY(0.8*self.tower.fireRange_/self.towerRangeCircle.r)

    -- 根据塔的天赋限制，来判定能否继续升级
    local towerLimit = BattleDataManager:getTowerLimit()
    self.levelLimited = false 
    local level = self.tower.level_
    local limitLevel = 3
    for i,v in ipairs (towerLimit) do
        if string.sub(self.tower.defineId_, 1, 5).."1" == v.id then
            if v.talentLv then
                limitLevel = v.talentLv
                -- print("limitLevel = "..limitLevel)
                -- 如果下一级的天赋的等级超过了限制，则不能升级天赋了
                if self.nextTalentConfig1 and self.nextTalentConfig1.level > limitLevel then
                    self.lock1:setVisible(true)
                    self.talentIcon1:setVisible(false)
                    self.towerMoneyImg1:setVisible(false)
                    self.goldCostLabel1:setVisible(false)
                end
                if self.nextTalentConfig2 and self.nextTalentConfig2.level > limitLevel then
                    self.lock2:setVisible(true)
                    self.talentIcon2:setVisible(false)
                    self.towerMoneyImg2:setVisible(false)
                    self.goldCostLabel2:setVisible(false)
                end
            end
            break
        end
    end

    self:setVisible(true)

    self.view:setScale(0.5)
    -- change by Owen, 2016.5.9, 因为self已经setScale过了，this.view就不需要再缩放了
    local action = cc.ScaleTo:create(0.21, 1)    -- self.orignalScale)
    self.view:runAction(action)

    self.towerRangeCircle:setVisible(true)

    -- windows平台上面，塔按钮UI要缩放0.9
    if (device.platform == "mac" or device.platform == "windows") then
        self.skillBtn1:setScale(0.85)
        self.skillBtn2:setScale(0.85)
        self.removeBtn:setScale(0.85)
    end

    -- 增加一个标识自己是否隐藏了的变量，用来防止页面已经显示了
    -- 然后点击其他区域，将页面隐藏，在页面隐藏的动画过程中又点击了一次按钮
    -- 这样就选中了一个按钮
    self.isHide = false

    self.prepareToHide = false
end

-- 点第一个的时候出现相关控件
function TowerSkillPanel:onClickSkillBtn(btnIndex)
    -- print("点击了第几个升级按钮 btnIndex = "..btnIndex)

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

    if btnIndex == 1 then
        if not self.lock1:isVisible() then
            -- 把第二个升级按钮和删除按钮的选中图片隐藏
            self.buildSprite2:setVisible(false)
            self.buildSprite3:setVisible(false)
            -- 显示出售图片
            self.sellImg:setVisible(true)
            if not self.lock2:isVisible() then
                self.talentIcon2:setVisible(true)
            end


            -- 天赋升到顶级了，就不能再升了
            if not self.nextTalentConfig1 then
                -- 显示天赋详细信息页面
                self:showSkillDetail(btnIndex)
                return
            end


            if not self.buildSprite1:isVisible() then
                self:showSkillDetail(btnIndex)
                self.buildSprite1:setVisible(true)
                self.talentIcon1:setVisible(false)
            else
                if not self.needGold1 then

                    self.tower:dealUpTowerTalent(1)
                    self:hide()
                else
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
                    self.skillBtn1:addChild(tipLabel)

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
                end
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    else
        if not self.lock2:isVisible() then

            -- 把第二个升级按钮和删除按钮的选中图片隐藏
            self.buildSprite1:setVisible(false)
            self.buildSprite3:setVisible(false)
            -- 显示出售图片
            self.sellImg:setVisible(true)
            if not self.lock1:isVisible() then
                self.talentIcon1:setVisible(true)
            end


            -- 天赋升到顶级了，就不能再升了
            if not self.nextTalentConfig2 then
                self:showSkillDetail(btnIndex)
                return
            end


            if not self.buildSprite2:isVisible() then
                self:showSkillDetail(btnIndex)
                self.buildSprite2:setVisible(true)
                self.talentIcon2:setVisible(false)
            else
                if not self.needGold2 then

                    -- 调用这个函数TowerObject:dealUpTowerTalent() 来处理塔天赋升级
                    self.tower:dealUpTowerTalent(2)
                    self:hide()
                else
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
                    self.skillBtn2:addChild(tipLabel)

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
                end
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    end
end

-- 显示塔天赋详细信息页面
function TowerSkillPanel:showSkillDetail(btnIndex)
    -- 选中一个塔天赋以后，显示的塔天赋的详细信息
    if not self.towerSkillDetailPanel then
        self.towerSkillDetailPanel = TowerSkillDetailPanel.new()
        self.towerSkillDetailPanel:setRuntime(self.rt)
        self:addChild(self.towerSkillDetailPanel)
    end

    -- local talentConfig
    -- if btnIndex == 1 then
    --     talentConfig = self.nextTalentConfig1
    -- else
    --     talentConfig = self.nextTalentConfig2
    -- end
    self.towerSkillDetailPanel:show(self.tower, btnIndex, 
        self.towerLocation.x_, self.towerLocation.y_)
end

function TowerSkillPanel:onClickRemoveBtn()

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

    if not self.buildSprite3:isVisible() then
        -- 隐藏掉塔天赋升级的确认图片
        self.buildSprite1:setVisible(false)
        self.buildSprite2:setVisible(false)
        self.buildSprite3:setVisible(true)
        -- 隐藏出售图片
        self.sellImg:setVisible(false)

        if not self.lock1:isVisible() then
            self.talentIcon1:setVisible(true)
        end
        if not self.lock2:isVisible() then
            self.talentIcon2:setVisible(true)
        end

    else
        -- 删除塔
        self.towerLocation:removeTower(self.rt)
        -- 删除记录的当前地图中这个塔的数量
        local towerId = self.tower.towerId_
        BattleDataManager:removeTowerNum(towerId)
        -- 增加金币, 这个塔可以卖多少钱，加上 (升级天赋消耗的钱*0.6)
        BattleDataManager:addGold(self.tower.sellGold_ + self.tower.talentCostGold_*0.6)
        self:hide()
    end
end




function TowerSkillPanel:hide()

    self.isHide = true

    local scaleTo = cc.ScaleTo:create(0.1, 0.5)
    local function callback( ... )
        self:setVisible(false)
    end
    local cal    = cc.CallFunc:create(callback)
    local seq    = cc.Sequence:create(scaleTo, cal);

    self.view:runAction(seq)

    self.towerRangeCircle:setVisible(false)

    -- change by Owen, 2016.5.11, 这个变量用来控制，在ui缩放回去的时候，把塔天赋图标给置灰了
    self.prepareToHide = true

    if self.tower and self.tower.sprite_ then
        self.tower.sprite_:setVisible(true)
    end

    if self.towerSkillDetailPanel and self.towerSkillDetailPanel:isVisible() then
        self.towerSkillDetailPanel:hide()
    end
	-- self:setVisible(false)
end

function TowerSkillPanel:tick(dt)

    -- if self.prepareToHide == true then --处理删除
    --     if self.view then
    --         self.view:removeSelf()
    --         self.view = nil
    --     end 
    --     self.prepareToHide = false
    --     self:setVisible(false)
    -- end

	if (self.towerLocation) and self:isVisible() and self.towerLocation.tower 
        and not self.prepareToHide then
		local x, y = self.rt.camera_:convertToWorldPosition(
            self.towerLocation.x_ + self.towerLocation.tower.radiusOffsetX_,   -- offsetX_,
            self.towerLocation.y_ + self.towerLocation.tower.radiusOffsetY_)   -- offsetY_)

		-- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
		self:setPosition(x,y)

        if self.towerSkillDetailPanel and self.towerSkillDetailPanel:isVisible() then
            self.towerSkillDetailPanel:tick(dt)
        end

        -- add by Owen, 2016.5.14, 如果塔中了冰冻的Buff，那么就需要把塔升级的页面隐藏掉
        local towerObj = self.towerLocation.tower
        -- 有时间buff或者区域buff在身上，那么要updateBuffData
        if not towerObj.destroyed_ and towerObj.buffs_ and towerObj.buffs_.timeBuff_ 
            and table.nums(towerObj.buffs_.timeBuff_) > 0 then
            if towerObj.buffs_.timeBuff_[48] then
                self:hide()
            end
        end

        -- 判定这个按钮能否点击
        -- 根据当前的塔等级，显示升级的费用
        -- 刷新金币和等级限制的标记
        self.needGold1 = false
        self.needGold2 = false
        -- local nextLevelTowerId = self.tower.defineId_..tostring(level + 1)

        if self.nextTalentConfig1 then
            if self.nextTalentConfig1.levelGold > BattleDataManager:getGoldCount() then
                self.needGold1 = true
                -- 把图片置为灰色
                if not self.isGray1 then
                    EnableGraySprite(self.talentIcon1)
                    self.goldCostLabel1:setColor(cc.c3b(155, 155, 155))

                    EnableGraySprite(self.buildSprite1)
                    self.isGray1 = true
                end
            else
                if self.isGray1 then
                    DisableGraySprite(self.talentIcon1)
                    self.goldCostLabel1:setColor(cc.c3b(255, 255, 255))

                    DisableGraySprite(self.buildSprite1)
                    self.isGray1 = false
                end
            end
        else
            -- add by Owen, 2016.5.11, 天赋升到顶级以后，天赋图标不能变灰
            if self.isGray1 then
                DisableGraySprite(self.buildSprite1)
                self.isGray1 = false
            end
        end
        if self.nextTalentConfig2 then
            if self.nextTalentConfig2.levelGold > BattleDataManager:getGoldCount() then
                self.needGold2 = true
                if not self.isGray2 then
                    -- 把图片置为灰色
                    EnableGraySprite(self.talentIcon2)
                    self.goldCostLabel2:setColor(cc.c3b(155, 155, 155))

                    EnableGraySprite(self.buildSprite2)
                    self.isGray2 = true
                end
            else
                if self.isGray2 then
                    DisableGraySprite(self.talentIcon2)
                    self.goldCostLabel2:setColor(cc.c3b(255, 255, 255))

                    DisableGraySprite(self.buildSprite2)
                    self.isGray2 = false
                end
            end
        else
            -- add by Owen, 2016.5.11, 天赋升到顶级以后，天赋图标不能变灰
            if self.isGray2 then
                DisableGraySprite(self.buildSprite2)
                self.isGray2 = false
            end
        end
    end
end

-- 设置 MapRuntime
function TowerSkillPanel:setRuntime(rt)
	-- print("TowerSkillPanel:setRuntime")
	self.rt = rt

end


return TowerSkillPanel