
local FrameAniCache = require("app.map.spine.FrameAniCache")

-- 播放帧动画类

local FrameAni = class("FrameAni", function()
    return display.newNode()
end)

function FrameAni:ctor(mainID, fileName)
    -- print("FrameAni 1 fileName = "..tostring(fileName))
    -- print("mainID = "..mainID)
    self.mainID = mainID

    -- 测试根据配置而文件来生成帧动画
    local sprite = display.newSprite("#"..mainID.."-Idle_0.png")
    
    local aniData   = require("app.animation.Ani_"..tostring(mainID))
    self.aniData    = aniData
    dump(aniData, "dump aniData 配置的动画数据文件")

    -- local frames    = {}    -- 最终用来生成动画的所有的frame
    -- local allFrames = aniData.Move_Side.frames    -- 配置的帧顺序
    -- local frameName     -- 每一帧的名字
    -- for i = 1, #allFrames do
    --     -- print("test all img frames i = "..tostring(i))
    --     frameName = "minotaur_"..tostring(i)..".png"
    --     frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
    -- end
    -- local animation = display.newAnimation(frames, aniData.Move_Side.intervalTime) --  0.5/2)    
    -- sprite:playAnimationForever(animation, 0)
    -- -- sprite:playAnimationOnce(animation)

    self.currentAniName = ""    -- 记录当前正在播放的动画的名字

    self:addChild(sprite)
    self.animation = sprite

    -- sprite:setPosition(x, y)
    -- self.sprite_ = sprite

    do
        return
    end

end


function FrameAni:getContentSize()
    local size = self.animation:getContentSize()
    return size
end

function FrameAni:setScale(scale)
    self.animation:setScale(scale)
end

function FrameAni:removeSelf()
    self.animation:removeSelf()
    self.animation = nil
    self:removeFromParent()
end

-- 修改图片纹理
function FrameAni:setTexture(name)
    -- assert(false)
    -- print("error 修改帧动画的纹理，或许是想要修改动画的皮肤")
end

function FrameAni:changeOpacity(value)
    self.animation:setOpacity(value)
end

function FrameAni:isFlipSprite()
    return self.flipSprite
end

function FrameAni:setFlipSprite(flipSprite)
    self.flipSprite = flipSprite
end

function FrameAni:getView()
    return self.animation
end


-- 设置是否左右翻转
function FrameAni:setFlippedX(flipSprite)
    if flipSprite then
        self.animation:setRotationSkewY(180)
    else
        self.animation:setRotationSkewY(0)
    end
end

function FrameAni:createView(batch, marksLayer, debugLayer)

end

function FrameAni:removeView()

end

-- 获得当前正在播放的动画的名字
function FrameAni:getCurrentAniName(index)
    return self.currentAniName
    -- return self.animation:getCurrentAniName(index)
end

-- 帧动画要获得当前播放到第几帧了
function FrameAni:getCurrentFrameIndex()
    return self.animation._animate:getCurrentFrameIndex()
end

-- forceStop 表示是否强制中断之前的动画
function FrameAni:playAni(name, isForever, forceStop, eventFunc, finishFunc, startFunc, object)

    -- print("FrameAni:playAni currentAniName = "..tostring(self.currentAniName)
    --     .." newAniName = "..tostring(name).." isForever = "..tostring(isForever)
    --     .." forceStop = "..tostring(forceStop).." eventFunc = "..tostring(eventFunc)
    --     .." finishFunc = "..tostring(finishFunc).." object.mainID_ = "..tostring(object.mainID_))


    -- self.animation:playAnimationOnce(display.getAnimationCache(object.mainID_..tostring("Skill_01")),
    --     false, finishFunc)



    -- 如果现在已经在播放这个名字了，那么直接返回
    if name == self.currentAniName then
        return
    else
        self.animation:stopAllActions()
    end

    self.currentAniName = name


    -- 从缓存中获得帧动画
    local animation = FrameAniCache.getFrameAniCache(object.mainID_, name)

    if animation then
        -- if forceStop then 
        --     self.animation:pause()
        --     -- self.animation:setToSetupPose()
        -- end
        if isForever then
            self.animation:playAnimationForever(animation, 0)

            -- self.animation:playAnimationForever(display.getAnimationCache(tostring(object.mainID_)..name))
        else
            self.animation:playAnimationOnce(animation, false, finishFunc)

            -- self.animation:playAnimationOnce(display.getAnimationCache(object.mainID_..name), false, finishFunc)
        end

        -- if forceStop then 
        --     self.animation:resume()
        -- end
    end

    -- 处理帧动画的帧事件, fireFrameIndex表示第几帧触发帧事件
    local aniConfig      = self.aniData[name]
    if aniConfig then

        -- print("记录动画的帧事件")
        -- 记录这个物体当前播放的帧动画，是否有需要触发帧事件的帧
        object._fireFrameIndexs  = aniConfig.fireFrame     -- 记录需要触发的事件帧table
        object._firedFrameCount  = 0                       -- 记录总共触发了几个事件
        object._aniEventFunc     = eventFunc               -- 记录帧事件回调函数
        object._finishEventFunc  = finishFunc              -- 记录动画结束事件回调函数
        dump(object._fireFrameIndexs, "dump object._fireFrameIndexs")
    else
        -- print("删除动画的帧事件")
        object._fireFrameIndexs  = nil
        object._firedFrameCount  = 0
        object._aniEventFunc     = nil
    end
    
end


return FrameAni
