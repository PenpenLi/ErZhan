
-- 点击一个坑位后，弹出的选择造塔界面

local BattleDataManager = require("app.map.data.BattleDataManager")
local SkillRangePanel = class("SkillRangePanel", function()
    return display.newNode()
end)

-- 距边界小于该值时，往另一侧靠
local PADDING = 120

-- 总是与 StandRange 空开这些距离
local OFFSET = 100

function SkillRangePanel:ctor()
	print("SkillRangePanel:ctor()")
	self:setContentSize(cc.size(100,100))
	self:setVisible(false)

    -- 在地图放大了的屏幕上，战斗UI需要放大显示
    if GLOBAL_FIGHT_UI_SCALE ~= 1 then
        self:setScale(GLOBAL_FIGHT_UI_SCALE)
    end
end

function SkillRangePanel:onClickTowerBtn(params)
	-- body
	print("SkillRangePanel:onClickTowerBtn(params)")

end

function SkillRangePanel:show(skillRange)
    -- print("SkillRangePanel:show()")
    self.view = display.newNode()--为了处理在消失后删除节点又不影响tick，保留初始节点，使用新节点
    self:addChild(self.view)
    self:setVisible(true)

    self.view:setPosition(skillRange.x_,skillRange.y_)
    self.skillIds = skillRange.skillId_
    local distX = {0,0,0}
    local distY = {0,0,0}

    if self.skillIds and #self.skillIds == 1 then 
    elseif #self.skillIds == 2 then 
        distX = {-100,100,0}
    elseif #self.skillIds ==3 then 
        distX = {-100,100,0}
        distY = {100,100,-100} 
    end
    for i, v in pairs(self.skillIds) do
        local imageName = "npc/gear/gear001.png"
        local skillId = v
        local button = cc.ui.UIPushButton.new(imageName)
            :onButtonClicked(function (...)
                self:onClickBuildBtn(...)
                self:hide()
            end)
            button.skillId = v
            button.skillRange = skillRange
        self.view:addChild(button)
        button:setPosition(distX[i],distY[i])
    end
end

-- 点击按钮后释放对应的技能
function SkillRangePanel:onClickBuildBtn(params)
    local skillId = params.target.skillId
    local skillRange = params.target.skillRange
    -- print("skillId = "..tostring(skillId))
    self.rt:releaseRangeSkill(skillRange, skillId)
end

function SkillRangePanel:hide()
	print("function SkillRangePanel:hide()")
	--self.towerBtns={}
	if self.view then 
		self.view:removeSelf()
		self.view = nil
	end
	self.towerBtns = nil
	self.prepareToHide = false
	self:setVisible(false)
	-- self.prepareToHide = true --由于在点击空白进行删除时，直接在这里删除pushbutton会导致touch事件分发错误，所以在下一帧删除
	print("function SkillRangePanel:hide() done")
end

function SkillRangePanel:tick(dt)
	-- if self.prepareToHide == true then --处理删除
	-- 	if self.view then 
	-- 		self.view:removeSelf()
	-- 		self.view = nil
	-- 	end
	-- 	self.towerBtns = nil
	-- 	self.prepareToHide = false
	-- 	self:setVisible(false)
	-- end
end

-- 设置 MapRuntime
function SkillRangePanel:setRuntime(rt)
    -- print("TowerSelectPanel:setRuntime")
    self.rt = rt
end

return SkillRangePanel