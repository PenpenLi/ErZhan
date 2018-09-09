
-- Damage 类，用来计算伤害，暴击 miss
local Damage = class("Damage")

function Damage:ctor()
	-- 伤害值
	self.value = 0

	-- 是否暴击
	self.isCri = false

	-- 是否 miss
	self.isMiss = false
end

return Damage