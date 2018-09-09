
local math2d                = require("math2d")
local MapConstants          = require("app.map.MapConstants")
local MapEvent              = require("app.map.MapEvent")
local EventNames            = require("tools.EventNames")
local NotifyCenter          = require("tools.NotifyCenter")
local MapConstants          = require("app.map.MapConstants")
local HeroControlPanel      = require("app.map.battleui.HeroControlPanel")
local TowerSelectPanel      = require("app.map.battleui.TowerSelectPanel")
local TowerControlPanel     = require("app.map.battleui.TowerControlPanel")
local TowerSkillPanel       = require("app.map.battleui.TowerSkillPanel")
local SoldierTowerPanel     = require("app.map.battleui.SoldierTowerPanel")
local GameWinPanel          = require("app.map.battleui.GameWinPanel")
local PausePanel            = require("app.map.battleui.PausePanel")
local RoundStartBtnPanel    = require("app.map.battleui.RoundStartBtnPanel")
local HeroSkillBtnPanel     = require("app.map.battleui.HeroSkillBtnPanel")
local RMBSkillBtnPanel      = require("app.map.battleui.RMBSkillBtnPanel")
local SkillRangePanel       = require("app.map.battleui.SkillRangePanel")
local BattleDataManager     = require("app.map.data.BattleDataManager")
local SkillFactory          = require("app.map.skills.SkillFactory")
local InfoPanel             = require("app.map.battleui.InfoPanel")
local SkillBase             = require("app.map.skills.SkillBase")
local ManualSkillProperties = require("app.properties.ManualSkillProperties")
local AutoSkillProperties   = require("app.properties.AutoSkillProperties")
local PassiveSkillProperties= require("app.properties.PassiveSkillProperties")
local FlyBtnPanel           = require("app.map.battleui.FlyBtnPanel")
local ObjectDetailPanel     = require("app.map.battleui.ObjectDetailPanel")
local BuffBase              = require("app.map.skills.BuffBase")
local BossTimeLayer         = require("app.map.battleui.BossTimeLayer")
local StableGameProperties  = require("app.properties.StableGameProperties")
local GlobalData            = require("tools.GlobalData")
local GameTips              = require("app.map.battleui.GameTips")
local TipsBtnPanel          = require("app.map.battleui.TipsBtnPanel")
local TipsBoxPanel          = require("app.map.battleui.TipsBoxPanel")
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local MonsterProperties     = require("app.properties.MonsterProperties")
local BossKillPanel         = require("app.map.battleui.BossKillPanel")

-- 战斗中的UI界面，显示血量、金币、波数等
local BattleUI = class("BattleUI", function()
    return display.newNode()
end)


-- 创建一个新的 BattleUI
function BattleUI:ctor(mapLayer)
    -- print("yaoxiaoyang function BattleUI:ctor(mapLayer)")
    self:setContentSize(cc.size(display.width, display.height))
    
    self:createChildren()

    -- 再重新开始中要用到
    self.mapLayer_ = mapLayer

    -- 记录兵塔的出兵
    self.bCallSoldier = false
    self.soldierIndex = 0
    self.selectedSoldierTower = nil      -- 记录已经选中的兵塔

    -- 注册监听事件，选中了一个坑以后，回调self:onSelectStandRange()
    -- NotifyCenter.register(EventNames.RT_CHOOSED_TOWER_LOCATION, 
    --     handler(self, self.onSelectStandRange),self)

    -- 漏怪以后更新显示的剩余血量
    NotifyCenter.register(EventNames.UI_UPDATE_HP, handler(self, self.updateHp),self)
    NotifyCenter.register(EventNames.UI_UPDATE_GOLD, handler(self, self.updateGold),self)
    NotifyCenter.register(EventNames.UI_UPDATE_WEATHER, handler(self, self.updateWeather),self)
    NotifyCenter.register(EventNames.UI_UPDATE_CUR_ROUND, handler(self, self.updateCurRound),self)

    NotifyCenter.register(EventNames.UI_SHOW_ROUND_START_BTN,handler(self,self.showRoundStartBtn),self)
    NotifyCenter.register(EventNames.UI_HIDE_ROUND_START_BTN,handler(self,self.hideRoundStartBtn),self)

    NotifyCenter.register(EventNames.RT_RESTART,handler(self,self.onRtRestart),self)

    -- 在rt:preparePlay()中，英雄的技能替换完了以后，才会调用到这个函数
    NotifyCenter.register(EventNames.UI_UPDATE_MANUL_SKILL_PAGE, handler(self, self.onShowHeroSkill), self)

    -- 监听从屏幕上方飘下一个按钮事件
    NotifyCenter.register(EventNames.UI_CREATE_RETURN_GOLD_BTN, handler(self, self.onCreateFlyBtn), self)
    NotifyCenter.register(EventNames.UI_CREATE_ADD_HERO_MAX_HP_BTN, handler(self, self.onCreateFlyBtn), self)
    NotifyCenter.register(EventNames.UI_CREATE_CHANGE_WEATHER_BTN, handler(self, self.onCreateFlyBtn), self)

    -- 有羁绊21时，释放了论禅讲道，那么还需要再杏花雨露手技按钮上显示一个数字
    NotifyCenter.register(EventNames.UI_UPDATE_XING_HUA_COUNT, handler(self, self.onUpdateXingHuaCount), self)

    -- 更新钻石数量
    NotifyCenter.register(EventNames.UI_UPDATE_DIAMOND_COUNT, handler(self, self.onUpdateDiamondCount), self)
    -- 更新钻石数量, 还需要监听信号 EventNames.REFRUSH_WORLDHALL ，因为购买钻石后是发这个信号
    NotifyCenter.register(EventNames.REFRUSH_WORLDHALL, handler(self, self.onUpdateDiamondCount), self)

    -- 第三关祭坛能量满的时候，显示祭坛掠夺的新手引导Tips
    NotifyCenter.register(EventNames.SHOW_PLUNDER_GUIDE_TIPS, handler(self, self.onShowPlunderGuideTips), self)

    -- local winLayer = GameWinPanel.new(1, 0, self.rt, self.mapLayer_, true)
    -- self:addChild(winLayer)

end


function BattleUI:onDown2(event, x, y)
    -- print("function BattleUI:onDown2(event, x, y)")
    -- 交给 MapRuntime
    self.click = true

    if self.rt.hasSelectedASkill == true then
        -- 如果已经选中了一个手动技能
        if not self.skillRange then 
            self.skillRange = display.newNode()
            self.skillRange.sprite = display.newSprite("ui/fight/manualSkillRange.png")
            self.skillRange.sprite:setScale(GLOBAL_FIGHT_UI_SCALE)
            self.skillRange:addChild(self.skillRange.sprite)
            self:addChild(self.skillRange,-1)
            -- self.rt.map_.marksLayer_:addChild(self.skillRange,-1)
            --self.rt.map_:getBatchLayer():addChild(self.skillRange,MapConstants.AREA_IMAGE_ZORDER)
            -- local rotate1 = cc.RotateTo:create(1,180)
            -- local rotate2 = cc.RotateTo:create(1,360)
            -- local seq = cc.Sequence:create(rotate1,rotate2,nil)
            -- self.skillRange.sprite:runAction(cc.RepeatForever:create(seq))      
        end
        -- local x, y = self.rt.camera_:convertToMapPosition(x, y)
        self.skillRange:setPosition(x,y)
        self.skillRange:setVisible(true)

        local manualSkill = ManualSkillProperties.get(self.rt.selectedSkillId)
        -- change by Owen, 处理羁绊对技能的影响
        -- add by Owen, 生命之露 技能，需要判定 潜能漩涡 的次数
        if string.find(manualSkill.mainID, "13016") then
            if BattleDataManager:getLunChanCount() > 0 then
                manualSkill = SkillBase.dealChangeData(self.rt.selectedSkillId, manualSkill)
            end
        else
            manualSkill = SkillBase.dealChangeData(self.rt.selectedSkillId, manualSkill)
        end
        local scale = manualSkill.manualRange
        self.skillRange:setScaleX(scale/350)
        self.skillRange:setScaleY(0.8*scale/350)
    
    elseif self.bCallSoldier then
        -- 给兵塔指定派兵位置
        -- local x, y = self.rt.camera_:convertToMapPosition(x, y)

        if not self.soldierPosImg then
            self.soldierPosImg = display.newSprite("ui/fight/heroMove.png")
            self:addChild(self.soldierPosImg,-1)
        end
        self.soldierPosImg:setPosition(x, y)
        
        -- 指定的地方不在路上，或者超出了范围
        local x, y = self.rt.camera_:convertToMapPosition(x, y)
        local tower = self.selectedSoldierTower
        if self.rt.map_:isWalkable(x,y) and 
            math2d.pointInEllipse(tower.x_ + tower.radiusOffsetX_, tower.y_ + tower.radiusOffsetY_,
                x, y, tower.plunderRange_, 0) then
            self.soldierPosImg:setTexture("ui/fight/heroMove.png")
        else
            self.soldierPosImg:setTexture("ui/fight/heroCantMove.png")
        end

        self.soldierPosImg:setVisible(true)

    else
        -- 没有选中手动技能
        local mapX, mapY = self.rt.camera_:convertToMapPosition(x, y)
        if self.moveHero_ == true then
            -- 移动所有英雄
            if not self.heroMove then 
                self.heroMove = display.newSprite("ui/fight/heroMove.png")
                self:addChild(self.heroMove)
            end
            if self.rt.map_:isWalkable(mapX, mapY) then
                self.heroMove:setTexture("ui/fight/heroMove.png")
            else
                self.heroMove:setTexture("ui/fight/heroCantMove.png")
            end
            -- print("按下，x = "..x.." y = "..y)
            self.heroMove:setPosition(x,y)
            self.heroMove:setVisible(true)
            -- self.heroMove:setScaleX(1)
            -- self.heroMove:setScaleY(1)
        elseif self.moveHeroIndex_ or self.moveHeroBtnIndex_ then 
            -- 移动单个英雄
            if not self.heroMove then 
                self.heroMove = display.newSprite("ui/fight/heroMove.png")
                self:addChild(self.heroMove)
            end
            if self.rt.map_:isWalkable(mapX, mapY) then
                self.heroMove:setTexture("ui/fight/heroMove.png")
                -- self.heroMove:setScale(0.5)
            else
                self.heroMove:setTexture("ui/fight/heroCantMove.png")
            end
            
            self.heroMove:setPosition(x,y)
            self.heroMove:setVisible(true)
            -- self.heroMove:setScale(0.5)
        end
    end

end

function BattleUI:onMove2(event, x, y, drag)
    -- print("function BattleUI:onMove2(event, x, y)")

    -- add by Owen, 2015.12.2, 用来记录在EditorScene:onTouch中是否要调用Camera():moveOffset来移动地图
    local bNeedMoveCamera = true

    -- drag 是没有从ui左边转换到地图坐标的
    local dist = math2d.dist(x, y, drag.startX, drag.startY)
    
    if self.skillRange and self.skillRange:isVisible() then 
        -- 技能的UI是不需要坐标转换的
        self.skillRange:setPosition(x,y)
        bNeedMoveCamera = false
    end

    -- 转换到地图坐标，因为要在地图中显示ui的图片
    local mapX, mapY = self.rt.camera_:convertToMapPosition(x, y)

    -- 给兵塔指定派兵位置
    if self.bCallSoldier and self.soldierPosImg:isVisible() then
        self.soldierPosImg:setPosition(x,y)

        -- 指定的地方不在路上，或者超出了范围
        local tower = self.selectedSoldierTower
        if self.rt.map_:isWalkable(mapX,mapY) and 
            math2d.pointInEllipse(tower.x_ + tower.radiusOffsetX_, tower.y_ + tower.radiusOffsetY_,
                mapX, mapY, tower.plunderRange_, 0) then
            self.soldierPosImg:setTexture("ui/fight/heroMove.png")
        else
            self.soldierPosImg:setTexture("ui/fight/heroCantMove.png")
        end
        bNeedMoveCamera = false
    end

    -- 移动英雄
    if self.heroMove and self.heroMove:isVisible() then 
        self.heroMove:setPosition(x,y)
        if  self.rt.map_:isWalkable(mapX, mapY) then 
            self.heroMove:setTexture("ui/fight/heroMove.png")
        else 
            self.heroMove:setTexture("ui/fight/heroCantMove.png")
        end
        bNeedMoveCamera = false
    end
    if dist> 30 then
        self.click = false
    end 
    return bNeedMoveCamera
end
-- ui 的 onUp

-- 点击空白区域，需要隐藏掉的各种UI页面
function BattleUI:checkandHidePanels()

    if (self.towerSelectPanel:isVisible()) then
        -- 点击空白处隐藏 towerSelectPanel
        self.towerSelectPanel:hide()
        return true 
    end
    if (self.towerControlPanel:isVisible()) then
        -- 点击空白处隐藏 towerControlPanel
        self.towerControlPanel:hide()
        return true
    end
    if (self.towerSkillPanel:isVisible()) then
        self.towerSkillPanel:hide()
        return true
    end
    if (self.skillRangePanel:isVisible()) then 
        self.skillRangePanel:hide()
    end
    if (self.soldierTowerPanel:isVisible()) then
        -- 点击空白处隐藏 soldierTowerPanel
        self.soldierTowerPanel:hide()
        return true 
    end
end

-- 在这个函数里判定是否选中了英雄、怪物、塔
function BattleUI:onUp2(event, x, y )
    -- print("function BattleUI:onUp2(event, x, y )")

    local mx, my = self.rt.camera_:convertToMapPosition(x, y)

    -- 给兵塔指定派兵位置
    if self.bCallSoldier and self.soldierPosImg:isVisible() then
        -- print("在位置mx, my 处生成兵塔的召唤兵 index = "..tostring(self.soldierIndex))

        -- 指定的地方在路上，并且在范围内
        local tower = self.selectedSoldierTower
        if self.rt.map_:isWalkable(mx,my) and 
            math2d.pointInEllipse(tower.x_ + tower.radiusOffsetX_, tower.y_ + tower.radiusOffsetY_,
                mx, my, tower.plunderRange_, 0) then
            -- TO-DO，在位置mx, my处生成召唤兵
            self.rt:callTowerSoldier(tower, self.soldierIndex, mx, my)
            self.bCallSoldier = false
            self.soldierPosImg:setVisible(false)
            self.soldierTowerPanel:hide()
        else
            self.soldierPosImg:setVisible(false)
        end
        -- 如果没有成功指定地方，这个操作就不能取消
        return
    end

    if self:checkandHidePanels() then 
        return
    end 

    -- 下面判断有选择状态的情况
    -- 如果选中了技能，那么释放技能
    if self.rt.hasSelectedASkill == true then
        -- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
        if self.heroSkillBtnPanel.needSkillGuide then
            -- 如果点击范围在20像素以外，则当做无效的点击
            -- local dist = math2d.dist(mx, my, 927, 155)
            -- if dist > 50 then
            --     return false
            -- end
            self:skillGuideOver()
            self.heroSkillBtnPanel:skillGuideOver()
        end

        SkillFactory.releaseSkill(nil,self.rt.selectedSkillId, MapConstants.SKILL_TYPE_MANUAL, self.rt, nil, nil, mx, my)
        -- 如果释放的是鹏魔王的技能，要把金币清空，并需要记录清空了多少金币
        if string.sub(self.rt.selectedSkillId, 1, 5) == "13015" then
            local percent = StableGameProperties.KAI_ER_MANUL_SKILL_COST_GOLD/10000
            local goldCost = BattleDataManager:getGoldCount()*percent
            BattleDataManager:castPengMoWang(goldCost)
        end
        self.rt.hasSelectedASkill = false
        self.rt.selectedSkillId   = nil
        if self.skillRange and self.skillRange:isVisible() then 
            self.skillRange:setVisible(false)
        end
        return false
    end

    -- 移动所有英雄
    if self.moveHero_ then 
        -- 可以行走的区域才让英雄走过去，并插旗表示要走到的目标
        if self.rt.map_:isWalkable(mx,my) then
            self.rt:moveMasterTo(mx,my)
            -- self:setMoveFlags()
            -- -- 隐藏显示的点击目标图片
            -- if self.heroMove and self.heroMove:isVisible() then 
            --     self.heroMove:setVisible(false)
            -- end
        end
        -- else
            if self.heroMove and self.heroMove:isVisible() then 
                -- 0.3秒后隐藏显示的点击目标图片
                transition.fadeTo(self.heroMove, {
                    opacity = 255,
                    time = 0.3,
                    onComplete = function()
                        self.heroMove:setVisible(false)
                    end
                })
            end
        -- end
        -- 取消3个英雄的选中状态，
        self:heroAssembleCancel()

        return false
    end

    -- 移动单个英雄
    if self.moveHeroIndex_ or self.moveHeroBtnIndex_ then
        local index = self.moveHeroIndex_
        if self.moveHeroBtnIndex_ then
            index = self.moveHeroBtnIndex_
        end
        -- 可以行走的区域才让英雄走过去，并插旗表示要走到的目标
        if self.rt.map_:isWalkable(mx,my) then
            self.heros = self.rt.map_:getHero()
            self.rt:moveSingleHeroTo(self.heros[index],mx,my)
            -- self:setSingleMoveFlag(self.moveHeroIndex_)
            -- if self.heroMove and self.heroMove:isVisible() then 
            --     self.heroMove:setVisible(false)
            -- end
        end
        -- else
            if self.heroMove and self.heroMove:isVisible() then 
                -- 0.3秒后隐藏显示的点击目标图片
                transition.fadeTo(self.heroMove, {
                    opacity = 255,
                    time = 0.3,
                    onComplete = function()
                        self.heroMove:setVisible(false)
                    end
                })
            end
        -- end
        -- 取消这个英雄的选中状态，隐藏显示的点击目标图片
        self:heroSelectCancel()

        -- 取消英雄控制页面的选中状态
        self.heroControlPanel:setSelected(false, index)


        return false
    end

    -- 下面判断在没有选择的情况下，是否有点中塔和英雄
    if self.click then 
        local heroMindist = 9999
        for k, hero in ipairs(self.heros) do 
            local dist = math2d.dist(mx, my,
                hero.x_ + hero.radiusOffsetX_, hero.y_ + hero.radiusOffsetY_)
            if dist < heroMindist and dist <= (hero.radius_ + 5) and not hero.isDead_ then 
                heroMindist = dist
                self.moveHeroIndex_ = k
                -- print("self.moveHeroIndex_ = "..tostring(self.moveHeroIndex_))
                -- if not self.selectHeroImage then 
                    self.selectHeroImage = display.newSprite("ui/fight/heroSelected.png")
                    -- 缩放闪烁的特效
                    local scaleto1 = cc.ScaleTo:create(0.5, 1.1) -- 0.5, 1.5)
                    local scaleto2 = cc.ScaleTo:create(0.5, 0.9) -- 0.5,1.3)
                    local squence = cc.Sequence:create(scaleto1,scaleto2)
                    local repeatForever1 = cc.RepeatForever:create(squence)
                    self.selectHeroImage:runAction(repeatForever1)

                    -- self.selectHeroImage:setScaleX(2)
                    -- self.selectHeroImage:setScaleY(1.5)
                    -- self:addChild(self.selectHeroImage)
                    hero:getView():addChild(self.selectHeroImage, -1)
                    self.selectHeroImage:setPosition(hero.offsetX_ + 
                        hero:getView():getContentSize().width/2, 3) -- hero.offsetY_ - 20)
                -- end
                -- self.selectHeroImage:setVisible(true)
                -- self.selectHeroImage:setPosition(x, y)

                -- 英雄控制界面，要显示选中的标识
                self.heroControlPanel:setSelected(true, k)

                -- 显示英雄的详细信息
                self.objectDetailPanel:show(hero)
                return false
            end 
        end


        local minDist = 99999
        --检查是否选中了某个塔
        local selectedTowerId
        local selectedStandRange
        if (self.rt.towers_~={}) then 
            for id, tower in pairs(self.rt.towers_) do
                local dist = math2d.dist(mx, my, tower[1], tower[2])
                if dist < minDist and dist <= tower[3] then
                    minDist = dist
                    selectedTowerId = id
                    selectedStandRange = tower[4]  --将选中塔的信息转换为选中坑位

                    -- add by Owen, 2016.4.4, 如果塔中了Buff 220907, 那么点击3次以后解Buff
                    local towerObj = selectedStandRange.tower
                    if towerObj.buffs_ and towerObj.buffs_.timeBuff_ 
                        and table.nums(towerObj.buffs_.timeBuff_) > 0 then
                        for i, v in pairs(towerObj.buffs_.timeBuff_) do
                            if v.mainID == "220907" then
                                if not towerObj._bingClickCount then
                                    towerObj._bingClickCount = 0
                                end
                                towerObj._bingClickCount = towerObj._bingClickCount + 1
                                if towerObj._bingClickCount >=
                                    StableGameProperties.BING_LONG_TOWER_CLICK_COUNT then
                                    BuffBase.clearOneTimeBuff(towerObj, v.occupied)
                                end
                                return false
                            end
                            if v.mainID == "220912" then
                                if not towerObj._weatherClickCount then
                                    towerObj._weatherClickCount = 0
                                end
                                towerObj._weatherClickCount = towerObj._weatherClickCount + 1
                                if towerObj._weatherClickCount >=
                                    StableGameProperties.WEATHER_TOWER_CLICK_COUNT then
                                    BuffBase.clearOneTimeBuff(towerObj, v.occupied)
                                end
                                return false
                            end
                        end
                    end

                    -- 显示选中的塔的详细信息
                    self.objectDetailPanel:show(selectedStandRange.tower)
                    break
                end
            end
        end
        -- 检查是否选中了摸个可以造塔的坑位
        --local selectedStandRange

        -- add by Owen, 2016.6.8, 做12关模式3，判定一下是不是需要把所有的塔基上的钥匙置为不可见
        local needHideKey = false

        for id, standRange in pairs(self.rt:getAllStandRange()) do
            local dist = math2d.dist(mx, my, standRange.x_, standRange.y_)
            -- add by Owen, 2016.6.8, 做12关模式3，如果开启了一把钥匙
            if GlobalData.getGameLv() == 12 and GlobalData.getGameMode() == 3 then
                if dist < minDist and dist <= standRange.radius_ then
                    -- 点击了一个显示了钥匙在头顶的塔基位置, 或者一个已经解锁了的位置
                    if (standRange.keyImg and standRange.keyImg:isVisible() )
                        or not standRange.isLock then
                        minDist = dist
                        selectedStandRange = standRange

                        -- 只有点击的这个塔基还是锁住的时候，需要做这个判定
                        if standRange.isLock then
                            -- 判定是不是需要隐藏掉所有的钥匙
                            needHideKey = true
                            -- 更新下一组杀怪的数量
                            self.infoPanel:showNextKeyCount()
                        end

                        -- 这个塔基要解锁
                        standRange:unLock()

                        break
                    end
                end
            else
                -- change by Owen, 2016.5.15, 增加一个塔基是否锁定的判定 standRange.isLock
                if dist < minDist and dist <= standRange.radius_ and not standRange.isLock then
                    minDist = dist
                    selectedStandRange = standRange
                end
            end
        end

        -- 需要把12关模式3，塔基上的钥匙图片都隐藏掉的话
        if needHideKey then
            for id, standRange in pairs(self.rt:getAllStandRange()) do
                standRange:hideKey()
            end
        end

        -- dump(selectedStandRange, "dump selectedStandRange")
        if (selectedStandRange ~= nil) then
            -- add by Owen, 2016.7.14, 第一关第二波显示两个造塔tips，点击塔位后要消失
            if self.magicTipsBox then
                self.magicTipsBox:removeSelf()
                self.magicTipsBox = nil
                self.burstTipsBox:removeSelf()
                self.burstTipsBox = nil
            end

            -- 对选中的坑做操作
            -- print(format("MapRuntime:onTouch 已选中坑 id({1})", selectedStandRange.id_))
            -- name, userData
            self:selectStandRange(selectedStandRange)
            -- NotifyCenter.notify(EventNames.RT_CHOOSED_TOWER_LOCATION, selectedStandRange)
            return false
        end

        -- 检查是否选中了某个兵塔
        if (#self.rt.soldierTowers_ > 0) then
            -- add by Owen, 2o16.4.23, 如果第六关的模式1没有通关，则表示新手引导没有走完，
            -- 则第一关和第二关的祭坛塔都不可点击
            local needFindSoldierTower = true
            local lvStar = GlobalData.getLvStar(6)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                local gameLv = GlobalData.getGameLv()
                local mode   = GlobalData.getGameMode()
                if gameLv == 1 or gameLv == 2 and mode == 1 then
                    needFindSoldierTower = false
                end
            end
            if needFindSoldierTower then
                for i, tower in ipairs(self.rt.soldierTowers_) do
                    local dist = math2d.dist(mx, my, 
                        tower.x_ + tower.radiusOffsetX_,
                        tower.y_ + tower.radiusOffsetY_)
                    if dist < minDist and dist <= tower.radius_ + 20 then
                        minDist = dist
                        self.selectedSoldierTower = tower
                        self:selectSoldierTower(tower)

                        -- add by Owen, 2016.7.18点击了祭坛塔以后，要把显示的“召唤援兵”tips给移除掉
                        if self._showSummonTips then
                            self._showSummonTips:removeSelf()
                            self._showSummonTips = nil
                        end

                        return false
                    end
                end
            end
        end

        for i = #self.rt.canTouchRanges, 1, -1 do
            local v = self.rt.canTouchRanges[i]
            local dist = math2d.dist(mx, my, v.x_, v.y_)
            if dist < minDist and dist <= v.radius_ then
                -- 选中了任务区域
                if v.rangeType_ == MapConstants.TASK_RANGE and v._canTouch then
                    -- print("点击了任务区域，需要弹出确认页面，是否让英雄去做任务")
                    self.rt:heroDoTask(v)
                    table.remove(self.rt.canTouchRanges, i)
                    return false
                end
                -- 选中了机关技能区域
                if v.rangeType_ == MapConstants.SKILL_RANGE and v._canTouch then
                    -- print("点击了机关区域，需要弹出技能选择页面")
                    -- self.rt:releaseRangeSkill(v)
                    self:onClickSkillRanges(v)
                    return false
                end
            end
        end

        -- add by Owen, 2016.3.21, 判定是否点击了打野元素的区域
        for i, v in pairs(self.rt.map_.dayeItems_) do
            local dist = math2d.dist(mx, my, v.x_, v.y_)
            if dist < minDist and dist <= v.radius_ then
                -- 选中了打野区域
                -- print("点击了打野区域")
                if v.rangeType_ ~= MapConstants.DAYE_TYPE_ONE
                    and v._dayeCurState == MapConstants.DAYE_STATE_CAN_CLICK
                    and v.mainID_ ~= "7" then

                    v:onClick()
                    return false
                end
            end

            -- 处理雪球点击
            if v.mainID_ == "7" and v._dayeCurState == MapConstants.DAYE_STATE_CAN_CLICK then
                v:onClickXueQiu(mx, my)
            end
        end

        -- 判定是否点中了小怪和Boss，用来显示怪物的信息
        for k, monster in pairs(self.rt.map_.simpleMonsters) do 
            local dist = math2d.dist(mx, my, monster.x_ + monster.radiusOffsetX_, 
                monster.y_ + monster.radiusOffsetY_)
            if dist <= 15 and not monster.destroyed_ then 
                self.objectDetailPanel:show(monster)
                return false
            end
        end
        for k, boss in pairs(self.rt.map_.bossMonsters) do
            local dist = math2d.dist(mx, my, boss.x_ + boss.radiusOffsetX_, 
                boss.y_ + boss.radiusOffsetY_)
            if dist <= 25 and not boss.destroyed_ then 
                self.objectDetailPanel:show(boss)
                return false
            end
        end

        -- 前面选中了物体的话，都会return，所以走到这一步的话就是什么都没有选中
        -- 需要取消显示的物体详情界面
        if self.objectDetailPanel:isVisible() then
            -- print("BattleUI 取消显示的物体详情界面")
            self.objectDetailPanel:hide()
        end

        -- self.rt:onUp(event, x, y, self.click)
    else --not click
        self:heroSelectCancel()

    end
end

-- 点击了机关区域，需要弹出技能选择页面
function BattleUI:onClickSkillRanges( skillRange )
    self.skillRangePanel:show(skillRange)
end
-- 设置关卡配置数据,更新显示的血量、金币等数据
function BattleUI:setMapConfig(config)
    -- print(" tostring(self.mapConfig.maxHp = "..tostring(config.maxHp))
    self.infoPanel.hpLabel:setString(tostring(config.maxHp))
    self.infoPanel.goldCountLabel:setString(tostring(config.goldCount))
    self.infoPanel.weatherLabel:setString(tostring(config.weather))
end

function BattleUI:updateHp()
    self.infoPanel.hpLabel:setString(tostring(BattleDataManager:getHp()))
    -- add by Owen, 2016.5.30, 用来做第3关的模式3，更新血量进度条和血条提示的位置
    self.infoPanel:updateLvThreeHp()
end

function BattleUI:updateGold()
    self.infoPanel.goldCountLabel:setString(tostring(BattleDataManager:getGoldCount()))
end

function BattleUI:updateWeather()
    self.infoPanel:changeWeather()
    self.infoPanel.weatherLabel:setString(tostring(BattleDataManager:getWeather()))

    

    -- add by Owen, 2016.5.13, 播放粒子特效的代码，p1:setEmissionRate(200)可以控制粒子数量，不需要
    local weatherIndex = BattleDataManager:getWeather()
    -- print("BattleUI:updateWeather() weatherIndex = "..tostring(weatherIndex))

    local weatherName = ""    -- 记录天气的名字，在弹出技能提示的时候用到

    local name = ""
    if weatherIndex == 0 then
        name = "sun"
        weatherName = WordLanguage.SunName
    elseif weatherIndex == 1 then
        name = "night"
        weatherName = WordLanguage.NightName
    elseif weatherIndex == 2 then
        name = "yu"
        weatherName = WordLanguage.RainName
    elseif weatherIndex == 3 then
        name = "xue"
        weatherName = WordLanguage.SnowName
    elseif weatherIndex == 4 then
        name = "wind"
        weatherName = WordLanguage.WindName
    end

    -- add by Owen, 2016.6.20, 如果英雄的技能受天气的影响，则需要弹一个tips来提示
    if self.rt then
        print("BattleUI:updateWeather() 提示受天气影响的英雄技能")
        -- 中文才需要显示这个tips
        if GlobalData.getLanguage() == "CN" then
            local heros = self.rt.map_:getHero()
            -- dump(heros, "test by Owen, dump heros")
            
            -- 记录需要提示的 "英雄的某个技能受天气影响增强" 的文字内容
            local tipsString   = {}
            -- 需要弹tips的手动技能配置
            local manualSkillConfigs = {}
            -- 需要弹tips的自动技能配置
            local autoSkillConfigs = {}
            for i, hero in ipairs(heros) do

                for i2, v2 in ipairs(hero.manualSkill_) do
                    config = ManualSkillProperties.get(v2)
                    if config.weatherValue and config.weatherValue[weatherIndex + 1] ~= 10000 then
                        manualSkillConfigs[#manualSkillConfigs + 1] = config
                    end
                end
                for i2, v2 in ipairs(hero.automaticSkill_) do
                    config = AutoSkillProperties.get(v2)
                    if config.weatherValue and config.weatherValue[weatherIndex + 1] ~= 10000 then
                        autoSkillConfigs[#autoSkillConfigs + 1] = config
                    end
                end
            end

            -- 所有需要弹tips的技能配置
            local skillConfigs = {}
            for i,v in ipairs(manualSkillConfigs) do
                skillConfigs[#skillConfigs + 1] = v
            end
            for i,v in ipairs(autoSkillConfigs) do
                skillConfigs[#skillConfigs + 1] = v
            end

            -- 有技能受天气影响的时候，才需要弹这个tips
            if #skillConfigs > 0 then
                self:showSkillTips(skillConfigs, weatherName)
            end
            -- -- 弹tips
            -- for i4, tipsStr in ipairs(tipsString) do
            --     print("天气影响英雄技能，弹了一个tips i3 = "..tostring(i3))
            --     utils.createAniFont(tipsStr, self, GLOBAL_FIGHT_UI_SCALE,nil, nil, 
            --         cc.p(display.cx, display.cy - (i4-1)*(278*0.2) ))
            -- end
        end
    end



    if weatherIndex == 2 or weatherIndex == 3 then
        if self.particle then
            self.particle:removeSelf()
            self.particle = nil
        end

        if self.sunEff then
            -- 增加一个渐隐的效果
            local function func1()
                self.sunEff:removeSelf()
                self.sunEff = nil
            end
            local act1 = cc.FadeOut:create(1.0)
            local act2 = cc.CallFunc:create(func1)
            local seq  = cc.Sequence:create(act1,act2)
            self.sunEff:runAction(seq)
        end
        if self.nightEff then
            -- 增加一个渐隐的效果
            self.nightEff:stopAllActions()
            local function func1()
                self.nightEff:removeSelf()
                self.nightEff = nil
            end
            local act1 = cc.FadeOut:create(2.0)
            local act2 = cc.CallFunc:create(func1)
            local seq  = cc.Sequence:create(act1,act2)
            self.nightEff:runAction(seq)
        end

        local p1 = cc.ParticleSystemQuad:create("particle/"..name..".plist")
        p1:setAutoRemoveOnFinish(true)
        p1:setBlendAdditive(false) 
        p1:setPosition(display.cx,display.height+30)
        self:addChild(p1,10)

        self.particle = p1

        -- 在地图放大了的屏幕上，战斗UI需要放大显示
        if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            p1:setScale(GLOBAL_FIGHT_UI_SCALE)
        end
    else
        if self.particle then
            self.particle:removeSelf()
            self.particle = nil
        end
        if weatherIndex == 0 then

            if self.sunEff then
                self.sunEff:removeSelf()
                self.sunEff = nil
            end

            if self.nightEff then
                -- 增加一个渐隐的效果
                self.nightEff:stopAllActions()
                local function func1()
                    self.nightEff:removeSelf()
                    self.nightEff = nil
                end
                local act1 = cc.FadeOut:create(2.0)
                local act2 = cc.CallFunc:create(func1)
                local seq  = cc.Sequence:create(act1,act2)
                self.nightEff:runAction(seq)
            end

            -- print("显示晴天的特效")
            -- 显示晴天的特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_sunny", true)
            self:addChild(effect, -1)
            effect:setScale(2)
            effect:setPosition(display.cx - 300, display.height/2)

            -- 增加一个渐现的效果
            -- effect:setOpacity(80)
            -- local act1 = cc.FadeIn:create(0.8)
            -- effect:runAction(act1)
            self.sunEff = effect

            -- 晴天效果要根据战斗UI缩放
            if GLOBAL_FIGHT_UI_SCALE ~= 1 then
                self.sunEff:setScale(GLOBAL_FIGHT_UI_SCALE*2)
            end
        elseif weatherIndex == 1 then
            if self.nightEff then
                self.nightEff:removeSelf()
                self.nightEff = nil
            end
            -- print("显示夜晚的特效")
            if self.sunEff then
                -- 增加一个渐隐的效果
                local function func1()
                    self.sunEff:removeSelf()
                    self.sunEff = nil
                end
                local act1 = cc.FadeOut:create(1.0)
                local act2 = cc.CallFunc:create(func1)
                local seq  = cc.Sequence:create(act1,act2)
                self.sunEff:runAction(seq)
            end

            -- 显示夜晚的特效
            local nightMask = display.newSprite("ui/weather/nightMask.png")
            self:addChild(nightMask, -1)
            nightMask:setPosition(display.cx, display.cy)


            nightMask:setOpacity(50)
            -- local act1 = cc.FadeIn:create(2.0)
            local act1 = cc.FadeTo:create(3.0, 225);
            local act2 = cc.FadeTo:create(3.0, 120);
            local seq  = cc.Sequence:create(act1,act2)
            local rep  = cc.RepeatForever:create(seq)

            nightMask:runAction(rep)
            --白天不懂夜的黑
            if GLOBAL_FIGHT_UI_SCALE ~= 1 then
                nightMask:setScale(GLOBAL_FIGHT_UI_SCALE)
            end

            -- local function func1()
            --     if func then
            --         self.seq = nil
            --         img.seq = nil
            --         func()
            --     end
            -- end
            -- local act1 = cc.FadeIn:create(1.0)
            -- local act2 = cc.CallFunc:create(func1)
            -- local seq  = cc.Sequence:create(act1,act2)

            self.nightEff = nightMask
            -- 夜晚效果要根据战斗UI缩放
            if GLOBAL_FIGHT_UI_SCALE ~= 1 then
                self.nightEff:setScale(GLOBAL_FIGHT_UI_SCALE)
            end
        elseif weatherIndex == 4 then
            if self.sunEff then
                -- 增加一个渐隐的效果
                local function func1()
                    self.sunEff:removeSelf()
                    self.sunEff = nil
                end
                local act1 = cc.FadeOut:create(1.0)
                local act2 = cc.CallFunc:create(func1)
                local seq  = cc.Sequence:create(act1,act2)
                self.sunEff:runAction(seq)
            end
            if self.nightEff then
                -- 增加一个渐隐的效果
                self.nightEff:stopAllActions()
                local function func1()
                    self.nightEff:removeSelf()
                    self.nightEff = nil
                end
                local act1 = cc.FadeOut:create(2.0)
                local act2 = cc.CallFunc:create(func1)
                local seq  = cc.Sequence:create(act1,act2)
                self.nightEff:runAction(seq)
            end

            -- -- 显示风天特效, 放到 infoPanel 中去处理
            -- local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_windy", false)
            -- self:addChild(effect, -1)
            -- effect:setScale(1)
            -- effect:setPosition(display.cx, display.height/2)

            -- self.particle = effect
        end
    end


end

-- add by Owen, 2016.6.20, 弹一个技能受天气影响的提示框
function BattleUI:showSkillTips(skillConfigs, weatherName)
    local bg = display.newSprite("ui/fight/objectDetail/objectDetailBg.png")
        :addTo(self)
        :pos(display.cx, display.cy)
        :setScale(GLOBAL_FIGHT_UI_SCALE)

    local tipsStr
    if GlobalData.getLanguage() == "CN" then
        tipsStr = "受  "..weatherName.." 影响, 效果增强"
    end

    local posX   = 636/2 + 30    -- 第一个技能图标的X轴位置
    local posY   = 40    -- 第一个技能图标的Y轴位置
    local posY2  = 5     -- 技能提示文字的Y轴位置
    local diffX  = 55    -- 两个技能图标之间的间隔
    local diffX2 = -75    -- tips中显示的文字和最后一个icon的距离
    local iconCount = 0    -- 总共需要显示几个Icon  
    if #skillConfigs >= 3 then
        posX  = posX + 60
        diffX = 55
        iconCount = 3
    elseif #skillConfigs == 2 then
        posX  = posX + 100
        diffX = 55
        iconCount = 2
    elseif #skillConfigs == 1 then
        posX  = posX + 140
        diffX = 55
        iconCount = 1
    end


    -- 显示3个技能图标
    local skillIcon
    local skillConfig
    for i = 1, iconCount do
        skillConfig = skillConfigs[i]
        -- local iconName = "ui/Icons/heroSkillIcon/"..skillConfig.icon..".png"
        print("iconName = "..tostring(iconName))
        skillIcon = display.newSprite("ui/Icons/heroSkillIcon/"..skillConfig.icon..".png")
            :addTo(bg)
            :setScale(0.5)
            :pos(posX + (i-1) * diffX - 636/2, posY)
    end


    -- local tipsLabel = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         text = tipsStr,
    --         align = cc.ui.TEXT_ALIGN_RIGHT,
    --         font = GLOBAL_FONTNAME,
    --         size = 24,
    --         x = posX + (iconCount-1) * diffX + diffX2,
    --         y = posY,
    --     }):align(display.CENTER_RIGHT)
    --     :addTo(bg)
    --     tipsLabel:enableOutline(cc.c4b(0, 0,0,255), 2)


    self.weatherTipsLabel = ccui.RichText:create()
    self.weatherTipsLabel:ignoreContentAdaptWithSize(false)
    local richTxtSize = cc.size(400, 33)
    self.weatherTipsLabel:setContentSize(richTxtSize)
    self.weatherTipsLabel:setAnchorPoint(cc.p(0.5, 0))
    self.weatherTipsLabel:setPosition(cc.p(posX + (iconCount-1) * diffX + diffX2, posY2))
    bg:addChild(self.weatherTipsLabel,1)

    -- 给文字增加描边
    self.weatherTipsLabel:setOutLine(cc.c4b(0,0,0,255),2)


    local re1 = ccui.RichElementText:create(1, cc.c3b(255, 255, 255), 255, "受 ",GLOBAL_FONTNAME, 24)
    local re2 = ccui.RichElementText:create(2, cc.c3b(188, 231, 53), 255,weatherName,GLOBAL_FONTNAME, 24)
    local re3 = ccui.RichElementText:create(2, cc.c3b(255, 255, 255), 255," 影响, 效果增强",GLOBAL_FONTNAME, 24)
    self.weatherTipsLabel:pushBackElement(re1)
    self.weatherTipsLabel:pushBackElement(re2)
    self.weatherTipsLabel:pushBackElement(re3)


    local move = cc.MoveBy:create(2,cc.p(0,50))
    local function later()
        if bg then
           bg:removeFromParent()
        end
    end
    local action = cc.Sequence:create(move,cc.CallFunc:create(later))
    bg:runAction(action)
end

function BattleUI:updateCurRound()
    self.infoPanel.curRoundLabel:setString(tostring(BattleDataManager:getCurRound()))

    -- print("yaoxiaoyang test updateCurRound")
end


function BattleUI:onExit()
    -- 去掉监听事件
    -- local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    -- eventDispatcher:removeEventListener(self.customListenerBg)
end

-- 隐藏全部界面
function BattleUI:hide()
    self:setVisible(false)
end

-- 显示全部界面
function BattleUI:show()
    if self.rt.type ~= MapConstants.MAP_TYPE_PVP then
        self:setVisible(true)
    end
end

function BattleUI:checkWhenSelectSkill()
    if self.rt.hasSelectedASkill then 
        self:heroSelectCancel()
        self:heroAssembleCancel()
        self:checkandHidePanels()
    end
end
-- 每帧都会调进来
function BattleUI:tick(dt)
	-- self.heroControlPanel:tick(dt)

    if self.rt then
        self.towerSelectPanel:tick(dt)
        self.towerControlPanel:tick(dt)
        self.towerSkillPanel:tick(dt)
        self.heroSkillBtnPanel:tick(dt)
        self.RoundStartBtnPanel:tick(dt)
        self.skillRangePanel:tick(dt)
        self.heroControlPanel:tick(dt)
        self:checkWhenSelectSkill()
        self.soldierTowerPanel:tick(dt)
        self.rmbSkillBtnPanel:tick(dt)
        self.objectDetailPanel:tick(dt)
        -- if self.moveHeroIndex_ then 
        --     self.selectHeroImage:setPosition(self.heros[self.moveHeroIndex_].x_,self.heros[self.moveHeroIndex_].y_)
        -- end
        self:checkHeroMoveFlags()

        if self.flyBtnPanel then
            self.flyBtnPanel:tick(dt)
        end
        if self.bossTimeLayer then -- and self.bossTimeLayer:isVisible() then
            self.bossTimeLayer:tick(dt)
        end

        -- add by Owen, 2016.5.13, 如果是第8关模式3，那么每隔一段时间需要修改天气
        if self.infoPanel then
            self.infoPanel:tick(dt)
        end

        -- add by Owen, 2016.7.18, 第5关第2波开始5秒后，在祭坛塔上面显示一个“召唤援兵”的tips
        if not self.rt.paused_ and self._needShowSummonTip then
            self._needShowSummonTipTime = self._needShowSummonTipTime + dt
            if self._needShowSummonTipTime >= 5 then
                -- 显示“召唤援兵”的提示框
                local tipsBox = TipsBoxPanel.new(self, 6)
                self.rt.map_.batch_:addChild(tipsBox)
                tipsBox:setPosition(645, 540)
                -- 记录显示的 “召唤援兵”的提示框
                self._showSummonTips = tipsBox

                self._needShowSummonTip = false
            end
        end
    end
end

-- 插三个小旗子
function BattleUI:setMoveFlags()
    --self.heros = self.rt.map_:getHero()
    for k, hero in pairs(self.heros) do
        self:setSingleMoveFlag(k)
    end
end

-- 插单个小旗子
function  BattleUI:setSingleMoveFlag(k)
    -- body        if hero.nextX_ and (not (hero.x_ == hero.nextX_) or not (hero.y_ == hero.nextY_)) and not hero.isDead_ then 
    if not self.heroMoveflags then 
        self.heroMoveflags = {}
    end
    if not self.heroMoveflags[k] then 
        self.heroMoveflags[k] = display.newSprite("ui/fight/heroMove.png")
        self:addChild(self.heroMoveflags[k])
        self.heroMoveflags[k]:setScale(0.5)
    end

    self.heroMoveflags[k]:setVisible(true)
    -- print("yaoxiaoyang next x ="..tostring(self.heros[k].nextX_,self.heros[k].nextY_))
    self.heroMoveflags[k]:setPosition(self.heros[k].nextX_,self.heros[k].nextY_)
end
function BattleUI:checkHeroMoveFlags()
    for k, hero in pairs(self.heros) do
        if not hero.nextX_ or (hero.x_ == hero.nextX_ and hero.y_ == hero.nextY_) or hero.isDead_ then 
            if self.heroMoveflags and self.heroMoveflags[k] and self.heroMoveflags[k]:isVisible() then
                self.heroMoveflags[k]:setVisible(false)
            end
        end
    end
end

-- 创建子对象
function BattleUI:createChildren()
    self.infoPanel = InfoPanel.new(self)
    -- print("BattleUI:createChildren GLOBAL_FIGHT_UI_SCALE = "..GLOBAL_FIGHT_UI_SCALE)
    if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        self.infoPanel:setPosition(145*0.8*GLOBAL_FIGHT_UI_SCALE, display.height-52*0.8*GLOBAL_FIGHT_UI_SCALE)
    else
        if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            self.infoPanel:setPosition(145*GLOBAL_FIGHT_UI_SCALE, display.height-52*GLOBAL_FIGHT_UI_SCALE)
        elseif GLOBAL_HALL_UI_SCALE2 then
            self.infoPanel:setPosition(145*GLOBAL_HALL_UI_SCALE2, display.height-52*GLOBAL_HALL_UI_SCALE2)
        end
    end
    -- 创建了info页面以后，调用这个函数，来显示天气的粒子效果
    self:updateWeather()


    self:addChild(self.infoPanel)
    -- 暂停按钮
    self.pauseBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause.png",
        pressed = "ui/fight/pause_pressed.png",
        disabled = "ui/fight/pause.png"})
        :onButtonClicked(function(...)
            -- print("游戏中点击暂停按钮")
            AudioMgr.playSound("Function")
            AudioEngine.pauseMusic()
            self.rt:pausePlay()
            viewMgr.show(viewMgr.def.SETTING_UI,1,self.rt)
        end)
        :addTo(self)
        -- :scale(GLOBAL_FIGHT_UI_SCALE)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self.pauseBtn:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self.pauseBtn:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    --  add by Owen, 2016.5.25, windows平台的话，需要增加esc快捷键
    -- if (device.platform == "mac" or device.platform == "windows") then
        self:setKeypadEnabled(true)
        self:addNodeEventListener(cc.KEYPAD_EVENT, function (event)
            -- dump(event, "dump keypad event")
            -- print("keypad event.code = "..tostring(event.code)
            --     .." tonumber event.code = "..tostring(tonumber(event.code)))
            -- print("cc.KeyCode.KEY_ESCAPE = "..tostring(cc.KeyCode.KEY_ESCAPE))
            local key = tonumber(event.code)
            local params = {}
            if key == tonumber(cc.KeyCode.KEY_ESCAPE) then
                -- print("游戏中点击暂停按钮")
                -- AudioMgr.playSound("Function")
                -- AudioEngine.pauseMusic()
                -- self.rt:pausePlay()
                -- viewMgr.show(viewMgr.def.SETTING_UI,1,self.rt)
                local setUI = viewMgr.find(viewMgr.def.SETTING_UI)
                if setUI then
                    viewMgr.hide(viewMgr.def.SETTING_UI)
                    AudioEngine.resumeMusic()
                    self.rt:resumePlay()
                else
                    AudioMgr.playSound("Function")
                    AudioEngine.pauseMusic()
                    self.rt:pausePlay()
                    viewMgr.show(viewMgr.def.SETTING_UI,1,self.rt)
                end
            end
        end)
    -- end

    -- windows平台上面，战斗UI要缩放0.8
    if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
        self.pauseBtn:setScale(0.6)
        self.pauseBtn:setPosition(display.width - 60*0.6*GLOBAL_FIGHT_UI_SCALE, display.height - 41*0.6*GLOBAL_FIGHT_UI_SCALE)
    else
        if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            self.pauseBtn:setPosition(display.width - 60*GLOBAL_FIGHT_UI_SCALE, display.height - 41*GLOBAL_FIGHT_UI_SCALE)
        elseif GLOBAL_HALL_UI_SCALE2 then
            self.pauseBtn:setPosition(display.width - 60*GLOBAL_HALL_UI_SCALE2, display.height - 41*GLOBAL_HALL_UI_SCALE2)
        end
    end


    local diamondBtn = cc.ui.UIPushButton.new({normal = "ui/fight/moreInfo.png",
        pressed = "ui/fight/moreInfo.png",
        disabled = "ui/fight/moreInfo.png"})
        :onButtonClicked(function(...)
            -- -- print("游戏中点击购买钻石按钮")
            self.rt:pausePlay()
            -- local pausePanel = PausePanel.new(self.rt)
            -- self:addChild(pausePanel)
            local function func( ... )
                self.rt:resumePlay()
            end
            viewMgr.show(viewMgr.def.STORE_UI,func)
        end)
        :addTo(self)
        -- :pos(display.width - 265*GLOBAL_FIGHT_UI_SCALE, display.height - 45*GLOBAL_FIGHT_UI_SCALE)
        -- :pos(display.width - 205*GLOBAL_FIGHT_UI_SCALE, display.height - 35*GLOBAL_FIGHT_UI_SCALE)
        -- :setScale(GLOBAL_FIGHT_UI_SCALE)

    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        diamondBtn:setScale(GLOBAL_FIGHT_UI_SCALE)
        diamondBtn:setPosition(display.width - 205*GLOBAL_FIGHT_UI_SCALE, display.height - 35*GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        diamondBtn:setScale(GLOBAL_HALL_UI_SCALE2)
        diamondBtn:setPosition(display.width - 205*GLOBAL_HALL_UI_SCALE2, display.height - 35*GLOBAL_HALL_UI_SCALE2)
    end

    -- 钻石数量文本
    self.diamondCountLabel= cc.ui.UILabel.new({
        UILabelType = 2,
        font = GLOBAL_FONTNAME,
        text = GlobalData.getDiamondCount(),
        size = 28,
    })
    :addTo(diamondBtn)
    -- self.lvlabel1:diamondCountLabel(cc.c4b(0, 0,0,255), 1)
        -- 购买钻石按钮, mac和windows平台上面不显示这个页面
    if GLOBAL_SHOW_WIN_TYPE 
        and (device.platform == "mac" or device.platform == "windows") then
        diamondBtn:setVisible(false)
    end
    self.diamondBtn = diamondBtn

    -- -- 钻石图片
    -- local diamondImg = display.newSprite("ui/fight/diamond.png")
    -- diamondBtn:addChild(diamondImg)
    -- diamondImg:setPosition(-80, 0)


    -- 新怪物按钮
    local newEnemyBtn = cc.ui.UIPushButton.new({normal = "ui/fight/newEnemy.png",
        pressed = "ui/fight/newEnemy.png",
        disabled = "ui/fight/newEnemy.png"})
        :onButtonClicked(function(...)
            -- -- print("游戏中点击暂停按钮")
            -- self.rt:pausePlay()
            -- local pausePanel = PausePanel.new(self.rt)
            -- self:addChild(pausePanel)
        end)
        :pos(110*GLOBAL_FIGHT_UI_SCALE, display.height - 320*GLOBAL_FIGHT_UI_SCALE)
        :addTo(self)
        :scale(GLOBAL_FIGHT_UI_SCALE)
    -- 感叹号
    local exclamationImg = display.newSprite("ui/fight/exclamation.png")
    newEnemyBtn:addChild(exclamationImg)
    exclamationImg:setPosition(40, 0)
    newEnemyBtn:setVisible(false)


    -- 左上角，英雄控制按钮
	self.heroControlPanel = HeroControlPanel.new(self)
	self:addChild(self.heroControlPanel)
    self.heroControlPanel:setPosition(20*GLOBAL_FIGHT_UI_SCALE, display.cy)
    -- self.heroControlPanel:setVisible(false)

    -- 选中一个英雄、怪物、塔以后，显示的物体详细信息页面
    -- 为了确保位置刚好在左下角技能框的右边，定位 X = 60 + 444
    self.objectDetailPanel = ObjectDetailPanel.new()
    self:addChild(self.objectDetailPanel)
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self.objectDetailPanel:setPosition((360 + 444 + 35)*GLOBAL_FIGHT_UI_SCALE, 
            -83 * GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self.objectDetailPanel:setPosition((450 + 444 + 35)*GLOBAL_HALL_UI_SCALE2, 
            -83 * GLOBAL_HALL_UI_SCALE2)
    end

    -- 左下角英雄技能
    self.heroSkillBtnPanel = HeroSkillBtnPanel.new(self)
    self:addChild(self.heroSkillBtnPanel)
    self.heroSkillBtnPanel:setPosition(160*GLOBAL_FIGHT_UI_SCALE, 0)

    -- 右下角RMB技能
    self.rmbSkillBtnPanel = RMBSkillBtnPanel.new(self)
    self:addChild(self.rmbSkillBtnPanel)
    if (device.platform == "mac" or device.platform == "windows") then
        self.rmbSkillBtnPanel:setPosition(display.width + 10*GLOBAL_FIGHT_UI_SCALE*0.8, display.cy)
    else
        self.rmbSkillBtnPanel:setPosition(display.width + 10*GLOBAL_FIGHT_UI_SCALE, display.cy)
    end



    -- mac和windows平台上面不显示这个页面
    if GLOBAL_SHOW_WIN_TYPE 
        and (device.platform == "mac" or device.platform == "windows") then
        self.rmbSkillBtnPanel:setVisible(false)
    end

    -- tips按钮页面，用来显示一排tips按钮
    self.tipsBtnPanel = TipsBtnPanel.new(self)
    self:addChild(self.tipsBtnPanel)
    -- mac和windows平台上, 这个页面需要缩放0.8
    if GLOBAL_SHOW_WIN_TYPE 
        and (device.platform == "mac" or device.platform == "windows") then
        self.tipsBtnPanel:setPosition(300*GLOBAL_FIGHT_UI_SCALE, display.height - 60*GLOBAL_FIGHT_UI_SCALE*0.8)
        self.tipsBtnPanel:setScale(0.8)
    else
        if GLOBAL_FIGHT_UI_SCALE ~= 1 then
            self.tipsBtnPanel:setPosition(300*GLOBAL_FIGHT_UI_SCALE, display.height - 60*GLOBAL_FIGHT_UI_SCALE)
        elseif GLOBAL_HALL_UI_SCALE2 then
            self.tipsBtnPanel:setPosition(300*GLOBAL_HALL_UI_SCALE2, display.height - 60*GLOBAL_HALL_UI_SCALE2)
        end
    end


    -- 点坑后出现：选塔界面
    self.towerSelectPanel = TowerSelectPanel.new(self)
    self:addChild(self.towerSelectPanel)

    -- 点坑后出现：操作界面
    self.towerControlPanel = TowerControlPanel.new()
    self:addChild(self.towerControlPanel)

    -- 点击兵塔以后，显示的出兵和掠夺按钮
    self.soldierTowerPanel = SoldierTowerPanel.new()
    self:addChild(self.soldierTowerPanel)

    -- 如果塔升到顶级了，显示塔天赋升级页面
    self.towerSkillPanel   = TowerSkillPanel.new()
    self:addChild(self.towerSkillPanel)

    self.RoundStartBtnPanel = RoundStartBtnPanel.new()
    self:addChild(self.RoundStartBtnPanel)

    self.skillRangePanel = SkillRangePanel.new()
    self:addChild(self.skillRangePanel)


    -- self.infoPanel:setVisible(false)
    -- self.heroControlPanel:setVisible(false)
    -- self.heroSkillBtnPanel:setVisible(false)
    -- self.pauseBtn:setVisible(false)

end


function BattleUI:createHeroControlPanel()
    -- self.heroControlPanel = display.newNode()
    -- self.heroBtns = {}

    -- self.assembleHeroBtn = cc.ui.UIPushButton.new("ui/fight/assemble.png")
    --     :onButtonClicked(function(...)
    --         self:assembleHeroSelected(...)
    --     end)
    --     :pos(0, 0)
    --     :addTo(self.heroControlPanel)
    -- self:addChild(self.heroControlPanel)
    -- self.heroControlPanel:setPosition(150,display.height-300)
    -- -- 选中图片
    -- self.heroSelectedImg = display.newSprite("ui/fight/assemble2.png")
    -- self.assembleHeroBtn:addChild(self.heroSelectedImg)
    -- self.heroSelectedImg:setVisible(false)


end

-- function BattleUI:changeHeroSelected(prama)
--     self.moveHeroIndex_ = prama.target.index
--     for k, v in pairs(self.heroBtns)do
--         v.selectedSprite:setVisible(false)
--     end
--     self.moveHero_ = false
--     prama.target.selectedSprite:setVisible(true)

-- end

-- 所有英雄一起移动, index表示的是选中了第几个英雄
function BattleUI:assembleHeroSelected(index)

    -- 点击了英雄按钮，要把技能的选中给去掉
    self:skillSelectCancel()

    
    if self.moveHeroIndex_ == index then
        -- 按钮选中和手点选中的是同一个英雄，不做任何处理
    else
        -- 按钮或者手点选中的了一个英雄，移除选中图片
        if self.moveHeroIndex_ or self.moveHeroBtnIndex_ then
            self.selectHeroImage:removeFromParent()
        end

        -- 手点选中的了一个英雄，取消记录的选中的英雄
        if self.moveHeroIndex_ then
            self.moveHeroIndex_ = nil
        end
        

        -- 英雄身上显示一个选中的圈
        if not self.heros[index].isDead_ then
            -- 新建一个变量，用来记录是通过左下角的英雄头像来控制英雄的
            self.moveHeroBtnIndex_ = index

            local hero = self.heros[index]
            self.selectHeroImage = display.newSprite("ui/fight/heroSelected.png")
            -- 缩放闪烁的特效
            local scaleto1 = cc.ScaleTo:create(0.5, 1.1) -- 0.5, 1.5)
            local scaleto2 = cc.ScaleTo:create(0.5, 0.9) -- 0.5,1.3)
            local squence = cc.Sequence:create(scaleto1,scaleto2)
            local repeatForever1 = cc.RepeatForever:create(squence)
            self.selectHeroImage:runAction(repeatForever1)

            -- self.selectHeroImage:setScaleX(2)
            -- self.selectHeroImage:setScaleY(1.5)
            -- self:addChild(self.selectHeroImage)
            hero:getView():addChild(self.selectHeroImage, -1)
            self.selectHeroImage:setPosition(hero.offsetX_ + 
            hero:getView():getContentSize().width/2, 3) -- hero.offsetY_ - 20)
        end
    end




    -- 下面是老的，选中3个英雄一起移动的
    -- if not self.moveHero_ then 
    --     self.moveHero_ = true
    -- else
    --     self.moveHero_ = false 
    -- end
    -- self:skillSelectCancel()
    -- self:heroSelectCancel()
    -- self:checkandHidePanels()
end

-- 取消英雄全选
function BattleUI:heroAssembleCancel(isRestart)

    if not isRestart and self.moveHeroBtnIndex_ then
        -- 重新开始这一关的时候，先把英雄给删除掉了，选中图片是挂在英雄图片上的
        -- 所以英雄选中图片不能删除
        self.selectHeroImage:removeFromParent()
    end

    -- 新建一个变量，用来记录是通过左下角的英雄头像来控制英雄的
    self.moveHeroBtnIndex_ = nil

    -- 取消 HeroControlPanel里面的选中
    self.heroControlPanel:cancelSeletAll()

    -- 下面是老的，取消选中3个英雄一起移动的
    -- if self.moveHero_ then 
    --     self.moveHero_ = false 
    --     self.heroControlPanel:setSelected(false)
    -- end
end

function BattleUI:skillSelectCancel()
    self.heroSkillBtnPanel:selectCancel()
end

-- 英雄死亡了，看一下是不是选中的单个英雄死亡了，是的话，需要取消选中状态
function BattleUI:heroDestroyed(heroId)
    if self.moveHeroIndex_ then 
        -- print("BattleUI:heroDestroyed heroId = "..tostring(heroId)
        --     .." self.moveHeroIndex_ = "..tostring(self.moveHeroIndex_))
        if self.heros[self.moveHeroIndex_].mainID_ == heroId then
            self:heroSelectCancel()
        end
    end
    if self.moveHeroBtnIndex_ then
        self:heroAssembleCancel()
    end
end

-- 取消选中的单个英雄
function BattleUI:heroSelectCancel(isRestart)
    if self.moveHeroIndex_ then 
        -- self.selectHeroImage:setVisible(false)
        -- 取消英雄控制页面的选中状态
        self.heroControlPanel:setSelected(false, index)
        
        if not isRestart then
            -- 重新开始这一关的时候，先把英雄给删除掉了，选中图片是挂在英雄图片上的
            -- 所以英雄选中图片不能删除
            self.selectHeroImage:removeFromParent()
        end
        self.moveHeroIndex_ = nil
    end
    if self.moveHeroBtnIndex_ then
        self:heroAssembleCancel(isRestart)
    end
end

function BattleUI:removeFromParent()
    -- print("BattleUI:removeFromParent()")
    -- print(format("BattleUI:removeFromParent self._bossFightView is null({1})", self._bossFightView == null))
    if self._bossFightView then
        self._bossFightView:removeView()
        self._bossFightView = nil
    end

    -- 继承链没有任何对象重写该方法，直接调用 CCNode 的该方法
    cc.Node.removeFromParent(self)
    -- self:removeSelf()
end

-- 选中了塔基的区域
function BattleUI:selectStandRange(sr)
    if (not sr.tower) then
        if self.towerSelectPanel:isVisible() then 
            self.towerSelectPanel:hide()
        end
        self.towerSelectPanel:show(sr)
    else
        if self.towerControlPanel:isVisible() then 
            self.towerControlPanel:hide()
        elseif self.towerSkillPanel:isVisible() then
                self.towerSkillPanel:hide()
        end
        -- 塔的等级小于4级，显示塔控制页面，否则显示塔天赋页面
        if sr.tower.level_ < 4 then
            self.towerControlPanel:show(sr)
        else
            self.towerSkillPanel:show(sr)
        end
    end
    -- body
end
function BattleUI:onSelectStandRange(event)
end

-- 选中了兵塔
function BattleUI:selectSoldierTower(tower)
    -- print("BattleUI:selectSoldierTower 选中了兵塔 id = "..tostring(tower.mainID_))
    -- 显示兵塔页面
    self.soldierTowerPanel:show(tower, self)
end

-- 显示通关页面
function BattleUI:showWinLayer(mapConfig)
    -- print("BattleUI:showWinLayer")

    -- add by Owen, 2016.6.7, 如果是第十关的模式3，那么要判定一下搜集的精华数量，
    -- 如果搜集的数量没达标, 那么还是需要显示失败页面
    if GlobalData.getGameLv() == 10 and GlobalData.getGameMode() == 3 then
        if self.infoPanel.killElvesCount < StableGameProperties.Essence_NEED_COUNT then
            self:showLoseLayer()
            return
        end
    end

    local starScripts = tostring(mapConfig.scriptRating)
    -- print("string.len(starScripts) = "..string.len(starScripts))
    -- if string.len(starScripts) == 0 then
        -- 血量评星
        local hp = BattleDataManager:getHp()
        local hpRating = mapConfig.hpRating
        local star = 1
        if hp >= hpRating[3] then
            star = 3
        elseif hp >= hpRating[2] then
            star = 2
        end
        local winLayer = GameWinPanel.new(hp, star, self.rt, self.mapLayer_)
        self:addChild(winLayer)
        -- winLayer:setPosition(display.cx, display.cy)
    -- end
end

function BattleUI:showLoseLayer(mapConfig)
    local winLayer = GameWinPanel.new(hp, star, self.rt, self.mapLayer_, true)
    self:addChild(winLayer)
    -- winLayer:setPosition(display.cx, display.cy)
end


-- 设置 MapRuntime
function BattleUI:setRuntime(rt)
    -- print("BattleUI:setRuntime(rt)")
	self.rt = rt

 --    self.rt.onSelectStandRange:add(onSelectStandRange, self)
 --    self.heroControlPanel:setRuntime(rt)
    if self.rt then
        self.heros = self.rt.map_:getHero()
        self.RoundStartBtnPanel:setRuntime(rt)
        self.towerSelectPanel:setRuntime(rt)
    	self.towerControlPanel:setRuntime(rt)
        self.towerSkillPanel:setRuntime(rt)
        self.heroSkillBtnPanel:setRuntime(rt)
        self.rmbSkillBtnPanel:setRuntime(rt)
        self.skillRangePanel:setRuntime(rt)
        self.heroControlPanel:setRuntime(rt)
        self.soldierTowerPanel:setRuntime(rt)
        self.objectDetailPanel:setRuntime(rt)
        self.infoPanel:setRuntime(rt)
        -- self.heroSkillBtnPanel:show()    -- 把这个函数中放到onShowHeroSkill函数中
        -- self:createHeroControlPanel();


        -- add by Owen, 2016.4.27, 前6关的模式1没有通关，那么需要显示新手引导弹窗
        local gameLv   = GlobalData.getGameLv()
        local gameMode = GlobalData.getGameMode()
        if gameLv <= 6 and gameMode == 1 and gameLv ~= 3 then
            local lvStar = GlobalData.getLvStar(gameLv)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                local guideTips = GameTips.new(true, nil, self)
                self:addChild(guideTips)
            end
        end
        -- add by Owen, 2016.4.27, 第12关的模式1也要显示一个引导页面
        if gameLv == 12 and gameMode ~= 3 then
            local lvStar = GlobalData.getLvStar(gameLv)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                local guideTips = GameTips.new(true, nil, self)
                self:addChild(guideTips)
            end
        end

        -- 每一关模式3都要显示玩法的提示
        if gameMode == 3 then
            -- 新建一个tips按钮，点开以后显示第三模式的玩法
            self.tipsBtnPanel:addOneBtn(MapConstants.TipsType_ModeThree)

            local guideTips = GameTips.new(true, nil, self)
            self:addChild(guideTips)
        end

        -- add by Owen, 2016.6.15, 增加友盟数据统计, 进入关卡
        local level = utils.getSDKLevelID()
        -- state：1开始2成功3失败
        umengSdk.setLevelStart(level, 1)

        -- 制作英雄体验券
        local heros = self.rt.map_:getHero()
        for i, v in ipairs(heros) do
            if v.mainID_ == "110205" then
                local heroTestCount = GlobalData.getTimeHeroNum("110205")
                if heroTestCount and heroTestCount > 0 then
                    GlobalData.setTimeHero("110205", heroTestCount - 1)
                end
            elseif v.mainID_ == "110301" then
                local heroTestCount = GlobalData.getTimeHeroNum("110301")
                if heroTestCount and heroTestCount > 0 then
                    GlobalData.setTimeHero("110301", heroTestCount - 1)
                end
            end
        end

        -- local winLayer = GameWinPanel.new(10, 3, self.rt, self.mapLayer_)
        -- self:addChild(winLayer)

        -- local config = MonsterProperties.get("100501")
        -- local bossKillPanel = BossKillPanel.new(self, config)
        -- self:addChild(bossKillPanel)

    end
end

function BattleUI:showRoundStartBtn(event)
    -- print("yaoxiaoyang function BattleUI:showRoundStartBtn(event)")
    self.RoundStartBtnPanel:showRoundStartBtn(event)
end
function BattleUI:hideRoundStartBtn(event)
    self.RoundStartBtnPanel:hideRoundStartBtn(event)
    -- body
end

function BattleUI:hideAllFlags( ... )
    -- print("function BattleUI:hideAllFlags( ... )")
    if self.heroMoveflags then 
        for k, v in pairs(self.heroMoveflags) do 
            v:setVisible(false)
        end
    end
    -- body
end

-- 重新开始这一关
function BattleUI:onRtRestart(event)
    -- print("function BattleUI:onRtRestart(event)")
    --self:hideRoundStartBtn() 由于收到信号时已经被显示
    self:checkandHidePanels()
    self.heroControlPanel:onRestart()
    self.heroSkillBtnPanel:onRestart()
    self.rmbSkillBtnPanel:onRestart()
    self.infoPanel:onRestart()
    self:skillSelectCancel()
    self:heroSelectCancel(true)
    self:heroAssembleCancel(true)
    self:hideAllFlags()
    self.heros = self.rt.map_:getHero()

    if self.bossTimeLayer then
        self.bossTimeLayer:removeSelf()
        self.bossTimeLayer = nil
    end

    -- add by Owen, 2016.5.4, 重新开始这一关的时候，需要把tips的按钮都移除掉
    self.tipsBtnPanel:removeAllBtn()

    -- add by Owen, 2016.4.27, 前6关的模式1没有通关，那么需要显示新手引导弹窗
    local gameLv   = GlobalData.getGameLv()
    local gameMode = GlobalData.getGameMode()
    if gameLv <= 6 and gameMode ~= 3 and gameLv ~= 3 then
        local lvStar = GlobalData.getLvStar(gameLv)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            local guideTips = GameTips.new(true, nil, self)
            self:addChild(guideTips)
        end
    end
    -- add by Owen, 2016.4.27, 第12关的模式1也要显示一个引导页面
    if gameLv == 12 and gameMode ~= 3 then
        local lvStar = GlobalData.getLvStar(gameLv)
        if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
            local guideTips = GameTips.new(true, nil, self)
            self:addChild(guideTips)
        end
    end

    -- 每一关模式3都要显示玩法的提示
    if gameMode == 3 then
        -- 新建一个tips按钮，点开以后显示第三模式的玩法
        self.tipsBtnPanel:addOneBtn(MapConstants.TipsType_ModeThree)

        -- 每一关模式3都要显示玩法的提示
        local guideTips = GameTips.new(true, nil, self)
        self:addChild(guideTips)
    end

    -- 变量用来控制祭坛塔掠夺的新手引导是否已经显示过了
    self.hasShowPlunderGuide = false
    -- 变量用来控制，有没有显示过rmb技能的引导
    self.rmbGuideHasShow     = false

    -- add by Owen, 2016.6.15, 增加友盟数据统计, 重玩的话，算一次游戏失败和开始
    local level = utils.getSDKLevelID()
    -- state：1开始2成功3失败
    umengSdk.setLevelStart(level, 3)

    local level = utils.getSDKLevelID()
    -- state：1开始2成功3失败
    umengSdk.setLevelStart(level, 1)

    -- 处理“点击造塔”的tips引导
    if self.buildTowerTips then
        self.buildTowerTips:removeSelf()
        self.buildTowerTips = nil
    end

    -- 移除第1关显示的“建造魔法塔”、“建造战争古树” tips
    if self.magicTipsBox then
        self.magicTipsBox:removeSelf()
        self.magicTipsBox = nil
        self.burstTipsBox:removeSelf()
        self.burstTipsBox = nil
    end

    -- 移除第5关和第6关显示的“召唤援兵”tips
    if self._needShowSummonTip then
        self._needShowSummonTip = nil
        self._needShowSummonTipTime = 0

        if self._showSummonTips then
            self._showSummonTips:removeSelf()
            self._showSummonTips = nil
        end
    end
end

-- 更新英雄手动技能中的数据
function BattleUI:onShowHeroSkill(event)
    -- print("BattleUI:onShowHeroSkill(event)")
    if not self.heroSkillBtnPanel.bHasAdd then
        self.heroSkillBtnPanel:show()
    end

    -- 把道具技能页面也放到这里显示，其实也可以放在self:setMapRuntime()中显示
    self.rmbSkillBtnPanel:show()

    -- add by Owen, 2016.7.16, 第3关以后，右边的rmb技能要默认显示出来
    if GlobalData.getGameLv() > 2 then
        -- mac和windows平台上面不显示这个页面
        if GLOBAL_SHOW_WIN_TYPE 
            and (device.platform == "mac" or device.platform == "windows") then
        else
            self.rmbSkillBtnPanel:onShowBtnClicked()
        end
    end

    -- add by Owen, 2016.6.19, 11关模式3显示英雄的属性也放到这里调用
    -- 因为这里的时候英雄的buff、技能才初始化了，才能拿到originalPro_中的各种属性
    self.infoPanel:showElevenThree()
end

-- 有了羁绊技能后，释放某些技能，需要从屏幕上方飘下来一个按钮，按钮拾取后，会做一些处理
function BattleUI:onCreateFlyBtn(event)
    if not self.flyBtnPanel then
        self.flyBtnPanel = FlyBtnPanel.new()
        self.flyBtnPanel:setRuntime(self.rt)
        self:addChild(self.flyBtnPanel)
    end
    -- 生成一个从屏幕上方飞下来的按钮
    self.flyBtnPanel:createFlyBtn(event._userData)
end

-- 有羁绊21时，释放了论禅讲道，那么还需要再杏花雨露手技按钮上显示一个数字
function BattleUI:onUpdateXingHuaCount(event)
    self.heroSkillBtnPanel:updateXingHuaCount()
end

-- 更新钻石数量
function BattleUI:onUpdateDiamondCount(event)
    self.diamondCountLabel:setString(GlobalData.getDiamondCount())
    -- add by Owen, 2016.7.15, 这个信号，也要更新右边的道具数量
    self.rmbSkillBtnPanel:updateItemCount()
end

-- 显示Boss头上的倒计时按钮，并且可以点击
function BattleUI:showBossTimeLayer(object, x, y, retainTime, needClickCount)
    if not self.bossTimeLayer then
        self.bossTimeLayer = BossTimeLayer.new(self)
        self.bossTimeLayer:show(object, x, y, retainTime, needClickCount)
        self:addChild(self.bossTimeLayer)
    else
        self.bossTimeLayer:show(object, x, y, retainTime, needClickCount)
    end
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
function BattleUI:guideWhenRoundStart(round)
    if round == 1 then
        -- 第一关第一波开始的时候，显示英雄移动提示
        local guideTips = GameTips.new(false, MapConstants.TipsType_HeroMove, self)
        self:addChild(guideTips)

    elseif round == 3 then
        -- 第一关第四波引导释放rmb技能
        self.heroSkillBtnPanel:fourRoundStart()
        -- 把其他按钮都置为不可点击
        self.pauseBtn:setTouchEnabled(false)
        self.diamondBtn:setTouchEnabled(false)
        self.heroControlPanel:setUnTouchWhenSkillGuide()
        self.rmbSkillBtnPanel:setUnTouchWhenSkillGuide()
    end
end

-- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
-- 引导结束的处理
function BattleUI:skillGuideOver()
    -- 把其他按钮都置为可点击
    self.pauseBtn:setTouchEnabled(true)
    self.diamondBtn:setTouchEnabled(true)
    self.heroControlPanel:setTouchWhenSkillGuideOver()
    self.rmbSkillBtnPanel:setTouchWhenSkillGuideOver()
end

-- add by Owen, 2016.5.4, 新手引导, 第一关的新手引导走完以后，要出现两个tips
-- 在刷怪按钮那里，要显示一个 “点击开始” 的提示
function BattleUI:showTipsAfterGuide()
    -- print("BattleUI:showTipsAfterGuide()")

    -- change by Owen, 2016.7.14, 改了新手引导流程, 不需要弹出这两个按钮了
    -- 弹出刷怪按钮tips
    -- self.tipsBtnPanel:addOneBtn(MapConstants.TipsType_RoundStart)

    -- 弹出英雄移动按钮tips
    -- self.tipsBtnPanel:addOneBtn(MapConstants.TipsType_HeroMove)

    -- 显示“点击开始”的提示框
    local tipsBox = TipsBoxPanel.new(self, 1)
    self.RoundStartBtnPanel.bornPointNode:addChild(tipsBox)
    -- local x, y = self.RoundStartBtnPanel.bornPointNode:getPosition()
    tipsBox:setRotation(-self.RoundStartBtnPanel.rotationNum)
    tipsBox:setPosition(25, 170)
    tipsBox:setVisible(false)
    self.roundStartTips = tipsBox
    -- tipsBox:setSacle(1/self.rt.map_:getCamera():getScale())


    -- 显示“建造1个箭塔”的提示框
    local tipsBox = TipsBoxPanel.new(self, 3)
    self.rt.map_.batch_:addChild(tipsBox)
    -- tipsBox:setPosition(837, 320)
    tipsBox:setPosition(1110, 250)
    self.buildTowerTips = tipsBox
end

-- 第三关祭坛能量满的时候，显示祭坛掠夺的新手引导Tips
function BattleUI:onShowPlunderGuideTips()
    -- print("BattleUI:onShowPlunderGuideTips()")
    if not self.hasShowPlunderGuide then
        local guideTips = GameTips.new(false, MapConstants.TipsType_JiTanPlunder, self)
        self:addChild(guideTips)
        self.hasShowPlunderGuide = true
    end
end

-- 第4关第2波开始前5秒，显示祭坛召唤的新手引导Tips
function BattleUI:onShowSummonGuideTips()
    -- print("BattleUI:onShowPlunderGuideTips()")
    if not self.hasShowSummonGuide then
        local guideTips = GameTips.new(false, MapConstants.TipsType_JiTanSummon, self)
        self:addChild(guideTips)
        self.hasShowSummonGuide = true
    end
end

-- add by Owen, 2016.5.25, 先判定一下这个怪物之前是不是见过了，没见过的话，需要显示新怪提示
function BattleUI:seeOneNewEnemy(monsterID)
    -- 显示新怪Tips
    self.tipsBtnPanel:addOneBtn(MapConstants.TipsType_NewEnemy, monsterID)
end

-- add by Owen, 2016.6.25, 造了塔以后调用一下battleUI里面的函数，
-- 用来隐藏掉第一关“点击造塔”的引导提示
function BattleUI:buildOneTower()
    if self.buildTowerTips then
        self.buildTowerTips:removeSelf()
        self.buildTowerTips = nil

        -- 如果这时候还没有开始刷怪，那么需要显示“点击开始”tips
        if not BattleDataManager:getIsRoundStarted() and self.roundStartTips then
            self.roundStartTips:setVisible(true)
        end
    end
end

-- add by Owen, 2016.7.14, 开始一波的时候调用BattleUI的函数，用来处理
function BattleUI:startRound(round)
    if round == 2 then
        -- 第1关 第2波，显示两个魔法塔和树塔的造塔引导
        local gameLv   = GlobalData.getGameLv()
        local gameMode = GlobalData.getGameMode()
        if gameLv == 1 and gameMode == 1 then
            local star = GlobalData.getLvStar(gameLv)
            if star[1][1] == 0 and star[1][2] == 0 then

                -- 显示“建造魔法塔”的提示框
                self.magicTipsBox = TipsBoxPanel.new(self, 4)
                self.rt.map_.batch_:addChild(self.magicTipsBox)
                -- tipsBox:setPosition(837, 320)
                self.magicTipsBox:setPosition(305, 335)

                -- 显示“建造战争古树”的提示框
                self.burstTipsBox = TipsBoxPanel.new(self, 5)
                self.rt.map_.batch_:addChild(self.burstTipsBox)
                -- tipsBox:setPosition(837, 320)
                self.burstTipsBox:setPosition(837, 310)

                -- 遍历一下已经造好的塔的位置，如果这两个位置上已经造好了，则隐藏tips
                for i, v in pairs(self.rt.towers_) do
                    if math2d.dist(v[1], v[2], 305, 335) < 50 then
                        self.magicTipsBox:setVisible(false)
                    elseif math2d.dist(v[1], v[2], 837, 310) < 50 then
                        self.burstTipsBox:setVisible(false)
                    end
                end
            end
        elseif gameLv == 5 and gameMode == 1 then
            -- 第5关第2波开始5秒后，在祭坛塔上面显示一个“召唤援兵”的tips
            local star = GlobalData.getLvStar(gameLv)
            if star[1][1] == 0 and star[1][2] == 0 then
                self._needShowSummonTip = true
                self._needShowSummonTipTime = 0
            end
        elseif gameLv == 6 and gameMode == 1 then
            -- 第6关，第2波开始之后，要显示“召唤援兵”的提示框
            local tipsBox = TipsBoxPanel.new(self, 6)
            self.rt.map_.batch_:addChild(tipsBox)
            tipsBox:setPosition(912, 440)
            -- 记录显示的 “召唤援兵”的提示框
            self._showSummonTips = tipsBox

            self._needShowSummonTip = false
        end
    elseif round == 5 then
        -- 第3关，第5波开始后20秒，如果道具技能“圣塔光辉”没有引导过，那么需要引导
        
        local gameLv   = GlobalData.getGameLv()
        local gameMode = GlobalData.getGameMode()
        if gameLv == 3 and gameMode == 1 then
            if not GlobalData.getItemSkillHasGuide(2) then
                local star = GlobalData.getLvStar(gameLv)
                if star[1][1] == 0 and star[1][2] == 0 then
                    self.rmbSkillBtnPanel:setNeedGuideItem2()
                end
            end
        end
    end
end

-- add by Owen, 2016.7.16, 新手引导, 如果第2关的模式1没有通关，
-- 第4波开始后，如果有怪物进入左上角，引导释放 怪物回退技能
function BattleUI:guideItemSkill(itemIndex)
    -- 根据 itemIndex 的值，来引导具体的道具技能
    -- 如果是没有显示的，则需要把rmb技能给显示出来

    -- 引导rmb技能的时候要暂停游戏
    self.rt:pausePlay()
    if self.rmbSkillBtnPanel.outView then
        self.rmbSkillBtnPanel:onShowBtnClicked()
        self.rmbSkillBtnPanel:guideRmbSkill(itemIndex, true)
    else
        self.rmbSkillBtnPanel:guideRmbSkill(itemIndex, false)
    end
        
end

-- add by Owen, 2016.7.21, 判定是不是要显示Boss击杀奖励页面
function BattleUI:showBossKillLayer(bossID)
    local config = MonsterProperties.get(bossID)
    local bossKillPanel = BossKillPanel.new(self, config)
    self:addChild(bossKillPanel)
end

return BattleUI