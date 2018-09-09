
-- 第一次进入游戏时候显示的剧情页面
local TowerProperties         = require("app.properties.TowerProperties")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local TowerObjectsProperties  = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties   = require("app.properties.TowerTalentProperties")
local TowerSkillDetailPanel   = require("app.map.battleui.TowerSkillDetailPanel")
local StableGameProperties    = require("app.properties.StableGameProperties")
local GlobalData              = require("tools.GlobalData")
local BattleDataManager       = require("app.map.data.BattleDataManager")
local EffectAniCache          = require("app.map.spine.EffectAniCache")

local FirstGuideAni = class("FirstGuideAni", function()
    return display.newNode()
end)

local posX_L1, posY_L1 = 240, 300    -- 左边人物位置
local posX_L2, posY_L2 = 600, 500    -- 左边对话框位置
local posX_R1, posY_R1 = 1010, 300    -- 右边人物位置
local posX_R2, posY_R2 = 620, 500    -- 右边对话框位置
local labDiffY = 15                   -- 文字内容在posY_R1的基础上需要往上移动

function FirstGuideAni:ctor(onSelf, worldHall)

    -- 记录世界地图页面
    print("FirstGuideAni:ctor worldHall = "..tostring(worldHall))
    self.worldHall = worldHall

	self:setContentSize(cc.size(display.width, display.height))
    -- 把自己置为可点击，就会把下面的点击事件给屏蔽掉了
    self:setTouchEnabled(true)

    -- -- 背景的黑色遮罩
    -- local maskBg = display.newSprite("ui/common/mask_img.png")
    -- self:addChild(maskBg)
    -- maskBg:setScale(GLOBAL_BIG_UI_SCALE * 1000)
    -- maskBg:setPosition(display.cx, display.cy)

    self.root = display.newNode()
        :addTo(self)
        :setScale(GLOBAL_HALL_UI_SCALE2)

    local panel = ccui.ImageView:create()
    panel:ignoreContentAdaptWithSize(false)
    panel:loadTexture("ui/common/mask_img.png",0)

    panel:setFlippedX(false)
    panel:setFlippedY(false)

    panel:setScale9Enabled(true)
    panel:setCapInsets(cc.rect(20,20,44,43))
    panel:setTouchEnabled(true)
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

    self.root:addChild(panel)
    -- panel:setPosition(display.cx, display.cy)

    panel:setScale(1000)
    -- panel:setScale(1/GLOBAL_HALL_UI_SCALE2)
    -- panel:setPosition(cc.p(- display.cx*(1/GLOBAL_HALL_UI_SCALE2),
    --     - display.cy*(1/GLOBAL_HALL_UI_SCALE2)))

    -- 增加点击效果
    local function BackFunc()
        self:onClick()
        return
    end
    panel:addClickEventListener(BackFunc)



    -- 当前显示的是第几步引导
    self.curShowGuide = 0

    self:createView()
	-- self:setVisible(false)
    self.clickCount = 0

    
end

function FirstGuideAni:onClick()
    print("FirstGuideAni:onClick() self.curShowGuide = "..tostring(self.curShowGuide))
    if self.curShowGuide ~= 0 then
        if self.curShowGuide == 1 then
            self.curShowGuide = 0
            self.continueLab:setVisible(false)
            self:showGuide2()
        elseif self.curShowGuide == 2 then
            self.curShowGuide = 0
            self.continueLab:setVisible(false)
            self:showGuide3()
        elseif self.curShowGuide == 3 then
            self.curShowGuide = 0
            self.continueLab:setVisible(false)
            self:showGuide4()
        end
    end
end

-- 创建控件
function FirstGuideAni:createView()

    -- 设置action的tag值
    self.curProcess = 0

    -- 先显示暗夜精灵对话框
    self.heroImg   = display.newSprite("ui/Icons/bigIcon/110202.png")
        :addTo(self.root)
        :pos(posX_L1, posY_L1)
        -- :setOpacity(0)


    self.dialog = display.newSprite("ui/common/dialog.png")
        :addTo(self.root)
        :pos(posX_L2, posY_L2)
        -- :setOpacity(0)


    self.texLab = cc.ui.UILabel.new({
        UILabelType = 2,
        text = StableGameProperties.FIRST_GUIDE_WORD[1],
        align = cc.ui.TEXT_ALIGN_LEFT,
        color = cc.c3b(252, 255, 0),
        font = GLOBAL_FONTNAME,
        dimensions = CCSize(300, 0),
        size = 22,
        x = posX_L2, -- + 456/2,
        y = posY_L2, -- + 207/2,
    })
    :addTo(self.root)
    self.texLab:setAnchorPoint(0.5, 0.5)

    -- 点击继续文字
    self.continueLab = cc.ui.UILabel.new({
        UILabelType = 2,
        text = WordLanguage.ClickToContinue,
        align = cc.ui.TEXT_ALIGN_LEFT,
        color = cc.c3b(252, 255, 0),
        font = GLOBAL_FONTNAME,
        size = 32,
        x = 640, -- + 456/2,
        y = 75, -- + 207/2,
    })
    :addTo(self.root)
    :setVisible(false)
    self.continueLab:setAnchorPoint(0.5, 0.5)
    self.continueLab:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    local fade1 = cc.FadeTo:create(0.5, 100)
    local fade2 = cc.FadeTo:create(0.3, 255)
    local seq_2 = cc.Sequence:create(fade1, fade2)
    local fadeAction = cc.RepeatForever:create(seq_2)
    self.continueLab:runAction(fadeAction)



    -- texLab:enableOutline(cc.c4b(71, 40,0,255), 2)

    local function finc( ... )
        -- 当前已经显示了第一步引导
        self.curShowGuide = 1
        self.continueLab:setVisible(true)
    end

    local act1 = cc.DelayTime:create(1.0)
    local act2 = cc.CallFunc:create(finc)
    local seq  = cc.Sequence:create(act1, act2)
    self:runAction(seq)

end

-- 显示剧情第二步引导
function FirstGuideAni:showGuide2()
    -- 先隐藏第一步引导
    local removeTime = 0.5
    local moveAction = cc.MoveTo:create(removeTime, cc.p(posX_L1 - 50, posY_L1 - 50))
    local optAction = cc.FadeOut:create(removeTime)
    local sp = cc.Spawn:create(moveAction, optAction)
    self.heroImg:runAction(sp)
    local optAction = cc.FadeOut:create(removeTime)
    self.dialog:runAction(optAction)


    local optAction = cc.FadeOut:create(removeTime)
    -- 第一个引导消失0.5秒后，显示第二个剧情引导
    local secondAniDelayTime = 0.5
    local act1 = cc.DelayTime:create(secondAniDelayTime)
    local function finc( ... )
        -- 显示第二个右边的剧情
        print("显示第二个右边的剧情")
        self.heroImg:setTexture("ui/Icons/bigIcon/100503.png")
        -- self.heroImg:setScaleX(-1)
        self.heroImg:setPosition(posX_R1, posY_R1)
        self.texLab:setString(StableGameProperties.FIRST_GUIDE_WORD[2])
        self.dialog:setScaleX(-1)
        self.texLab:setPosition(posX_R2, posY_R2 + labDiffY)
        self.dialog:setPosition(posX_R2, posY_R2)

        self:doFadeAni(self.heroImg, 0.5, true)
        self:doFadeAni(self.texLab, 0.5)
        self:doFadeAni(self.dialog, 0.5)

    end
    local act2 = cc.CallFunc:create(finc)

    -- 第一个引导消失1.0秒后，才可以点击
    local thirdAniDelayTime = 1.0
    local act3 = cc.DelayTime:create(thirdAniDelayTime)
    local function finc1( ... )
        -- 当前显示了第二步引导
        self.curShowGuide = 2
        self.continueLab:setVisible(true)
    end
    local act4 = cc.CallFunc:create(finc1)
    local seq  = cc.Sequence:create(optAction, act1, act2, act3, act4)

    -- local seq  = cc.Sequence:create(optAction, act1, act2)
    self.texLab:runAction(seq)

end

-- 显示第三步剧情引导
function FirstGuideAni:showGuide3()
    -- 先隐藏第二步引导
    local removeTime = 0.5
    local moveAction = cc.MoveTo:create(removeTime, cc.p(posX_R1 + 50, posY_R1 - 50))
    local optAction = cc.FadeOut:create(removeTime)
    local sp = cc.Spawn:create(moveAction, optAction)
    self.heroImg:runAction(sp)
    local optAction = cc.FadeOut:create(removeTime)
    self.dialog:runAction(optAction)


    local optAction = cc.FadeOut:create(removeTime)
    -- 第2个引导消失0.5秒后，显示第3个剧情引导
    local secondAniDelayTime = 0.5
    local act1 = cc.DelayTime:create(secondAniDelayTime)
    local function finc( ... )
        -- 显示第二个右边的剧情
        print("显示第三个左边的剧情")
        self.heroImg:setTexture("ui/Icons/bigIcon/110204.png")
        -- self.heroImg:setScaleX(1)
        self.heroImg:setPosition(posX_L1, posY_L1)
        self.texLab:setString(StableGameProperties.FIRST_GUIDE_WORD[3])
        self.dialog:setScaleX(1)
        self.texLab:setPosition(posX_L2, posY_L2 + labDiffY)
        self.dialog:setPosition(posX_L2, posY_L2)

        self:doFadeAni(self.heroImg, 0.5, true)
        self:doFadeAni(self.texLab, 0.5)
        self:doFadeAni(self.dialog, 0.5)

    end
    local act2 = cc.CallFunc:create(finc)


    -- 第二个引导消失1.0秒后，才可以点击
    local thirdAniDelayTime = 1.0
    local act3 = cc.DelayTime:create(thirdAniDelayTime)
    local function finc1( ... )
        -- 当前显示了第三步引导
        self.curShowGuide = 3
        self.continueLab:setVisible(true)
    end
    local act4 = cc.CallFunc:create(finc1)


    local seq  = cc.Sequence:create(optAction, act1, act2, act3, act4)
    self.texLab:runAction(seq)
end

-- 隐藏第3步引导，然后显示 弓箭手 拼图界面
function FirstGuideAni:showGuide4()
    print("FirstGuideAni:showGuide4()")

    -- 先隐藏第三步引导
    local removeTime = 0.5
    local moveAction = cc.MoveTo:create(removeTime, cc.p(posX_L1 - 50, posY_L1 - 50))
    local optAction = cc.FadeOut:create(removeTime)
    local sp = cc.Spawn:create(moveAction, optAction)
    self.heroImg:runAction(sp)
    local optAction = cc.FadeOut:create(removeTime)
    self.dialog:runAction(optAction)

    local optAction = cc.FadeOut:create(removeTime)
    local function finc1( ... )
        self:showGuide5()
    end
    local act1 = cc.CallFunc:create(finc1)

    local seq  = cc.Sequence:create(optAction, act1)
    self.texLab:runAction(seq)


end

-- 显示 弓箭手 拼图界面
function FirstGuideAni:showGuide5()

    -- 设置剧情引导已经显示过了
    GlobalData.setStoryGuideHasShow()

    -- 显示拼图页面
    viewMgr.show(viewMgr.def.JIGSAW_UI, self.worldHall)

    self:removeSelf()
end

-- 制作隐现的动画
function FirstGuideAni:doFadeAni(node1, time, isIn, func)


    node1:setOpacity(0)
    local function func1()
        if func then
            self.seq = nil
            node1.seq = nil
            func()
        end
    end
    local act1 = cc.FadeIn:create(time)
    local act2 = cc.CallFunc:create(func1)
    local seq  = cc.Sequence:create(act1,act2)

    node1:runAction(seq)
end


return FirstGuideAni