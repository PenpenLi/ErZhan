local Scheduler = require("framework.scheduler")

local Container = class("ui.Container", function ()
	return display.Container:create()
end)

function Container:ctor()

	self.mShowFuncs = {}
    self.mShowIndex = 0

	self:onAdd(function() self:onEnter() end)
    self:onRemove(function() self:onExit() end)

end

function Container:onEnter()
	self:exeShowFunc()
end

function Container:onExit()
	if self.showTickHandler then 
		Scheduler.unscheduleGlobal(self.showTickHandler) 
	end
	self.showTickHandler = nil
end

function Container:addFuncList(callback)
	self.mShowFuncs[#self.mShowFuncs + 1] = callback
end

function Container:exeShowFunc()
	self.showTickHandler = Scheduler.scheduleUpdateGlobal(function(dt) self:showTick(dt) end)
end

function Container:showTick(dt)

	if (tolua.isnull(self)) then
		Scheduler.unscheduleGlobal(self.showTickHandler)
		return
	end

	self.mShowIndex = self.mShowIndex + 1

	if #self.mShowFuncs == 0 or self.mShowIndex > #self.mShowFuncs then
		self.mShowFuncs = {}
		self.mShowIndex = 0

		Scheduler.unscheduleGlobal(self.showTickHandler)
		self.showTickHandler = nil
	else
		self.mShowFuncs[self.mShowIndex]()
	end
end


return Container