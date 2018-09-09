
local SpineCache = require("app.map.spine.SpineCache")
local ObjectState = require("app.map.ObjectState")

-- 播放Spine 动画

local SpineAni = class("SpineAni", function()
    return display.newNode()
end)

function SpineAni:ctor(mainID, fileName)
    -- print("SpineAni 1 fileName = "..tostring(fileName))

    -- self.animation = sp.SkeletonAnimation:create(fileName..".json", fileName..".atlas", 1.0)
    -- print("mainID = "..mainID)
    local skeletonData = SpineCache.getSpineCache(mainID)
    -- print("skeletonData = "..tostring(skeletonData))

    self.animation = sp.SkeletonAnimation:createWithData(skeletonData)

    self.animation:setAnimation(0, "Idle", true)   
    -- print("data = "..tostring(data))
    -- self.animation:setScale(0.75)
    -- print("SpineAni 2")

    self:addChild(self.animation)

end

-- add by Owen, 2016.4.16, 增加csb动画的暂停，游戏暂停以后，动画也需要暂停
function SpineAni:pause()
    self.animation:pause()
end

-- add by Owen, 2016.4.16, 增加csb动画暂停后继续播放
function SpineAni:resume()
    self.animation:resume()
end

function SpineAni:getContentSize()
    local size = self.animation:getContentSize()
    return size
end

function SpineAni:setScale(scale)
    self.animation:setScale(scale)
end

function SpineAni:removeSelf()
    -- print("SpineAni:removeSelf()")
    -- add by Owen, 2016.1.19, 如果是forceStop，那么需要移除掉所有的监听事件
    self.animation:unregisterSpineEventHandler(sp.EventType.ANIMATION_EVENT)
    self.animation:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)
    self.animation:removeSelf()
    self.animation = nil
    self:removeFromParent()
end

-- 修改图片纹理
function SpineAni:setTexture(name)
    -- assert(false)
    -- print("error 修改spine动画的纹理，或许是想要修改动画的皮肤")
end

function SpineAni:changeOpacity(value)
    self.animation:setOpacity(value)
end

function SpineAni:setOpacity(value)
    self.animation:setOpacity(value)
end

function SpineAni:isFlipSprite()
    return self.flipSprite
end

function SpineAni:setFlipSprite(flipSprite)
    self.flipSprite = flipSprite
end

function SpineAni:getView()
    return self.animation
end


-- 设置是否左右翻转
function SpineAni:setFlippedX(flipSprite)
    if flipSprite then
        self.animation:setRotationSkewY(180)
    else
        self.animation:setRotationSkewY(0)
    end
end

function SpineAni:createView(batch, marksLayer, debugLayer)

end

function SpineAni:removeView()

end

-- 获得当前正在播放的动画的名字
function SpineAni:getCurrentAniName(index)
    return self.animation:getCurrentAniName(index)
end


-- forceStop 表示是否强制中断之前的动画
-- add by Owen, 2016.5.4, isRepeat  表示就是播放的重复动作，用来做打恶魔王的召唤技能
function SpineAni:playAni(name, isForerer, forceStop, eventFunc, finishFunc, startFunc, isRepeat)

    -- 获得当前正在播放的技能名字,当前没播动画的话，名字就是""
    local currentAniName = self.animation:getCurrentAniName(0)
    -- print("SpineAni:playAni currentAniName = "..tostring(currentAniName)
    --     .." newAniName = "..tostring(name).." forceStop = "..tostring(forceStop))

    -- if currentAniName == "Skill_01" then
    --     assert(false)
    -- end

    -- 如果怪物已经在播放死亡动画了，然后又给他设置播放其他动画的话，直接返回，不做处理
    -- 是为了防止，Buff时间到了以后，从死亡动画又回复到Idle动画
    if currentAniName == "Death" then
        -- assert(false)
        return
    end
    
    if name == currentAniName and not isRepeat then
        -- 已经在波这个动画了，那么直接返回，这个返回只是为了切换移动朝向的时候用到
        -- 也就是在MovableBehavior:tick()函数的最后面判定朝向的时候
        -- 一会播放Move，一会播放Move_Up
        -- print("SpineAni:playAni 已经在波这个动画了，那么直接返回")
        return
    elseif string.len(currentAniName) > 0 then
        -- 多次调用setMix函数，C++中并不会对相同的两个动画混合多次
        -- self.animation:setMix(currentAniName, name, 0.2)
    end

    -- add by Owen, 2016.1.19, 如果是forceStop，那么需要移除掉所有的监听事件
    self.animation:unregisterSpineEventHandler(sp.EventType.ANIMATION_EVENT)
    self.animation:unregisterSpineEventHandler(sp.EventType.ANIMATION_COMPLETE)

    if forceStop then 
        self.animation:pause()
        self.animation:setToSetupPose()
    end
    self.animation:setAnimation(0, name, isForerer)
    if forceStop then 
        self.animation:resume()
    end

    -- 注册开始回调
    -- if startFunc then
        self.animation:registerSpineEventHandler(function (event)
            -- print(string.format("[spine] %d start: %s", 
            --                     event.trackIndex,
            --                     event.animation))
            if startFunc then
                startFunc()
            end
        end, sp.EventType.ANIMATION_START)
    -- end

    -- 注册帧事件回调
    -- if eventFunc then
        self.animation:registerSpineEventHandler(function (event)
            -- print(string.format("[spine] %d event: %s, %d, %f, %s", 
            --                       event.trackIndex,
            --                       event.eventData.name,
            --                       event.eventData.intValue,
            --                       event.eventData.floatValue,
            --                       event.eventData.stringValue)) 
            if event.eventData.name == "fire" then

                if eventFunc then
                    eventFunc()
                end

                -- -- 中断当前动画，然后接着波另外的动画
                -- self.animation:pause()
                -- self.animation:setToSetupPose()
                -- self.animation:setAnimation(0, "Attack", false)  
                -- self.animation:resume()
            end

        end, sp.EventType.ANIMATION_EVENT)
    -- end

    -- 注册动画结束事件, 如果判定写在外面，先播了一个有finishFunc事件的动画
    -- 然后又播了一个没有finishFunc事件的动画，那么之前定义的finishFunc就会一直被调用
    -- 因为没播放一个动画 start、complete、end都会被调用，先调用complete然后调用end
    -- complete中可以调用回调函数，end的时候调用C++层就会报错
    -- if finishFunc then
        self.animation:registerSpineEventHandler(function (event)
            if finishFunc then
                finishFunc()
            end
        end, sp.EventType.ANIMATION_COMPLETE)
    -- end

    
end


return SpineAni
