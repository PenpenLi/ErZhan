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
Node:setTag(0)
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

--Create panel
local panel = ccui.ImageView:create()
panel:ignoreContentAdaptWithSize(false)
panel:loadTexture("ui/common/mask_img.png",0)

panel:setFlippedX(false)
panel:setFlippedY(false)

panel:setScale9Enabled(true)
panel:setCapInsets(cc.rect(20,20,44,43))
panel:setTouchEnabled(true)
panel:setLayoutComponentEnabled(true)
panel:setName("panel")
panel:setPosition(0, 0)
panel:setScaleX(1)
panel:setScaleY(1)
panel:setLocalZOrder(0)
panel:setAnchorPoint(0.5, 0.5)
panel:setOpacity(255)
panel:setColor(cc.c3b(255, 255, 255))
panel:setVisible(true)
panel:setRotation(0)
panel:setRotationSkewX(0)
panel:setRotationSkewY(0)
panel:setTag(4)
panel:setCascadeColorEnabled(true)
panel:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(panel)
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
Node:addChild(panel)

--Create bg_2
local bg_2 = cc.Sprite:create("ui/jigsaw/bg.png")
bg_2:setName("bg_2")
bg_2:setPosition(22.32892, -3.824188)
bg_2:setScaleX(1)
bg_2:setScaleY(1)
bg_2:setLocalZOrder(0)
bg_2:setAnchorPoint(0.5, 0.5)
bg_2:setOpacity(255)
bg_2:setColor(cc.c3b(255, 255, 255))
bg_2:setVisible(true)
bg_2:setRotation(0)
bg_2:setRotationSkewX(0)
bg_2:setRotationSkewY(0)
bg_2:setTag(6)
bg_2:setCascadeColorEnabled(true)
bg_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(bg_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(829, 469))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-392.1711)
layout:setRightMargin(-436.8289)
layout:setTopMargin(-230.6758)
layout:setBottomMargin(-238.3242)
bg_2:setFlippedX(false)
bg_2:setFlippedY(false)
Node:addChild(bg_2)

--Create pt1
local pt1 = cc.Sprite:create("ui/jigsaw/pt1.png")
pt1:setName("pt1")
pt1:setPosition(-233.4207, 135.9258)
pt1:setScaleX(1)
pt1:setScaleY(1)
pt1:setLocalZOrder(0)
pt1:setAnchorPoint(0.5, 0.5)
pt1:setOpacity(255)
pt1:setColor(cc.c3b(255, 255, 255))
pt1:setVisible(true)
pt1:setRotation(0)
pt1:setRotationSkewX(0)
pt1:setRotationSkewY(0)
pt1:setTag(7)
pt1:setCascadeColorEnabled(true)
pt1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(250, 145))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-358.4207)
layout:setRightMargin(108.4207)
layout:setTopMargin(-208.4258)
layout:setBottomMargin(63.42578)
pt1:setFlippedX(false)
pt1:setFlippedY(false)
Node:addChild(pt1)

--Create pt2
local pt2 = cc.Sprite:create("ui/jigsaw/pt2.png")
pt2:setName("pt2")
pt2:setPosition(-262.9207, 14.67523)
pt2:setScaleX(1)
pt2:setScaleY(1)
pt2:setLocalZOrder(0)
pt2:setAnchorPoint(0.5, 0.5)
pt2:setOpacity(255)
pt2:setColor(cc.c3b(255, 255, 255))
pt2:setVisible(true)
pt2:setRotation(0)
pt2:setRotationSkewX(0)
pt2:setRotationSkewY(0)
pt2:setTag(8)
pt2:setCascadeColorEnabled(true)
pt2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(190, 188))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-357.9207)
layout:setRightMargin(167.9207)
layout:setTopMargin(-108.6752)
layout:setBottomMargin(-79.32477)
pt2:setFlippedX(false)
pt2:setFlippedY(false)
Node:addChild(pt2)

--Create pt3
local pt3 = cc.Sprite:create("ui/jigsaw/pt3.png")
pt3:setName("pt3")
pt3:setPosition(-233.6707, -127.0752)
pt3:setScaleX(1)
pt3:setScaleY(1)
pt3:setLocalZOrder(0)
pt3:setAnchorPoint(0.5, 0.5)
pt3:setOpacity(255)
pt3:setColor(cc.c3b(255, 255, 255))
pt3:setVisible(true)
pt3:setRotation(0)
pt3:setRotationSkewX(0)
pt3:setRotationSkewY(0)
pt3:setTag(9)
pt3:setCascadeColorEnabled(true)
pt3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(250, 187))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-358.6707)
layout:setRightMargin(108.6707)
layout:setTopMargin(33.57518)
layout:setBottomMargin(-220.5752)
pt3:setFlippedX(false)
pt3:setFlippedY(false)
Node:addChild(pt3)

--Create pt4
local pt4 = cc.Sprite:create("ui/jigsaw/pt4.png")
pt4:setName("pt4")
pt4:setPosition(-76.17084, 112.425)
pt4:setScaleX(1)
pt4:setScaleY(1)
pt4:setLocalZOrder(0)
pt4:setAnchorPoint(0.5, 0.5)
pt4:setOpacity(255)
pt4:setColor(cc.c3b(255, 255, 255))
pt4:setVisible(true)
pt4:setRotation(0)
pt4:setRotationSkewX(0)
pt4:setRotationSkewY(0)
pt4:setTag(10)
pt4:setCascadeColorEnabled(true)
pt4:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt4)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(190, 191))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-171.1708)
layout:setRightMargin(-18.82916)
layout:setTopMargin(-207.925)
layout:setBottomMargin(16.92499)
pt4:setFlippedX(false)
pt4:setFlippedY(false)
Node:addChild(pt4)

--Create pt5
local pt5 = cc.Sprite:create("ui/jigsaw/pt5.png")
pt5:setName("pt5")
pt5:setPosition(-105.6707, -29.32483)
pt5:setScaleX(1)
pt5:setScaleY(1)
pt5:setLocalZOrder(0)
pt5:setAnchorPoint(0.5, 0.5)
pt5:setOpacity(255)
pt5:setColor(cc.c3b(255, 255, 255))
pt5:setVisible(true)
pt5:setRotation(0)
pt5:setRotationSkewX(0)
pt5:setRotationSkewY(0)
pt5:setTag(11)
pt5:setCascadeColorEnabled(true)
pt5:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt5)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(250, 189))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-230.6707)
layout:setRightMargin(-19.32928)
layout:setTopMargin(-65.17517)
layout:setBottomMargin(-123.8248)
pt5:setFlippedX(false)
pt5:setFlippedY(false)
Node:addChild(pt5)

--Create pt6
local pt6 = cc.Sprite:create("ui/jigsaw/pt6.png")
pt6:setName("pt6")
pt6:setPosition(-75.67084, -148.8252)
pt6:setScaleX(1)
pt6:setScaleY(1)
pt6:setLocalZOrder(0)
pt6:setAnchorPoint(0.5, 0.5)
pt6:setOpacity(255)
pt6:setColor(cc.c3b(255, 255, 255))
pt6:setVisible(true)
pt6:setRotation(0)
pt6:setRotationSkewX(0)
pt6:setRotationSkewY(0)
pt6:setTag(12)
pt6:setCascadeColorEnabled(true)
pt6:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(pt6)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(190, 144))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-170.6708)
layout:setRightMargin(-19.32916)
layout:setTopMargin(76.82516)
layout:setBottomMargin(-220.8252)
pt6:setFlippedX(false)
pt6:setFlippedY(false)
Node:addChild(pt6)

--Create tip_9
local tip_9 = cc.Sprite:create("ui/jigsaw/tip.png")
tip_9:setName("tip_9")
tip_9:setPosition(15.82928, -264.3253)
tip_9:setScaleX(1)
tip_9:setScaleY(1)
tip_9:setLocalZOrder(0)
tip_9:setAnchorPoint(0.5, 0.5)
tip_9:setOpacity(255)
tip_9:setColor(cc.c3b(255, 255, 255))
tip_9:setVisible(true)
tip_9:setRotation(0)
tip_9:setRotationSkewX(0)
tip_9:setRotationSkewY(0)
tip_9:setTag(13)
tip_9:setCascadeColorEnabled(true)
tip_9:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(tip_9)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(544, 60))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-256.1707)
layout:setRightMargin(-287.8293)
layout:setTopMargin(234.3253)
layout:setBottomMargin(-294.3253)
tip_9:setFlippedX(false)
tip_9:setFlippedY(false)
Node:addChild(tip_9)

--Create unlock_10
local unlock_10 = cc.Sprite:create("ui/jigsaw/unlock.png")
unlock_10:setName("unlock_10")
unlock_10:setPosition(227.3294, 174.6748)
unlock_10:setScaleX(1)
unlock_10:setScaleY(1)
unlock_10:setLocalZOrder(0)
unlock_10:setAnchorPoint(0.5, 0.5)
unlock_10:setOpacity(255)
unlock_10:setColor(cc.c3b(255, 255, 255))
unlock_10:setVisible(true)
unlock_10:setRotation(0)
unlock_10:setRotationSkewX(0)
unlock_10:setRotationSkewY(0)
unlock_10:setTag(14)
unlock_10:setCascadeColorEnabled(true)
unlock_10:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(unlock_10)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(222, 41))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(116.3294)
layout:setRightMargin(-338.3294)
layout:setTopMargin(-195.1748)
layout:setBottomMargin(154.1748)
unlock_10:setFlippedX(false)
unlock_10:setFlippedY(false)
Node:addChild(unlock_10)

--Create name_11
local name_11 = cc.Sprite:create("ui/jigsaw/name.png")
name_11:setName("name_11")
name_11:setPosition(228.0795, -60.82526)
name_11:setScaleX(1)
name_11:setScaleY(1)
name_11:setLocalZOrder(0)
name_11:setAnchorPoint(0.5, 0.5)
name_11:setOpacity(255)
name_11:setColor(cc.c3b(255, 255, 255))
name_11:setVisible(true)
name_11:setRotation(0)
name_11:setRotationSkewX(0)
name_11:setRotationSkewY(0)
name_11:setTag(15)
name_11:setCascadeColorEnabled(true)
name_11:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(name_11)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(315, 51))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(70.57947)
layout:setRightMargin(-385.5795)
layout:setTopMargin(35.32526)
layout:setBottomMargin(-86.32526)
name_11:setFlippedX(false)
name_11:setFlippedY(false)
Node:addChild(name_11)

--Create heroIcon_12
local heroIcon_12 = cc.Sprite:create("ui/jigsaw/heroIcon.png")
heroIcon_12:setName("heroIcon_12")
heroIcon_12:setPosition(228.0794, 60.67477)
heroIcon_12:setScaleX(1)
heroIcon_12:setScaleY(1)
heroIcon_12:setLocalZOrder(0)
heroIcon_12:setAnchorPoint(0.5, 0.5)
heroIcon_12:setOpacity(255)
heroIcon_12:setColor(cc.c3b(255, 255, 255))
heroIcon_12:setVisible(true)
heroIcon_12:setRotation(0)
heroIcon_12:setRotationSkewX(0)
heroIcon_12:setRotationSkewY(0)
heroIcon_12:setTag(16)
heroIcon_12:setCascadeColorEnabled(true)
heroIcon_12:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(heroIcon_12)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(186, 188))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(135.0794)
layout:setRightMargin(-321.0794)
layout:setTopMargin(-154.6748)
layout:setBottomMargin(-33.32523)
heroIcon_12:setFlippedX(false)
heroIcon_12:setFlippedY(false)
Node:addChild(heroIcon_12)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("ui/Icons/heroSkillIcon/140401.png",0)

Image_2:setFlippedX(false)
Image_2:setFlippedY(false)

Image_2:setScale9Enabled(false)
Image_2:setCapInsets(cc.rect(0,0,85,84))
Image_2:setTouchEnabled(false)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setPosition(116.5015, -139.5751)
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
Image_2:setTag(18)
Image_2:setCascadeColorEnabled(true)
Image_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.8854167)
layout:setPercentHeight(0.8842105)
layout:setSize(cc.size(85, 84))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(74.00153)
layout:setRightMargin(-159.0015)
layout:setTopMargin(97.57513)
layout:setBottomMargin(-181.5751)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_2)

--Create skillBtn1
local skillBtn1 = ccui.Button:create()
skillBtn1:ignoreContentAdaptWithSize(false)
skillBtn1:loadTextureNormal("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn1:loadTexturePressed("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn1:loadTextureDisabled("Default/Button_Disable.png",0)
skillBtn1:setTitleFontSize(14)
skillBtn1:setTitleText("")
skillBtn1:setTitleColor(cc.c3b(65, 65, 70))
skillBtn1:setFlippedX(false)
skillBtn1:setFlippedY(false)
skillBtn1:setScale9Enabled(true)
skillBtn1:setCapInsets(cc.rect(0,0,96,95))
skillBtn1:setBright(true)
skillBtn1:setTouchEnabled(true)
skillBtn1:setLayoutComponentEnabled(true)
skillBtn1:setName("skillBtn1")
skillBtn1:setPosition(44.59094, 40.67506)
skillBtn1:setScaleX(1)
skillBtn1:setScaleY(1)
skillBtn1:setLocalZOrder(0)
skillBtn1:setAnchorPoint(0.5, 0.5)
skillBtn1:setOpacity(255)
skillBtn1:setColor(cc.c3b(255, 255, 255))
skillBtn1:setVisible(true)
skillBtn1:setRotation(0)
skillBtn1:setRotationSkewX(0)
skillBtn1:setRotationSkewY(0)
skillBtn1:setTag(17)
skillBtn1:setCascadeColorEnabled(true)
skillBtn1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skillBtn1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5245993)
layout:setPositionPercentY(0.4842269)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(96, 95))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-3.409058)
layout:setRightMargin(-7.590942)
layout:setTopMargin(-4.175064)
layout:setBottomMargin(-6.824936)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Image_2:addChild(skillBtn1)

--Create Image_3
local Image_3 = ccui.ImageView:create()
Image_3:ignoreContentAdaptWithSize(false)
Image_3:loadTexture("ui/Icons/heroSkillIcon/140402.png",0)

Image_3:setFlippedX(false)
Image_3:setFlippedY(false)

Image_3:setScale9Enabled(false)
Image_3:setCapInsets(cc.rect(0,0,85,84))
Image_3:setTouchEnabled(false)
Image_3:setLayoutComponentEnabled(true)
Image_3:setName("Image_3")
Image_3:setPosition(229.9151, -139.5751)
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
Image_3:setTag(21)
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
layout:setSize(cc.size(85, 84))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(187.4151)
layout:setRightMargin(-272.4151)
layout:setTopMargin(97.57513)
layout:setBottomMargin(-181.5751)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_3)

--Create skillBtn2
local skillBtn2 = ccui.Button:create()
skillBtn2:ignoreContentAdaptWithSize(false)
skillBtn2:loadTextureNormal("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn2:loadTexturePressed("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn2:loadTextureDisabled("Default/Button_Disable.png",0)
skillBtn2:setTitleFontSize(14)
skillBtn2:setTitleText("")
skillBtn2:setTitleColor(cc.c3b(65, 65, 70))
skillBtn2:setFlippedX(false)
skillBtn2:setFlippedY(false)
skillBtn2:setScale9Enabled(true)
skillBtn2:setCapInsets(cc.rect(0,0,96,95))
skillBtn2:setBright(true)
skillBtn2:setTouchEnabled(true)
skillBtn2:setLayoutComponentEnabled(true)
skillBtn2:setName("skillBtn2")
skillBtn2:setPosition(42.5878, 40.67503)
skillBtn2:setScaleX(1)
skillBtn2:setScaleY(1)
skillBtn2:setLocalZOrder(0)
skillBtn2:setAnchorPoint(0.5, 0.5)
skillBtn2:setOpacity(255)
skillBtn2:setColor(cc.c3b(255, 255, 255))
skillBtn2:setVisible(true)
skillBtn2:setRotation(0)
skillBtn2:setRotationSkewX(0)
skillBtn2:setRotationSkewY(0)
skillBtn2:setTag(22)
skillBtn2:setCascadeColorEnabled(true)
skillBtn2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skillBtn2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5010329)
layout:setPositionPercentY(0.4842266)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(1.129412)
layout:setPercentHeight(1.130952)
layout:setSize(cc.size(96, 95))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-5.412201)
layout:setRightMargin(-5.587799)
layout:setTopMargin(-4.175034)
layout:setBottomMargin(-6.824966)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Image_3:addChild(skillBtn2)

--Create Image_4
local Image_4 = ccui.ImageView:create()
Image_4:ignoreContentAdaptWithSize(false)
Image_4:loadTexture("ui/Icons/heroSkillIcon/140403.png",0)

Image_4:setFlippedX(false)
Image_4:setFlippedY(false)

Image_4:setScale9Enabled(false)
Image_4:setCapInsets(cc.rect(0,0,85,84))
Image_4:setTouchEnabled(false)
Image_4:setLayoutComponentEnabled(true)
Image_4:setName("Image_4")
Image_4:setPosition(337.8286, -139.5751)
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
Image_4:setTag(23)
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
layout:setSize(cc.size(85, 84))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(295.3286)
layout:setRightMargin(-380.3286)
layout:setTopMargin(97.57515)
layout:setBottomMargin(-181.5751)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_4)

--Create skillBtn3
local skillBtn3 = ccui.Button:create()
skillBtn3:ignoreContentAdaptWithSize(false)
skillBtn3:loadTextureNormal("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn3:loadTexturePressed("ui/Icons/heroSkillIcon/icon_hero.png",0)
skillBtn3:loadTextureDisabled("Default/Button_Disable.png",0)
skillBtn3:setTitleFontSize(14)
skillBtn3:setTitleText("")
skillBtn3:setTitleColor(cc.c3b(65, 65, 70))
skillBtn3:setFlippedX(false)
skillBtn3:setFlippedY(false)
skillBtn3:setScale9Enabled(true)
skillBtn3:setCapInsets(cc.rect(0,0,96,95))
skillBtn3:setBright(true)
skillBtn3:setTouchEnabled(true)
skillBtn3:setLayoutComponentEnabled(true)
skillBtn3:setName("skillBtn3")
skillBtn3:setPosition(42.82965, 40.67505)
skillBtn3:setScaleX(1)
skillBtn3:setScaleY(1)
skillBtn3:setLocalZOrder(0)
skillBtn3:setAnchorPoint(0.5, 0.5)
skillBtn3:setOpacity(255)
skillBtn3:setColor(cc.c3b(255, 255, 255))
skillBtn3:setVisible(true)
skillBtn3:setRotation(0)
skillBtn3:setRotationSkewX(0)
skillBtn3:setRotationSkewY(0)
skillBtn3:setTag(24)
skillBtn3:setCascadeColorEnabled(true)
skillBtn3:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skillBtn3)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5038782)
layout:setPositionPercentY(0.4842268)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(96, 95))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-5.170349)
layout:setRightMargin(-5.829651)
layout:setTopMargin(-4.175049)
layout:setBottomMargin(-6.824951)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Image_4:addChild(skillBtn3)

--Create closeBtn
local closeBtn = ccui.Button:create()
closeBtn:ignoreContentAdaptWithSize(false)
closeBtn:loadTextureNormal("ui/set/close.png",0)
closeBtn:loadTexturePressed("ui/set/closeOn.png",0)
closeBtn:loadTextureDisabled("Default/Button_Disable.png",0)
closeBtn:setTitleFontSize(14)
closeBtn:setTitleText("")
closeBtn:setTitleColor(cc.c3b(65, 65, 70))
closeBtn:setFlippedX(false)
closeBtn:setFlippedY(false)
closeBtn:setScale9Enabled(true)
closeBtn:setCapInsets(cc.rect(0,0,72,84))
closeBtn:setBright(true)
closeBtn:setTouchEnabled(true)
closeBtn:setLayoutComponentEnabled(true)
closeBtn:setName("closeBtn")
closeBtn:setPosition(409.8439, 188.3124)
closeBtn:setScaleX(1)
closeBtn:setScaleY(1)
closeBtn:setLocalZOrder(0)
closeBtn:setAnchorPoint(0.5, 0.5)
closeBtn:setOpacity(255)
closeBtn:setColor(cc.c3b(255, 255, 255))
closeBtn:setVisible(true)
closeBtn:setRotation(0)
closeBtn:setRotationSkewX(0)
closeBtn:setRotationSkewY(0)
closeBtn:setTag(25)
closeBtn:setCascadeColorEnabled(true)
closeBtn:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(closeBtn)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(72, 84))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(373.8439)
layout:setRightMargin(-445.8439)
layout:setTopMargin(-230.3124)
layout:setBottomMargin(146.3124)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(closeBtn)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result
