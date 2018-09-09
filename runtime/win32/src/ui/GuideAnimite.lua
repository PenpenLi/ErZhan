local guideAnimate = {}
local EffectAniCache = require("app.map.spine.EffectAniCache")
local effAniData     = require("app.properties.EffectProperties")
local CsbAni            = require("app.map.spine.CsbAni")
local monsterPos = {530,570,580,560}
EffectAniCache.addEffectAniCache("Finger",effAniData.Finger)
--EffectAniCache.addEffectAniCache("jitan_plunder",effAniData.jitan_plunder)
--EffectAniCache.addEffectAniCache("jitan_plunder_2",effAniData.jitan_plunder_2)
local result = nil
--idx   当前需要第几个动画 1.掠夺 2.召唤
function guideAnimate.setAnimate(idx,replay,func)
    guideAnimate.func = func
    guideAnimate.idx = idx
    if guideAnimate.layer == nil then
        guideAnimate.layer = ccui.Layout:create()
        guideAnimate.layer:setAnchorPoint(cc.p(0.5,0.5))
        -- change by Owen, 2016.6.6, 为了做适配，去掉这个大小
        -- guideAnimate.layer:setContentSize(cc.size(1350,860))
        guideAnimate.layer:setTouchEnabled(true)
    end
    if replay == nil then  
        guideAnimate.bg = ccui.ImageView:create("ui/fight/gameGuide/tipsBg.png")
        guideAnimate.bg:setScale(0.5)
        --暗的按钮用图片
        local btnPath = nil
        if guideAnimate.idx == 1 then
            btnPath = "ui/fight/gameGuide/btnOk_CN.png"
        else
            btnPath = "ui/fight/gameGuide/btnGoOn_CN.png"
        end
        local btnImage = cc.Sprite:create(btnPath)
        EnableGraySprite(btnImage)
        btnImage:setPosition(cc.p(400,-20))
        guideAnimate.bg:addChild(btnImage,-2)
        -- change by Owen, 2016.6.6, 为了做适配，去掉这个位置
        -- guideAnimate.bg:setPosition(display.cx,display.cy+40)
        guideAnimate.layer:addChild(guideAnimate.bg)
    else
       guideAnimate.bg:removeAllChildren(true)
       if guideAnimate.bg:getChildByName("btn") == nil then
             local btnPath = nil
            if guideAnimate.idx == 1 then
                btnPath = "ui/fight/gameGuide/btnOk_CN.png"
            else
                btnPath = "ui/fight/gameGuide/btnGoOn_CN.png"
            end
           local button = ccui.Button:create(btnPath)
            button:setPosition(cc.p(400,-20))
            button:setName("btn")
            guideAnimate.bg:addChild(button,-1)
            local function clickEvent(sender,event)
                if guideAnimate.idx == 2 then
                     guideAnimate.layer:stopAllActions()
                     guideAnimate.bg:removeAllChildren()
                     local size = guideAnimate.bg:getContentSize()
                     local image = ccui.ImageView:create("ui/fight/gameGuide/callShow.png")
                     image:setPosition(cc.p(size.width/2,size.height/2))
                     guideAnimate.bg:addChild(image)
                     local button = ccui.Button:create("ui/fight/gameGuide/btnOk_CN.png")
                     button:setPosition(cc.p(400,-20))
                     button:setName("btn")
                     guideAnimate.bg:addChild(button,-1)
                     local function callBack()
                        if guideAnimate.func then
                            guideAnimate.layer = nil
                            guideAnimate.func()
                            guideAnimate.func = nil
                        end
                     end
                     button:addClickEventListener(callBack)
                 else
                    guideAnimate.layer:stopAllActions()
                    if guideAnimate.func then
                        guideAnimate.layer = nil
                        guideAnimate.func()
                        guideAnimate.func = nil
                    end               
                 end      
            end
            button:addClickEventListener(clickEvent)
        end
    end
    local bgSize = guideAnimate.bg:getContentSize()
    local bg1 = ccui.ImageView:create("ui/fight/gameGuide/3_11.jpg")
    -- change by Owen, 2016.7.29, idx == 1 表示是掠夺 2.召唤
    if idx == 1 then
        bg1:loadTexture("ui/fight/gameGuide/3_02.jpg")
    end
    bg1:setPosition(cc.p(bgSize.width/2,bgSize.height/2))
    guideAnimate.bg:addChild(bg1)
    guideAnimate.bg:setTouchEnabled(true)
    --四个怪物
    guideAnimate.monster = {}
    --四个金币
    guideAnimate.coins = {}
    for i = 1,4 do
        guideAnimate.monster[i] = CsbAni.new("100401","monster/100401.csb")
        guideAnimate.monster[i]:setFlippedX(true)
        guideAnimate.monster[i]:setPosition(cc.p(monsterPos[i],300-(i-2)*60))
        guideAnimate.monster[i]:playAni("Idle",true)
        guideAnimate.bg:addChild(guideAnimate.monster[i])
        if guideAnimate.idx == 2 then
            guideAnimate.monster[i]:setVisible(false)
        end
    end
    --panel
    guideAnimate.layout = ccui.Layout:create()
    guideAnimate.layout:setClippingEnabled(true)
    guideAnimate.layout:setContentSize(cc.size(662,320))
    guideAnimate.layout:setPosition(cc.p(0,80))
    guideAnimate.layout:setTouchEnabled(false)
    guideAnimate.bg:addChild(guideAnimate.layout)
    --祭坛塔
    guideAnimate.node = cc.CSLoader:createNode("tower/jitan.csb")
    local action = cc.CSLoader:createTimeline("tower/jitan.csb")

    guideAnimate.node:runAction(action)
    action:gotoFrameAndPlay(0)
    guideAnimate.node:setPosition(cc.p(400,190))
    guideAnimate.bg:addChild(guideAnimate.node)

    --祭坛塔周围圆形特效
    if guideAnimate.idx == 1 then
        --guideAnimate.effect = EffectAniCache.getEffectAniCache("jitan_plunder",true,jitan_plunder)
        guideAnimate.effect = ccui.ImageView:create("ui/fight/soldierTower/jitan_plunder.png")
        local fadeOut = cc.FadeOut:create(2)
        local fadeIn = cc.FadeIn:create(2)
        local rotate = cc.RotateBy:create(5,360)
        local act_1  = cc.Spawn:create(cc.Sequence:create(fadeOut,fadeIn),rotate)
        local action = cc.RepeatForever:create(act_1)
        guideAnimate.effect:runAction(action)
        guideAnimate.effect:setPosition(cc.p(400,200))
        guideAnimate.layout:addChild(guideAnimate.effect)
    end
    local function bgLater()
        --title
        local path = nil
        if guideAnimate.idx == 1 then
            path = "ui/fight/gameGuide/3_02.png"
        else
            path = "ui/fight/gameGuide/3_01.png"
        end
        local title = cc.Sprite:create(path)
        local bgSize = guideAnimate.bg:getContentSize()
        title:setPosition(cc.p(bgSize.width/2,bgSize.height/2+20))
        guideAnimate.bg:addChild(title,10)
        if replay == nil then
            --游戏说明
            local title_1 = cc.Sprite:create("ui/fight/gameGuide/explanTitle_CN.png")
            local titSize = title_1:getContentSize()
            title_1:setPosition(cc.p(display.cx,display.height-titSize.height-15))
            guideAnimate.layer:addChild(title_1,10)
        end
        local function fingerLater()
            if guideAnimate.finger then
                guideAnimate.finger:removeFromParent()
                guideAnimate.finger = nil
                result = import("ui.towerControl.lua").create(callBack)
                for i = 1,4 do
                    local name = "fireRange_"..(i+13)
                    guideAnimate[i] = result[name]
                    guideAnimate[i]:setVisible(false)
                end
                guideAnimate.control = result.root
                guideAnimate.control:setScale(0.3)
                guideAnimate.control:setPosition(cc.p(400,240))
                guideAnimate.bg:addChild(guideAnimate.control)
                local function moveFinger()
                    local function showCircle()
                        --祭坛塔上的粒子光特效
                        if guideAnimate.idx == 1 then
                            guideAnimate.idx_1()
                        else
                            guideAnimate.idx_2()
                        end
                    end
                    guideAnimate.finger = EffectAniCache.getEffectAniCache("Finger",false,showCircle)
                    local pos = {x = 400,y = 140}
                    if guideAnimate.idx == 2 then
                        pos = {x = 500,y = 270}
                    end
                    guideAnimate.finger:setPosition(pos)
                    guideAnimate.bg:addChild(guideAnimate.finger)
                end
                local function circleAction()
                    local coins = result.coins
                    local size = coins:getContentSize()
                    local circle = cc.Sprite:create("ui/fight/heroControl/heroSelect2.png")
                    circle:setScale(0.7)
                    circle:setPosition(cc.p(size.width/2,size.height/2))
                    coins:addChild(circle)
                    local rorate = cc.RepeatForever:create(cc.RotateBy:create(1,360))
                    circle:runAction(rorate)
                end
                local move = cc.ScaleTo:create(0.3,1)
                local delta = cc.DelayTime:create(0.7)
                local action_2 = nil
                if guideAnimate.idx == 1 then
                    action_2 = cc.Sequence:create(move,cc.CallFunc:create(circleAction),delta,cc.CallFunc:create(moveFinger))
                else
                    action_2 = cc.Sequence:create(move,delta,cc.CallFunc:create(moveFinger))
                end
                guideAnimate.control:runAction(action_2)
            end
        end
        guideAnimate.finger = EffectAniCache.getEffectAniCache("Finger",false,fingerLater)
        guideAnimate.finger:setPosition(cc.p(400,240))
        guideAnimate.bg:addChild(guideAnimate.finger)
    end
    if replay == nil then
        local move = cc.ScaleTo:create(0.3,1)
        local delta = cc.DelayTime:create(0.3)
        local action_1 = cc.Sequence:create(move,delta,cc.CallFunc:create(bgLater))
        guideAnimate.bg:runAction(action_1)
        return guideAnimate.layer
    else
        bgLater()
    end
end
--掠夺动画
function guideAnimate.idx_1()
    guideAnimate.finger:removeFromParent()
    guideAnimate.finger = nil

    --local effect_2 = EffectAniCache.getEffectAniCache("jitan_plunder_2",false)
    --effect_2:setPosition(cc.p(400,190))
    --guideAnimate.layout:addChild(effect_2)
    guideAnimate.effect:setVisible(not guideAnimate.effect:isVisible())
    for i = 1,4 do
        guideAnimate.coins[i] = cc.Sprite:create("ui/fight/gold.png")
        guideAnimate.coins[i]:setPosition(cc.p(guideAnimate.monster[i]:getPositionX(),guideAnimate.monster[i]:getPositionY()))
        guideAnimate.bg:addChild(guideAnimate.coins[i])
        guideAnimate.control:setVisible(false)
        local bezier = {
            cc.p(guideAnimate.coins[i]:getPositionX(),guideAnimate.coins[i]:getPositionY()),
            cc.p(guideAnimate.coins[i]:getPositionX()-50,guideAnimate.coins[i]:getPositionY()+100),
            cc.p(400,190),
        }
        local bezierForward = cc.BezierTo:create(1, bezier)
        guideAnimate.control:setVisible(false)
        local function getCoins()
            guideAnimate.coins[i]:setVisible(false)
            utils.createAniFont("金币增加",guideAnimate.layer,nil,nil,cc.p(display.cx,display.cy+50))
            if guideAnimate.bg:getChildByName("btn") == nil then
                local button = ccui.Button:create("ui/fight/gameGuide/btnOk_CN.png")
                button:setPosition(cc.p(400,-20))
                button:setName("btn")
                guideAnimate.bg:addChild(button,-1)            
                local function clickEvent(sender,event)
                    guideAnimate.layer:stopAllActions()
                    if guideAnimate.func then
                       guideAnimate.layer = nil
                       guideAnimate.func()
                       guideAnimate.func = nil
                    end
                    --guideAnimate.layer:removeFromParent(true)
                    --guideAnimate.layer = nil                    
                end
                button:addClickEventListener(clickEvent)
            end
            local delta = cc.DelayTime:create(1.5)
            local function again()
                guideAnimate.setAnimate(guideAnimate.idx,false,guideAnimate.func)
            end
            guideAnimate.layer:runAction(cc.Sequence:create(delta,cc.CallFunc:create(again)))
        end
        guideAnimate.coins[i]:runAction(cc.Sequence:create(bezierForward,cc.CallFunc:create(getCoins)))
    end
end
--召唤
function guideAnimate.idx_2()
    for i = 1,4 do
        if guideAnimate[i] then
            guideAnimate[i]:setVisible(true)
        end 
    end
    guideAnimate.finger:removeFromParent()
    guideAnimate.finger = nil
    local gou = cc.Sprite:create("ui/fight/tower/build.png")
    gou:setPosition(cc.p(500,270))
    guideAnimate.bg:addChild(gou)
    local monster = result.Sprite_11
    monster:setVisible(false)
    local function fingerLater()
         guideAnimate.finger:removeFromParent()
         guideAnimate.finger = nil
         local monster = CsbAni.new("170106","hero/170106.csb")
         monster:setPosition(cc.p(600,240))
         guideAnimate.bg:addChild(monster)
         local function final()
            guideAnimate.control:setVisible(false)
            if gou then
                gou:removeFromParent()
            end
            local delta = cc.DelayTime:create(1.5)
            local function again()
                guideAnimate.setAnimate(guideAnimate.idx,false,guideAnimate.func)
            end
            guideAnimate.layer:runAction(cc.Sequence:create(delta,cc.CallFunc:create(again)))
         end
         monster:playAni("Idle",false,nil,nil,final)
         for i = 1,4 do
            if guideAnimate[i] then
                guideAnimate[i]:setVisible(false)
            end 
         end
         if guideAnimate.bg:getChildByName("btn") == nil then
             local button = ccui.Button:create("ui/fight/gameGuide/btnGoOn_CN.png")
             button:setPosition(cc.p(400,-20))
             button:setName("btn")
             guideAnimate.bg:addChild(button,-1)
             local function clickEvent(sender,event)
                 guideAnimate.layer:stopAllActions()
                 guideAnimate.bg:removeAllChildren()
                 local size = guideAnimate.bg:getContentSize()
                 local image = ccui.ImageView:create("ui/fight/gameGuide/callShow.png")
                 image:setPosition(cc.p(size.width/2,size.height/2))
                 guideAnimate.bg:addChild(image)
                 local button = ccui.Button:create("ui/fight/gameGuide/btnOk_CN.png")
                 button:setPosition(cc.p(400,-20))
                 button:setName("btn")
                 guideAnimate.bg:addChild(button,-1)
                 local function callBack()
                    if guideAnimate.func then
                        guideAnimate.layer = nil
                        guideAnimate.func()
                        guideAnimate.func = nil
                    end
                 end
                 button:addClickEventListener(callBack)
                 --[[if guideAnimate.func then
                    guideAnimate.layer = nil
                    guideAnimate.func()
                    guideAnimate.func = nil
                 end--]]
             end
            button:addClickEventListener(clickEvent)
        end    
    end
    local frame = cc.Sprite:create("ui/fight")
    guideAnimate.finger = EffectAniCache.getEffectAniCache("Finger",false,fingerLater)
    guideAnimate.finger:setPosition(cc.p(600,240))
    guideAnimate.bg:addChild(guideAnimate.finger)
end
return guideAnimate
