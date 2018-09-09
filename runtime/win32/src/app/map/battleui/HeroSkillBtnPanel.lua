
local ManualSkillProperties = require("app.properties.ManualSkillProperties")
local SkillBase             = require("app.map.skills.SkillBase")
local BattleDataManager     = require("app.map.data.BattleDataManager")
local GlobalData            = require("tools.GlobalData")
local MapConstants          = require("app.map.MapConstants")
local TipsBoxPanel          = require("app.map.battleui.TipsBoxPanel")
local EffectAniCache        = require("app.map.spine.EffectAniCache")

require "socket"

local HeroSkillBtnPanel = class("HeroSkillBtnPanel", function()
    return display.newNode()
end)

-- 战斗界面左下角的英雄技能图标

function HeroSkillBtnPanel:ctor(battleUI)
	self.rt = nil
	self.map = nil
	self.heros = {}
	self.skills = {}
	self.skillBtns = {}
	self.oldtime = 0 -- 用来读秒
	self.battleUI = battleUI

	-- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    -- windows平台上面，战斗UI要缩放0.8
    if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        self:setScale(0.7)
    end

end

function HeroSkillBtnPanel:show()

	self.skillBtns = {}
	if self.rt then
		self.map = self.rt.map_
		self.heros = self.map:getHero()
		self.map.manualSkills = {}

		if self.heros then 
			for i,hero in pairs(self.heros) do 
				local skillID = hero.manualSkill_[1]
				dump(hero.manualSkill_, "HeroSkillBtnPanel:show dump hero.manualSkill_")

				local skill = ManualSkillProperties.get(skillID)
				-- change by Owen, 处理羁绊对技能的影响
				skill = SkillBase.dealChangeData(skillID, skill)

				local skillCD = skill.skillCD
				local CDplace = skill.CDplace
				local skilltable = {
					skillID,
					skillCD,
					0,
					CDplace,   
				}
				self.map.manualSkills[skillID] = skilltable

				--table.insert(self.map.manualSkills,skilltable)
			end
		end 

		-- 显示英雄技能底图
		-- local skillFrameBg = display.newSprite("ui/fight/heroSkill/skillFrameBg.png")
		-- 	:addTo(self)
		-- skillFrameBg:setPosition(0, skillFrameBg:getContentSize().height/2)
		local posX    = 80     -- 第一个技能框的x坐标
		local posY    = 50     -- 第一个技能框的y坐标
		local diffX   = 120    -- 两个技能框的x坐标间隔
		self.skillBg  = {}     -- 记录3个技能的背景框图片
		self.skillIcon = {}    -- 记录3个技能icon图片
		for i = 1, 3 do
			local skillBg = display.newSprite("ui/fight/heroSkill/skillBg.png")
				:addTo(self)
				:pos(posX + (i - 1) * diffX, posY)
			self.skillBg[i] = skillBg
			local skillIcon = display.newSprite("ui/fight/heroSkill/noHero.png")
				:addTo(skillBg, -1)
			local size = skillBg:getContentSize()
			self.skillBgSize = size
			skillIcon:setPosition(size.width/2, size.height/2)
			self.skillIcon[i] = skillIcon
		end

		local i = 1
		for k, v in pairs(self.heros) do 
			skill = v.manualSkill_[1]
			--for key,skill in pairs(self.map.manualSkills) do
			-- skill = {skillID,
			-- 	skillCD, 冷却时间
			-- 	skillCD, 当前冷却时间	
			-- 	CDplace, CD占位
			-- }
			local skillPro = ManualSkillProperties.get(skill)
			-- change by Owen, 处理羁绊对技能的影响
			skillPro = SkillBase.dealChangeData(skill, skillPro)

			local icon = skillPro.icon

			self.skillIcon[i]:setVisible(false)

			-- 新建icon按钮
			local skillBtn = cc.ui.UIPushButton.new("ui/Icons/heroSkillIcon/"..icon..".png")
				:onButtonClicked(function(...)
					self:onButtonClicked(...)

	                --self.rt:selectOneSkill("170101")             
	                end)
					:addTo(self.skillBg[i], -1)
					:pos(self.skillBgSize.width/2, self.skillBgSize.height/2) -- (i-1)*160,0)
	                -- :setScale(1)

	        -- add by Owen, 2016.5.24, 制作技能CD到了以后，要一直显示的特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_cdup", true)
            effect:setVisible(false)
			effect:setPosition(52, 57)
	        skillBtn.cdOnEff = effect
	        -- skillBtn.selected.isSelected_ = false
	        self.skillBg[i]:addChild(effect)

            -- skillBtn.selected = effect
	        skillBtn.selected =display.newSprite("ui/fight/heroSkill/skillSelected.png")
				:setVisible(false)
				:pos(52, 57)
	        skillBtn.selected.isSelected_ = false
	        self.skillBg[i]:addChild(skillBtn.selected)

	        -- add by Owen, 2016.5.24, 如果这个羁绊激活了，需要显示加血技能的数量点
	        local groups = GlobalData.getActiveGroup()
            for i2,v2 in ipairs(groups) do
                if v2 == "21" and string.sub(skillPro.mainID, 1, 5) == "13016" then
                    local outside
                    local inside
                    self.insideImgs = {}    -- 记录在里面的所有的图片
                    for i3 = 1, 5 do
                    	outside = display.newSprite("ui/fight/fwq.png")
                    		:addTo(self.skillBg[i])
                    		:pos(i3*18, 120)

                    	inside = display.newSprite("ui/fight/fwq2.png")
                    		:addTo(outside)
                    		:pos(7, 10)
                    		:setVisible(false)

                    	self.insideImgs[i3] = inside
                    end
                    break
                end
            end

	        -- 新建小旗子，与英雄头像一一对应起来
	        local skillFlag = display.newSprite("ui/fight/heroSkill/"..icon.."_flag.png")
	        	:addTo(self.skillBg[i])
	        	:pos(30, 98)

	        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
		        -- 新建快捷键图标，与英雄头像一一对应起来
		        local keyFlag = display.newSprite("ui/fight/heroSkill/"..icon.."_flag2.png")
		        	:addTo(self.skillBg[i])
		        	:pos(80, 28)
		        local keyLabel = cc.ui.UILabel.new({
		            UILabelType = 2,
		            font = GLOBAL_FONTNAME,
		            text = tostring(i),
		            size = 20,
		            x = 9,
		            y = 15,
		        })
			    :addTo(keyFlag)
			    keyLabel:enableOutline(cc.c4b(0, 0,0,255), 1)
			end


	        skillBtn.progress = display.newProgressTimer("ui/fight/heroSkill/cooldown.png",display.PROGRESS_TIMER_BAR)
			skillBtn.progress:setBarChangeRate(cc.p(0,1))
			skillBtn.progress:setMidpoint(cc.p(0,0))
			skillBtn.progress:setPosition(0,0)
			skillBtn:addChild(skillBtn.progress) 

			
			skillBtn.mask = display.newSprite("ui/fight/heroSkill/cooldown-old.png")
			skillBtn.mask:setPosition(0,0)
			skillBtn.mask:setVisible(false)
			skillBtn:addChild(skillBtn.mask) 


			i = i +1         
			skillBtn.skillID = skill

			-- skillBtn.cdTime = nil
			-- skillBtn.beginTime = nil 
			-- skillBtn.passedTime = nil

			-- print("创建了一个技能按钮")
			table.insert(self.skillBtns,skillBtn)
		end

		--  add by Owen, 2016.4.13, windows平台的话，需要增加快捷键
	    if (device.platform == "mac" or device.platform == "windows") then
	        self:setKeypadEnabled(true)
	        self:addNodeEventListener(cc.KEYPAD_EVENT, function (event)
	            -- dump(event, "dump keypad event")
	            -- print("keypad event.code = "..tostring(event.code)
	            -- 	.." tonumber event.code = "..tostring(tonumber(event.code)))
	            -- print("cc.KeyCode.KEY_1 = "..tostring(cc.KeyCode.KEY_1))
	            local key = tonumber(event.code) - 3
	            local params = {}
	            if key == tonumber(cc.KeyCode.KEY_1) then
	                -- 1表示第一个英雄, 
	                -- change by Owen, 2016.6.3, 有锁的时候不响应快捷键, 
	                -- 防止走第一关技能引导的时候，通过快捷键打断了操作
	                if self.skillBtns[1] and not self.skillLocks[1]:isVisible() 
	                	and not self.needSkillGuide then
		                params.target = self.skillBtns[1]
		                self:onButtonClicked(params)
		            end
	            elseif key == tonumber(cc.KeyCode.KEY_2) then
	                -- 2表示第一个英雄
	                if self.skillBtns[2] then
		                params.target = self.skillBtns[2]
		                self:onButtonClicked(params)
		            end
	            elseif key == tonumber(cc.KeyCode.KEY_3) then
	                -- 3表示第一个英雄
	                if self.skillBtns[3] then
		                params.target = self.skillBtns[3]
		                self:onButtonClicked(params)
		            end
	            end
	        end)
	    end

	    -- 获得地图血量、英雄限制等的配置, 如果是这个位置限制英雄上阵, 则显示一个锁的图标
	    local mapConfig = BattleDataManager:getConfig()
	    -- dump(mapConfig, "dump HeroControlPanel mapConfig")
	    local heroCountLimit = 3
	    if mapConfig.heroLimit and mapConfig.heroLimit.count then
	        heroCountLimit = mapConfig.heroLimit.count
	    end

	    -- 新建3个技能锁住的图标
	    local skillLocks = {}
	    for i = 1, 3 do
	    	skillLocks[i] = display.newSprite("ui/fight/heroSkill/cannotSkill.png")
	            :addTo(self)
	            :setVisible(false)
	            :pos(posX + (i - 1) * diffX, posY + 3)
	    end

	    if heroCountLimit == 0 then
	        -- 3个英雄都不能上阵
	        for i = 1, 3 do
	        	self.skillBg[i]:setVisible(false)
	        	skillLocks[i]:setVisible(true)
	        end
	    elseif heroCountLimit == 1 then
	    	-- 后2个英雄不能上阵
	    	for i = 2, 3 do
	        	self.skillBg[i]:setVisible(false)
	        	skillLocks[i]:setVisible(true)
	        end
	    elseif heroCountLimit == 2 then
	    	-- 最后1个英雄不能上阵
        	self.skillBg[3]:setVisible(false)
        	skillLocks[3]:setVisible(true)
	    end
	    self.skillLocks = skillLocks

	    -- 做新手引导功能
	    self:doGameGuide()

	end

	-- add by Owen, 2016.4.18, 增加一个已经添加的标记，防止重新开始这一关的时候，反复添加
	self.bHasAdd = true
end

function HeroSkillBtnPanel:onButtonClicked(params)
	local skillID = params.target.skillID
	print("HeroSkillBtnPanel:onButtonClicked skillID = "..tostring(skillID)
		.." self.map.manualSkills[skillID][3] = "..tostring(self.map.manualSkills[skillID][3]))
	if self.map.manualSkills[skillID][3] <= 0 then 
		if self.needSkillGuide then
			
			-- 点击完以后把地图移动到右下角
			self.rt.camera_:moveToRightDown()

			-- 在 (927, 155) 位置上，显示一个手指
			local x, y = self.rt.camera_:convertToWorldPosition(1067, 120)
			-- self.fingerImg:setPosition(x, y)
			self.fingerImg:removeSelf()

			-- 播放手指特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", true)
            -- self.skillBg[1]:addChild(effect)
            -- effect:setPosition(55, 50)
            self.battleUI:addChild(effect)
            effect:setPosition(x, y)
            self.fingerImg = effect
            -- print("新手引导技能的点击位置，x = "..tostring(x).." y = "..tostring(y))

            -- 手指不能放大，放大后，引导的区域就不对了
            -- if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            -- 	self.fingerImg:setScale(GLOBAL_FIGHT_UI_SCALE)
            -- elseif GLOBAL_HALL_UI_SCALE2 then
            -- 	self.fingerImg:setScale(GLOBAL_HALL_UI_SCALE2)
            -- end

			self:newGuide2(x, y)
		end
		self.rt:selectOneSkill(skillID)
	else
		-- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        AudioMgr.playSound("Error")
        
		-- local tipLabel = cc.ui.UILabel.new({
	 --        UILabelType = 2,
	 --        text = "刷新时间未到,还剩"..tostring(self.map.manualSkills[skillID][3]/1000).."秒",
	 --        font = "Arial",
	 --        x = -35,
	 --        y = 35
	 --    })
	 --    params.target:addChild(tipLabel)

	 --    transition.fadeOut(tipLabel, {
		--     time = 0.8,
		--     delay = 0.2, -- math.random(30, 100) / 100,
		--     onComplete = function()
		--         if not tolua.isnull(tipLabel) then
		--             tipLabel:removeSelf()
		--         end
		--     end
		-- })
	end 
	-- body
end
function HeroSkillBtnPanel:selectCancel()
	self.rt.hasSelectedASkill = false
end

-- 有羁绊21时，释放了论禅讲道，那么还需要再杏花雨露手技按钮上显示一个数字
function HeroSkillBtnPanel:updateXingHuaCount()
    -- if not self.xingHuaCountLabel then
    -- 	for i,v in ipairs(self.skillBtns) do
    -- 		dump(v, "dump v in updateXingHuaCount")
    --     	if string.sub(v.skillID, 1, 5) == "13016" then
    --     		print("new self.xingHuaCountLabel")
    --     		self.xingHuaCountLabel = cc.ui.UILabel.new({
			 --        UILabelType = 2,
			 --        text = "0",
			 --        size = 50,
			 --        color = cc.c3b(255, 0, 0),
			 --        font = GLOBAL_FONTNAME,
			 --        x = 30,
			 --        y = 95
			 --    })
			 --    v:addChild(self.xingHuaCountLabel)
    --     	end
    --     end
    -- end
    local nowCount = BattleDataManager:getLunChanCount()
    for i = 1, 5 do
    	if i <= nowCount then
    		self.insideImgs[i]:setVisible(true)
    	else
    		self.insideImgs[i]:setVisible(false)
    	end
    end

    -- if nowCount == 0 then
    -- 	self.xingHuaCountLabel:setVisible(false)
    -- else
    -- 	self.xingHuaCountLabel:setVisible(true)
    -- 	self.xingHuaCountLabel:setString("+"..tostring(nowCount))
    -- end
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
function HeroSkillBtnPanel:fourRoundStart()
	print("HeroSkillBtnPanel:fourRoundStart()")
	self.needSkillGuide = true
	self.fourRoundStartTime = 0
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
-- 这个函数表示引导结束了
function HeroSkillBtnPanel:skillGuideOver()
	print("HeroSkillBtnPanel:fourRoundStart()")
	self.needSkillGuide = false
	self.fourRoundStartTime = nil
	self.rt:resumePlay()
	self.fingerImg:removeSelf()
	self.tipsBox:removeSelf()
end

-- 做新手引导功能
function HeroSkillBtnPanel:doGameGuide()
    -- -- add by Owen, 2016.4.24, 新手引导， 如果第一关的模式1没有通关，那么第一个手动技能要显示锁的图标
    if GlobalData.getGameLv() == 1 then
    	local lvStar = GlobalData.getLvStar(1)
    	if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
    		self.skillBg[1]:setVisible(false)
    		self.skillLocks[1]:setVisible(true)
    	end
    end

    -- 新手引导功能，如果是第一关, 且第六关的简单和困难的星星数量都是0，那么不显示第二个和第三个技能
    if GlobalData.getGameLv() == 1 and GlobalData.getGameMode() == MapConstants.GAME_MODE_ONE then
        local lvStar = GlobalData.getLvStar(6)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            self.skillBg[2]:setVisible(false)
            self.skillBg[3]:setVisible(false)
        end
    end

    -- 新手引导功能，如果是第二关，且第六关的简单和困难的星星数量都是0，那么不显示第三个技能
    if GlobalData.getGameLv() == 2 and GlobalData.getGameMode() == MapConstants.GAME_MODE_ONE then
        local lvStar = GlobalData.getLvStar(6)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            self.skillBg[3]:setVisible(false)
        end
    end
end

-- 引导点击英雄技能按钮的时候，显示黑色遮罩的功能
function HeroSkillBtnPanel:newGuide1()

    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    layer:setContentSize(cc.size(1350,860))
    -- layer:setPosition(cc.p(0, 0 ))    -- display.cx,display.cy))

    -- 遮罩的位置
    local x,y  = self.skillBg[1]:getPosition()
    local pos  = self.skillBg[1]:convertToWorldSpace(cc.p(0.5, 0.5))
    local size = self.skillBg[1]:getContentSize()

    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.battleUI:addChild(self.m_ClipNode, viewMgr.zOrder.DEFAULT)

    local image = ccui.ImageView:create("ui/common/mask_img.png")
    image:setScale9Enabled(true)
    image:setCapInsets(cc.rect(20,20,20,20))
    local imageSize = size -- cc.size(120,120)
    image:setContentSize(imageSize)
    image:setTouchEnabled(true)
    local node = cc.Node:create()
    node:addChild(image)


    -- node:setPosition(x, y)   
    if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
    	node:setScale(0.7)
    elseif GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	node:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
    	node:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    node:setPosition(pos.x + size.width/2, pos.y + size.height/2)

    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        local pos = self.skillBg[1]:convertToNodeSpace(touch:getLocation())
        local rect = self.skillBg[1]:getCascadeBoundingBox()
        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            local finger = self.skillBg[1]:getChildByName("finger")
            if finger then
                finger:removeFromParent()
                finger = nil
            end
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

    local finger = EffectAniCache.getFingerInHall()
    local spriteSize = self.skillBg[1]:getContentSize()
    finger:setName("finger")
    self.skillBg[1]:addChild(finger)
    finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end

-- 玩家点击了英雄技能按钮之后，引导玩家点击到地图释放区域的黑色遮罩
function HeroSkillBtnPanel:newGuide2(x, y)

	print("HeroSkillBtnPanel:newGuide2")

-- local bgColor = cc.c3b(255, 0, 0) --非高亮区域颜色
--   local bgOpacity = 0.6 --非高亮区域透明度

--   local layer = display.newColorLayer(cc.c4b(0,0,0,180))

--   local clipNode = CCClippingNode:create();
--   clipNode:setInverted(true)--设定遮罩的模式true显示没有被遮起来的纹理   如果是false就显示遮罩起来的纹理  
--   clipNode:setAlphaThreshold(0) --设定遮罩图层的透明度取值范围 
--   clipNode:addChild(layerColor)
--   self.battleUI:addChild(clipNode)


--   local batchNode = CCSpriteBatchNode:create("ui/common/mask_img.png")

--   local circleSpr = CCSprite:createWithTexture(batchNode:getTexture())
--   local circleSize = circleSpr:getContentSize()

--   local widthPara 
--   local heightPara

--   local rectArray = {
--              [1] = CCRect(100, 100, 100, 100),
--              [2] = CCRect(200, 100, 100, 150),
--              [3] = CCRect(450, 35, 150, 100),
--              [4] = CCRect(300, 300, 100, 100),
--             }

--   for i, rect in ipairs(rectArray) do
--     local circleSpr = CCSprite:createWithTexture(batchNode:getTexture())

--     if not widthPara then
--       local circleSize = circleSpr:getContentSize()

--       --宽度和高度参数，1.4142为根号2，矩形的外接椭圆的长轴与短轴长度
--       widthPara = 1.4142 / circleSize.width
--       heightPara = 1.4142 / circleSize.height
--     end

--     local fScaleX = widthPara * rect.size.width
--     local fScaleY = heightPara * rect.size.height
--     circleSpr:setScaleX(fScaleX)
--     circleSpr:setScaleY(fScaleY)
--     circleSpr:setPosition(rect:getMidX(), rect:getMidY())
--     batchNode:addChild(circleSpr)
--   end
 
--   clipNode:setStencil(batchNode) --关键代码





	 -- local layer=cc.Layer:create()
	 -- self:addChild(layer)
	 --   -- local stencil = cc.DrawNode:create()  
	 --   -- stencil:drawPolygon({cc.p(50,50),cc.p(100,50),cc.p(100,100),cc.p(50,100)},4,cc.c4f(0,0,0,0),1,cc.c4f(0,0,0,0)) 
	 --    local stencil = utils.drawPolygon({(50,50),(100,50),(100,100),(50,100)})
	 --    local  c1=cc.Node:create() 
	 --    c1:addChild(stencil)
	 --    -- local d1=cc.ClippingNode:create(c1) 
	 --    local d1 = cc.ClippingRectangleNode:create(cc.rect(50,50,50,50));
	 --    layer:addChild(d1)
	 --    local a=cc.Sprite:create("ui/common/mask_img.png")
	 --    a:setPosition(cc.p(0,0))
	 --    d1:addChild(a)  




	-- do
	-- 	return
	-- end

	
    local layer = display.newColorLayer(cc.c4b(0,0,0,180))
    -- 遮罩位置不对，可能需要把下面这一行代码注释掉
    layer:setContentSize(cc.size(display.width, display.height))
    
    -- layer:setContentSize(cc.size(1350,860))
    -- layer:setPosition(cc.p(-display.cx,-display.cy))

    -- local x,y = self.Button_hero:getPosition()
    -- local pos = self.Button_hero:convertToWorldSpace(cc.p(0.5,0.5))
    local size = cc.size(60, 60)
    self.m_ClipNode = cc.ClippingNode:create()
    self.m_ClipNode:setInverted(true)
    self.m_ClipNode:setAlphaThreshold(0.01)
    self.m_ClipNode:addChild(layer)
    self.battleUI:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)
    -- change by Owen, 2016.6.6, 把这个节点的位置和 HeroSkillBtnPanel 在battleUI中的位置设为一致
    -- self.m_ClipNode:setPosition(160*GLOBAL_FIGHT_UI_SCALE, 0)
    -- self:addChild(self.m_ClipNode,viewMgr.zOrder.DEFAULT)

    local pos = self.fingerImg:convertToWorldSpace(cc.p(0.5,0.5))

    local image = ccui.ImageView:create("ui/common/mask_img.png")
    image:setScale9Enabled(true)
    image:setCapInsets(cc.rect(20,20,20,20))
    image:setContentSize(cc.size(120,120))
    image:setTouchEnabled(true)
    local node = cc.Node:create()
    node:addChild(image)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
    	node:setScale(GLOBAL_FIGHT_UI_SCALE)
    end

    local imageSize = image:getContentSize()

    -- x = x - 140
    -- y = y - 50

    -- 技能点击区域引导的时候，增加一个黄框在外面
    local frame = ccui.ImageView:create("ui/common/lightBox.png")
    frame:setScale9Enabled(true)
    frame:setCapInsets(cc.rect(20,20,20,20))
    frame:setContentSize(cc.size(140,140))
    -- frame:setPosition(x, y)
    frame:setPosition(pos.x + imageSize.width/2, pos.y + imageSize.height/2)
    self.m_ClipNode:addChild(frame)

    

    -- node:setPosition(1048, 178)

    -- node:setPosition(x, y)
    node:setPosition(pos.x + imageSize.width/2, pos.y + imageSize.height/2)
    self.m_ClipNode:setStencil(node)
    local function onTouchBegan(touch, event)
        -- local pos = self.Button_hero:convertToNodeSpace(touch:getLocation())
        -- local rect = self.Button_hero:getCascadeBoundingBox()
        local rect = cc.rect(pos.x + imageSize.width/2 - 45, pos.y + imageSize.height/2-45, 100, 100)

        -- -- 地图放大了，可点击的区域也要放大
        -- if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        -- 	rect = cc.rect(pos.x + imageSize.width/2 - 25 * GLOBAL_FIGHT_UI_SCALE, 
        -- 		pos.y + imageSize.height/2-25 * GLOBAL_FIGHT_UI_SCALE, 
        -- 		50 * GLOBAL_FIGHT_UI_SCALE,
        -- 		50 * GLOBAL_FIGHT_UI_SCALE)
        -- end

        local pos = touch:getLocation()
        if cc.rectContainsPoint(rect,pos) then
            -- local finger = self.Button_hero:getChildByName("finger")
            -- if finger then
            --     finger:removeFromParent()
            --     finger = nil
            -- end
            -- print("点击了指定的区域")
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
    -- local spriteSize = self.Button_hero:getContentSize()
    -- finger:setName("finger")
    -- self.Button_hero:addChild(finger)
    -- finger:setPosition(cc.p(spriteSize.width/2,spriteSize.height/2))
end

function HeroSkillBtnPanel:tick( dt )

	-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
    if self.needSkillGuide and self.fourRoundStartTime then
    	print("self.fourRoundStartTime = "..tostring(self.fourRoundStartTime))
        self.fourRoundStartTime = self.fourRoundStartTime + dt
        if self.fourRoundStartTime >= 2 then
        	-- 第一关第四波刷怪3秒钟以后，要解锁技能按钮，然后引导用户去释放技能
        	local function actBack()
	        end
        	-- self.skillLocks[1]:runAction(cc.Sequence:create(cc.FadeOut:create(0.5),
        	-- 	cc.CallFunc:create(actBack)))
			
			-- 暂停游戏，然后在技能图标那显示一个手指的特效
			self.rt:pausePlay()

			self.skillLocks[1]:setVisible(false)
        	self.skillBg[1]:setVisible(true)

        	-- 播放手指特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", true)
            -- self.skillBg[1]:addChild(effect)
            -- effect:setPosition(55, 50)
            self:addChild(effect)
            local posX, posY = self.skillBg[1]:getPosition()
            effect:setPosition(posX, posY)
            self.fingerImg = effect

            -- self:newGuide1()


        	-- 显示“点击技能”的提示框
		    self.tipsBox = TipsBoxPanel.new(self, 2)
		    self.skillBg[1]:addChild(self.tipsBox)
		    self.tipsBox:setPosition(75, 170)

		    -- -- windows平台上面，战斗UI要缩放0.8, 但提示框不缩放
		    -- if (device.platform == "mac" or device.platform == "windows") then
		    --     self.tipsBox:setScale((1/0.8) * GLOBAL_FIGHT_UI_SCALE)
		    -- end

        	self.fourRoundStartTime = nil
        end
    end


	self.oldtime = self.oldtime - dt*1000
	if self.oldtime <= 0  then
		self.oldtime = 100
		for k, v in pairs(self.skillBtns) do
			local time = self.map.manualSkills[v.skillID][3]/1000
			if time <= 0 then
				-- 倒计时结束了，遮罩要置为不可见
				v.mask:setVisible(false)

				v.cdOnEff:setVisible(true)

				-- -- add by Owen, 2016.6.16, 技能CD到了，要播放一个提示的特效
				-- local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_cdup_2", false)
				-- effect:setPosition(52, 57)
				-- v:addChild(effect)

				

				time = "ready"
			else
				-- 还在倒计时里面，遮罩是可见的
				v.mask:setVisible(true)

				v.cdOnEff:setVisible(false)

				time = string.format("%.1f", time)
			end
			if not v.tipLabel then 
				-- v.tipLabel = cc.ui.UILabel.new({
				--         UILabelType = 2,
				--         text = time,
				--         font = "Arial",
				--         x = -35,
				--         y = 35
				--     })
				-- v:addChild(v.tipLabel)
			else
				-- v.tipLabel:setString(time)
			end
			v.progress:setPercentage(100*self.map.manualSkills[v.skillID][3]/self.map.manualSkills[v.skillID][2])


		end
	end

	-- 选中狂闪烁
	for k, v in pairs(self.skillBtns) do
		if self.rt.hasSelectedASkill and self.rt.selectedSkillId == v.skillID then 
			if v.selected.isSelected_ ==  false  then  --由于在闪烁中会导致isvisible()混乱，所以使用该变量判断
				v.selected:setVisible(true)
				v.selected.isSelected_ = true

				-- 显示闪烁特效
				-- local show = cc.Show:create()
				-- local hide = cc.Hide:create()
				-- local delay = cc.DelayTime:create(0.5)
				-- --local blink = cc.Blink:create(1,1)
				-- local seq = cc.Sequence:create(show,delay,hide,delay,nil)
				-- v.selected:runAction(cc.RepeatForever:create(seq))
			end
		else 
			if v.selected.isSelected_ then 
				-- v.selected:stopAllActions()
				v.selected:setVisible(false)
				v.selected.isSelected_ = false
			end 
		end
	end


	-- body
end

function HeroSkillBtnPanel:onRestart( ... )
	    -- 刷新手动技能
    if self.map.manualSkills then 
        for key,skill in pairs(self.map.manualSkills) do
            if skill[3]>0 then 
                skill[3] = 0
            end
        end
    end
    self.rt.hasSelectedASkill = false

    -- -- add by Owen, 2016.4.18, 生命之露的次数要清空，控件要隐藏
    -- if self.xingHuaCountLabel then
    -- 	self.xingHuaCountLabel:setVisible(false)
    -- 	BattleDataManager:changeLunChanCount(-1000)
    -- end

    if self.insideImgs then
	    for i = 1, 5 do
	    	self.insideImgs[i]:setVisible(false)
	    end
	end

    -- 做新手引导功能
	self:doGameGuide()

end


function HeroSkillBtnPanel:setRuntime(rt)
	-- print("HeroSkillBtnPanel:setRuntime")
	self.rt = rt

	
end

return HeroSkillBtnPanel