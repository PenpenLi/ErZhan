

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local MapConstants      = require("app.map.MapConstants")
local TowerSelectPanel  = require("app.map.battleui.TowerSelectPanel")
local TowerControlPanel = require("app.map.battleui.TowerControlPanel")
local EffectAniCache    = require("app.map.spine.EffectAniCache")
local CsbAni            = require("app.map.spine.CsbAni")
local SpineAni          = require("app.map.spine.SpineAni")
local GuideAnimate      = require("ui.GuideAnimite")

-- 游戏中显示的新手引导、以及Tips页面
local GameTips = class("GameTips", function()
    return display.newNode()
end)

-- notNeedLock == ture 时，表示确认按钮不需要锁定两秒
function GameTips:ctor(isGuide, tipsType, battleui, notNeedLock)

    -- print("GameTips:ctor 显示游戏中的Tips isGuide = "..tostring(isGuide)
    --     .." tipsType = "..tostring(tipsType))

    -- 记录是否是新手引导的tips，用来做第一关新手引导结束以后需要显示tips按钮
    self.isGuide  = isGuide

    -- 记录显示的tips的类型
    self.tipsType = tipsType

    -- 记录点击完ok按钮以后，需要执行的一个回调函数
    self.battleui = battleui

    -- 记录这个提示页面的确认按钮，是不需要延迟2s以后再置为可点击的
    self.notNeedLock = notNeedLock

    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setContentSize(cc.size(display.width, display.height))
    self:setTouchEnabled(true)

    self:setPosition(display.cx, display.cy)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    self.orignalScale = self:getScale()

    self.gameMode = GlobalData.getGameMode()
    print("GameTips:ctor self.gameMode = "..tostring(self.gameMode))

    -- 第3关的话直接显示这个引导页面
    if GlobalData.getGameLv() == 3 and self.gameMode ~= 3 then
        if isGuide then
            -- -- 显示祭坛招兵动画
            -- local function finc( ... )
            --     -- print("GameTips 2 self:removeFromParent()")
            --     self:removeFromParent()
            -- end
            -- local ani = GuideAnimate.setAnimate(2, nil, finc)
            -- self:addChild(ani)
        elseif tipsType == MapConstants.TipsType_JiTanPlunder then
            -- 显示祭坛掠夺动画
            local function finc( ... )
                battleui.rt:resumePlay()
                -- print("GameTips 1 self:removeFromParent()")
                self:removeFromParent()
            end
            battleui.rt:pausePlay()
            local ani = GuideAnimate.setAnimate(1, nil, finc)
            self:addChild(ani)
            -- ani:setPosition(display.cx/2, display.cy/2)
        end

        return

    elseif GlobalData.getGameLv() == 4 and self.gameMode ~= 3 then
        if tipsType == MapConstants.TipsType_JiTanSummon then
            -- 显示祭坛招兵动画
            local function finc( ... )
                -- print("GameTips 2 self:removeFromParent()")
                battleui.rt:resumePlay()
                self:removeFromParent()
            end
            battleui.rt:pausePlay()
            local ani = GuideAnimate.setAnimate(2, nil, finc)
            self:addChild(ani)

            return
        end

    end

    -- 背景的黑色遮罩
    local maskBg = display.newSprite("ui/common/mask_img.png")
    self:addChild(maskBg)
    maskBg:setScale(GLOBAL_BIG_UI_SCALE * 1000)
    -- maskBg:setPosition(display.cx, display.cy)

    -- tips的内容图片
    local tipsBg = display.newSprite("ui/fight/gameGuide/tipsBg.png")
        :addTo(self)
    self.tipsBg = tipsBg
        -- :pos(display.cx, display.cy)

    -- 背景图片的宽度
    local size     = tipsBg:getContentSize()
    local bgWidth  = size.width
    local bgHeight = size.height
    self.bgWidth   = bgWidth
    self.bgHeight  = bgHeight

    -- tips页面的title bg图片
    local tipsTitleBg = display.newSprite("ui/fight/gameGuide/titleFrame.png")
        :addTo(tipsBg)
        :pos(bgWidth/2, bgHeight + 5)

    -- tips页面的title图片
    local tipsTitle = display.newSprite("ui/common/mask_img.png")
        :addTo(tipsBg)
        :pos(bgWidth/2, bgHeight + 5)

    -- tips的内容图片
    local tipsImg = display.newSprite("ui/common/mask_img.png")
        :addTo(tipsBg)
        :pos(bgWidth/2, bgHeight/2)
    self.tipsImg = tipsImg

    -- 是否是显示继续按钮
    self.isContinueBtn = false

    -- 继续按钮
    local continueBtnImgName = "ui/fight/gameGuide/btnGoOn"
    continueBtnImgName = utils.getName(continueBtnImgName)
    -- 继续按钮按下去的效果
    local continueBtnImgName2 = "ui/fight/gameGuide/btnGoOn2"
    continueBtnImgName2 = utils.getName(continueBtnImgName2)

    self.continueBtn = cc.ui.UIPushButton.new({normal = continueBtnImgName..".png",
        pressed = continueBtnImgName2..".png"})
    :onButtonClicked(function(params)
        self:onContinueBtnClicked(params)
    end)
    :pos(bgWidth/2, -25)
    :addTo(tipsBg, -1)
    :setVisible(false)

    self.continueBtn:setTouchEnabled(false)

    -- 新建一张灰色的图片盖在这个按钮的上面
    self.continueImg = display.newSprite(continueBtnImgName..".png")
        :pos(bgWidth/2, -25)
        :addTo(tipsBg, -1)
        :setVisible(false)
    EnableGraySprite(self.continueImg)



    -- 确认按钮
    local okBtnImgName = "ui/fight/gameGuide/btnOk"
    okBtnImgName = utils.getName(okBtnImgName)
    local okBtnImgName2 = "ui/fight/gameGuide/btnOk2"
    okBtnImgName2 = utils.getName(okBtnImgName2)
    self.okBtn = cc.ui.UIPushButton.new({normal = okBtnImgName..".png",
        pressed = okBtnImgName2..".png"})
    :onButtonClicked(function(params)
        self:onOkBtnClicked()
    end)
    :pos(bgWidth/2, -25)
    :addTo(tipsBg, -1)
    :setVisible(false)

    -- 新建一张灰色的图片盖在这个确认按钮的上面
    self.okImg = display.newSprite(okBtnImgName..".png")
        :pos(bgWidth/2, -25)
        :addTo(tipsBg, -1)
        :setVisible(false)
    EnableGraySprite(self.okImg)


    -- 如果是显示新手引导的Tips
    if isGuide then
        -- 如果是点击tips按钮弹出的第三模式的玩法，那么需要暂停游戏
        if notNeedLock then
            battleui.rt:pausePlay()
        end
        
        -- 根据当前是第几关来显示对应的引导，这里只显示第一步的引导Tips
        -- 如果是多步的引导，则在继续按钮中做相应的处理
        self.gameLv = GlobalData.getGameLv()

        -- 显示的引导内容图片的名字
        local contentImgName
        if self.gameMode ~= 3 then
            contentImgName = "ui/fight/gameGuide/"..tostring(self.gameLv).."_01"
            contentImgName = utils.getName(contentImgName)
        else
            contentImgName = "ui/fight/gameGuide/threeMode/g"..tostring(self.gameLv)
            contentImgName = utils.getName(contentImgName)
        end
        tipsImg:setTexture(contentImgName..".png")

        -- 判定一下是不是要显示继续按钮
        if (self.gameLv == 1 or self.gameLv == 2) and self.gameMode ~= 3 then
            self.isContinueBtn = true
            print("self.isContinueBtn = "..tostring(self.isContinueBtn))
            self.continueBtn:setVisible(false)
            self.continueImg:setVisible(true)
        end

        local titleImgName = "ui/fight/gameGuide/explanTitle"
        titleImgName = utils.getName(titleImgName)
        tipsTitle:setTexture(titleImgName..".png")

        -- 根据关卡来播放对应的新手引导动画
        if self.gameMode ~= 3 then
            self:showGuideAni(self.gameLv)
        else
            -- 模式3的新手引导的话直接显示按钮
            self:showBtnAfterGuideAni()
        end
    else
        battleui.rt:pausePlay()

        local titleImgName = "ui/fight/gameGuide/tipsTitle"
        titleImgName = utils.getName(titleImgName)
        tipsTitle:setTexture(titleImgName..".png")

        -- 根据tips的类型，来更新显示tips中的内容
        self:changeTipsImg(tipsType)

        -- 英雄移动和，需要实现动画
        -- if tipsType == MapConstants.TipsType_HeroMove then
        --     -- 根据tips类型来播放对应的tips动画
        --     self:showTipsAni(tipsType)
        -- else
            -- 没有动画的话直接就显示按钮
            self:showBtnAfterGuideAni()
        -- end
    end



    self:setScale(0.3)
    local action = cc.ScaleTo:create(0.35, self.orignalScale)
    self:runAction(action)

end

-- 根据关卡来播放对应的新手引导动画, 传入的是当前是第几关
function GameTips:showGuideAni(gameLv)
    if gameLv == 1 then
        local aniBg = display.newSprite("ui/fight/gameGuide/1_01.jpg")
            :addTo(self.tipsBg)
            :pos(self.bgWidth/2, self.bgHeight/2 - 10)
        self.aniBg = aniBg

        self.delayTime = 0.5

        local act1 = cc.DelayTime:create(self.delayTime)
        local function finc()
            -- 播放手指特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
            aniBg:addChild(effect)
            effect:setPosition(340, 150)

            -- 第一个手指动画结束以后，需要显示出选择造塔的页面
            local function finc1( ... )
                -- print("创建造塔的页面")
                local towerSelectPanel = TowerSelectPanel.new()
                -- add by Owen, 2016.6.3, self已经缩放过了，这个就不需要缩放了
                towerSelectPanel:setScale(1.0)

                aniBg:addChild(towerSelectPanel)
                towerSelectPanel:setVisible(true)
                towerSelectPanel:setPosition(self.bgWidth/2 - 60, self.bgHeight/2 - 85)
                -- add by Owen, 2016.5.31, 把造塔页面的所有按钮置为不可点击
                for i, v in ipairs(towerSelectPanel.towerBtns) do
                    v:setTouchEnabled(false)
                end

                -- self.delayTime = self.delayTime + 0.5
                -- 造塔选择页面出来以后的回调函数
                local function afterShowSelect( ... )
                    -- 点击完造塔按钮以后，要把塔造出来
                    local function finc2( ... )
                        -- print("点击完造塔按钮以后，要把塔造出来")
                        towerSelectPanel:removeFromParent()
                        local towerAni = CsbAni.new("160101", "tower/160101.csb", true, true, true)
                        aniBg:addChild(towerAni)
                        towerAni:setPosition(self.bgWidth/2 - 60, self.bgHeight/2 - 100)

                        -- 动画播完了以后，显示按钮
                        self:showBtnAfterGuideAni()
                    end
                    -- 播放手指特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
                    aniBg:addChild(effect)
                    effect:setPosition(340, 240)

                    local act1 = cc.DelayTime:create(0.7)
                    local act2 = cc.CallFunc:create(finc2)
                    local seq  = cc.Sequence:create(act1, act2)
                    effect:runAction(seq)
                end

                -- 造塔页面出现一段时间以后，才能播放手指点击的动画
                local act1 = cc.DelayTime:create(self.delayTime)
                local act2 = cc.CallFunc:create(afterShowSelect)
                local seq  = cc.Sequence:create(act1, act2)
                towerSelectPanel:runAction(seq)
            end

            -- 点击塔基的手指点击动画结束以后，才能显示造塔页面
            local act1 = cc.DelayTime:create(0.7)
            local act2 = cc.CallFunc:create(finc1)
            local seq  = cc.Sequence:create(act1, act2)
            effect:runAction(seq)

        end
        -- 移除生成的资源
        local function removeFinc( ... )
            aniBg:removeAllChildren()
        end
        local act2 = cc.CallFunc:create(finc)
        local act3 = cc.DelayTime:create(3.7)
        local act4 = cc.CallFunc:create(removeFinc)
        local act5 = cc.DelayTime:create(0.2)
        local seq  = cc.Sequence:create(act1, act2, act3, act4, act5)
        local allAction  = cc.RepeatForever:create(seq)
        aniBg:runAction(allAction)


    elseif gameLv == 2 then
        local aniBg = display.newSprite("ui/fight/gameGuide/2_01.jpg")
            :addTo(self.tipsBg)
            :pos(self.bgWidth/2, self.bgHeight/2 - 10)
        self.aniBg = aniBg

        self.towerAni = CsbAni.new("160101", "tower/160101.csb", true, true, true)
        aniBg:addChild(self.towerAni)
        self.towerAni:setPosition(self.bgWidth/2 - 50, self.bgHeight/2 - 120)

        self.delayTime = 0.5

        local act1 = cc.DelayTime:create(self.delayTime)
        local function finc()

            -- 第一个手指动画结束以后，需要显示出选择造塔的页面
            local function finc1( ... )
                -- print("创建升级塔的页面")
                local towerControlPanel = self:createTowerControlPanel()

                -- local towerControlPanel = TowerControlPanel.new()
                aniBg:addChild(towerControlPanel)
                -- towerControlPanel:setVisible(true)
                towerControlPanel:setPosition(self.bgWidth/2 - 60, self.bgHeight/2 - 85)

                -- self.delayTime = self.delayTime + 0.5
                -- 造塔选择页面出来以后的回调函数
                local function afterClickTower( ... )

                    -- 点击完造塔按钮以后，要把塔造出来
                    local function finc2( ... )
                        -- print("点击完造塔按钮以后，要把塔造出来")
                        towerControlPanel:removeFromParent()
                        self.towerAni:removeFromParent()
                        local towerAni2 = CsbAni.new("160102", "tower/160102.csb", true, true, true)
                        aniBg:addChild(towerAni2)
                        towerAni2:setPosition(self.bgWidth/2 - 50, self.bgHeight/2 - 120)

                        -- 动画播完了以后，显示按钮
                        self:showBtnAfterGuideAni()
                    end
                    -- 播放手指特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
                    aniBg:addChild(effect)
                    effect:setPosition(265, 150)

                    local act1 = cc.DelayTime:create(0.7)
                    local act2 = cc.CallFunc:create(finc2)
                    local seq  = cc.Sequence:create(act1, act2)
                    effect:runAction(seq)
                end

                local act1 = cc.DelayTime:create(self.delayTime)
                local act2 = cc.CallFunc:create(afterClickTower)
                local seq  = cc.Sequence:create(act1, act2)
                towerControlPanel:runAction(seq)
            end

            -- 播放手指特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
            aniBg:addChild(effect)
            effect:setPosition(350, 150)
            -- 点击塔的手指点击动画结束以后，才能显示塔升级页面
            local act1 = cc.DelayTime:create(0.7)
            local act2 = cc.CallFunc:create(finc1)
            local seq  = cc.Sequence:create(act1, act2)
            effect:runAction(seq)
        end

        -- local act2 = cc.CallFunc:create(finc)
        -- local seq  = cc.Sequence:create(act1, act2)
        -- aniBg:runAction(seq)

        -- 移除生成的资源
        local function removeFinc( ... )
            aniBg:removeAllChildren()
            self.towerAni = CsbAni.new("160101", "tower/160101.csb", true, true, true)
            aniBg:addChild(self.towerAni)
            self.towerAni:setPosition(self.bgWidth/2 - 50, self.bgHeight/2 - 120)
        end
        local act2 = cc.CallFunc:create(finc)
        local act3 = cc.DelayTime:create(3.7)
        local act4 = cc.CallFunc:create(removeFinc)
        local act5 = cc.DelayTime:create(0.2)
        local seq  = cc.Sequence:create(act1, act2, act3, act4, act5)
        local allAction  = cc.RepeatForever:create(seq)
        aniBg:runAction(allAction)
    else
        -- 其他光卡的新手引导的话直接显示按钮
        self:showBtnAfterGuideAni()
    end

end

-- 根据tips类型来播放对应的tips动画
function GameTips:showTipsAni(tipsType)
    if tipsType == MapConstants.TipsType_HeroMove then
        local aniBg = display.newSprite("ui/fight/gameGuide/heroMoveTip.jpg")
            :addTo(self.tipsBg)
            :pos(self.bgWidth/2, self.bgHeight/2 - 10)
        self.aniBg = aniBg

        self.heroAni = SpineAni.new("110202", "hero/110202")
        aniBg:addChild(self.heroAni)
        self.heroAni:setPosition(self.bgWidth/2 - 30, self.bgHeight/2 - 80)

        self.heroControlBtn = self:createHeroControlBtn(aniBg)

        self.delayTime = 0.5

        local act1 = cc.DelayTime:create(self.delayTime)
        local function finc()

            -- 第一个手指动画结束以后，需要显示出选择造塔的页面
            local function finc1( ... )
                -- print("创建升级塔的页面")
                self.heroSelectImg1:setVisible(true)
                self.heroSelectImg1_2:setVisible(true)

                -- self.delayTime = self.delayTime + 0.5
                -- 造塔选择页面出来以后的回调函数
                local function afterClickTower( ... )

                    -- 点击完造塔按钮以后，要把塔造出来
                    local function finc2( ... )
                        -- print("点击完造塔按钮以后，要把塔造出来")
                        self.heroAni:runAction(cc.MoveTo:create(1.0, 
                            cc.p(self.bgWidth/2 - 30, self.bgHeight/2 - 80)))

                        -- 动画播完了以后，显示按钮
                        self:showBtnAfterGuideAni()
                    end
                    -- 播放手指特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
                    aniBg:addChild(effect)
                    effect:setPosition(265, 150)

                    local act1 = cc.DelayTime:create(0.7)
                    local act2 = cc.CallFunc:create(finc2)
                    local seq  = cc.Sequence:create(act1, act2)
                    effect:runAction(seq)
                end

                local act1 = cc.DelayTime:create(self.delayTime)
                local act2 = cc.CallFunc:create(afterClickTower)
                local seq  = cc.Sequence:create(act1, act2)
                self.heroSelectImg1:runAction(seq)
            end

            -- 播放手指特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Finger", false, nil)
            aniBg:addChild(effect)
            effect:setPosition(50, 150)
            -- 点击塔的手指点击动画结束以后，才能显示塔升级页面
            local act1 = cc.DelayTime:create(0.7)
            local act2 = cc.CallFunc:create(finc1)
            local seq  = cc.Sequence:create(act1, act2)
            effect:runAction(seq)
        end

        -- local act2 = cc.CallFunc:create(finc)
        -- local seq  = cc.Sequence:create(act1, act2)
        -- aniBg:runAction(seq)

        -- 移除生成的资源
        local function removeFinc( ... )
            aniBg:removeAllChildren()

            self.heroAni = SpineAni.new("110202", "hero/110202")
            aniBg:addChild(self.heroAni)
            self.heroAni:setPosition(self.bgWidth/2 - 30, self.bgHeight/2 - 80)

            self:createHeroControlBtn(aniBg)
        end
        local act2 = cc.CallFunc:create(finc)
        local act3 = cc.DelayTime:create(3.7)
        local act4 = cc.CallFunc:create(removeFinc)
        local act5 = cc.DelayTime:create(0.2)
        local seq  = cc.Sequence:create(act1, act2, act3, act4, act5)
        local allAction  = cc.RepeatForever:create(seq)
        aniBg:runAction(allAction)

    end
end

-- 创建英雄头像控制按钮
function GameTips:createHeroControlBtn(aniBg)
    -- 3个英雄按钮，1/2/3分别表示左下、右下、上
    local posX      = 50
    local posY      = 150
    local diffY     = 140   -- 两个英雄按钮之间的间隔
    local btnRadius = 50    -- 英雄按钮的半径
    local expDiffX  = 28    -- 经验条外框图片的偏移
    local expDiffY  = -5    -- 经验条外框图片的偏移
    local expDiffX2 = 27    -- 经验条图片的偏移
    local expDiffY2 = -1    -- 经验条图片的偏移

    local heroIconDiffX = -1   -- 英雄头像X轴偏移
    local heroIconDiffY = 2    -- 英雄头像Y轴偏移
    local heroIconScale = 0.95 -- 英雄头像缩放比例

    local lvIconDiffX = 0   -- 小旗帜X轴偏移
    local lvIconDiffY = -48    -- 小旗帜Y轴偏移

    -- 经验条
    self.expOutline1 = display.newSprite("ui/fight/heroControl/heroExpOut.png")
        :pos(posX + expDiffX, posY + expDiffY)
        :addTo(aniBg)
    self.expSprite1 = display.newProgressTimer("ui/fight/heroControl/heroExp.png",
        display.PROGRESS_TIMER_BAR)
        :pos(posX + expDiffX2, posY + expDiffY2)
        :addTo(aniBg)
    -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
    self.expSprite1:setBarChangeRate(cc.p(0, 1))
    -- 设置进度条的起始位置, ccp(0,0)表示下面
    self.expSprite1:setMidpoint(cc.p(0, 0))

    self.heroBtn1 = cc.ui.UIPushButton.new("ui/fight/heroControl/heroBtnBg.png")
        :onButtonClicked(function(...)
            self.heroSelectImg1:setVisible(true)
            self.heroSelectImg1_2:setVisible(true)
        end)
        :pos(posX, posY)
        :addTo(aniBg)
    self.heroBtn1:setScale(0.8)

    -- 血条
    self.hpOutline1 = display.newSprite("ui/fight/heroHpOut.png")
    self.hpSprite1  = display.newSprite("ui/fight/heroHp.png")
    self.hpOutline1:setScale(0.8)
    self.heroBtn1:setScale(0.8)
    -- local posX = - self.hpSprite1:getContentSize().width/2
    self.hpSprite1:align(display.LEFT_CENTER, 0, 0)
    self.hpOutline1:setPosition(0, -25)
    self.hpSprite1:setPosition(-30, -25)
    self.heroBtn1:addChild(self.hpOutline1)
    self.heroBtn1:addChild(self.hpSprite1)
    self.hpOutline1:setVisible(false)
    self.hpSprite1:setVisible(false)
        
    -- 选中图片
    self.heroSelectImg1 = display.newSprite("ui/fight/heroControl/heroSelect.png")
    self.heroSelectImg1:setVisible(false)
    self.heroBtn1:addChild(self.heroSelectImg1, -1)

    -- 选中的转圈效果
    -- 英雄选中的旋转表示
    local act1 = cc.RotateBy:create(1, 360)
    local seq  = cc.Sequence:create(act1)
    local rotateAction = cc.RepeatForever:create(seq)
    self.heroSelectImg1_2 = display.newSprite("ui/fight/heroControl/heroSelect2.png")
    self.heroSelectImg1_2:setVisible(false)
    self.heroBtn1:addChild(self.heroSelectImg1_2, -1)
    self.heroSelectImg1_2:runAction(rotateAction)

    -- 英雄头像
    self.heroImg1 = display.newSprite("ui/Icons/heroIcon/110202.png")
        :pos(heroIconDiffX, heroIconDiffY)
        :addTo(self.heroBtn1)
        :setScale(0.7)
    -- 小旗帜，用来放等级文字的图片
    self.lvImg1 = display.newSprite("ui/fight/heroControl/110202_LvImg.png")
        :pos(lvIconDiffX, lvIconDiffY)
        :addTo(self.heroBtn1)
    -- 等级文字
    self.lvlabel1 = cc.ui.UILabel.new({
            UILabelType = 2,
            font = GLOBAL_FONTNAME,
            text = "1",
            size = 24,
            color = cc.c3b(255, 255, 0)
        })
    self.lvlabel1:setPosition(16, 22)
    self.lvImg1:addChild(self.lvlabel1)
    self.lvlabel1:enableOutline(cc.c4b(0, 0,0,255), 1)
end

function GameTips:showBtnAfterGuideAni()
    -- 如果显示的是继续按钮, 只有新手引导页面有继续按钮
    if self.isContinueBtn then
        -- 第一关和第二关的话要跑一个缩放的动画
        if (self.gameLv == 1 or self.gameLv == 2)
            and not self.continueBtn:isVisible() then
    
            -- 播放逐步放大的效果
            -- bg:setScale(0.8)
            -- local act1 = cc.DelayTime:create(delayTime)
            -- local act2 = cc.ScaleTo:create(0.2, 1.0)
            -- delayTime = delayTime + 0.2
            -- local seq  = cc.Sequence:create(act1, act2)
            -- local scaleAction = cc.RepeatForever:create(seq)
            -- bg:runAction(scaleAction)

            -- 播放逐步放大的效果
            -- self.continueBtn:setScale(0.01)
            -- local act1 = cc.DelayTime:create(1.8)
            -- local act2 = cc.ScaleTo:create(0.3, 1.0)
            -- local seq  = cc.Sequence:create(act1, act2)
            -- self.continueBtn:runAction(seq)
        end
        self.continueBtn:setVisible(true)
        self.continueBtn:setTouchEnabled(true)
        self.continueImg:setVisible(false)
        self.okBtn:setVisible(false)
    else
        self.continueBtn:setVisible(false)

        -- 需要锁定的话，起一个定时器，两秒以后在把这个按钮置为可见
        if not self.notNeedLock then
            self.okImg:setVisible(true)

            local act1 = cc.DelayTime:create(2.0)
            local function finc( ... )
                self.okImg:setVisible(false)
                self.okBtn:setVisible(true)
            end
            local act2 = cc.CallFunc:create(finc)
            local seq = cc.Sequence:create(act1, act2)
            self.okBtn:runAction(seq)
        else
            -- 不需要锁定的时候，直接显示这个按钮
            self.okBtn:setVisible(true)
        end

    end
end

-- 创建升级塔的UI控制页面
function GameTips:createTowerControlPanel( ... )
    local towerContralPanel = display.newNode()
    -- 一个圆圈
    local towerCircle =  display.newSprite("ui/fight/tower/towerCircle.png")
    towerContralPanel:addChild(towerCircle)
    towerCircle:setPosition(10, 0)

    --创建升级按钮
    self.upLevelBtn1 = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png") -- levelup_Btn.png")
        :pos(-70,0)
        :addTo(towerContralPanel,1)
    self.upImg1 = display.newSprite("ui/fight/tower/levelup_Btn.png")
    self.upLevelBtn1:addChild(self.upImg1)

    -- 显示造塔消耗金币数量的框
    self.towerMoneyImg1 = display.newSprite("ui/fight/tower/towerMoney.png")
    self.upLevelBtn1:addChild(self.towerMoneyImg1)
    self.towerMoneyImg1:setPositionY(-30)

    --创建升级金钱标签
    self.goldCostLabel1 = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "180",
        font = GLOBAL_FONTNAME,
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 20,
        x = -15,
        y = -30,
        })
        :addTo(self.upLevelBtn1)

    -- 创建移除按钮
    self.removeBtn = cc.ui.UIPushButton.new("ui/fight/tower/towerBtnBg.png")
    :pos(100,0)
    :addTo(towerContralPanel, 1)
    self.removeImg = display.newSprite("ui/fight/tower/sell_Btn.png")
    self.removeBtn:addChild(self.removeImg)

    -- windows平台上面，塔按钮UI要缩放0.85
    if (device.platform == "mac" or device.platform == "windows") then
        self.upLevelBtn1:setScale(0.85)
        self.removeBtn:setScale(0.85)
    end

    return towerContralPanel
end

function GameTips:showFinger(delayTime)
    -- body
end


-- MapConstants.TipsType_RoundStart   = 1       -- 手动出怪Tips
-- MapConstants.TipsType_HeroMove     = 2       -- 英雄移动Tips
-- MapConstants.TipsType_JiTanPlunder = 3       -- 祭坛掠夺Tips
-- MapConstants.TipsType_NewEnemy     = 4       -- 出现新怪Tips
-- 根据tips的类型，来更新显示tips中的内容
function GameTips:changeTipsImg(tipsType)
    -- tips内容图片的名字
    local tipsImgName

    if tipsType == MapConstants.TipsType_RoundStart then
        -- 提示通过点击按钮来手动出怪
        tipsImgName = "ui/fight/gameGuide/nextRoundTip"
    elseif tipsType == MapConstants.TipsType_HeroMove then
        -- 提示英雄移动操作按钮
        tipsImgName = "ui/fight/gameGuide/heroMoveTip"
    elseif tipsType == MapConstants.TipsType_JiTanPlunder then
        -- 提示英雄移动操作按钮
        tipsImgName = "ui/fight/gameGuide/plunderTip"
    elseif tipsType == MapConstants.TipsType_NewEnemy then
        tipsImgName = "ui/fight/gameGuide/1_01"
    end

    tipsImgName = utils.getName(tipsImgName)
    tipsImgName = tipsImgName..tostring(".png")

    self.tipsImg:setTexture(tipsImgName)
end

-- 点击继续按钮以后的操作
function GameTips:onContinueBtnClicked(params)
    if self.aniBg then
        self.aniBg:removeFromParent()
    end
    local continueBtnImgName = "ui/fight/gameGuide/"..tostring(self.gameLv).."_02"
    continueBtnImgName = utils.getName(continueBtnImgName)
    self.tipsImg:setTexture(continueBtnImgName..".png")
    self.continueBtn:setVisible(false)


    -- 需要锁定的话，起一个定时器，两秒以后在把这个按钮置为可见
    if not self.notNeedLock then
        self.okImg:setVisible(true)

        local act1 = cc.DelayTime:create(2)
        local function finc( ... )
            self.okImg:setVisible(false)
            self.okBtn:setVisible(true)
        end
        local act2 = cc.CallFunc:create(finc)
        local seq = cc.Sequence:create(act1, act2)
        self.okBtn:runAction(seq)
    else
        -- 不需要锁定的时候，直接显示这个按钮
        self.okBtn:setVisible(true)
    end
    -- self.okBtn:setVisible(true)
end

-- 点击了Ok btn
function GameTips:onOkBtnClicked(params)
    -- print("GameTips:onOkBtnClicked self.gameLv = "..tostring(self.gameLv))
    -- 第一关的新手引导结束以后，需要显示两个tips按钮
    if self.gameLv == 1 and self.gameMode ~= 3 then
        self.battleui:showTipsAfterGuide()
    end

    -- self.battleui.rt:resumePlay()
    -- self:removeFromParent()

    -- 如果是第三模式的引导，那么点完ok按钮以后要缩放到左上角去
    -- 在外面是这样调用的 guideTips = GameTips.new(true, nil, self.battleUI)
    if self.isGuide and self.gameMode == 3 then
        self.battleui.rt:resumePlay()

        -- 弹出界面缩回去的特效特效
        -- 按钮node的位置 (300*GLOBAL_FIGHT_UI_SCALE, display.height - 60*GLOBAL_FIGHT_UI_SCALE)
        local scaleAct = cc.ScaleTo:create(0.28, 0.2)
        local moveAct  = cc.MoveTo:create(0.28, 
            cc.p((300 + 30)*GLOBAL_FIGHT_UI_SCALE, display.height - (60 + 80)*GLOBAL_FIGHT_UI_SCALE))
        local function finc( ... )
            self:removeFromParent()
        end
        local action_1 = cc.Spawn:create(scaleAct, moveAct)
        local act3 = cc.CallFunc:create(finc)
        local seq  = cc.Sequence:create(action_1, act3)

        self:runAction(seq)

        
    else
        self.battleui.rt:resumePlay()
        self:removeFromParent()
    end

end

return GameTips