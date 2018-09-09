
-- 配置战斗中要用的手动技能

local SkillInFight = {}

local defines = {}

local defines = {
    "130101","130111","130121"
}

function SkillInFight.getAll()
    return clone(defines)
end

return SkillInFight
