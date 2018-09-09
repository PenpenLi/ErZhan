
local MapConstants    = require("app.map.MapConstants")
local MapEvent        = require("app.map.MapEvent")
local MovableBehavior = require("app.map.behaviors.MovableBehavior")
local BulletBase      = require("app.map.bullets.BulletBase")
local ObjectState     = require("app.map.ObjectState")
local BattleDataManager = require("app.map.data.BattleDataManager")

local MapEventHandler = class("MapEventHandler")

function MapEventHandler:ctor(runtime, map)
    self.runtime_        = runtime
    self.map_            = map
    self.objectsInRange_ = {}
end

-- 准备开始游戏
function MapEventHandler:preparePlay()
end

-- 开始游戏
function MapEventHandler:startPlay()
end

-- 停止游戏
function MapEventHandler:stopPlay()
end

-- 每秒执行一次 time() 方法, change by Owen, 2015.11.30, 注释掉这个方法，因为没有用到
function MapEventHandler:time(time, dt)
    -- for range, objects in pairs(self.objectsInRange_) do
    --     for object, times in pairs(objects) do
    --         local holdTime = time - times[1]
    --         local holdTimeDt = holdTime - times[2]
    --         times[2] = holdTime
    --         self:objectInRange(object, range, holdTime, holdTimeDt)
    --         self.runtime_:dispatchEvent({
    --             name       = MapEvent.OBJECT_IN_RANGE,
    --             object     = object,
    --             range      = range,
    --             holdTime   = holdTime,
    --             holdTimeDt = holdTimeDt,
    --         })
    --     end
    -- end
end

-- 对象进入区域
function MapEventHandler:objectEnterRange(object, range)
    -- print("MapEventHandler:objectEnterRange")
    -- dump(range, "dump range")
    if not self.objectsInRange_[range] then
        self.objectsInRange_[range] = {}
    end
    self.objectsInRange_[range][object] = {self.runtime_.time_, 0}
    -- add by Owen, 2015.8.19, 物体进入了光环
    if range:getClassId() == "areaobject" then
        range:objectEnterRange(object)
    end
end

-- 对象退出区域
function MapEventHandler:objectExitRange(object, range)
    if self.objectsInRange_[range] then
        self.objectsInRange_[range][object] = nil
    end
    -- add by Owen, 2015.8.19, 物体离开了光环
    if range:getClassId() == "areaobject" then
        range:objectExitRange(object)
    end
end

-- 对象保持在区域中
-- holdTime 是对象在区域中的持续时间
-- holdTimeDt 是距离上一次 objcetInRange 事件后，对象在区域中的时间
function MapEventHandler:objectInRange(object, range, holdTime, holdTimeDt)
end

-- 对象发生碰撞, object1进入了object2的FireVision中
--[[ 有两种情况
    1. 有物体进入了英雄/怪物的远程射击范围
    2. 有物体进入了区域，也就是AreaObject、RangeObject

    这个方法只进入有物体进入了我的范围，不会对物体做任何的筛选
    需要在处理这些物体的时候，自己做筛选
]]
function MapEventHandler:objectCollisionBegan(object1, object2)
    -- 2进入了1的视野范围,调用的是FireBehavior中的函数
    -- 2015.6.5，增加对空、对地的判定
    -- if object1:hasBehavior("HeroBehavior") or object1:hasBehavior("TowerBehavior") then
    --     for i,v in ipairs(object1.enemyType_) do
    --         if object2.walkLayer_ == v then
    --             object1:enterVision(object2)
    --             break
    --         end
    --     end
    -- else
        object2:enterVision(object1)
    -- end
end

-- 对象结束碰撞, object1 离开了object2 的 FireVision
function MapEventHandler:objectCollisionEnded(object1, object2)
    -- 2离开了1的视野范围
    -- print("object1 id = "..object1.owenId_.." 2.id = "..object2.owenId_)
    -- object1:noLook(object2) -- leaveVision(object2)
    object2:noLook(object1)
end


-- 对目标开火
function MapEventHandler:fire(object, target)
    -- 记录一下可以攻击的对象
    -- print("MapEventHandler:fire object = "..tostring(object.owenId_)
    --     .." target num = "..tostring(#target).." 怪物 id = "..target[1].id_)
    local testhaha = BattleDataManager:getHeroWillAttackTarget(object.id_)
    -- print("英雄配对的 id = "..tostring(testhaha))
    -- object.bList = target
    if (object:hasBehavior("HeroBehavior")) then
        if BattleDataManager:isHeroHasTarget(object.id_) then
            -- 英雄有配对的怪物的话，直到配对的怪物进入自己的近战范围，才赋值bList
            for i,v in ipairs(target) do
                -- print("v.id_ = "..tostring(v.id_))
                if tostring(v.id_) == tostring(BattleDataManager:getHeroWillAttackTarget(object.id_).id_) then
                    object.bList = {}
                    object.bList[1] = v
--                    -- print("配对的怪物进入了英雄的近战范围")
                    break
                end
            end
        elseif BattleDataManager:isHeroHasNearAttTarget(object.id_) then
            -- 英雄没有有配对的怪物的话，但设了一个近战的怪物，
            -- 直到配的近战的怪物进入自己的近战范围，才赋值bList
            for i,v in ipairs(target) do
                -- print("v.id_ = "..tostring(v.id_))
                if tostring(v.id_) == tostring(BattleDataManager:getHeroNearAttTarget(object.id_).id_) then
                    object.bList = {}
                    object.bList[1] = v
                    -- print("配的近战怪物进入了英雄的近战范围")
                    break
                end
            end
        end
    else
        object.bList = target
    end
    
    if (object:hasBehavior("MonsterBehavior")) then
        -- dump(target)
        object.bList = target
    end

    -- -- change by Owen, 2015.5.19，在这里加这么一个判定
    if object:hasBehavior("TowerBehavior") then
        -- 更新塔可攻击列表
        -- print("MapEventHandler:fire target num = "..tostring(#target))
        object.bList = target
        BattleDataManager:updateCanAttackList(object, target, true)
    end
    --     if object.fireCooldown_ <= 0  then
    --         local targets = BattleDataManager:getCanAttackList(object)
    --         if targets and #targets > 0 then
    --             local bullets = object:fire(targets)
    --             -- dump(bullets, MapEventHandler:fire(object, target))
    --             for i, bullet in ipairs(bullets) do
    --                 self.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
    --                 self.runtime_:addBullet(bullet)
    --             end
    --         end
    --     end
    -- end
end

-- 对象的开火范围内没有目标
function MapEventHandler:noTarget(object)
    -- print("MapEventHandler:noTarget object = "..tostring(object.owenId_))
    -- object.bList = nil
    if object:hasBehavior("TowerBehavior") then
        -- 更新塔可攻击列表
        BattleDataManager:updateCanAttackList(object, nil, true)
    end
end

-- 击中目标
-- handler:hit(bullet.a, bullet.b , bullet.damage.value, bullet.damage.isCri, bullet, self.time_)
function MapEventHandler:hit(object, target, damage, cri, bullet, time)
    if target:isDestroyed() or self.runtime_.over_ then return end

    -- print("MapEventHandler:hit")

    -- 塔击中了怪物以后，要增加金币
    if object and object:hasBehavior("TowerBehavior") then
        if object.atkGold_ ~= 0 then
            BattleDataManager:addGold(object.atkGold_)
        end
    end
    -- 英雄击中了怪物以后，要增加经验
    if object and object:hasBehavior("TowerBehavior") then
        -- TO-DO 增加英雄的经验
    end

    -- 扣除目标 HP
    target:decreaseHp(damage)
    if target:isDestroyed() then
        if target:hasBehavior("HeroBehavior") then
            target.isDead_ = true
        end
        if target:hasBehavior("MovableBehavior") then
            target:setState(ObjectState.STOP)
            -- target:stopMoving()
            target:stopMovingNow()
            -- add by Owen, 2016.2.16, 怪物死亡后要unbindPath
            target:unbindPath()
        end
        if target.showDestroyedStatus then
            target:showDestroyedStatus()
        end
        -- 调用FireBehavior中的onDead函数
        if target:hasBehavior("FireBehavior") then
            target:onDead()
        end
        target:updateView()
        -- 调用 rt:objectDestroyed() 函数
        self.runtime_:objectDestroyed(target)
        -- change by Owen, 2016.1.12, 不需要调用self:objectDestroyed()
        -- self:objectDestroyed(target)
    end
end

-- 没有命中目标
function MapEventHandler:miss(object, target, bullet)
    -- print("MapEventHandler:miss")
end

-- 对象被摧毁
function MapEventHandler:objectDestroyed(object)
    self.runtime_:dispatchEvent({name = MapEvent.OBJECT_DESTROY, object = object})
    if object:hasBehavior("NPCBehavior") then
        self:showShipExplode(object)
    end
end

--[[--

显示舰船被摧毁的动画

]]
function MapEventHandler:showShipExplode(object)
    local runtime = self.runtime_
    local radius = object.radius_ * 100
    object:addCollisionLock()

    for i = 1, 12 do
        local decoration = runtime:newDecoration(string.format("ShipExplodeSmall%02d", math.random(1, 2)), object)
        decoration:setDelay(math.random(2, 5) / 100 * (i - 1))
        decoration:setVisible(true)
        decoration:playAnimationOnceAndRemove()
        local ox = math.random(-radius, radius) / 100
        local oy = math.random(-radius, radius) / 100 * 0.8
        local view = decoration:getView()
        local x, y = view:getPosition()
        view:setPosition(x + ox, y + oy)
    end

    local decoration = runtime:newDecoration("ShipExplode", object)
    decoration:setDelay(decoration.delay_)
    decoration:playAnimationOnceAndRemove()

    self.runtime_:removeObject(object, decoration.delay_)
end

return MapEventHandler
