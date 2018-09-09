
-- 子弹的父类
-- 只处理子弹的飞行轨迹

local math2d          = require("math2d")
local radians4point   = math2d.radians4point
local radians2degrees = math2d.radians2degrees
local degrees2radians = math2d.degrees2radians
local pointAtCircle   = math2d.pointAtCircle
local dist            = math2d.dist

local BulletBase  = require("app.map.bullets.BulletBase")
local BulletType  = require("app.map.bullets.BulletType")
local ObjectState = require("app.map.ObjectState")
local CurvedBulletBase = class("CurvedBulletBase", BulletBase)

function CurvedBulletBase:ctor(source, target, sprite, params)
    CurvedBulletBase.super.ctor(self, source, target, sprite, params.delay)
    self.flyTime_    = checknumber(params.flyTime)
    self.g_          = checknumber(params.g)
    self.isRotation_ = checkbool(params.isRotation)
    self.isRotateSelf_ = checkbool(params.isRotateSelf)
    self.trajectory_ = checknumber(params.trajectory)  -- 子弹的轨迹
end

function CurvedBulletBase:fireBegan()
    -- print("CurvedBulletBase:fireBegan() 1")
    CurvedBulletBase.super.fireBegan(self)
    -- add by Owen, 2015.7.22, 增加target的死亡判定，防止设计进入终点的怪物会报错
    -- 因为回去预判target的位置，进入终点后target.map_就没了，会报错
    -- if self.source_.destroyed_ or self.target_.destroyed_ then
    -- change by Owen, 2016.3.30, 去掉目标死亡的判定，需要朝尸体射击
    if self.source_.destroyed_ then
        return
    end
    -- print("CurvedBulletBase:fireBegan() 2")
    local target = self.target_
    local targetX, targetY
    -- dump(target, "dump CurvedBulletBase:fireBegan() target")
    -- 这里的target是一个table
    if target.hasBehavior and target:hasBehavior("MovableBehavior") and target:isMoving() 
        and (target.curState == ObjectState.MOVE or target.curState == ObjectState.TRACK) then
        targetX, targetY = target:getFuturePosition(self.flyTime_ + self.delay_)
        -- change by Owen, 2015.6.26, 如果是爆炸子弹，超出范围后，
        -- 取两点连线与范围的交点，作为目标位置
        -- add by Owen, 2015.8.4, 增加是否是技能调用的判定，技能调用爆炸子弹不需要考虑超出射程
        if self.weaponConfig.bulletType == BulletType.CANNON and not self.isSkill
            and self.trajectory_ ~= BulletType.CIRCLE then
            local srcX = self.source_.x_ + self.source_.radiusOffsetX_
            local srcY = self.source_.y_ + self.source_.radiusOffsetY_
            local tarX = targetX + target.radiusOffsetX_
            local tarY = targetY + target.radiusOffsetY_
            -- 两个圆圈中心点的距离，减去 target的碰撞检测半径
            local dist = math2d.dist(srcX, srcY, tarX, tarY) --  - target.radius_
            local distX = math.abs(tarX - srcX)
            local distY = math.abs(tarY - srcY)
            local fireRange = self.source_.fireRange_
            -- 子弹要超出范围了 
            -- print("distY 1 = "..tostring(distY))
            if dist > fireRange or distX > fireRange or distY > (fireRange*0.8) then
                -- print("distY 2 = "..tostring(distY))
                local radian = math2d.radians4point(srcX, srcY, tarX, tarY)
                targetX, targetY =  math2d.pointAtCircle(srcX, srcY, radian, self.source_.fireRange_)
                targetY = srcY + (targetY - srcY) * 0.8
            end
        end
    else
        targetX, targetY = target.x_, target.y_
    end
    targetX = targetX + target.radiusOffsetX_ + target.hitOffsetX_
    targetY = targetY + target.radiusOffsetY_ + target.hitOffsetY_

    -- -- 子弹会落在目标中心点的一定范围内
    -- local radius = target.radius_
    -- local offset = radius * (math.random(0, 70) / 100) * 0.7  -- *0.7是新加的
    -- if math.random(1, 2) % 2 == 0 then
    --     targetX = targetX + offset
    -- else
    --     targetX = targetX - offset
    -- end
    -- offset = radius * (math.random(0, 70) / 100) * 0.7
    -- if math.random(1, 2) % 2 == 0 then
    --     targetY = targetY + offset * 0.5
    -- else
    --     targetY = targetY - offset * 0.5
    -- end

    -- print("子弹开始飞行，目标位置 x = "..targetX.." y = "..targetY)

    self.targetX_    = targetX
    self.targetY_    = targetY
    self.timeOffset_ = self.delay_
    local ft = self.flyTime_
    self.offsetX_    = (self.targetX_ - self.startX_) / ft
    -- self.offsetY_ = ((self.targetY_ - self.startY_) - ((self.g_ * ft) * (ft / 2))) / ft

    if self.trajectory_ == BulletType.STRAIGHT then
        -- 直线轨迹的Y轴速度
        self.offsetY_ = (self.targetY_ - self.startY_)  / ft
    elseif self.trajectory_ == BulletType.PARABOLA then
        -- 抛物线轨迹的Y轴速度
        self.offsetY_ = ((self.targetY_ - self.startY_) - ((self.g_ * ft) * (ft / 2))) / ft
    elseif self.trajectory_ == BulletType.CIRCLE then
        -- 转圈跟踪轨迹的Y轴速度,只在往上飞的时候用到
        self.offsetY_ = 100
        -- 跟踪子弹要转圈
        self.isRotation_ = true
    end

    self.sprite_:setPosition(self.startX_, self.startY_)
end

function CurvedBulletBase:tickBullet(dt)
    -- 飞行的总时间，减去，延迟的时间
    -- local time = self.time_ - self.timeOffset_
    -- chang by Owen, 2016.4.1, 把延迟时间定义为子弹已经在飞行了，但是还没有显示出来
    local time = self.time_ + self.timeOffset_

    local x = self.startX_ + time * self.offsetX_
    local y
    -- local y = self.startY_ + time * self.offsetY_ + self.g_ * time * time / 2
    if self.trajectory_ == BulletType.STRAIGHT then
        -- 直线轨迹
        y = self.startY_ + time * self.offsetY_
    elseif self.trajectory_ == BulletType.PARABOLA then
        -- 抛物线轨迹
        y = self.startY_ + time * self.offsetY_ + self.g_ * time * time / 2
    elseif self.trajectory_ == BulletType.CIRCLE then
        -- 转圈跟踪轨迹
        local flyUpTime     = 0.5   -- 往上飞的时间
        local circleTime    = 1.5   -- 转圈的时间， 包含了往上飞的时间
        local smoothTime    = 0.3   -- 从转圈转为跟踪子弹的过渡时间
        local circleRation  = 80    -- 转圈的半径
        local circleSpeed   = 1.5*math.pi/1  -- 转圈速度，3秒转0.75圈
        if time < flyUpTime then
            -- 先往上飞一段距离, 飞行flyUpTime秒
            x = self.startX_
            y = self.startY_ + time * self.offsetY_
        elseif time < circleTime then
            -- 转圈 circleTime - flyUpTime 秒
            -- 半径circleRation做圆周运动
            -- 转的速度为2*math.pi/2, 2秒转1圈, 初始位置为 (-pi/2) 也就是圆的最左边点
            -- ox, oy以(0,0)为圆心转圈时，需要移动的距离，初始设在最左边的点
            -- 然后用当前子弹的位置作为最左边的点, 也就是ox + circleRation，ox == -80
            -- local radians = 2*math.pi* (time - 1.0) - math.pi/2
            if self.targetX_ > self.startX_ then
                -- 在左边转圈，从最低点发射出去
                local radians = - circleSpeed * (time - flyUpTime) + 2*math.pi -- math.pi* (time - flyUpTime) - math.pi
                local ox, oy = math2d.pointAtCircle(0, 0, radians, circleRation)
                x = self.startX_ + ox - circleRation
                y = self.startY_ + flyUpTime * self.offsetY_ + oy
            else
                -- 在右边转圈，从最低点发射出去
                local radians = circleSpeed * (time - flyUpTime) - math.pi -- math.pi* (time - flyUpTime) - math.pi
                local ox, oy = math2d.pointAtCircle(0, 0, radians, circleRation)
                x = self.startX_ + ox + circleRation
                y = self.startY_ + flyUpTime * self.offsetY_ + oy
            end
            -- print("self.prevX_, self.prevY_ 1 = "..self.prevX_..", "..self.prevY_
            --     .."x, y = "..x..", "..y)
        -- elseif time < circleTime + smoothTime then

        else
            -- 要在圆圈的最点点发射出去
            local beginX
            if self.targetX_ > self.startX_ then
                -- 打右边的目标，从左边的最低点发射出去
                beginX = self.startX_ - circleRation
            else
                -- 打左边的目标，从右边的最低点发射出去
                beginX = self.startX_ + circleRation
            end
            local beginY = self.startY_ + flyUpTime * self.offsetY_ - circleRation

            local speedX = (self.targetX_ - beginX)/(self.flyTime_ - circleTime) 
            local speedY = (self.targetY_ - beginY)/(self.flyTime_ - circleTime)
            -- print("beginX = "..beginX.." beginY = "..beginY.." speedX = "..speedX.." speedY = "
            --     ..speedY.." targetX_ = "..self.targetX_.." targetY_ = "..self.targetY_)
            
            x = beginX + (time - circleTime)*speedX
            y = beginY + (time - circleTime)*speedY

            -- print("self.prevX_, self.prevY_ 2 = "..self.prevX_..", "..self.prevY_
            --     .."x, y = "..x..", "..y)

        end
    end
    self.sprite_:setPosition(x, y)


    if self.isRotation_ and not self.isRotateSelf_ then
        local degrees = radians2degrees(radians4point(self.prevX_, self.prevY_, x, y))
        self.prevX_, self.prevY_ = x, y
        self.sprite_:setRotation(degrees)
    end
    -- 子弹本身旋转
    if self.isRotateSelf_ then
        local degree = 10*self.time_ * 100
        -- print("子弹本身旋转 degree = "..tostring(degree))
        self.sprite_:setRotation(degree)
    end

    if time >= self.flyTime_ then
        self.over_ = true
        -- change by Owen, 飞行结束了，判定是否命中
        -- change by Owen, 2015.7.9, 只有射击子弹需要飞行结束后判定是否命中了
        if self.weaponConfig.bulletType == BulletType.ARROW then
            self:checkHit()
        else
            self:hit()
        end
    end
end

return CurvedBulletBase
