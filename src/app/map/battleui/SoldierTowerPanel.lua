
-- 点击一个兵塔/祭坛塔以后，弹出的招兵、掠夺按钮

local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local SkillBase               = require("app.map.skills.SkillBase")
local MapConstants            = require("app.map.MapConstants")
local GlobalData              = require("tools.GlobalData")
local EffectAniCache          = require("app.map.spine.EffectAniCache")
local BulletFactory           = require("app.map.bullets.BulletFactory")
local BulletProperties        = require("app.properties.BulletProperties")
-- SoldierTowerPanel
local SoldierTowerPanel = class("SoldierTowerPanel", function()
    return display.newNode()
end)

local DIFF_Y = 15    -- 写死掉，祭坛塔的操作页面往上移15个像素

function SoldierTowerPanel:ctor()
	-- print("SoldierTowerPanel:ctor()")
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
function SoldierTowerPanel:createView()

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
    local towerCircle =  display.newSprite("ui/fight/tower/soldierTowerCircle.png")
    self.view:addChild(towerCircle)

    local posX  = -95    -- 第一个出兵按钮的X坐标
    local posY  = 35     -- 第一个出兵按钮的Y坐标
    local diff_X = 95    -- 第一个和第二个出兵按钮之间的x间隔
    local diff_Y = 65    -- 第一个和第二个出兵按钮之间的y间隔


    ----------------------------------- 第一个召唤兵按钮 ----------------------------
    -- 创建招兵按钮1
    self.soldierBtn1 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickSoldierBtn(1)
    end)
    :pos(posX, posY)
    :addTo(self.view,1)

    -- 召唤兵的Icon
    self.icon1 = display.newSprite("ui/fight/soldierTower/170204.png")
        :addTo(self.soldierBtn1)
        :setVisible(true)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite1 = display.newSprite("ui/fight/tower/build.png")
        :addTo(self.soldierBtn1)
        :setVisible(false)

    -- 如果限制了祭坛塔不能召唤士兵
    self.lock1 = display.newSprite("ui/fight/lock.png")
        :addTo(self.soldierBtn1)
        :setVisible(false)

    -- 显示召唤兵消耗金币数量的框
    self.towerMoneyImg1 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.soldierBtn1:addChild(self.towerMoneyImg1)
    self.towerMoneyImg1:setPositionY(-30)

    --创建召唤兵金钱标签
    self.goldCostLabel1 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        -- align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = 0,
        y = -30,
        })
        :addTo(self.soldierBtn1)
    self.goldCostLabel1:setAnchorPoint(0.5, 0.5)

    -- 召唤兵还活着的特效
    local sprite, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_summon_aperture", true)
    self.soldierBtn1:addChild(sprite)
    sprite:setPosition(offsetX, offsetY + 5)
    sprite:setVisible(false)
    self.aliveEff1 = sprite

    -- --创建招兵金钱标签
    -- self.goldCostLabel1 = cc.ui.UILabel.new({
    --     UILabelType = 2,
    --     text = "",
    --     font = GLOBAL_FONTNAME,
    --     x =-100,
    --     y = 50,
    -- })
    -- :setVisible(false)
    -- self:addChild(self.goldCostLabel1,1)

    ----------------------------------- 第二个召唤兵按钮 ------------------------------
    -- 创建招兵按钮2
    self.soldierBtn2 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickSoldierBtn(2)
    end)
    :pos(posX + diff_X, posY + diff_Y)
    :addTo(self.view,1)

    -- 召唤兵的Icon
    self.icon2 = display.newSprite("ui/fight/soldierTower/170301.png")
        :addTo(self.soldierBtn2)
        :setVisible(true)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite2 = display.newSprite("ui/fight/tower/build.png")
    :addTo(self.soldierBtn2)
    :setVisible(false)

    -- 如果限制了祭坛塔不能召唤士兵
    self.lock2 = display.newSprite("ui/fight/lock.png")
        :addTo(self.soldierBtn2)
        :setVisible(false)

    -- 显示召唤兵消耗金币数量的框
    self.towerMoneyImg2 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.soldierBtn2:addChild(self.towerMoneyImg2)
    self.towerMoneyImg2:setPositionY(-30)

    --创建召唤兵金钱标签
    self.goldCostLabel2 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -15,
        y = -30,
        })
        :addTo(self.soldierBtn2)

    -- 召唤兵还活着的特效
    local sprite, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_summon_aperture", true)
    self.soldierBtn2:addChild(sprite)
    sprite:setPosition(offsetX, offsetY + 5)
    sprite:setVisible(false)
    self.aliveEff2 = sprite


    -- --创建招兵金钱标签2, 2表示可以招第二种兵
    -- self.goldCostLabel2 = cc.ui.UILabel.new({
    --     UILabelType = 1,
    --     text = "",
    --     font = GLOBAL_FONTNAME,
    --     x = 0,
    --     y = 100,
    -- })
    -- :setVisible(false)
    -- self:addChild(self.goldCostLabel2,1)

    ------------------------------- 第三个召唤兵按钮 --------------------------------
    -- 创建招兵按钮3
    self.soldierBtn3 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        self:onClickSoldierBtn(3)
    end)
    :pos(posX + 2*diff_X, posY)
    :addTo(self.view,1)

    -- 召唤兵的Icon
    self.icon3 = display.newSprite("ui/fight/soldierTower/170106.png")
        :addTo(self.soldierBtn3)
        :setVisible(true)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite3 = display.newSprite("ui/fight/tower/build.png")
    :addTo(self.soldierBtn3)
    :setVisible(false)

    -- 如果限制了祭坛塔不能召唤士兵
    self.lock3 = display.newSprite("ui/fight/lock.png")
        :addTo(self.soldierBtn3)
        :setVisible(false)

    -- 显示召唤兵消耗金币数量的框
    self.towerMoneyImg3 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.soldierBtn3:addChild(self.towerMoneyImg3)
    self.towerMoneyImg3:setPositionY(-30)

    --创建召唤兵金钱标签
    self.goldCostLabel3 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -17,
        y = -30,
        })
        :addTo(self.soldierBtn3)

    -- 召唤兵还活着的特效
    local sprite, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_summon_aperture", true)
    self.soldierBtn3:addChild(sprite)
    sprite:setPosition(offsetX, offsetY + 5)
    sprite:setVisible(false)
    self.aliveEff3 = sprite

    -- --创建招兵金钱标签3, 3表示可以招第二种兵
    -- self.goldCostLabel3 = cc.ui.UILabel.new({
    --     UILabelType = 1,
    --     text = "",
    --     font = GLOBAL_FONTNAME,
    --     x = 100,
    --     y = 50,
    -- })
    -- :setVisible(false)
    -- self:addChild(self.goldCostLabel3,1)


    -- 创建掠夺按钮
    self.plunderBtn = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :onButtonClicked(function(event)
        -- self.map_:setDebugViewEnabled(not self.map_:isDebugViewEnabled())
        self:onClickPlunderBtn()
    end)
    :pos(0,-100)
    :addTo(self.view,1)

    -- 掠夺的Icon
    self.icon4 = display.newSprite("ui/fight/soldierTower/plunder.png")
        :addTo(self.plunderBtn)
        :setVisible(true)

    -- 选中按钮以后的标记，就是那个绿色的勾
    self.buildSprite4 = display.newSprite("ui/fight/heroControl/heroSelect2.png")
    :addTo(self.plunderBtn)
    :setScale(0.7)
    -- :setVisible(false)
    -- 转圈的特效
    local act1 = cc.RotateBy:create(1, 360)
    local seq  = cc.Sequence:create(act1)
    local rotateAction = cc.RepeatForever:create(seq)
    self.buildSprite4:runAction(rotateAction)

    -- 如果限制了祭坛塔不能掠夺
    self.lock4 = display.newSprite("ui/fight/lock.png")
        :addTo(self.plunderBtn)
        :setVisible(false)

    -- 记录3个召唤兵还活着的特效
    self.aliveEffs = {}
    self.aliveEffs[1] = self.aliveEff1
    self.aliveEffs[2] = self.aliveEff2
    self.aliveEffs[3] = self.aliveEff3


    -- windows平台上面，塔按钮UI要缩放0.8
    if (device.platform == "mac" or device.platform == "windows") then
        self.soldierBtn1:setScale(0.95)
        self.soldierBtn2:setScale(0.95)
        self.soldierBtn3:setScale(0.95)
        -- self.soldierBtn1:setPositionY(self.soldierBtn1:getPositionY())
        -- self.soldierBtn2:setPositionY(self.soldierBtn2:getPositionY())
        -- self.soldierBtn3:setPositionY(self.soldierBtn3:getPositionY())
        -- self.plunderBtn:setPositionY(self.plunderBtn:getPositionY() - 10)
        self.plunderBtn:setScale(0.9)
    end

end

-- 在指定塔基处显示
function SoldierTowerPanel:show(tower, battleUI)

    -- 播放点击塔基的音效
    AudioMgr.playSound("Arataki")

    self.tower = tower
    self.battleUI = battleUI

    if not self.tower._plunderPower then
        self.tower._plunderPower = 0
    end

    -- add by Owen, 2016.6.19, 判定这个祭坛塔的某个index的召唤兵是否还活着
    for i = 1, 3 do
        if tower._isSoldierAlive[i] then
            self.aliveEffs[i]:setVisible(true)
        else
            self.aliveEffs[i]:setVisible(false)
        end
    end

    -- 隐藏掉选中图标
    self.buildSprite1:setVisible(false)
    self.buildSprite2:setVisible(false)
    self.buildSprite3:setVisible(false)
    self.lock1:setVisible(false)
    self.lock2:setVisible(false)
    self.lock3:setVisible(false)
    self.lock4:setVisible(false)
    self.icon1:setVisible(true)
    self.icon2:setVisible(true)
    self.icon3:setVisible(true)
    self.icon4:setVisible(true)
    -- self.buildSprite4:setVisible(false)


    self.goldCostLabel1:setString(tower.soldiers_[1][2])
    -- print("tower.soldiers_[2][2] = "..tostring(tower.soldiers_[2][2]))
    self.goldCostLabel2:setString(tower.soldiers_[2][2])
    self.goldCostLabel3:setString(tower.soldiers_[3][2])


    self.towerRangeCircle:setScaleX(self.tower.plunderRange_/self.towerRangeCircle.r)
    self.towerRangeCircle:setScaleY(0.8*self.tower.plunderRange_/self.towerRangeCircle.r)

    -- 根据管卡的限制，可能不能招兵，也可能不能进行掠夺
    if not BattleDataManager:getCanCallSoldier() then
        self.lock1:setVisible(true)
        self.lock2:setVisible(true)
        self.lock3:setVisible(true)
        self.icon1:setVisible(false)
        self.icon2:setVisible(false)
        self.icon3:setVisible(false)
    end
    if not BattleDataManager:getCanPlunder() then
        self.lock4:setVisible(true)
        self.icon4:setVisible(false)
    end

    self:setVisible(true)

    self.view:setScale(0.5)
    -- change by Owen, 2016.5.9, 因为self已经setScale过了，this.view就不需要再缩放了
    local action = cc.ScaleTo:create(0.21, 1)  -- self.orignalScale)
    self.view:runAction(action)

    self.towerRangeCircle:setVisible(true)

    -- add by Owen, 2016.5.11, 点击祭坛的时候，这个黄色区域不显示；
    -- 点击一个召唤兵按钮之后，再显示这个黄色区域；点击掠夺按钮，不显示黄色区域
    self.towerRangeCircle:setVisible(false)

    -- print("SoldierTowerPanel:show tower.mainID_ = "..tostring(tower.mainID_))

    -- 增加一个标识自己是否隐藏了的变量，用来防止页面已经显示了
    -- 然后点击其他区域，将页面隐藏，在页面隐藏的动画过程中又点击了一次按钮
    -- 这样就选中了一个按钮
    self.isHide = false
end

-- add by Owen, 2016.6.19, 某个召唤兵死亡了，要把对应位置的召唤特效置为不可见
function SoldierTowerPanel:hideAliveEff(index)
    print("SoldierTowerPanel:hideAliveEff index = "..tostring(index))
    self.aliveEffs[index]:setVisible(false)
end

-- 点击出兵按钮
function SoldierTowerPanel:onClickSoldierBtn(btnIndex)
    -- print("点击了第几个出兵按钮 btnIndex = "..btnIndex)

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

    if btnIndex == 1 then
        if not self.lock1:isVisible() then
            if not self.buildSprite1:isVisible() then
                if not self.needGold1 then
                    -- add by Owen, 2016.5.11, 点击祭坛的时候，这个黄色区域不显示；
                    -- 点击一个召唤兵按钮之后，再显示这个黄色区域；点击掠夺按钮，不显示黄色区域
                    self.towerRangeCircle:setVisible(true)

                	-- 把第二个升级  按钮和删除按钮的选中图片隐藏
    			    self.buildSprite2:setVisible(false)
    			    self.buildSprite3:setVisible(false)
    			    -- self.buildSprite4:setVisible(false)

                	self.buildSprite1:setVisible(true)

                    self.icon1:setVisible(false)
                    self.icon2:setVisible(true)
                    self.icon3:setVisible(true)

                	-- 给 BattleUI 上一个标记，表示点击屏幕后，是派兵
                	self.battleUI.bCallSoldier = true
                	self.battleUI.soldierIndex = 1

                else
                    -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
                    AudioMgr.playSound("Error")
                end
            else
            	-- 取消选中
                self.towerRangeCircle:setVisible(false)

            	self.buildSprite1:setVisible(false)
                self.icon1:setVisible(true)
                -- 取消给 BattleUI 上的标记
            	self.battleUI.bCallSoldier = false
            	self.battleUI.soldierIndex = 0
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    elseif btnIndex == 2 then
        if not self.lock2:isVisible() then
            if not self.buildSprite2:isVisible() then
                if not self.needGold2 then
                    self.towerRangeCircle:setVisible(true)

                	-- 把第二个升级按钮和删除按钮的选中图片隐藏
    		        self.buildSprite1:setVisible(false)
    		        self.buildSprite3:setVisible(false)
    		        -- self.buildSprite4:setVisible(false)

                	self.buildSprite2:setVisible(true)

                    self.icon1:setVisible(true)
                    self.icon2:setVisible(false)
                    self.icon3:setVisible(true)

                	self.battleUI.bCallSoldier = true
                	self.battleUI.soldierIndex = 2

                else
                    -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
                    AudioMgr.playSound("Error")
                end
            else
            	-- 取消选中
                self.towerRangeCircle:setVisible(false)

            	self.buildSprite2:setVisible(false)
                self.icon2:setVisible(true)
                -- 取消给 BattleUI 上的标记
            	self.battleUI.bCallSoldier = false
            	self.battleUI.soldierIndex = 0
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    elseif btnIndex == 3 then
        if not self.lock3:isVisible() then
            if not self.buildSprite3:isVisible() then
                if not self.needGold3 then

                    self.towerRangeCircle:setVisible(true)

                	-- 把第二个升级按钮和删除按钮的选中图片隐藏
    				self.buildSprite1:setVisible(false)
    				self.buildSprite2:setVisible(false)
    				-- self.buildSprite4:setVisible(false)

                	self.buildSprite3:setVisible(true)

                    self.icon1:setVisible(true)
                    self.icon2:setVisible(true)
                    self.icon3:setVisible(false)

                	self.battleUI.bCallSoldier = true
                	self.battleUI.soldierIndex = 3

                else
                    -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
                    AudioMgr.playSound("Error")
                end
            else
            	-- 取消选中
                self.towerRangeCircle:setVisible(false)

            	self.buildSprite3:setVisible(false)
                self.icon3:setVisible(true)
                -- 取消给 BattleUI 上的标记
            	self.battleUI.bCallSoldier = false
            	self.battleUI.soldierIndex = 0
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    end
end

-- 点击掠夺按钮
function SoldierTowerPanel:onClickPlunderBtn()

    -- 表示页面已经隐藏了，防止在播放隐藏动画的时候，用户再次点击页面上的按钮控件
    if self.isHide then
        return
    end

    -- 如果掠夺的能量到了，才可以点击
    -- print("onClickPlunderBtn self._plunderPower = "..tostring(self._plunderPower)
    --     .." self.tower.restorePower_[2] = "..tostring(self.tower.restorePower_[2]))
    if not self.lock4:isVisible() then
        if self.tower._plunderPower >= self.tower.restorePower_[2] then

            -- add by Owen, 2016.4.23, 祭坛抢钱的时候，需要播放音效
            AudioMgr.playSound("Altar")

            local tower = self.tower
                            
            -- 如果是扩散子弹
            local centerX = tower.x_ + tower.radiusOffsetX_ 
            local centerY = tower.y_ + tower.radiusOffsetY_ 

            -- 点击掠夺按钮以后，把能量满的特效移除，然后显示一个掠夺的特效
            tower._plunderFullEff:removeSelf()
            tower._plunderFullEff = nil
            self:hide()


            -- -- 显示一个扩散的范围, 0.6秒后开始隐藏
            -- local sprite    = display.newSprite("ui/fight/circle.png")
            -- local scale     = tower.plunderRange_*2/sprite:getContentSize().width
            -- sprite:setScaleY(0.8*scale) 
            -- sprite:setScaleX(scale)
            -- self.rt.map_:getBatchLayer():addChild(sprite, MapConstants.BULLET_ZORDER)
            -- sprite:setPosition(centerX, centerY)
            -- transition.fadeOut(sprite, {
            --     time = 0.3,
            --     delay = 0.6,
            --     onComplete = function()
            --         if not tolua.isnull(sprite) then
            --             sprite:removeSelf()
            --             -- self:hide()
            --         end
            --     end
            -- })

            -- 根据技能的作用对象，获得范围内特定的目标
            local targets = SkillBase.dealTarget(self.rt, centerX, centerY, tower.plunderRange_, 
                999, {0, 0, 0, 0, 0, 0, 0, 1, 1, 1})

            -- 取到要作用的对象后，给他附上状态
            if targets ~= nil and #targets > 0 then
                -- 增加金币
                BattleDataManager:addGold( (#targets)*tower.plunderFactor_[1] + tower.plunderFactor_[2])

                -- add by Owen, 2016.5.12, 制作金币飘向祭坛塔的特效
                local batchLayer = targets[1].map_:getBatchLayer()
                local endPosX = tower.x_ + tower.radiusOffsetX_
                local endPosY = tower.y_ + tower.radiusOffsetY_
                for i, object in pairs(targets) do
                    local gold = display.newSprite("ui/fight/gold.png")

                    -- batchLayer:addChild(gold, MapConstants.BULLET_ZORDER)
                    -- gold:setPosition(object.x_ + object.offsetX_, object.y_ + object.offsetY_)
                    -- local moveTo = cc.MoveTo:create(0.5, cc.p(endPosX, endPosY))
                    -- local function callback( ... )
                    --     gold:removeSelf()
                    -- end
                    -- local cal    = cc.CallFunc:create(callback)
                    -- local seq    = cc.Sequence:create(moveTo, cal);

                    -- gold:runAction(seq)

                    local skillConfig  = {}
                    local bulletConfig = BulletProperties.get("150102")
                    local bulletType   = bulletConfig.bulletType
                    local trajectory   = 2    -- 2表示是抛物线子弹
                    local skillId      = skillConfig.mainID

                    -- 生成子弹
                    local bullet = BulletFactory.newBullets(bulletType, 
                        object, tower, nil, bulletConfig, trajectory, true, skillConfig, nil)
                    if bullet:getView() then
                        self.rt.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
                    end
                    self.rt:addBullet(bullet)

                end
            end

            self.tower._plunderPower = 0

            -- 点击了一个塔的掠夺技能，所有的兵塔的掠夺CD都要重置
            for i, v in ipairs(self.rt.soldierTowers_) do
                v._plunderPower = 0
                if v._plunderFullEff then
                    v._plunderFullEff:removeSelf()
                    v._plunderFullEff = nil
                end
            end

            
            GlobalData.addPlunderCount(1)
            local plunderCount = GlobalData.getPlunderCount()
            -- 处理成就，祭坛掠夺50次
            if plunderCount >= 50 then
                local state1 = GlobalData.getAchieve("141223") 
                if state1 == 0 then
                    GlobalData.setAchieve("141223", 1)
                end
            end
            -- 处理成就，祭坛掠夺100次
            if plunderCount >= 100 then
                local state1 = GlobalData.getAchieve("141224") 
                if state1 == 0 then
                    GlobalData.setAchieve("141224", 1)
                end
            end
        else
            -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
            AudioMgr.playSound("Error")
        end
    else
        -- add by Owen, 2016.4.23, 点击不可点击的按钮时，需要播放音效
        AudioMgr.playSound("Error")
    end
end




function SoldierTowerPanel:hide()
    -- self.prepareToHide = true

    self.isHide = true

    local scaleTo = cc.ScaleTo:create(0.1, 0.5)
    local function callback( ... )
        self:setVisible(false)
    end
    local cal    = cc.CallFunc:create(callback)
    local seq    = cc.Sequence:create(scaleTo, cal);

    self.view:runAction(seq)

    self.towerRangeCircle:setVisible(false)

    if self.tower and self.tower.sprite_ then
        self.tower.sprite_:setVisible(true)
    end
	-- self:setVisible(false)

	-- 清空battleUI中记录的是不是点击后需要出兵
	self.battleUI.bCallSoldier = false
	self.battleUI.soldierIndex = 0
end

function SoldierTowerPanel:tick(dt)

	if (self.tower) and (self:isVisible()) then
		-- local x, y = self.rt.camera_:convertToWorldPosition(self.tower.x_, self.tower.y_)
        local x, y = self.rt.camera_:convertToWorldPosition(
            self.tower.x_ + self.tower.radiusOffsetX_,
            self.tower.y_ + self.tower.radiusOffsetY_ + DIFF_Y)

        -- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
        self:setPosition(x,y)

		-- 当用户拖拽地图时，让选择塔的UI一直跟着坑的位置移动
		self:setPosition(x,y)

        -- 刷新金币限制的标记
        self.needGold1 = false
        self.needGold2 = false
        self.needGold3 = false

        if self.tower.soldiers_[1][2] > BattleDataManager:getGoldCount() then
            self.needGold1 = true
            if not self.isGray1 then
                -- 图标需要变灰
                EnableGraySprite(self.icon1)
                self.goldCostLabel1:setColor(cc.c3b(155, 155, 155))

                EnableGraySprite(self.buildSprite1)
                self.isGray1 = true
            end
        else
            if self.isGray1 then
                DisableGraySprite(self.icon1)
                self.goldCostLabel1:setColor(cc.c3b(255, 255, 255))

                DisableGraySprite(self.buildSprite1)
                self.isGray1 = false
            end
        end

        if self.tower.soldiers_[2][2] > BattleDataManager:getGoldCount() then
            self.needGold2 = true
            -- 图标需要变灰
            if not self.isGray2 then
                EnableGraySprite(self.icon2)
                self.goldCostLabel2:setColor(cc.c3b(155, 155, 155))

                EnableGraySprite(self.buildSprite2)
                self.isGray2 = true
            end
        else
            if self.isGray2 then
                DisableGraySprite(self.icon2)
                self.goldCostLabel2:setColor(cc.c3b(255, 255, 255))

                DisableGraySprite(self.buildSprite2)
                self.isGray2 = false
            end
        end

        if self.tower.soldiers_[3][2] > BattleDataManager:getGoldCount() then
            self.needGold3 = true
            if not self.isGray3 then
                -- 图标需要变灰
                EnableGraySprite(self.icon3)
                self.goldCostLabel3:setColor(cc.c3b(155, 155, 155))

                EnableGraySprite(self.buildSprite3)
                self.isGray3 = true
            end
        else
            if self.isGray3 then
                DisableGraySprite(self.icon3)
                self.goldCostLabel3:setColor(cc.c3b(255, 255, 255))

                DisableGraySprite(self.buildSprite3)
                self.isGray3 = false
            end
        end

        if self.tower._plunderPower then
            -- 如果掠夺按钮已经可以点击了，那么把图标点亮, 显示转圈图片
            if self.tower._plunderPower >= self.tower.restorePower_[2] then
                if self.isGray4 then
                    DisableGraySprite(self.icon4)
                    self.isGray4 = false
                end
                if not self.buildSprite4:isVisible() then
                    self.buildSprite4:setVisible(true)
                end
            end
            if self.tower._plunderPower < self.tower.restorePower_[2] then
                if not self.isGray4 then
                    EnableGraySprite(self.icon4)
                    self.isGray4 = true
                end
                if self.buildSprite4:isVisible() then
                    self.buildSprite4:setVisible(false)
                end
            end
        end

    end
end

-- 设置 MapRuntime
function SoldierTowerPanel:setRuntime(rt)
	-- print("SoldierTowerPanel:setRuntime")
	self.rt = rt

end


return SoldierTowerPanel