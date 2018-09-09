
local StaticObjectsProperties = require("app.properties.StaticObjectsProperties")
local RangeObjectsProperties  = require("app.properties.RangeObjectsProperties")
local EditorConstants         = require("editor.EditorConstants")
local MapConstants            = require("app.map.MapConstants")
local SpineAni                = require("app.map.spine.SpineAni")
local FrameAni                = require("app.map.spine.FrameAni")
local CsbAni                  = require("app.map.spine.CsbAni")

local ObjectBase = require("app.map.ObjectBase")
local StaticObject = class("StaticObject", ObjectBase)

function StaticObject:ctor(id, state, map)
    assert(state.defineId ~= nil, "StaticObject:ctor() - invalid state.defineId")
    local define = StaticObjectsProperties.get(state.defineId)
    -- 如果取不到的话，再到RangeObjectProperties.lua文件中去取
    if not define then
        define = RangeObjectsProperties.get(state.defineId)
    end
    for k, v in pairs(define) do
        if state[k] == nil then
            state[k] = v
        end
    end
    StaticObject.super.ctor(self, id, state, map)

    self.radiusOffsetX_ = checkint(self.radiusOffsetX_)
    self.radiusOffsetY_ = checkint(self.radiusOffsetY_)
    self.radius_        = checkint(self.radius_)
    self.flipSprite_    = checkbool(self.flipSprite_)
    self.visible_       = true
    self.valid_         = true
    self.sprite_        = nil
    self.spriteSize_    = nil
end

function StaticObject:getDefineId()
    return self.defineId_
end

function StaticObject:getRadius()
    return self.radius_
end

function StaticObject:isFlipSprite()
    return self.flipSprite_
end

function StaticObject:setFlipSprite(flipSprite)
    -- 大天使的动画做成了9点钟的方向，需要做这么一个判定
    if self.mainID_ == "110203" then
        if flipSprite then
            flipSprite = false
        else
            flipSprite = true
        end
    end
    self.flipSprite_ = flipSprite
    self.sprite_:setFlippedX(flipSprite)
end

function StaticObject:getView()
    return self.sprite_
end

function StaticObject:createView(batch, marksLayer, debugLayer)
    -- print("StaticObject:createView ")



    -- local beginTime = socket.gettime()
    -- local oriBegin  = beginTime

    StaticObject.super.createView(self, batch, marksLayer, debugLayer)


    local imageName
    if self.framesName_ then
        local frames = display.newFrames(self.framesName_, self.framesBegin_, self.framesLength_)
        self.sprite_ = display.newSprite(frames[1])
        self.sprite_:playAnimationForever(display.newAnimation(frames, self.framesTime_))
    else
        imageName = self.imageName_
        if type(imageName) == "table" then
            imageName = imageName[1]
        end
    end

    -- 如果配置文件中形象有png，则表示还是一张图片
    if string.find(imageName, "png") then
        -- if self.mainID_ == "100401" then
        --     display.addSpriteFrames("HalloweenLycan.plist","HalloweenLycan.png")
        --     local sprite = display.newSprite("#HalloweenLycan_1.png")
        --     self.sprite_ = sprite
        --     sprite:align(display.CENTER,display.cx,display.cy)
        --     -- sprite:setScale(2)
            
        --     local frames = display.newFrames("HalloweenLycan_%d.png",1,12)
        --     local animation = display.newAnimation(frames, 0.1) --  0.5/2)     --0.5s里面播放2帧
        --     sprite:playAnimationForever(animation)
        -- else

            -- if string.find(imageName, "monster") and not string.find(imageName, "-") then
                self.sprite_ = display.newSprite(imageName)
            -- end
        -- end
    elseif string.find(imageName, "pvr") then
        -- 配置中没有 -3 的话，则表示这个角色已经打包成一个帧动画了
        self.sprite_ = FrameAni.new(self.mainID_, imageName)
    elseif string.find(imageName, "csb") then
        self.sprite_ = CsbAni.new(self.mainID_, imageName)
    else
        self.sprite_ = SpineAni.new(self.mainID_, imageName)
    end

    local size = self.sprite_:getContentSize()
    self.spriteSize_ = {size.width, size.height}

    if self.scale_ then
        self.sprite_:setScale(self.scale_)
    end


    -- TO-DO,在1024大小的地图上，地图数据缩放了一半，但是里面的元素要放大
    -- self.sprite_:setScale(2)
    -- batch:addChild(self.sprite_)
    
    -- add by Owen, 2016.4.18, 如果是类型1的打野元素，且是图片，则表示是用来遮挡的
    -- 需要添加到 maskLayer 层
    if self.rangeType_ and self.rangeType_ == MapConstants.DAYE_RANGE 
        and self.dayeType_ == MapConstants.DAYE_TYPE_ONE 
        and string.find(imageName, "png") then
        marksLayer:addChild(self.sprite_,EditorConstants.STATIC_OBJECT_ZORDER)
    else
        batch:addChild(self.sprite_,EditorConstants.STATIC_OBJECT_ZORDER)
    end

    -- local endTime = socket.gettime()
    -- print("StaticObject:createView 耗时 3 = "..(endTime - beginTime))
    
    -- print("StaticObject:createView 整个函数耗时 = "..(endTime - oriBegin))

end

-- function StaticObject:tick(dt)
--     -- body
-- end

function StaticObject:playAni(name, isForerer, forceStop, eventFunc, finishFunc)
    if not string.find(self.imageName_, "png") then
        self.sprite_:playAni(name, isForerer, forceStop, eventFunc, finishFunc, nil, self)
    -- elseif not string.find(self.imageName_, "-") then
    --     self.sprite_:playAni(name, isForerer, forceStop, eventFunc, finishFunc, nil, self)
    else
        if eventFunc then
            eventFunc()
        end
        if finishFunc then
            finishFunc()
        end
    end
end

-- add by Owen, 2016.4.16, 增加动画的暂停，游戏暂停以后，动画也需要暂停
function StaticObject:pause()
    if not string.find(self.imageName_, "png") then
        self.sprite_:pause()
    end
end

-- add by Owen, 2016.4.16, 增加csb动画暂停后继续播放
function StaticObject:resume()
    if not string.find(self.imageName_, "png") then
        self.sprite_:resume()
    end
end

function StaticObject:getCurrentAniName(index)
    if not string.find(self.imageName_, "png") then
        return self.sprite_:getCurrentAniName(index)
    else
        return ""
    end
end

-- 帧动画要获得当前播放到第几帧了
function StaticObject:getCurrentFrameIndex()
    if not string.find(self.imageName_, "pvr") then
        return 0
    else
        return self.sprite_:getCurrentFrameIndex()
    end
end

function StaticObject:removeView()
    if not self.sprite_ then
        return
    end

    self.sprite_:removeSelf()
    self.sprite_ = nil
    StaticObject.super.removeView(self)
end

-- 塔升级以后，修改显示的图片
function StaticObject:changeView(imageName)
    if not self.sprite_ then
        return
    end
    -- 这个函数的参数是一张图片的名字
    self.sprite_:setTexture(imageName)
    -- 这个函数的参数是一个大的png里面的一小个图片的名字,且前面有#号
    -- self.sprite_:setSpriteFrame(imageName)
end

-- 修改图片的透明属性
function StaticObject:changeOpacity(value)
    if not self.sprite_ then
        return
    end
    -- 这个函数的参数是一张图片的名字
    self.sprite_:setOpacity(value)
end

function StaticObject:updateView()
    if not self.sprite_ then
        return
    end

    local sprite = self.sprite_
    sprite:setPosition(math.floor(self.x_ + self.offsetX_), math.floor(self.y_ + self.offsetY_))
    -- sprite:setFlippedX(self.flipSprite_)
end

function StaticObject:fastUpdateView()
    -- if not self.updated__ then return end
    local sprite = self.sprite_
    if sprite then
        sprite:setPosition(self.x_ + self.offsetX_, self.y_ + self.offsetY_)
        -- sprite:setFlippedX(self.flipSprite_)
    end
end

function StaticObject:isVisible()
    return self.visible_
end

function StaticObject:setVisible(visible)
    self.sprite_:setVisible(visible)
    self.visible_ = visible
    -- change by Owen, 2015.7.13, 同时修改血条的可见性
    if self.hpSprite_ then
        self.hpSprite_:setVisible(visible)
    end
    if self.hpOutlineSprite_ then
        self.hpOutlineSprite_:setVisible(visible)
    end
end

function StaticObject:preparePlay()
end

function StaticObject:vardump()
    local state = StaticObject.super.vardump(self)
    state.defineId    = self.defineId_
    state.flipSprite  = self.flipSprite_
    return state
end

return StaticObject
