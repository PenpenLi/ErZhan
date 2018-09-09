
local BehaviorFactory = require("app.map.behaviors.BehaviorFactory")
-- require ("tools.dump")

local ObjectBase = class("ObjectBase")

ObjectBase.CLASS_INDEX_PATH        = 1
ObjectBase.CLASS_INDEX_RANGE       = 2
ObjectBase.CLASS_INDEX_STATIC      = 3

kMapObjectClassIndexPath        = 1
kMapObjectClassIndexCrossPoint  = 2
kMapObjectClassIndexRange       = 3
kMapObjectClassIndexStatic      = 4
kMapObjectClassIndexStandRange  = 5
kMapObjectClassIndexPoint       = 6   


-- 这些属性，用来在mapRuntime:tick()函数中的碰撞检测是用到
--[[
    if event == MAP_EVENT_COLLISION_BEGAN then
        if object2.classIndex_ == CLASS_INDEX_RANGE then
]]
-- ObjectBase.CLASS_INDEX = {
--     path       = ObjectBase.CLASS_INDEX_PATH,
--     range      = ObjectBase.CLASS_INDEX_RANGE,
--     static     = ObjectBase.CLASS_INDEX_STATIC,
--     rangeobject = ObjectBase.CLASS_INDEX_RANGE,  -- kMapObjectClassIndexRange,
--     towerlocation = kMapObjectClassIndexTowerLocation,
--     towerobject = ObjectBase.CLASS_INDEX_STATIC,    -- 在mapRuntime中会用到classIndex_这个属性，
--                                                     --这个属性是根据这个枚举和配置文件中的cklassId来进行赋值的
-- }
ObjectBase.CLASS_INDEX = {
    path        = kMapObjectClassIndexPath,
    range       = kMapObjectClassIndexRange,
    static      = kMapObjectClassIndexStatic,
    rangeobject = kMapObjectClassIndexRange,
    areaobject  = kMapObjectClassIndexRange,       -- add by Owen, 2015.8.19, 区域也用C的碰撞检测
    standrange  = kMapObjectClassIndexStandRange,
    point       = kMapObjectClassIndexPoint,
    towerobject = kMapObjectClassIndexStatic,
    towerlocation = kMapObjectClassIndexStatic,
}

function ObjectBase:ctor(id, state, map)
    assert(type(state) == "table", "ObejctBase:ctor() - invalid state")

--[[
    构造函数先判断state是否是table，如果不是则报错。  
    将state的索引类似path:1或者state:3或者range:3和points表,
    重新赋值给 self[kn]=v( k是points，v是点集合)如下 
]]

    -- 这里给Path类的points_赋了值
    for k, v in pairs(state) do
        local kn = k .. "_"
        self[kn] = v
    end

    local classId, index = unpack(string.split(id, ":"))
    self.map_        = map
    self.id_         = id
    self.classId_    = classId
    self.classIndex_ = ObjectBase.CLASS_INDEX[classId]
    -- print("self.classIndex_ = "..tostring(self.classIndex_)..
    --      " classId = "..tostring(classId))
    self.index_      = checkint(index)
    self.x_          = checkint(self.x_)
    self.y_          = checkint(self.y_)
    self.offsetX_    = checkint(self.offsetX_)
    self.offsetY_    = checkint(self.offsetY_)
    if self.patrolX_ then
        self.patrolX_ = checkint(self.patrolX_)
    end
    if self.patrolY_ then
        self.patrolY_ = checkint(self.patrolY_)
    end
    self.state_      = state
    self.valid_      = false
    self.play_       = false
    self.tag_        = 0
    self.sprite_     = nil
    self.debug_      = false
    self.debugViewEnabled_ = false

    if type(self.viewZOrdered_) ~= "boolean" then
        self.viewZOrdered_ = true
    end
end

--[[
该函数在ObjectFactory.newObject函数中被调用， 
判断self.behaviors_变量，如果为false就直接退出。 
处理类似  
    local object = {     
        behaviors = {
        "CampBehavior",
        "CollisionBehavior",
        "DecorateBehavior",         
        "DestroyedBehavior",         
        "FireBehavior",         
        "TowerBehavior",     
        },      
        campId = 1, 
        collisionEnabled = true,     
        decorationsMore = {     },      
        defineId = "PlayerTower01",     
        flipSprite = false,     
        tag = 0,      
        towerId = "PlayerTower01L01",    
        x = 454,     
        y = 465, 
    }  
    objects["static:1"] = object的对象  
    如果没有behaviors则就退出。不过static:1这种的就肯定会执行了。 
    判断是一个string还是其他（table），赋值给函数中的局部变量。
     然后循环执行self:bindBehavior(behaviorName) 
]]
-- 主要是绑定behavior
function ObjectBase:init()
    if not self.behaviors_ then return end

    local behaviors
    if type(self.behaviors_) == "string" then
        behaviors = string.split(self.behaviors_, ",")
    else
        behaviors = self.behaviors_
    end

    for i, behaviorName in ipairs(behaviors) do
        behaviorName = string.trim(behaviorName)
        if behaviorName ~= "" then self:bindBehavior(behaviorName) end
    end
end

function ObjectBase:isDebug()
    return self.debug_
end

function ObjectBase:setDebug(isDebugEnabled)
    self.debug_ = isDebugEnabled
end

function ObjectBase:isDebugViewEnabled()
    return self.debugViewEnabled_
end

function ObjectBase:setDebugViewEnabled(isDebugViewEnabled)
    self.debugViewEnabled_ = isDebugViewEnabled
end

function ObjectBase:getId()
    return self.id_
end

function ObjectBase:getClassId()
    return self.classId_
end

function ObjectBase:getIndex()
    return self.index_
end

function ObjectBase:validate()
end

function ObjectBase:isValid()
    return self.valid_
end

function ObjectBase:getTag()
    return self.tag_
end

function ObjectBase:setTag(tag)
    self.tag_ = tag
end

function ObjectBase:getPosition()
    return self.x_, self.y_
end

function ObjectBase:getPositionX()
    return self.x_
end

function ObjectBase:getPositionY()
    return self.x_
end

function ObjectBase:setPosition(x, y)
    self.x_, self.y_ = x, y
end

function ObjectBase:isViewCreated()
    return self.sprite_ ~= nil
end

function ObjectBase:isViewZOrdered()
    return self.viewZOrdered_
end

function ObjectBase:getView()
    return nil
end

function ObjectBase:createView(batch, marksLayer, debugLayer)
    -- print("ObjectBase:createView")
    assert(self.batch_ == nil, "ObjectBase:createView() - view already created")
    self.batch_      = batch
    self.marksLayer_ = marksLayer
    self.debugLayer_ = debugLayer
end

function ObjectBase:removeView()
    assert(self.batch_ ~= nil, "ObjectBase:removeView() - view not exists")
    self.batch_      = nil
    self.marksLayer_ = nil
    self.debugLayer_ = nil
end

-- add by Owen, 2015.8.12, 显示放技能文字、暴击、闪避文字
-- isImage, 判定显示的是一个图片还是文字，true表示是图片, 同时传入的第一个参数变成sprite
-- zOrder,  图片显示的zOrder
function ObjectBase:addView(showString, posY, needRemove, isImage, zOrder)
    -- print("ObjectBase:addView showString = "..tostring(showString))
    if not self.sprite_ or not showString then
        return
    end

    local stringLabel
    if not isImage then
        -- 显示在“任务中”、暴击等文字
        stringLabel = cc.ui.UILabel.new({
            UILabelType = 2,
            text = showString,
            font = "Arial",
            color = cc.c3b(255, 255, 255),
            size  = 22,
            x = 0,
            y = posY,
        })
        self.sprite_:addChild(stringLabel)
        -- change by Owen, 2016.4.7, 先把文字改为不可见的
        stringLabel:setVisible(false)
    else 
        -- local size = showString:getContentSize()
        -- showString:setPosition(self.spriteSize_[1]/2, size.height/4 - 5)
        -- local scale = self.spriteSize_[1]/size.width 
        -- -- scale = scale * 1.2
        -- showString:setScaleX(scale)
        -- showString:setScaleY(0.8 * scale)

        -- local scaleto1 = cc.ScaleTo:create(0.5, scale * 0.7, scale * 0.7*0.8)
        -- local scaleto2 = cc.ScaleTo:create(0.5, scale, scale * 0.8)
        -- local squence  = cc.Sequence:create(scaleto1,scaleto2,nil)
        -- local selectedAction = cc.RepeatForever:create(squence)
        -- showString:runAction(selectedAction)
        stringLabel = showString
        self.sprite_:addChild(showString, zOrder)
        showString:setPositionY(posY)
    end

    -- 如果需要自动删除，buff的提示文字是不需要自动删除的
    if needRemove then
        transition.fadeOut(stringLabel, {
            time = 0.3,
            delay = 0.6,
            onComplete = function()
                if not tolua.isnull(stringLabel) then
                    stringLabel:removeSelf()
                end
            end
        })
    end

    return stringLabel

end

function ObjectBase:updateView()
end

function ObjectBase:preparePlay()
end

function ObjectBase:startPlay()
    self.play_ = true
end

function ObjectBase:stopPlay()
    self.play_ = false
end

function ObjectBase:isPlay()
    return self.play_
end

function ObjectBase:hasBehavior(behaviorName)
    return self.behaviorObjects_ and self.behaviorObjects_[behaviorName] ~= nil
end

function ObjectBase:bindBehavior(behaviorName)
    if not self.behaviorObjects_ then self.behaviorObjects_ = {} end
    if self.behaviorObjects_[behaviorName] then return end

    -- 不是debug的时候，不能绑定EditorBehavior
    if not self.map_:isDebug() and string.find(behaviorName, "Editor") then
        return
    end

    local behavior = BehaviorFactory.createBehavior(behaviorName)
    for i, dependBehaviorName in pairs(behavior:getDepends()) do
        self:bindBehavior(dependBehaviorName)

        if not self.behaviorDepends_ then
            self.behaviorDepends_ = {}
        end
        if not self.behaviorDepends_[dependBehaviorName] then
            self.behaviorDepends_[dependBehaviorName] = {}
        end
        table.insert(self.behaviorDepends_[dependBehaviorName], behaviorName)
    end

    behavior:bind(self)
    self.behaviorObjects_[behaviorName] = behavior
    -- change by Owen, 2015.12.18, 在Map:newObject()中，创建了物体以后，
    -- 会调用object:resetAllBehaviors()，这里就不需要多次重复调用了
    -- self:resetAllBehaviors()
end

function ObjectBase:unbindBehavior(behaviorName)
    assert(self.behaviorObjects_ and self.behaviorObjects_[behaviorName] ~= nil,
           string.format("ObjectBase:unbindBehavior() - behavior %s not binding", behaviorName))
    assert(not self.behaviorDepends_ or not self.behaviorDepends_[behaviorName],
           string.format("ObjectBase:unbindBehavior() - behavior %s depends by other binding", behaviorName))

    local behavior = self.behaviorObjects_[behaviorName]
    for i, dependBehaviorName in pairs(behavior:getDepends()) do
        for j, name in ipairs(self.behaviorDepends_[dependBehaviorName]) do
            if name == behaviorName then
                table.remove(self.behaviorDepends_[dependBehaviorName], j)
                if #self.behaviorDepends_[dependBehaviorName] < 1 then
                    self.behaviorDepends_[dependBehaviorName] = nil
                end
                break
            end
        end
    end

    behavior:unbind(self)
    self.behaviorObjects_[behaviorName] = nil
end

function ObjectBase:resetAllBehaviors()
    if not self.behaviorObjects_ then return end

    local behaviors = {}
    for i, behavior in pairs(self.behaviorObjects_) do
        behaviors[#behaviors + 1] = behavior
    end
    table.sort(behaviors, function(a, b)
        return a:getPriority() > b:getPriority()
    end)
    for i, behavior in ipairs(behaviors) do
        behavior:reset(self)
    end
end

function ObjectBase:bindMethod(behavior, methodName, method, callOriginMethodLast)
    local originMethod = self[methodName]
    if not originMethod then
        self[methodName] = method
        return
    end

    if not self.bindingMethods_ then self.bindingMethods_ = {} end
    if not self.bindingMethods_[methodName] then self.bindingMethods_[methodName] = {} end

    local chain = {behavior, originMethod}
    local newMethod
    if callOriginMethodLast then
        newMethod = function(...)
            method(...)
            chain[2](...)
        end
    else
        newMethod = function(...)
            local ret = chain[2](...)
            if ret then
                local args = {...}
                args[#args + 1] = ret
                return method(unpack(args))
            else
                return method(...)
            end
        end
    end

    self[methodName] = newMethod
    chain[3] = newMethod
    table.insert(self.bindingMethods_[methodName], chain)

    -- print(string.format("[%s]:bindMethod(%s, %s)", tostring(self), behavior:getName(), methodName))
    -- for i, chain in ipairs(self.bindingMethods_[methodName]) do
    --     print(string.format("  index: %d, origin: %s, new: %s", i, tostring(chain[2]), tostring(chain[3])))
    -- end
    -- print(string.format("  current: %s", tostring(self[methodName])))
end

function ObjectBase:unbindMethod(behavior, methodName)
    if not self.bindingMethods_ or not self.bindingMethods_[methodName] then
        self[methodName] = nil
        return
    end

    local methods = self.bindingMethods_[methodName]
    local count = #methods
    for i = count, 1, -1 do
        local chain = methods[i]

        if chain[1] == behavior then
            -- print(string.format("[%s]:unbindMethod(%s, %s)", tostring(self), behavior:getName(), methodName))
            if i < count then
                -- 如果移除了中间的节点，则将后一个节点的 origin 指向前一个节点的 origin
                -- 并且对象的方法引用的函数不变
                -- print(string.format("  remove method from index %d", i))
                methods[i + 1][2] = chain[2]
            elseif count > 1 then
                -- 如果移除尾部的节点，则对象的方法引用的函数指向前一个节点的 new
                self[methodName] = methods[i - 1][3]
            elseif count == 1 then
                -- 如果移除了最后一个节点，则将对象的方法指向节点的 origin
                self[methodName] = chain[2]
                self.bindingMethods_[methodName] = nil
            end

            -- 移除节点
            table.remove(methods, i)

            -- if self.bindingMethods_[methodName] then
            --     for i, chain in ipairs(self.bindingMethods_[methodName]) do
            --         print(string.format("  index: %d, origin: %s, new: %s", i, tostring(chain[2]), tostring(chain[3])))
            --     end
            -- end
            -- print(string.format("  current: %s", tostring(self[methodName])))

            break
        end
    end
end

-- 设置对象状态
-- 这个状态不是构造函数传进来的 state_，而是指真正意义上的状态
-- 如攻击，跟踪，移动等等，在ObjectState.lua中定义
-- @return 状态设置成功
function ObjectBase:setState(value)
    if (self.curState ~= value) then
        -- print(self:getId() .. ".setState", value)
        -- print(self:getId() .. " ObjectBase:setState = ", value)
        self.lastState = self.curState
        self.curState = value
        return true
    end
    return false
end

-- add by Owen, 2015.8.26，获得当前的状态，避免直接访问object.curState
function ObjectBase:getCurState()
    return self.curState
end

function ObjectBase:vardump()
    -- print("ObjectBase:vardump()")
    -- chenge by Owen, 2015.11.27, 地图X轴缩放0.7, Y轴缩放0.5
    local state = {
        x   = self.x_,
        y   = self.y_,
        tag = self.tag_,
    }
    -- local state = {
    --     x   = math.round(self.x_ * 0.7),
    --     y   = math.round(self.y_ * 0.5),
    --     tag = self.tag_,
    -- }

    if self.behaviorObjects_ then
        local behaviors = table.keys(self.behaviorObjects_)
        for i = #behaviors, 1, -1 do
            if not BehaviorFactory.isStaticObjectBehavior(behaviors[i]) then
                table.remove(behaviors, i)
            end
        end
        if #behaviors > 0 then
            table.sort(behaviors)
            state.behaviors = behaviors
        end
    end

    return state
end

function ObjectBase:dump(label)
    -- print("ObjectBase:dump(label)")
    return vardump(self:vardump(), label)
end

return ObjectBase
