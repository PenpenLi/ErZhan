
-- RoadListPanel，用来显示可行走的区域

local ButtonBar = require("core.ui.ButtonBar")
local RoadListPanel = class("editor.RoadListPanel", function ()
	return nt.ui.Container:create()
end)

local LABEL_FORMAT = [[<font face="default18" color="{2}">{1}</font>]]

-- ButtonBar 用的按钮工厂
local function buttonFactory(index)
	local result = LayoutParser.createButton({
		skinScale9Grid=true,
		width=50,
		height=20,
		skin="MapEditor.Button1"
	})
	return result
end

function RoadListPanel:ctor()
	self:setSize(250, 24)

	makeSignals(self)

	self.buttonBar = ButtonBar.new(nil, buttonFactory)
	self:addChild(self.buttonBar)

	-- 偷懒一下：直接把 buttonBar.onChange 暴露出去
	self.onChange = self.buttonBar.onChange
end

function RoadListPanel:getSelectedRoad()
	return self.map:getObject(self.buttonBar.selectedData)
end

function RoadListPanel:setInfo(value)
	self.map = value
	local dp = {}
	
	local roads = table.values(self.map:getObjectsByClassId("road"))

	-- 确保默认项排到第一个
	table.sort(roads, function (a, b)
		return a:getIsDefault() and not b:getIsDefault()
	end)

	for i, road in ipairs(roads) do
		local label = road:getId()
		if (road:getIsDefault()) then
			label = label .. "*"
		end
		dp[#dp + 1] = {label=format(LABEL_FORMAT, label, road.color), data=road:getId()}
	end

	-- 增加道路
	dp[#dp + 1] = {label=format(LABEL_FORMAT, "+", "#666666"), onClick=function (who)
		who:setIsToggled(false)
		self:addRoad()
	end}

	self.buttonBar:setDataProvider(dp)
	self.buttonBar:setSelectedIndex(1, false, true)
end

function RoadListPanel:addRoad()
	self.map:newRoad()
	self:setInfo(self.map)
	self.buttonBar:setSelectedIndex(#self.buttonBar.dataProvider - 1)
end

return RoadListPanel