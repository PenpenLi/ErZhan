
-- 弓箭手拼图页面

local GlobalData             = require("tools.GlobalData")
local ManualSkillProperties  = require("app.properties.ManualSkillProperties")
local AutoSkillProperties    = require("app.properties.AutoSkillProperties")
local PassiveSkillProperties = require("app.properties.PassiveSkillProperties")

local JigsawStudioUI = class("JigsawStudioUI")

local scheduler = cc.Director:getInstance():getScheduler()
local size = cc.size(240,280)
local orderHeros = GlobalData.getHeroOrder()

-- 加载studio导出的选关页面
-- 只有在第一次显示这个页面的时候，worldHall 才会有值
function JigsawStudioUI:ctor(self, worldHall)
    
    -- 关闭页面时候需要显示的回调函数
    self.worldHall = worldHall

    self.studioPage = import("ui.JigsawStudio").create()
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

function JigsawStudioUI:onEnter()
    
end

-- 记录所有的控件
function JigsawStudioUI:getAllElemets()
    print("JigsawStudioUI:getAllElemets()")

    -- 关闭按钮
    local closeBtn  = self.studioPage["closeBtn"]
    closeBtn:addClickEventListener(function (params )
        AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
        viewMgr.hide(viewMgr.def.JIGSAW_UI)

        -- self.worldHall ~= nil 表示第一次关闭这个页面
        if self.worldHall then
            self.worldHall:newGuide_1()
        end
    end)

    -- 3个英雄技能按钮
    self.skillBtns = {}
    for i = 1, 3 do
        self.skillBtns[i] = self.studioPage["skillBtn"..tostring(i)]

        -- self.worldHall ~= nil 则说明是第一次调用这个页面
        -- 需要给3个技能icon上面加一个感叹号
        if self.worldHall then
            local img = display.newSprite("ui/hall/wordMap/handTips.png")
                :addTo(self.skillBtns[i])
                :setScale(0.8)
                :pos(80, 80)

            local jump_1 = cc.JumpTo:create(0.8,cc.p(img:getPositionX(),img:getPositionY()),15,2)
            local delay   = cc.DelayTime:create(0.25)
            local seq = cc.Sequence:create(jump_1,delay)
            local action = cc.RepeatForever:create(seq)
            img:runAction(action)
            self.skillBtns[i].img = img
        end

        self.skillBtns[i]:addClickEventListener(function (params )
            AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
            self:onClickSkillBtn(i)
        end)
    end

    -- 获得6块拼图，
    self.pingTuImgs = {}
    local lvStar
    for i = 1, 6 do
        self.pingTuImgs[i] = self.studioPage["pt"..tostring(i)]
        self.pingTuImgs[i]:setVisible(false)

        -- 判定一下前6关是不是通关了
        lvStar = GlobalData.getLvStar(i)
        if lvStar[1][1] > 0 or lvStar[1][2] > 0 then
            self.pingTuImgs[i]:setVisible(true)

            -- 如果通关第6关了，然后显示这个页面，那么需要显示已领取文字
            if i == 6 then
                -- 英雄Icon
                local heroIcon = self.studioPage["heroIcon_12"]
                -- 当前波数
                local finishLab = cc.ui.UILabel.new({
                    UILabelType = 2,
                    text = "已领取",
                    align = cc.ui.TEXT_ALIGN_RIGHT,
                    font = GLOBAL_FONTNAME,
                    color = cc.c3b(255,0,0),
                    size = 48,
                    x = 170,
                    y = 20,
                }):align(display.CENTER_RIGHT)
                :addTo(heroIcon)
                finishLab:enableOutline(cc.c4b(71, 40,0,255), 2)

                -- 新通关了第6关才会显示拼图页面，之后要重置新通关了第几关数据
                GlobalData.setNewThroughLv(0)
            end
        end
    end


end

-- 点击英雄技能按钮
function JigsawStudioUI:onClickSkillBtn(skillIndex)
    print("JigsawStudioUI:onClickSkillBtn skillIndex = "..tostring(skillIndex))

    -- 技能配置
    local skillConfig
    if skillIndex == 1 then
        skillConfig = ManualSkillProperties.get("130131")
    elseif skillIndex == 2 then
        skillConfig = AutoSkillProperties.get("130231")
    elseif skillIndex == 3 then
        skillConfig = AutoSkillProperties.get("130241")
    end

    if self.skillBtns[skillIndex].img then
        self.skillBtns[skillIndex].img:removeSelf()
        self.skillBtns[skillIndex].img = nil
    end

    viewMgr.show(viewMgr.def.TIPS_UI,1, skillConfig)

end

-- 获得node页面
function JigsawStudioUI:getPage()
    return self.studioNode
end

return JigsawStudioUI