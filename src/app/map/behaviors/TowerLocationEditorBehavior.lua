
local math2d = require("math2d")
local EditorConstants = require("editor.EditorConstants")
local BehaviorBase = require("app.map.behaviors.BehaviorBase")

local TowerLocationEditorBehavior = class("TowerLocationEditorBehavior", BehaviorBase)

TowerLocationEditorBehavior.SELECTED_COLOR          = {0, 0, 255, 255}
TowerLocationEditorBehavior.SELECTED_LABEL_COLOR    = {0, 0, 255}
TowerLocationEditorBehavior.UNSELECTED_COLOR        = {150, 90, 150, 255}
TowerLocationEditorBehavior.UNSELECTED_LABEL_COLOR  = {120, 30, 120}

function TowerLocationEditorBehavior:ctor()
    TowerLocationEditorBehavior.super.ctor(self, "TowerLocationEditorBehavior", nil, 0)
end

function TowerLocationEditorBehavior:bind(object)
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
        --     align = cc.ui.TEXT_ALIGN_CENTER,
        -- })
        object.idLabel_ = cc.ui.UILabel.new({
            text  = object:getId(),
            font  = EditorConstants.LABEL_FONT,
            size  = EditorConstants.LABEL_FONT_SIZE,
            align = cc.ui.TEXT_ALIGN_CENTER,
        }):align(display.CENTER)
        debugLayer:addChild(object.idLabel_, EditorConstants.LABEL_ZORDER)

        object.radiusCircle_ = display.newCircle(object.radius_)
        object.radiusCircle_:setScaleY(0.8)
        debugLayer:addChild(object.radiusCircle_, EditorConstants.CIRCLE_ZORDER)

        object.flagSprite_ = display.newSprite("#MapEditor.RangeFlag") 
        -- ResourceManager.getUI("MapEditor.RangeFlag")
        debugLayer:addChild(object.flagSprite_, EditorConstants.FLAG_ZORDER)

        object.handler_ =  display.newSprite("#MapEditor.RangeHandler")
        -- object.handler_ =  ResourceManager.getUI("MapEditor.RangeHandler")

        object.handler_:setVisible(false)
        debugLayer:addChild(object.handler_, EditorConstants.RANGE_HANDLER_ZORDER)
    end
    object:bindMethod(self, "createView", createView)

    local function removeView(object)
        -- print("TowerLocationEditorBehavior removeView")
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

        local x, y = math.floor(object.x_), math.floor(object.y_)
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
            object.idLabel_:setColor(cc.c3b(unpack(TowerLocationEditorBehavior.SELECTED_LABEL_COLOR)))
            object.radiusCircle_:setLineColor(cc.c4fFromc4b(cc.c4b(unpack(TowerLocationEditorBehavior.SELECTED_COLOR))))
        else
            object.idLabel_:setColor(cc.c3b(unpack(TowerLocationEditorBehavior.UNSELECTED_LABEL_COLOR)))
            object.radiusCircle_:setLineColor(cc.c4fFromc4b(cc.c4b(unpack(TowerLocationEditorBehavior.UNSELECTED_COLOR))))
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
end

function TowerLocationEditorBehavior:unbind(object)
    object.isSelected_ = nil

    object:unbindMethod(self, "isSelected")
    object:unbindMethod(self, "setSelected")
    object:unbindMethod(self, "isViewCreated")
    object:unbindMethod(self, "createView")
    object:unbindMethod(self, "removeView")
    object:unbindMethod(self, "updateView")
    object:unbindMethod(self, "checkPointIn")
    object:unbindMethod(self, "checkPointInHandler")
end

return TowerLocationEditorBehavior
