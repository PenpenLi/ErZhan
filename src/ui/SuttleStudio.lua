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
Node:setTag(336)
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

--Create bg
local bg = ccui.ImageView:create()
bg:ignoreContentAdaptWithSize(false)
bg:loadTexture("ui/common/mask_img.png",0)

bg:setFlippedX(false)
bg:setFlippedY(false)

bg:setScale9Enabled(true)
bg:setCapInsets(cc.rect(20,20,44,43))
bg:setTouchEnabled(true)
bg:setLayoutComponentEnabled(true)
bg:setName("bg")
bg:setPosition(0, 0)
bg:setScaleX(1)
bg:setScaleY(1)
bg:setLocalZOrder(0)
bg:setAnchorPoint(0.5, 0.5)
bg:setOpacity(255)
bg:setColor(cc.c3b(255, 255, 255))
bg:setVisible(true)
bg:setRotation(0)
bg:setRotationSkewX(0)
bg:setRotationSkewY(0)
bg:setTag(337)
bg:setCascadeColorEnabled(true)
bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(bg)
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
Node:addChild(bg)

--Create btn_Back
local btn_Back = ccui.Button:create()
btn_Back:ignoreContentAdaptWithSize(false)
btn_Back:loadTextureNormal("ui/common/btn.png",0)
btn_Back:loadTexturePressed("ui/common/btn2.png",0)
btn_Back:loadTextureDisabled("ui/common/btn3.png",0)
btn_Back:setTitleFontSize(48)
btn_Back:setTitleText("")
btn_Back:setTitleColor(cc.c3b(255, 255, 255))
btn_Back:setFlippedX(false)
btn_Back:setFlippedY(false)
btn_Back:setScale9Enabled(true)
btn_Back:setCapInsets(cc.rect(0,0,164,99))
btn_Back:setBright(true)
btn_Back:setTouchEnabled(true)
btn_Back:setLayoutComponentEnabled(true)
btn_Back:setName("btn_Back")
btn_Back:setPosition(159.6509, -236.9521)
btn_Back:setScaleX(1)
btn_Back:setScaleY(1)
btn_Back:setLocalZOrder(0)
btn_Back:setAnchorPoint(0.5, 0.5)
btn_Back:setOpacity(255)
btn_Back:setColor(cc.c3b(255, 255, 255))
btn_Back:setVisible(true)
btn_Back:setRotation(0)
btn_Back:setRotationSkewX(0)
btn_Back:setRotationSkewY(0)
btn_Back:setTag(345)
btn_Back:setCascadeColorEnabled(true)
btn_Back:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      btn_Back:addClickEventListener(callBackProvider("SuttleStudio.lua", btn_Back, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(btn_Back)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(164, 99))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(77.65088)
layout:setRightMargin(-241.6509)
layout:setTopMargin(187.4521)
layout:setBottomMargin(-286.4521)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(btn_Back)

--Create Back
local Back = ccui.Text:create()
Back:setFontSize(36)
Back:setString([[返回]])
Back:setTextHorizontalAlignment(0)
Back:setTextVerticalAlignment(0)
Back:setTouchScaleChangeEnabled(false)
Back:setFlippedX(false)
Back:setFlippedY(false)
Back:setTouchEnabled(false)
Back:setLayoutComponentEnabled(true)
Back:setName("Back")
Back:setPosition(80.9989, 43.49973)
Back:setScaleX(1)
Back:setScaleY(1)
Back:setLocalZOrder(0)
Back:setAnchorPoint(0.5, 0.5)
Back:setOpacity(255)
Back:setColor(cc.c3b(255, 255, 255))
Back:setVisible(true)
Back:setRotation(0)
Back:setRotationSkewX(0)
Back:setRotationSkewY(0)
Back:setTag(347)
Back:setCascadeColorEnabled(true)
Back:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Back)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4938957)
layout:setPositionPercentY(0.4393912)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(72, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(44.9989)
layout:setRightMargin(47.0011)
layout:setTopMargin(37.50027)
layout:setBottomMargin(25.49973)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
btn_Back:addChild(Back)

--Create btn_Replay
local btn_Replay = ccui.Button:create()
btn_Replay:ignoreContentAdaptWithSize(false)
btn_Replay:loadTextureNormal("ui/common/btn.png",0)
btn_Replay:loadTexturePressed("ui/common/btn2.png",0)
btn_Replay:loadTextureDisabled("ui/common/btn3.png",0)
btn_Replay:setTitleFontSize(48)
btn_Replay:setTitleText("")
btn_Replay:setTitleColor(cc.c3b(255, 255, 255))
btn_Replay:setFlippedX(false)
btn_Replay:setFlippedY(false)
btn_Replay:setScale9Enabled(true)
btn_Replay:setCapInsets(cc.rect(0,0,164,99))
btn_Replay:setBright(true)
btn_Replay:setTouchEnabled(true)
btn_Replay:setLayoutComponentEnabled(true)
btn_Replay:setName("btn_Replay")
btn_Replay:setPosition(-149.0833, -236.9521)
btn_Replay:setScaleX(1)
btn_Replay:setScaleY(1)
btn_Replay:setLocalZOrder(0)
btn_Replay:setAnchorPoint(0.5, 0.5)
btn_Replay:setOpacity(255)
btn_Replay:setColor(cc.c3b(255, 255, 255))
btn_Replay:setVisible(true)
btn_Replay:setRotation(0)
btn_Replay:setRotationSkewX(0)
btn_Replay:setRotationSkewY(0)
btn_Replay:setTag(344)
btn_Replay:setCascadeColorEnabled(true)
btn_Replay:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      btn_Replay:addClickEventListener(callBackProvider("SuttleStudio.lua", btn_Replay, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(btn_Replay)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(164, 99))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-231.0833)
layout:setRightMargin(67.08325)
layout:setTopMargin(187.4521)
layout:setBottomMargin(-286.4521)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(btn_Replay)

--Create Replay
local Replay = ccui.Text:create()
Replay:setFontSize(36)
Replay:setString([[重玩]])
Replay:setTextHorizontalAlignment(0)
Replay:setTextVerticalAlignment(0)
Replay:setTouchScaleChangeEnabled(false)
Replay:setFlippedX(false)
Replay:setFlippedY(false)
Replay:setTouchEnabled(false)
Replay:setLayoutComponentEnabled(true)
Replay:setName("Replay")
Replay:setPosition(80.9989, 43.49973)
Replay:setScaleX(1)
Replay:setScaleY(1)
Replay:setLocalZOrder(0)
Replay:setAnchorPoint(0.5, 0.5)
Replay:setOpacity(255)
Replay:setColor(cc.c3b(255, 255, 255))
Replay:setVisible(true)
Replay:setRotation(0)
Replay:setRotationSkewX(0)
Replay:setRotationSkewY(0)
Replay:setTag(346)
Replay:setCascadeColorEnabled(true)
Replay:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Replay)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4938957)
layout:setPositionPercentY(0.4393912)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(72, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(44.9989)
layout:setRightMargin(47.0011)
layout:setTopMargin(37.50027)
layout:setBottomMargin(25.49973)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
btn_Replay:addChild(Replay)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("ui/fight/wingame/bg.png",0)

Image_2:setFlippedX(false)
Image_2:setFlippedY(false)

Image_2:setScale9Enabled(false)
Image_2:setCapInsets(cc.rect(0,0,535,323))
Image_2:setTouchEnabled(false)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setPosition(0.204834, -27.45667)
Image_2:setScaleX(1)
Image_2:setScaleY(1)
Image_2:setLocalZOrder(0)
Image_2:setAnchorPoint(0.5, 0.5)
Image_2:setOpacity(255)
Image_2:setColor(cc.c3b(255, 255, 255))
Image_2:setVisible(true)
Image_2:setRotation(0)
Image_2:setRotationSkewX(0)
Image_2:setRotationSkewY(0)
Image_2:setTag(338)
Image_2:setCascadeColorEnabled(true)
Image_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(535, 323))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-267.2952)
layout:setRightMargin(-267.7048)
layout:setTopMargin(-134.0433)
layout:setBottomMargin(-188.9567)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_2)

--Create Image_3
local Image_3 = ccui.ImageView:create()
Image_3:ignoreContentAdaptWithSize(false)
Image_3:loadTexture("ui/fight/wingame/upBgWin.png",0)

Image_3:setFlippedX(false)
Image_3:setFlippedY(false)

Image_3:setScale9Enabled(false)
Image_3:setCapInsets(cc.rect(0,0,635,261))
Image_3:setTouchEnabled(false)
Image_3:setLayoutComponentEnabled(true)
Image_3:setName("Image_3")
Image_3:setPosition(0.2053223, 157.3)
Image_3:setScaleX(1)
Image_3:setScaleY(1)
Image_3:setLocalZOrder(0)
Image_3:setAnchorPoint(0.5, 0.5)
Image_3:setOpacity(255)
Image_3:setColor(cc.c3b(255, 255, 255))
Image_3:setVisible(true)
Image_3:setRotation(0)
Image_3:setRotationSkewX(0)
Image_3:setRotationSkewY(0)
Image_3:setTag(339)
Image_3:setCascadeColorEnabled(true)
Image_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(635, 261))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-317.2947)
layout:setRightMargin(-317.7053)
layout:setTopMargin(-287.8)
layout:setBottomMargin(26.80005)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_3)

--Create Image_4
local Image_4 = ccui.ImageView:create()
Image_4:ignoreContentAdaptWithSize(false)
Image_4:loadTexture("ui/fight/wingame/win_CN.png",0)

Image_4:setFlippedX(false)
Image_4:setFlippedY(false)

Image_4:setScale9Enabled(false)
Image_4:setCapInsets(cc.rect(0,0,239,123))
Image_4:setTouchEnabled(false)
Image_4:setLayoutComponentEnabled(true)
Image_4:setName("Image_4")
Image_4:setPosition(0.2027588, 141.4106)
Image_4:setScaleX(1)
Image_4:setScaleY(1)
Image_4:setLocalZOrder(0)
Image_4:setAnchorPoint(0.5, 0.5)
Image_4:setOpacity(255)
Image_4:setColor(cc.c3b(255, 255, 255))
Image_4:setVisible(true)
Image_4:setRotation(0)
Image_4:setRotationSkewX(0)
Image_4:setRotationSkewY(0)
Image_4:setTag(340)
Image_4:setCascadeColorEnabled(true)
Image_4:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_4)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(239, 123))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-119.2972)
layout:setRightMargin(-119.7028)
layout:setTopMargin(-202.9106)
layout:setBottomMargin(79.91058)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_4)

--Create star_3
local star_3 = ccui.ImageView:create()
star_3:ignoreContentAdaptWithSize(false)
star_3:loadTexture("ui/fight/wingame/starRight.png",0)

star_3:setFlippedX(false)
star_3:setFlippedY(false)

star_3:setScale9Enabled(false)
star_3:setCapInsets(cc.rect(0,0,118,111))
star_3:setTouchEnabled(false)
star_3:setLayoutComponentEnabled(true)
star_3:setName("star_3")
star_3:setPosition(139.6045, -7.928406)
star_3:setScaleX(1)
star_3:setScaleY(1)
star_3:setLocalZOrder(0)
star_3:setAnchorPoint(0.5, 0.5)
star_3:setOpacity(255)
star_3:setColor(cc.c3b(255, 255, 255))
star_3:setVisible(true)
star_3:setRotation(0)
star_3:setRotationSkewX(0)
star_3:setRotationSkewY(0)
star_3:setTag(343)
star_3:setCascadeColorEnabled(true)
star_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(star_3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(118, 111))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(80.60449)
layout:setRightMargin(-198.6045)
layout:setTopMargin(-47.57159)
layout:setBottomMargin(-63.42841)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(star_3)

--Create star_2
local star_2 = ccui.ImageView:create()
star_2:ignoreContentAdaptWithSize(false)
star_2:loadTexture("ui/fight/wingame/star.png",0)

star_2:setFlippedX(false)
star_2:setFlippedY(false)

star_2:setScale9Enabled(false)
star_2:setCapInsets(cc.rect(0,0,142,129))
star_2:setTouchEnabled(false)
star_2:setLayoutComponentEnabled(true)
star_2:setName("star_2")
star_2:setPosition(0.2003174, -30.45587)
star_2:setScaleX(1)
star_2:setScaleY(1)
star_2:setLocalZOrder(0)
star_2:setAnchorPoint(0.5, 0.5)
star_2:setOpacity(255)
star_2:setColor(cc.c3b(255, 255, 255))
star_2:setVisible(true)
star_2:setRotation(0)
star_2:setRotationSkewX(0)
star_2:setRotationSkewY(0)
star_2:setTag(342)
star_2:setCascadeColorEnabled(true)
star_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(star_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(118, 111))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-58.79968)
layout:setRightMargin(-59.20032)
layout:setTopMargin(-25.04413)
layout:setBottomMargin(-85.95587)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(star_2)

--Create star_1
local star_1 = ccui.ImageView:create()
star_1:ignoreContentAdaptWithSize(false)
star_1:loadTexture("ui/fight/wingame/starRight.png",0)

star_1:setFlippedX(true)
star_1:setFlippedY(false)

star_1:setScale9Enabled(false)
star_1:setCapInsets(cc.rect(0,0,118,111))
star_1:setTouchEnabled(false)
star_1:setLayoutComponentEnabled(true)
star_1:setName("star_1")
star_1:setPosition(-141.2878, -7.928406)
star_1:setScaleX(1)
star_1:setScaleY(1)
star_1:setLocalZOrder(0)
star_1:setAnchorPoint(0.5, 0.5)
star_1:setOpacity(255)
star_1:setColor(cc.c3b(255, 255, 255))
star_1:setVisible(true)
star_1:setRotation(0)
star_1:setRotationSkewX(0)
star_1:setRotationSkewY(0)
star_1:setTag(341)
star_1:setCascadeColorEnabled(true)
star_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(star_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(118, 111))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-200.2878)
layout:setRightMargin(82.28784)
layout:setTopMargin(-47.57159)
layout:setBottomMargin(-63.42841)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(star_1)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result
