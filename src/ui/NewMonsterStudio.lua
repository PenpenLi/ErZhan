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
Node:setTag(490)
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

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("ui/common/mask_img.png",0)

Image_1:setFlippedX(false)
Image_1:setFlippedY(false)

Image_1:setScale9Enabled(true)
Image_1:setCapInsets(cc.rect(20,20,44,43))
Image_1:setTouchEnabled(true)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setPosition(9.999817, 23.99991)
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
Image_1:setTag(492)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      Image_1:addClickEventListener(callBackProvider("NewMonsterStudio.lua", Image_1, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
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
layout:setLeftMargin(-665.0002)
layout:setRightMargin(-684.9998)
layout:setTopMargin(-453.9999)
layout:setBottomMargin(-406.0001)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_1)

--Create Button
local Button = ccui.Button:create()
Button:ignoreContentAdaptWithSize(false)
Button:loadTextureNormal("ui/fight/gameGuide/btnOk_CN.png",0)
Button:loadTexturePressed("ui/fight/gameGuide/btnOk_CN.png",0)
Button:loadTextureDisabled("ui/fight/gameGuide/btnOk_CN.png",0)
Button:setTitleFontSize(14)
Button:setTitleText("")
Button:setTitleColor(cc.c3b(65, 65, 70))
Button:setFlippedX(false)
Button:setFlippedY(false)
Button:setScale9Enabled(true)
Button:setCapInsets(cc.rect(0,0,366,95))
Button:setBright(true)
Button:setTouchEnabled(true)
Button:setLayoutComponentEnabled(true)
Button:setName("Button")
Button:setPosition(1.4999, -191)
Button:setScaleX(1)
Button:setScaleY(1)
Button:setLocalZOrder(0)
Button:setAnchorPoint(0.5, 0.5)
Button:setOpacity(255)
Button:setColor(cc.c3b(255, 255, 255))
Button:setVisible(true)
Button:setRotation(0)
Button:setRotationSkewX(0)
Button:setRotationSkewY(0)
Button:setTag(571)
Button:setCascadeColorEnabled(true)
Button:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      Button:addClickEventListener(callBackProvider("NewMonsterStudio.lua", Button, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(Button)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(367, 95))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-182.0001)
layout:setRightMargin(-184.9999)
layout:setTopMargin(143.5)
layout:setBottomMargin(-238.5)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Button)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("ui/tips/bg.png",0)

Image_2:setFlippedX(false)
Image_2:setFlippedY(false)

Image_2:setScale9Enabled(true)
Image_2:setCapInsets(cc.rect(0,0,657,408))
Image_2:setTouchEnabled(true)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setPosition(0, 27)
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
Image_2:setTag(493)
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
layout:setSize(cc.size(657, 408))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-328.5)
layout:setRightMargin(-328.5)
layout:setTopMargin(-231)
layout:setBottomMargin(-177)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_2)

--Create title_16
local title_16 = cc.Sprite:create("ui/starFrame/titleFrame.png")
title_16:setName("title_16")
title_16:setPosition(-0.5, 210)
title_16:setScaleX(1)
title_16:setScaleY(1)
title_16:setLocalZOrder(0)
title_16:setAnchorPoint(0.5, 0.5)
title_16:setOpacity(255)
title_16:setColor(cc.c3b(255, 255, 255))
title_16:setVisible(true)
title_16:setRotation(0)
title_16:setRotationSkewX(0)
title_16:setRotationSkewY(0)
title_16:setTag(552)
title_16:setCascadeColorEnabled(true)
title_16:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(title_16)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(269, 62))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-135)
layout:setRightMargin(-134)
layout:setTopMargin(-241)
layout:setBottomMargin(179)
title_16:setFlippedX(false)
title_16:setFlippedY(false)
Node:addChild(title_16)

--Create Image_5
local Image_5 = ccui.ImageView:create()
Image_5:ignoreContentAdaptWithSize(false)
Image_5:loadTexture("ui/tips/imageFrame.png",0)

Image_5:setFlippedX(false)
Image_5:setFlippedY(false)

Image_5:setScale9Enabled(false)
Image_5:setCapInsets(cc.rect(0,0,306,202))
Image_5:setTouchEnabled(true)
Image_5:setLayoutComponentEnabled(true)
Image_5:setName("Image_5")
Image_5:setPosition(-234.0057, 18.0003)
Image_5:setScaleX(1)
Image_5:setScaleY(1)
Image_5:setLocalZOrder(0)
Image_5:setAnchorPoint(0.5, 0.5)
Image_5:setOpacity(255)
Image_5:setColor(cc.c3b(255, 255, 255))
Image_5:setVisible(true)
Image_5:setRotation(-9.9998)
Image_5:setRotationSkewX(-9.9998)
Image_5:setRotationSkewY(-10.0001)
Image_5:setTag(553)
Image_5:setCascadeColorEnabled(true)
Image_5:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_5)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(306, 202))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-387.0057)
layout:setRightMargin(81.00571)
layout:setTopMargin(-119.0003)
layout:setBottomMargin(-82.9997)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_5)

--Create Text_9
local Text_9 = ccui.Text:create()
Text_9:setFontSize(36)
Text_9:setString([[冰霜巨龙]])
Text_9:setTextHorizontalAlignment(1)
Text_9:setTextVerticalAlignment(1)
Text_9:setTouchScaleChangeEnabled(false)
Text_9:setFlippedX(false)
Text_9:setFlippedY(false)
Text_9:setTouchEnabled(false)
Text_9:setLayoutComponentEnabled(true)
Text_9:setName("Text_9")
Text_9:setPosition(3.499, 207.75)
Text_9:setScaleX(1)
Text_9:setScaleY(1)
Text_9:setLocalZOrder(0)
Text_9:setAnchorPoint(0.5, 0.5)
Text_9:setOpacity(255)
Text_9:setColor(cc.c3b(255, 255, 255))
Text_9:setVisible(true)
Text_9:setRotation(0)
Text_9:setRotationSkewX(0)
Text_9:setRotationSkewY(0)
Text_9:setTag(554)
Text_9:setCascadeColorEnabled(true)
Text_9:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_9)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(144, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-68.501)
layout:setRightMargin(-75.499)
layout:setTopMargin(-225.75)
layout:setBottomMargin(189.75)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Text_9)

--Create Panel_5
local Panel_5 = ccui.Layout:create()
Panel_5:ignoreContentAdaptWithSize(false)
Panel_5:setBackGroundImage("ui/hall/encyclopedia/attrImg.png",0)

Panel_5:setClippingEnabled(false)
Panel_5:setBackGroundImageCapInsets(cc.rect(0,0,124,32))
Panel_5:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_5:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_5:setBackGroundColorVector(cc.p(0,1))
Panel_5:setBackGroundColorType(0)
Panel_5:setBackGroundColorOpacity(102)
Panel_5:setBackGroundImageScale9Enabled(false)

Panel_5:setTouchEnabled(true)
Panel_5:setLayoutComponentEnabled(true)
Panel_5:setName("Panel_5")
Panel_5:setPosition(-47.2499, -9.999)
Panel_5:setScaleX(1)
Panel_5:setScaleY(1)
Panel_5:setLocalZOrder(0)
Panel_5:setAnchorPoint(0, 0)
Panel_5:setOpacity(255)
Panel_5:setColor(cc.c3b(255, 255, 255))
Panel_5:setVisible(true)
Panel_5:setRotation(0)
Panel_5:setRotationSkewX(0)
Panel_5:setRotationSkewY(0)
Panel_5:setTag(555)
Panel_5:setCascadeColorEnabled(true)
Panel_5:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_5)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(129, 31))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-47.2499)
layout:setRightMargin(-81.7501)
layout:setTopMargin(-21.001)
layout:setBottomMargin(-9.999)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_5)

--Create hp
local hp = cc.Sprite:create("ui/Icons/hp.png")
hp:setName("hp")
hp:setPosition(11.5, 15)
hp:setScaleX(1)
hp:setScaleY(1)
hp:setLocalZOrder(0)
hp:setAnchorPoint(0.5, 0.5)
hp:setOpacity(255)
hp:setColor(cc.c3b(255, 255, 255))
hp:setVisible(true)
hp:setRotation(0)
hp:setRotationSkewX(0)
hp:setRotationSkewY(0)
hp:setTag(556)
hp:setCascadeColorEnabled(true)
hp:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(hp)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.08914728)
layout:setPositionPercentY(0.483871)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(36, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-6.5)
layout:setRightMargin(99.5)
layout:setTopMargin(-2)
layout:setBottomMargin(-3)
hp:setFlippedX(false)
hp:setFlippedY(false)
Panel_5:addChild(hp)

--Create hp_Text
local hp_Text = ccui.Text:create()
hp_Text:setFontSize(24)
hp_Text:setString([[1000]])
hp_Text:setTextHorizontalAlignment(0)
hp_Text:setTextVerticalAlignment(0)
hp_Text:setTouchScaleChangeEnabled(false)
hp_Text:setFlippedX(false)
hp_Text:setFlippedY(false)
hp_Text:setTouchEnabled(false)
hp_Text:setLayoutComponentEnabled(true)
hp_Text:setName("hp_Text")
hp_Text:setPosition(71, 11)
hp_Text:setScaleX(1)
hp_Text:setScaleY(1)
hp_Text:setLocalZOrder(0)
hp_Text:setAnchorPoint(0.5, 0.5)
hp_Text:setOpacity(255)
hp_Text:setColor(cc.c3b(44, 25, 14))
hp_Text:setVisible(true)
hp_Text:setRotation(0)
hp_Text:setRotationSkewX(0)
hp_Text:setRotationSkewY(0)
hp_Text:setTag(557)
hp_Text:setCascadeColorEnabled(true)
hp_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(hp_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5503876)
layout:setPositionPercentY(0.3548387)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(48, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(34)
layout:setTopMargin(8)
layout:setBottomMargin(-1)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_5:addChild(hp_Text)

--Create Panel_5_0
local Panel_5_0 = ccui.Layout:create()
Panel_5_0:ignoreContentAdaptWithSize(false)
Panel_5_0:setBackGroundImage("ui/hall/encyclopedia/attrImg.png",0)

Panel_5_0:setClippingEnabled(false)
Panel_5_0:setBackGroundImageCapInsets(cc.rect(0,0,124,32))
Panel_5_0:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_5_0:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_5_0:setBackGroundColorVector(cc.p(0,1))
Panel_5_0:setBackGroundColorType(0)
Panel_5_0:setBackGroundColorOpacity(102)
Panel_5_0:setBackGroundImageScale9Enabled(false)

Panel_5_0:setTouchEnabled(true)
Panel_5_0:setLayoutComponentEnabled(true)
Panel_5_0:setName("Panel_5_0")
Panel_5_0:setPosition(149.4999, -9.999)
Panel_5_0:setScaleX(1)
Panel_5_0:setScaleY(1)
Panel_5_0:setLocalZOrder(0)
Panel_5_0:setAnchorPoint(0, 0)
Panel_5_0:setOpacity(255)
Panel_5_0:setColor(cc.c3b(255, 255, 255))
Panel_5_0:setVisible(true)
Panel_5_0:setRotation(0)
Panel_5_0:setRotationSkewX(0)
Panel_5_0:setRotationSkewY(0)
Panel_5_0:setTag(558)
Panel_5_0:setCascadeColorEnabled(true)
Panel_5_0:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_5_0)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(129, 31))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(149.4999)
layout:setRightMargin(-278.4999)
layout:setTopMargin(-21.001)
layout:setBottomMargin(-9.999)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_5_0)

--Create attack
local attack = cc.Sprite:create("ui/Icons/attack.png")
attack:setName("attack")
attack:setPosition(11.5, 15)
attack:setScaleX(1)
attack:setScaleY(1)
attack:setLocalZOrder(0)
attack:setAnchorPoint(0.5, 0.5)
attack:setOpacity(255)
attack:setColor(cc.c3b(255, 255, 255))
attack:setVisible(true)
attack:setRotation(0)
attack:setRotationSkewX(0)
attack:setRotationSkewY(0)
attack:setTag(559)
attack:setCascadeColorEnabled(true)
attack:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(attack)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.08914728)
layout:setPositionPercentY(0.483871)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(36, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-6.5)
layout:setRightMargin(99.5)
layout:setTopMargin(-2)
layout:setBottomMargin(-3)
attack:setFlippedX(false)
attack:setFlippedY(false)
Panel_5_0:addChild(attack)

--Create attack_Text
local attack_Text = ccui.Text:create()
attack_Text:setFontSize(24)
attack_Text:setString([[1000]])
attack_Text:setTextHorizontalAlignment(0)
attack_Text:setTextVerticalAlignment(0)
attack_Text:setTouchScaleChangeEnabled(false)
attack_Text:setFlippedX(false)
attack_Text:setFlippedY(false)
attack_Text:setTouchEnabled(false)
attack_Text:setLayoutComponentEnabled(true)
attack_Text:setName("attack_Text")
attack_Text:setPosition(71, 11)
attack_Text:setScaleX(1)
attack_Text:setScaleY(1)
attack_Text:setLocalZOrder(0)
attack_Text:setAnchorPoint(0.5, 0.5)
attack_Text:setOpacity(255)
attack_Text:setColor(cc.c3b(44, 25, 14))
attack_Text:setVisible(true)
attack_Text:setRotation(0)
attack_Text:setRotationSkewX(0)
attack_Text:setRotationSkewY(0)
attack_Text:setTag(560)
attack_Text:setCascadeColorEnabled(true)
attack_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(attack_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5503876)
layout:setPositionPercentY(0.3548387)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(48, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(34)
layout:setTopMargin(8)
layout:setBottomMargin(-1)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_5_0:addChild(attack_Text)

--Create Panel_5_1
local Panel_5_1 = ccui.Layout:create()
Panel_5_1:ignoreContentAdaptWithSize(false)
Panel_5_1:setBackGroundImage("ui/hall/encyclopedia/attrImg.png",0)

Panel_5_1:setClippingEnabled(false)
Panel_5_1:setBackGroundImageCapInsets(cc.rect(0,0,124,32))
Panel_5_1:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_5_1:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_5_1:setBackGroundColorVector(cc.p(0,1))
Panel_5_1:setBackGroundColorType(0)
Panel_5_1:setBackGroundColorOpacity(102)
Panel_5_1:setBackGroundImageScale9Enabled(false)

Panel_5_1:setTouchEnabled(true)
Panel_5_1:setLayoutComponentEnabled(true)
Panel_5_1:setName("Panel_5_1")
Panel_5_1:setPosition(-49.4999, -54.9998)
Panel_5_1:setScaleX(1)
Panel_5_1:setScaleY(1)
Panel_5_1:setLocalZOrder(0)
Panel_5_1:setAnchorPoint(0, 0)
Panel_5_1:setOpacity(255)
Panel_5_1:setColor(cc.c3b(255, 255, 255))
Panel_5_1:setVisible(true)
Panel_5_1:setRotation(0)
Panel_5_1:setRotationSkewX(0)
Panel_5_1:setRotationSkewY(0)
Panel_5_1:setTag(561)
Panel_5_1:setCascadeColorEnabled(true)
Panel_5_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_5_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(129, 31))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-49.4999)
layout:setRightMargin(-79.5001)
layout:setTopMargin(23.9998)
layout:setBottomMargin(-54.9998)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_5_1)

--Create define
local define = cc.Sprite:create("ui/Icons/armor.png")
define:setName("define")
define:setPosition(12.5, 15)
define:setScaleX(1)
define:setScaleY(1)
define:setLocalZOrder(0)
define:setAnchorPoint(0.5, 0.5)
define:setOpacity(255)
define:setColor(cc.c3b(255, 255, 255))
define:setVisible(true)
define:setRotation(0)
define:setRotationSkewX(0)
define:setRotationSkewY(0)
define:setTag(562)
define:setCascadeColorEnabled(true)
define:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(define)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.09689923)
layout:setPositionPercentY(0.483871)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(36, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-5.5)
layout:setRightMargin(98.5)
layout:setTopMargin(-2)
layout:setBottomMargin(-3)
define:setFlippedX(false)
define:setFlippedY(false)
Panel_5_1:addChild(define)

--Create define_Text
local define_Text = ccui.Text:create()
define_Text:setFontSize(24)
define_Text:setString([[1000]])
define_Text:setTextHorizontalAlignment(0)
define_Text:setTextVerticalAlignment(0)
define_Text:setTouchScaleChangeEnabled(false)
define_Text:setFlippedX(false)
define_Text:setFlippedY(false)
define_Text:setTouchEnabled(false)
define_Text:setLayoutComponentEnabled(true)
define_Text:setName("define_Text")
define_Text:setPosition(71, 11)
define_Text:setScaleX(1)
define_Text:setScaleY(1)
define_Text:setLocalZOrder(0)
define_Text:setAnchorPoint(0.5, 0.5)
define_Text:setOpacity(255)
define_Text:setColor(cc.c3b(44, 25, 14))
define_Text:setVisible(true)
define_Text:setRotation(0)
define_Text:setRotationSkewX(0)
define_Text:setRotationSkewY(0)
define_Text:setTag(563)
define_Text:setCascadeColorEnabled(true)
define_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(define_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5503876)
layout:setPositionPercentY(0.3548387)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(48, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(34)
layout:setTopMargin(8)
layout:setBottomMargin(-1)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_5_1:addChild(define_Text)

--Create Panel_5_2
local Panel_5_2 = ccui.Layout:create()
Panel_5_2:ignoreContentAdaptWithSize(false)
Panel_5_2:setBackGroundImage("ui/hall/encyclopedia/attrImg.png",0)

Panel_5_2:setClippingEnabled(false)
Panel_5_2:setBackGroundImageCapInsets(cc.rect(0,0,124,32))
Panel_5_2:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_5_2:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_5_2:setBackGroundColorVector(cc.p(0,1))
Panel_5_2:setBackGroundColorType(0)
Panel_5_2:setBackGroundColorOpacity(102)
Panel_5_2:setBackGroundImageScale9Enabled(false)

Panel_5_2:setTouchEnabled(true)
Panel_5_2:setLayoutComponentEnabled(true)
Panel_5_2:setName("Panel_5_2")
Panel_5_2:setPosition(150.5, -54.9998)
Panel_5_2:setScaleX(1)
Panel_5_2:setScaleY(1)
Panel_5_2:setLocalZOrder(0)
Panel_5_2:setAnchorPoint(0, 0)
Panel_5_2:setOpacity(255)
Panel_5_2:setColor(cc.c3b(255, 255, 255))
Panel_5_2:setVisible(true)
Panel_5_2:setRotation(0)
Panel_5_2:setRotationSkewX(0)
Panel_5_2:setRotationSkewY(0)
Panel_5_2:setTag(564)
Panel_5_2:setCascadeColorEnabled(true)
Panel_5_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_5_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(129, 31))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(150.5)
layout:setRightMargin(-279.5)
layout:setTopMargin(23.9998)
layout:setBottomMargin(-54.9998)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_5_2)

--Create speed
local speed = cc.Sprite:create("ui/Icons/speed.png")
speed:setName("speed")
speed:setPosition(11.5, 15)
speed:setScaleX(1)
speed:setScaleY(1)
speed:setLocalZOrder(0)
speed:setAnchorPoint(0.5, 0.5)
speed:setOpacity(255)
speed:setColor(cc.c3b(255, 255, 255))
speed:setVisible(true)
speed:setRotation(0)
speed:setRotationSkewX(0)
speed:setRotationSkewY(0)
speed:setTag(565)
speed:setCascadeColorEnabled(true)
speed:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(speed)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.08914728)
layout:setPositionPercentY(0.483871)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(36, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-6.5)
layout:setRightMargin(99.5)
layout:setTopMargin(-2)
layout:setBottomMargin(-3)
speed:setFlippedX(false)
speed:setFlippedY(false)
Panel_5_2:addChild(speed)

--Create speed_Text
local speed_Text = ccui.Text:create()
speed_Text:setFontSize(24)
speed_Text:setString([[1000]])
speed_Text:setTextHorizontalAlignment(0)
speed_Text:setTextVerticalAlignment(0)
speed_Text:setTouchScaleChangeEnabled(false)
speed_Text:setFlippedX(false)
speed_Text:setFlippedY(false)
speed_Text:setTouchEnabled(false)
speed_Text:setLayoutComponentEnabled(true)
speed_Text:setName("speed_Text")
speed_Text:setPosition(71, 11)
speed_Text:setScaleX(1)
speed_Text:setScaleY(1)
speed_Text:setLocalZOrder(0)
speed_Text:setAnchorPoint(0.5, 0.5)
speed_Text:setOpacity(255)
speed_Text:setColor(cc.c3b(44, 25, 14))
speed_Text:setVisible(true)
speed_Text:setRotation(0)
speed_Text:setRotationSkewX(0)
speed_Text:setRotationSkewY(0)
speed_Text:setTag(566)
speed_Text:setCascadeColorEnabled(true)
speed_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(speed_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5503876)
layout:setPositionPercentY(0.3548387)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(48, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(34)
layout:setTopMargin(8)
layout:setBottomMargin(-1)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_5_2:addChild(speed_Text)

--Create Panel_5_3
local Panel_5_3 = ccui.Layout:create()
Panel_5_3:ignoreContentAdaptWithSize(false)
Panel_5_3:setBackGroundImage("ui/hall/encyclopedia/attrImg.png",0)

Panel_5_3:setClippingEnabled(false)
Panel_5_3:setBackGroundImageCapInsets(cc.rect(0,0,124,32))
Panel_5_3:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_5_3:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_5_3:setBackGroundColorVector(cc.p(0,1))
Panel_5_3:setBackGroundColorType(0)
Panel_5_3:setBackGroundColorOpacity(102)
Panel_5_3:setBackGroundImageScale9Enabled(false)

Panel_5_3:setTouchEnabled(true)
Panel_5_3:setLayoutComponentEnabled(true)
Panel_5_3:setName("Panel_5_3")
Panel_5_3:setPosition(-52.5001, -102.9993)
Panel_5_3:setScaleX(1)
Panel_5_3:setScaleY(1)
Panel_5_3:setLocalZOrder(0)
Panel_5_3:setAnchorPoint(0, 0)
Panel_5_3:setOpacity(255)
Panel_5_3:setColor(cc.c3b(255, 255, 255))
Panel_5_3:setVisible(true)
Panel_5_3:setRotation(0)
Panel_5_3:setRotationSkewX(0)
Panel_5_3:setRotationSkewY(0)
Panel_5_3:setTag(567)
Panel_5_3:setCascadeColorEnabled(true)
Panel_5_3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_5_3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(129, 31))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-52.5001)
layout:setRightMargin(-76.4999)
layout:setTopMargin(71.9993)
layout:setBottomMargin(-102.9993)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_5_3)

--Create skill
local skill = cc.Sprite:create("ui/Icons/killHp.png")
skill:setName("skill")
skill:setPosition(15.5, 15)
skill:setScaleX(1)
skill:setScaleY(1)
skill:setLocalZOrder(0)
skill:setAnchorPoint(0.5, 0.5)
skill:setOpacity(255)
skill:setColor(cc.c3b(255, 255, 255))
skill:setVisible(true)
skill:setRotation(0)
skill:setRotationSkewX(0)
skill:setRotationSkewY(0)
skill:setTag(568)
skill:setCascadeColorEnabled(true)
skill:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skill)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.120155)
layout:setPositionPercentY(0.483871)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(36, 36))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-2.5)
layout:setRightMargin(95.5)
layout:setTopMargin(-2)
layout:setBottomMargin(-3)
skill:setFlippedX(false)
skill:setFlippedY(false)
Panel_5_3:addChild(skill)

--Create skill_Text
local skill_Text = ccui.Text:create()
skill_Text:setFontSize(24)
skill_Text:setString([[1000]])
skill_Text:setTextHorizontalAlignment(0)
skill_Text:setTextVerticalAlignment(0)
skill_Text:setTouchScaleChangeEnabled(false)
skill_Text:setFlippedX(false)
skill_Text:setFlippedY(false)
skill_Text:setTouchEnabled(false)
skill_Text:setLayoutComponentEnabled(true)
skill_Text:setName("skill_Text")
skill_Text:setPosition(71, 11)
skill_Text:setScaleX(1)
skill_Text:setScaleY(1)
skill_Text:setLocalZOrder(0)
skill_Text:setAnchorPoint(0.5, 0.5)
skill_Text:setOpacity(255)
skill_Text:setColor(cc.c3b(44, 25, 14))
skill_Text:setVisible(true)
skill_Text:setRotation(0)
skill_Text:setRotationSkewX(0)
skill_Text:setRotationSkewY(0)
skill_Text:setTag(569)
skill_Text:setCascadeColorEnabled(true)
skill_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skill_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5503876)
layout:setPositionPercentY(0.3548387)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(48, 24))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(47)
layout:setRightMargin(34)
layout:setTopMargin(8)
layout:setBottomMargin(-1)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_5_3:addChild(skill_Text)

--Create info_Text
local info_Text = ccui.Text:create()
info_Text:setFontSize(22)
info_Text:setString([[宝那就来上课的那份快乐大厦南方利达疯狂的少年]])
info_Text:setTextHorizontalAlignment(0)
info_Text:setTextVerticalAlignment(0)
info_Text:setTouchScaleChangeEnabled(false)
info_Text:setFlippedX(false)
info_Text:setFlippedY(false)
info_Text:setTouchEnabled(false)
info_Text:setLayoutComponentEnabled(true)
info_Text:setName("info_Text")
info_Text:setPosition(113.5003, 78.0013)
info_Text:setScaleX(1)
info_Text:setScaleY(1)
info_Text:setLocalZOrder(0)
info_Text:setAnchorPoint(0.5, 0.5)
info_Text:setOpacity(255)
info_Text:setColor(cc.c3b(44, 25, 14))
info_Text:setVisible(true)
info_Text:setRotation(0)
info_Text:setRotationSkewX(0)
info_Text:setRotationSkewY(0)
info_Text:setTag(570)
info_Text:setCascadeColorEnabled(true)
info_Text:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(info_Text)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(350, 90))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-61.4997)
layout:setRightMargin(-288.5003)
layout:setTopMargin(-123.0013)
layout:setBottomMargin(33.0013)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(info_Text)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result

