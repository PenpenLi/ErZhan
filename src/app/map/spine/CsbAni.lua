
local ObjectState = require("app.map.ObjectState")

-- 播放cocostudio 导出的csb帧动画类

local CsbAni = class("CsbAni", function()
    return display.newNode()
end)

-- bHasPeople 表示上面是不是有人
-- bHasBack 表示是不是有背面
function CsbAni:ctor(mainID, fileName, bHasPeople, bHasBack, isTower, isJiTan)
    -- print("CsbAni 1 fileName = "..tostring(fileName).." bHasPeople = "..tostring(bHasPeople))
    -- print("mainID = "..mainID)
    self.mainID = mainID


    -- local path = cc.FileUtils:getInstance():fullPathForFilename(fileName) -- "ui/hall/MainScene.csb")
    -- print("path = "..tostring(path))

    -- TO-DO, 从缓存中获得ani和action

    local ani = cc.CSLoader:createNode(fileName) --path)  
    -- 通过setScaleX来设置翻转
    -- ani:setScaleX(-1.0)
    -- ani:setPosition(x, y)
    self:addChild(ani)

    local firstAniName = "Idle"

    -- 记录塔上面的人物
    if bHasPeople then
        self.bHasPeople = true
        self.people = ani:getChildByName("people")
    end
    if bHasBack then
        firstAniName = "Idle_01"
    end
    if isTower then
        firstAniName = "Idle_01"
    end

    -- 同一个文件创建的节点只能使用同一个文件创建的动画。 
    -- 嵌套节点的动画会自动加载动画，可以用嵌套节点->getActionByTag(嵌套节点->getTag()) 来获取动画 
    -- 播放动画
    local action = cc.CSLoader:createTimeline(fileName)
    ani:runAction(action)
    -- action:gotoFrameAndPlay(0,60,true)  -- 通过帧数来播放
    action:play(firstAniName, true)  -- 通过名字播放

    self.animation      = ani       -- 播动画的节点，可以用来控制位置
    self.actionTimeline = action    -- 通过action来切换动画
    -- self.animation:retain()         -- 要retain一下，在removeSelf()函数中把自己移除掉
    -- self.actionTimeline:retain()    -- 要retain一下，不然在后面执行setFrameEventCallFunc的时候会报错

    -- add by Owen, 2016.4.28, 是祭坛塔的话，需要获得祭坛塔的4层特效
    if isJiTan then
        self.plunderEffs = {}
        for i = 1, 4 do
            self.plunderEffs[i] = ani:getChildByName("layer_"..tostring(i))
            self.plunderEffs[i]:setVisible(false)
        end
    end

end

-- add by Owen, 2016.4.16, 增加csb动画的暂停，游戏暂停以后，动画也需要暂停
function CsbAni:pause()
    self.animation:pause()
end

-- add by Owen, 2016.4.16, 增加csb动画暂停后继续播放
function CsbAni:resume()
    self.animation:resume()
end

function CsbAni:getContentSize()
    local size = self.animation:getContentSize()
    return size
end

function CsbAni:setScale(scale)
    self.animation:setScale(scale)
end

function CsbAni:removeSelf()
    -- print("CsbAni:removeSelf()")
    self.actionTimeline:clearFrameEventCallFunc()
    self.animation:stopAllActions()
    self.animation:removeSelf()
    self.animation = nil
    self:removeFromParent()
end

-- 修改图片纹理
function CsbAni:setTexture(name)
    -- assert(false)
    -- print("error 修改帧动画的纹理，或许是想要修改动画的皮肤")
end

function CsbAni:setOpacity(value)
    -- print("CsbAni:setOpacity value = "..tostring(value))
    self.animation:setOpacity(value)
end

function CsbAni:changeOpacity(value)
    self.animation:setOpacity(value)
end

function CsbAni:isFlipSprite()
    return self.flipSprite
end

function CsbAni:setFlipSprite(flipSprite)
    self.flipSprite = flipSprite
end

function CsbAni:getView()
    return self.animation
end

-- 设置是否左右翻转，通过setScaleX来设置翻转
function CsbAni:setFlippedX(flipSprite)
    if flipSprite then
        if self.bHasPeople then
            self.people:setScaleX(-1)
        else
            self.animation:setScaleX(-1)
        end
    else
        if self.bHasPeople then
            self.people:setScaleX(1)
        else
            self.animation:setScaleX(1)
        end
    end
end

function CsbAni:createView(batch, marksLayer, debugLayer)

end

function CsbAni:removeView()

end

-- 获得当前正在播放的动画的名字
function CsbAni:getCurrentAniName(index)
    return self.currentAniName
    -- return self.animation:getCurrentAniName(index)
end

-- 帧动画要获得当前播放到第几帧了
function CsbAni:getCurrentFrameIndex()
    return self.animation._animate:getCurrentFrameIndex()
end

-- 根据祭坛塔储能的5种状态，来控制祭坛塔4层特效的可见不可见
function CsbAni:showPlunderEff(state)
    for i = 1, 4 do
        if state == i then
            self.plunderEffs[i]:setVisible(true)
        else
            self.plunderEffs[i]:setVisible(false)
        end
    end
end

-- forceStop 表示是否强制中断之前的动画
function CsbAni:playAni(name, isForever, forceStop, eventFunc, finishFunc, startFunc, object)

    -- print("CsbAni:playAni mainID = "..tostring(self.mainID)
    --     .." currentAniName = "..tostring(self.currentAniName)
    --     .." newAniName = "..tostring(name).." isForever = "..tostring(isForever)
    --     .." forceStop = "..tostring(forceStop).." eventFunc = "..tostring(eventFunc)
    --     .." finishFunc = "..tostring(finishFunc))
        -- .." object.mainID_ = "..tostring(object.mainID_))

    -- 如果怪物已经在播放死亡动画了，然后又给他设置播放其他动画的话，直接返回，不做处理
    -- 是为了防止，Buff时间到了以后，从眩晕动画又回复到Idle动画
    if self.currentAniName == "Death" then
        -- assert(false)
        return
    end


    -- 如果现在已经在播放这个名字了，那么直接返回
    if name == self.currentAniName then
        return
    else
        -- 如果stop的话，就不会播放动画了
        -- self.animation:stopAllActions()
    end

    self.currentAniName = name

    -- change by Owen, 2016.1.19, 播放新动画的时候，要把老的回调函数给去掉
    self.actionTimeline:clearFrameEventCallFunc()


    if isForever then
        -- print("CsbAni 播放动画 1 name = "..tostring(name))
        self.actionTimeline:play(name, true)  -- 通过名字播放
    else
        -- print("CsbAni 播放动画 2 name = "..tostring(name))
        self.actionTimeline:play(name, false)
    end



    -- 帧事件监听 
    -- print("CsbAni:playAni self.actionTimeline = "..tostring(self.actionTimeline))
    self.actionTimeline:setFrameEventCallFunc(function(frame) 
        local event = frame:getEvent();
        -- print("=========",event);
        if eventFunc and event == "fire" then
            eventFunc()
        end
        if finishFunc and event == "end" then
            finishFunc()
        end
    end)

    
end


return CsbAni
