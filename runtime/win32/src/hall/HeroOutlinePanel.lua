
-- 游戏暂停页面

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")

-- 点击关卡以后，显示的难度选择界面
local HeroOutlinePanel = class("HeroOutlinePanel", function()
    return display.newNode()
end)



function HeroOutlinePanel:ctor(bgWidth, bgHeight)

    self:setContentSize(cc.size(bgWidth, bgHeight))

    ----------------------------- 雷达图 -------------------------------------------------
    local radar = display.newSprite("ui/hall/heroHome/radar.png")
    :pos(300, 800)
    :addTo(self)

    ----------------------------- 人物简介 -------------------------------------------------
    -- 图标
    local img = display.newScale9Sprite("ui/hall/heroHome/description.png", 
        0, 0, cc.size(300, 80))--, cc.rect(30,30, 70,70))
    self:addChild(img)
    img:setPosition(300, 450)
    -- 人物简介文字
    local outlineLabel = cc.ui.UILabel.new({text = WordLanguage.HeroDesc, font = GLOBAL_FONTNAME,
        size = 50, color = cc.c3b(0,170,248)})
    :align(display.CENTER_TOP, 150, 65)
    :addTo(img)


    -- 文字内容，自动换行
    self.descLabel = cc.ui.UILabel.new({text = "XXX大连打飞机拉萨放大镜的飞洒垃圾袋飞拉萨来三顿饭拉萨对伐啦京东方拉斯接待费乐山大佛婕拉司法鉴定阿道夫拉萨接待费拉双方均d",
        font = GLOBAL_FONTNAME, size = 40, dimensions = CCSize(bgWidth - 100, 0)})
    self.descLabel:setPosition(50, 300)
    self:addChild(self.descLabel)

    
end

function HeroOutlinePanel:updateData(hero)
    self.descLabel:setString(hero.text)
end

return HeroOutlinePanel