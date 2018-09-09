
local math2d = {}

--[[

radians: 弧度
radius: 半径
degrees: 角度
dist: 距离

--]]

-- 求两点间距离
local sqrt  = math.sqrt
local atan2 = math.atan2
local cos   = math.cos
local sin   = math.sin
local pi    = math.pi
local pi_d_180 = pi / 180
local pi_180_d = 180 / pi

function math2d.dist(ax, ay, bx, by)
    local dx, dy = bx - ax, by - ay
    return sqrt(dx * dx + dy * dy)
end

-- add by Owen, 2015.8.31, 是否在椭圆内
-- tarX 是否在以objX为中心，radius为半径的椭圆内
function math2d.pointInEllipse(objX,objY,tarX,tarY,radius,target_radius)

      
        local dx = tarX - objX
        local dy = tarY - objY
        
        local dist1to2 = math2d.dist(objX,objY,tarX,tarY)
        local dist2 = dist1to2 * dist1to2
      --a*b/sqrt(b*b*dx*dx/d2*d2+a*a*dy*dy/d2*d2)
        local a = radius
        local b = radius* 0.8
        
        local temp_range = a*b/sqrt(b*b*dx*dx/dist2 + a*a*dy*dy/dist2)
        
        local targetDist = dist1to2 - temp_range - target_radius;
         
        if targetDist <= 0 then
            return true
        else
            return false
        end
            
end

-- 根据中心点，以及要生成的数量，确定所有的坐标。目前用来做召唤兵的坐标计算
function math2d.calcPos(centX, centY, count, diff)
    local pos = {{x = centX, y = centY}}
    
    -- 定义召唤出来的怪物的间距
    if not diff then
        diff = 30
    end

    if count == 2 then
        --[[ 
            1    2 
        ]]
        local diffX2 = diff -- 30 -- 50
        pos[1] = {x = centX - diffX2, y = centY}
        pos[2] = {x = centX + diffX2, y = centY}
    elseif count == 3 then
        --[[    
                1
            2       3
        ]]
        local diffX3 = diff -- 30 -- 50
        local diffY3 = diff -- 30 -- 50
        pos[1] = {x = centX,          y = centY + diffY3}
        pos[2] = {x = centX + diffX3, y = centY - diffY3}
        pos[3] = {x = centX - diffX3, y = centY - diffY3}
    elseif count == 4 then
        --[[    
            1    2
            3    4
        ]]
        local diffX4 = diff -- 30 -- 50
        local diffY4 = diff -- 30 -- 50
        pos[1] = {x = centX - diffX4, y = centY + diffY4}
        pos[2] = {x = centX + diffX4, y = centY + diffY4}
        pos[3] = {x = centX - diffX4, y = centY - diffY4}
        pos[4] = {x = centX + diffX4, y = centY - diffY4}
    elseif count == 5 then
        assert(false, "招5个召唤兵，位置还没有计算")
    end
    return pos
end

-- 在[low, high]范围内，取出count个不同的随机数
function math2d.getNRandom(low, high, count)
    local array = {}
    for i = low , high do
        array[i] = i 
    end
    for i = low , high do
        local j = math.random(high - i + 1) + i - 1;
        array[i],array[j] = array[j],array[i]
    end
    -- 取前count个就是随机了
    local result = {}
    for i = 1 , count do
        -- print(" i = "..array[i])
        result[i] = array[i]
    end
    return result
end

-- 求两点的夹角（弧度）
function math2d.radians4point(ax, ay, bx, by)
    return atan2(ay - by, bx - ax)
end

-- 求圆上一个点的位置
function math2d.pointAtCircle(px, py, radians, radius)
    return px + cos(radians) * radius, py - sin(radians) * radius
end

-- 求线段上与指定点距离最近的点
function math2d.pointAtLineToPoint(px, py, ax, ay, bx, by)
    local dx = bx - ax
    local dy = by - ay

    local som = dx * dx + dy * dy
    local u = ((px - ax) * dx + (py - ay) * dy) / som
    if u > 1 then
        u = 1
    elseif u < 0 then
        u = 0
    end

    return ax + u * dx, ay + u * dy
end

-- 角度转换为弧度
function math2d.degrees2radians(degrees)
    return degrees * pi_d_180
end

-- 弧度转换为角度
function math2d.radians2degrees(radians)
    return radians * pi_180_d
end

return math2d
