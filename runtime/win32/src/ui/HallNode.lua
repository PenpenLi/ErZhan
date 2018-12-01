--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

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

--Create Sprite_4
local Sprite_4 = cc.Sprite:create("fightImgs/95.png")
Sprite_4:setName("Sprite_4")
Sprite_4:setTag(8)
Sprite_4:setCascadeColorEnabled(true)
Sprite_4:setCascadeOpacityEnabled(true)
Sprite_4:setPosition(0.0000, -139.9999)
layout = ccui.LayoutComponent:bindLayoutComponent(Sprite_4)
layout:setSize(cc.size(1551.0000, 2213.0000))
layout:setLeftMargin(-775.5000)
layout:setRightMargin(-775.5000)
layout:setTopMargin(-966.5001)
layout:setBottomMargin(-1246.5000)
Node:addChild(Sprite_4)

--Create allBg_1
local allBg_1 = cc.Sprite:create("hallImgs/hallBg.png")
allBg_1:setName("allBg_1")
allBg_1:setTag(5)
allBg_1:setCascadeColorEnabled(true)
allBg_1:setCascadeOpacityEnabled(true)
allBg_1:setOpacity(191)
layout = ccui.LayoutComponent:bindLayoutComponent(allBg_1)
layout:setSize(cc.size(750.0000, 1334.0000))
layout:setLeftMargin(-375.0000)
layout:setRightMargin(-375.0000)
layout:setTopMargin(-667.0000)
layout:setBottomMargin(-667.0000)
Node:addChild(allBg_1)

--Create Button_To_Fight
local Button_To_Fight = ccui.Button:create()
Button_To_Fight:ignoreContentAdaptWithSize(false)
Button_To_Fight:loadTextureNormal("hallImgs/toFight.png",0)
Button_To_Fight:loadTexturePressed("hallImgs/toFight.png",0)
Button_To_Fight:loadTextureDisabled("hallImgs/toFight.png",0)
Button_To_Fight:setTitleFontSize(14)
Button_To_Fight:setTitleColor(cc.c3b(65, 65, 70))
Button_To_Fight:setLayoutComponentEnabled(true)
Button_To_Fight:setName("Button_To_Fight")
Button_To_Fight:setTag(18)
Button_To_Fight:setCascadeColorEnabled(true)
Button_To_Fight:setCascadeOpacityEnabled(true)
Button_To_Fight:setPosition(-0.4518, 386.7528)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_To_Fight)
layout:setSize(cc.size(653.0000, 356.0000))
layout:setLeftMargin(-326.9518)
layout:setRightMargin(-326.0482)
layout:setTopMargin(-564.7528)
layout:setBottomMargin(208.7528)
Node:addChild(Button_To_Fight)

--Create Button_My_Cards
local Button_My_Cards = ccui.Button:create()
Button_My_Cards:ignoreContentAdaptWithSize(false)
Button_My_Cards:loadTextureNormal("hallImgs/myCards.png",0)
Button_My_Cards:loadTexturePressed("hallImgs/myCards.png",0)
Button_My_Cards:loadTextureDisabled("hallImgs/myCards.png",0)
Button_My_Cards:setTitleFontSize(14)
Button_My_Cards:setTitleColor(cc.c3b(65, 65, 70))
Button_My_Cards:setLayoutComponentEnabled(true)
Button_My_Cards:setName("Button_My_Cards")
Button_My_Cards:setTag(149)
Button_My_Cards:setCascadeColorEnabled(true)
Button_My_Cards:setCascadeOpacityEnabled(true)
Button_My_Cards:setPosition(-0.4517, 103.9079)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_My_Cards)
layout:setSize(cc.size(653.0000, 362.0000))
layout:setLeftMargin(-326.9517)
layout:setRightMargin(-326.0483)
layout:setTopMargin(-284.9079)
layout:setBottomMargin(-77.0921)
Node:addChild(Button_My_Cards)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result

