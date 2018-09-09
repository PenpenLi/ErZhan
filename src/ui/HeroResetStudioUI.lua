
-- 英雄洗点确认对话框

local GlobalData             = require("tools.GlobalData")
local StableGameProperties   = require("app.properties.StableGameProperties")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local HeroResetStudioUI = class("HeroResetStudioUI")

local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 第3个参数表示是通过战斗页面点击进来的，点击了第几个道具，然后要默认选中这个道具
-- heroConfig     英雄配置
-- heroStar       英雄阶级
-- heroHomePanel  英雄大厅页面
function HeroResetStudioUI:ctor(self, heroConfig, heroStar, heroHomePanel)
    print("HeroResetStudioUI:ctor")
    
    self.heroConfig = heroConfig
    self.heroStar   = heroStar
    self.heroHomePanel = heroHomePanel
    -- 重置以后可以获得多少星星
    self.canReturnStar = 0
    if heroStar == 2 then
        self.canReturnStar = 2
    elseif heroStar == 3 then
        self.canReturnStar = 6
    elseif heroStar == 4 then
        self.canReturnStar = 12
    elseif heroStar == 5 then
        self.canReturnStar = 20
    end

    self.studioPage = import("ui.HeroResetStudio").create()
    local itemStoreStudio = self.studioPage.root
    
    --local path = utils.getName("sdfdf")
    itemStoreStudio:setTouchEnabled(true)
    itemStoreStudio:setTouchSwallowEnabled(true) 

    itemStoreStudio:retain()
    itemStoreStudio:setLocalZOrder(11)

    self.studioNode = itemStoreStudio
    self.studioNode.onEnter = self:onEnter()

    -- 获得Studio中的所有控件
    self:getAllElemets()

    -- 做适配动画
    local panel = self.studioPage["panel"]
    utils.playAction(self.studioNode, panel)
end

function HeroResetStudioUI:onEnter()
    
end

-- 记录所有的控件
function HeroResetStudioUI:getAllElemets()
    -- 确认按钮
    local confirmBtn  = self.studioPage["confrimBtn"]
    confirmBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        self:onConfirmBtnClicked()
    end)
    -- 确认文字
    local confirmLab = self.studioPage["confirmLab"]
    confirmLab:setFontName(GLOBAL_FONTNAME)
    confirmLab:enableOutline(cc.c4b(0,0,0,255),2)

    -- 取消按钮
    local cancelBtn  = self.studioPage["cancelBtn"]
    cancelBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        viewMgr.hide(viewMgr.def.HERORESET_UI)
    end)
    -- 取消文字
    local cancelLab = self.studioPage["cancelLab"]
    cancelLab:setFontName(GLOBAL_FONTNAME)
    cancelLab:enableOutline(cc.c4b(0,0,0,255),2)

    -- "确定花费" 文字
    local txt1 = self.studioPage["Text_1"]
    txt1:setFontName(GLOBAL_FONTNAME)
    txt1:enableOutline(cc.c4b(0,0,0,255),2)

    -- 英雄重置需要消耗的钻石数量
    local diamondCostLab = self.studioPage["diamondCostLab"]
    diamondCostLab:setFontName(GLOBAL_FONTNAME)
    diamondCostLab:enableOutline(cc.c4b(0,0,0,255),2)
    diamondCostLab:setString(StableGameProperties.HERO_RESET_COST_DIAMOND)

    -- "重置?" 文字
    local txt3 = self.studioPage["Text_3"]
    txt3:setFontName(GLOBAL_FONTNAME)
    txt3:enableOutline(cc.c4b(0,0,0,255),2)

    -- "(提示: 本次重置返回" 文字
    local txt4 = self.studioPage["Text_4"]
    txt4:setFontName(GLOBAL_FONTNAME)
    txt4:enableOutline(cc.c4b(0,0,0,255),2)

    -- 返回多少个星星 lab
    self.returnStarLab = self.studioPage["returnStarLab"]
    self.returnStarLab:setFontName(GLOBAL_FONTNAME)
    self.returnStarLab:enableOutline(cc.c4b(0,0,0,255),2)
    self.returnStarLab:setString(self.canReturnStar)

    -- ")" 文字
    local txt6 = self.studioPage["Text_6"]
    txt6:setFontName(GLOBAL_FONTNAME)
    txt6:enableOutline(cc.c4b(0,0,0,255),2)


end

-- 点击了确认按钮
function HeroResetStudioUI:onConfirmBtnClicked()
    -- 如果当前拥有的钻石少于洗点需要的钻石，需要弹出钻石购买页面
    if GlobalData.getDiamondCount() < StableGameProperties.HERO_RESET_COST_DIAMOND then
        viewMgr.show(viewMgr.def.STORE_UI)
    else
        -- 扣除钻石，给英雄洗点
        GlobalData.addDiamondCount(0 - StableGameProperties.HERO_RESET_COST_DIAMOND)

        -- 重置英雄星阶
        GlobalData.setHeroStar(self.heroConfig.mainID, 1)
        -- 更新英雄大厅页面记录的这个英雄阶级变量
        self.heroHomePanel.selectedHeroStar = 1

        -- 增加星星
        GlobalData.resetHeroAddTotalStar(self.canReturnStar)

        -- 更新英雄大厅页面上显示的总共有几颗星星
        self.heroHomePanel.totalHasStarLabel:setString(GlobalData.getTotalStar())

        -- 发信号出去更新数据
        NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL)

        -- 隐藏重置页面
        viewMgr.hide(viewMgr.def.HERORESET_UI)
    end
end

-- 获得node页面
function HeroResetStudioUI:getPage()
    return self.studioNode
end

return HeroResetStudioUI