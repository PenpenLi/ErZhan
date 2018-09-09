
-- 游戏中显示的Tips的按钮，比如新怪Tips按钮, 显示在左上角的一长排

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local MapConstants      = require("app.map.MapConstants")
local GameTips          = require("app.map.battleui.GameTips")

local TipsType_RoundStart   = 1       -- 手动出怪Tips
local TipsType_HeroMove     = 2       -- 英雄移动Tips
local TipsType_JiTanPlunder = 3       -- 祭坛掠夺Tips
local TipsType_NewEnemy     = 4       -- 出现新怪Tips
-- local TipsType_RoundStart   = 5       -- 手动出怪Tips
-- local TipsType_RoundStart   = 6       -- 手动出怪Tips
-- local TipsType_RoundStart   = 7       -- 手动出怪Tips
-- local TipsType_RoundStart   = 8       -- 手动出怪Tips


-- add by Owen, 2016.6.12, 手机平台上 tips 的按钮要往右移80个像素
local mobileDiffX = 80


local TipsBtnPanel = class("TipsBtnPanel", function()
    return display.newNode()
end)

function TipsBtnPanel:ctor(battleUI)

    -- print("TipsBtnPanel:ctor 显示游戏中的Tips isGuide = "..tostring(isGuide)
    --     .." tipsType = "..tostring(tipsType))

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    elseif GLOBAL_HALL_UI_SCALE2 then
        self:setScale(GLOBAL_HALL_UI_SCALE2)
    end

    self.orignalScale = self:getScale()

    -- 记录一下battleUI, 用来点击完以后，显示tips
    self.battleUI = battleUI

    -- 记录总共出现了几个按钮
    self.tipsBtnCount = 0

    -- 记录所有的显示中的Tips Button
    self.tipsBtns = {}

end

-- 添加一个Tips的按钮
function TipsBtnPanel:addOneBtn(tipsType, monsterID)

    -- print("TipsBtnPanel:addOneBtn tipsType = "..tostring(tipsType))
    self.tipsBtnCount = self.tipsBtnCount + 1

    self.monsterID = monsterID

    local allNode = display.newNode()
        :addTo(self)
        :pos(mobileDiffX + (self.tipsBtnCount - 1) * 120 , 0)

    if (device.platform == "mac" or device.platform == "windows") then
        allNode:setPosition((self.tipsBtnCount - 1) * 120 , 0)
    end


    -- 转圈的背景图
    local btnBg = display.newSprite("ui/fight/gameGuide/huan01.png")
        :addTo(allNode)
        -- :pos((self.tipsBtnCount - 1) * 120 , 0)

    -- 一直转圈的特效
    local act1 = cc.RotateBy:create(1, 360)
    local seq  = cc.Sequence:create(act1)
    local rotateAction = cc.RepeatForever:create(seq)
    btnBg:runAction(rotateAction)
    
    -- 是新怪提示的话，需要在后面加一层新怪的 Icon
    local monsterImg

    -- 根据类型添加不同的按钮
    -- 新怪的按钮是一种，其他类型都是同一种按钮
    local btnImgName = "ui/fight/gameGuide/newEnemyBtn.png"
    if tipsType ~= MapConstants.TipsType_NewEnemy then
        btnImgName = "ui/fight/gameGuide/otherTipsBtn.png"

        btnBg:setTexture("ui/fight/gameGuide/huan02.png")
    else
        monsterImg = display.newSprite("ui/Icons/monsterIcon/"
            ..tostring(monsterID)..".jpg")
            :addTo(allNode)
            -- :pos((self.tipsBtnCount - 1) * 120 , 0)
            :setScale(0.8)
        -- print("添加怪物图标")
    end



    -- 新建tips按钮
    local tipBtn = cc.ui.UIPushButton.new({normal = btnImgName})
        :onButtonClicked(function(params)
            self:onTipsBtnClick(params)
        end)
        :addTo(allNode)

    -- tipBtn:setPosition((self.tipsBtnCount - 1) * 120 , 0)
        

    -- 记录这个按钮排在第几个
    tipBtn.index      = self.tipsBtnCount
    -- 记录这个按钮是什么类型的Tips
    tipBtn.tipsType   = tipsType
    tipBtn.monsterID  = monsterID

    allNode.index     = self.tipsBtnCount
    allNode.tipsType  = tipsType
    allNode.btn       = tipBtn
    allNode.monsterID = monsterID

    self.tipsBtns[self.tipsBtnCount] = allNode

    -- 按钮的出现特效
    allNode:setScale(0.2)
    local action = cc.ScaleTo:create(0.38, 1.0)
    allNode:runAction(action)
end

-- 点击tips按钮以后的操作
function TipsBtnPanel:onTipsBtnClick(params)
    -- 显示这个按钮对应的Tips
    local btn = params.target
    local btnIndex = btn.index
    local tipsType = btn.tipsType

    local allNode  = self.tipsBtns[btnIndex]

    -- 显示新怪提示页面
    if tipsType == MapConstants.TipsType_NewEnemy then
        self.battleUI.rt:pausePlay()
        local function finc1()
            self.battleUI.rt:resumePlay()
        end
        viewMgr.show(viewMgr.def.NEWMONSTER_UI, allNode.monsterID, finc1)
    elseif tipsType == MapConstants.TipsType_ModeThree then
        -- 弹出模式3的玩法提示页面
        local guideTips = GameTips.new(true, nil, self.battleUI, true)
        self.battleUI:addChild(guideTips)
    else
        local guideTips = GameTips.new(false, tipsType, self.battleUI)
        self.battleUI:addChild(guideTips)
    end

    -- add by Owen, 2016.6.21, 不是模式3的提示按钮，
    -- 才需要跑下面的动画，模式3的提示按钮不消失
    if tipsType ~= MapConstants.TipsType_ModeThree then

        -- 把这个按钮从大缩到小，然后把这个按钮置为不可见，将其他的按钮往前顶
        local function finc()
            allNode:removeSelf()
            -- print("把这个按钮从大缩到小，然后把这个按钮置为不可见，将其他的按钮往前顶")
            -- print("btnIndex = "..tostring(btnIndex))
            for i = #self.tipsBtns, 1, -1 do
                -- 所以大于被移除的按钮的，也就是在移除的这个按钮的后面的按钮，
                -- 需要往前移
                
                if i > btnIndex then
                    -- print("tips按钮需要往前移 i = "..tostring(i))

                    local oldIndex   = self.tipsBtns[i].index
                    -- print("oldIndex = "..tostring(oldIndex))
                    local posX       = mobileDiffX + (oldIndex - 2) * 120
                    if (device.platform == "mac" or device.platform == "windows") then
                        posX = (oldIndex - 2) * 120
                    end
                    local moveAction = cc.MoveTo:create(0.2, cc.p(posX, 0))

                    self.tipsBtns[i]:runAction(moveAction)

                    self.tipsBtns[i].index = oldIndex - 1

                    self.tipsBtns[i].btn.index = oldIndex - 1
                end
                if i == btnIndex then
                    -- print("移除一个按钮")
                    table.remove(self.tipsBtns, btnIndex)
                    self.tipsBtnCount = self.tipsBtnCount - 1
                end
            end
        end

        -- 按钮的消失特效
        local scaleAction = cc.ScaleTo:create(0.38, 0.2)
        local sequence    = cc.Sequence:create(scaleAction, cc.CallFunc:create(finc))
        allNode:runAction(sequence)
    end

end

-- add by Owen, 2016.5.4, 重新开始这一关的时候，需要把tips的按钮都移除掉
function TipsBtnPanel:removeAllBtn()
    self.tipsBtnCount = 0
    for i = #self.tipsBtns, 1, -1 do
        self.tipsBtns[i]:removeSelf()
        table.remove(self.tipsBtns, i) 
    end
end

return TipsBtnPanel