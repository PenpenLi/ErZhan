 
local math2d = require("math2d")
local MapConstants = require("app.map.MapConstants")
local BehaviorBase = require("app.map.behaviors.BehaviorBase")
local BulletType = require("app.map.bullets.BulletType")
local GlobalData             = require("tools.GlobalData")
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local TowerLocationBehavior = class("TowerLocationBehavior", BehaviorBase)

-- 塔坑位的行为

-- 塔
function TowerLocationBehavior:ctor()
    BehaviorBase.ctor(self, "TowerLocationBehavior", nil, 0)
end

local function checkIsShowPlus(this)
    if (this.rt:isMoraleEnough() and not this.tower) then
        this:addPlus()
        if (ModuleManager.battle.morale_ >= 6) then
            this.rt:showGuideOnce(504, true)
        end
    else
        this:removePlus()
    end
end

-- 删除预览塔
local function removePreview(this)
    if (this.preview) then
        this.preview:removeFromParent()
        this.preview = nil
    end
end

-- 预览塔
local function addPreview(this, hero)
    removePreview(this)

    hero.behaviors = "SoldierBehavior"
    local object = this.rt:newObject("static", hero)
    object:setPosition(this.x_, this.y_)
    object:showFireRange()
    object:setCollisionEnabled(false)
    object:getView():setOpacity(128)

    this.preview = object
end

-- 造塔
-- @param hero 可选，要造的 hero。如不提供将使用 this.preview
-- 在BattleUI:onSelectStandRange中调用，
-- 传进来的this为一个TowerLocation
local function addTower(this, rt, towerId)

    -- add by Owen, 2016.4.23, 建造塔的时候，需要播放音效
    AudioMgr.playSound("Tower")

    -- print("function addTower(this, rt, hero)")
    -- local object
    -- if towerType == 1 then
    --     object = {
    --         behaviors = {
    --             "CampBehavior",
    --             "CollisionBehavior",
    --             "DecorateBehavior",
    --             "DestroyedBehavior",
    --             "FireBehavior",
    --             "TowerBehavior",
    --         },
    --         campId = 1,
    --         collisionEnabled = true,
    --         decorationsMore = {
    --         },
    --         defineId = "PlayerTower01",
    --         flipSprite = false,
    --         tag = 0,
    --         towerId = "PlayerTower01L01",
    --         bulletType = BulletType.ARROW,
    --         x = 154,
    --         y = 241,
    --     }
    -- elseif towerType == 2 then
    --     object = {
    --         behaviors = {
    --             "CampBehavior",
    --             "CollisionBehavior",
    --             "DecorateBehavior",
    --             "DestroyedBehavior",
    --             "FireBehavior",
    --             "TowerBehavior",
    --         },
    --         campId = 1,
    --         collisionEnabled = true,
    --         decorationsMore = {
    --         },
    --         defineId = "PlayerTower02",
    --         flipSprite = false,
    --         tag = 0,
    --         towerId = "PlayerTower02L01",
    --         bulletType = BulletType.ARROW,
    --         x = 693,
    --         y = 246,
    --     }
    -- end
    -- TowerLocation.lua
    local object = TowerObjectsProperties.get(towerId)
    object.defineId = towerId
    object.bulletType = BulletType.ARROW
    --dump(object, "dump add tower")
    object.x = this.x_
    object.y = this.y_
    -- 不需要传第三个参数id进去，传了反而攻击不了
    local tower = rt:newObject("towerobject", object) -- "static", object)
    --dump(tower, "dump tower")
    -- add by Owen, 2015.8.10, 初始化塔的技能
    tower:initTowerSkillAndBuff(tower.mapRuntime_)
    this.tower = tower
    tower.sr = this

    -- 播放塔升级特效，也用来做造塔特效
    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_tower_upgrade", nil, nil, tower)
    tower.sprite_:addChild(effect)
    effect:setPosition(offsetX, offsetY - 55)

    

    -- 造完塔以后，设置一下Zorder
    -- print("tower.sprite_ = "..tostring(tower.sprite_))
    tower.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (tower.y_ + tower.offsetY_))

    rt.towers_[tower.id_] = {
                tower.x_ + tower.radiusOffsetX_,
                tower.y_ + tower.radiusOffsetY_,
                tower.radius_ + 20,
                this,    -- 记录坑位，通过坑位.tower可以获得坑位上面的塔
            }

    -- add by Owen, 2015.8.19, 造塔以后隐藏塔基的图片
    if this.view then
        -- this.view:setVisible(false)
        this.view:setTexture("tower/shadow.png")
    end
    -- dump(rt.towers_,"yaoxiaoyang add tower")

    -- 记录玩家总共早了几个塔，用来做成就
    GlobalData.addBuiltTowerCount(1)
    local allCount = GlobalData.getBuiltTowerCount()
    -- 处理成就，造了50个塔
    if allCount >= 50 then
        local state1 = GlobalData.getAchieve("141221") 
        if state1 == 0 then
            GlobalData.setAchieve("141221", 1)
        end
    end
    -- 处理成就，造了100个塔
    if allCount >= 100 then
        local state1 = GlobalData.getAchieve("141222") 
        if state1 == 0 then
            GlobalData.setAchieve("141222", 1)
        end
    end


end

-- 删塔
local function removeTower(this, rt)

    -- print("function removeTower(this)")

    -- add by Owen, 2016.4.23, 出售塔的时候，需要播放音效
    AudioMgr.playSound("Sell")

    local tower = this.tower
    this.tower = nil

    -- 删除塔关联
    tower.sr = nil
    rt.towers_[tower.id_] = nil

    -- add by Owen, 2016.4.8, 塔删除的时候，
    -- 如果它在光环里面，要把光环里面记录的targets删除掉
    if rt.map_.objectsByClass_["areaobject"] then
        for i, area in pairs(rt.map_.objectsByClass_["areaobject"]) do
            -- 如果是光环的话
            if area.isAureole then
                -- 如果光环中有这个塔，就需要把这个塔从光环里面删掉
                for k = #area.targets,1,-1 do
                    local obj = area.targets[k]
                    if obj.id_ == tower.id_ then
                        table.remove(area.targets, k)
                    end
                end
            end
        end
    end

    -- if tower:isDestroyed() then
        if tower:hasBehavior("MovableBehavior") then
            -- print("tower:stopMoving()")
            tower:stopMoving()
        end
        if tower.showDestroyedStatus then
            -- print("tower:showDestroyedStatus()")
            tower:showDestroyedStatus()
        end
        tower.hp_ = 0
        tower:updateView()
        rt:objectDestroyed(tower)


    -- add by Owen, 2015.8.19, 删除塔以后显示塔基的图片
    if this.view then
        this.view:setVisible(true)
        this.view:setTexture(this.viewTexture)
    end

    -- end

    -- local decoration = runtime:newDecoration("ShipExplode", object)
    -- decoration:setDelay(decoration.delay_)
    -- decoration:playAnimationOnceAndRemove()

    -- self.runtime_:removeObject(object, decoration.delay_)


    -- assert(this.tower ~= nil, "this.tower 不能为 nil")

    -- local tower = this.tower
    -- this.tower = nil

    -- -- 删除塔关联
    -- tower.sr = nil

    -- -- 设置为未出战
    -- local hero = tower.state_
    -- hero:setIsInBattle(false)

    -- tower:killSelf()
    -- this.rt:objectDestroyed(tower)
    
    -- NotifyCenter.notify("UPDATE_MONSTER_COUNTER_EVENT")
    -- this.rt.handler_:onRemoveTower(this)
end

-- add by Owen, 2016.5.15, 把这个塔基上锁，也就是不让用户点击，用来做第15关的模式3
local function addLock(this)
    -- print("TowerLocationBehavior addLock")
    this.isLock = true
    if not this.lockImg then
        this.lockImg = display.newSprite("ui/fight/threeMode/eleven/towerLocationLock.png")
            :addTo(this.view)
            :pos(74/2, 56/2)

        -- 如果是第12关模式3，则需要修改锁的位置
        if GlobalData.getGameLv() == 12 and GlobalData.getGameMode() == 3 then
            this.lockImg:setPosition(104/2, 60/2)
        end
    else
        this.lockImg:setVisible(true)
    end
end

-- add by Owen, 2016.5.15, 把这个塔基解锁，也就是可以让用户点击
local function unLock(this)
    -- print("TowerLocationBehavior unLock")
    this.isLock = false
    if this.lockImg then
        this.lockImg:setVisible(false)
    end
end

-- add by Owen, 2016.6.8, 12关的模式3, 杀怪数量达到一定数量以后，要在塔基上方显示一个钥匙
local function showKey(this)
    -- 显示钥匙图标
    if not this.keyImg then
        this.keyImg = display.newSprite("ui/fight/threeMode/twelve/key.png")

        this.batch_:addChild(this.keyImg, MapConstants.HP_BAR_ZORDER)
        this.keyImg:setPosition(this.x_, this.y_ + 50)
            -- :addTo(this.batch)
            -- :pos(74/2, 56/2 + 50)

        -- batch:addChild(this.view, MapConstants.TOWER_LOCATION_ZORDER)
    else
        this.keyImg:setVisible(true)
    end
end

-- add by Owen, 2016.6.8, 12关的模式3, 杀怪数量达到一定数量以后，要在塔基上方显示一个钥匙
local function hideKey(this)
    -- 显示钥匙图标
    if this.keyImg then
        this.keyImg:setVisible(false)
    end
end

local function isViewCreated(this)
    return this.view ~= nil
end

local function updateView(this)
    if (this.view) then
        this.view:setPosition(this.x_, this.y_)
    end
end

local function createView(this, batch, marksLayer, debugLayer)
    -- display.newSprite(bgImageName)
    -- 当前是第几关
    local gameLv = GlobalData.getGameLv()
    --  记录塔基的纹理，删掉塔以后显示这个，造好塔以后显示阴影
    this.viewTexture = ""
    if gameLv >= 4 and gameLv <= 6 then
        this.viewTexture = "tower/towerLocation2.png"
        this.view = display.newSprite("tower/towerLocation2.png")
    elseif gameLv >= 7 and gameLv <= 9 then
        this.viewTexture = "tower/towerLocation3.png"
        this.view = display.newSprite("tower/towerLocation3.png")
    elseif gameLv >= 10 and gameLv <= 12 then
        this.viewTexture = "tower/towerLocation4.png"
        this.view = display.newSprite("tower/towerLocation4.png")
    elseif gameLv >= 13 and gameLv <= 15 then
        this.viewTexture = "tower/towerLocation5.png"
        this.view = display.newSprite("tower/towerLocation5.png")
    else
        this.viewTexture = "tower/towerLocation.png"
        this.view = display.newSprite("tower/towerLocation.png")
    end

    -- add by Owen, 2016.5.30, 第11关模式3，要把塔基换成锁住的塔基
    if gameLv == 11 and GlobalData.getGameMode() == 3 then
        local lock = display.newSprite("ui/fight/threeMode/eleven/towerLocationLock.png")
            :addTo(this.view)
            :pos(104/2, 60/2)
    end

    -- add by Owen, 2016.6.8, 第12关模式3，要把塔基换成锁住的塔基, 并把所有的塔基都锁上
    if gameLv == 12 and GlobalData.getGameMode() == 3 then
        this:addLock()
    end

    batch:addChild(this.view, MapConstants.TOWER_LOCATION_ZORDER)
    updateView(this)

    -- TO-DO 需要检测这里是否已经有可以造塔的坑了
    -- NotifyCenter.register(this.view, handler(this, checkIsShowPlus), "UPDATE_MONSTER_COUNTER_EVENT")
end

local function removeView(this)
    if (this.view) then
        -- NotifyCenter.unregister(this.view)
        this.view:removeFromParent()
        this.view = nil
    end
end

local last

-- 显示 tip
local function showTip(this, duration)
    if (this.tip) then
        return
    end
    this.removeCD = duration or 3
    if (last) then
        last.removeCD = 0.001
        last = nil
    end

    local morale = this.rt:getMoraleRequired()

    local tip = LayoutParser.createSprite({src="Battle.tower_tips_bg", anchor="0.5,0", parent=this.view})
    local box = LayoutParser.createHBox({parent=tip, gap=0})
    LayoutParser.createLabel2({parent=box, text="需要", anchor="0,0", size=18, color="#FFFFFF", outlineSize=2, outlineColor="#000000"})
    LayoutParser.createSprite({parent=box, src="Battle.morale_icon", anchor="0,0.2"})
    LayoutParser.createLabel2({parent=box, text=tostring(morale), anchor="0,0", size=18, color="#00FF00", outlineSize=2, outlineColor="#000000"})
    box:layout()

    local parentSize = box:getParent():getContentSize()
    local size = box:getContentSize()
    box:setPosition((parentSize.width - size.width) / 2, (parentSize.height - size.height) / 2 + 24)
    this.tip = tip
    last = this
end

-- tick
-- local function tick(this, dt)
--     if (this.removeCD > 0) then
--         this.removeCD = this.removeCD - dt
--         if (this.removeCD < 0) then
--             if (last == this) then
--                 last = nil
--             end
--             this.removeCD = 0
--             this.tip:removeFromParent()
--             this.tip = nil
--         end
--     end
-- end

-- 显示绿色 + 号
local function addPlus(this)
    if (this.plus) then
        return
    end
    this.plus = LayoutParser.createSprite({parent=this.view, src="Battle.plus"})
end

-- 删除绿色 + 号
local function removePlus(this)
    if (not this.plus) then
        return
    end
    this.plus:removeFromParent()
    this.plus = nil
end


local function isSelected(object)
    return object.isSelected_
end

local function setSelected(object, isSelected)
    object.isSelected_ = isSelected
end

local function checkPointIn(object, x, y)
    return math2d.dist(x, y, object.x_, object.y_) <= object.radius_
end

local function checkPointInHandler(object, x, y)
    local hx, hy = object.x_, object.y_
    hx = hx + object.radius_
    return math2d.dist(x, y, hx, hy) <= EditorConstants.CHECK_POINT_DIST
end

function TowerLocationBehavior:bind(object)
    object.isSelected_ = false
    object.removeCD = 0

    object:bindMethod(self, "isSelected", isSelected)
    object:bindMethod(self, "setSelected", setSelected)
    object:bindMethod(self, "checkPointIn", checkPointIn)
    object:bindMethod(self, "checkPointInHandler", checkPointInHandler)

    object:bindMethod(self, "addTower", addTower)
    object:bindMethod(self, "removeTower", removeTower)
    object:bindMethod(self, "addLock", addLock)
    object:bindMethod(self, "unLock", unLock)
    object:bindMethod(self, "showKey", showKey)
    object:bindMethod(self, "hideKey", hideKey)
    
    object:bindMethod(self, "removePreview", removePreview)
    object:bindMethod(self, "addPreview", addPreview)
    object:bindMethod(self, "showTip", showTip)
    object:bindMethod(self, "tick", tick)

    object:bindMethod(self, "isViewCreated", isViewCreated)
    object:bindMethod(self, "createView", createView)
    object:bindMethod(self, "removeView", removeView)
    object:bindMethod(self, "updateView", updateView)
    object:bindMethod(self, "addPlus", addPlus)
    object:bindMethod(self, "removePlus", removePlus)
end

function TowerLocationBehavior:unbind(object)
    object.isSelected_ = nil

    object:unbindMethod(self, "isSelected")
    object:unbindMethod(self, "setSelected")
    object:unbindMethod(self, "isViewCreated")
    object:unbindMethod(self, "createView")
    object:unbindMethod(self, "removeView")
    object:unbindMethod(self, "updateView")
    object:unbindMethod(self, "checkPointIn")
    object:unbindMethod(self, "checkPointInHandler")

    object:unbindMethod(self, "addTower")
    object:unbindMethod(self, "removeTower")
    object:unbindMethod(self, "addLock")
    object:unbindMethod(self, "unLock")
    object:unbindMethod(self, "showKey")
    object:unbindMethod(self, "hideKey")
    
    object:unbindMethod(self, "removePreview")
    object:unbindMethod(self, "addPreview")
    object:unbindMethod(self, "showTip")
    object:unbindMethod(self, "tick")
    object:unbindMethod(self, "addPlus")
    object:unbindMethod(self, "removePlus")

end

return TowerLocationBehavior