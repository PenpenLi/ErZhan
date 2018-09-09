

-- 点击一个坑位后，弹出的选择造塔界面

local BattleDataManager      = require("app.map.data.BattleDataManager")
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local TowerProperties        = require("app.properties.TowerProperties")
local TowerDetailPanel       = require("app.map.battleui.TowerDetailPanel")
local GlobalData             = require("tools.GlobalData")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local TowerSelectPanel = class("TowerSelectPanel", function()
    return display.newNode()
end)

-- 造塔界面UI的偏移量, 其实就是塔的 object.radiusOffsetY 属性
local TOWER_PRE_DIFF = 20

function TowerSelectPanel:ctor(battleUI)

	self.battleUI = battleUI

	print("TowerSelectPanel:ctor()")
	self:setContentSize(cc.size(100,100))
	self:setVisible(false)
	if not self.view then 
	    self.view = display.newNode()--为了处理在消失后删除节点又不影响tick，保留初始节点，使用新节点
	    self:addChild(self.view)
	end

	print("TowerSelectPanel GLOBAL_FIGHT_UI_SCALE = "..GLOBAL_FIGHT_UI_SCALE)
	-- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    end

    -- add by Owen, 2016.4.20, 记录原始的缩放大小，用来做页面的缩放弹出特效
    self.orignalScale = self:getScale()
    -- print("TowerSelectPanel:ctor() self.scale = "..tostring(self:getScale()))

	self:createTowerBtn()
end


-- 在指定 StandRange 处显示
function TowerSelectPanel:show(StandRange)
    -- print("TowerSelectPanel:show() self.scale = "..tostring(self:getScaleX()))

    -- add by Owen, 2016.4.23, 点开塔基的时候，需要播放音效
    AudioMgr.playSound("Arataki")

    -- add by Owen, 2016.7.14, 第一关没有通关，造前3个塔的时候要显示3个手指
	local gameLv   = GlobalData.getGameLv()
	local gameMode = GlobalData.getGameMode()
	local needShowFinger = false    -- 是否需要显示手指
	-- 已经建造了几个塔
	local hasBuildTowerCount  = BattleDataManager:getTowerNum("160101")
	hasBuildTowerCount  = hasBuildTowerCount + BattleDataManager:getTowerNum("160201")
	hasBuildTowerCount  = hasBuildTowerCount + BattleDataManager:getTowerNum("160301")
	print("hasBuildTowerCount = "..tostring(hasBuildTowerCount))

	if gameLv == 1 then
		local star = GlobalData.getLvStar(1)
		if star[1][1] == 0 and star[1][2] == 0 then
			needShowFinger = true
		end
	end

	for i, v in pairs(self.towerBtns) do 
		-- 隐藏建造图标
		v.buildSprite:setVisible(false)
		-- 显示塔图标
		v.towerImg:setVisible(true)


		--判断数量是否超过规定，是否要加锁
		v.numEnough = false
		print("yaoxiaoyang  "..tostring(BattleDataManager:getTowerNum(tostring(v.towerId))))
		if BattleDataManager:getTowerNum(
			tostring(v.towerId)) >= v.num then
			v.numEnough = true
		end
		if v.numEnough then 
			if not v.lock then 
				v.lock = display.newSprite("ui/fight/lock.png")
				v:addChild(v.lock)
			end
			v.lock:setVisible(true)
			v.towerImg:setVisible(false)
			v.towerMoneyImg:setVisible(false)
			v.goldCostLabel:setVisible(false)
		else
			if v.lock then 
				v.lock:setVisible(false)

				-- add by Owen, 2016.5.28, 可以造塔了，把锁给去掉，把其他的控件都显示出来
				v.towerImg:setVisible(true)
				v.towerMoneyImg:setVisible(true)
				v.goldCostLabel:setVisible(true)

				-- add by Owen, 2016.7.14, 修改新手引导, 造塔页面给3个按钮加手指
				if needShowFinger and hasBuildTowerCount == 0 then
					if v.towerId == "160101" then
						-- 给箭塔加引导
						self.finger = EffectAniCache.getEffectAniCache("Finger", true)
					    v:addChild(self.finger)
					    self.finger:setPosition(0, 0)
					end
				end
			else
				-- add by Owen, 2016.7.14, 修改新手引导, 造塔页面给3个按钮加手指
				if needShowFinger and hasBuildTowerCount == 0 then
					if v.towerId == "160101" then
						-- 给箭塔加引导
						self.finger = EffectAniCache.getEffectAniCache("Finger", true)
					    v:addChild(self.finger)
					    self.finger:setPosition(0, 0)
					end
				end
			end
		end

		-- add by Owen, 2016.4.20 如果金币不够建造这个塔，那么要把图标和文字都置为灰色
		if BattleDataManager:getGoldCount() < v.goldCost then
	        -- 把图片置为灰色
	        EnableGraySprite(v.towerImg)
	        v.goldCostLabel:setColor(cc.c3b(155, 155, 155))
	    else
	    	DisableGraySprite(v.towerImg)
	        v.goldCostLabel:setColor(cc.c3b(255, 255, 255))
	    end
	end

	self.buildId = nil --用来记录被点击过的按钮，如果再次点击就造塔

    self.StandRange = StandRange
    self.towerRangeCircle:setVisible(false)
	self.towerPreview:setVisible(false)
    self:setVisible(true)
	self:tick(0)
    -- 插入调一次 tick，以便刷新按钮状态
    -- 0.001 是保证参数正确，内部并没有用到
    -- self:tick(0.001)

    self:setScale(0.5)
    local action = cc.ScaleTo:create(0.21, self.orignalScale)
    self:runAction(action)

    -- 增加一个标识自己是否隐藏了的变量，用来防止页面已经显示了
    -- 然后点击其他区域，将页面隐藏，在页面隐藏的动画过程中又点击了一次按钮
    -- 这样就选中了一个按钮
    self.isHide = false
end

function TowerSelectPanel:hide()
	
	self.isHide = true

	local scaleTo = cc.ScaleTo:create(0.1, 0.5)
	local function callback( ... )
		self:setVisible(false)
	end
	local cal    = cc.CallFunc:create(callback)
	local seq    = cc.Sequence:create(scaleTo, cal);

    self:runAction(seq)

    self.towerPreview:setVisible(false)
	-- self:setVisible(false)
	if self.towerDetailPanel and self.towerDetailPanel:isVisible() then
		self.towerDetailPanel:hide()
	end
	--self.prepareToHide = true --由于在点击空白进行删除时，直接在这里删除pushbutton会导致touch事件分发错误，所以在下一帧删除
end

function TowerSelectPanel:onClickTowerBtn(params)
	-- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
	if self.isHide then
		return
	end

	-- body
	print("TowerSelectPanel:onClickTowerBtn(params)")
	local  clickedBtn = params.target
	if params.target.numEnough then 
		-- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        AudioMgr.playSound("Error")
        
		local tipLabel = cc.ui.UILabel.new({
	        UILabelType = 2,
	        text = "Limited",
	        font = GLOBAL_FONTNAME,
	        x = -35,
	        y = 35
	    })
	    params.target:addChild(tipLabel)

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
		if self.buildId == clickedBtn.towerId then 
			self:onClickBuild(clickedBtn)  --如果已经点击过了，那么造塔
		else 
			self.buildId = clickedBtn.towerId

			for i, v in pairs(self.towerBtns) do 
				-- 如果没有锁的图片的话，才需要这些逻辑
				if not v.lock then
					v.buildSprite:setVisible(false)
					v.towerImg:setVisible(true)
				end
			end
			-- 把塔图标给隐藏掉
			clickedBtn.towerImg:setVisible(false)
			clickedBtn.buildSprite:setVisible(true)

			self.towerRangeCircle:setScaleX(params.target.range/self.towerRangeCircle.r)
			self.towerRangeCircle:setScaleY(0.8*params.target.range/self.towerRangeCircle.r)
			self.towerRangeCircle:setPosition(0,0)
			self.towerRangeCircle:setVisible(true)

			-- Csb动画，用_View图片来作为预览
			if string.find(params.target.imageName, "csb") then
				self.towerPreview:setTexture("tower/"..params.target.towerConfig.mainID.."_View.png")
			else
				self.towerPreview:setTexture(params.target.imageName)
			end

			self.towerPreview:setPosition(
				params.target.offsetX, 
				params.target.offsetY - params.target.radiusOffsetY)

			self.towerPreview:setVisible(true)

			-- 显示要造的塔的详细信息
			-- self.battleUI:showTowerDetail(clickedBtn.towerConfig, self.StandRange.x_,
			-- 	self.StandRange.y_)
			    -- 选中一个要造的塔以后，显示的塔的详细信息
		    if not self.towerDetailPanel then
		    	self.towerDetailPanel = TowerDetailPanel.new()
		    	self.towerDetailPanel:setRuntime(self.rt)
		    	self:addChild(self.towerDetailPanel)
		    end
		    self.towerDetailPanel:show(clickedBtn.towerConfig, self.StandRange.x_,
				self.StandRange.y_)
		end
	end
end

function TowerSelectPanel:onClickBuild(clickedBtn)
	-- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
	if self.isHide then
		return
	end

	if clickedBtn.needGold then
		-- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        AudioMgr.playSound("Error")

		local tipLabel = cc.ui.UILabel.new({
	        UILabelType = 2,
	        text = "no gold",
	        font = GLOBAL_FONTNAME,
	        x = 0,
	        y = 50
	    })
	    tipLabel:setAnchorPoint(0.5, 0.5)
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
		-- add by Owen, 2016.7.14, 去掉新手引导显示的手指
		if self.finger then
			self.finger:removeSelf()
			self.finger = nil
		end


		-- 造塔
		self.StandRange:addTower(self.rt, clickedBtn.towerId)
		-- 扣金币
		BattleDataManager:costGold(clickedBtn.goldCost)
		-- 记录当前地图中塔的数量
		BattleDataManager:addTowerNum(tostring(clickedBtn.towerId))

		-- add by Owen, 2016.6.25, 造了塔以后调用一下battleUI里面的函数，
		-- 用来隐藏掉第一关“点击造塔”的引导提示
		self.battleUI:buildOneTower()

		self:hide()	
	end
end

function TowerSelectPanel:tick(dt)
	-- if self.prepareToHide == true then --处理删除
	-- 	if self.view then 
	-- 		self.view:removeSelf()
	-- 		self.view = nil
	-- 	end
	-- 	self.towerBtns = nil
	-- 	self.prepareToHide = false
	-- 	self:setVisible(false)
	-- end
	if self:isVisible() then
		local x, y = self.rt.camera_:convertToWorldPosition(
			self.StandRange.x_, 
			self.StandRange.y_ + TOWER_PRE_DIFF)

		    -- self.towerLocation.x_ + self.towerLocation.tower.radiusOffsetX_,   -- offsetX_,
      --       self.towerLocation.y_ + self.towerLocation.tower.radiusOffsetY_)   -- offsetY_)

		-- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
		self:setPosition(x,y)

		if self.towerDetailPanel and self.towerDetailPanel:isVisible() then
			self.towerDetailPanel:tick(dt)
		end

		--判断前是否够
		for i,v in ipairs(self.towerBtns) do
			-- v2:setTouchEnabled(false)
			--刷新金币和数量限制的标记
			v.needGold = false
			local totalGold = BattleDataManager:getGoldCount()
			-- 金币不够，数量超过配置,就无法建造
			if v.goldCost > totalGold then
				v.needGold = true

				if not v.isGray then
			        -- 把图片置为灰色
			        EnableGraySprite(v.towerImg)
			        v.goldCostLabel:setColor(cc.c3b(155, 155, 155))

			        -- 选中图标也需要置为灰色
			        EnableGraySprite(v.buildSprite)
			    end
		        v.isGray = true

		    else
		    	if v.isGray then
			    	DisableGraySprite(v.towerImg)
			        v.goldCostLabel:setColor(cc.c3b(255, 255, 255))

			        -- 选中图标也需要置为彩色
			        DisableGraySprite(v.buildSprite)
			    end
			    v.isGray = false
		    end
		end

    end
end

-- 设置 MapRuntime
function TowerSelectPanel:setRuntime(rt)
	-- print("TowerSelectPanel:setRuntime")
	self.rt = rt
end


function TowerSelectPanel:createTowerBtn( ... )

	-- 范围
	self.towerRangeCircle = display.newNode()
		:setVisible(false)
		:addTo(self.view)
	for i=1,4 do
		local tempsprite = display.newSprite("ui/fight/tower/fireRange2.png")
			:setAnchorPoint(0,0)
			:addTo(self.towerRangeCircle)
		tempsprite:setRotation(90*i)
		self.towerRangeCircle.r=tempsprite:getContentSize().width
	end

    -- 一个圆圈
    local towerCircle =  display.newSprite("ui/fight/tower/towerCircle.png")
    self.view:addChild(towerCircle)


	local towerLimit = BattleDataManager:getTowerLimit()
	self.towerBtns = {}
	-- 根据配置来显示可以造的塔
	for i,v in ipairs (towerLimit) do
		local towerConfig = TowerObjectsProperties.get(v.id)
		local btnImageName="ui/fight/tower/towerBtnBg.png" -- ..tostring(towerConfig.towerId.."_Btn.png")
		local towerBtn = cc.ui.UIPushButton.new(btnImageName)
		    :onButtonClicked(function(...)
		        self:onClickTowerBtn(...)
		    end)

		    -- :pos(100 + (i%2)*(-200), 100 + (math.floor(i/2))*(-200))
		    :addTo(self.view,1)
		    :setScale(1.0) 
		    :setTag(i)

		-- 塔图标
		local towerImg = display.newSprite("ui/fight/tower/"..tostring(towerConfig.towerId..".png"))
		towerBtn:addChild(towerImg)

		-- 显示造塔消耗金币数量的框
		local towerMoneyImg = display.newSprite("ui/fight/tower/towerMoney.png")
		towerBtn:addChild(towerMoneyImg)
		towerMoneyImg:setPositionY(-30)

		if i == 1 then
			towerBtn:setPosition(0, 80)
		elseif i == 2 then
			towerBtn:setPosition(-70, -50)
		elseif i == 3 then
			towerBtn:setPosition(70, -50)
		end


		towerBtn.position = {x=100 + (i%2)*(-200), y=100 + (math.floor(i/3))*(-200)}
		towerBtn.towerId = v.id
		towerBtn.num = v.num
		towerBtn.Level = v.Level
		towerBtn.towerConfig = TowerProperties.get(tostring(v.id))
		towerBtn.goldCost = towerBtn.towerConfig.levelGold
		towerBtn.towerImg = towerImg
		towerBtn.towerMoneyImg = towerMoneyImg
		towerBtn.imageName = towerConfig.imageName[1]
		towerBtn.offsetX = towerConfig.offsetX[1]
		towerBtn.offsetY = towerConfig.offsetY[1]
		towerBtn.radiusOffsetX = towerConfig.radiusOffsetX[1]
		towerBtn.radiusOffsetY = towerConfig.radiusOffsetY[1]

		towerBtn.buildSprite = display.newSprite("ui/fight/tower/build.png")
			:addTo(towerBtn)
			:setVisible(false)

		local config = TowerProperties.get(v.id)		
		towerBtn.range = config.fireRange

		local goldCostLabel = cc.ui.UILabel.new({
			UILabelType = 2,
	        text = towerBtn.goldCost,
            font = GLOBAL_FONTNAME,
            align = cc.ui.TEXT_ALIGN_CENTER,
	        size = 20,
	        x = -15,
            y = -30,
			})
			:addTo(towerBtn)
		towerBtn.goldCostLabel = goldCostLabel

		self.towerBtns[i] = towerBtn

		-- windows平台上面，塔按钮UI要缩放0.9
	    if (device.platform == "mac" or device.platform == "windows") then
	        self.towerBtns[i]:setScale(0.9)
	    end
	end

	self.towerPreview = display.newSprite("cicrl.png")
		:addTo(self.view)
		:setVisible(false)
end

return TowerSelectPanel