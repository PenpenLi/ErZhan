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
Node:setTag(151)
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
Panel_1:setTag(152)
Panel_1:setCascadeColorEnabled(true)
Panel_1:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      Panel_1:addClickEventListener(callBackProvider("GetTipsStudio.lua", Panel_1, "ClickEvent"))
end
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

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("ui/getTips/frame.png",0)

Image_1:setFlippedX(false)
Image_1:setFlippedY(false)

Image_1:setScale9Enabled(false)
Image_1:setCapInsets(cc.rect(0,0,779,278))
Image_1:setTouchEnabled(false)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setPosition(0, 0)
Image_1:setScaleX(1)
Image_1:setScaleY(1)
Image_1:setLocalZOrder(0)
Image_1:setAnchorPoint(0.5, 0.5)
Image_1:setOpacity(255)
Image_1:setColor(cc.c3b(255, 255, 255))
Image_1:setVisible(true)
Image_1:setRotation(0)
Image_1:setRotationSkewX(0)
Image_1:setRotationSkewY(0)
Image_1:setTag(154)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.577)
layout:setPercentHeight(0.3233)
layout:setSize(cc.size(779, 278))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-389.5)
layout:setRightMargin(-389.5)
layout:setTopMargin(-139)
layout:setBottomMargin(-139)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_1)

--Create leftHeroBg_2
local leftHeroBg_2 = cc.Sprite:create("ui/hall/chooseModel/leftHeroBg.png")
leftHeroBg_2:setName("leftHeroBg_2")
leftHeroBg_2:setPosition(390.9821, 201.1775)
leftHeroBg_2:setScaleX(1)
leftHeroBg_2:setScaleY(1)
leftHeroBg_2:setLocalZOrder(0)
leftHeroBg_2:setAnchorPoint(0.5, 0.5)
leftHeroBg_2:setOpacity(255)
leftHeroBg_2:setColor(cc.c3b(255, 255, 255))
leftHeroBg_2:setVisible(true)
leftHeroBg_2:setRotation(0)
leftHeroBg_2:setRotationSkewX(0)
leftHeroBg_2:setRotationSkewY(0)
leftHeroBg_2:setTag(155)
leftHeroBg_2:setCascadeColorEnabled(true)
leftHeroBg_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(leftHeroBg_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5019025)
layout:setPositionPercentY(0.7236601)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(111, 112))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(335.4821)
layout:setRightMargin(332.5179)
layout:setTopMargin(20.82251)
layout:setBottomMargin(145.1775)
leftHeroBg_2:setFlippedX(false)
leftHeroBg_2:setFlippedY(false)
Image_1:addChild(leftHeroBg_2)

--Create icon
local icon = ccui.ImageView:create()
icon:ignoreContentAdaptWithSize(false)
icon:loadTexture("ui/Icons/heroIcon/110101.png",0)

icon:setFlippedX(false)
icon:setFlippedY(false)

icon:setScale9Enabled(false)
icon:setCapInsets(cc.rect(0,0,110,110))
icon:setTouchEnabled(false)
icon:setLayoutComponentEnabled(true)
icon:setName("icon")
icon:setPosition(53.982, 59.1784)
icon:setScaleX(0.7)
icon:setScaleY(0.7)
icon:setLocalZOrder(0)
icon:setAnchorPoint(0.5, 0.5)
icon:setOpacity(255)
icon:setColor(cc.c3b(255, 255, 255))
icon:setVisible(true)
icon:setRotation(0)
icon:setRotationSkewX(0)
icon:setRotationSkewY(0)
icon:setTag(156)
icon:setCascadeColorEnabled(true)
icon:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(icon)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4863243)
layout:setPositionPercentY(0.5283785)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.991)
layout:setPercentHeight(0.9821)
layout:setSize(cc.size(110, 110))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-1.018002)
layout:setRightMargin(2.018005)
layout:setTopMargin(-2.178398)
layout:setBottomMargin(4.178398)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
leftHeroBg_2:addChild(icon)

--Create bg_3
local bg_3 = cc.Sprite:create("ui/getTips/bg.png")
bg_3:setName("bg_3")
bg_3:setPosition(389, 126.0172)
bg_3:setScaleX(1)
bg_3:setScaleY(1)
bg_3:setLocalZOrder(0)
bg_3:setAnchorPoint(0.5, 0.5)
bg_3:setOpacity(255)
bg_3:setColor(cc.c3b(255, 255, 255))
bg_3:setVisible(true)
bg_3:setRotation(0)
bg_3:setRotationSkewX(0)
bg_3:setRotationSkewY(0)
bg_3:setTag(157)
bg_3:setCascadeColorEnabled(true)
bg_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4993581)
layout:setPositionPercentY(0.4532993)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(684, 33))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(48)
layout:setTopMargin(135.4828)
layout:setBottomMargin(109.5172)
bg_3:setFlippedX(false)
bg_3:setFlippedY(false)
Image_1:addChild(bg_3)

--Create buyBtn
local buyBtn = ccui.Button:create()
buyBtn:ignoreContentAdaptWithSize(false)
buyBtn:loadTextureNormal("ui/common/btn2.png",0)
buyBtn:loadTexturePressed("ui/common/btn2_on.png",0)
buyBtn:loadTextureDisabled("ui/common/btn3.png",0)
buyBtn:setTitleFontSize(14)
buyBtn:setTitleText("")
buyBtn:setTitleColor(cc.c3b(65, 65, 70))
buyBtn:setFlippedX(false)
buyBtn:setFlippedY(false)
buyBtn:setScale9Enabled(true)
buyBtn:setCapInsets(cc.rect(0,0,123,74))
buyBtn:setBright(true)
buyBtn:setTouchEnabled(true)
buyBtn:setLayoutComponentEnabled(true)
buyBtn:setName("buyBtn")
buyBtn:setPosition(389, 57.1785)
buyBtn:setScaleX(1)
buyBtn:setScaleY(1)
buyBtn:setLocalZOrder(0)
buyBtn:setAnchorPoint(0.5, 0.5)
buyBtn:setOpacity(255)
buyBtn:setColor(cc.c3b(255, 255, 255))
buyBtn:setVisible(true)
buyBtn:setRotation(0)
buyBtn:setRotationSkewX(0)
buyBtn:setRotationSkewY(0)
buyBtn:setTag(158)
buyBtn:setCascadeColorEnabled(true)
buyBtn:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      buyBtn:addClickEventListener(callBackProvider("GetTipsStudio.lua", buyBtn, "ClickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(buyBtn)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4993581)
layout:setPositionPercentY(0.2056781)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(123, 74))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(327.5)
layout:setRightMargin(328.5)
layout:setTopMargin(183.8215)
layout:setBottomMargin(20.1785)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Image_1:addChild(buyBtn)

--Create Text_2
local Text_2 = ccui.Text:create()
Text_2:setFontSize(26)
Text_2:setString([[购买]])
Text_2:setTextHorizontalAlignment(0)
Text_2:setTextVerticalAlignment(0)
Text_2:setTouchScaleChangeEnabled(false)
Text_2:setFlippedX(false)
Text_2:setFlippedY(false)
Text_2:setTouchEnabled(false)
Text_2:setLayoutComponentEnabled(true)
Text_2:setName("Text_2")
Text_2:setPosition(62.3332, 32.3891)
Text_2:setScaleX(1)
Text_2:setScaleY(1)
Text_2:setLocalZOrder(0)
Text_2:setAnchorPoint(0.5, 0.5)
Text_2:setOpacity(255)
Text_2:setColor(cc.c3b(255, 255, 255))
Text_2:setVisible(true)
Text_2:setRotation(0)
Text_2:setRotationSkewX(0)
Text_2:setRotationSkewY(0)
Text_2:setTag(160)
Text_2:setCascadeColorEnabled(true)
Text_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5067739)
layout:setPositionPercentY(0.4376905)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(52, 26))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(36.3332)
layout:setRightMargin(34.6668)
layout:setTopMargin(28.6109)
layout:setBottomMargin(19.3891)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
buyBtn:addChild(Text_2)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result

