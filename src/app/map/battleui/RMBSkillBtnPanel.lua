
local RMBSkillProperties    = require("app.properties.RMBSkillProperties")
local SkillBase             = require("app.map.skills.SkillBase")
local BattleDataManager     = require("app.map.data.BattleDataManager")
local MapConstants          = require("app.map.MapConstants")
local SkillFactory          = require("app.map.skills.SkillFactory")
local GlobalData            = require("tools.GlobalData")
local EffectAniCache        = require("app.map.spine.EffectAniCache")

require "socket"

local RMBSkillBtnPanel = class("RMBSkillBtnPanel", function()
    return display.newNode()
end)

-- 道具Icon缩小了0.6
local iconScale = 0.6

-- 战斗界面右下角的人民币技能图标

function RMBSkillBtnPanel:ctor(battleUI)
	self.battleUI = battleUI
	self.rt = nil
	self.map = nil
	self.allRMBSkills = {}    -- 配置中记录的所有的道具技能
	self.skillBtns = {}
	self.oldtime = 0 -- 用来读秒

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

function RMBSkillBtnPanel:show()
	print("RMBSkillBtnPanel:show()")
	self:removeAllChildren()
	self.skillBtns = {}
	if self.rt then
		self.map = self.rt.map_

		self.allRMBSkills = RMBSkillProperties.getAll()

		-- rmb技能显示和隐藏的按钮
		-- self.showBtn = cc.ui.UIPushButton.new(
		-- 	"ui/fight/rmbSkill/showRmbBtn.png")
		-- 	:onButtonClicked(function(...)
		-- 		self:onShowBtnClicked(...)
  --           end)
		-- 	:pos(-56/2, 235) -- display.width - 100, i * 100) -- (i-1)*160,0)
		-- 	:addTo(self)


		local skillFrameBg = display.newSprite("ui/fight/rmbSkill/rmbSkillFrameBg.png")
			:addTo(self)
		local frameSize = skillFrameBg:getContentSize()
		skillFrameBg:setPosition(frameSize.width/2, 0)
		-- skillFrameBg:setPosition(-frameSize.width/2, 0)    -- -frameSize.height/2)
		self.skillFrameBg = skillFrameBg
		self.skillFrameWidth = frameSize.width
		self.outView = true

		self.showBtn = cc.ui.UIPushButton.new(
			"ui/fight/rmbSkill/arrowImg.png")
			:onButtonClicked(function(...)
				self:onShowBtnClicked(...)
            end)
			:pos(-40, 180) -- display.width - 100, i * 100) -- (i-1)*160,0)
			:addTo(skillFrameBg)
		-- 箭头
		-- self.arrowImg = display.newSprite("ui/fight/rmbSkill/arrowImg.png")
		-- 	:addTo(self)
		-- 	:pos(-100, 0)
		-- 箭头发光
		self.arrowLight = display.newSprite("ui/fight/rmbSkill/arrowLight.png")
			:addTo(skillFrameBg)
			:pos(-40, 180)


		-- 3个按钮在背景框中的位置
		local posX   = 30  -- 65
		local posY   = 288 -- 285     -- 最上面的按钮在背景框中的Y轴位置
		local diffY  = -108    -- 三个按钮的Y轴间距

		-- for i,skill in pairs(self.allRMBSkills) do 
		for i = 1, table.nums(self.allRMBSkills) do

			local skillPro = RMBSkillProperties.get("710"..tostring(i).."01")
			-- dump(skillPro, "dump skillPro")
			-- change by Owen, 处理羁绊对技能的影响, 道具技能是不会被影响的
			-- skill = SkillBase.dealChangeData(skillID, skill)


			-- 新建技能按钮
			local icon = skillPro.icon
			-- local btnImgName = "ui/fight/rmbSkill/rmbSkillBg.png"
			-- local btnImg = display.newSprite("ui/fight/rmbSkill/rmbSkillBg.png")
			-- 	:pos(posX, posY + (i-1) * diffY) -- display.width - 100, i * 100) -- (i-1)*160,0)
			-- 	:addTo(skillFrameBg)
			local skillBtn = cc.ui.UIPushButton.new(
				"ui/Icons/rmbSkillIcon/"..icon..".png")
				:onButtonClicked(function(...)
					self:onButtonClicked(...)
                end)
				:pos(posX + 30, posY + (i-1) * diffY) -- display.width - 100, i * 100) -- (i-1)*160,0)
				:addTo(skillFrameBg)
				:setScale(iconScale)

	        -- skillBtn.skillImage =display.newSprite("ui/Icons/rmbSkillIcon/"..icon..".png")
	        --              :setVisible(true)
	        --              :pos(-5, 4)
	        -- skillBtn:addChild(skillBtn.skillImage, -1)

	        -- add by Owen, 2016.7.26, CD的时候，显示灰色的图标
			skillBtn.mask = display.newSprite("ui/Icons/rmbSkillIcon/"..icon.."_gray.png")
			-- EnableGraySprite(skillBtn.mask)
			skillBtn:addChild(skillBtn.mask)
			skillBtn.mask:setVisible(false)


	        -- 消耗钻石数量图片框
	        local diamondImg = display.newSprite("ui/fight/rmbSkill/diamondImg.png")
	        	:addTo(skillBtn)
	        	:setScale(1/iconScale)
	        	:pos(60, -26)

	        local itemCount = GlobalData.getSkillItemsCount(i)

	        local diamondLabel = cc.ui.UILabel.new({
		            UILabelType = 2,
		            font = GLOBAL_FONTNAME,
		            text = tostring(itemCount),
		            color = cc.c3b(252,255,0),
		            size = 20,
		            x = 16,
		            y = 20,
		        })
			    :addTo(diamondImg)
			    diamondLabel:setAnchorPoint(0.5, 0.5)
			if itemCount > 0 then
				diamondLabel:setColor(cc.c3b(255, 255, 0))
			else
				diamondLabel:setColor(cc.c3b(255, 255, 255))
			end
			diamondLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

			if not self.itemCountLabels then
				self.itemCountLabels = {}
			end
			self.itemCountLabels[i] = diamondLabel


			-- add by Owen, 2016.7.26, CD的时候，显示灰色的图标
			skillBtn.diamondMask = display.newSprite("ui/fight/rmbSkill/diamondImg.png")
				:addTo(skillBtn)
	        	:setScale(1/iconScale)
	        	:pos(60, -26)
	        	:setVisible(false)
			EnableGraySprite(skillBtn.diamondMask)
			local diamondGrayLabel = cc.ui.UILabel.new({
		            UILabelType = 2,
		            font = GLOBAL_FONTNAME,
		            text = tostring(itemCount),
		            color = cc.c3b(155,155,155),
		            size = 20,
		            x = 16,
		            y = 20,
		        })
			    :addTo(skillBtn.diamondMask)
		    diamondGrayLabel:setAnchorPoint(0.5, 0.5)
		    diamondGrayLabel:enableOutline(cc.c4b(0, 0,0,255), 1)
			if not self.itemCountGrayLabels then
				self.itemCountGrayLabels = {}
			end
			self.itemCountGrayLabels[i] = diamondGrayLabel


			-- diamondLabel:enableOutline(cc.c4b(0, 0,0,255), 1)
			-- 这个rmb技能需要消耗的钻石数量
			skillBtn.cost = skillPro.powerCost[2]
			-- 记录这个技能的CD
			skillBtn.fullCD = skillPro.skillCD
			-- 记录道具技能的索引
			skillBtn.index  = i


	        skillBtn.selected = display.newSprite("ui/fight/rmbSkill/skillSelected.png")
	                     :setVisible(false)
	                     :pos(0,12)
	        skillBtn.selected.isSelected_ = false
	        skillBtn:addChild(skillBtn.selected)

			-- skillBtn.progress = display.newProgressTimer("ui/fight/rmbSkill/cooldown.png",display.PROGRESS_TIMER_BAR)
			-- skillBtn.progress:setBarChangeRate(cc.p(0,1))
			-- skillBtn.progress:setMidpoint(cc.p(0,0))
			-- -- skillBtn.progress:setPosition(0,12)
			-- skillBtn:addChild(skillBtn.progress)  



			i = i +1         
			skillBtn.skillPro = skillPro    -- 技能属性配置
			skillBtn.cd       = 0        -- 技能释放CD

			-- skillBtn.cdTime = nil
			-- skillBtn.beginTime = nil 
			-- skillBtn.passedTime = nil
			-- print("创建了一个技能按钮")
			table.insert(self.skillBtns,skillBtn)


		end
	end

end

function RMBSkillBtnPanel:onButtonClicked(params)
	print("RMBSkillBtnPanel:onButtonClicked skillID = "..tostring(params.target.skillPro.mainID))

	local skillBtn = params.target
	local skillPro = params.target.skillPro
	local skillIndex = params.target.index

	-- 表示是通过引导释放的rmb技能，这个时候不可以扣除钻石	
	if self.isRmbGuide then
		self.isRmbGuide = false

		skillBtn.cd = skillBtn.fullCD
		SkillFactory.releaseSkill(nil, skillPro.mainID, MapConstants.SKILL_TYPE_RMB, self.rt, nil, nil, mx, my)
		
		return
	end

	if GlobalData.getSkillItemsCount(skillIndex) <= 0 then
		-- TO-DO 弹出道具商店
		self.rt:pausePlay()
		local function finc( ... )
			self.rt:resumePlay()
		end
		viewMgr.show(viewMgr.def.ITEMSTORE_UI, finc, skillIndex)
	else
		if skillBtn.cd <= 0 then 
			GlobalData.changeSkillItemsCount(skillIndex, -1)

			-- 发信号出去战斗UI更新钻石数量
    		NotifyCenter.notify(EventNames.UI_UPDATE_DIAMOND_COUNT)
			
			-- self.rt:releaseRMBSkill(skillPro)
			skillBtn.cd = skillBtn.fullCD
			SkillFactory.releaseSkill(nil, skillPro.mainID, MapConstants.SKILL_TYPE_RMB, self.rt, nil, nil, mx, my)

			-- add by Owen, 2016.6.15, 增加友盟数据统计, 使用了这么多个钻石购买了一个rmb技能
			local mainID  = skillPro.mainID
			local eventId = string.format("skill_%s", mainID) 
			umengSdk.buy(eventId, 1, tostring(skillBtn.cost) )

			-- 处理自定义事件，在第几关的第几波释放了一个rmb技能
			local eventId = string.format("new_rmbSkill_%s", mainID)
			local level = utils.getSDKLevelID(true)
			if level then
				umengSdk.customEvent_1(eventId, level, tostring(BattleDataManager:getCurRound()) )
			end
		else
			-- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        	AudioMgr.playSound("Error")

        	-- 显示“冷却中”文字
        	local tipLabel = cc.ui.UILabel.new({
		        UILabelType = 2,
		        text = WordLanguage.ItemSkillInCD,
		        font = GLOBAL_FONTNAME,
		        color = cc.c3b(252,255,0),
		        x = -45,
		        y = 45
		    })
		    tipLabel:setScale(1/iconScale)
		    skillBtn:addChild(tipLabel)

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

end

-- 点击rmb技能显示和隐藏按钮
function RMBSkillBtnPanel:onShowBtnClicked()
	if not self.outView then
		-- 制作往右移的动画
	    local action = cc.MoveTo:create(0.2, cc.p(self.skillFrameWidth/2 - 10,
	        self.skillFrameBg:getPositionY()))
	    self.skillFrameBg:runAction(action)

		-- self.arrowImg:setRotation(0)
		self.showBtn:setRotation(0)
		self.arrowLight:setVisible(true)
		self.outView = true
	else
		local action = cc.MoveTo:create(0.2, cc.p(-self.skillFrameWidth/2 - 10,
	        self.skillFrameBg:getPositionY()))
	    self.skillFrameBg:runAction(action)

	    -- self.arrowImg:setRotation(180)
	    self.showBtn:setRotation(180)
		self.arrowLight:setVisible(false)
		self.outView = false
	end
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
-- 引导技能的时候，英雄按钮要置为不可点击
function RMBSkillBtnPanel:setUnTouchWhenSkillGuide()
    self.showBtn:setTouchEnabled(false)
    for k, v in pairs(self.skillBtns) do
    	v:setTouchEnabled(false)
    end
end

-- 引导技能结束了，英雄按钮要置为可点击
function RMBSkillBtnPanel:setTouchWhenSkillGuideOver()
    self.showBtn:setTouchEnabled(true)
    for k, v in pairs(self.skillBtns) do
    	v:setTouchEnabled(true)
    end
end

-- add by Owen, 2016.7.18, 第3关模式1, 第5波开始后5秒，要显示第2个道具技能引导	
function RMBSkillBtnPanel:setNeedGuideItem2()
	self.needGuideItem2 = true
	self.needShowGuideTime = 0
end

function RMBSkillBtnPanel:tick( dt )

	-- add by Owen, 2016.7.18, 第3关模式1, 第5波开始后20秒，要显示第2个道具技能引导
	if self.rt and not self.rt.paused_
		and self.needGuideItem2 then

		self.needShowGuideTime = self.needShowGuideTime + dt
		if self.needShowGuideTime >= 20 then
			self.rt:pausePlay()
			if self.outView then
	            self:onShowBtnClicked()
	            self:guideRmbSkill(2, true)
	        else
	        	self:guideRmbSkill(2, false)	
	        end
			
		end
	end

	for k, v in pairs(self.skillBtns) do
		if v.cd > 0 then
			-- 在CD的时候显示灰色的遮罩
			v.mask:setVisible(true)
			v.diamondMask:setVisible(true)

			local time = v.cd/1000
			if time <= 0 then 
				time = "ready"
			else
				-- time = string.format("%.1f", time)
				time = math.floor(time) 
			end
			if not v.tipLabel then 
				v.tipLabel = cc.ui.UILabel.new({
				        UILabelType = 2,
				        text = time,
				        font = GLOBAL_FONTNAME,
				        color = cc.c3b(220, 220, 220),
				        x = -25,
				        y = 55,
				        size = 26,
				    })
				v:addChild(v.tipLabel)
				v.tipLabel:setScale(1/iconScale)
				-- v.tipLabel:setVisible(false)
			else
				if v.tipLabel then
					v.tipLabel:setVisible(true)
				end
				v.tipLabel:setString(time)
			end

			-- v.progress:setPercentage(100*v.cd/v.skillPro.skillCD)

			v.cd = v.cd - dt*1000
			if v.cd < 0 then
				v.cd = 0

				-- 在CD到了，隐藏掉灰色的遮罩
				v.mask:setVisible(false)
				v.diamondMask:setVisible(false)

				if v.tipLabel then
					v.tipLabel:setVisible(false)
				end
			end
		end
	end


	-- 选中狂闪烁
	-- for k, v in pairs(self.skillBtns) do
	-- 	if self.rt.hasSelectedASkill and self.rt.selectedSkillId == v.skillID then 
	-- 		if v.selected.isSelected_ ==  false  then  --由于在闪烁中会导致isvisible()混乱，所以使用该变量判断
	-- 			v.selected:setVisible(true)
	-- 			v.selected.isSelected_ = true
	-- 			local show = cc.Show:create()
	-- 			local hide = cc.Hide:create()
	-- 			local delay = cc.DelayTime:create(0.5)
	-- 			--local blink = cc.Blink:create(1,1)
	-- 			local seq = cc.Sequence:create(show,delay,hide,delay,nil)
	-- 			v.selected:runAction(cc.RepeatForever:create(seq))
	-- 		end
	-- 	else 
	-- 		if v.selected.isSelected_ then 
	-- 			v.selected:stopAllActions()
	-- 			v.selected:setVisible(false)
	-- 			v.selected.isSelected_ = false
	-- 		end 
	-- 	end
	-- end


	-- body
end

-- add by Owen, 2016.6.14, 新手引导, 如果第4关的模式1没有通关，
-- 第5波开始前5秒钟，引导释放钻石技能
-- needDiff 表示计算节点的位置的时候，需不需要往左偏移, 在隐藏状态下显示引导
-- 也就是runAction的时候需要往左偏移
function RMBSkillBtnPanel:guideRmbSkill(itemIndex, needDiff)

	local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    -- 遮罩位置不对，可能需要把下面这一行代码注释掉
    layer:setContentSize(cc.size(display.width, display.height))


    local size = cc.size(60, 60)
    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.battleUI:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    -- 在battleUI上添加道具技能说明
    local explanBg = display.newSprite("ui/fight/gameGuide/tipsBg.png")
    local itemSkillExplan = display.newSprite("ui/fight/gameGuide/rmbSkillTips/710"
    	..tostring(itemIndex).."01.png")
    	:addTo(explanBg)
    	:pos(807/2, 488/2)

    explanBg:setPosition(display.cx, display.cy)
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	explanBg:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
    	explanBg:setScale(GLOBAL_HALL_UI_SCALE2)
    end
    self.battleUI:addChild(explanBg, viewMgr.zOrder.DEFAULT + 1)

    local rect = self.skillBtns[itemIndex]:getCascadeBoundingBox()
    
    local pos
    if needDiff then
    	if GLOBAL_FIGHT_UI_SCALE ~= 1 then
	    	pos = cc.p(rect.x-rect.width+35*GLOBAL_FIGHT_UI_SCALE,rect.y+rect.height/2 + 10)
	    elseif GLOBAL_HALL_UI_SCALE2 then
	    	pos = cc.p(rect.x-rect.width+35*GLOBAL_HALL_UI_SCALE2,rect.y+rect.height/2 + 10)
	    end
    else
    	pos = cc.p(rect.x+rect.width/2,rect.y+rect.height/2)
    end


    local image = ccui.ImageView:create("ui/common/mask_img.png")
    image:setScale9Enabled(true)
    image:setCapInsets(cc.rect(20,20,20,20))
    image:setContentSize(cc.size(90,90))
    image:setTouchEnabled(true)
    local node = cc.Node:create()
    node:addChild(image)

    local imageSize = image:getContentSize()

    -- x = x - 140
    -- y = y - 50
    local spriteSize = self.skillBtns[itemIndex]:getContentSize()
    -- 技能点击区域引导的时候，增加一个黄框在外面
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(110,110))
    frame:setPosition(pos.x, pos.y)
    self.m_ClipNode:addChild(frame)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	node:setScale(GLOBAL_FIGHT_UI_SCALE)
    	frame:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
    	node:setScale(GLOBAL_HALL_UI_SCALE2)
    	frame:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    node:setPosition(pos.x, pos.y)
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        --local rect = cc.rect(pos.x - imageSize.width - 35, pos.y - 35, 50, 50)
        local rect = self.skillBtns[itemIndex]:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            local finger = self.battleUI:getChildByName("finger")
            if finger then
                finger:removeFromParent()
                finger = nil
            end
            -- print("点击了指定的区域")

            self.needGuideItem2 = false

            -- 记录一下这个item技能的引导已经走过了
            GlobalData.setItemSkillHasGuide(itemIndex)
            
            -- 显示引导走完以后的奖励, 目前只有第一个道具引导走完后会奖励5个道具
            self:showAwardTips(itemIndex)
            
            -- 表示是通过引导释放的rmb技能，这个时候不可以扣除钻石
            self.isRmbGuide = true

            explanBg:removeSelf()

            self.rt:resumePlay()
            self.m_ClipNode:removeSelf()

            return false
        else
            return true
        end
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = layer:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,layer)

    -- local finger = EffectAniCache.getFingerInHall()
    local finger = EffectAniCache.getEffectAniCache("Finger", true)
    
    -- finger:setPosition(pos.x, pos.y)
    -- self.m_ClipNode:addChild(finger)

    -- frame:addChild(finger)
    -- finger:setPosition(50, 50)

    -- 翻转手指
    finger:setFlippedX(true)
    finger:setName("finger")
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	finger:setScale(GLOBAL_FIGHT_UI_SCALE/iconScale)
    elseif GLOBAL_HALL_UI_SCALE2 then
    	finger:setScale(GLOBAL_HALL_UI_SCALE2/iconScale)
    end
    self.battleUI:addChild(finger, viewMgr.zOrder.DEFAULT + 2)
    finger:setPosition(pos.x, pos.y)
    -- self.skillBtns[itemIndex]:addChild(finger, 10)
    -- finger:setPosition(cc.p(spriteSize.width/2 + 15,spriteSize.height/2 + 5))
end

-- 更新显示的道具数量
function RMBSkillBtnPanel:updateItemCount()
	for i = 1, 3 do
		local itemCount = GlobalData.getSkillItemsCount(i)
		self.itemCountLabels[i]:setString(tostring(itemCount))
		-- 更新灰色的图片
		self.itemCountGrayLabels[i]:setString(tostring(itemCount))

		if itemCount > 0 then
			-- 数量大于0的时候，显示成绿色
			self.itemCountLabels[i]:setColor(cc.c3b(255, 255, 0))
		else
			-- 数量等于0的时候，显示成红色
			self.itemCountLabels[i]:setColor(cc.c3b(255, 255, 255))
		end
	end
end

-- add by Owen, 2016.7.15, -- 显示 “太棒啦！获得5 个道具1”
function RMBSkillBtnPanel:showAwardTips(itemIndex)

	-- 引导完释放 怪物回退 技能以后，给玩家赠送5个怪物回退道具
	-- 引导完要送对应的道具
	local awardCount = 0
	if itemIndex == 1 then
		awardCount = 2
	elseif itemIndex == 2 then
		awardCount = 5
	elseif itemIndex == 3 then
		awardCount = 2
	end

	GlobalData.changeSkillItemsCount(itemIndex, awardCount)


	-- 发信号出去战斗UI更新钻石数量, 道具数量
	NotifyCenter.notify(EventNames.UI_UPDATE_DIAMOND_COUNT)

    local bg = display.newSprite("ui/fight/objectDetail/objectDetailBg.png")
        :addTo(self.battleUI)
        :pos(display.cx, display.cy)
        :setScale(GLOBAL_FIGHT_UI_SCALE)

    -- “太棒啦！获得50钻石奖励”
    self.richText = ccui.RichText:create()
    self.richText:setOutLine(cc.c4b(0,0,0,255),3)
    self.richText:setContentSize(cc.size(420,90))
    self.richText:ignoreContentAdaptWithSize(false)
    -- self.richText:setPosition(display.cx + 30, display.cy + 50)
    -- self:addChild(self.richText)
    self.richText:setPosition(636/2, 78/2 - 20)
    bg:addChild(self.richText)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	bg:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
    	bg:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255,
        "完成指引, 获得", GLOBAL_FONTNAME, 36)
    self.richText:pushBackElement(re1)

    local re2 = ccui.RichElementText:create(3, cc.c3b(252, 255, 0), 255,
        awardCount, GLOBAL_FONTNAME, 36)
    self.richText:pushBackElement(re2)

    local re3 = ccui.RichElementImage:create(2,
        cc.c3b(255, 255, 255), 255, "ui/Icons/rmbSkillIcon/710"
        	..tostring(itemIndex).."01-small.png")
    self.richText:pushBackElement(re3)


    -- 跑一个向上飘的action
    local move = cc.MoveBy:create(2,cc.p(0,50))
    local function later()
        if bg then
           bg:removeFromParent()
        end
    end
    local action = cc.Sequence:create(move,cc.CallFunc:create(later))
    bg:runAction(action)

end

function RMBSkillBtnPanel:onRestart( ... )
	    -- 刷新手动技能
    if self.skillBtns then 
        for i,v in pairs(self.skillBtns) do
            if v.cd > 0 then 
                v.cd = 0
            end
        end
    end
    self.rt.hasSelectedASkill = false

    if self.needGuideItem2 then
    	self.needGuideItem2 = nil
    	self.needShowGuideTime = 0
    end
	-- body
end


function RMBSkillBtnPanel:setRuntime(rt)
	-- print("RMBSkillBtnPanel:setRuntime")
	self.rt = rt

	
end

return RMBSkillBtnPanel