

local ManualSkillProperties = {}

local defines = {}

------------------孙悟空手技----------------------
local skill = {
    mainID            = "130101",
    name_EN           = "Summon Elemental",
    name_CN           = "召唤元素",
    icon              = "140101",
    typeText_EN       = "Summon manually",
    typeText_CN       = "手动召唤",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110201_summon",    -- 释放光效
    sound             = "Sunelemental",     -- 技能释放音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 1,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,              -- 手指范围,单位:像素
    skillText_EN      = "Summon 2 elementals in designated area（Life=$35$, Attack=$6$, Defence=$3$,Speed=$80$）, they will disappear after 20 seconds or killed.",
    skillText_CN      = "指定区域幻化出2个小元素（生命=$35$,攻击=$6$,防御=$3$,移速=$80$）,小元素阵亡或者存在20秒后消失。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170101", 2},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130101"] = skill -- 技能130101

local skill = {
    mainID            = "130102",
    name_EN           = "Summon Elemental",
    name_CN           = "召唤元素",
    icon              = "140101",
    typeText_EN       = "Summon manually",
    typeText_CN       = "手动召唤",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110201_summon",    -- 释放光效
    sound             = "Sunelemental",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型,0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 1,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素0秒后消失。",
    skillText_EN      = "Summon 2 elementals in designated area（Life=$45$, Attack=$10$, Defence=$5$,Speed=$80$）, they will disappear after 20 seconds or killed.",
    skillText_CN      = "指定区域幻化出2个小元素（生命=$45$,攻击=$10$,防御=$5$,移速=$80$）,小元素阵亡或者存在20秒后消失。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170102", 2},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130102"] = skill

local skill = {
    mainID            = "130103",
    name_EN           = "Summon Elemental",
    name_CN           = "召唤元素",
    icon              = "140101",
    typeText_EN       = "Summon manually",
    typeText_CN       = "手动召唤",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110201_summon",    -- 释放光效
    sound             = "Sunelemental",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 1,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 2 elementals in designated area（Life=$55$, Attack=$16$, Defence=$9$,Speed=$80$）, they will disappear after 20 seconds or killed.",
    skillText_CN      = "指定区域幻化出2个小元素（生命=$55$,攻击=$16$,防御=$9$,移速=$80$）,小元素阵亡或者存在20秒后消失。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170103", 2},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130103"] = skill

local skill = {
    mainID            = "130104",
    name_EN           = "Summon Elemental",
    name_CN           = "召唤元素",
    icon              = "140101",
    typeText_EN       = "Summon manually",
    typeText_CN       = "手动召唤",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110201_summon",    -- 释放光效
    sound             = "Sunelemental",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 1,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 2 elementals in designated area（Life=$60$, Attack=$24$, Defence=$15$,Speed=$80$）, they will disappear after 20 seconds or killed.",
    skillText_CN      = "指定区域幻化出2个小元素（生命=$60$,攻击=$24$,防御=$15$,移速=$80$）,小元素阵亡或者存在20秒后消失。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170104", 2},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130104"] = skill -- 技能130101

local skill = {
    mainID            = "130105",
    name_EN           = "Summon Elemental",
    name_CN           = "召唤元素",
    icon              = "140101",
    typeText_EN       = "Summon manually",
    typeText_CN       = "手动召唤",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "eff_110201_summon",    -- 释放光效
    sound             = "Sunelemental",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型,0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 1,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 2 elementals in designated area（Life=$75$, Attack=$32$, Defence=$24$,Speed=$80$）, they will disappear after 20 seconds or killed.",
    skillText_CN      = "指定区域幻化出2个小元素（生命=$75$,攻击=$32$,防御=$24$,移速=$80$）,小元素阵亡或者存在20秒后消失。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170105", 2},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130105"] = skill -- 技能130101

------------------牛魔王手技----------------------
local skill = {
    mainID            = "130111",
    name_EN           = "Thunderclap",
    name_CN           = "雷霆之击",
    icon              = "140201",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Thunderstrike",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Strike at most 3 enemies within 120 pixels. Deal $480%$ damage and $40$ more damage.",
    skillText_CN      = "在指定区进行范围打击,对范围45像素内最多3敌人造成$480%$攻击附加$40$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150602",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {48000, 1, 40},  -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130111"] = skill

local skill = {
    mainID            = "130112",
    name_EN           = "Thunderclap",
    name_CN           = "雷霆之击",
    icon              = "140201",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Thunderstrike",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Strike at most 3 enemies within 120 pixels. Deal $480%$ damage and $50$ more damage.",
    skillText_CN      = "在指定区进行范围打击,对范围45像素内最多3敌人造成$480%$攻击附加$50$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150602",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {48000, 1, 50},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130112"] = skill

local skill = {
    mainID            = "130113",
    name_EN           = "Thunderclap",
    name_CN           = "雷霆之击",
    icon              = "140201",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Thunderstrike",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Strike at most 3 enemies within 120 pixels. Deal $480%$ damage and $65$ more damage.",
    skillText_CN      = "在指定区进行范围打击,对范围45像素内最多3敌人造成$480%$攻击附加$65$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150602",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {48000, 1, 65},  -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130113"] = skill

local skill = {
    mainID            = "130114",
    name_EN           = "Thunderclap",
    name_CN           = "雷霆之击",
    icon              = "140201",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Thunderstrike",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Strike at most 3 enemies within 120 pixels. Deal $480%$ damage and $85$ more damage.",
    skillText_CN      = "在指定区进行范围打击,对范围45像素内最多3敌人造成$480%$攻击附加$85$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150602",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {48000, 1, 85},  -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130114"] = skill

local skill = {
    mainID            = "130115",
    name_EN           = "Thunderclap",
    name_CN           = "雷霆之击",
    icon              = "140201",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Thunderstrike",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Strike at most 3 enemies within 120 pixels. Deal $480%$ damage and $110$ more damage.",
    skillText_CN      = "在指定区进行范围打击,对范围45像素内最多3敌人造成$480%$攻击附加$110$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150602",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {48000, 1, 110},  -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130115"] = skill

------------------铁扇公主手技----------------------
local skill = {
    mainID            = "130121",
    name_EN           = "Retard Storm",
    name_CN           = "减速风暴",
    icon              = "140301",
    typeText_EN       = "Manual Trap",
    typeText_CN       = "手动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Storm_1",     -- 音效
    weatherValue      = {10000, 10000, 15000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 65000,           -- 技能冷却CD
    CDplace           = 5,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 150,             -- 手指范围,单位:像素
    skillText_EN      = "Unleash a storm within 150 pixels for $12$ seconds in designated area, the passing enemy speed $-50%$ and suffer at most $24$ damage over time.",
    skillText_CN      = "在指定地点释放出一片范围150像素持续$12$秒的龙卷风区域,途径的敌人移速-50%并持续受到伤害,最多$24$点。",
    weatherAddition_EN= "Damage increase slightly when rainy.",
    weatherAddition_CN= "雨天时伤害$微量$加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "0",             -- 子弹类型, 1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "120101", 1, 12000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130121"] = skill

local skill = {
    mainID            = "130122",
    name_EN           = "Retard Storm",
    name_CN           = "减速风暴",
    icon              = "140301",
    typeText_EN       = "Manual Trap",
    typeText_CN       = "手动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Storm_1",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 65000,           -- 技能冷却CD
    CDplace           = 5,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 150,             -- 手指范围,单位:像素
    skillText_EN      = "Unleash a storm within 150 pixels for $14$ seconds in designated area, the passing enemy speed $-50%$ and suffer at most $35$ damage over time.",
    skillText_CN      = "在指定地点释放出一片范围150像素持续$14$秒的龙卷风区域,途径的敌人移速-50%并持续受到伤害,最多$35$点。",
    weatherAddition_EN= "When it's rainy, the damage will increase slightly.",
    weatherAddition_CN= "雨天时伤害$少量$加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "120102", 1, 14000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130122"] = skill

local skill = {
    mainID            = "130123",
    name_EN           = "Retard Storm",
    name_CN           = "减速风暴",
    icon              = "140301",
    typeText_EN       = "Manual Trap",
    typeText_CN       = "手动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Storm_1",     -- 音效
    weatherValue      = {10000, 10000, 25000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 65000,           -- 技能冷却CD
    CDplace           = 5,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 150,             -- 手指范围,单位:像素
    skillText_EN      = "Unleash a storm within 150 pixels for $16$ seconds in designated area, the passing enemy speed $-50%$ and suffer at most $48$ damage over time.",
    skillText_CN      = "在指定地点释放出一片范围150像素持续$16$秒的龙卷风区域,途径的敌人移速-50%并持续受到伤害,最多$48$点。",
    weatherAddition_EN= "When it's rainy, the damage will increase slightly.",
    weatherAddition_CN= "雨天时伤害$中量$加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "120103", 1, 16000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130123"] = skill

local skill = {
    mainID            = "130124",
    name_EN           = "Retard Storm",
    name_CN           = "减速风暴",
    icon              = "140301",
    typeText_EN       = "Manual Trap",
    typeText_CN       = "手动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Storm_1",     -- 音效
    weatherValue      = {10000, 10000, 30000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 65000,           -- 技能冷却CD
    CDplace           = 5,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 150,             -- 手指范围,单位:像素
    skillText_EN      = "Unleash a storm within 150 pixels for $18$ seconds in designated area, the passing enemy speed $-50%$ and suffer at most $63$ damage over time.",
    skillText_CN      = "在指定地点释放出一片范围150像素持续$18$秒的龙卷风区域,途径的敌人移速-50%并持续受到伤害,最多$63$点。",
    weatherAddition_EN= "When it's rainy, the damage will increase slightly.",
    weatherAddition_CN= "雨天时伤害$大量$加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "120104", 1, 18000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130124"] = skill

local skill = {
    mainID            = "130125",
    name_EN           = "Retard Storm",
    name_CN           = "减速风暴",
    icon              = "140301",
    typeText_EN       = "Manual Trap",
    typeText_CN       = "手动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Storm_1",     -- 音效
    weatherValue      = {10000, 10000, 35000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 65000,           -- 技能冷却CD
    CDplace           = 5,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 150,             -- 手指范围,单位:像素
    skillText_EN      = "Unleash a storm within 150 pixels for $20$ seconds in designated area, the passing enemy speed $-50%$ and suffer at most $80$ damage over time.",
    skillText_CN      = "在指定地点释放出一片范围150像素持续$20$秒的龙卷风区域,途径的敌人移速-50%并持续受到伤害,最多$80$点。",
    weatherAddition_EN= "When it's rainy, the damage will increase slightly.",
    weatherAddition_CN= "雨天时伤害$巨量$加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --bulletType        = "",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "120105", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130125"] = skill

------------------玉面狐狸手技----------------------
local skill = {
    mainID            = "130131",
    name_EN           = "Set Traps",
    name_CN           = "天罗地网",
    icon              = "140401",
    typeText_EN       = "Manual Control",
    typeText_CN       = "手动控制",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Nets",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 7,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 40,             -- 手指范围,单位:像素
    skillText_EN      = "Trap a flying enemy within $40$ pixels. Get it down from the sky and stun it with $20%$ more and $5$ damage per second for 3 seconds.",
    skillText_CN      = "将手指范围$40$像素区域内的飞行敌人击落地面,并且陷入昏迷3秒,期间每秒造成$20%$攻击附加$5$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150502",            -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200101"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130131"] = skill

local skill = {
    mainID            = "130132",
    name_EN           = "Set Traps",
    name_CN           = "天罗地网",
    icon              = "140401",
    typeText_EN       = "Manual Control",
    typeText_CN       = "手动控制",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Nets",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 7,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 45,             -- 手指范围,单位:像素
    skillText_EN      = "Trap a flying enemy within $45$ pixels. Get it down from the sky and stun it with $24%$ more and $10$ damage per second for 3 seconds.",
    skillText_CN      = "将手指范围$45$像素区域内的飞行敌人击落地面,并且陷入昏迷3秒,期间每秒造成$24%$攻击附加$10$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150503",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200102"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130132"] = skill

local skill = {
    mainID            = "130133",
    name_EN           = "Set Traps",
    name_CN           = "天罗地网",
    icon              = "140401",
    typeText_EN       = "Manual Control",
    typeText_CN       = "手动控制",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Nets",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 7,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 50,             -- 手指范围,单位:像素
    skillText_EN      = "Trap a flying enemy within $50$ pixels. Get it down from the sky and stun it with $28%$ more and $15$ damage per second for 3 seconds.",
    skillText_CN      = "将手指范围$50$像素区域内的飞行敌人击落地面,并且陷入昏迷3秒,期间每秒造成$28%$攻击附加$15$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150504",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200103"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130133"] = skill

local skill = {
    mainID            = "130134",
    name_EN           = "Set Traps",
    name_CN           = "天罗地网",
    icon              = "140401",
    typeText_EN       = "Manual Control",
    typeText_CN       = "手动控制",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Nets",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 7,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 55,             -- 手指范围,单位:像素
    skillText_EN      = "Trap a flying enemy within $55$ pixels. Get it down from the sky and stun it with $30%$ more and $20$ damage per second for 3 seconds.",
    skillText_CN      = "将手指范围$55$像素区域内的飞行敌人击落地面,并且陷入昏迷3秒,期间每秒造成$30%$攻击附加$20$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150505",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200104"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130134"] = skill

local skill = {
    mainID            = "130135",
    name_EN           = "Set Traps",
    name_CN           = "天罗地网",
    icon              = "140401",
    typeText_EN       = "Manual Control",
    typeText_CN       = "手动控制",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Nets",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 7,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Trap a flying enemy within $60$ pixels. Get it down from the sky and stun it with $32%$ more and $25$ damage per second for 3 seconds.",
    skillText_CN      = "将手指范围$60$像素区域内的飞行敌人击落地面,并且陷入昏迷3秒,期间每秒造成$32%$攻击附加$25$点伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150506",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200105"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130135"] = skill

------------------蛟魔王手技----------------------
local skill = {
    mainID            = "130141",
    name_EN           = "Wrathful Deity",
    name_CN           = "明王忿化",
    icon              = "140501",
    typeText_EN       = "Dispel Manually",
    typeText_CN       = "手动驱散",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Shine",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 9,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 100,             -- 手指范围,单位:像素
    skillText_EN      = "Extinguish enemies's BUFFs in designated area within $70$ pixels.Cooldown: $30$ seconds.",
    skillText_CN      = "驱散指定范围100像素区域内最多5个敌人身上有利BUFF,并有$55%$概率造成$沙特当前生命*50%$真实伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150515",         -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
      {5500, "200106"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130141"] = skill

local skill = {
    mainID            = "130142",
    name_EN           = "Wrathful Deity",
    name_CN           = "明王忿化",
    icon              = "140501",
    typeText_EN       = "Dispel Manually",
    typeText_CN       = "手动驱散",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Shine",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 9,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 100,             -- 手指范围,单位:像素
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    skillText_EN      = "Extinguish enemies's BUFFs in designated area within $80$ pixels.Cooldown: $25$ seconds.",
    skillText_CN      = "驱散指定范围100像素区域内最多5个敌人身上有利BUFF,并有$60%$概率造成$沙特当前生命*50%$真实伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150516",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
      {6000, "200107"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130142"] = skill

local skill = {
    mainID            = "130143",
    name_EN           = "Wrathful Deity",
    name_CN           = "明王忿化",
    icon              = "140501",
    typeText_EN       = "Dispel Manually",
    typeText_CN       = "手动驱散",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Shine",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 9,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 100,             -- 手指范围,单位:像素
    skillText_EN      = "Extinguish enemies's BUFFs in designated area within $90$ pixels.Cooldown: $20$ seconds.",
    skillText_CN      = "驱散指定范围100像素区域内最多5个敌人身上有利BUFF,并有$65%$概率造成$沙特当前生命*50%$真实伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150517",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
      {6500, "200108"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130143"] = skill

local skill = {
    mainID            = "130144",
    name_EN           = "Wrathful Deity",
    name_CN           = "明王忿化",
    icon              = "140501",
    typeText_EN       = "Dispel Manually",
    typeText_CN       = "手动驱散",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Shine",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 9,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 100,             -- 手指范围,单位:像素
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    skillText_EN      = "Extinguish enemies's BUFFs in designated area within $100$ pixels.Cooldown: $15$ seconds.",
    skillText_CN      = "驱散指定范围100像素区域内最多5个敌人身上有利BUFF,并有$70%$概率造成$沙特当前生命*50%$真实伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150518",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
      {7000, "200109"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130144"] = skill

local skill = {
    mainID            = "130145",
    name_EN           = "Wrathful Deity",
    name_CN           = "明王忿化",
    icon              = "140501",
    typeText_EN       = "Dispel Manually",
    typeText_CN       = "手动驱散",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Shine",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 9,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 100,             -- 手指范围,单位:像素
    skillText_EN      = "Extinguish enemies's BUFFs in designated area within $110$ pixels.Cooldown: $10$ seconds.",
    skillText_CN      = "驱散指定范围100像素区域内最多5个敌人身上有利BUFF,并有$75%$概率造成$沙特当前生命*50%$真实伤害。",
    weatherAddition_EN= "",
    weatherAddition_CN= "",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150519",              -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {7500, "200110"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130145"] = skill

------------------鹏魔王手技----------------------
local skill = {
    mainID            = "130151",
    name_EN           = "Money For Safety",
    name_CN           = "花钱消灾",
    icon              = "140601",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Kenkonitteki_1",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 15000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 23,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 30,             -- 手指范围,单位:像素
    skillText_EN      = "Throw 50% coins and deal $60%$ damage to all enemies within 30 pixels.",
    skillText_CN      = "将50%金币砸向指定30像素区域内的所有目标,造成相当$金币*60%$伤害。",
    weatherAddition_EN= "Damage increase sharply when windy",
    weatherAddition_CN= "风天时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150605",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {3000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130151"] = skill

local skill = {
    mainID            = "130152",
    name_EN           = "Money For Safety",
    name_CN           = "花钱消灾",
    icon              = "140601",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Kenkonitteki_1",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 15000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 23,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 30,              -- 手指范围,单位:像素
    skillText_EN      = "Throw 50% coins and deal $65%$ damage to all enemies within 30 pixels.",
    skillText_CN      = "将50%金币砸向指定30像素区域内的所有目标,造成相当$金币*65%$伤害。",
    weatherAddition_EN= "Damage increase sharply when windy",
    weatherAddition_CN= "风天时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150606",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {3250, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130152"] = skill

local skill = {
    mainID            = "130153",
    name_EN           = "Money For Safety",
    name_CN           = "花钱消灾",
    icon              = "140601",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Kenkonitteki_1",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 15000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 23,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 30,              -- 手指范围,单位:像素
    skillText_EN      = "Throw 50% coins and deal $70%$ damage to all enemies within 30 pixels.",
    skillText_CN      = "将50%金币砸向指定30像素区域内的所有目标,造成相当$金币*70%$伤害。",
    weatherAddition_EN= "Damage increase sharply when windy",
    weatherAddition_CN= "风天时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150607",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {3500, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130153"] = skill

local skill = {
    mainID            = "130154",
    name_EN           = "Money For Safety",
    name_CN           = "花钱消灾",
    icon              = "140601",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Kenkonitteki_1",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 15000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 23,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 30,              -- 手指范围,单位:像素
    skillText_EN      = "Throw 50% coins and deal $75%$ damage to all enemies within 30 pixels.",
    skillText_CN      = "将50%金币砸向指定30像素区域内的所有目标,造成相当$金币*75%$伤害。",
    weatherAddition_EN= "Damage increase sharply when windy",
    weatherAddition_CN= "风天时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150608",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {3750, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130154"] = skill

local skill = {
    mainID            = "130155",
    name_EN           = "Money For Safety",
    name_CN           = "花钱消灾",
    icon              = "140601",
    typeText_EN       = "Click and Kill",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Kenkonitteki_1",     -- 音效
    weatherValue      = {10000, 10000, 10000, 10000, 15000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 23,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 30,              -- 手指范围,单位:像素
    skillText_EN      = "Throw 50% coins and deal $80%$ damage to all enemies within 30 pixels.",
    skillText_CN      = "将50%金币砸向指定30像素区域内的所有目标,造成相当$金币*80%$伤害",
    weatherAddition_EN= "Damage increase sharply when windy",
    weatherAddition_CN= "风天时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150609",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {4000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130155"] = skill

------------------杏仙手技----------------------
local skill = {
    mainID            = "130161",
    name_EN           = "Anima Dew",
    name_CN           = "生命之露",
    icon              = "140701",
    typeText_EN       = "Heal Manually",
    typeText_CN       = "手动治疗",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "",    -- 释放光效
    sound             = "Dew",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 40000,           -- 技能冷却CD
    CDplace           = 26,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Heal all friendly forces within 60 pixels. Restore $3.0%$+$4$ health every 0.5 second for 5 seconds.",
    skillText_CN      = "治疗手指范围60像素区域内的所有友方目标,每0.5秒回复$3.0%$附加$4$点生命,持续5秒。",
    weatherAddition_EN= "The treatment increase sharply when rain",
    weatherAddition_CN= "雨天时治疗大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150523",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "210501"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130161"] = skill

local skill = {
    mainID            = "130162",
    name_EN           = "Anima Dew",
    name_CN           = "生命之露",
    icon              = "140701",
    typeText_EN       = "Heal Manually",
    typeText_CN       = "手动治疗",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "",    -- 释放光效
    sound             = "Dew",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 40000,            -- 技能冷却CD
    CDplace           = 26,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Heal all friendly forces within 60 pixels. Restore $3.5%$+$5$ health every 0.5 second for 5 seconds.",
    skillText_CN      = "治疗手指范围60像素区域内的所有友方目标,每0.5秒回复$3.5%$附加$5$点生命,持续5秒。",
    weatherAddition_EN= "When it's rainy, the treatment will increase sharply",
    weatherAddition_CN= "雨天时治疗大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150523",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "210502"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "120142", 1, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130162"] = skill

local skill = {
    mainID            = "130163",
    name_EN           = "Anima Dew",
    name_CN           = "生命之露",
    icon              = "140701",
    typeText_EN       = "Heal Manually",
    typeText_CN       = "手动治疗",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "",    -- 释放光效
    sound             = "Dew",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 40000,            -- 技能冷却CD
    CDplace           = 26,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Heal all friendly forces within 60 pixels. Restore $4.0%$+$7$ health every 0.5 second for 5 seconds.",
    skillText_CN      = "治疗手指范围60像素区域内的所有友方目标,每0.5秒回复$4.0%$附加$7$点生命,持续5秒。",
    weatherAddition_EN= "When it's rainy, the treatment will increase sharply",
    weatherAddition_CN= "雨天时治疗大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150523",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "210503"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "120143", 1, 30000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130163"] = skill

local skill = {
    mainID            = "130164",
    name_EN           = "Anima Dew",
    name_CN           = "生命之露",
    icon              = "140701",
    typeText_EN       = "Heal Manually",
    typeText_CN       = "手动治疗",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "",    -- 释放光效
    sound             = "Dew",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 40000,            -- 技能冷却CD
    CDplace           = 26,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Heal all friendly forces within 60 pixels. Restore $4.5%$+$9$ health every 0.5 second for 5 seconds.",
    skillText_CN      = "治疗手指范围60像素区域内的所有友方目标,每0.5秒回复$4.5%$附加$9$点生命,持续5秒。",
    weatherAddition_EN= "When it's rainy, the treatment will increase sharply",
    weatherAddition_CN= "雨天时治疗大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150523",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "210504"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "120144", 1, 35000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130164"] = skill

local skill = {
    mainID            = "130165",
    name_EN           = "Anima Dew",
    name_CN           = "生命之露",
    icon              = "140701",
    typeText_EN       = "Heal Manually",
    typeText_CN       = "手动治疗",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "",    -- 释放光效
    sound             = "Dew",     -- 音效
    weatherValue      = {10000, 10000, 20000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 40000,            -- 技能冷却CD
    CDplace           = 26,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Heal all friendly forces within 60 pixels. Restore $5.0%$+$11$ health every 0.5 second for 5 seconds.",
    skillText_CN      = "治疗手指范围60像素区域内的所有友方目标,每0.5秒回复$5.0%$附加$11$点生命,持续5秒。",
    weatherAddition_EN= "When it's rainy, the treatment will increase sharply",
    weatherAddition_CN= "雨天时治疗大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {1, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150523",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 8, 0},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "210505"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit        = {10000, "120145", 1, 40000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130165"] = skill

------------------菩提祖师手技----------------------
local skill = {
    mainID            = "130171",
    name_EN           = "Starfall",
    name_CN           = "群星降落",
    icon              = "140801",
    typeText_EN       = "Manul AOE",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Meteorite_1",     -- 音效
    weatherValue      = {10000, 20000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 29,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 5 waves of meteors to bomb randomly in full screen. Every wave of meteors will deal $120%$ and $20$ damage within 60 pixels.",
    skillText_CN      = "凝掐火诀,召唤五次陨火全屏随机轰炸,每波陨火对范围60像素目标造成$120%$攻击附加$20$点伤害。",
    weatherAddition_EN= "Damage increase sharply when night",
    weatherAddition_CN= "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150610",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {12000, 1, 20},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130171"] = skill

local skill = {
    mainID            = "130172",
    name_EN           = "Starfall",
    name_CN           = "群星降落",
    icon              = "140801",
    typeText_EN       = "Manul AOE",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Meteorite_1",     -- 音效
    weatherValue      = {10000, 20000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,            -- 技能冷却CD
    CDplace           = 29,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 5 waves of meteors to bomb randomly in full screen. Every wave of meteors will deal $140%$ and $30$ damage within 60 pixels.",
    skillText_CN      = "凝掐火诀,召唤五次陨火全屏随机轰炸,每波陨火对范围60像素目标造成$140%$攻击附加$30$点伤害。",
    weatherAddition_EN= "Damage increase sharply when night",
    weatherAddition_CN= "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150610",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {14000, 1, 30},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130172"] = skill

local skill = {
    mainID            = "130173",
    name_EN           = "Starfall",
    name_CN           = "群星降落",
    icon              = "140801",
    typeText_EN       = "Manul AOE",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Meteorite_1",     -- 音效
    weatherValue      = {10000, 20000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,            -- 技能冷却CD
    CDplace           = 29,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 5 waves of meteors to bomb randomly in full screen. Every wave of meteors will deal $160%$ and $40$ damage within 60 pixels.",
    skillText_CN      = "凝掐火诀,召唤五次陨火全屏随机轰炸,每波陨火对范围60像素目标造成$160%$攻击附加$40$点伤害。",
    weatherAddition_EN= "Damage increase sharply when night",
    weatherAddition_CN= "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150610",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {16000, 1, 40},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130173"] = skill

local skill = {
    mainID            = "130174",
    name_EN           = "Starfall",
    name_CN           = "群星降落",
    icon              = "140801",
    typeText_EN       = "Manul AOE",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Meteorite_1",     -- 音效
    weatherValue      = {10000, 20000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,            -- 技能冷却CD
    CDplace           = 29,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 5 waves of meteors to bomb randomly in full screen. Every wave of meteors will deal $180%$ and $50$ damage within 60 pixels.",
    skillText_CN      = "凝掐火诀,召唤五次陨火全屏随机轰炸,每波陨火对范围60像素目标造成$180%$攻击附加$50$点伤害。",
    weatherAddition_EN= "Damage increase sharply when night",
    weatherAddition_CN= "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150610",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {18000, 1, 50},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130174"] = skill

local skill = {
    mainID            = "130175",
    name_EN           = "Starfall",
    name_CN           = "群星降落",
    icon              = "140801",
    typeText_EN       = "Manul AOE",
    typeText_CN       = "手动群伤",
    featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "effectName",    -- 释放光效
    sound             = "Meteorite_1",     -- 音效
    weatherValue      = {10000, 20000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,            -- 技能冷却CD
    CDplace           = 29,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    manualRange       = 60,             -- 手指范围,单位:像素
    skillText_EN      = "Summon 5 waves of meteors to bomb randomly in full screen. Every wave of meteors will deal $200%$ and $60$ damage within 60 pixels.",
    skillText_CN      = "凝掐火诀,召唤五次陨火全屏随机轰炸,每波陨火对范围60像素目标造成$200%$攻击附加$60$点伤害。",
    weatherAddition_EN= "When it's night, the damage will increase sharply",
    weatherAddition_CN= "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    bulletType        = "150610",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {20000, 1, 60},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120141", 1, 20000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
}
defines["130175"] = skill

function ManualSkillProperties.get(id)
    -- print("ManualSkillProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return ManualSkillProperties