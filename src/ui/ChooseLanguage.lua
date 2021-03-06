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
Node:setTag(137)
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
bg:setTouchEnabled(false)
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
bg:setTag(138)
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

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("ui/Language/imageBg.jpg",0)

Image_2:setFlippedX(false)
Image_2:setFlippedY(false)

Image_2:setScale9Enabled(false)
Image_2:setCapInsets(cc.rect(0,0,1350,860))
Image_2:setTouchEnabled(false)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setPosition(0, 0)
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
Image_2:setTag(139)
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
layout:setSize(cc.size(1350, 860))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-675)
layout:setRightMargin(-675)
layout:setTopMargin(-430)
layout:setBottomMargin(-430)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_2)

--Create choose
local choose = ccui.Button:create()
choose:ignoreContentAdaptWithSize(false)
choose:loadTextureNormal("ui/Language/cn.png",0)
choose:loadTexturePressed("ui/Language/cn.png",0)
choose:loadTextureDisabled("Default/Button_Disable.png",0)
choose:setTitleFontSize(22)
choose:setTitleText("")
choose:setTitleColor(cc.c3b(222, 250, 246))
choose:setFlippedX(false)
choose:setFlippedY(false)
choose:setScale9Enabled(true)
choose:setCapInsets(cc.rect(0,0,82,65))
choose:setBright(true)
choose:setTouchEnabled(true)
choose:setLayoutComponentEnabled(true)
choose:setName("choose")
choose:setPosition(575.9995, 326.8779)
choose:setScaleX(1)
choose:setScaleY(1)
choose:setLocalZOrder(0)
choose:setAnchorPoint(0.5, 0.5)
choose:setOpacity(255)
choose:setColor(cc.c3b(255, 255, 255))
choose:setVisible(true)
choose:setRotation(0)
choose:setRotationSkewX(0)
choose:setRotationSkewY(0)
choose:setTag(141)
choose:setCascadeColorEnabled(true)
choose:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      choose:addClickEventListener(callBackProvider("ChooseLanguage.lua", choose, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(choose)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(82, 65))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(534.9995)
layout:setRightMargin(-616.9995)
layout:setTopMargin(-359.3779)
layout:setBottomMargin(294.3779)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(choose)

--Create enter
local enter = ccui.Button:create()
enter:ignoreContentAdaptWithSize(false)
enter:loadTextureNormal("ui/Language/begin.png",0)
enter:loadTexturePressed("ui/Language/begin.png",0)
enter:loadTextureDisabled("Default/Button_Disable.png",0)
enter:setTitleFontSize(22)
enter:setTitleText("")
enter:setTitleColor(cc.c3b(222, 250, 246))
enter:setFlippedX(false)
enter:setFlippedY(false)
enter:setScale9Enabled(true)
enter:setCapInsets(cc.rect(0,0,175,140))
enter:setBright(true)
enter:setTouchEnabled(true)
enter:setLayoutComponentEnabled(true)
enter:setName("enter")
enter:setPosition(6.1583, -214.7996)
enter:setScaleX(1)
enter:setScaleY(1)
enter:setLocalZOrder(0)
enter:setAnchorPoint(0.5, 0.5)
enter:setOpacity(255)
enter:setColor(cc.c3b(255, 255, 255))
enter:setVisible(true)
enter:setRotation(0)
enter:setRotationSkewX(0)
enter:setRotationSkewY(0)
enter:setTag(147)
enter:setCascadeColorEnabled(true)
enter:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      enter:addClickEventListener(callBackProvider("ChooseLanguage.lua", enter, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(enter)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(194, 193))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-90.8417)
layout:setRightMargin(-103.1583)
layout:setTopMargin(118.2996)
layout:setBottomMargin(-311.2996)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(enter)

--Create Text_7
local Text_7 = ccui.Text:create()
Text_7:setFontSize(24)
Text_7:setString([[切换语言]])
Text_7:setTextHorizontalAlignment(0)
Text_7:setTextVerticalAlignment(0)
Text_7:setTouchScaleChangeEnabled(false)
Text_7:setFlippedX(false)
Text_7:setFlippedY(false)
Text_7:setTouchEnabled(false)
Text_7:setLayoutComponentEnabled(true)
Text_7:setName("Text_7")
Text_7:setPosition(575.9995, 281.2493)
Text_7:setScaleX(1)
Text_7:setScaleY(1)
Text_7:setLocalZOrder(0)
Text_7:setAnchorPoint(0.5, 0.5)
Text_7:setOpacity(255)
Text_7:setColor(cc.c3b(255, 255, 255))
Text_7:setVisible(true)
Text_7:setRotation(0)
Text_7:setRotationSkewX(0)
Text_7:setRotationSkewY(0)
Text_7:setTag(543)
Text_7:setCascadeColorEnabled(true)
Text_7:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_7)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(96, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(527.9995)
layout:setRightMargin(-623.9995)
layout:setTopMargin(-293.2493)
layout:setBottomMargin(269.2493)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Text_7)

--Create m1
local m1 = cc.Sprite:create("ui/Language/m1.png")
m1:setName("m1")
m1:setPosition(-320.0151, 43.7139)
m1:setScaleX(1)
m1:setScaleY(1)
m1:setLocalZOrder(0)
m1:setAnchorPoint(0.5, 0.5)
m1:setOpacity(255)
m1:setColor(cc.c3b(255, 255, 255))
m1:setVisible(true)
m1:setRotation(0)
m1:setRotationSkewX(0)
m1:setRotationSkewY(0)
m1:setTag(10)
m1:setCascadeColorEnabled(true)
m1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(m1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(637, 612))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-638.5151)
layout:setRightMargin(1.515106)
layout:setTopMargin(-349.7139)
layout:setBottomMargin(-262.2861)
m1:setFlippedX(false)
m1:setFlippedY(false)
Node:addChild(m1)

--Create m2
local m2 = cc.Sprite:create("ui/Language/m2.png")
m2:setName("m2")
m2:setPosition(325.2032, 5.268)
m2:setScaleX(1)
m2:setScaleY(1)
m2:setLocalZOrder(0)
m2:setAnchorPoint(0.5, 0.5)
m2:setOpacity(255)
m2:setColor(cc.c3b(255, 255, 255))
m2:setVisible(true)
m2:setRotation(0)
m2:setRotationSkewX(0)
m2:setRotationSkewY(0)
m2:setTag(11)
m2:setCascadeColorEnabled(true)
m2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(m2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(433, 540))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(108.7032)
layout:setRightMargin(-541.7032)
layout:setTopMargin(-275.268)
layout:setBottomMargin(-264.732)
m2:setFlippedX(false)
m2:setFlippedY(false)
Node:addChild(m2)

--Create gameName
local gameName = cc.Sprite:create("ui/Language/name_CN.png")
gameName:setName("gameName")
gameName:setPosition(0, 0)
gameName:setScaleX(1)
gameName:setScaleY(1)
gameName:setLocalZOrder(0)
gameName:setAnchorPoint(0.5, 0.5)
gameName:setOpacity(255)
gameName:setColor(cc.c3b(255, 255, 255))
gameName:setVisible(true)
gameName:setRotation(0)
gameName:setRotationSkewX(0)
gameName:setRotationSkewY(0)
gameName:setTag(12)
gameName:setCascadeColorEnabled(true)
gameName:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(gameName)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(587, 334))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-309.5)
layout:setRightMargin(-309.5)
layout:setTopMargin(-157)
layout:setBottomMargin(-157)
gameName:setFlippedX(false)
gameName:setFlippedY(false)
Node:addChild(gameName)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result

