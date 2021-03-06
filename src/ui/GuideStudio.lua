--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend.lua"
local CreatePositionFrame = luaExtend.CreatePositionFrame
local CreateVisibleFrame = luaExtend.CreateVisibleFrame
local CreateColorFrame = luaExtend.CreateColorFrame
local CreateEventFrame = luaExtend.CreateEventFrame
local CreateInnerActionFrame = luaExtend.CreateInnerActionFrame
local CreateAlphaFrame = luaExtend.CreateAlphaFrame
local CreateZOrderFrame = luaExtend.CreateZOrderFrame
local CreateScaleFrame = luaExtend.CreateScaleFrame
local CreateRotationSkewFrame = luaExtend.CreateRotationSkewFrame
local CreateAnchorPointFrame = luaExtend.CreateAnchorPointFrame
local CreateTextureFrame = luaExtend.CreateTextureFrame

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Node
local Node=cc.Node:create()  
Node:setName("Node")
Node:setPosition(0, 0)
Node:setScaleX(1)
Node:setScaleY(1)
Node:setLocalZOrder(0)
Node:setAnchorPoint(0, 0)
Node:setOpacity(255)
Node:setColor(cc.c3b(255, 255, 255))
Node:setVisible(true)
Node:setRotation(0)
Node:setRotationSkewX(0)
Node:setRotationSkewY(0)
Node:setTag(325)
Node:setCascadeColorEnabled(true)
Node:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(0, 0))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(0)
layout:setRightMargin(0)
layout:setTopMargin(0)
layout:setBottomMargin(0)

--Create Panel_1
local Panel_1 = ccui.Layout:create()
Panel_1:ignoreContentAdaptWithSize(false)

Panel_1:setClippingEnabled(false)
Panel_1:setBackGroundImageCapInsets(cc.rect(0,0,0,0))
Panel_1:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_1:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_1:setBackGroundColorVector(cc.p(0,1))
Panel_1:setBackGroundColorType(0)
Panel_1:setBackGroundColorOpacity(102)
Panel_1:setBackGroundImageScale9Enabled(false)

Panel_1:setTouchEnabled(true)
Panel_1:setLayoutComponentEnabled(true)
Panel_1:setName("Panel_1")
Panel_1:setPosition(0, 0)
Panel_1:setScaleX(1)
Panel_1:setScaleY(1)
Panel_1:setLocalZOrder(0)
Panel_1:setAnchorPoint(0.5, 0.5)
Panel_1:setOpacity(255)
Panel_1:setColor(cc.c3b(255, 255, 255))
Panel_1:setVisible(true)
Panel_1:setRotation(0)
Panel_1:setRotationSkewX(0)
Panel_1:setRotationSkewY(0)
Panel_1:setTag(326)
Panel_1:setCascadeColorEnabled(true)
Panel_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(1350, 860))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-675)
layout:setRightMargin(-675)
layout:setTopMargin(-430)
layout:setBottomMargin(-430)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_1)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result

