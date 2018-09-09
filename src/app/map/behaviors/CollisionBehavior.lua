
-- change by Owen, 2016.1.12 已废弃

local math2d       = require("math2d")
local BehaviorBase = require("app.map.behaviors.BehaviorBase")

local CollisionBehavior = class("CollisionBehavior", BehaviorBase)

function CollisionBehavior:ctor()
    CollisionBehavior.super.ctor(self, "CollisionBehavior", nil, 1)
end

function CollisionBehavior:bind(object)
    object.collisionLock_ = 0
    object.collisionEnabled_ = object.state_.collisionEnabled
    if type(object.collisionEnabled_) ~= "boolean" then
        object.collisionEnabled_ = true
    end

    local function isCollisionEnabled(object)
        return object.collisionEnabled_
    end
    object:bindMethod(self, "isCollisionEnabled", isCollisionEnabled)

    -- add by Owen, 2015.8.31, 判定object是否在range中
    local function isInRange(object, range)
        if not range.radiusOffsetX_ then range.radiusOffsetX_ = 0 end
        if not range.radiusOffsetY_ then range.radiusOffsetY_ = 0 end
        local objX = range.x_ + range.radiusOffsetX_
        local objY = range.y_ + range.radiusOffsetY_
        
        local tarX = object.x_ + object.radiusOffsetX_
        local tarY = object.y_ + object.radiusOffsetY_

        return math2d.pointInEllipse(objX, objY, tarX, tarY, range.radius_, object.radius_) 
    end
    object:bindMethod(self, "isInRange", isInRange)

        -- add by Owen, 2015.8.31, 判断目标是否在自己的近战范围内
    local function isFireRangeCollision(object,target) 
        if not target.radiusOffsetX_ then target.radiusOffsetX_ = 0 end
        if not target.radiusOffsetY_ then target.radiusOffsetY_ = 0 end
        local x1 = object.x_ + object.radiusOffsetX_
        local y1 = object.y_ + object.radiusOffsetY_
        
        local x2 = target.x_ + target.radiusOffsetX_
        local y2 = target.y_ + target.radiusOffsetY_

        return math2d.pointInEllipse(x1,y1,x2,y2,object.fireRange_,target.radius_) 
                
    end
    object:bindMethod(self, "isFireRangeCollision", isFireRangeCollision)

    -- add by Owen, 2015.8.31, 判断目标是否在自己的射程范围内
    local function isFireVisionCollision(object,target) 
        if not target.radiusOffsetX_ then target.radiusOffsetX_ = 0 end
        if not target.radiusOffsetY_ then target.radiusOffsetY_ = 0 end
        local x1 = object.x_ + object.radiusOffsetX_
        local y1 = object.y_ + object.radiusOffsetY_
        
        local x2 = target.x_ + target.radiusOffsetX_
        local y2 = target.y_ + target.radiusOffsetY_

        return math2d.pointInEllipse(x1,y1,x2,y2,object.fireVision_,target.radius_) 
                
    end
    object:bindMethod(self, "isFireVisionCollision", isFireVisionCollision)

    local function setCollisionEnabled(object, enabled)
        object.collisionEnabled_ = enabled
    end
    object:bindMethod(self, "setCollisionEnabled", setCollisionEnabled)

    local function addCollisionLock(object)
        object.collisionLock_ = object.collisionLock_ + 1
    end
    object:bindMethod(self, "addCollisionLock", addCollisionLock)

    local function removeCollisionLock(object)
        object.collisionLock_ = object.collisionLock_ - 1
        assert(object.collisionLock_ >= 0,
               "CollisionBehavior.removeCollisionLock() - object.collisionLock_ must >= 0")
    end
    object:bindMethod(self, "removeCollisionLock", removeCollisionLock)

    local function vardump(object, state)
        state.collisionEnabled = object.collisionEnabled_
        return state
    end
    object:bindMethod(self, "vardump", vardump)
end

function CollisionBehavior:unbind(object)
    object.collisionEnabled_ = nil
    object:unbindMethod(self, "isCollisionEnabled")
    object:unbindMethod(self, "setCollisionEnabled")
    object:unbindMethod(self, "addCollisionLock")
    object:unbindMethod(self, "removeCollisionLock")
    object:unbindMethod(self, "isInRange")
    object:unbindMethod(self, "isFireRangeCollision")
    object:unbindMethod(self, "isFireVisionCollision")
    object:unbindMethod(self, "vardump")
end

return CollisionBehavior
