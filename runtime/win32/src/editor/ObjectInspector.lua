
local MapConstants    = require("app.map.MapConstants")
local BehaviorFactory = require("app.map.behaviors.BehaviorFactory")
local EditorConstants = require("editor.EditorConstants")
local RangeObject     = require("app.map.RangeObject")

local ObjectInspector = class("ObjectInspector")

ObjectInspector.EditButtonSize        = 16

ObjectInspector.POSITION_LEFT_TOP     = "LEFT_TOP"
ObjectInspector.POSITION_RIGHT_TOP    = "RIGHT_TOP"
ObjectInspector.POSITION_LEFT_BOTTOM  = "LEFT_BOTTOM"
ObjectInspector.POSITION_RIGHT_BOTTOM = "RIGHT_BOTTOM"

-- 需要显示的Object的类型
ObjectInspector.TYPE_RANGE  = "range"
ObjectInspector.TYPE_OBJECT  = "object"
ObjectInspector.TYPE_STANDRANGE = "standrange"
ObjectInspector.TYPE_POINT = "point"
ObjectInspector.TYPE_DECORATION = "decoration";

ObjectInspector.ALL_POSITIONS = {
    ObjectInspector.POSITION_LEFT_TOP,
    ObjectInspector.POSITION_RIGHT_TOP,
    ObjectInspector.POSITION_RIGHT_BOTTOM,
    ObjectInspector.POSITION_LEFT_BOTTOM,
}

-- Object属性查看页面

function ObjectInspector:ctor(map, scale, toolbarLines)
    print("ObjectInspector:ctor(map, scale, toolbarLines)")
    cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()

    self.map_            = map
    self.sprite_         = nil
    self.bg_             = nil
    self.size_           = {0, 0}
    self.position_       = ObjectInspector.POSITION_RIGHT_BOTTOM
    self.behaviorsLabel_ = {}
    self.object_         = nil
    self.editButtons_    = {}
    self.isVisible_      = true
    self.scale_          = scale
    self.toolbarLines_   = toolbarLines
    self.updateType_     = nil     -- 用来记录当前选中的是什么类型的Object

    if device.platform == "ios" or device.platform == "android" then
        self.position_ = ObjectInspector.POSITION_RIGHT_TOP
    end
end

function ObjectInspector:checkPointIn(x, y)
    local worldPosition = self.sprite_:convertToWorldSpace(cc.p(0, 0))
    local wx, wy = worldPosition.x, worldPosition.y

    return x >= wx
            and x <= wx + self.size_[1] * self.scale_
            and y <= wy
            and y >= wy - self.size_[2] * self.scale_
end

-- 点中下面的Behavior后的处理
function ObjectInspector:onTouch(event, x, y)
    if event ~= "began" then return false end

    local worldPosition = self.sprite_:convertToWorldSpace(cc.p(0, 0))
    local wx, wy = worldPosition.x, worldPosition.y
    x = x - wx
    y = y - wy

    local width, height = unpack(self.size_)
    width = width * self.scale_
    height = height * self.scale_
    local offset = EditorConstants.PANEL_BUTTON_OFFSET * self.scale_
    local size = EditorConstants.PANEL_BUTTON_SIZE * self.scale_
    if x >= offset and x <= offset + size and y <= -offset and y >= -offset - size then
        self.sprite_:setVisible(false)
        self.isVisible_ = false
        return false
    elseif device.platform ~= "ios" and device.platform ~= "android" and x >= width - size - offset and x <= width - offset and y <= -offset and y >= -offset - size then
        for i, pos in ipairs(ObjectInspector.ALL_POSITIONS) do
            if self.position_ == pos then
                i = i + 1
                if i > #ObjectInspector.ALL_POSITIONS then
                    i = 1
                end
                self.position_ = ObjectInspector.ALL_POSITIONS[i]
                self:setPosition()
                break
            end
        end
        return false
    end

    local function updateObject(changeFunction)
        self.object_:removeView()
        changeFunction()
        self.object_:resetAllBehaviors()
        self.object_:createView(self.map_:getBatchLayer(),
                                self.map_:getMarksLayer(),
                                self.map_:getDebugLayer())
        self.object_:updateView()

        -- self:dispatchEvent({name = "UPDATE_OBJECT", object = self.object_})
        print("self.updateType_ = "..tostring(self.updateType_))
        if self.updateType_ == ObjectInspector.TYPE_OBJECT then
            self:setObject(self.object_)
            self:dispatchEvent({name = "UPDATE_OBJECT", object = self.object_})
        elseif self.updateType_ == ObjectInspector.TYPE_RANGE then
            self:setRange(self.object_)
            self:dispatchEvent({name = "UPDATE_RANGE", object = self.object_})
        -- elseif self.updateType_ == ObjectInspector.TYPE_STANDRANGE then
        --     self:setStandRange(self.object_)
        --     self:dispatchEvent({name = "UPDATE_STANDRANGE", object = self.object_})
        end
    end

    if #self.behaviorsLabel_ >0 then
        for i, behavior in ipairs(BehaviorFactory.getAllStaticObjectBehaviorsName()) do
            local label = self.behaviorsLabel_[i]
            local lx, ly = label.x * self.scale_, label.y * self.scale_
            if x >= lx and x <= lx + label.width * self.scale_ and y <= ly and y >= ly - label.height * self.scale_ then
                if label.isLocked then return false end
                updateObject(function()
                    if self.object_:hasBehavior(behavior) then
                        self.object_:unbindBehavior(behavior)
                        label.sprite:setOpacity(64)
                    else
                        self.object_:bindBehavior(behavior)
                        label.sprite:setOpacity(255)
                    end
                    self.object_:validate()
                end)

                return false
            end
        end
    end

    -- 让用户通过输入来修改属性
    local bsize = ObjectInspector.EditButtonSize / 2 * self.scale_
    for i, button in pairs(self.editButtons_) do
        local bx, by = button.x * self.scale_, button.y * self.scale_
        if x >= bx - bsize and x <= bx + bsize and y <= by + bsize and y >= by - bsize then
            print("hahaha touched self.editButtons_")
            
            local message = string.format("Enter new [%s] value.\nNOTE: %s", button.name, tostring(button.editNote))
            -- 这个显示输入框的函数在win32上不起作用
            -- local value = device.showInputBox("Change object property", message, tostring(button.value))
            -- if value ~= "" then
            --     updateObject(function()
            --         button.editFunction(self.object_, value)
            --     end)
            -- end

            local editBox = cc.ui.UIInput.new({
                    UIInputType = 1,      -- 1表示创建editbox，2表示TextField
                    image = "Bg1.png",
                    -- listener = onEdit,
                    size = cc.size(200, 30),
                    x = 200 / 2,
                    y = 30 * 2 / 3,
                })
            -- 默认显示文字
            editBox:setPlaceHolder(tostring(button.name))
            editBox:touchDownAction(nil ,2);
            local value = editBox:getText()
            print("editBox:getText() = "..tostring(value))
            if value ~= "" then
                -- 这里会发信号UPDATE_RANGE出去，然后又会调用到自己的setRangeObject()函数
                updateObject(function()
                    button.editFunction(self.object_, value)
                end)
            end
            -- self:addChild(editBox)
        end
    end
end

function ObjectInspector:getView()
    return self.sprite_
end

function ObjectInspector:createView(parent, object)
    print("ObjectInspector:createView")
    local layer = display.newNode()
    local bg = display.newSprite("#EditorPanelBg.png")
    local size = bg:getContentSize()
    bg:align(display.LEFT_TOP, 0, 0)
    bg:getTexture():setAliasTexParameters()
    layer:addChild(bg)
    layer:setVisible(false)
    layer:setScale(self.scale_)
    parent:addChild(layer)

    local closeButton = display.newSprite("#EditorPanelCloseButton.png")
    local offset = EditorConstants.PANEL_BUTTON_SIZE / 2 + EditorConstants.PANEL_BUTTON_OFFSET
    closeButton:setPosition(offset, -offset)
    layer:addChild(closeButton)

    self.positionButton_ = display.newSprite("#EditorPanelPositionButton.png")
    self.positionButton_:setPosition(0, -offset)
    layer:addChild(self.positionButton_)

    if device.platform == "ios" or device.platform == "android" then
        self.positionButton_:setVisible(false)
    end

    self.bg_ = bg
    self.sprite_ = layer
    return layer
end

function ObjectInspector:removeView()
    print("ObjectInspector:removeView()")
    assert(true, "ObjectInspector:removeView()")
    if self.sprite_ then
        self.sprite_:removeSelf()
        self.sprite_ = nil
    end
end

function ObjectInspector:setPosition()
    local width, height = unpack(self.size_)

    local size = self.bg_:getContentSize()
    self.bg_:setScaleX(width / size.width)
    self.bg_:setScaleY(height / size.height)

    width = width * self.scale_
    height = height * self.scale_

    local offset = EditorConstants.PANEL_OFFSET * self.scale_

    if self.position_ == ObjectInspector.POSITION_LEFT_TOP then
        self.sprite_:align(display.LEFT_TOP,
                           display.c_left + offset,
                           display.c_top - offset)
    elseif self.position_ == ObjectInspector.POSITION_RIGHT_TOP then
        self.sprite_:align(display.LEFT_TOP,
                           display.c_right - width - offset,
                           display.c_top - offset)
    elseif self.position_ == ObjectInspector.POSITION_LEFT_BOTTOM then
        local y = display.c_bottom + height + offset
        if self.scale_ == 1 then
            y = y + EditorConstants.MAP_TOOLBAR_HEIGHT * self.toolbarLines_
        end
        self.sprite_:align(display.LEFT_TOP, display.c_left + offset, y)
    else
        local y = display.c_bottom + height + offset
        if self.scale_ == 1 then
            y = y + EditorConstants.MAP_TOOLBAR_HEIGHT * self.toolbarLines_
        end
        self.sprite_:align(display.LEFT_TOP, display.c_right - width - offset, y)
    end

    local offset = EditorConstants.PANEL_BUTTON_SIZE / 2 + EditorConstants.PANEL_BUTTON_OFFSET
    self.positionButton_:setPositionX(width / self.scale_ - offset)
end

-- 根据传进来的object来显示对应的属性
function ObjectInspector:setObject(object)
    print("ObjectInspector:setObject(object)")
    self.updateType_ = ObjectInspector.TYPE_OBJECT
    local isVisible = self.isVisible_
    local changeVisible = self.object_ ~= object
    if self.panel_ then self:removeObject() end
    if not changeVisible then
        self.isVisible_ = isVisible
    end

    local panel = display.newNode()
    self.sprite_:addChild(panel)
    self.panel_ = panel

    -- add properties label
    local lines = {}
    lines[#lines + 1] = {
        name  = "Id",
        value = object:getId(),
    }
    lines[#lines + 1] = {
        name  = "defineId",
        value = object:getDefineId(),
    }

    -- if object.behaviors_ and table.nums(object.behaviors_) > 0 then
    --     lines[#lines + 1] = {"behaviors", table.concat(table.keys(object.behaviors_), ", ")}
    -- end

    lines[#lines + 1] = {
        name  = "radius",
        value = string.format("%0.2f", object:getRadius()),
    }
    if object.classId_ ~= "towerlocation" then
        lines[#lines + 1] = {
            name  = "flipSprite",
            value = string.format("%s", tostring(object:isFlipSprite())),
            edit  = true,
            editNote = "\"true, yes, 1\" = true, others = false",
            editFunction = function(object, newvalue)
                newvalue = string.lower(tostring(newvalue))
                if newvalue == "1" or newvalue == "true" or newvalue == "yes" then
                    newvalue = true
                else
                    newvalue = false
                end
                object:setFlipSprite(newvalue)
            end
        }
    end

    if object:hasBehavior("CollisionBehavior") then
        lines[#lines + 1] = {
            name  = "collisionEnabled",
            value = string.format("%s", tostring(object:isCollisionEnabled())),
            edit  = true,
            editNote = "\"true, yes, 1\" = true, others = false",
            editFunction = function(object, newvalue)
                newvalue = string.lower(tostring(newvalue))
                if newvalue == "1" or newvalue == "true" or newvalue == "yes" then
                    newvalue = true
                else
                    newvalue = false
                end
                object:setCollisionEnabled(newvalue)
            end
        }
    end

    if object:hasBehavior("NPCBehavior") then
        lines[#lines + 1] = {
            name  = "npcId",
            value = object:getNPCId(),
            edit  = true,
            editNote = "npcId is string",
            editFunction = function(object, newvalue)
                object:setNPCId(newvalue)
            end
        }
    end

    if object:hasBehavior("TowerBehavior") then
        lines[#lines + 1] = {
            name  = "towerId",
            value = object:getTowerId(),
            edit  = true,
            editNote = "towerId is string",
            editFunction = function(object, newvalue)
                object:setTowerId(newvalue)
            end
        }
    end

    if object:hasBehavior("BuildingBehavior") then
        lines[#lines + 1] = {
            name  = "buildingId",
            value = object:getBuildingId(),
            edit  = true,
            editNote = "buildingId is string",
            editFunction = function(object, newvalue)
                object:setBuildingId(newvalue)
            end
        }
    end

    if object:hasBehavior("FireBehavior") then
        lines[#lines + 1] = {
            name  = "fireRange",
            value = object:getFireRange(),
        }
    end

    if object:hasBehavior("DecorateBehavior") then
        local v = object.decorationsMore_
        if v then
            v = table.concat(table.keys(v), ",")
        else
            v = ""
        end
        lines[#lines + 1] = {
            name  = "decorationsMore",
            value = v,
            edit  = true,
            editNote = "decorationsMore is string",
            editFunction = function(object, newvalue)
                newvalue = string.split(newvalue, ",")
                object.decorationsMore_ = {}
                for i, name in ipairs(newvalue) do
                    object.decorationsMore_[name] = false
                end
            end
        }
    end

    lines[#lines + 1] = {
        name  = "x, y",
        value = string.format("%0.2f, %0.2f", object:getPosition()),
        edit  = true,
        editNote = "position format is x, y",
        editFunction = function(object, newvalue)
            newvalue = string.split(newvalue, ",")
            if #newvalue == 2 then
                local x = checkint(string.trim(newvalue[1]))
                local y = checkint(string.trim(newvalue[2]))
                object:setPosition(x, y)
            end
        end
    }

    if object:hasBehavior("CampBehavior") then
        lines[#lines + 1] = {
            name  = "campId",
            value = object:getCampId(),
            edit  = true,
            editNote = "campId is integer",
            editFunction = function(object, newvalue)
                object.campId_ = checkint(newvalue)
            end
        }
    end

    if object:hasBehavior("DestroyedBehavior") then
        lines[#lines + 1] = {
            name  = "maxHp",
            value = object:getMaxHp(),
        }
    end

    if object:hasBehavior("MovableBehavior") then
        lines[#lines + 1] = {
            name  = "bindingPathId",
            value = object:getBindingPathId(),
        }
        lines[#lines + 1] = {
            name  = "bindingPointIndex",
            value = tostring(object:getBindingPointIndex()),
        }
        lines[#lines + 1] = {
            name  = "bindingMovingForward",
            value = tostring(object:isMovingForward()),
            edit  = true,
            editNote = "\"true, yes, 1\" = true, others = false",
            editFunction = function(object, newvalue)
                newvalue = string.lower(tostring(newvalue))
                if newvalue == "1" or newvalue == "true" or newvalue == "yes" then
                    newvalue = true
                else
                    newvalue = false
                end
                object:setMovingForward(newvalue)
            end
        }
    end

    self.editButtons_ = {}
    local maxWidth = 0
    local labelX = 26
    local labelY = -14
    for i, pair in ipairs(lines) do

        -- 上半部分显示的属性描述信息
        local prefix = string.rep(" ", EditorConstants.PROPERTY_PREFIX_LEN - string.len(pair.name)) .. pair.name
        local text   = string.format("%s = %s", tostring(prefix), tostring(pair.value))
        local label  = cc.ui.UILabel.new({
            text  = text,
            font  = EditorConstants.PANEL_LABEL_FONT,
            size  = EditorConstants.PANEL_LABEL_FONT_SIZE,
            align = cc.ui.TEXT_ALIGN_LEFT,
            x     = labelX,
            y     = labelY,
        }):align(display.CENTER_LEFT)
        panel:addChild(label)

        -- 可以点击的按钮
        if pair.edit and device.platform ~= "ios" and device.platform ~= "android" then
            local editButton = display.newSprite("#EditButton.png", labelX - 10, labelY)
            panel:addChild(editButton)
            pair.x, pair.y = labelX - 10, labelY
            self.editButtons_[#self.editButtons_ + 1] = pair
        end

        labelY = labelY - EditorConstants.PANEL_LABEL_FONT_SIZE - 3
        local size = label:getContentSize()
        if size.width > maxWidth then
            maxWidth = size.width
        end
    end

    local panelWidth  = maxWidth + 30
    if panelWidth < EditorConstants.INSPECTOR_WIDTH then
        panelWidth = EditorConstants.INSPECTOR_WIDTH
    end

    -- labelY = labelY
    -- 所有的Behavior都会列在下面，先注掉
    local allStaticObjectBehaviorsName = BehaviorFactory.getAllStaticObjectBehaviorsName()
    local numCols = math.floor(panelWidth / EditorConstants.BEHAVIOR_LABEL_WIDTH)
    local numRows = math.ceil(#allStaticObjectBehaviorsName / numCols)
    local panelHeight = -labelY + 54 + (numRows - 1) * 26
    local column = 0
    labelY = labelY - 20
    self.behaviorsLabel_ = {}
    -- for i, behavior in ipairs(allStaticObjectBehaviorsName) do
    --     local sprite = display.newSprite("#BehaviorLabelBackground.png")
    --     local size = sprite:getContentSize()

    --     local text = cc.ui.UILabel.new({
    --         text = string.upper(string.sub(behavior, 1, -9)),
    --         size = 10,
    --         align = cc.ui.TEXT_ALIGN_LEFT,
    --         x = 20,
    --         y = 12,
    --     }):align(display.CENTER_LEFT)
    --     sprite:addChild(text)
    --     local label = {
    --         x        = labelX + EditorConstants.BEHAVIOR_LABEL_WIDTH * column,
    --         y        = labelY,
    --         width    = size.width,
    --         height   = size.height,
    --         isLocked = false,
    --     }
    --     sprite:align(display.LEFT_TOP, label.x, label.y)

    --     label.sprite = sprite
    --     self.behaviorsLabel_[i] = label

    --     if not object:hasBehavior(behavior) then
    --         sprite:setOpacity(80)
    --     else
    --         local selected = display.newSprite("#BehaviorLabelSelected.png")
    --         selected:align(display.LEFT_BOTTOM, 0, 0)
    --         sprite:addChild(selected)
    --     end

    --     if object.behaviorDepends_ and object.behaviorDepends_[behavior] then
    --         label.isLocked = true
    --         local lock = display.newSprite("#BehaviorLabelLocked.png")
    --         lock:align(display.LEFT_BOTTOM, 0, 0)
    --         sprite:addChild(lock)
    --     end

    --     panel:addChild(sprite)

    --     column = column + 1
    --     if column == numCols then
    --         column = 0
    --         labelY = labelY - 26
    --     end
    -- end

    self.object_ = object
    self.size_ = {panelWidth, panelHeight}
    self:setPosition()
    print("self.sprite_:setVisible = "..tostring(self.isVisible_))
    self.sprite_:setVisible(self.isVisible_)
end

-- 当前选中的是一个圈/范围物体
function ObjectInspector:setRange(object)
    print("ObjectInspector:setRange(object)")
    self.updateType_ = ObjectInspector.TYPE_RANGE
    local isVisible = self.isVisible_
    local changeVisible = self.object_ ~= object
    if self.panel_ then self:removeObject() end
    if not changeVisible then
        self.isVisible_ = isVisible
    end

    local panel = display.newNode()
    self.sprite_:addChild(panel)
    self.panel_ = panel

    -- add properties label
    local lines = {}
    lines[#lines + 1] = {
        name  = "Id",
        value = object:getId(),
    }
    
    lines[#lines + 1] = {
        name  = "AnimID",
        value = object.resId_,
    }
    lines[#lines + 1] = {
        name  = "radius",
        value = string.format("%0.2f", object:getRadius()),
    }

    lines[#lines + 1] = {
        name  = "x",
        value = string.format("%0.2f", object:getPositionX()),
    }
    lines[#lines + 1] = {
        name  = "y",
        value = string.format("%0.2f", object:getPositionY()),
    }

    if object.bindPaths_ and #object.bindPaths_ > 0 then
        local str = table.concat( object.bindPaths_, ",")
        lines[#lines + 1] = {
            name  = "bindPath",
            value = str
        }
    end
    
    lines[#lines + 1] = {
        name  = "rangeType",
        value = tostring(object.rangeType_),
        -- TO-DO 貌似在编辑器中改变物体的type也可以，不知道会不会有问题，留待以后再解决,先不让改
        edit  = false,  -- true,    
        editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
        editFunction = function(object, newvalue)
            newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
            print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
            -- object.rangeType_ = newvalue
            object:setRangeType(newvalue)
        end
    }

    -- 如果是减速区域
    if object.rangeType_ == RangeObject.TYPE_SLOW_DOWN_RANGE then
        -- 编辑作用对象
        lines[#lines + 1] = {
            name  = "作用对象",  --"roleToAffect",
            value = tostring(object.roleToAffect_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setRoleToAffect(newvalue)
            end
        }
        -- 编辑减速效果
        lines[#lines + 1] = {
            name  = "减速百分比", --  "slowPercent",
            value = tostring(object.slowPercent_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setSlowPercent(newvalue)
            end
        }
    end

    -- 如果是机关技能区域
    if object.rangeType_ == RangeObject.TYPE_SKILL_RANGE then
        -- 编辑机关形象
        lines[#lines + 1] = {
            name  = "技能机关形象", --  "awardId",
            value = tostring(object.imageName_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = "npc/gear/"..tostring(newvalue)  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setImageName(newvalue)
            end
        }
        -- 编辑调用技能Id
        lines[#lines + 1] = {
            name  = "调用技能ID",  --  "skillId",
            value = tostring(object.skillId_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tostring(newvalue)  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setSkillId(newvalue)
            end
        }
        -- 编辑技能区域的CD
        lines[#lines + 1] = {
            name  = "机关激活时间",  --  "skillId",
            value = tostring(object.rangeClickCD_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setRangeClickCD(newvalue)
            end
        }
    end

    -- 如果是任务探索区域
    if object.rangeType_ == RangeObject.TYPE_TASK_RANGE then
        -- imageName_
        -- 编辑任务形象
        lines[#lines + 1] = {
            name  = "任务形象", --  "awardId",
            value = tostring(object.imageName_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = "npc/quest/"..tostring(newvalue)  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setImageName(newvalue)
            end
        }
        -- 编辑出现时间
        lines[#lines + 1] = {
            name  = "任务出现时间", --  "awardId",
            value = tostring(object.appearTime_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setAppearTime(newvalue)
            end
        }
        -- 编辑英雄消失时间/任务耗时
        lines[#lines + 1] = {
            name  = "任务耗时",  --  "spendTime",
            value = tostring(object.spendTime_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setSpendTime(newvalue)
            end
        }
        -- 编辑金币奖励数量
        lines[#lines + 1] = {
            name  = "金币奖励数量", --  "awardId",
            value = tostring(object.awardCount_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setAwardCount(newvalue)
            end
        }
    end

    -- 如果是可拾取物区域
    if object.rangeType_ == RangeObject.TYPE_PACKAGE_RANGE then
        -- 编辑作用对象
        lines[#lines + 1] = {
            name  = "作用对象", --  "roleToAffect",
            value = tostring(object.roleToAffect_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setRoleToAffect(newvalue)
            end
        }
        -- 编辑搬运移动速度
        lines[#lines + 1] = {
            name  = "搬运速度", --  "moveSpeed",
            value = tostring(object.moveSpeed_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setMoveSpeed(newvalue)
            end
        }
        -- 编辑搬运的调用脚本
        lines[#lines + 1] = {
            name  = "调用脚本", --  "callScripts",
            value = tostring(object.callScripts_),
            edit  = true,
            editNote = "门编号 >=1（12点钟开始顺时针） ,other = 0",
            editFunction = function(object, newvalue)
                -- newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                object:setCallScripts(tostring(newvalue))           
            end
        }
    end

    -- 如果是飞鸟抛物
    if object.rangeType_ == RangeObject.TYPE_THROW_ENEMY_RANGE then
        -- 编辑间隔时间
        lines[#lines + 1] = {
            name  = "间隔时间", --  "intervalTime",
            value = tostring(object.intervalTime_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setIntervalTime(newvalue)
            end
        }
        -- 编辑携带的怪物Id
        lines[#lines + 1] = {
            name  = "携带怪物Id", -- "monsterId",
            value = tostring(object.monsterId_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                -- 向上取整有bug，如果传入的是2，输出的是3
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setMonsterId(newvalue)
            end
        }
        -- 编辑携带的怪物数量
        lines[#lines + 1] = {
            name  = "怪物数量", --  "monsterNum",
            value = tostring(object.monsterNum_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                -- 向上取整有bug，如果传入的是2，输出的是3
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setMonsterNum(newvalue)
            end
        }
        -- 编辑搬运的调用脚本
        lines[#lines + 1] = {
            name  = "调用脚本", --  "callScripts",
            value = tostring(object.callScripts_),
            edit  = true,
            editNote = "门编号 >=1（12点钟开始顺时针） ,other = 0",
            editFunction = function(object, newvalue)
                -- newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                object:setCallScripts(tostring(newvalue))           
            end
        }
    end

    -- 跳跃区域，怪物会直接跳到下一个路径点
    if object.rangeType_ == RangeObject.JUMP_RANGE then
        -- 编辑间隔时间
        lines[#lines + 1] = {
            name  = "跳跃时间", --  "intervalTime",
            value = tostring(object.delayTime_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
                print("object.rangeType_ = "..tostring(object.rangeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setDelayTime(newvalue)
            end
        }
    end

    -- 如果是机关技能区域
    if object.rangeType_ == RangeObject.DAYE_RANGE then
        
        -- 编辑打野元素的类型,1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
        lines[#lines + 1] = {
            name  = "打野类型",  --  "skillId",
            value = tostring(object.dayeType_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2, other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tonumber(newvalue)  --  toint(newvalue)  
                print("object.canClick_ = "..tostring(object.dayeType_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setDayeType(newvalue)
            end
        }

        -- 编辑打野元素是否可以点击
        lines[#lines + 1] = {
            name  = "是否可点击",  --  "skillId",
            value = tostring(object.canClick_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tostring(newvalue)  --  toint(newvalue)  
                print("object.canClick_ = "..tostring(object.canClick_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setCanClick(newvalue)
            end
        }

        -- 编辑打野元素, 第几波开始的时候需要判定是否变成可以点击
        lines[#lines + 1] = {
            name  = "第几波需要判定",  --  "skillId",
            value = tostring(object.checkWave_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tostring(newvalue)  --  toint(newvalue)  
                print("object.checkWave_ = "..tostring(object.checkWave_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setCheckWave(newvalue)
            end
        }
        -- 编辑打野元素, 这一波开始的时候过了多久判定一次是否变成可以点击
        lines[#lines + 1] = {
            name  = "判定CD",  --  "skillId",
            value = tostring(object.checkCD_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tonumber(newvalue)  --  toint(newvalue)  
                print("object.checkCD_ = "..tostring(object.checkCD_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setCheckCD(newvalue)
            end
        }
        -- 编辑打野元素, 每次判定的时候有50%的概率可以变为可点击状态
        lines[#lines + 1] = {
            name  = "概率",  --  "skillId",
            value = tostring(object.random_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tonumber(newvalue)  --  toint(newvalue)
                print("object.checkCD_ = "..tostring(object.random_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setRandom(newvalue)
            end
        }
        -- 编辑打野元素, 表示点击以后的奖励多少金币
        lines[#lines + 1] = {
            name  = "奖励金币",  --  "skillId",
            value = tostring(object.addGold_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tonumber(newvalue)  --  toint(newvalue)
                print("object.addGold_ = "..tostring(object.addGold_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setAddGold(newvalue)
            end
        }
        
        -- 编辑打野元素,调用技能Id
        lines[#lines + 1] = {
            name  = "调用技能ID",  --  "skillId",
            value = tostring(object.skillId_),
            edit  = true,
            editNote = "怪物门 = 1, 国王 = 2,other = 3, 4 = 减速",
            editFunction = function(object, newvalue)
                newvalue = tostring(newvalue)  --  toint(newvalue)  
                print("object.skillId_ = "..tostring(object.skillId_).." newvalue = "..tostring(newvalue))            
                -- object.rangeType_ = newvalue
                object:setSkillId(newvalue)
            end
        }
    end
    
    -- lines[#lines + 1] = {
    --     name  = "gateId",
    --     value = tostring(object.gateId_),
    --     edit  = true,
    --     editNote = "门编号 >=1（12点钟开始顺时针） ,other = 0",
    --     editFunction = function(object, newvalue)
    --         newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)              
    --         object.gateId_ = newvalue
    --     end
    -- }

    -- 设置roadId，这个先去掉
    -- lines[#lines + 1] = {
    --     name  = "roadID",
    --     value = tostring(object:getRoadID()),
    --     edit  = true,
    --     editNote = "请输入 road:数字，或清空输入",
    --     editFunction = function(object, value)
    --         if (value == "") then
    --             object:setRoadID(nil)
    --             return
    --         end
    --         object:setRoadID(value)
    --     end
    -- }

   if object:hasBehavior("RangeObjectEditorBehavior") then
       lines[#lines + 1] = {
            name  = "flipSprite_",
            value = string.format("%s", tostring(object:isFlipSprite())),
            edit  = false, -- true,
            editNote = "\"true, yes, 1\" = true, others = false",
            editFunction = function(object, newvalue)
                newvalue = string.lower(tostring(newvalue))
                if newvalue == "1" or newvalue == "true" or newvalue == "yes" then
                    newvalue = true
                else
                    newvalue = false
                end
                object:setFlipSprite(newvalue)
              
            end
        }  
    end

    -- 修改campId
    lines[#lines + 1] = {
        name  = "campId",
        value = tostring(object.campId_),
        edit  = false,
        editNote = "怪物门 = 1, 国王 = 2,other = 3",
        editFunction = function(object, newvalue)
            newvalue = math.round(tonumber(newvalue))  --  toint(newvalue)  
            print("object.rangeType_ = "..tostring(object.campId_).." newvalue = "..tostring(newvalue))            
            -- object.rangeType_ = newvalue
            object:setCampId(newvalue)
        end
   }

    -- zorder的修改先不要
    -- lines[#lines + 1] = {
    --     name  = "zorder",
    --     value = string.format("%s", tostring(object:getView():getZOrder())),
    --     edit  = true,
    --     editNote = "object >= 30000",
    --     editFunction = function(object, newvalue)

    --         object.zorder_ = newvalue
    --         self.map_:resetZOrder(object)
    --       --object:getView():setZOrder(newvalue)
    --     end
    -- }  

    self.editButtons_ = {}
    local maxWidth = 0
    local labelX = 26
    local labelY = -14
    for i, pair in ipairs(lines) do
        local prefix = string.rep(" ", EditorConstants.PROPERTY_PREFIX_LEN - string.len(pair.name)) .. pair.name
        local text   = string.format("%s = %s", tostring(prefix), tostring(pair.value))
        local label  = ui.newTTFLabel({
            text  = text,
            font  = EditorConstants.PANEL_LABEL_FONT,
            size  = EditorConstants.PANEL_LABEL_FONT_SIZE,
            align = ui.TEXT_ALIGN_LEFT,
            x     = labelX,
            y     = labelY,
        }):align(display.CENTER_LEFT)
        panel:addChild(label)

        if pair.edit then
            local editButton = display.newSprite("#MapEditor.EditButton", labelX - 10, labelY)
            panel:addChild(editButton)
            pair.x, pair.y = labelX - 10, labelY
            self.editButtons_[#self.editButtons_ + 1] = pair
        end

        labelY = labelY - EditorConstants.PANEL_LABEL_FONT_SIZE - 3
        local size = label:getContentSize()
        if size.width > maxWidth then
            maxWidth = size.width
        end
    end

    local panelWidth  = maxWidth + 30
    if panelWidth < EditorConstants.INSPECTOR_WIDTH then
        panelWidth = EditorConstants.INSPECTOR_WIDTH
    end

    -- labelY = labelY
    
    local panelHeight = -labelY + 54 
   
    self.object_ = object
    self.size_ = {panelWidth, panelHeight}
    self:setPosition()
    self.sprite_:setVisible(self.isVisible_)
    
end

function ObjectInspector:removeObject()
    print("ObjectInspector:removeObject()")
    if self.panel_ then
        self.sprite_:setVisible(false)
        self.panel_:removeSelf()
        self.panel_ = nil
        self.object_ = nil
        self.isVisible_ = true
    end
end

return ObjectInspector
