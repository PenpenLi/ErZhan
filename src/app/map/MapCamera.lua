
local math2d = require("math2d")
local MapConstants = require("app.map.MapConstants")
local GlobalData   = require("tools.GlobalData")

local MapCamera = class("MapCamera")

-- add by Owen, 2016.6.12, 每一关开始的时候需要移动地图到对应位置
local MapPos_Left       = 1
local MapPos_Right      = 2
local MapPos_Down       = 3
local MapPos_UP         = 4
local MapPos_Left_Down  = 5
local MapPos_Left_Up    = 6
local MapPos_Right_Down = 7
local MapPos_Right_Up   = 8

function MapCamera:ctor(map)
    -- print("MapCamera:ctor")
    self.map_           = map

    self.zooming_       = false
    self.scale_         = 1
    self.actualScale_   = 1
    self.offsetX_       = 0
    self.offsetY_       = 0
    self.offsetLimit_   = nil
    self.margin_        = {top = 0, right = 0, bottom = 0, left = 0}
    self.enableIgnoredMove_ = false

    local width, height = map:getSize()
    local minScaleV     = display.height / height
    local minScaleH     = display.width / width
    
    local minScaleV     = display.widthInPixels  / width
    local minScaleH     = display.heightInPixels / height

    local minScale      = minScaleV

    if minScaleH > minScale then minScale = minScaleH end
    self.minScale_ = minScale

    -- add by Owen, 2015.11.27, 把最小缩放改为1, 那么就可以在6P上面截图给美术了
    -- self.minScale_ = 1

    -- 如果地图需要放大，那么战斗UI也需要放大
    if minScale > 1 then
        GLOBAL_FIGHT_UI_SCALE = minScale
    end
    -- print("GLOBAL_FIGHT_UI_SCALE = "..GLOBAL_FIGHT_UI_SCALE)

end

--[[--

返回地图的边空

]]
function MapCamera:getMargin()
    return clone(self.margin_)
end

--[[--

设置地图卷动的边空

]]
function MapCamera:setMargin(top, right, bottom, left)
    -- print("MapCamera:setMargin top = "..tostring(top)
    --     .." right = "..tostring(right)
    --     .." bottom = "..tostring(bottom)
    --     .." left = "..tostring(left))
    if self.zooming_ then return end

    if type(top)    == "number" then self.margin_.top = top end
    if type(right)  == "number" then self.margin_.right = right end
    if type(bottom) == "number" then self.margin_.bottom = bottom end
    if type(left)   == "number" then self.margin_.left = left end
    self:resetOffsetLimit()
end

--[[--

返回地图当前的缩放比例

]]
function MapCamera:getScale()
    return self.scale_
end

--[[--

设置地图当前的缩放比例

]]
-- 在EditorScene:playMap() 和 MapRuntime:restart 中，会调用MapCamera:setScale(1)
-- 传入的倍数都是1，但在MapCamera:ctor()中会计算GLOBAL_FIGHT_UI_SCALE = minScale
function MapCamera:setScale(scale)
    if self.zooming_ then return end
    -- print("MapCamera:setScale(scale) scale = "..tostring(scale)
    --     .." self.minScale_ = "..tostring(self.minScale_))
    self.scale_ = scale
    if scale < self.minScale_ then scale = self.minScale_ end
    self.actualScale_ = scale
    self:resetOffsetLimit()
    self:setOffset(self.offsetX_, self.offsetY_)

    -- backgroundLayer是地图中的背景图片
    local backgroundLayer = self.map_:getBackgroundLayer()
    local batchLayer      = self.map_:getBatchLayer()
    local marksLayer      = self.map_:getMarksLayer()
    local debugLayer      = self.map_:getDebugLayer()

    backgroundLayer:setScale(scale)-- * 2)
    batchLayer:setScale(scale)
    marksLayer:setScale(scale)
    if debugLayer then debugLayer:setScale(scale) end

    

    -- add by Owen, 2016.6.12, 每一关开始的时候需要移动地图到对应位置
    local gameLv = GlobalData.getGameLv()
    if gameLv == 1 or gameLv == 3 or gameLv == 4 or gameLv == 7 
        or gameLv == 9 or gameLv == 11 or gameLv == 12 then
        -- 右下
        self:moveMapTo(MapPos_Right_Down)
    elseif gameLv == 2 or gameLv == 8 or gameLv == 14 then
        -- 左下
        self:moveMapTo(MapPos_Left_Down)
    elseif gameLv == 5 then
        -- 左中
        self:moveMapTo(MapPos_Left)
    elseif gameLv == 6 then
        -- 右中
        self:moveMapTo(MapPos_Right)
    elseif gameLv == 10 then
        -- 左上
        self:moveMapTo(MapPos_Left_Up)
    elseif gameLv == 13 or gameLv == 15 then
        -- 右上
        self:moveMapTo(MapPos_Right_Up)
    end

end

--[[--

动态调整摄像机的缩放比例

]]
function MapCamera:zoomTo(scale, x, y)
    -- print("MapCamera:zoomTo scale = "..tostring(scale).." x = "..tostring(x).." y = "..tostring(y))
    self.zooming_ = true
    self.scale_ = scale
    if scale < self.minScale_ then scale = self.minScale_ end
    self.actualScale_ = scale
    self:resetOffsetLimit()

    local backgroundLayer = self.map_:getBackgroundLayer()
    local batchLayer      = self.map_:getBatchLayer()
    local marksLayer      = self.map_:getMarksLayer()
    local debugLayer      = self.map_:getDebugLayer()

    transition.removeAction(self.backgroundLayerAction_)
    transition.removeAction(self.batchLayerAction_)
    transition.removeAction(self.marksLayerAction_)
    if debugLayer then
        transition.stopTarget(debugLayer)
    end

    self.backgroundLayerAction_ = transition.scaleTo(backgroundLayer, {scale = scale, time = MapConstants.ZOOM_TIME})
    self.batchLayerAction_ = transition.scaleTo(batchLayer, {scale = scale, time = MapConstants.ZOOM_TIME})
    self.marksLayerAction_ = transition.scaleTo(marksLayer, {scale = scale, time = MapConstants.ZOOM_TIME})
    if debugLayer then
        transition.scaleTo(debugLayer, {scale = scale, time = MapConstants.ZOOM_TIME})
    end

    if type(x) ~= "number" then return end

    if x < self.offsetLimit_.minX then
        x = self.offsetLimit_.minX
    end
    if x > self.offsetLimit_.maxX then
        x = self.offsetLimit_.maxX
    end
    if y < self.offsetLimit_.minY then
        y = self.offsetLimit_.minY
    end
    if y > self.offsetLimit_.maxY then
        y = self.offsetLimit_.maxY
    end

    self.offsetX_, self.offsetY_ = x, y

    transition.moveTo(backgroundLayer, {
        x = x,
        y = y,
        time = MapConstants.ZOOM_TIME,
        onComplete = function()
            self.zooming_ = false
        end
    })
    transition.moveTo(batchLayer, {x = x, y = y, time = MapConstants.ZOOM_TIME})
    transition.moveTo(marksLayer, {x = x, y = y, time = MapConstants.ZOOM_TIME})
    if debugLayer then
        transition.moveTo(debugLayer, {x = x, y = y, time = MapConstants.ZOOM_TIME})
    end
end

--[[--

返回地图当前的卷动偏移量

]]
function MapCamera:getOffset()
    -- print("MapCamera:getOffset")
    return self.offsetX_, self.offsetY_
end

-- add by Owen, 2016.4.24, 增加第一关的技能引导，点击完技能以后把地图移动到右下角
function MapCamera:moveToRightDown()
    self:setOffset(self.offsetLimit_.minX, self.offsetLimit_.maxY)
end

-- add by Owen, 2016.6.12, 增加每一关开始的时候，把地图移动到对应的
function MapCamera:moveMapTo(index)
    -- print("MapCamera:moveMapTo index = "..tostring(index))
    -- self:setOffset(self.offsetLimit_.minX, self.offsetLimit_.maxY)
    if index == MapPos_Left then
        -- 左
        self:setOffset(self.offsetLimit_.maxX, (self.offsetLimit_.maxY 
            - self.offsetLimit_.minY)/2)
    elseif index == MapPos_Right then
        -- 右
        self:setOffset(self.offsetLimit_.minX, (self.offsetLimit_.maxY 
            - self.offsetLimit_.minY)/2)
    elseif index == MapPos_Down then
        -- 下
        self:setOffset((self.offsetLimit_.maxX - self.offsetLimit_.minX)/2, 
            self.offsetLimit_.maxY)
    elseif index == MapPos_UP then
        -- 上
        self:setOffset((self.offsetLimit_.maxX - self.offsetLimit_.minX)/2, 
            self.offsetLimit_.minY)
    elseif index == MapPos_Left_Down then
        -- 左下
        self:setOffset(self.offsetLimit_.maxX, self.offsetLimit_.maxY)
    elseif index == MapPos_Left_Up then
        -- 左上
        self:setOffset(self.offsetLimit_.maxX, self.offsetLimit_.minY)
    elseif index == MapPos_Right_Down then
        -- 右下
        -- print("移动地图到右下角")
        self:setOffset(self.offsetLimit_.minX, self.offsetLimit_.maxY)
    elseif index == MapPos_Right_Up then
        -- 右上
        self:setOffset(self.offsetLimit_.minX, self.offsetLimit_.minY)
    end

end

--[[--

设置地图卷动的偏移量

]]
function MapCamera:setOffset(x, y, movingSpeed, onComplete)
    -- print("MapCamera:setOffset x = "..tostring(x).." y = "..tostring(y)
    --     .." movingSpeed = "..tostring(movingSpeed).." onComplete = "..tostring(onComplete)
    --     .." self.zooming_ = "..tostring(self.zooming_)
    --     .." self.offsetLimit_.minX = "..tostring(self.offsetLimit_.minX)
    --     .." self.offsetLimit_.maxX = "..tostring(self.offsetLimit_.maxX)
    --     )
    if self.zooming_ then return end

    if x < self.offsetLimit_.minX then
        x = self.offsetLimit_.minX
    end
    if x > self.offsetLimit_.maxX then
        x = self.offsetLimit_.maxX
    end
    if y < self.offsetLimit_.minY then
        y = self.offsetLimit_.minY
    end
    if y > self.offsetLimit_.maxY then
        y = self.offsetLimit_.maxY
    end

    self.offsetX_, self.offsetY_ = x, y



    if type(movingSpeed) == "number" and movingSpeed > 0 then
        transition.stopTarget(self.bgSprite_)
        transition.stopTarget(self.batch_)
        transition.stopTarget(self.marksLayer_)
        if self.debugLayer_ then
            transition.stopTarget(self.debugLayer_)
        end

        local cx, cy = self.bgSprite_:getPosition()
        local mtx = cx / movingSpeed
        local mty = cy / movingSpeed
        local movingTime
        if mtx > mty then
            movingTime = mtx
        else
            movingTime = mty
        end

        transition.moveTo(self.bgSprite_, {
            x = x,
            y = y,
            time = movingTime,
            onComplete = onComplete
        })
        transition.moveTo(self.batch_, {x = x, y = y, time = movingTime})
        transition.moveTo(self.marksLayer_, {x = x, y = y, time = movingTime})
        if self.debugLayer_ then
            transition.moveTo(self.debugLayer_, {x = x, y = y, time = movingTime})
        end
    else
        self.map_:getBackgroundLayer():setPosition(x, y)
        self.map_:getBatchLayer():setPosition(x, y)
        self.map_:getMarksLayer():setPosition(x, y)
        local debugLayer = self.map_:getDebugLayer()
        if debugLayer then debugLayer:setPosition(x, y) end
    end
end

--[[--

移动指定的偏移量

]]
function MapCamera:moveOffset(offsetX, offsetY)
    -- print("MapCamera:moveOffset offsetX = "..tostring(offsetX))
    -- 当不禁止移动时，才可以移动地图的位置
    if self.enableIgnoredMove_ == false then
        self:setOffset(self.offsetX_ + offsetX, self.offsetY_ + offsetY)
    end
end

--[[--

返回地图的卷动限制

]]
function MapCamera:getOffsetLimit()
    -- print("MapCamera:getOffsetLimit")
    return clone(self.offsetLimit_)
end

-- 设置地图禁止拖动
function MapCamera:enableIgnoredMove(flag)
    -- print("MapCamera:enableIgnoredMove flag = "..tostring(flag))
    self.enableIgnoredMove_ = flag
end

--[[--

更新地图的卷动限制

]]
function MapCamera:resetOffsetLimit()
    local mapWidth, mapHeight = self.map_:getSize()
    self.offsetLimit_ = {
        minX = display.width - self.margin_.right - mapWidth * self.actualScale_,
        maxX = self.margin_.left,
        minY = display.height - self.margin_.top - mapHeight * self.actualScale_,
        maxY = self.margin_.bottom,
    }
end

--[[--

将屏幕坐标转换为地图坐标

]]
function MapCamera:convertToMapPosition(x, y)
    -- print("x = "..x.." y = "..y.." self.offsetX_ = "..self.offsetX_.." self.actualScale_ = "..self.actualScale_.." self.offsetY_ = "..self.offsetY_)
    return (x - self.offsetX_) / self.actualScale_, (y - self.offsetY_) / self.actualScale_
end

--[[--

将地图坐标转换为屏幕坐标

]]
function MapCamera:convertToWorldPosition(x, y)
    return x * self.actualScale_ + self.offsetX_, y * self.actualScale_ + self.offsetY_
end

--[[--

将指定的地图坐标转换为摄像机坐标

]]
function MapCamera:convertToCameraPosition(x, y)
    local left = -(x - (display.width - self.margin_.left - self.margin_.right) / 2)
    local bottom = -(y - (display.height - self.margin_.top - self.margin_.bottom) / 2)
    return left, bottom
end

return MapCamera
