
local math2d = require("math2d")
local EditorConstants = require("editor.EditorConstants")
local BehaviorBase = require("app.map.behaviors.BehaviorBase")

local RangeObjectEditorBehavior = class("RangeObjectEditorBehavior", BehaviorBase)

RangeObjectEditorBehavior.SELECTED_COLOR          = {0, 0, 255, 255}
RangeObjectEditorBehavior.SELECTED_LABEL_COLOR    = {0, 0, 255}
RangeObjectEditorBehavior.UNSELECTED_COLOR        = {150, 90, 150, 255}
RangeObjectEditorBehavior.UNSELECTED_LABEL_COLOR  = {120, 30, 120}

function RangeObjectEditorBehavior:ctor()
    RangeObjectEditorBehavior.super.ctor(self, "RangeObjectEditorBehavior", nil, 0)
end

function RangeObjectEditorBehavior:bind(object)
    object.isSelected_  = false

    local function isSelected(object)
        return object.isSelected_
    end
    object:bindMethod(self, "isSelected", isSelected)

    local function setSelected(object, isSelected)
        object.isSelected_ = isSelected
    end
    object:bindMethod(self, "setSelected", setSelected)

    local function isViewCreated(object)
        return object.idLabel_ ~= nil
    end
    object:bindMethod(self, "isViewCreated", isViewCreated)

    local function createView(object, batch, marksLayer, debugLayer)
        -- object.idLabel_ = ui.newTTFLabel({
        --     text  = object:getId(),
        --     font  = EditorConstants.LABEL_FONT,
        --     size  = EditorConstants.LABEL_FONT_SIZE,
        --     align = ui.TEXT_ALIGN_CENTER,
        -- })
        object.idLabel_ = cc.ui.UILabel.new({
            text  = object:getId(),
            font  = EditorConstants.LABEL_FONT,
            size  = EditorConstants.LABEL_FONT_SIZE,
            align = cc.ui.TEXT_ALIGN_CENTER,
        }):align(display.CENTER)
        object.idLabel_.offsetY = math.floor(-object.radius_ - EditorConstants.LABEL_OFFSET_Y)
        debugLayer:addChild(object.idLabel_, EditorConstants.LABEL_ZORDER)

        object.radiusCircle_ = display.newCircle(object.radius_)
        object.radiusCircle_:setScaleY(0.8)
        debugLayer:addChild(object.radiusCircle_, EditorConstants.CIRCLE_ZORDER)

        object.flagSprite_ = display.newSprite("#MapEditor.RangeFlag")
        debugLayer:addChild(object.flagSprite_, EditorConstants.FLAG_ZORDER)

        object.handler_ =  display.newSprite("#MapEditor.RangeHandler")

        object.handler_:setVisible(false)
        debugLayer:addChild(object.handler_, EditorConstants.RANGE_HANDLER_ZORDER)
    end
    object:bindMethod(self, "createView", createView)

    local function removeView(object)
        object.idLabel_:removeSelf()
        object.idLabel_ = nil

        object.radiusCircle_:removeSelf()
        object.radiusCircle_ = nil

        object.flagSprite_:removeSelf()
        object.flagSprite_ = nil

        object.handler_:removeSelf()
        object.handler_ = nil
    end
    object:bindMethod(self, "removeView", removeView, true)

    local function updateView(object)
        local scale = object.debugLayer_:getScale()
        if scale > 1 then scale = 1 / scale end

        local x, y = math.floor(object.x_+object.radiusOffsetX_), math.floor(object.y_+object.radiusOffsetY_)
        object.idLabel_:setPosition(x, y - EditorConstants.LABEL_FONT_SIZE - 10)
        object.idLabel_:setScale(scale)

        object.radiusCircle_:setPosition(x, y)
        object.radiusCircle_:setRadius(object.radius_)
        object.flagSprite_:setPosition(x, y)
        object.flagSprite_:setScale(scale)

        object.handler_:setPosition(x + object.radius_, y)
        object.handler_:setVisible(object.isSelected_)
        object.handler_:setScale(scale)

        if object.isSelected_ then
            object.idLabel_:setColor(cc.c3b(unpack(RangeObjectEditorBehavior.SELECTED_LABEL_COLOR)))
            object.radiusCircle_:setLineColor(cc.c4fFromc4b(cc.c4b(unpack(RangeObjectEditorBehavior.SELECTED_COLOR))))
        else
            object.idLabel_:setColor(cc.c3b(unpack(RangeObjectEditorBehavior.UNSELECTED_LABEL_COLOR)))
            object.radiusCircle_:setLineColor(cc.c4fFromc4b(cc.c4b(unpack(RangeObjectEditorBehavior.UNSELECTED_COLOR))))
        end
    end
    object:bindMethod(self, "updateView", updateView)

    local function checkPointIn(object, x, y)
        return math2d.dist(x, y, object.x_, object.y_) <= object.radius_
    end
    object:bindMethod(self, "checkPointIn", checkPointIn)

    local function checkPointInHandler(object, x, y)
        local hx, hy = object.x_, object.y_
        hx = hx + object.radius_
        return math2d.dist(x, y, hx, hy) <= EditorConstants.CHECK_POINT_DIST
    end
    object:bindMethod(self, "checkPointInHandler", checkPointInHandler)
    
    local function openGate(object)
         if object.view_:hasAnimation("open") then
            object:play("open")
        end
    end
    object:bindMethod(self,"openGate",openGate)
end

function RangeObjectEditorBehavior:unbind(object)
    object.isSelected_ = nil

    object:unbindMethod(self, "isSelected")
    object:unbindMethod(self, "setSelected")
    object:unbindMethod(self, "isViewCreated")
    object:unbindMethod(self, "createView")
    object:unbindMethod(self, "removeView")
    object:unbindMethod(self, "updateView")
    object:unbindMethod(self, "checkPointIn")
    object:unbindMethod(self, "openGate")
    object:unbindMethod(self, "checkPointInHandler")
end

return RangeObjectEditorBehavior
