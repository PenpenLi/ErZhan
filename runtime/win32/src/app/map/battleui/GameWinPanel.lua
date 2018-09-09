

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local SpineCache        = require("app.map.spine.SpineCache")

-- 点击关卡以后，显示的难度选择界面
local GameWinPanel = class("GameWinPanel", function()
    return display.newNode()
end)

function GameWinPanel:ctor(hp, star, rt, mapLayer, isLose)

    -- print("一关结束后，结算是lua占用的内存： "..collectgarbage("count")
    --     .." star = "..tostring(star))

    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setContentSize(cc.size(display.width, display.height))
    self:setTouchEnabled(true)

    -- 背景的黑色遮罩
    local maskBg = display.newSprite("ui/common/mask_img.png")
    self:addChild(maskBg)
    maskBg:setScale(GLOBAL_BIG_UI_SCALE * 1000)
    maskBg:setPosition(display.cx, display.cy)

    -- 记录动画的延时播放
    local delayTime = 0

    -- 闪光的图片
    local guangImg = display.newSprite("ui/fight/wingame/guang.png")
    self:addChild(guangImg)
    guangImg:setPosition(display.cx, display.cy + 200)
    -- 播放逐步放大的效果
    -- guangImg:setScale(0.6)
    -- delayTime = delayTime + 0.2
    -- local act1 = cc.DelayTime:create(delayTime)
    -- local act2 = cc.ScaleTo:create(0.2, 1.0)
    -- delayTime = delayTime + 0.2
    -- local seq  = cc.Sequence:create(act1, act2)
    -- local scaleAction = cc.RepeatForever:create(seq)
    -- guangImg:runAction(scaleAction)

    -- 背景图片
    local bg = display.newSprite("ui/fight/wingame/bg.png")
    self:addChild(bg)
    bg:setPosition(display.cx, display.cy)
    -- 播放逐步放大的效果
    bg:setScale(0.8)
    local act1 = cc.DelayTime:create(delayTime)
    -- local act2 = cc.ScaleTo:create(0.2, 1.0 * GLOBAL_FIGHT_UI_SCALE)
    -- 这个页面需要缩放
    local act2
    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        act2 = cc.ScaleTo:create(0.2, 1.0 * GLOBAL_FIGHT_UI_SCALE)
        guangImg:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        act2 = cc.ScaleTo:create(0.2, 1.0 * GLOBAL_HALL_UI_SCALE2)
        guangImg:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    delayTime = delayTime + 0.2
    local seq  = cc.Sequence:create(act1, act2)
    local scaleAction = cc.RepeatForever:create(seq)
    bg:runAction(scaleAction)

    

    local bgWidth  = bg:getContentSize().width
    local bgHeight = bg:getContentSize().height

    -- -- 左边的彩条
    -- local leftColorImg = display.newSprite("ui/fight/wingame/right_img.png")
    -- leftColorImg:setScaleX(-1)
    -- leftColorImg:setPosition(0, bgHeight/2 + 70)
    -- bg:addChild(leftColorImg)

    -- -- 右边的彩条
    -- local rightColorImg = display.newSprite("ui/fight/wingame/right_img.png")
    -- -- rightColorImg:setRotation(180)
    -- rightColorImg:setPosition(bgWidth, bgHeight/2 + 70)
    -- bg:addChild(rightColorImg)


    -- 上面红色背景图
    local upBg = display.newSprite("ui/fight/wingame/upBgWin.png")
    bg:addChild(upBg)
    local upBgWidth  = upBg:getContentSize().width
    local upBgHeight = upBg:getContentSize().height

    upBg:setPosition(bgWidth/2, bgHeight + 45)

    -- 胜利和失败的文字
    local winImg = display.newSprite("ui/fight/wingame/win_CN.png")
        :addTo(upBg)
        :pos(635/2, 261/2)


    if isLose then
        guangImg:setVisible(false)
        upBg:setTexture("ui/fight/wingame/upBgLose.png")
        winImg:setTexture("ui/fight/wingame/lose_CN.png")
        winImg:setPosition(507/2, 243/2)
        
        -- 播放失败音效
        AudioMgr.playSound("Defeat")
    else
        -- 播放成功音效
        AudioMgr.playSound("Victory")

        -- 记录这一关不同模式的星数
        local gameLv   = GlobalData.gameLv      -- 第几关 
        local gameMode = GlobalData.gameMode    -- 什么模式
        local hardMode = GlobalData.hardMode    -- 什么难度
        local lvStar = GlobalData.getLvStar(gameLv)
        -- 如果模式1没有通过，现在通过模式1了，那么要记录一下
        -- 需要播放模式开放动画，和关卡开放动画
        -- 心痛过了模式2也要记录一下
        if gameMode == 1 and lvStar[1][1] + lvStar[1][2] <= 0 then
            -- 新通关了模式1
            GlobalData.setNewThroughMode(gameLv, gameMode)
            GlobalData.setNewThroughLv(gameLv)
        elseif gameMode == 2 and lvStar[2] <= 0 then
            -- 新通关了模式2
            GlobalData.setNewThroughMode(gameLv, gameMode)
        end


        -- 胜利的时候要记录星星的数量
        GlobalData.addTotalStar(star)

        -- 判定是否激活了某个成就
        -- achieveType, 成就类型，1表示关卡，2表示建造，3表示杀戮，4表示英雄
        BattleDataManager:calcAchievements(1, star)
    end

    -- 显示星星
    if not star then
        -- 失败的话星星数是0
        -- add by Owen, 2016.4.23, 过关失败的时候的时候，需要播放音效
        -- AudioMgr.playSound("Defeat")
        
        star = 0
    end

    -- 记录所有亮的星星来做动画
    local starImgs = {}
    for i = 1, 3 do
        -- add by Owen, 2016.4.23, 成功过关的时候的时候，需要播放音效
        -- AudioMgr.playSound("Victory")

        local starImgGray

        -- 新建3个灰色的按钮
        if i == 1 then
            starImgGray = display.newSprite("ui/fight/wingame/starRightGray.png")
            starImg = display.newSprite("ui/fight/wingame/starLeft.png")
            starImgGray:setScaleX(-1)
        elseif i == 2 then
            starImgGray = display.newSprite("ui/fight/wingame/starGray.png")
            starImg = display.newSprite("ui/fight/wingame/star.png")
        elseif i == 3 then
            starImgGray = display.newSprite("ui/fight/wingame/starRightGray.png")
            starImg = display.newSprite("ui/fight/wingame/starRight.png")
        end

        starImgs[i] = starImg

        local posX = (i - 2)*140 + bgWidth/2
        local posY
        if i == 1 then
            posY = bgHeight/2 + 10
            -- starImgGray:setRotation(-30)
            -- starImgGray:setScale(0.85)
        elseif i == 2 then
            posY = bgHeight/2 - 10
        elseif i == 3 then
            posY = bgHeight/2 + 10
            -- starImgGray:setRotation(30)
            -- starImgGray:setScale(0.85)
        end
        starImgGray:setPosition(posX, posY)
        bg:addChild(starImgGray)

        starImg:setPosition(posX, posY)
        bg:addChild(starImg)
        starImg:setVisible(false)

    end

    for i = 1, 3 do
        local posX = (i - 2)*140 + bgWidth/2
        local posY
        if i == 1 then
            posY = bgHeight/2 + 10
            -- starImgGray:setRotation(-30)
            -- starImgGray:setScale(0.85)
        elseif i == 2 then
            posY = bgHeight/2 - 10
        elseif i == 3 then
            posY = bgHeight/2 + 10
            -- starImgGray:setRotation(30)
            -- starImgGray:setScale(0.85)
        end

        -- 做获得了几颗星星的闪亮效果
        if i <= star then
            -- print("第"..tostring(i).."颗星星的出现效果")
            local starImg = starImgs[i]

            local act1 = cc.DelayTime:create(delayTime)
            local function finc()
                starImg:setScale(0.2)
                starImg:setVisible(true)
            end
            local act2 = cc.CallFunc:create(finc)
            local act3 = cc.ScaleTo:create(0.2, 1.0)
            delayTime = delayTime + 0.45
            local seq  = cc.Sequence:create(act1, act2, act3)
            starImg:runAction(seq)
        end
    end

    -- add by Owen, 2016.6.21, 是不是要显示下一关按钮
    -- 模式1的前14关通关以后才需要显示下一关按钮
    local needNextBtn = false
    -- 按钮的缩放比例，如果要显示3个按钮的时候，按钮要缩放0.8
    local btnScale    = 1.0
    -- 左右两个按钮需要 移动的偏移
    local needDiffX   = 0
    if not isLose then
        if GlobalData.getGameMode() == 1 then
            -- change by Owen, 2016.7.14, 第一关也不显示"下一关"按钮
            if GlobalData.getGameLv() < 15 and GlobalData.getGameLv() > 6 then
                needNextBtn = true
                btnScale = 0.8
                needDiffX = 30
            end
        end
    end

    -- 再来一遍按钮
    local againBtn = cc.ui.UIPushButton.new({normal = "ui/fight/wingame/btn.png"})
        :onButtonClicked(function()
            if rt then
                rt:restart()
            end
            self:removeFromParent()
        end)
        :pos(115 - needDiffX, -40)
        :addTo(bg)
    local againLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.Restart,
        font = GLOBAL_FONTNAME,
        -- color = cc.c3b(0, 0, 0),
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 36,
        -- x = -20,
        -- y = 280,
    }):align(display.CENTER)

    againBtn:setVisible(false)
    againBtn:setScale(0.2)
    againBtn:setButtonLabel("normal", againLabel)
    againLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

    -- 按钮跑一个缩放的效果
    local act1 = cc.DelayTime:create(delayTime)
    local function finc()
        againBtn:setVisible(true)
    end
    local act2 = cc.CallFunc:create(finc)
    local act3 = cc.ScaleTo:create(0.2, btnScale)
    local seq  = cc.Sequence:create(act1, act2, act3)
    againBtn:runAction(seq)


    if not isLose and needNextBtn then
        -- “下一关”按钮
        local nextBtn = cc.ui.UIPushButton.new({normal = "ui/fight/wingame/btn.png"})
            :onButtonClicked(function()

                -- 停止音乐和音效
                rt:stopMusicAndSound(true)
                display.replaceScene(require("hall.HallScene").new(GlobalData.getGameLv() + 1))
                self:removeFromParent()

            end)
            :pos(265, -40)
            :addTo(bg)
        local nextLabel = cc.ui.UILabel.new({
            UILabelType = 2,
            text = WordLanguage.NextLevel,
            font = GLOBAL_FONTNAME,
            -- color = cc.c3b(0, 0, 0),
            align = cc.ui.TEXT_ALIGN_CENTER,
            size = 36,
            -- x = -20,
            -- y = 280,
        }):align(display.CENTER)

        nextBtn:setVisible(false)
        nextBtn:setScale(0.2)
        nextBtn:setButtonLabel("normal", nextLabel)
        nextLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

        -- 按钮跑一个缩放的效果
        local act1 = cc.DelayTime:create(delayTime)
        local function finc()
            nextBtn:setVisible(true)
        end
        local act2 = cc.CallFunc:create(finc)
        local act3 = cc.ScaleTo:create(0.2, btnScale)
        local seq  = cc.Sequence:create(act1, act2, act3)
        nextBtn:runAction(seq)
    end



    -- 返回大厅按钮
    local hallBtn = cc.ui.UIPushButton.new({normal = "ui/fight/wingame/btn.png"})
        :onButtonClicked(function()

            -- change by Owen, 2016.1.21, 返回大厅的时候不移除，等下次加载缓存的时候再移除
            -- 从游戏里面退出以后，要调用这个函数来释放掉缓存的 spine 动画
            -- SpineCache.removeAllSpineCache()


            -- 停止音乐和音效
            rt:stopMusicAndSound(true)

            display.replaceScene(require("hall.HallScene").new())

            self:removeFromParent()
        end)
        :pos(415 + needDiffX, -40)
        :addTo(bg)

    local hallLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.Back,
        font = GLOBAL_FONTNAME,
        -- color = cc.c3b(0, 0, 0),
        align = cc.ui.TEXT_ALIGN_CENTER,
        size = 36,
        x = -300,
        -- y = 280,
    }):align(display.CENTER)

    hallBtn:setVisible(false)
    hallBtn:setScale(0.2)
    hallBtn:setButtonLabel("normal", hallLabel)
    hallLabel:enableOutline(cc.c4b(0, 0,0,255), 1)

    -- 按钮跑一个缩放的效果
    local act1 = cc.DelayTime:create(delayTime)
    local function finc()
        hallBtn:setVisible(true)
    end
    local act2 = cc.CallFunc:create(finc)
    local act3 = cc.ScaleTo:create(0.2, btnScale)
    local seq  = cc.Sequence:create(act1, act2, act3)
    hallBtn:runAction(seq)


end

return GameWinPanel