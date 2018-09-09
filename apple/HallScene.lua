
require "cocos.spine.SpineConstants"

local ChooseModePanel = require("hall.ChooseModePanel")
local HeroHomePage    = require("hall.HeroHomePage")
local HeroHomeTest    = require("hall.HeroHomeTest")
local Ani_100401      = require("app.animation.Ani_100401")

local HallScene = class("HallScene", function()
    return display.newScene("HallScene")
end)

local random = math.random

function HallScene:ctor()

    -- 测试是否开启了luajit
    print(_VERSION)
    print(jit)

    -- self._widget = GUIReader:shareReader():widgetFromBinaryFile("ui/hall/MainScene.csb")
    -- self._widget = ccs.GUIReader:getInstance():widgetFromBinaryFile("ui/hall/MainScene.csb")
    -- self:addWidget(self._widget) 

    -- local node = cc.CSLoader:getInstance():createNode("ui/hall/MainScene.csb")
    -- self:addChild(node)

    -- 读取studio导出的ExportJson文件
    -- self._widget = ccs.GUIReader:getInstance():widgetFromJsonFile("monster/tauren.ExportJson")
    -- self:addChild(self._widget)
    -- CCArmatureDataManager.sharedArmatureDataManager():addArmatureFileInfo("monster/tauren0.png", "monster/tauren0.plist", "monster/tauren.ExportJson")
    -- local armature = CCArmature:create("monster/tauren.ExportJson");
    -- self:addChild(armature)

    -- -- 加载node
    -- local path = cc.FileUtils:getInstance():fullPathForFilename("testAni3.csb") -- "ui/hall/MainScene.csb")
    -- print("path = "..tostring(path))
    -- self.root_ = cc.CSLoader:createNode(path)  
    -- -- self.root_:setFlipX(true)
    -- -- self.root_:setScaleX(-1.0)
    -- self:addChild(self.root_)

    -- -- 同一个文件创建的节点只能使用同一个文件创建的动画。 
    -- -- 嵌套节点的动画会自动加载动画，可以用嵌套节点->getActionByTag(嵌套节点->getTag()) 来获取动画 
    -- -- 播放动画
    -- local action = cc.CSLoader:createTimeline("testAni3.csb")
    -- self.root_:runAction(action)
    -- -- action:gotoFrameAndPlay(0,60,true)  -- 通过帧数来播放
    -- action:play("attack", false)  -- 通过名字播放


    -- -- 帧事件监听 
    -- action:setFrameEventCallFunc(function(frame) 
    --         local event = frame:getEvent();
    --         print("=========",event);
    --         if event == "finish" then
    --             action:play("attack", false)
    --             action:setFrameEventCallFunc(function(frame) 
    --                 local event = frame:getEvent();
    --                 print("=========",event);
    --             end)
    --         end
    -- end)

    -- -- 帧事件是可以检测到最后一帧的事件的，已测3.6 

 
    -- -- 动画结束侦听 
    -- action:setLastFrameCallFunc(function(frame)
    --    print("calll end action==========")
    -- end) 
    -- -- 可以帧听到，亲测3.6。 



    self.allAnimations = {}

    self.layer = display.newNode()
    self.layer:setContentSize(cc.size(display.width, display.height))
    self:addChild(self.layer)


    local button = display.newSprite("#AddCoinButton.png", display.right - 100, display.bottom + 270)
    self:addChild(button)
    self.addCoinButtonBoundingBox = button:getBoundingBox()

    local button = display.newSprite("#RemoveCoinButton.png", display.right - 100, display.bottom + 100)
    self:addChild(button)
    self.removeCoinButtonBoundingBox = button:getBoundingBox()

    cc.ui.UIPushButton.new({normal = "#ExitButton.png"})
        :onButtonClicked(function()
            os.exit()
        end)
        :pos(display.right - 100, display.top - 100)
        :addTo(self)


    -- 英雄升级界面
    cc.ui.UIPushButton.new({normal = "#ExitButton.png"})
        :onButtonClicked(function()
            os.exit()
        end)
        :pos(display.right - 100, display.top - 100)
        :addTo(self)

     local pauseBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause.png",
        pressed = "ui/fight/pause.png",
        disabled = "ui/fight/pause.png"})
        :onButtonClicked(function(...)
            -- if not self.heroHomePage then
            --     self.heroHomePage = HeroHomePage.new()
            -- end
            -- self:addChild(self.heroHomePage)
            local heroHomePage = HeroHomePage.new()
            self:addChild(heroHomePage)
        end)
        :pos(1024, 300)
        :addTo(self)


    -- 测试cocostudio导出的页面
    local pauseBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause.png",
        pressed = "ui/fight/pause.png",
        disabled = "ui/fight/pause.png"})
        :onButtonClicked(function(...)
            local heroHomeTest = HeroHomeTest.new()
            self:addChild(heroHomeTest)
        end)
        :pos(1324, 300)
        :addTo(self)




    -- 新建关卡按钮，目前就三关
    self:createMapBtns()


    self.label = cc.ui.UILabel.new({
        UILabelType = 1,
        text = "00000",
        font = "UIFont.fnt",
        size = 50,
        x = 50,
        y = display.height - 50,
    })
    self:addChild(self.label)

    self.coins = {}
    self.state = "IDLE"


    self.left   = display.left
    self.right  = display.right
    self.top    = display.top
    self.bottom = display.bottom


end

-- 创建选关按钮
function HallScene:createMapBtns()
    -- 新建关卡按钮，目前就三关
    for i=1,15 do 
        local btn = cc.ui.UIPushButton.new({normal = "ui/hall/cicrl.png"})
            :onButtonClicked(function(...)
                self:changMap(...)
            end)
            :pos(display.left + 2*100*i, display.top - 400*2)
            :addTo(self)
            :setTag(i) 
            :setScale(3)

        if i > 7 then
            btn:setPosition(2*100 * ( i-7 ), display.top - 500*2)
        end
        local label = cc.ui.UILabel.new({
                UILabelType = 2,
                text = tostring(i),
                size = 30,
                color = cc.c3b(255, 64, 64),
                x=-15,
                y=0
            })
        btn:addChild(label)
    end
end

-- 点击了选关按钮
function HallScene:changMap(params)

    -- 显示选难度页面
    print("HallScene:changMap btnId = "..tostring(params.target:getTag()))
    -- if(self.chooseModePanel==nil) then --self.chooseModePanel==nil
    --     self.chooseModePanel = ChooseModePanel.new({mapId = params.target:getTag()})
    --     self:addChild(self.chooseModePanel)
    -- end
    --     self.chooseModePanel:createView({mapId = params.target:getTag()})

    local chooseModePanel = ChooseModePanel.new({mapId = params.target:getTag()})
    self:addChild(chooseModePanel)
end

function HallScene:onTouch(event, x, y)
    if event == "began" then
        local p = cc.p(x, y)
        if cc.rectContainsPoint(self.addCoinButtonBoundingBox, p) then
            -- self.state = "ADD"
            self.m_bAddCoinBtnClicked = true;
        elseif cc.rectContainsPoint(self.removeCoinButtonBoundingBox, p) then
            self.m_bRemoveCoinBtnClicked = true;
        --     self.state = "REMOVE"
        -- else
        --     self.state = "IDLE"
        end
        return true
    elseif event == "moved" then
        -- self.state = "IDLE"
    elseif event == "ended" then 
        self:testSpine(x, y)
    end
end

function HallScene:addCoin()
    local sprite = cc.Sprite3D:create("boss.obj")
    sprite:setScale(20.0)
    sprite:setTexture("boss.png")
    sprite:setPosition(random(self.left, self.right), random(self.bottom, self.top))
    sprite:setRotation3D({x = random(360), y = random(360), z = random(360)})
    self:addChild(sprite, -1)

    local randomValue = random(0, 100)
    local action = nil
    if randomValue < 10 then
        action = cc.ScaleBy:create(3,2)
    elseif randomValue < 40 then
        action = cc.RotateBy:create(3, 360)
    elseif randomValue < 60 then
        action = cc.Blink:create(1, 3)
    elseif randomValue < 80 then
        action = cc.TintBy:create(2, 0, -255, -255)
    else
        action  = cc.FadeOut:create(2)
    end

    local action_back = action:reverse()
    local seq = cc.Sequence:create(action, action_back)

    sprite:runAction(cc.RepeatForever:create(seq))

    self.coins[#self.coins + 1] = sprite
    self.coinsCount = #self.coins
    self.label:setString(string.format("%05d", self.coinsCount))
end

function HallScene:removeCoin()
    local coin = self.coins[self.coinsCount]
    coin:removeFromParent()
    table.remove(self.coins, self.coinsCount)
    self.coinsCount = self.coinsCount - 1
    self.label:setString(string.format("%05d", self.coinsCount))
end

-- 每帧都会执行
function HallScene:onEnterFrame(dt)

    -- local currentIndex = self.sprite_._animate:getCurrentFrameIndex()
    -- print("self.sprite_._animate:getCurrentFrameIndex() = "..tostring(currentIndex))

    for i,v in ipairs(self.allAnimations) do
        if v._animate then
            currentIndex = v._animate:getCurrentFrameIndex()
            if currentIndex == v.fireFrameIndex_ then
                -- print("fire event mainID_ = "..tostring(v.mainID_))
            end
        end
    end
    -- sprite.mainID_ = #self.allAnimations
    -- sprite.fireFrameIndex_ = Ani_100401.Move_Side.fireFrame)

    if self.m_bAddCoinBtnClicked then
        -- ("ladder.GamePvPScene", {mapId=mapId,level = 1,round = 1,uid=data.uid})
        display.replaceScene(require("editor.EditorScene").new({mapId="A0003", modeId = 1}))
    elseif self.m_bRemoveCoinBtnClicked then
        display.replaceScene(require("editor.EditorScene").new({mapId="A0002", modeId = 1}))
    end
    -- if self.state == "ADD" then
    --     self:addCoin()
    -- elseif self.state == "REMOVE" and self.coinsCount > 0 then
    --     self:removeCoin()
    -- end
end

function HallScene:onEnter()
    --     接着来看这个 cc.NODE_ENTER_FRAME_EVENT 帧事件
    -- 帧事件就是update定时器，每一帧调用，如果要使用，
    -- 除了要添加监听，还需要开启update定时器，像这样的代码，self:scheduleUpdate()
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt) self:onEnterFrame(dt) end)
    self:scheduleUpdate()
    self.layer:setTouchEnabled(true)
    self.layer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return self:onTouch(event.name, event.x, event.y)
    end)
  
    -- for i = 1,100 do 
    --   local haha = math.random(450)
    --   self:testSpine(haha, i*2)
    -- end

    self.mCountLabel = cc.ui.UILabel.new({text = "== ", size = 28, color = display.COLOR_RED})
    :align(display.CENTER, display.cx, display.top - 60)
    :addTo(self,1)

    self:testSpine(200,200)

    -- print("TestPerformance:ctor 3")

end

function HallScene:onExit()
    print("HallScene:onExit")
end

local totalMash = 0 

function HallScene:testSpine(x,y)
    self.test_count = 1
    totalMash = totalMash + 1
    self.mCountLabel:setString(tostring(totalMash))
    print("HallScene:testSpine totalMash = "..tostring(totalMash))


    -- 测试根据配置而文件来生成帧动画
    display.addSpriteFrames("monster/100501.plist","monster/100501.pvr.ccz")
    local sprite = display.newSprite("#100501-Idle_0.png")
    
    local frames    = {}    -- 最终用来生成动画的所有的frame
    local aniData   = require("app.animation.Ani_100501")
    local allFrames = aniData.Move_Side.frames    -- 配置的帧顺序
    -- dump(allFrames, "dump allFrames")
    local frameName     -- 每一帧的名字
    for i = 1, #allFrames do
        -- print("test all img frames i = "..tostring(i))
        frameName =  "100501-Move_Side_"..allFrames[i]..".png"
        frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
    end
    local animation = display.newAnimation(frames, aniData.Move_Side.intervalTime) --  0.5/2)     --0.5s里面播放2帧
    sprite:playAnimationForever(animation, 0)
    -- sprite:playAnimationOnce(animation)
    self:addChild(sprite)
    sprite:setPosition(x, y)
    self.sprite_ = sprite
    self.allAnimations[#self.allAnimations + 1] = sprite
    sprite.mainID_ = #self.allAnimations
    sprite.fireFrameIndex_ = aniData.Move_Side.fireFrame[1]
    self.sprite1 = sprite


    do
        return
    end




    -- -- 测试程序生成的帧动画

    -- display.addSpriteFrames("HalloweenLycan.plist","HalloweenLycan.png")
    -- local sprite = display.newSprite("#HalloweenLycan_1.png")
    
    -- local frames = display.newFrames("HalloweenLycan_%d.png",1,12)
    -- local animation = display.newAnimation(frames, 0.1) --  0.5/2)     --0.5s里面播放2帧
    -- sprite:playAnimationForever(animation)
    -- self:addChild(sprite)
    -- sprite:setPosition(x, y)

    -- do
    --     return
    -- end


    -- -- 测试cocosStudio导出的csb动画
    -- local path = cc.FileUtils:getInstance():fullPathForFilename("monster/100501.csb") -- "ui/hall/MainScene.csb")
    -- print("path = "..tostring(path))
    -- local ani = cc.CSLoader:createNode("monster/100501.csb") --path)  
    -- -- ani:setFlipX(true)
    -- -- ani:setScaleX(-1.0)
    -- ani:setPosition(x, y)
    -- self:addChild(ani)

    -- -- 同一个文件创建的节点只能使用同一个文件创建的动画。 
    -- -- 嵌套节点的动画会自动加载动画，可以用嵌套节点->getActionByTag(嵌套节点->getTag()) 来获取动画 
    -- -- 播放动画
    -- local action = cc.CSLoader:createTimeline("monster/100501.csb")
    -- ani:runAction(action)
    -- -- action:gotoFrameAndPlay(0,60,true)  -- 通过帧数来播放
    -- action:play("Move_Side", true)  -- 通过名字播放

    -- -- 帧事件监听 
    -- action:setFrameEventCallFunc(function(frame) 
    --         local event = frame:getEvent();
    --         print("=========",event);
    --         if event == "end" then
    --             -- action:play("Attack_01", true)
    --             -- action:setFrameEventCallFunc(function(frame) 
    --             --     local event = frame:getEvent();
    --             --     print("=========",event);
    --             -- end)
    --             ani:removeSelf()
    --         end
    -- end)

    -- do
    --     return
    -- end




    -- local skeletonNode = sp.SkeletonAnimation:create("spine/spineboy.json", "spine/spineboy.atlas", 0.6)
    -- local skeletonNode = sp.SkeletonAnimation:create("spine/hero-mesh.json", "spine/hero-mesh.atlas", 0.6)
    -- skeletonNode:setSkin("White")
    -- local skeletonNode = sp.SkeletonAnimation:create("spine/skeleton.json", "spine/skeleton.atlas", 1.0)
    -- local skeletonNode = sp.SkeletonAnimation:create("spine/hero-mesh.json", "spine/hero-mesh.atlas", 1.0)
    -- local skeletonNode = sp.SkeletonAnimation:create("spine/hero.json", "spine/hero.atlas", 1.0)
    -- local skeletonNode = sp.SkeletonAnimation:create("spine/bajiao.json", "spine/bajiao.atlas", 1.0)
    local skeletonNode = sp.SkeletonAnimation:create("hero/jiaomowang.json", "hero/jiaomowang.atlas", 1.0)
  
  
    -- skeletonNode:setSkin("White")

    -- skeletonNode:setScale(0.1)

    skeletonNode:registerSpineEventHandler(function (event)
      print(string.format("[spine] %d start: %s", 
                              event.trackIndex,
                              event.animation))
    end, sp.EventType.ANIMATION_START)

    skeletonNode:registerSpineEventHandler(function (event)
      print(string.format("[spine] %d end:", 
                                event.trackIndex))
    end, sp.EventType.ANIMATION_END)

    skeletonNode:registerSpineEventHandler(function (event)
      print(string.format("[spine] %d complete:", 
                                event.trackIndex))
        local currentAniName = skeletonNode:getCurrentAniName(0)
        if currentAniName == "Skill_01" then
            skeletonNode:setAnimation(0, "Idle", true)    
        else
            skeletonNode:setAnimation(0, "Move_Side", true)    
        end
        -- skeletonNode:performWithDelay(function()
        --     skeletonNode:removeFromParent()
        -- end, 1.0)
    end, sp.EventType.ANIMATION_COMPLETE)

    skeletonNode:registerSpineEventHandler(function (event)
      print(string.format("[spine] %d event: %s, %d, %f, %s", 
                              event.trackIndex,
                              event.eventData.name,
                              event.eventData.intValue,
                              event.eventData.floatValue,
                              event.eventData.stringValue)) 
        if event.eventData.name == "fire" then
            -- skeletonNode:setMix("jump", "shoot", 0.2)
            -- skeletonNode:setMix("test", "shoot", 0.2)
            -- skeletonNode:setAnimation(0, "shoot", true)
            -- if not self.test_count then
            --     self.test_count = 1
            -- end
            -- if self.test_count == 2  then 
                -- skeletonNode:pause()
                -- skeletonNode:setToSetupPose()
                -- skeletonNode:setAnimation(0, "Attack", false)  
                -- skeletonNode:resume()
            -- end
            self.test_count = self.test_count + 1
            print("haha event name = "..event.eventData.name)
        end

    end, sp.EventType.ANIMATION_EVENT)

    -- spineboy
    -- skeletonNode:setMix("walk", "jump", 0.2)  -- 设置混合，避免两个动画切换之间带来跳跃
    -- skeletonNode:setMix("jump", "test", 0.2)
    -- skeletonNode:setMix("test", "run", 0.2)
    -- skeletonNode:setMix("run", "hit", 0.2)
    -- skeletonNode:setMix("hit", "death", 0.2)
    -- skeletonNode:setMix("death", "shoot", 0.2)
    -- skeletonNode:setAnimation(0, "walk", true)

    -- skeletonNode:addAnimation(0, "jump", false, 3)
    -- skeletonNode:addAnimation(0, "test", true)
    -- skeletonNode:addAnimation(0, "run", true)
    -- skeletonNode:addAnimation(0, "hit", true)
    -- skeletonNode:addAnimation(0, "death", true)
    -- skeletonNode:addAnimation(0, "shoot", true)

    -- hero
    -- skeletonNode:setMix("Idle", "Walk", 0.2)  -- 设置混合，避免两个动画切换之间带来跳跃
    -- skeletonNode:setMix("Walk", "Run", 0.2)
    -- -- skeletonNode:setMix("Jump", "Run", 0.2)
    -- skeletonNode:setMix("Run", "Attack", 0.2)
    -- skeletonNode:setMix("Attack", "Idle", 0.2)
    -- -- skeletonNode:setMix("Fall", "Crouch", 0.2)
    -- -- skeletonNode:setMix("Crouch", "Attack", 0.2)

    -- skeletonNode:setAnimation(0, "Idle", true)
    -- skeletonNode:addAnimation(0, "Idle", false, 3)
    -- skeletonNode:addAnimation(0, "Walk", true)
    -- -- skeletonNode:addAnimation(0, "Jump", true)
    -- skeletonNode:addAnimation(0, "Run", true)
    -- -- skeletonNode:addAnimation(0, "Fall", true)
    -- -- skeletonNode:addAnimation(0, "Crouch", true)
    -- skeletonNode:addAnimation(0, "Attack", true)
    -- skeletonNode:addAnimation(0, "Idle", true)
    
    
    -- goblins
    -- skeletonNode:setAnimation(0, "walk", true)

    -- -- shoottest
    -- skeletonNode:setAnimation(0, "animation", true)
    -- skeletonNode:addAnimation(0, "animation2", true)
    skeletonNode:setAnimation(0, "Idle", true)    

    -- skeletonNode:setMix("Skill_01", "Idle", 0.2)
    -- skeletonNode:setMix("Idle", "Move_Side", 0.2)

    -- function SoldierView:actionFlip()
         local fRotationY = self.direction == -1 and 180 or 0
         -- skeletonNode:setRotationSkewY(180)
    -- end
    -- 其实setRotationSkewY是设置Y轴倾斜度


    print("skeletonNode.flipX = " .. tostring(skeletonNode.flipX))
    -- skeletonNode:addAnimation(0, "Jump", true)    


    local windowSize = cc.Director:getInstance():getWinSize()
    skeletonNode:setPosition(cc.p(x, y)) -- windowSize.width / 2, 20))
    self.layer:addChild(skeletonNode)

    -- -- --创建一个单点触屏事件
    -- local listener = cc.EventListenerTouchOneByOne:create()
    -- --注册触屏开始事件
    -- listener:registerScriptHandler(function (touch, event)
    --       -- if not skeletonNode:getDebugBonesEnabled() then
    --       --     skeletonNode:setDebugBonesEnabled(true)
    --       -- elseif skeletonNode:getTimeScale() == 1 then
    --       --     skeletonNode:setTimeScale(0.3)
    --       -- else
    --       --     skeletonNode:setTimeScale(1)
    --       --     skeletonNode:setDebugBonesEnabled(false)
    --       -- end

    --       -- local pos = (touch:getLocation())
    --       -- self:testSpine(pos.x, pos.y)

    --       return true
    --   end,cc.Handler.EVENT_TOUCH_BEGAN )

    -- listener:registerScriptHandler(function (touch, event)
    --       local pos = (touch:getLocation())
    --       self:testSpine(pos.x, pos.y)

    --   -- body
    -- end, cc.Handler.EVENT_TOUCH_ENDED)

    -- local eventDispatcher = self:getEventDispatcher()
    -- eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

return HallScene
