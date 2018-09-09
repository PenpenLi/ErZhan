
local AdviceScene = class("AdviceScene", function()
    return display.newScene("AdviceScene")
end)

local random = math.random

function AdviceScene:ctor()
    self:setName("AdviceScene")
    print("AdviceScene:ctor")

    -- 显示游戏忠告文字
    self.root = display.newNode()
    self:addChild(self.root)

    self.studioPage = import("ui.AdviceStudio").create()
    local itemStoreStudio = self.studioPage.root
    
    --local path = utils.getName("sdfdf")
    itemStoreStudio:setTouchEnabled(true)
    itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()

    self.root:addChild(self.studioNode)
    self.studioNode:setPosition(display.cx, display.cy)

    -- 做适配动画
    -- local panel = self.studioPage["Image_1"]

    self.studioNode:setScale(GLOBAL_HALL_UI_SCALE2)
    -- utils.playAction(self.studioNode, panel)

    -- 第2个引导消失2秒后，显示第3个剧情引导
    local thirdAniDelayTime = 2.0
    local act1 = cc.DelayTime:create(thirdAniDelayTime)
    local function finc1( ... )
        local BenchmarkScene = require("ui.EnterChooseUI")
        display.replaceScene(BenchmarkScene.new())
    end
    local act2 = cc.CallFunc:create(finc1)
    local seq  = cc.Sequence:create( act1, act2)
    self.root:runAction(seq)
end
function AdviceScene:onEnter()
    
end
function AdviceScene:onExit()
end

return AdviceScene
