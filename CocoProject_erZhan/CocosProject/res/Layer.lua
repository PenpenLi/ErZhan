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

--Create Layer
local Layer=cc.Node:create()  
Layer:setName("Layer")
Layer:setPosition(0, 0)
Layer:setScaleX(1)
Layer:setScaleY(1)
Layer:setLocalZOrder(0)
Layer:setOpacity(255)
Layer:setColor(cc.c3b(255, 255, 255))
Layer:setVisible(true)
Layer:setRotation(0)
Layer:setRotationSkewX(0)
Layer:setRotationSkewY(0)
Layer:setTag(3)
Layer:setCascadeColorEnabled(true)
Layer:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Layer)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setSize(cc.size(1334, 750))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(0)
layout:setRightMargin(0)
layout:setTopMargin(0)
layout:setBottomMargin(0)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Layer
return result;
end

return Result
