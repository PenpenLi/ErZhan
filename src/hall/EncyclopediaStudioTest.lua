

local GlobalData             = require("tools.GlobalData")
local HeroProperties         = require("app.properties.HeroProperties")
local GroupProperties        = require("app.properties.GroupProperties")
local GroupDetailPanel       = require("hall.GroupDetailPanel")
local ChooseModeRightPanel   = require("hall.ChooseModeRightPanel")
local MapConstants           = require("app.map.MapConstants")
local MapConfig              = require("maps.MapConfig")
local ManualSkillProperties  = require("app.properties.ManualSkillProperties")
local AutoSkillProperties    = require("app.properties.AutoSkillProperties")
local PassiveSkillProperties = require("app.properties.PassiveSkillProperties")
local HeroGrowth             = require("app.properties.HeroGrowth")

local MonsterOrder           = require("app.properties.MonsterOrder")
local MonsterProperties      = require("app.properties.MonsterProperties")

local EncyclopediaStudioTest = class("EncyclopediaStudioTest")


-- 加载studio导出的选关页面
function EncyclopediaStudioTest:ctor(params)

    self.studioPage = import("hall.EncyclopediaStudio").create()
    local chooseModePanelStudio = self.studioPage.root



    chooseModePanelStudio:setTouchEnabled(true)
    chooseModePanelStudio:setTouchSwallowEnabled(true) 

    chooseModePanelStudio:retain()

    self.studioNode = chooseModePanelStudio

    -- 获得Studio中的所有控件
    self:getAllElemets()

    -- 进来的时候默认选中第一个怪物
    self:onClickMonsterBtn(1)


end

-- 记录所有的控件
function EncyclopediaStudioTest:getAllElemets()
    -- 关闭按钮
    local closeBtn  = self.studioPage["close_btn"]
    closeBtn:addClickEventListener(function (params )
        self.studioNode:setVisible(false)
    end) 


    ---------------------------- 获得20个怪物的按钮 ----------------------------
    self.allMonsterBtns = {}    -- 20个怪物的按钮
    self.allMasks       = {}    -- 20个怪物的未选中Mask
    for i = 1, 20 do
        -- 20个怪物按钮
        self.allMonsterBtns[i] = self.studioPage["monsterBtn_"..i]
        self.allMonsterBtns[i]:addClickEventListener(function (params )
            self:onClickMonsterBtn(i)
        end)

        -- 怪物的未选中Mask
        self.allMasks[i]       = self.studioPage["mask_"..i]
        self.allMasks[i]:setVisible(true)
    end


    ---------------------------- 获得右边的怪物属性 ----------------------------
    -- 怪物的大图标
    self.monsterBigImg = self.studioPage["monsterImg"]

    -- 怪物名字
    self.monsterNameTxt = self.studioPage["heroNameTxt"]
    -- 怪物简介
    self.monsterInfoTxt = self.studioPage["monsterInfoText"]
    -- 英雄描述文字要自动换行
    self.monsterInfoTxt:ignoreContentAdaptWithSize(false); 
    self.monsterInfoTxt:setContentSize(cc.size(240, 280)); 
    self.monsterInfoTxt:setPositionY(self.monsterInfoTxt:getPositionY() - 73)
    -- 设置描边
    self.monsterInfoTxt:enableOutline(cc.c4b(0, 255, 0, 255), 1) 


    -- 怪物血量
    self.hpLabel        = self.studioPage["hp_text"]

    -- 怪物攻击
    self.attackLabel    = self.studioPage["attack_text"]

    -- 护甲血量
    self.armorLabel     = self.studioPage["armor_text"]

    -- 怪物移动速度
    self.moveLabel      = self.studioPage["speed_text"]

    -- 怪物血量
    self.killHpLabel        = self.studioPage["killHp_text"]


end

-- 点击了第几个按钮
function EncyclopediaStudioTest:onClickMonsterBtn(index)
    print("EncyclopediaStudioTest:onClickMonsterBtn index = "..tostring(index))

    local monsterMainID = MonsterOrder.get(index)
    local monsterConfig = MonsterProperties.get(monsterMainID)
    self.monsterConfig = monsterConfig
    
    for i = 1, 20 do
        if i ~= index then
            self.allMasks[i]:setVisible(true)
        else
            self.allMasks[i]:setVisible(false)
        end
    end



    -- 更新怪物的信息
    if monsterMainID == "100106" or monsterMainID == "100101" then
        self.monsterBigImg:setTexture("ui/Icons/monsterIcon/big/"..monsterMainID..".jpg")
    else
        self.monsterBigImg:setTexture("ui/hall/encyclopedia/monsterImg.png")
        
    end

    -- 名字
    self.monsterNameTxt:setString(monsterConfig.name)
    -- 描述
    self.monsterInfoTxt:setString(monsterConfig.text)
    -- 血量
    self.hpLabel:setString(monsterConfig.maxHp)
    -- 攻击
    self.attackLabel:setString(monsterConfig.attack)
    -- 护甲
    self.armorLabel:setString(monsterConfig.armor)
    -- 移动速度
    self.moveLabel:setString(monsterConfig.speed)
    -- 扣的血量
    self.killHpLabel:setString(monsterConfig.passValue)



end



-- 获得node页面
function EncyclopediaStudioTest:getPage()
    return self.studioNode
end



return EncyclopediaStudioTest