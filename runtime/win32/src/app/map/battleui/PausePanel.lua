
-- 游戏暂停页面

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local SpineCache        = require("app.map.spine.SpineCache")

-- 点击关卡以后，显示的难度选择界面
local PausePanel = class("PausePanel", function()
    return display.newNode()
end)



function PausePanel:ctor(rt)

    self:setContentSize(cc.size(display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setTouchEnabled(true)

    local maskBg = display.newSprite("ui/common/mask_img.png")
    self:addChild(maskBg)
    maskBg:setScale(GLOBAL_BIG_UI_SCALE)
    maskBg:setPosition(display.cx, display.cy)

    local bg = display.newSprite("ui/fight/pause/bg.png")
    bg:setPosition(display.cx, display.cy)
    self:addChild(bg)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        bg:setScale(GLOBAL_FIGHT_UI_SCALE)
    end

    local bgWidth  = bg:getContentSize().width
    local bgHeight = bg:getContentSize().height
    bg:setPositionY(display.height - (bgHeight/2) * GLOBAL_FIGHT_UI_SCALE)


    -- 右上角的红色关闭按钮
    local closeBtn = cc.ui.UIPushButton.new({normal = "ui/hall/chooseModel/close.png"})
        :onButtonClicked(function()
            rt:resumePlay()
            self:removeFromParent()
        end)
        :pos(bgWidth - 88, bgHeight - 63)
        :addTo(bg)





    -- “第”文字
    local diImg = display.newSprite("ui/hall/chooseModel/di.png")
    bg:addChild(diImg)
    diImg:setPosition(bgWidth/2 - 60, bgHeight - 100)

    -- -- CCLabelAtlas通过png文件作为资源创建文本，参数:显示内容，图片、单个数字宽度、  
    -- -- 高度、图片中第一个字符的ASCII码，如字符为"."，可以传入46或者'.'都可以。  
    -- if not self.labelatlas then
    --     self.labelatlas = cc.LabelAtlas:_create(GlobalData.getGameLv(), "ui/hall/chooseModel/number.png", 36, 50, 48)
    --     self.labelatlas:setPosition(bgWidth/2, bgHeight - 125)
    --     self.labelatlas:setAnchorPoint(0.5,0)
    --     bg:addChild(self.labelatlas)
    -- else
    --     self.labelatlas:setString(GlobalData.getGameLv())
    -- end

    -- change by Owen, 2016.4.7, 把第几关的文字改为bmfont
    self.gameLvLabel = display.newBMFontLabel({
        text = GlobalData.getGameLv(),
        font = "ui/hall/chooseModel/selectID.fnt",
    })
    self.gameLvLabel:setPosition(bgWidth/2, bgHeight - 106)
    self.gameLvLabel:setAnchorPoint(0.5,0)
    bg:addChild(self.gameLvLabel)

    -- “关”文字
    local guanImg = display.newSprite("ui/hall/chooseModel/guan.png")
    bg:addChild(guanImg)
    guanImg:setPosition(bgWidth/2 + 65, bgHeight - 100)





    local posX  = 370
    local posY  = 100
    local diffX = 200

    ----------------------------- 继续按钮 ----------------------------- 
    local continueBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause/resume.png"})
        :onButtonClicked(function()
            -- add by Owen, 2016.4.23, 点击按钮的时候，需要播放音效
            AudioMgr.playSound("Function")

            rt:resumePlay()
            self:removeFromParent()
        end)
        :pos(posX - diffX, posY)
        :addTo(bg)
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.Continue,
    --         size = 50,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx - 400, display.cy - 50)
    -- self:addChild(label)

    ----------------------------- 再来一遍按钮 --------------------------------------------
    cc.ui.UIPushButton.new({normal = "ui/fight/pause/restart.png"})
        :onButtonClicked(function()

            -- if rt then
            --     rt:stopPlay()
            -- end
            -- rt.map_:removeAllObjects()
            -- rt.map_:init()
            -- rt.map_:resetDestroyedMonsterCount()
            -- rt.map_:resetTotalMonsterCountInThisMap()

            -- rt:preparePlay()
            -- rt:startPlay()
            -- BattleDataManager:setConfig(BattleDataManager:getConfig())

            -- add by Owen, 2016.4.23, 点击按钮的时候，需要播放音效
            AudioMgr.playSound("Function")

            if rt then
                rt:restart()
            end

            self:removeFromParent()

        end)
        :pos(posX, posY)
        :addTo(bg)
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.Restart,
    --         size = 50,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx - 50, display.cy - 50)
    -- self:addChild(label)

    ----------------------------- 返回大厅按钮 --------------------------------------------
    cc.ui.UIPushButton.new({normal = "ui/fight/pause/quit.png"})
        :onButtonClicked(function()
            -- self:removeFromParent()

            -- change by Owen, 2016.1.21, 返回大厅的时候不移除，等下次加载缓存的时候再移除
            -- 从游戏里面退出以后，要调用这个函数来释放掉缓存的 spine 动画
            -- SpineCache.removeAllSpineCache()

            -- add by Owen, 2016.4.23, 点击按钮的时候，需要播放音效
            AudioMgr.playSound("Function")

            -- 停止音乐和音效
            rt:stopMusicAndSound(true)

            display.replaceScene(require("hall.HallScene").new())
            self:removeFromParent()
        end)
        :pos(posX + diffX, posY)
        :addTo(bg)
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.Home,
    --         size = 50,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx + 300, display.cy - 50)
    -- self:addChild(label)


    local posX = 170
    local posY = 340
    local diffX1 = 130     -- 音乐图片和开关之间的距离
    local diffX2 = 300     -- 左右两排音乐图标之间的距离
    local diffY  = -100    -- 上下两派音乐图标之间的距离

    ----------------------------- 音乐按钮 -------------------------------------------
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.Music,
    --         size = 40,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx - 545, display.cy - 150)
    -- self:addChild(label)

    local musicIcon = display.newSprite("ui/fight/pause/music.png")
        :addTo(bg)
        :pos(posX, posY)

    self.musicBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause/off.png"})
        :onButtonClicked(function(...)
            self:onMusicBtnClicked(...)
        end)
        :pos(posX + diffX1, posY)
        :addTo(bg)
    self.musicOnImg = display.newSprite("ui/fight/pause/on.png")
        :pos(5, 15)
        :addTo(self.musicBtn)
        :setVisible(false)

    ----------------------------- 音效按钮 -------------------------------------------
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.SoundEffect,
    --         size = 40,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx - 160, display.cy - 150)
    -- self:addChild(label)

    local musicIcon = display.newSprite("ui/fight/pause/sound.png")
        :addTo(bg)
        :pos(posX + diffX2, posY)

    self.soundEffectBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause/off.png"})
        :onButtonClicked(function(...)
            self:onSoundBtnClicked(...)
        end)
        :pos(posX + diffX2 + diffX1, posY)
        :addTo(bg)

    self.soundOnImg = display.newSprite("ui/fight/pause/on.png")
        :pos(5, 15)
        :addTo(self.soundEffectBtn)
        :setVisible(false)

    ----------------------------- 震动按钮 -------------------------------------------
    -- local label = cc.ui.UILabel.new({
    --         UILabelType = 2,
    --         font = GLOBAL_FONTNAME,
    --         text = WordLanguage.Vibration,
    --         size = 40,
    --         color = cc.c3b(255, 255, 255)
    --     })
    -- label:setPosition(display.cx + 230, display.cy - 150)
    -- self:addChild(label)

    local musicIcon = display.newSprite("ui/fight/pause/vibration.png")
        :addTo(bg)
        :pos(posX, posY + diffY)

    self.vibrationBtn = cc.ui.UIPushButton.new({normal = "ui/fight/pause/off.png"})
        :onButtonClicked(function(...)
            self:onvibrationBtnClicked(...)
        end)
        :pos(posX + diffX1, posY + diffY)
        :addTo(bg)
    self.vibrationOnImg = display.newSprite("ui/fight/pause/on.png")
        :pos(5, 15)
        :addTo(self.vibrationBtn)
        :setVisible(false)


    -- 修改图片
    if GlobalData.getMusicOn() then
        -- self.musicBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.musicOnImg:setVisible(true)
    end
    if GlobalData.getSoundEffectOn() then
        -- self.soundEffectBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.soundOnImg:setVisible(true)
    end
    if GlobalData.getVibrationOn() then
        -- self.vibrationBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.vibrationOnImg:setVisible(true)
    end
    
end

-- 点击音乐按钮
function PausePanel:onMusicBtnClicked( ... )
    -- add by Owen, 2016.4.23, 点击按钮的时候，需要播放音效
    AudioMgr.playSound("Function")

    -- print("PausePanel:onMusicBtnClicked GlobalData.getMusicOn() = "
    --     ..tostring(GlobalData.getMusicOn()))
    if GlobalData.getMusicOn() then
        GlobalData.setMusicOn(false)
        AudioEngine.stopMusic()
        -- self.musicBtn:setButtonImage("normal", "ui/fight/pause/off.png")
        self.musicOnImg:setVisible(false)
    else
        -- print("GlobalData.getMusicName() = "..tostring(GlobalData.getMusicName()))
        AudioEngine.playMusic(GlobalData.getMusicName(), true)
        local percent = GlobalData.getMusicVolume()
        AudioEngine.setMusicVolume(percent/100)

        GlobalData.setMusicOn(true)
        -- self.musicBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.musicOnImg:setVisible(true)
    end
end

-- 点击音效按钮
function PausePanel:onSoundBtnClicked( ... )
    -- add by Owen, 2016.4.23, 点击按钮的时候，需要播放音效
    AudioMgr.playSound("Function")

    if GlobalData.getSoundEffectOn() then
        AudioMgr.setSoundOn(false)
        GlobalData.setSoundEffectOn(false)
        -- self.soundEffectBtn:setButtonImage("normal", "ui/fight/pause/off.png")
        self.soundOnImg:setVisible(false)
    else
        AudioMgr.setSoundOn(true)
        GlobalData.setSoundEffectOn(true)
        -- self.soundEffectBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.soundOnImg:setVisible(true)
    end
end

-- 点击震动按钮
function PausePanel:onvibrationBtnClicked( ... )
    if GlobalData.getVibrationOn() then
        GlobalData.setVibrationOn(false)
        -- self.vibrationBtn:setButtonImage("normal", "ui/fight/pause/off.png")
        self.vibrationOnImg:setVisible(false)
    else
        GlobalData.setVibrationOn(true)
        -- self.vibrationBtn:setButtonImage("normal", "ui/fight/pause/on.png")
        self.vibrationOnImg:setVisible(true)
    end
end

return PausePanel