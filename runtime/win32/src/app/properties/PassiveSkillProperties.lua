

local PassiveSkillProperties = {}

local defines = {}

------------------孙悟空被动技能----------------------
local skill = {
    mainID            = "130301",
    name_EN           = "Gale Aura",
    name_CN           = "强风光环",
    icon              = "140102",        -- 技能ICON
    typeText_EN       = "Tower BUFF",
    typeText_CN       = "箭塔状态",
    level             = 1,               -- 等级
    skillText_EN      = "The towers that near the hero within 200 pixels +$2$ attack.",
    skillText_CN      = "帕里斯周边200像素内的箭塔享受强风效果,箭塔攻击+$2$。",
    --buffs           = {"120101",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120111",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130301"] = skill

local skill = {
    mainID            = "130302",
    name_EN           = "Gale Aura",
    name_CN           = "强风光环",
    icon              = "140102",        -- 技能ICON
    typeText_EN       = "Tower BUFF",
    typeText_CN       = "箭塔状态",
    level             = 2,               -- 等级
    skillText_EN      = "The towers that near the hero within 200 pixels +$4$ attack.",
    skillText_CN      = "帕里斯周边200像素内的箭塔享受强风效果,箭塔攻击+$4$。",
    --buffs           = {"120102",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120112",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130302"] = skill

local skill = {
    mainID            = "130303",
    name_EN           = "Gale Aura",
    name_CN           = "强风光环",
    icon              = "140102",        -- 技能ICON
    typeText_EN       = "Tower BUFF",
    typeText_CN       = "箭塔状态",
    level             = 3,               -- 等级
    skillText_EN      = "The towers that near the hero within 200 pixels +$6$ attack.",
    skillText_CN      = "帕里斯周边200像素内的箭塔享受强风效果,箭塔攻击+$6$。",
    --buffs           = {"120103",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120113",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130303"] = skill

local skill = {
    mainID            = "130304",
    name_EN           = "Gale Aura",
    name_CN           = "强风光环",
    icon              = "140102",        -- 技能ICON
    typeText_EN       = "Tower BUFF",
    typeText_CN       = "箭塔BUFF",
    level             = 4,               -- 等级
    skillText_EN      = "The towers that near the hero within 200 pixels +$8$ attack.",
    skillText_CN      = "帕里斯周边200像素内的箭塔享受强风效果,箭塔攻击+$8$。",
    --buffs           = {"120104",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130304"] = skill

------------------牛魔王被动技能----------------------
local skill = {
    mainID            = "130311",
    name_EN           = "Special Gunpowder",
    name_CN           = "迅捷炮击",
    icon              = "140202",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动光环",
    level             = 1,               -- 等级
    skillText_EN      = "A passive aura. The Ancient of War that nears your hero within 235 pixels gains $5%$ more speed.",
    skillText_CN      = "被动光环,索瑞尔身边范围235像素区域内的战争古树享受快速攻击效果,炮塔攻速+$5%$",
    -- buffs          = {"120111",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120121",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130311"] = skill

local skill = {
    mainID            = "130312",
    name_EN           = "Special Gunpowder",
    name_CN           = "迅捷炮击",
    icon              = "140202",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动光环",
    level             = 2,               -- 等级
    skillText_EN      = "A passive aura. The Ancient of War that nears your hero within 235 pixels gains $10%$ more speed.",
    skillText_CN      = "被动光环,索瑞尔身边范围235像素区域内的战争古树享受快速攻击效果,炮塔攻速+$10%$",
    -- buffs          = {"120112",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120122",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130312"] = skill

local skill = {
    mainID            = "130313",
    name_EN           = "Special Gunpowder",
    name_CN           = "迅捷炮击",
    icon              = "140202",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动光环",
    level             = 3,               -- 等级
    skillText_EN      = "A passive aura. The Ancient of War that nears your hero within 235 pixels gains $15%$ more speed.",
    skillText_CN      = "被动光环,索瑞尔身边范围235像素区域内的战争古树享受快速攻击效果,炮塔攻速+$15%$",
    -- buffs          = {"120113",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120123",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130313"] = skill

local skill = {
    mainID            = "130314",
    name_EN           = "Special Gunpowder",
    name_CN           = "迅捷炮击",
    icon              = "140202",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动光环",
    level             = 4,               -- 等级
    skillText_EN      = "A passive aura. The Ancient of War that nears your hero within 235 pixels gains $20%$ more speed.",
    skillText_CN      = "被动光环,索瑞尔身边范围235像素区域内的战争古树享受快速攻击效果,炮塔攻速+$20%$",
    -- buffs            = {"120114",},      -- 这个技能给目标上的状态id,可以有多个
    area              = {"120124",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130314"] = skill

------------------铁扇公主被动技能----------------------
local skill = {
    mainID            = "130321",
    name_EN           = "Vital Strike",
    name_CN           = "寻找要害",
    icon              = "140303",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动BUFF",
    level             = 1,               -- 等级
    skillText_EN      = "The power of crit +$50$% forever.",
    skillText_CN      = "永久性暴击威力+$50$%",
    buffs            = {"220301",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130321"] = skill

local skill = {
    mainID            = "130322",
    name_EN           = "Vital Strike",
    name_CN           = "寻找要害",
    icon              = "140303",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 2,               -- 等级
    skillText_EN      = "The power of crit +$100$% forever.",
    skillText_CN      = "永久性暴击威力+$100$%",
    buffs            = {"220302",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130322"] = skill

local skill = {
    mainID            = "130323",
    name_EN           = "Vital Strike",
    name_CN           = "寻找要害",
    icon              = "140303",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 3,               -- 等级
    skillText_EN      = "The power of crit +$150$% forever.",
    skillText_CN      = "永久性暴击威力+$150$%",
    buffs            = {"220303",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130323"] = skill

------------------鹏魔王被动技能----------------------
local skill = {
    mainID            = "130331",
    name_EN           = "Time Is Money",
    name_CN           = "时间金钱",
    icon              = "140603",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 1,               -- 等级
    skillText_EN      = "When Kael is in the line of duty, you will gain $10%$ accomplish speed bonus and $30%$ coin bonus.",
    skillText_CN      = "凯尔参与执行任务时,任务完成速度提升$10%$,额外获得$30%$金币收益。",
    buffs             = {"220501",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130331"] = skill

local skill = {
    mainID            = "130332",
    name_EN           = "Time Is Money",
    name_CN           = "时间金钱",
    icon              = "140603",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 2,               -- 等级
    skillText_EN      = "When Kael is in the line of duty, you will gain $20%$ accomplish speed bonus and $50%$ coin bonus.",
    skillText_CN      = "凯尔参与执行任务时,任务完成速度提升$20%$,额外获得$50%$金币收益。",
    buffs             = {"220502",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130332"] = skill

local skill = {
    mainID            = "130333",
    name_EN           = "Time Is Money",
    name_CN           = "时间金钱",
    icon              = "140603",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 1,               -- 等级
    skillText_EN      = "When Kael is in the line of duty, you will gain $30%$ accomplish speed bonus and $70%$ coin bonus.",
    skillText_CN      = "凯尔参与执行任务时,任务完成速度提升$30%$,额外获得$70%$金币收益。",
    buffs            = {"220503",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130333"] = skill

------------------自然馈赠被动技能----------------------
local skill = {
    mainID            = "130341",
    name_EN           = "Gifts of Nature",
    name_CN           = "自然馈赠",
    icon              = "140703",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 1,               -- 等级
    skillText_EN      = "Passive skill. +$30%$ treatment effects.",
    skillText_CN      = "永久被动,治疗效果+$30%$。",
    buffs            = {"220601",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130341"] = skill

local skill = {
    mainID            = "130342",
    name_EN           = "Gifts of Nature",
    name_CN           = "自然馈赠",
    icon              = "140703",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 2,               -- 等级
    skillText_EN      = "Passive skill. +$60%$ treatment effects.",
    skillText_CN      = "永久被动,治疗效果+$60%$。",
    buffs            = {"220602",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130342"] = skill

local skill = {
    mainID            = "130343",
    name_EN           = "Gifts of Nature",
    name_CN           = "自然馈赠",
    icon              = "140703",        -- 技能ICON
    typeText_EN       = "Passive Aura",
    typeText_CN       = "被动状态",
    level             = 3,               -- 等级
    skillText_EN      = "Passive skill. +$100%$ treatment effects.",
    skillText_CN      = "永久被动,治疗效果+$100%$。",
    buffs             = {"220603",},      -- 这个技能给目标上的状态id,可以有多个
    --area            = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130343"] = skill

------------------箭塔A被动技能----------------------
local skill = {
    mainID            = "230101",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    icon              = "",        -- 技能ICON
    level             = 1,               -- 等级
    skillText_EN      = "Shooting frequency +3%",
    skillText_CN      = "箭矢射击频率+3%",
    buffs            = {"220701",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230101"] = skill

local skill = {
    mainID            = "230102",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    icon              = "",        -- 技能ICON
    level             = 1,               -- 等级
    skillText_EN      = "Shooting frequency +6%",
    skillText_CN      = "箭矢射击频率+6%",
    buffs            = {"220702",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230102"] = skill

local skill = {
    mainID            = "230103",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    icon              = "",        -- 技能ICON
    level             = 1,               -- 等级
    skillText_EN      = "Shooting frequency +9%",
    skillText_CN      = "箭矢射击频率+9%",
    buffs            = {"220703",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230103"] = skill

------------------软猬甲被动技能----------------------
local skill = {
    mainID            = "130351",
    name_EN           = "Money Talks",
    name_CN           = "纸金迷醉",
    icon              = "",        -- 技能ICON
    level             = 1,               -- 等级
    skillText_EN      = "Reflect 15 damage when under attack.",
    skillText_CN      = "受到攻击时反弹15点伤害",
    buffs             = {"220901",},      -- 这个技能给目标上的状态id,可以有多个
    --area            = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["130351"] = skill



------------------炮塔A被动技能----------------------
local skill = {
    mainID            = "230501",
    name_EN           = "Burst",
    name_CN           = "大爆裂",
    icon              = "",        -- 技能ICON
    level             = 1,               -- 等级
    skillText_EN      = "The explosion scope +10%",
    skillText_CN      = "炮塔子弹的爆裂范围+10%",
    buffs            = {"220801",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230501"] = skill

local skill = {
    mainID            = "230502",
    name_EN           = "Burst",
    name_CN           = "大爆裂",
    icon              = "",        -- 技能ICON
    level             = 2,               -- 等级
    skillText_EN      = "The explosion scope +20%",
    skillText_CN      = "炮塔子弹的爆裂范围+20%",
    buffs            = {"220802",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230502"] = skill

local skill = {
    mainID            = "230503",
    name_EN           = "Burst",
    name_CN           = "大爆裂",
    icon              = "",        -- 技能ICON
    level             = 3,               -- 等级
    skillText_EN      = "The explosion scope +30%",
    skillText_CN      = "炮塔子弹的爆裂范围+30%",
    buffs            = {"220803",},      -- 这个技能给目标上的状态id,可以有多个
    --area              = {"120114",},      -- 这个技能给目标上的区域id,可以有多个
}
defines["230503"] = skill


function PassiveSkillProperties.get(id)
    -- print("PassiveSkillProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return PassiveSkillProperties