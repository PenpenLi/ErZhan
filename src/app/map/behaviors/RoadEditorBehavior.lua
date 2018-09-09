
local EditorConstants = require("editor.EditorConstants")

local RoadEditorBehavior = class("RoadEditorBehavior", require("app.map.behaviors.BehaviorBase"))

-- 编辑可行走的区域

function RoadEditorBehavior:ctor()
    RoadEditorBehavior.super.ctor(self, "RoadEditorBehavior", nil, 0)
end

function RoadEditorBehavior:bind(object)
   
    object.flagsSprite_ = {}

    local function isViewCreated(object)
        return object.idLabel_ ~= nil
    end
    object:bindMethod(self, "isViewCreated", isViewCreated)

    local function createView(object, batch, marksLayer, debugLayer)
        object.idLabel_ = ui.newTTFLabel({
            text  = object:getId(),
            font  = EditorConstants.LABEL_FONT,
            size  = EditorConstants.LABEL_FONT_SIZE,
            align = ui.TEXT_ALIGN_CENTER,
        })
        debugLayer:addChild(object.idLabel_, EditorConstants.LABEL_ZORDER)
    end
    object:bindMethod(self, "createView", createView)

    local function removeView(object)
        object.idLabel_:removeSelf()
        object.idLabel_ = nil

        for i, flag in ipairs(object.flagsSprite_) do
            flag:removeFromParent()
        end
        object.flagsSprite_ = nil
    end
    object:bindMethod(self, "removeView", removeView, true)

    local function updateView(object)
        if #object.points_ < 1 then return end

        local scale = object.debugLayer_:getScale()
        if scale > 1 then scale = 1 / scale end

        for index, point in ipairs(object.points_) do
            local x, y = unpack(point)
           
            if index == 1 then
                object.idLabel_:setPosition(x, y - 10 - EditorConstants.LABEL_OFFSET_Y)
                object.idLabel_:setScale(scale)
                object.x_, object.y_ = x, y
            end

            if not object.flagsSprite_ then object.flagsSprite_ = {} end
            local flag = object.flagsSprite_[index]
            if not flag then
                -- local color = ccc4BFromccc4F(ccc4FFromccc3B(hexToRGB(object.color)))
                local color = cc.c4fFromc4b(cc.c4fFromc4b(cc.c4b(0, 255, 255, 255))) --object.color))
                
                color.a = 127
                -- flag = CCLayerColor:create(color, 16, 16)
                -- print("object.color.r = "..tostring(object.color.r))
                flag = cc.LayerColor:create(cc.c4b(
                    object.color.r, object.color.g, object.color.b, 100), 16, 16)
                    -- 0, 0, 255, 100), 16, 16)
                
                -- 这个方法没有暴露给lua，先注释掉
                -- flag:setIgnoreAnchorPointForPosition(false)
                flag:ignoreAnchorPointForPosition(false)
                flag:setAnchorPoint(cc.p(0.5, 0.5))
                object.debugLayer_:addChild(flag, EditorConstants.ROAD_ZORDER)
                -- object.batch_:addChild(flag, EditorConstants.ROAD_ZORDER)
                object.flagsSprite_[index] = flag
            end

            flag:setPosition(x, y)
            -- flag:setScale(scale)
        end

        for index = #object.points_ + 1, #object.flagsSprite_ do
            object.flagsSprite_[index]:removeFromParent()
            object.flagsSprite_[index] = nil
        end
    end
    object:bindMethod(self, "updateView", updateView)
end

function RoadEditorBehavior:unbind(object)

    object.flagsSprite_ = nil

    object:unbindMethod(self, "isViewCreated")
    object:unbindMethod(self, "createView")
    object:unbindMethod(self, "removeView")
    object:unbindMethod(self, "updateView")
end

return RoadEditorBehavior
