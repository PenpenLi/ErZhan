local EditorConstants = require("editor.EditorConstants")

local math2d = require("math2d")
local ObjectBase = require("app.map.ObjectBase")

-- Road 对象包含了多个可行走的点，也就是可行走的区域
local Road = class("Road", ObjectBase)

local numInstances = 0

local COLORS = {
    {
        r = 0,
        g = 0,
        b = 255,
    },
    {
        r = 0,
        g = 255,
        b = 0,
    },
    {
        r = 255,
        g = 0,
        b = 0,
    },
    {
        r = 0,
        g = 255,
        b = 255,
    },
    {
        r = 255,
        g = 0,
        b = 255,
    },
    {
        r = 255,
        g = 255,
        b = 0,
    },
    {
        r = 0,
        g = 100,
        b = 255,
    },
    {
        r = 255,
        g = 100,
        b = 0,
    },
    -- cc.c4b(0, 255, 255, 255),
    -- cc.c4b(0, 1, 100, 255),
    -- cc.c4b(1, 0, 100, 255)

    -- "#FF0000",
    -- "#808000",
    -- "#00FF00",
    -- "#008000",
    -- "#00FFFF",
    -- "#0000FF",
    -- "#000080",
    -- "#FF00FF",
    -- "#800080"
}

function Road:ctor(id, state, map)
    state.points = checktable(state.points)

    local x, y = 0, 0
    if #state.points > 0 then
        x, y = unpack(state.points[1])
    end
    state.x, state.y = x, y

    Road.super.ctor(self, id, state, map)
    self.valid_ = #self.points_ > 0

    numInstances = numInstances + 1
    if (numInstances > #COLORS) then
        numInstances = 1
    end
    self.color = COLORS[numInstances]
    -- add by Owen, 2015.9.8, 在游戏中添加一条可行走的路
    self._isWalkable = false
    -- 如果是默认路，则直接置为可行走区域, isDefault是在策划的配置文件中直接写进去的
    if self.isDefault_ then
        self._isWalkable = true
    end
end

-- 标记当前路径是否是默认路径
function Road:getIsDefault()
    return self.isDefault_
end

function Road:setIsDefault(value)
   self.isDefault_ = value 
end

-- add by Owen, 2015.9.8, 在游戏中添加一条可行走的路
function Road:setWalkable(value)
    self._isWalkable = value
end

function Road:getPoints()
    return self.points_
end
function Road:getPoint(index)
    local pt = self.points_[index]
    return pt[1], pt[2]
end

function Road:getPointsCount()
    return #self.points_
end

function Road:appendPoint(x, y)
    self.points_[#self.points_ + 1] = {x, y}
    self.valid_ = true
end


function Road:removePoint(index)
    assert(index > 0 and index <= #self.points_,
           string.format("Road:removePoint() - invalid point index %s", tostring(index)))
    table.remove(self.points_, index)
    self.valid_ = #self.points_ > 0
end

function Road:checkPointAtPoint(x, y)
   
    for index, pt in ipairs(self.points_) do
        if pt[1] == x and pt[2] == y then
           return index; 
        end
    end
    return nil
end



function Road:vardump()
    local state = Road.super.vardump(self)
    state.points = clone(self.points_)
    state.x, state.y = nil, nil
    state.isDefault = self.isDefault_
    return state
end

function Road:dump(label)
    local state = self:vardump()

    label = label or "<var>"
    local lines = {}
    lines[#lines + 1] = string.format("%s = {", label)
    if (state.isDefault) then
        lines[#lines + 1] = string.format("    %s = %s,", "isDefault", tostring(state.isDefault))
    end
    lines[#lines + 1] = "    points = {"

    local function _v(v, len)
        v = tostring(v)
        local l = string.len(v)
        return string.rep(" ", len - l) .. v
    end

    local points = {}
    local len = 0
    for i, p in ipairs(state.points) do
        -- chenge by Owen, 2015.11.27, 地图X轴缩放0.7, Y轴缩放0.5
        local pair = string.format("{%s, %s}", _v(math.round(p[1]), 4), _v(math.round(p[2]), 4))
        -- local pair = string.format("{%s, %s}", _v(math.round(p[1]*0.7), 4), _v(math.round(p[2]*0.5), 4))
        points[#points + 1] = pair
        len = len + string.len(pair)
        if len >= 70 then
            lines[#lines + 1] = "        " .. table.concat(points, ", ") .. ","
            points = {}
            len = 0
        end
    end
    if #points > 0 then
        lines[#lines + 1] = "        " .. table.concat(points, ", ") .. ","
    end
    lines[#lines + 1] = "     }"
    lines[#lines + 1] = "}"

    return table.concat(lines, "\n")
end

return Road
