
-- 游戏暂停页面

local BattleDataManager = require("app.map.data.BattleDataManager")
local GlobalData        = require("tools.GlobalData")
local HeroGrowth        = require("app.properties.HeroGrowth")

-- 点击关卡以后，显示的难度选择界面
local HeroAttributePanel = class("HeroAttributePanel", function()
    return display.newNode()
end)



function HeroAttributePanel:ctor(bgWidth, bgHeight)

    self:setContentSize(cc.size(bgWidth, bgHeight))

    local upY   = 1050
    local diffY = 65
    local posX  = 125
    local wordSize = 45
    local outlineLabel = cc.ui.UILabel.new({text = "生命值:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "防御力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*2)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "近战射程:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*3)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "远程射程:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*4)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "近战攻击频率:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*5)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "远程攻击频率:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*6)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "移动速度:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*7)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "暴击威力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*8)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "闪避率:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*9)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "普通吸血:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*10)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "治疗效果:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*11)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "暴击率:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*12)
    :addTo(self)

    local outlineLabel = cc.ui.UILabel.new({text = "抵抗力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(255,255,255)})
    :align(display.CENTER_LEFT, posX, upY - diffY*13)
    :addTo(self)



    local upY   = 1050
    local diffY = 65
    local posX  = 525
    self.outlineLabel1 = cc.ui.UILabel.new({text = "生命值:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY)
    :addTo(self)

    self.outlineLabel2 = cc.ui.UILabel.new({text = "防御力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY)
    :addTo(self)

    self.outlineLabel3 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*2)
    :addTo(self)

    self.outlineLabel4 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*3)
    :addTo(self)

    self.outlineLabel5 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*4)
    :addTo(self)

    self.outlineLabel6 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*5)
    :addTo(self)

    self.outlineLabel7 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*6)
    :addTo(self)

    self.outlineLabel8 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*7)
    :addTo(self)

    self.outlineLabel9 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*8)
    :addTo(self)

    self.outlineLabel10 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*9)
    :addTo(self)

    self.outlineLabel11 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*10)
    :addTo(self)

    self.outlineLabel12 = cc.ui.UILabel.new({text = "攻击力:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*11)
    :addTo(self)

    self.outlineLabel13 = cc.ui.UILabel.new({text = "攻击力13:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*12)
    :addTo(self)

    self.outlineLabel14 = cc.ui.UILabel.new({text = "攻击力13:", font = GLOBAL_FONTNAME,
        size = wordSize, color = cc.c3b(102,217,55)})
    :align(display.CENTER_RIGHT, posX, upY - diffY*13)
    :addTo(self)
    
end

function HeroAttributePanel:updateData(hero)
    local growth = HeroGrowth.get(hero.mainID)
    define = growth[1][1]       -- 一星一级的品质
    for i,v in pairs(define) do
        hero[i] = v
    end
    self.outlineLabel1:setString(tostring(hero.maxHp))
    self.outlineLabel2:setString(tostring(hero.armor))
    self.outlineLabel3:setString(tostring(hero.attack))
    self.outlineLabel4:setString(tostring(hero.fireRange))
    self.outlineLabel5:setString(tostring(hero.fireVision))
    self.outlineLabel6:setString(tostring(hero.cooldown1))
    self.outlineLabel7:setString(tostring(hero.cooldown2))
    self.outlineLabel8:setString(tostring(hero.speed))
    self.outlineLabel9:setString(tostring(hero.criticalPower))
    self.outlineLabel10:setString(tostring(hero.dodge))
    self.outlineLabel11:setString(tostring(hero.suckHp))
    self.outlineLabel12:setString(tostring(hero.treatmentEffect))
    self.outlineLabel13:setString(tostring(hero.critical))
    self.outlineLabel14:setString(tostring(hero.resistControl))
end

return HeroAttributePanel