
local StaticObjectsProperties = require("app.properties.StaticObjectsProperties")
local RangeObjectsProperties  = require("app.properties.RangeObjectsProperties")
local EditorConstants         = require("editor.EditorConstants")
local SpineAni                = require("app.map.spine.SpineAni")

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
    self.flipSprite_ = flipSprite
end

function StaticObject:getView()
    return self.sprite_
end

function StaticObject:createView(batch, marksLayer, debugLayer)
    -- print("StaticObject:createView ")
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
        if self.mainID_ == "100401" then
            display.addSpriteFrames("HalloweenLycan.plist","HalloweenLycan.png")
            local sprite = display.newSprite("#HalloweenLycan_1.png")
            self.sprite_ = sprite
            sprite:align(display.CENTER,display.cx,display.cy)
            -- sprite:setScale(2)
            
            local frames = display.newFrames("HalloweenLycan_%d.png",1,12)
            local animation = display.newAnimation(frames, 0.1) --  0.5/2)     --0.5s里面播放2帧
            sprite:playAnimationForever(animation)
        else
            self.sprite_ = display.newSprite(imageName)
        end
                


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
    batch:addChild(self.sprite_,EditorConstants.STATIC_OBJECT_ZORDER)
    
end

function StaticObject:playAni(name, isForerer, forceStop, eventFunc, finishFunc)
    if not string.find(self.imageName_, "png") then
        self.sprite_:playAni(name, isForerer, forceStop, eventFunc, finishFunc)
    else
        if eventFunc then
            eventFunc()
        end
        if finishFunc then
            finishFunc()
        end
    end
end

function StaticObject:getCurrentAniName(index)
    if not string.find(self.imageName_, "png") then
        return self.sprite_:getCurrentAniName(index)
    else
        return ""
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
    sprite:setFlippedX(self.flipSprite_)
end

function StaticObject:fastUpdateView()
    if not self.updated__ then return end
    local sprite = self.sprite_
    if sprite then
        sprite:setPosition(self.x_ + self.offsetX_, self.y_ + self.offsetY_)
        sprite:setFlippedX(self.flipSprite_)
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
