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
Node:setTag(399)
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
Image_1:setPosition(-0.0631, 3.4093)
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
Image_1:setTag(400)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      Image_1:addClickEventListener(callBackProvider("TipsStudio.lua", Image_1, "clickEvent"))
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
layout:setLeftMargin(-675.0631)
layout:setRightMargin(-674.9369)
layout:setTopMargin(-433.4093)
layout:setBottomMargin(-426.5907)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_1)

--Create Image_bg
local Image_bg = ccui.ImageView:create()
Image_bg:ignoreContentAdaptWithSize(false)
Image_bg:loadTexture("ui/tips/bg.png",0)

Image_bg:setFlippedX(false)
Image_bg:setFlippedY(false)

Image_bg:setScale9Enabled(false)
Image_bg:setCapInsets(cc.rect(0,0,657,408))
Image_bg:setTouchEnabled(true)
Image_bg:setLayoutComponentEnabled(true)
Image_bg:setName("Image_bg")
Image_bg:setPosition(0, 0)
Image_bg:setScaleX(1)
Image_bg:setScaleY(1)
Image_bg:setLocalZOrder(0)
Image_bg:setAnchorPoint(0.5, 0.5)
Image_bg:setOpacity(255)
Image_bg:setColor(cc.c3b(255, 255, 255))
Image_bg:setVisible(true)
Image_bg:setRotation(0)
Image_bg:setRotationSkewX(0)
Image_bg:setRotationSkewY(0)
Image_bg:setTag(401)
Image_bg:setCascadeColorEnabled(true)
Image_bg:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_bg)
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
layout:setTopMargin(-204)
layout:setBottomMargin(-204)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Image_bg)

--Create closeBtn
local closeBtn = ccui.Button:create()
closeBtn:ignoreContentAdaptWithSize(false)
closeBtn:loadTextureNormal("ui/tips/close.png",0)
closeBtn:loadTexturePressed("ui/tips/close0n.png",0)
closeBtn:loadTextureDisabled("Default/Button_Disable.png",0)
closeBtn:setTitleFontSize(14)
closeBtn:setTitleText("")
closeBtn:setTitleColor(cc.c3b(65, 65, 70))
closeBtn:setFlippedX(false)
closeBtn:setFlippedY(false)
closeBtn:setScale9Enabled(true)
closeBtn:setCapInsets(cc.rect(0,0,83,72))
closeBtn:setBright(true)
closeBtn:setTouchEnabled(true)
closeBtn:setLayoutComponentEnabled(true)
closeBtn:setName("closeBtn")
closeBtn:setPosition(348.0767, 154.5465)
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
closeBtn:setTag(408)
closeBtn:setCascadeColorEnabled(true)
closeBtn:setCascadeOpacityEnabled(true)
if callBackProvider~=nil then
      closeBtn:addClickEventListener(callBackProvider("TipsStudio.lua", closeBtn, "clickEvent"))
end
layout = ccui.LayoutComponent:bindLayoutComponent(closeBtn)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(83, 72))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(306.5767)
layout:setRightMargin(-389.5767)
layout:setTopMargin(-190.5465)
layout:setBottomMargin(118.5465)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(closeBtn)

--Create Panel_Content
local Panel_Content = ccui.Layout:create()
Panel_Content:ignoreContentAdaptWithSize(false)

Panel_Content:setClippingEnabled(false)
Panel_Content:setBackGroundImageCapInsets(cc.rect(0,0,396,28))
Panel_Content:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_Content:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_Content:setBackGroundColorVector(cc.p(0,1))
Panel_Content:setBackGroundColorType(0)
Panel_Content:setBackGroundColorOpacity(102)
Panel_Content:setBackGroundImageScale9Enabled(false)

Panel_Content:setTouchEnabled(true)
Panel_Content:setLayoutComponentEnabled(true)
Panel_Content:setName("Panel_Content")
Panel_Content:setPosition(-256.6249, -145.4994)
Panel_Content:setScaleX(1)
Panel_Content:setScaleY(1)
Panel_Content:setLocalZOrder(0)
Panel_Content:setAnchorPoint(0, 0)
Panel_Content:setOpacity(255)
Panel_Content:setColor(cc.c3b(255, 255, 255))
Panel_Content:setVisible(true)
Panel_Content:setRotation(0)
Panel_Content:setRotationSkewX(0)
Panel_Content:setRotationSkewY(0)
Panel_Content:setTag(541)
Panel_Content:setCascadeColorEnabled(true)
Panel_Content:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_Content)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(500, 200))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-256.6249)
layout:setRightMargin(-243.3751)
layout:setTopMargin(-54.5006)
layout:setBottomMargin(-145.4994)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_Content)

--Create weather_frame
local weather_frame = ccui.ImageView:create()
weather_frame:ignoreContentAdaptWithSize(false)
weather_frame:loadTexture("ui/tips/xingBg.png",0)

weather_frame:setFlippedX(false)
weather_frame:setFlippedY(false)

weather_frame:setScale9Enabled(false)
weather_frame:setCapInsets(cc.rect(0,0,396,28))
weather_frame:setTouchEnabled(false)
weather_frame:setLayoutComponentEnabled(true)
weather_frame:setName("weather_frame")
weather_frame:setPosition(251.2819, 69.5005)
weather_frame:setScaleX(1)
weather_frame:setScaleY(1)
weather_frame:setLocalZOrder(0)
weather_frame:setAnchorPoint(0.5, 0.5)
weather_frame:setOpacity(255)
weather_frame:setColor(cc.c3b(255, 255, 255))
weather_frame:setVisible(true)
weather_frame:setRotation(0)
weather_frame:setRotationSkewX(0)
weather_frame:setRotationSkewY(0)
weather_frame:setTag(537)
weather_frame:setCascadeColorEnabled(true)
weather_frame:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(weather_frame)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5025638)
layout:setPositionPercentY(0.3475025)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(396, 28))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(53.28191)
layout:setRightMargin(50.71808)
layout:setTopMargin(116.4995)
layout:setBottomMargin(55.5005)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_Content:addChild(weather_frame)

--Create xing_4
local xing_4 = cc.Sprite:create("ui/common/xing.png")
xing_4:setName("xing_4")
xing_4:setPosition(24.8749, 13.5)
xing_4:setScaleX(1)
xing_4:setScaleY(1)
xing_4:setLocalZOrder(0)
xing_4:setAnchorPoint(0.5, 0.5)
xing_4:setOpacity(255)
xing_4:setColor(cc.c3b(255, 255, 255))
xing_4:setVisible(true)
xing_4:setRotation(0)
xing_4:setRotationSkewX(0)
xing_4:setRotationSkewY(0)
xing_4:setTag(538)
xing_4:setCascadeColorEnabled(true)
xing_4:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(xing_4)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.06281541)
layout:setPositionPercentY(0.4821429)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(24, 23))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(12.8749)
layout:setRightMargin(359.1251)
layout:setTopMargin(3)
layout:setBottomMargin(2)
xing_4:setFlippedX(false)
xing_4:setFlippedY(false)
weather_frame:addChild(xing_4)

--Create weather
local weather = ccui.Text:create()
weather:setFontSize(18)
weather:setString([[撒的发生的发生的发生的发多少发]])
weather:setTextHorizontalAlignment(0)
weather:setTextVerticalAlignment(1)
weather:setTouchScaleChangeEnabled(false)
weather:setFlippedX(false)
weather:setFlippedY(false)
weather:setTouchEnabled(false)
weather:setLayoutComponentEnabled(true)
weather:setName("weather")
weather:setPosition(178.125, 13)
weather:setScaleX(1)
weather:setScaleY(1)
weather:setLocalZOrder(0)
weather:setAnchorPoint(0.5, 0.5)
weather:setOpacity(255)
weather:setColor(cc.c3b(255, 0, 0))
weather:setVisible(true)
weather:setRotation(0)
weather:setRotationSkewX(0)
weather:setRotationSkewY(0)
weather:setTag(539)
weather:setCascadeColorEnabled(true)
weather:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(weather)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4498106)
layout:setPositionPercentY(0.4642857)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(270, 18))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(43.125)
layout:setRightMargin(82.875)
layout:setTopMargin(6)
layout:setBottomMargin(4)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
weather_frame:addChild(weather)

--Create Panel_CD
local Panel_CD = ccui.Layout:create()
Panel_CD:ignoreContentAdaptWithSize(false)

Panel_CD:setClippingEnabled(false)
Panel_CD:setBackGroundImageCapInsets(cc.rect(0,0,0,0))
Panel_CD:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_CD:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_CD:setBackGroundColorVector(cc.p(0,1))
Panel_CD:setBackGroundColorType(0)
Panel_CD:setBackGroundColorOpacity(102)
Panel_CD:setBackGroundImageScale9Enabled(false)

Panel_CD:setTouchEnabled(true)
Panel_CD:setLayoutComponentEnabled(true)
Panel_CD:setName("Panel_CD")
Panel_CD:setPosition(294.0323, 22.25)
Panel_CD:setScaleX(1)
Panel_CD:setScaleY(1)
Panel_CD:setLocalZOrder(0)
Panel_CD:setAnchorPoint(0, 0)
Panel_CD:setOpacity(255)
Panel_CD:setColor(cc.c3b(255, 255, 255))
Panel_CD:setVisible(true)
Panel_CD:setRotation(0)
Panel_CD:setRotationSkewX(0)
Panel_CD:setRotationSkewY(0)
Panel_CD:setTag(540)
Panel_CD:setCascadeColorEnabled(true)
Panel_CD:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_CD)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5880646)
layout:setPositionPercentY(0.11125)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(200, 20))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(294.0323)
layout:setRightMargin(5.967712)
layout:setTopMargin(157.75)
layout:setBottomMargin(22.25)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_Content:addChild(Panel_CD)

--Create time_1
local time_1 = ccui.Text:create()
time_1:setFontSize(18)
time_1:setString([[冷却时间:]])
time_1:setTextHorizontalAlignment(0)
time_1:setTextVerticalAlignment(1)
time_1:setTouchScaleChangeEnabled(false)
time_1:setFlippedX(false)
time_1:setFlippedY(false)
time_1:setTouchEnabled(false)
time_1:setLayoutComponentEnabled(true)
time_1:setName("time_1")
time_1:setPosition(81.2977, 10.7982)
time_1:setScaleX(1)
time_1:setScaleY(1)
time_1:setLocalZOrder(0)
time_1:setAnchorPoint(0.5, 0.5)
time_1:setOpacity(255)
time_1:setColor(cc.c3b(0, 228, 255))
time_1:setVisible(true)
time_1:setRotation(0)
time_1:setRotationSkewX(0)
time_1:setRotationSkewY(0)
time_1:setTag(405)
time_1:setCascadeColorEnabled(true)
time_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(time_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4064885)
layout:setPositionPercentY(0.53991)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(81, 18))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(40.7977)
layout:setRightMargin(78.2023)
layout:setTopMargin(0.2018013)
layout:setBottomMargin(1.7982)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_CD:addChild(time_1)

--Create time
local time = ccui.Text:create()
time:setFontSize(18)
time:setString([[30]])
time:setTextHorizontalAlignment(0)
time:setTextVerticalAlignment(1)
time:setTouchScaleChangeEnabled(false)
time:setFlippedX(false)
time:setFlippedY(false)
time:setTouchEnabled(false)
time:setLayoutComponentEnabled(true)
time:setName("time")
time:setPosition(142.6696, 10.7982)
time:setScaleX(1)
time:setScaleY(1)
time:setLocalZOrder(0)
time:setAnchorPoint(0.5, 0.5)
time:setOpacity(255)
time:setColor(cc.c3b(238, 245, 12))
time:setVisible(true)
time:setRotation(0)
time:setRotationSkewX(0)
time:setRotationSkewY(0)
time:setTag(406)
time:setCascadeColorEnabled(true)
time:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(time)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.713348)
layout:setPositionPercentY(0.53991)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(18, 18))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(133.6696)
layout:setRightMargin(48.3304)
layout:setTopMargin(0.2018013)
layout:setBottomMargin(1.7982)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_CD:addChild(time)

--Create time_2
local time_2 = ccui.Text:create()
time_2:setFontSize(18)
time_2:setString([[秒]])
time_2:setTextHorizontalAlignment(2)
time_2:setTextVerticalAlignment(1)
time_2:setTouchScaleChangeEnabled(false)
time_2:setFlippedX(false)
time_2:setFlippedY(false)
time_2:setTouchEnabled(false)
time_2:setLayoutComponentEnabled(true)
time_2:setName("time_2")
time_2:setPosition(177.7489, 10.7983)
time_2:setScaleX(1)
time_2:setScaleY(1)
time_2:setLocalZOrder(0)
time_2:setAnchorPoint(0.5, 0.5)
time_2:setOpacity(255)
time_2:setColor(cc.c3b(0, 228, 255))
time_2:setVisible(true)
time_2:setRotation(0)
time_2:setRotationSkewX(0)
time_2:setRotationSkewY(0)
time_2:setTag(407)
time_2:setCascadeColorEnabled(true)
time_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(time_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.8887445)
layout:setPositionPercentY(0.539915)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(18, 18))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(168.7489)
layout:setRightMargin(13.2511)
layout:setTopMargin(0.2017002)
layout:setBottomMargin(1.7983)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_CD:addChild(time_2)

--Create Panel_yoke
local Panel_yoke = ccui.Layout:create()
Panel_yoke:ignoreContentAdaptWithSize(false)

Panel_yoke:setClippingEnabled(false)
Panel_yoke:setBackGroundImageCapInsets(cc.rect(0,0,0,0))
Panel_yoke:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_yoke:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_yoke:setBackGroundColorVector(cc.p(0,1))
Panel_yoke:setBackGroundColorType(0)
Panel_yoke:setBackGroundColorOpacity(102)
Panel_yoke:setBackGroundImageScale9Enabled(false)

Panel_yoke:setTouchEnabled(true)
Panel_yoke:setLayoutComponentEnabled(true)
Panel_yoke:setName("Panel_yoke")
Panel_yoke:setPosition(-332.0001, -190.0001)
Panel_yoke:setScaleX(1)
Panel_yoke:setScaleY(1)
Panel_yoke:setLocalZOrder(0)
Panel_yoke:setAnchorPoint(0, 0)
Panel_yoke:setOpacity(255)
Panel_yoke:setColor(cc.c3b(255, 255, 255))
Panel_yoke:setVisible(true)
Panel_yoke:setRotation(0)
Panel_yoke:setRotationSkewX(0)
Panel_yoke:setRotationSkewY(0)
Panel_yoke:setTag(123)
Panel_yoke:setCascadeColorEnabled(true)
Panel_yoke:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_yoke)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(650, 395))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-332.0001)
layout:setRightMargin(-317.9999)
layout:setTopMargin(-204.9999)
layout:setBottomMargin(-190.0001)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_yoke)

--Create Frame_1
local Frame_1 = ccui.ImageView:create()
Frame_1:ignoreContentAdaptWithSize(false)
Frame_1:loadTexture("ui/tips/bg2.png",0)

Frame_1:setFlippedX(true)
Frame_1:setFlippedY(false)

Frame_1:setScale9Enabled(false)
Frame_1:setCapInsets(cc.rect(0,0,547,130))
Frame_1:setTouchEnabled(false)
Frame_1:setLayoutComponentEnabled(true)
Frame_1:setName("Frame_1")
Frame_1:setPosition(333, 247.2505)
Frame_1:setScaleX(1)
Frame_1:setScaleY(1)
Frame_1:setLocalZOrder(0)
Frame_1:setAnchorPoint(0.5, 0.5)
Frame_1:setOpacity(255)
Frame_1:setColor(cc.c3b(255, 255, 255))
Frame_1:setVisible(true)
Frame_1:setRotation(0)
Frame_1:setRotationSkewX(0)
Frame_1:setRotationSkewY(0)
Frame_1:setTag(560)
Frame_1:setCascadeColorEnabled(true)
Frame_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Frame_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4992504)
layout:setPositionPercentY(0.615051)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.8201)
layout:setPercentHeight(0.3234)
layout:setSize(cc.size(547, 130))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(59.5)
layout:setRightMargin(60.5)
layout:setTopMargin(89.74951)
layout:setBottomMargin(182.2505)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(Frame_1)

--Create icon_1
local icon_1 = ccui.ImageView:create()
icon_1:ignoreContentAdaptWithSize(false)
icon_1:loadTexture("ui/Icons/heroIcon/110101.png",0)

icon_1:setFlippedX(true)
icon_1:setFlippedY(false)

icon_1:setScale9Enabled(false)
icon_1:setCapInsets(cc.rect(0,0,110,110))
icon_1:setTouchEnabled(false)
icon_1:setLayoutComponentEnabled(true)
icon_1:setName("icon_1")
icon_1:setPosition(541.2498, 248.9985)
icon_1:setScaleX(1)
icon_1:setScaleY(1)
icon_1:setLocalZOrder(0)
icon_1:setAnchorPoint(0.5, 0.5)
icon_1:setOpacity(255)
icon_1:setColor(cc.c3b(255, 255, 255))
icon_1:setVisible(true)
icon_1:setRotation(0)
icon_1:setRotationSkewX(0)
icon_1:setRotationSkewY(0)
icon_1:setTag(561)
icon_1:setCascadeColorEnabled(true)
icon_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(icon_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.811469)
layout:setPositionPercentY(0.6193992)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.1649)
layout:setPercentHeight(0.2736)
layout:setSize(cc.size(110, 110))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(486.2498)
layout:setRightMargin(70.75018)
layout:setTopMargin(98.0015)
layout:setBottomMargin(193.9985)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(icon_1)

--Create name_1
local name_1 = ccui.ImageView:create()
name_1:ignoreContentAdaptWithSize(false)
name_1:loadTexture("ui/common/name_110101.png",0)

name_1:setFlippedX(false)
name_1:setFlippedY(false)

name_1:setScale9Enabled(false)
name_1:setCapInsets(cc.rect(0,0,110,20))
name_1:setTouchEnabled(false)
name_1:setLayoutComponentEnabled(true)
name_1:setName("name_1")
name_1:setPosition(426.9944, 278.2034)
name_1:setScaleX(1)
name_1:setScaleY(1)
name_1:setLocalZOrder(0)
name_1:setAnchorPoint(0.5, 0.5)
name_1:setOpacity(255)
name_1:setColor(cc.c3b(255, 255, 255))
name_1:setVisible(true)
name_1:setRotation(0)
name_1:setRotationSkewX(0)
name_1:setRotationSkewY(0)
name_1:setTag(562)
name_1:setCascadeColorEnabled(true)
name_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(name_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.6401715)
layout:setPositionPercentY(0.6920483)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(110, 20))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(371.9944)
layout:setRightMargin(185.0056)
layout:setTopMargin(113.7966)
layout:setBottomMargin(268.2034)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(name_1)

--Create skilldes_1
local skilldes_1 = ccui.Text:create()
skilldes_1:setFontSize(16)
skilldes_1:setString([[时间的福利卡速度及法律框架按时到路口附近爱上当连接法兰的]])
skilldes_1:setTextHorizontalAlignment(0)
skilldes_1:setTextVerticalAlignment(1)
skilldes_1:setTouchScaleChangeEnabled(false)
skilldes_1:setFlippedX(false)
skilldes_1:setFlippedY(false)
skilldes_1:setTouchEnabled(false)
skilldes_1:setLayoutComponentEnabled(true)
skilldes_1:setName("skilldes_1")
skilldes_1:setPosition(297.6339, 228.7036)
skilldes_1:setScaleX(1)
skilldes_1:setScaleY(1)
skilldes_1:setLocalZOrder(0)
skilldes_1:setAnchorPoint(0.5, 0.5)
skilldes_1:setOpacity(255)
skilldes_1:setColor(cc.c3b(255, 255, 255))
skilldes_1:setVisible(true)
skilldes_1:setRotation(0)
skilldes_1:setRotationSkewX(0)
skilldes_1:setRotationSkewY(0)
skilldes_1:setTag(563)
skilldes_1:setCascadeColorEnabled(true)
skilldes_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skilldes_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4462278)
layout:setPositionPercentY(0.5689144)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.5247)
layout:setPercentHeight(0.1741)
layout:setSize(cc.size(350, 70))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(122.6339)
layout:setRightMargin(194.3661)
layout:setTopMargin(138.2964)
layout:setBottomMargin(193.7036)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(skilldes_1)

--Create Frame_2
local Frame_2 = ccui.ImageView:create()
Frame_2:ignoreContentAdaptWithSize(false)
Frame_2:loadTexture("ui/tips/bg2.png",0)

Frame_2:setFlippedX(false)
Frame_2:setFlippedY(false)

Frame_2:setScale9Enabled(false)
Frame_2:setCapInsets(cc.rect(0,0,547,130))
Frame_2:setTouchEnabled(false)
Frame_2:setLayoutComponentEnabled(true)
Frame_2:setName("Frame_2")
Frame_2:setPosition(333, 115.4982)
Frame_2:setScaleX(1)
Frame_2:setScaleY(1)
Frame_2:setLocalZOrder(0)
Frame_2:setAnchorPoint(0.5, 0.5)
Frame_2:setOpacity(255)
Frame_2:setColor(cc.c3b(255, 255, 255))
Frame_2:setVisible(true)
Frame_2:setRotation(0)
Frame_2:setRotationSkewX(0)
Frame_2:setRotationSkewY(0)
Frame_2:setTag(564)
Frame_2:setCascadeColorEnabled(true)
Frame_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Frame_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4992504)
layout:setPositionPercentY(0.287309)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(1.094)
layout:setPercentHeight(0.3714)
layout:setSize(cc.size(547, 130))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(59.5)
layout:setRightMargin(60.5)
layout:setTopMargin(221.5018)
layout:setBottomMargin(50.4982)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(Frame_2)

--Create icon_2
local icon_2 = ccui.ImageView:create()
icon_2:ignoreContentAdaptWithSize(false)
icon_2:loadTexture("ui/Icons/heroIcon/110101.png",0)

icon_2:setFlippedX(false)
icon_2:setFlippedY(false)

icon_2:setScale9Enabled(false)
icon_2:setCapInsets(cc.rect(0,0,110,110))
icon_2:setTouchEnabled(false)
icon_2:setLayoutComponentEnabled(true)
icon_2:setName("icon_2")
icon_2:setPosition(126.2546, 115.9999)
icon_2:setScaleX(1)
icon_2:setScaleY(1)
icon_2:setLocalZOrder(0)
icon_2:setAnchorPoint(0.5, 0.5)
icon_2:setOpacity(255)
icon_2:setColor(cc.c3b(255, 255, 255))
icon_2:setVisible(true)
icon_2:setRotation(0)
icon_2:setRotationSkewX(0)
icon_2:setRotationSkewY(0)
icon_2:setTag(568)
icon_2:setCascadeColorEnabled(true)
icon_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(icon_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.1892873)
layout:setPositionPercentY(0.288557)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.1649)
layout:setPercentHeight(0.2736)
layout:setSize(cc.size(110, 110))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(71.2546)
layout:setRightMargin(485.7454)
layout:setTopMargin(231.0001)
layout:setBottomMargin(60.9999)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(icon_2)

--Create name_2
local name_2 = ccui.ImageView:create()
name_2:ignoreContentAdaptWithSize(false)
name_2:loadTexture("ui/common/name_110102.png",0)

name_2:setFlippedX(false)
name_2:setFlippedY(false)

name_2:setScale9Enabled(false)
name_2:setCapInsets(cc.rect(0,0,110,19))
name_2:setTouchEnabled(false)
name_2:setLayoutComponentEnabled(true)
name_2:setName("name_2")
name_2:setPosition(238.8752, 147.0594)
name_2:setScaleX(1)
name_2:setScaleY(1)
name_2:setLocalZOrder(0)
name_2:setAnchorPoint(0.5, 0.5)
name_2:setOpacity(255)
name_2:setColor(cc.c3b(255, 255, 255))
name_2:setVisible(true)
name_2:setRotation(0)
name_2:setRotationSkewX(0)
name_2:setRotationSkewY(0)
name_2:setTag(569)
name_2:setCascadeColorEnabled(true)
name_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(name_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.3581337)
layout:setPositionPercentY(0.3658194)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(110, 19))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(183.8752)
layout:setRightMargin(373.1248)
layout:setTopMargin(245.4406)
layout:setBottomMargin(137.5594)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(name_2)

--Create skilldes_2
local skilldes_2 = ccui.Text:create()
skilldes_2:setFontSize(16)
skilldes_2:setString([[到家啦附近的立法家里都是煎熬了房间爱说的浪费就拉屎的解放路口的]])
skilldes_2:setTextHorizontalAlignment(0)
skilldes_2:setTextVerticalAlignment(1)
skilldes_2:setTouchScaleChangeEnabled(false)
skilldes_2:setFlippedX(false)
skilldes_2:setFlippedY(false)
skilldes_2:setTouchEnabled(false)
skilldes_2:setLayoutComponentEnabled(true)
skilldes_2:setName("skilldes_2")
skilldes_2:setPosition(366.6257, 95.3099)
skilldes_2:setScaleX(1)
skilldes_2:setScaleY(1)
skilldes_2:setLocalZOrder(0)
skilldes_2:setAnchorPoint(0.5, 0.5)
skilldes_2:setOpacity(255)
skilldes_2:setColor(cc.c3b(255, 255, 255))
skilldes_2:setVisible(true)
skilldes_2:setRotation(0)
skilldes_2:setRotationSkewX(0)
skilldes_2:setRotationSkewY(0)
skilldes_2:setTag(570)
skilldes_2:setCascadeColorEnabled(true)
skilldes_2:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skilldes_2)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.5496637)
layout:setPositionPercentY(0.2370893)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0.5247)
layout:setPercentHeight(0.1741)
layout:setSize(cc.size(350, 70))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(191.6257)
layout:setRightMargin(125.3743)
layout:setTopMargin(271.6901)
layout:setBottomMargin(60.3099)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_yoke:addChild(skilldes_2)

--Create flag_1
local flag_1 = cc.Sprite:create("ui/tips/flag.png")
flag_1:setName("flag_1")
flag_1:setPosition(-219.875, 153)
flag_1:setScaleX(1)
flag_1:setScaleY(1)
flag_1:setLocalZOrder(0)
flag_1:setAnchorPoint(0.5, 0.5)
flag_1:setOpacity(255)
flag_1:setColor(cc.c3b(255, 255, 255))
flag_1:setVisible(true)
flag_1:setRotation(0)
flag_1:setRotationSkewX(0)
flag_1:setRotationSkewY(0)
flag_1:setTag(122)
flag_1:setCascadeColorEnabled(true)
flag_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(flag_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(190, 119))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-314.875)
layout:setRightMargin(124.875)
layout:setTopMargin(-212.5)
layout:setBottomMargin(93.5)
flag_1:setFlippedX(false)
flag_1:setFlippedY(false)
Node:addChild(flag_1)

--Create Panel_Name
local Panel_Name = ccui.Layout:create()
Panel_Name:ignoreContentAdaptWithSize(false)

Panel_Name:setClippingEnabled(false)
Panel_Name:setBackGroundImageCapInsets(cc.rect(0,0,0,0))
Panel_Name:setBackGroundColor(cc.c3b(150, 200, 255))
Panel_Name:setBackGroundColor(cc.c3b(150, 200, 255),cc.c3b(255, 255, 255))
Panel_Name:setBackGroundColorVector(cc.p(0,1))
Panel_Name:setBackGroundColorType(0)
Panel_Name:setBackGroundColorOpacity(102)
Panel_Name:setBackGroundImageScale9Enabled(false)

Panel_Name:setTouchEnabled(true)
Panel_Name:setLayoutComponentEnabled(true)
Panel_Name:setName("Panel_Name")
Panel_Name:setPosition(-294.625, 123)
Panel_Name:setScaleX(1)
Panel_Name:setScaleY(1)
Panel_Name:setLocalZOrder(0)
Panel_Name:setAnchorPoint(0, 0)
Panel_Name:setOpacity(255)
Panel_Name:setColor(cc.c3b(255, 255, 255))
Panel_Name:setVisible(true)
Panel_Name:setRotation(0)
Panel_Name:setRotationSkewX(0)
Panel_Name:setRotationSkewY(0)
Panel_Name:setTag(557)
Panel_Name:setCascadeColorEnabled(true)
Panel_Name:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_Name)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0)
layout:setPositionPercentY(0)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(150, 80))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(-294.625)
layout:setRightMargin(144.625)
layout:setTopMargin(-203)
layout:setBottomMargin(123)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Node:addChild(Panel_Name)

--Create nameFrame_1
local nameFrame_1 = cc.Sprite:create("ui/tips/nameFrame.png")
nameFrame_1:setName("nameFrame_1")
nameFrame_1:setPosition(72.125, 16)
nameFrame_1:setScaleX(1)
nameFrame_1:setScaleY(1)
nameFrame_1:setLocalZOrder(0)
nameFrame_1:setAnchorPoint(0.5, 0.5)
nameFrame_1:setOpacity(255)
nameFrame_1:setColor(cc.c3b(255, 255, 255))
nameFrame_1:setVisible(true)
nameFrame_1:setRotation(0)
nameFrame_1:setRotationSkewX(0)
nameFrame_1:setRotationSkewY(0)
nameFrame_1:setTag(124)
nameFrame_1:setCascadeColorEnabled(true)
nameFrame_1:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(nameFrame_1)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.4808333)
layout:setPositionPercentY(0.2)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(133, 33))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(5.625)
layout:setRightMargin(11.375)
layout:setTopMargin(47.5)
layout:setBottomMargin(-0.5)
nameFrame_1:setFlippedX(false)
nameFrame_1:setFlippedY(false)
Panel_Name:addChild(nameFrame_1)

--Create skillName
local skillName = ccui.Text:create()
skillName:setFontSize(30)
skillName:setString([[剑雨]])
skillName:setTextHorizontalAlignment(1)
skillName:setTextVerticalAlignment(1)
skillName:setTouchScaleChangeEnabled(false)
skillName:setFlippedX(false)
skillName:setFlippedY(false)
skillName:setTouchEnabled(false)
skillName:setLayoutComponentEnabled(true)
skillName:setName("skillName")
skillName:setPosition(71.5758, 51.048)
skillName:setScaleX(1)
skillName:setScaleY(1)
skillName:setLocalZOrder(0)
skillName:setAnchorPoint(0.5, 0.5)
skillName:setOpacity(255)
skillName:setColor(cc.c3b(238, 245, 12))
skillName:setVisible(true)
skillName:setRotation(0)
skillName:setRotationSkewX(0)
skillName:setRotationSkewY(0)
skillName:setTag(402)
skillName:setCascadeColorEnabled(true)
skillName:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skillName)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.477172)
layout:setPositionPercentY(0.6381)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(60, 30))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(41.5758)
layout:setRightMargin(48.4242)
layout:setTopMargin(13.952)
layout:setBottomMargin(36.048)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_Name:addChild(skillName)

--Create skillWay
local skillWay = ccui.Text:create()
skillWay:setFontSize(20)
skillWay:setString([[手动技能]])
skillWay:setTextHorizontalAlignment(1)
skillWay:setTextVerticalAlignment(1)
skillWay:setTouchScaleChangeEnabled(false)
skillWay:setFlippedX(false)
skillWay:setFlippedY(false)
skillWay:setTouchEnabled(false)
skillWay:setLayoutComponentEnabled(true)
skillWay:setName("skillWay")
skillWay:setPosition(71.5758, 15.894)
skillWay:setScaleX(1)
skillWay:setScaleY(1)
skillWay:setLocalZOrder(0)
skillWay:setAnchorPoint(0.5, 0.5)
skillWay:setOpacity(255)
skillWay:setColor(cc.c3b(0, 228, 255))
skillWay:setVisible(true)
skillWay:setRotation(0)
skillWay:setRotationSkewX(0)
skillWay:setRotationSkewY(0)
skillWay:setTag(403)
skillWay:setCascadeColorEnabled(true)
skillWay:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(skillWay)
layout:setPositionPercentXEnabled(false)
layout:setPositionPercentYEnabled(false)
layout:setPositionPercentX(0.477172)
layout:setPositionPercentY(0.198675)

layout:setPercentWidthEnabled(false)
layout:setPercentHeightEnabled(false)

layout:setPercentWidth(0)
layout:setPercentHeight(0)
layout:setSize(cc.size(80, 20))

layout:setHorizontalEdge(0)
layout:setVerticalEdge(0)
layout:setLeftMargin(31.5758)
layout:setRightMargin(38.4242)
layout:setTopMargin(54.106)
layout:setBottomMargin(5.894)
layout:setStretchWidthEnabled(false)
layout:setStretchHeightEnabled(false)
Panel_Name:addChild(skillWay)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1)
--Create Animation List

result['root'] = Node
return result;
end

return Result

