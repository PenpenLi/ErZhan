

local GlobalData             = require("tools.GlobalData")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local GetNewHeroUI = class("GetNewHeroUI")

local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
function GetNewHeroUI:ctor(self, heroID, finc)
    
    self.heroID = heroID

    self.studioPage = import("ui.GetNewHeroStudio").create()
    local itemStoreStudio = self.studioPage.root
    
    --local path = utils.getName("sdfdf")
    itemStoreStudio:setTouchEnabled(true)
    itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()
    self.studioNode:setOpacity(0)
    
    local panel = self.studioPage["panel"]
    panel:setTouchEnabled(false)
    local function BackFunc()
        viewMgr.hide(viewMgr.def.GETNEWHERO_UI)
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        if finc then
            finc()
        end
        return
    end
    panel:addClickEventListener(BackFunc)
    local fadeIn = cc.FadeIn:create(0.5)
    local function actBack(args)
        panel:setTouchEnabled(true)
    end
    self.studioNode:runAction(cc.Sequence:create(fadeIn,cc.CallFunc:create(actBack)))
    -- 获得Studio中的所有控件
    self:getAllElemets()


    -- 做适配动画
    utils.playAction(self.studioNode, panel)
end

function GetNewHeroUI:onEnter()
    
end

-- 记录所有的控件
function GetNewHeroUI:getAllElemets()
    -- 英雄头像背景框
    local heroIconBg = self.studioPage["heroIconBg_3"]
    local effAniData   = require("app.properties.EffectProperties")
    EffectAniCache.addEffectAniCache("ui_gethero_1",effAniData.ui_gethero_1)
    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_gethero_1", true)
    heroIconBg:addChild(effect)
    effect:setPosition(288/2 -2, 297/2) -- offsetY + 50)



    -- 英雄 icon
    self.heroIcon = self.studioPage["heroIcon"]

    -- 英雄名字图片
    self.heroNameImg = self.studioPage["heroNameImg"]

    -- 点击继续文字
    self.continueLab = self.studioPage["continueLab"]
    self.continueLab:setFontName(GLOBAL_FONTNAME)
    self.continueLab:setFontSize(32)
    self.continueLab:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    local fade1 = cc.FadeTo:create(0.5, 100)
    local fade2 = cc.FadeTo:create(0.3, 255)
    local seq_2 = cc.Sequence:create(fade1, fade2)
    local fadeAction = cc.RepeatForever:create(seq_2)
    -- local action_1 = cc.Spawn:create(rotateAction1, rotateAction2)

    self.continueLab:runAction(fadeAction)

    self:updateData(self.heroID)

end

-- 获得了那个英雄，要更新这个页面上显示的数据
function GetNewHeroUI:updateData(heroID)
    -- 英雄icon
    self.heroIcon:setTexture("ui/Icons/heroIcon/"..tostring(heroID)..".png")
    -- 英雄名字
    self.heroNameImg:setTexture("ui/hall/heroHome/heroName/"..tostring(heroID).."_CN.png")
end

-- 获得node页面
function GetNewHeroUI:getPage()
    return self.studioNode
end

return GetNewHeroUI