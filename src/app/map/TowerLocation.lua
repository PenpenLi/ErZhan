 
local TowerLocation = class("TowerLocation", require("app.map.Range"))

TowerLocation.DEFAULT_RADIUS = 35
TowerLocation.MIN_RADIUS     = 16
TowerLocation.MAX_RADIUS     = 500

-- 可以造塔的坑位，默认半径为35

function TowerLocation:ctor(id, state, map)
    TowerLocation.super.ctor(self, id, state, map)
    self.valid_            = true
    self.collisionEnabled_ = false
    -- self.radius_           = math.round(tonumber(self.radius_)) -- toint(self.radius_)
    -- if self.radius_ <= 0 then
        self.radius_ = TowerLocation.DEFAULT_RADIUS
    -- end
end

-- 返回区域半径
function TowerLocation:getRadius()
    return self.radius_
end

function TowerLocation:getDefineId()
    return self.defineId_
end

-- 设置区域半径
function TowerLocation:setRadius(radius)
    if radius < TowerLocation.MIN_RADIUS then radius = TowerLocation.MIN_RADIUS end
    if radius > TowerLocation.MAX_RADIUS then radius = TowerLocation.MAX_RADIUS end
    self.radius_ = math.round(radius)
end

-- 导出 TowerLocation 对象的状态
function TowerLocation:vardump()
    -- print("TowerLocation:vardump()")
    local state = TowerLocation.super.vardump(self)
    state.radius = self.radius_
    state.defineId = self.defineId_
    return state
end



return TowerLocation
