
local MapEvent     = require("app.map.MapEvent")

-- local BossFightView = class("BossFightView")
local BossFightView = class("BossFightView", function ()
    return display.newSprite()
    -- return require("core.ui.Panel2").new()
end)

BossFightView._isVisible = false
function BossFightView:ctor()

end

function BossFightView:createView(parent)
    -- print("----------------------------------------------------------------------------------------------------")
    self:_initChildrenView();

    local x = 340
    local y = display.height-45-(self.height_/2)
    -- print(format("BossFightView x({1}) y({2}) display.height({3}) height({4})", x, y, display.height, self.height_))
    self:align(display.LEFT_BOTTOM, x, y)
    if parent then
        parent:addChild(self)
    end

    -- 注册消息侦听
    self:_initListener()
    -- print("----------------------------------------------------------------------------------------------------")
end

function BossFightView:removeView()
    self:_disposeListener();
    self:_disposeChildrenView();    
    -- self:removeFromParent()
end

function BossFightView:_bossShowEventHandle(event, data)
    local object = data.mData.object
    self:_initBossHead(object.state_.resId)
    self:_setUIVisible(true)

    -- 是否显示动画
    local isUseAnim = false 
    self:_setData(object, isUseAnim)
end

function BossFightView:_changeEventHandle(event, data)
    local object = data.mData.object

    -- 是否显示动画
    local isUseAnim = true
    self:_setData(object, isUseAnim)
end

function BossFightView:_restartEventHandle(event, data)
    self:_setUIVisible(false)
end

function BossFightView:_setUIVisible(isVisible)
    if self._isVisible == isVisible then return end
    self._isVisible = isVisible
    self:setVisible(isVisible)
end

function BossFightView:getFirePosition()
    local x,y = self:convertToWorldSpace(ccp(self.sprite_:getPositionX(),self.sprite_:getPositionY()))
    return x,y
end

BossFightView.HP_WIDTH = 500
BossFightView._isInit = false
BossFightView._isInitListener = false
function BossFightView:_initChildrenView()
    if self._isInit then return end

    local containerView = self
    -- 血量背景
    -- default anchor 0.5 0.5
    local bossHpBG_Width = BossFightView.HP_WIDTH
    local bossHpBG_Height = 105
    local bossHpBG_PosX = bossHpBG_Width/2
    local bossHpBG_PosY = bossHpBG_Height/2
    self._imgBossHpBG_1 = LayoutParser.createSprite({
        parent=containerView, src="Battle.boss_hp_bg"
        , scale9Grid = CCRect(120, 0, 5, 105), width = bossHpBG_Width, height = bossHpBG_Height
        , x=bossHpBG_PosX, y=bossHpBG_PosY
    })
    -- 利用背景设置整个组件大小
    self.height_ = self._imgBossHpBG_1:getContentSize().height
    self.width_ = self._imgBossHpBG_1:getContentSize().width
    -- print(format("BossFightView size width({1}) height({2})", self.width_, self.height_))

    -- 血量
    -- width height 155 34
    -- 62 + 5 = 70, （400 - 70)

    self._BossHp_1_width = bossHpBG_Width - 70 - 35
    self._imgBossHp_1 = LayoutParser.createSprite({
        parent=containerView, src="Battle.boss_hp_thumb"
        , scale9Grid = CCRect(10, 0, 20, 34), width = self._BossHp_1_width, height = 34
        , x=70, y=bossHpBG_PosY - 5, anchor = "0.0,0.5"
        -- , opacity = 125
    })
    self._imgBossHp_1:setScaleX(1)

    -- 关闭第二血条
    -- self._imgBossHp_2 = LayoutParser.createSprite({
    --     parent=containerView, src="Battle.boss_hp_thumb"
    --     , scale9Grid = CCRect(10, 0, 20, 34), width = width, height = 34
    --     , x=68, y=bossHpBG_PosY, anchor = "0.0,0.5"
    -- })
    -- self._imgBossHp_2:setScaleX(1)

    -- 血量进度包装器
    -- self.__ptBossHp = CCProgressTimer:create(self._imgBossHp_1)
    -- self.__ptBossHp:setType(kCCProgressTimerTypeBar) -- 条形
    -- self.__ptBossHp:setMidpoint(ccp(1,0)) -- 设置起点
    -- self.__ptBossHp:setBarChangeRate(ccp(0, 1)) -- 变化rate
    -- self.__ptBossHp:setAnchorPoint(ccp(0, 0.5))
    -- self.__ptBossHp:setPosition(ccp(55, bossHpBG_PosY)) -- 左右依照效果图，上下居中
    -- self.__ptBossHp:setPercentage(100);
    -- containerView:addChild(self.__ptBossHp);

    -- 血条效果发光效果
    -- 62 295
    -- 光标
    self._animationHp_1_y = bossHpBG_PosY-5
    self._animBossHp_1 = LayoutParser.createAnim({
        parent=containerView, src="anim/BossBloodDown2"
        , x=295, y=bossHpBG_PosY-5, anchor = "0.0,0.5"
    })
    -- 喷血
    self._animBossHp_2 = LayoutParser.createAnim({
        parent=containerView, src="anim/BossBloodDown"
        , x=295, y=bossHpBG_PosY-5, anchor = "0.0,0.5"
    })
    -- dump(self._animBossHp_1)

    -- self:_initBossHead("100203")

    self:setVisible(false)
    
    self._isInit = true
end

BossFightView._renderResourceId = nil
function BossFightView:_initBossHead(resourceId)
    if self._renderResourceId == resourceId then
        return
    end
    -- print("----------------------------------------------------------------------------------------------------")
    self._renderResourceId = resourceId
    -- print(format("BossFightView:_initBossHead resourceId({1})", resourceId))

    local containerView = self

    -- 100203
    -- 头像带遮罩
    -- local maskScale = 0.6
    -- self._imgBossHeadMask = LayoutParser.createSprite({
    --     src="/black_mask.png", scale=maskScale
    -- })
    -- local sprintX = self._imgBossHeadMask:getContentSize().width*maskScale/2 
    -- local sprintY = self._imgBossHeadMask:getContentSize().height*maskScale/2
    -- local headScale = 0.6
    -- self._imgBossHead = LayoutParser.createSprite({
    --     src="/Icon.hd.100203", scale=headScale
    -- })
    -- self._imgBossHead:setPosition(ccp(sprintX, sprintY))
    -- self.__maskedBossHead = CCMask:create(self._imgBossHeadMask , self._imgBossHead)
    -- self.__maskedBossHead:setPosition(ccp(35, bossHpBG_PosY+1.5))
    -- containerView:addChild(self.__maskedBossHead)

    local bossHpBG_Height = 75
    local bossHpBG_PosY = bossHpBG_Height/2

    -- 头像不带遮罩
    --
    -- if self._imgBossHeadBg == nil then
    --     self._imgBossHeadBg = LayoutParser.createSprite({
    --         parent=containerView, src="Fight.boss_head_bg"
    --         , x=35, y=bossHpBG_PosY+1.5, anchor = "0.5,0.5"
    --     })
    -- end

    -- 
    if self._imgBossHead then
        self._imgBossHead:removeFromParent()
        self._imgBossHead = nil
    end
    local path = "/Icon." .. resourceId .. "_circular"
    self._imgBossHead = LayoutParser.createSprite({
        parent=containerView, src=path
        , x=48, y=bossHpBG_PosY+5, anchor = "0.5,0.5"
        -- , width = 61, height = 61
        , scale = 61/96
    })
    -- print("----------------------------------------------------------------------------------------------------")
end

function BossFightView:_disposeChildrenView()
    if not self._isInit then return end
    self:removeAllChildrenWithCleanup(true)
    self._isInit = false
end

-- 侦听（消息、Signal）
function BossFightView:_initListener()
    -- print("BossFightView:_initListener")
    if self._isInitListener then return end

    NotifyCenter.register(self, handler(self, self._bossShowEventHandle), MapEvent.FIGHT_BOSS_SHOW)
    NotifyCenter.register(self, handler(self, self._changeEventHandle), MapEvent.FIGHT_BOSS_HP_CHANGE_EVENT)
    -- NotifyCenter.register(self, handler(self, self._restartEventHandle), MapEvent.RESTART_ROUNT_EVENT)
    NotifyCenter.register(self, handler(self, self._restartEventHandle), NotifyMessage.BattleRoundBegin)
    
    self._isInitListener = true
end

function BossFightView:_disposeListener()
    -- print("BossFightView:_disposeListener")
    if not self._isInitListener then return end
    NotifyCenter.unregister(self)
    self._isInitListener = false
end

function BossFightView:_newAction()
    local actionArray = CCArray:create()
    -- actionArray:addObject(CCEaseExponentialOut:create(CCScaleTo:create(0.67, scaleX, 1)))
    local scaleX = self._hpPercent 
    actionArray:addObject(CCScaleTo:create(1, scaleX, 1))
    actionArray:addObject(CCCallFuncN:create(
        function()
            self:_hpActionComplete()
        end
    ))
    -- CCSpawn
    local x = self._imgBossHp_1:getPositionX() + self._BossHp_1_width * self._hpPercent 
    local y = self._animationHp_1_y -- 75 is bossHpBG_Height
    return CCSequence:create(actionArray), CCMoveTo:create(1, ccp(x, y))
end

BossFightView._showHp = nil
BossFightView._hpPercent = nil
function BossFightView:_hpActionComplete()
    self._hpAction = nil
    self._hpAnimAction = nil

    -- self._imgBossHp_1:setVisible(false)
    self._animBossHp_1:setVisible(false)

    local isUseAnim = false
    self:_renderVisibleHp2(isUseAnim)
end

function BossFightView:_renderVisibleHp2(isUseAnim)
    if self._hpPercent >= 1 then
        -- 满血
        if not isUseAnim then
            -- self._imgBossHp_2:setVisible(true)
            self._animBossHp_2:setVisible(false)
        end
    elseif self._hpPercent <= 0 then
        -- 死亡
        -- self._imgBossHp_2:setVisible(false)
        self._animBossHp_2:setVisible(false)
        if not isUseAnim then
            self:_setUIVisible(false)
        end
    else
        if not isUseAnim then
            -- self._imgBossHp_2:setVisible(true)
            self._animBossHp_2:setVisible(true)
        end
    end
end


function BossFightView:_renderHp(isUseAnim)
    -- self._animBossHp_2 的显示状态，由辅助方法self:_renderVisibleHp2()来控制
    -- 调用时机，渲染时（没有动画），渲染时（有动画预设），渲染时（有动画播放完）

    local hpPercent = self._hpPercent
    local animX = self._imgBossHp_1:getPositionX() + self._BossHp_1_width * self._hpPercent 
    local animY = self._animationHp_1_y

    local scaleX = hpPercent
    if (not isUseAnim) then
        self._imgBossHp_1:setVisible(true)
        self._imgBossHp_1:setScaleX(scaleX)
        self._animBossHp_1:setVisible(false)
        self._animBossHp_1:setPosition(ccp(animX, animY))

        -- self._imgBossHp_2:setScaleX(scaleX)
        self._animBossHp_2:setPosition(ccp(animX, animY))
        self:_renderVisibleHp2(isUseAnim)
    else
        self._imgBossHp_1:setVisible(true)
        self._animBossHp_1:setVisible(true)
        -- 带有动画
        -- 先停正在播放的
        if self._hpAction then
            self._imgBossHp_1:stopAction(self._hpAction)
            self._hpAction = nil

            self._animBossHp_1:stopAction(self._hpAnimAction)
            self._hpAnimAction = nil
        end
        -- 播放效果
        self._hpAction, self._hpAnimAction = self:_newAction()
        self._imgBossHp_1:runAction(self._hpAction)
        self._animBossHp_1:runAction(self._hpAnimAction)

        -- 播放动画时隐藏，播放完显示
        -- self._imgBossHp_2:setScaleX(scaleX)
        self._animBossHp_2:setPosition(ccp(animX, animY))
        self:_renderVisibleHp2(isUseAnim)
    end
end

function BossFightView:_setData(object, isUseAnim)
    if object == nil then
        return
    end

    if self._showHp == object.hp_ then return end
    self._showHp = object.hp_
    -- 计算百分比
    local hpPercent = object.hp_/object.maxHp_
    if self._hpPercent == hpPercent then return end
    self._hpPercent = hpPercent
    -- print(format("BossFightView:_setData hpPercent({1})", hpPercent))

    -- 渲染
    self:_renderHp(isUseAnim)
end

return BossFightView
