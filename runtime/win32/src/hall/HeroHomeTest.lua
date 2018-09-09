
-- 游戏暂停页面

local BattleDataManager     = require("app.map.data.BattleDataManager")
local GlobalData            = require("tools.GlobalData")
local HeroProperties        = require("app.properties.HeroProperties")
local HeroOutlinePanel      = require("hall.HeroOutlinePanel")
local HeroAttributePanel    = require("hall.HeroAttributePanel")

-- 点击关卡以后，显示的难度选择界面
local HeroHomeTest = class("HeroHomeTest", function()
    return display.newNode()
end)



function HeroHomeTest:ctor()
    -- 载入cocostudio中导出的lua页面
    local studio = import("hall.MainScene").create()
    self:addChild(studio.root)
    local closeBtn = studio["Button_1"]
    closeBtn:addClickEventListener(function (params )
        print("hahaha")
        -- studio.root:removeFromParent()
        -- self:removeFromParent()
    end)
    -- studio.root:setTouchEnabled(true)
    -- local heroName = studio["heroNameLabel"]
    -- heroName:setString("哈哈啊哈")


    -- local leftPanel = studio["LeftPanel"]
    -- leftPanel:setTouchEnabled(true)
    -- local leftBgImg = studio["leftBg"]

    -- local heroImg   = studio["heroBigImg"]
    -- heroImg:setTexture("hero/110102-1.png")
    

    -- ----------------------------------- 初始化ScrollView -------------------------------
    -- local scrollView =  cc.ui.UIScrollView.new(
    --     {viewRect = cc.rect(50,150, 280, 1100), direction = 1})
    -- leftBgImg:addChild(scrollView);

    -- self.heros = {}
    -- self.selectedHero = {}
    -- self.heroSelectedImgs = {}

    -- local orderHeros = GlobalData.getHeroOrder()
    -- for i = 1, 8 do
    --     self.heros[i] = HeroProperties.get(orderHeros[i])
    -- end
    -- self.selectedHero = self.heros[3]

    -- local cellDatas = {}
    -- for i = 1, 8 do
    --     -- 英雄头像背景图片
    --     local heroIconBg  = cc.ui.UIImage.new("ui/heroIcon/heroBg.png")

    --     -- 英雄头像，用来做按钮
    --     local heroBtn = cc.ui.UIPushButton.new({normal = "ui/heroIcon/"..
    --         self.heros[i].mainID..".png"})
    --         :onButtonClicked(function(params)
    --             print("on click params.target.index = "..tostring(params.target.index))
    --             -- self:updateData(params.target.index)
    --         end)
    --     local x = heroIconBg:getContentSize().width/2
    --     local y = heroIconBg:getContentSize().height/2
    --     heroBtn:setPosition(x, y)
    --     heroBtn:setTouchSwallowEnabled(false)
    --     heroBtn.index = i
    --     heroIconBg:addChild(heroBtn)

    --     -- 英雄选中图片
    --     local heroSelectedImg = display.newSprite("ui/heroIcon/heroSelected.png")
    --     heroSelectedImg:setPosition(x, y)
    --     heroSelectedImg:setVisible(false)
    --     self.heroSelectedImgs[i] = heroSelectedImg
    --     heroIconBg:addChild(heroSelectedImg)


    --     cellDatas[#cellDatas+1] = heroIconBg

    -- end
    -- scrollView:fill(cellDatas, {itemSize = (cellDatas[#cellDatas]):getContentSize(), 
    --     autoGap = false, heightGap = 0})


end


-- 点击向上翻页按钮
function HeroHomeTest:onClickUpBtn( ... )
    -- body
end

-- 点击向下翻页按钮
function HeroHomeTest:onClickDownBtn( ... )
    -- body
end

-- 点击技能升星按钮，实际上只会升等级
function HeroHomeTest:onClickUpStarBtn(params)

end

-- 根据传入的英雄来更新页面中显示的数据
function HeroHomeTest:updateData(btnIndex)
    print("HeroHomeTest:updateData() self.selectedHero.mainID = "..self.selectedHero.mainID)
end

function HeroHomeTest:onTapLevelIcon( ... )
    print("HeroHomeTest:onTapLevelIcon")
end


return HeroHomeTest