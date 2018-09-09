

local AutoSkillProperties = {}

local defines = {}

------------------孙悟空自动技能----------------------
local skill = {
    mainID            = "130201",
    name_EN           = "Elemental Recovery",
    name_CN           = "元素复苏",
    icon              = "140103",
    typeText_EN       = "Auto Vivification",
    typeText_CN       = "自动复活",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Revive",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 90000,          -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "The elemental hero will relive when he died.  Cooldown: $90$ seconds",
    skillText_CN      = "元素之躯,帕里斯阵亡后拥有一次额外自动复活能力,内置冷却$90$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130201"] = skill -- 130201

local skill = {
    mainID            = "130202",
    name_EN           = "Elemental Recovery",
    name_CN           = "元素复苏",
    icon              = "140103",
    typeText_EN       = "Auto Vivification",
    typeText_CN       = "自动复活",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Revive",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 80000,          -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "The elemental hero will relive when he died.  Cooldown: $80$ seconds",
    skillText_CN      = "元素之躯,帕里斯阵亡后拥有一次额外自动复活能力,内置冷却$80$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130202"] = skill -- 130201

local skill = {
    mainID            = "130203",
    name_EN           = "Elemental Recovery",
    name_CN           = "元素复苏",
    icon              = "140103",
    typeText_EN       = "Auto Vivification",
    typeText_CN       = "自动复活",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Revive",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 70000,          -- 技能冷却CD
    CDplace           = 3,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "The elemental hero will relive when he died.  Cooldown: $70$ seconds",
    skillText_CN      = "元素之躯,帕里斯阵亡后拥有一次额外自动复活能力,内置冷却$70$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130203"] = skill -- 130201

------------------牛魔王自动技能----------------------
local skill = {
    mainID            = "130211",
    name_EN           = "Berserk",
    name_CN           = "狂怒",
    icon              = "140203",
    typeText_EN       = "Auto Shield",
    typeText_CN       = "自动护盾",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Rage",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 45000,          -- 技能冷却CD
    CDplace           = 8,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When your life is under 25%, gain a shied that can absorb at most $250$ damage for 10 minutes. Meanwhile, drain $50$ enemy's life when normally attack. This ability can only be triggered once every 45 seconds.",
    skillText_CN      = "生命低于25%时触发,获得10秒吸伤盾,最多可吸收$250$点伤害,效果期间普攻吸血+$50$。此技能45秒内最多触发1次。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
        {10000, "210101"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130211"] = skill -- 130201

local skill = {
    mainID            = "130212",
    name_EN           = "Berserk",
    name_CN           = "狂怒",
    icon              = "140203",
    typeText_EN       = "Auto Shield",
    typeText_CN       = "自动护盾",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Rage",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 45000,          -- 技能冷却CD
    CDplace           = 8,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When your life is under 25%, gain a shied that can absorb at most $300$ damage for 10 minutes. Meanwhile, drain $65$ enemy's life when normally attack. This ability can only be triggered once every 45 seconds.",
    skillText_CN      = "生命低于25%时触发,获得10秒吸伤盾,最多可吸收$300$点伤害,效果期间普攻吸血+$65$。此技能45秒内最多触发1次。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
        {10000, "210102"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130212"] = skill -- 130201

local skill = {
    mainID            = "130213",
    name_EN           = "Berserk",
    name_CN           = "狂怒",
    icon              = "140203",
    typeText_EN       = "Auto Shield",
    typeText_CN       = "自动护盾",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Rage",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 45000,          -- 技能冷却CD
    CDplace           = 8,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When your life is under 25%, gain a shied that can absorb at most $350$ damage for 10 minutes. Meanwhile, drain $80$ enemy's life when normally attack. This ability can only be triggered once every 45 seconds.",
    skillText_CN      = "生命低于25%时触发,获得10秒吸伤盾,最多可吸收$350$点伤害,效果期间普攻吸血+$80$。此技能45秒内最多触发1次。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
        {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130213"] = skill -- 130201

------------------铁扇公主自动技----------------------
local skill = {
    mainID            = "130221",
    name_EN           = "Ghost Cut",
    name_CN           = "鬼斩",
    icon              = "140302",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "",              -- 释放光效
    sound             = "Onikiri",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Crit rate +42%, deal $130%$ and $8$ more damage.",
    skillText_CN      = "罗刹鬼斩暴击率额外+42%,对当前目标造成$130%$攻击附加$8$点伤害。",
    bulletType        = "150701",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130221"] = skill -- 130201

local skill = {
    mainID            = "130222",
    name_EN           = "Ghost Cut",
    name_CN           = "鬼斩",
    icon              = "140302",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "",    -- 击中光效
    sound             = "Onikiri",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Crit rate +42%, deal $150%$ and $12$ more damage.",
    skillText_CN      = "罗刹鬼斩暴击率额外+42%,对当前目标造成$150%$攻击附加$12$点伤害。",
    bulletType        = "150701",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {15000, 1, 12},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130222"] = skill -- 130201

local skill = {
    mainID            = "130223",
    name_EN           = "Ghost Cut",
    name_CN           = "鬼斩",
    icon              = "140302",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "",    -- 击中光效
    sound             = "Onikiri",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Crit rate +42%, deal $170%$ and $16$ more damage.",
    skillText_CN      = "罗刹鬼斩暴击率额外+42%,对当前目标造成$170%$攻击附加$16$点伤害。",
    bulletType        = "150701",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {17000, 1, 16},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130223"] = skill -- 130201

local skill = {
    mainID            = "130224",
    name_EN           = "Ghost Cut",
    name_CN           = "鬼斩",
    icon              = "140302",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "",    -- 击中光效
    sound             = "Onikiri",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Crit rate +42%, deal $190%$ and $20$ more damage.",
    skillText_CN      = "罗刹鬼斩暴击率额外+42%,对当前目标造成$190%$攻击附加$20$点伤害。",
    bulletType        = "150701",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {19000, 1, 20},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130224"] = skill -- 130201

------------------玉面狐狸自动技----------------------
local skill = {
    mainID            = "130231",
    name_EN           = "Quick Shot",
    name_CN           = "快速射击",
    icon              = "140402",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 2000,               -- 技能冷却CD
    CDplace           = 17,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "There will be a $8%$ chance that you go ballistic when attack, and your ranged attack speed +400% for 3 seconds.",
    skillText_CN      = "攻击有$8%$概率进入暴走状态,远程攻击速度提高400%,持续3秒。",
    --bulletType        = "150106",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
         {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
     },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130231"] = skill -- 130201

local skill = {
    mainID            = "130232",
    name_EN           = "Quick Shot",
    name_CN           = "快速射击",
    icon              = "140402",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 2000,               -- 技能冷却CD
    CDplace           = 17,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "There will be a $9%$ chance that you go ballistic when attack, and your ranged attack speed +400% for 3 seconds.",
    skillText_CN      = "攻击有$9%$概率进入暴走状态,远程攻击速度提高400%,持续3秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
         {10000, "210202"},       -- 附加自身状态, {附加概率_状态编号}
     },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130232"] = skill -- 130201

local skill = {
    mainID            = "130233",
    name_EN           = "Quick Shot",
    name_CN           = "快速射击",
    icon              = "140402",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 2000,               -- 技能冷却CD
    CDplace           = 17,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "There will be a $12%$ chance that you go ballistic when attack, and your ranged attack speed +400% for 3 seconds.",
    skillText_CN      = "攻击有$10%$概率进入暴走状态,远程攻击速度提高400%,持续3秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
         {10000, "210203"},       -- 附加自身状态, {附加概率_状态编号}
     },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130233"] = skill -- 130201

local skill = {
    mainID            = "130234",
    name_EN           = "Quick Shot",
    name_CN           = "快速射击",
    icon              = "140402",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "effectName",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 2000,               -- 技能冷却CD
    CDplace           = 17,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "There will be a $11%$ chance that you go ballistic when attack, and your ranged attack speed +400% for 3 seconds.",
    skillText_CN      = "攻击有$11%$概率进入暴走状态,远程攻击速度提高400%,持续3秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率, 7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
         {10000, "210204"},       -- 附加自身状态, {附加概率_状态编号}
     },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130234"] = skill -- 130201

local skill = {
    mainID            = "130241",
    name_EN           = "Arrow Shower",
    name_CN           = "箭雨",
    icon              = "140403",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Arrows",     -- 音效
    roleAction        = "boot",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 15000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 10},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 18,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 5000,            -- 技能引导时间,单位:毫秒
    skillText_EN      = "After 5 seconds, shoot 5 waves of arrows from above. Every wave will deal $60%$ and $10$ damage to all targets within 120 pixels.",
    skillText_CN      = "引导5秒,召唤5波箭雨从天而降,每波对范围120像素区域内的所有地面和空中敌人造成$60%$攻击附加$10$点伤害。",
    weatherAddition_EN   = "Damage increase sharply in night.",
    weatherAddition_CN   = "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150604",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {6000, 1, 10},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130241"] = skill -- 130201

local skill = {
    mainID            = "130242",
    name_EN           = "Arrow Shower",
    name_CN           = "箭雨",
    icon              = "140403",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Arrows",     -- 音效
    roleAction        = "boot",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 15000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 10},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,               -- 技能冷却CD
    CDplace           = 18,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 5000,            -- 技能引导时间,单位:毫秒
    skillText_EN      = "After 5 seconds, shoot 5 waves of arrows from above. Every wave will deal $80%$ and $20$ damage to all targets within 120 pixels.",
    skillText_CN      = "引导5秒,召唤5波箭雨从天而降,每波对范围120像素区域内的所有地面和空中敌人造成$80%$攻击附加$20$点伤害。",
    weatherAddition_EN   = "When it's night, the damage will increase sharply.",
    weatherAddition_CN   = "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150604",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {8000, 1, 20},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130242"] = skill -- 130201

local skill = {
    mainID            = "130243",
    name_EN           = "Arrow Shower",
    name_CN           = "箭雨",
    icon              = "140403",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Arrows",     -- 音效
    roleAction        = "boot",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 15000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 10},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,               -- 技能冷却CD
    CDplace           = 18,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 5000,            -- 技能引导时间,单位:毫秒
    skillText_EN      = "After 5 seconds, shoot 5 waves of arrows from above. Every wave will deal $100%$ and $30$ damage to all targets within 120 pixels.",
    skillText_CN      = "引导5秒,召唤5波箭雨从天而降,每波对范围120像素区域内的所有地面和空中敌人造成$100%$攻击附加$30$点伤害。",
    weatherAddition_EN   = "When it's night, the damage will increase sharply.",
    weatherAddition_CN   = "夜晚时伤害大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150604",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 30},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130243"] = skill -- 130201

------------------蛟魔王自动技----------------------
local skill = {
    mainID            = "130261",
    name_EN           = "Retribution",
    name_CN           = "戒律棍",
    icon              = "140502",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Stick",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 21,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Unleash the holy light when you deal normal attacks, reducing all enemies' Armor by 20 for $2$ seconds.",
    skillText_CN      = "普攻可能出佛光,使范围120像素内的所有敌人护甲-20,持续时间$2$秒。",
    bulletType        = "150510",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130261"] = skill -- 130201

local skill = {
    mainID            = "130262",
    name_EN           = "Retribution",
    name_CN           = "戒律棍",
    icon              = "140502",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Stick",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 21,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Unleash the holy light when you deal normal attacks, reducing all enemies' Armor by 20 for $3$ seconds.",
    skillText_CN      = "普攻可能出佛光,使范围120像素内的所有敌人护甲-20,持续时间$3$秒。",
    bulletType        = "150510",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "200202"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130262"] = skill -- 130201

local skill = {
    mainID            = "130263",
    name_EN           = "Retribution",
    name_CN           = "戒律棍",
    icon              = "140502",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Stick",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 21,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Unleash the holy light when you deal normal attacks, reducing all enemies' Armor by 20 for $4$ seconds.",
    skillText_CN      = "普攻可能出佛光,使范围120像素内的所有敌人护甲-20,持续时间$4$秒。",
    bulletType        = "150510",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "200203"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130263"] = skill -- 130201

local skill = {
    mainID            = "130264",
    name_EN           = "Retribution",
    name_CN           = "戒律棍",
    icon              = "140502",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Stick",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 21,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Unleash the holy light when you deal normal attacks, reducing all enemies' Armor by 20 for $5$ seconds.",
    skillText_CN      = "普攻可能出佛光,使范围120像素内的所有敌人护甲-20,持续时间$5$秒。",
    bulletType        = "150510",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130264"] = skill -- 130201

local skill = {
    mainID            = "130251",
    name_EN           = "Unlimited Dharma",
    name_CN           = "佛法无边",
    icon              = "140503",
    typeText_EN       = "Auto Purification",
    typeText_CN       = "自动净化",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110102_monster_dispersed",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 3},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 25000,           -- 技能冷却CD
    CDplace           = 22,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Remove DeBuffs from friendly heros.Cooldown: $6$ seconds.",
    skillText_CN      = "净化英雄小队,移除掉英雄身上的不利状态。冷却$25$秒。",
    bulletType        = "150520",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {10000, 200201},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --selfState         = {10000, 210201},       -- 附加自身状态, {附加概率_状态编号}
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130251"] = skill -- 130201

local skill = {
    mainID            = "130252",
    name_EN           = "Unlimited Dharma",
    name_CN           = "佛法无边",
    icon              = "140503",
    typeText_EN       = "Auto Purification",
    typeText_CN       = "自动净化",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110102_monster_dispersed",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 3},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 22,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Remove DeBuffs from friendly heros.Cooldown: $20$ seconds.",
    skillText_CN      = "净化英雄小队,移除掉英雄身上的不利状态。冷却$20$秒。",
    bulletType        = "150521",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {10000, 200201},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --selfState         = {10000, 210201},       -- 附加自身状态, {附加概率_状态编号}
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130252"] = skill -- 130201

local skill = {
    mainID            = "130253",
    name_EN           = "Unlimited Dharma",
    name_CN           = "佛法无边",
    icon              = "140503",
    typeText_EN       = "Auto Purification",
    typeText_CN       = "自动净化",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110102_monster_dispersed",    -- 释放光效
    --sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 3},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 22,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Remove DeBuffs from friendly heros.Cooldown: $15$ seconds.",
    skillText_CN      = "净化英雄小队,移除掉英雄身上的不利状态。冷却$15$秒。",
    bulletType        = "150522",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType      = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack     = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130253"] = skill -- 130201

------------------鹏魔王自动技能----------------------
local skill = {
    mainID            = "130271",
    name_EN           = "Protection Money",
    name_CN           = "保护费",
    icon              = "140602",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110203_theft",    -- 击中光效
    sound             = "Rob",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 120,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 24,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Normal attack can deal $220%$ damage to at most 5 targets within 120 pixels. There will be a 50% chance you get $6$ coins from every enemy you hit.",
    skillText_CN      = "普攻可能触发,对范围120像素内最多5个目标造成$220%攻击$伤害,每个被击中的怪物50%概率缉缴$6$点金币。",
    bulletType        = "150524",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {22000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{25000, "200501"},                -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
        --{10000, "210101"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    skillAddGold       = {5000, 6},  --技能击中25%概率获得1点金币
}
defines["130271"] = skill -- 130201

local skill = {
    mainID            = "130272",
    name_EN           = "Protection Money",
    name_CN           = "保护费",
    icon              = "140602",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110203_theft",    -- 释放光效
    sound             = "Rob",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 120,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 24,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Normal attack can deal $240%$ damage to at most 5 targets within 120 pixels. There will be a 50% chance you get $8$ coins from every enemy you hit.",
    skillText_CN      = "普攻可能触发,对范围120像素内最多5个目标造成$240%攻击$伤害,每个被击中的怪物50%概率缉缴$8$点金币",
    bulletType        = "150524",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {24000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{25000, "200501"},                -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
        --{10000, "210101"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    skillAddGold      = {5000, 8},  --技能击中25%概率获得1点金币
}
defines["130272"] = skill -- 130201

local skill = {
    mainID            = "130273",
    name_EN           = "Protection Money",
    name_CN           = "保护费",
    icon              = "140602",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110203_theft",    -- 释放光效
    sound             = "Rob",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 120,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 24,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Normal attack can deal $260%$ damage to at most 5 targets within 120 pixels. There will be a 50% chance you get $10$ coins from every enemy you hit.",
    skillText_CN      = "普攻可能触发,对范围120像素内最多5个目标造成$260%攻击$伤害,每个被击中的怪物50%概率缉缴$10$点金币。",
    bulletType        = "150524",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {26000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{25000, "200501"},                -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
        --{10000, "210101"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    skillAddGold      = {5000, 10},  --技能击中25%概率获得1点金币
}
defines["130273"] = skill -- 130201

local skill = {
    mainID            = "130274",
    name_EN           = "Protection Money",
    name_CN           = "保护费",
    icon              = "140602",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110203_theft",    -- 释放光效
    sound             = "Rob",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 120,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 24,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Normal attack can deal $280%$ damage to at most 5 targets within 120 pixels. There will be a 50% chance you get $12$ coins from every enemy you hit.",
    skillText_CN      = "普攻可能触发,对范围120像素内最多5个目标造成$280%攻击$伤害,每个被击中的怪物50%概率缉缴$12$点金币。",
    bulletType        = "150524",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {28000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{25000, "200501"},                -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
        --{10000, "210101"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    skillAddGold      = {5000, 12},  --技能击中25%概率获得1点金币
}
defines["130274"] = skill -- 130201

------------------杏仙自动技----------------------
local skill = {
    mainID            = "130281",
    name_EN           = "Thorn Seed",
    name_CN           = "荆棘之种",
    icon              = "140702",
    typeText_EN       = "Auto Trap",
    typeText_CN       = "自动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Seed",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 20000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 27,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Sow a seed randomly when deal normal attack. There will be a 50% chance that passing enemy be poisoned and suffer $15$ damage per second for 5 seconds. The seed will last 6 seconds.",
    skillText_CN      = "普攻可能在路径上随机滋生1个荆棘球。路过荆棘球的目标50%概率中荆棘花毒,每秒造成$15$点真实伤害,持续5秒。荆棘球存在12秒。",
    weatherAddition_EN   = "The poison damage increase sharply when snow.",
    weatherAddition_CN   = "雪天时花毒大量加深",  -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150123",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "120151", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130281"] = skill -- 130201

local skill = {
    mainID            = "130282",
    name_EN           = "Thorn Seed",
    name_CN           = "荆棘之种",
    icon              = "140702",
    typeText_EN       = "Auto Trap",
    typeText_CN       = "自动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Seed",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 20000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 27,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Sow a seed randomly when deal normal attack. There will be a 50% chance that passing enemy be poisoned and suffer $20$ damage per second for 5 seconds. The seed will last 6 seconds.",
    skillText_CN      = "普攻可能在路径上随机滋生1个荆棘球。路过荆棘球的目标50%概率中荆棘花毒,每秒造成$20$点真实伤害,持续5秒。荆棘球存在12秒。",
    weatherAddition_EN   = "When it's snowy, the poison damage will increase sharply.",
    weatherAddition_CN   = "雪天时花毒大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150123",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "120152", 1, 8000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130282"] = skill -- 130201

local skill = {
    mainID            = "130283",
    name_EN           = "Thorn Seed",
    name_CN           = "荆棘之种",
    icon              = "140702",
    typeText_EN       = "Auto Trap",
    typeText_CN       = "自动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Seed",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 20000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 27,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Sow a seed randomly when deal normal attack. There will be a 50% chance that passing enemy be poisoned and suffer $25$ damage per second for 5 seconds. The seed will last 6 seconds.",
    skillText_CN      = "普攻可能在路径上随机滋生1个荆棘球。路过荆棘球的目标50%概率中荆棘花毒,每秒造成$25$点真实伤害,持续5秒。荆棘球存在12秒。",
    weatherAddition_EN   = "When it's snowy, the poison damage will increase sharply.",
    weatherAddition_CN   = "雪天时花毒大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150123",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "120153", 1, 10000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130283"] = skill -- 130201

local skill = {
    mainID            = "130284",
    name_EN           = "Thorn Seed",
    name_CN           = "荆棘之种",
    icon              = "140702",
    typeText_EN       = "Auto Trap",
    typeText_CN       = "自动陷阱",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Seed",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 20000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 27,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "Sow a seed randomly when deal normal attack. There will be a 50% chance that passing enemy be poisoned and suffer $30$ damage per second for 5 seconds. The seed will last 6 seconds.",
    skillText_CN      = "普攻可能在路径上随机滋生1个荆棘球。路过荆棘球的目标50%概率中荆棘花毒,每秒造成$30$点真实伤害,持续5秒。荆棘球存在12秒。",
    weatherAddition_EN   = "When it's snowy, the poison damage will increase sharply.",
    weatherAddition_CN   = "雪天时花毒大量加深",              -- 天气对技能影响描述在技能TIPS上面的显示
    bulletType        = "150123",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "120154", 1, 12000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130284"] = skill -- 130201

------------------菩提祖师自动技----------------------
local skill = {
    mainID            = "130291",
    name_EN           = "Thunderchain",
    name_CN           = "雷霆连锁",
    icon              = "140802",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Shock",     -- 音效
    roleAction        = "Attack_Far",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 30,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When deal normal attack, the chain reaction will be triggered off,and bounces up at most $2$ times and increasing $10%$ damage every time.",
    skillText_CN      = "普攻可能发生链锁效果,最多发生$2$次跳跃,每次跳跃伤害提升$10%$。",
    bulletType        = "150302",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130291"] = skill -- 130201

local skill = {
    mainID            = "130292",
    name_EN           = "Thunderchain",
    name_CN           = "雷霆连锁",
    icon              = "140802",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Shock",     -- 音效
    roleAction        = "Attack_Far",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 30,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When deal normal attack, the chain reaction will be triggered off,and bounces up at most $3$ times and increasing $12%$ damage every time.",
    skillText_CN      = "普攻可能发生链锁效果,最多发生$3$次跳跃,每次跳跃伤害提升$12%$。",
    bulletType        = "150303",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130292"] = skill -- 130201

local skill = {
    mainID            = "130293",
    name_EN           = "Thunderchain",
    name_CN           = "雷霆连锁",
    icon              = "140802",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Shock",     -- 音效
    roleAction        = "Attack_Far",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 30,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When deal normal attack, the chain reaction will be triggered off,and bounces up at most $4$ times and increasing $14%$ damage every time.",
    skillText_CN      = "普攻可能发生链锁效果,最多发生$4$次跳跃,每次跳跃伤害提升$14%$。",
    bulletType        = "150304",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130293"] = skill -- 130201

local skill = {
    mainID            = "130294",
    name_EN           = "Thunderchain",
    name_CN           = "雷霆连锁",
    icon              = "140802",
    typeText_EN       = "Auto Strike",
    typeText_CN       = "自动打击",
    featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Shock",     -- 音效
    roleAction        = "Attack_Far",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 30,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "When deal normal attack, the chain reaction will be triggered off,and bounces up at most $5$ times and increasing $16%$ damage every time.",
    skillText_CN      = "普攻可能发生链锁效果,最多发生$5$次跳跃,每次跳跃伤害提升$16%$。",
    bulletType        = "150305",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "200201"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130294"] = skill -- 130201

local skill = {
    mainID            = "130701",
    name_EN           = "Inspire",
    name_CN           = "潜能激发",
    icon              = "140803",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 30000,               -- 技能冷却CD
    CDplace           = 31,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "Heros near Ellis within 300 pixels $+50%$ attack for 10 seconds.",
    skillText_CN      = "爱丽丝激发周围300像素内的英雄潜能,攻击力提升$50%$,持续10秒。",
    bulletType        = "150525",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType      = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack     = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "210401"},               -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    selfState         = {
        {10000, "210401"},               -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130701"] = skill -- 130201

local skill = {
    mainID            = "130702",
    name_EN           = "Inspire",
    name_CN           = "潜能激发",
    icon              = "140803",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 30000,               -- 技能冷却CD
    CDplace           = 31,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "Heros near Ellis within 300 pixels $+70%$ attack for 10 seconds.",
    skillText_CN      = "爱丽丝激发周围300像素内的英雄潜能,攻击力提升$70%$,持续10秒。",
    bulletType        = "150525",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType      = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack     = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "210402"},               -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    selfState         = {
        {10000, "210402"},               -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130702"] = skill -- 130201

local skill = {
    mainID            = "130703",
    name_EN           = "Inspire",
    name_CN           = "潜能激发",
    icon              = "140803",
    typeText_EN       = "Auto BUFF",
    typeText_CN       = "自动状态",
    featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 30000,               -- 技能冷却CD
    CDplace           = 31,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "Heros near Ellis within 300 pixels $+100%$ attack for 10 seconds.",
    skillText_CN      = "爱丽丝激发周围300像素内的英雄潜能,攻击力提升$100%$,持续10秒。",
    bulletType        = "150525",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType      = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack     = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
        {10000, "210403"},               -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    selfState         = {
        {10000, "210403"},               -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130703"] = skill -- 130201

local skill = {
    mainID            = "130352",
    name_EN           = "ABC",
    name_CN           = "狐狸吸伤盾",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,             -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 30000,               -- 技能冷却CD
    CDplace           = 32,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每隔30秒获得1个30秒吸伤盾,吸收相当自身生命45%的伤害时破掉。。",
    --bulletType        = "150525",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType      = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack     = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
        --{10000, "210402"},               -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
        {10000, "210701"},               -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "120146", 1, 6000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130352"] = skill -- 130201

-------------------------怪物（ID=100403）技能----------------------
local skill = {
    mainID            = "130401",
    name_EN           = "ABC",
    name_CN           = "回血",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target          = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 10},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 50,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每秒回复10%生命,持续5秒",
    --bulletType        = "150503",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
         {10000, "210301"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130401"] = skill -- 130201

-------------------------怪物（ID=100408）技能----------------------
local skill = {
    mainID            = "130402",
    name_EN           = "ABC",
    name_CN           = "冰霜雪球",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 200,              --技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 8000,           -- 技能冷却CD
    CDplace           = 51,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "朝240像素内的任意目标扔出一个雪球,恢复目标80生命,雪球最多可跳跃5次",
    bulletType        = "151001",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 3,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 80},      -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
        -- {10000, "210301"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130402"] = skill -- 130201

-------------------------怪物（ID=100408）技能----------------------
local skill = {
    mainID            = "130403",
    name_EN           = "ABC",
    name_CN           = "巨魔沉睡",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              --技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {2, 20},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 52,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "使范围80像素内的某英雄陷入5秒沉睡",
    bulletType        = "150508",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 3,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 40},      -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
        -- {10000, "210301"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130403"] = skill -- 130201

-------------------------怪物（ID=100410）技能----------------------
local skill = {
    mainID            = "130404",
    name_EN           = "ABC",
    name_CN           = "狂奔",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Impact",              -- 调用动作Impact特殊,（*狂奔的动作特殊做由BUFF决定时候播放狂奔动作）
    actionObject      = {0, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 6},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,           -- 技能冷却CD
    CDplace           = 53,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "沿着路径以300%速度狂奔1.5秒,对沿途的敌人造成200%伤害,撞到目标后停止狂奔",
    --bulletType        = "150507",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 3,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 40},      -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
        {10000, "210305"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130404"] = skill -- 130201

-------------------------怪物（ID=100411）技能----------------------
local skill = {
    mainID            = "130405",
    name_EN           = "ABC",
    name_CN           = "吞噬",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 54,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "瞬间吞噬掉召唤兵（造成100%HP伤害）",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210305"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130405"] = skill -- 130201

-------------------------熔岩蛛母（ID=100204）技能----------------------
local skill = {
    mainID            = "130406",
    name_EN           = "ABC",
    name_CN           = "生产蜘蛛",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100302_summon",    -- 击中光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    --actionObject    = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target          = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,            -- 技能冷却CD
    CDplace           = 55,              -- CD冷却占位
    castTime          = 0,            -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "在身边召唤1只100413怪物 ",
    --bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210305"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit            = {10000, "100413", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130406"] = skill -- 130201

-------------------------怪物（ID=100303）技能----------------------
local skill = {
    mainID            = "130407",
    name_EN           = "ABC",
    name_CN           = "狂暴",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    --actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 56,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "生命少于50%时触发,攻击+100%,攻击速度+100%,持续5秒",
    --bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
       {10000, "210302"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "100405", 3},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130407"] = skill -- 130201

-------------------------怪物（ID=100304）技能----------------------
local skill = {
    mainID            = "130408",
    name_EN           = "ABC",
    name_CN           = "召唤2",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    --actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 8},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 20000,           -- 技能冷却CD
    CDplace           = 57,              -- CD冷却占位
    castTime          = 500,             -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "在身边召唤1只100105怪物,100105死亡后分裂出2只100106",
    --bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210302"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130408"] = skill -- 130201


-------------------------怪物（ID=100305）技能----------------------
local skill = {
    mainID            = "130409",
    name_EN           = "ABC",
    name_CN           = "狂暴",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    --actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {3, 15},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 60000,           -- 技能冷却CD
    CDplace           = 58,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "护甲+300%,攻击速度+100%,持续60秒",
    --bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
       {10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130409"] = skill -- 130201

-------------------------怪物玛格（ID=100201）技能----------------------
local skill = {
    mainID            = "130410",
    name_EN           = "ABC",
    name_CN           = "导弹",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 击中光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 200,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 12000,           -- 技能冷却CD
    CDplace           = 59,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "对范围200像素内的随机某60区域发射一枚导弹,并对范围的目标造成200%伤害",
    bulletType        = "150203",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130410"] = skill -- 130201

-------------------------BOSS比蒙皇（ID=100501）技能----------------------
local skill = {
    mainID            = "130411",
    name_EN           = "ABC",
    name_CN           = "熊吼",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 800,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 60,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "使自身范围160像素内的目标晕2秒 ",
    bulletType        = "150509",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200302"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130411"] = skill -- 130201

-------------------------恶魔统领（ID=100502）技能----------------------
local skill = {
    mainID            = "130412",
    name_EN           = "ABC",
    name_CN           = "邪恶斩杀",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_02",              -- 调用动作
    actionObject      = {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 800,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 61,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "对60像素目标造成200%伤害",
    bulletType        = "150703",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "220401"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130412"] = skill -- 130201

-------------------------恶魔统领（ID=100503）技能----------------------
local skill = {
    mainID            = "130413",
    name_EN           = "ABC",
    name_CN           = "邪恶召唤",                 -- 子弹召唤怪物以怪物直接~技能射程范围内发射子弹
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 200,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 62,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "普攻有40%概率召唤3个小恶魔",
    bulletType        = "150124",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "220402"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "100401", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130413"] = skill -- 130201

-------------------------地狱炎魔（ID=100504）技能----------------------
local skill = {
    mainID            = "130414",
    name_EN           = "ABC",
    name_CN           = "岩浆暴怒",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 1, 1, 1, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 1000,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 63,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 2000,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "摧毁自身范围1000像素内的建筑塔",
    bulletType        = "150512",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "220908"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130414"] = skill -- 130201

-------------------------BOSS比蒙皇（ID=100504）技能----------------------
local skill = {
    mainID            = "130415",
    name_EN           = "ABC",
    name_CN           = "巨掌流血",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_02",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,             -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 600,           -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 64,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "对单体目标造成200%伤害并流血,每秒-10点生命,持续5秒。",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200303"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130415"] = skill -- 130201

-------------------------大恶魔王（ID=100505）技能----------------------
local skill = {
    mainID            = "130416",
    name_EN           = "ABC",
    name_CN           = "恶魔蝙蝠",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 1000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 15000,           -- 技能冷却CD
    CDplace           = 65,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "释放恶魔蝙蝠,12秒后飞回,期间燃烧撞击目标5%HP真实伤害。每秒造成1%生命伤害，持续15秒",
    bulletType        = "150402",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {500, 9, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命,5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200306"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130416"] = skill -- 130201

-------------------------大恶魔王（ID=100505）技能----------------------
local skill = {
    mainID            = "130417",
    name_EN           = "ABC",
    name_CN           = "位面传送",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "DeliverSkill_01",              -- 调用动作
    --actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 200,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 66,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "位面传送后获得10S嘲讽（变为逃跑类型）,嘲讽消失BOSS自动踢回原位。",
    --bulletType        = "150603",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "220403"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130417"] = skill -- 130201

-------------------------熔岩蜘蛛（ID=100413）技能----------------------
local skill = {
    mainID            = "130418",
    name_EN           = "ABC",
    name_CN           = "麻痹毒素",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_01",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 67,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "使人麻痹,移动速度-50%,持续6秒",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200304"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130418"] = skill -- 130201

-------------------------恶魔之血（ID=100414）技能----------------------
local skill = {
    mainID            = "130419",
    name_EN           = "ABC",
    name_CN           = "恶魔之血",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作  备注：假光环特殊做
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 20},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 1000,            -- 技能冷却CD
    CDplace           = 68,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每秒释放恶魔之血恢复100生命",
    bulletType        = "150528",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 3,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 100},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{5000, "200307"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "120131", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130419"] = skill -- 130201

-------------------------天鹰骑兵（ID=100203）技能----------------------
local skill = {
    mainID            = "130420",
    name_EN           = "ABC",
    name_CN           = "死龙留人",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    --roleAction        = "",              -- 调用动作
    actionObject      = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 69,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "天鹰骑兵死亡后,留下天鹰100302",
    --bulletType        = "150104",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{5000, "200307"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit            = {10000, "100302", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130420"] = skill -- 130201

-------------------------狼骑兽人（ID=100203）技能----------------------
local skill = {
    mainID            = "130421",
    name_EN           = "ABC",
    name_CN           = "死狗留人",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    actionObject      = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 70,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "狼骑兽人死亡后分裂出座狼快速跑掉",
    --bulletType        = "150104",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{5000, "200307"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit            = {10000, "100206", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130421"] = skill -- 130201

-------------------------怪物（ID=100105）技能----------------------
local skill = {
    mainID            = "130423",
    name_EN           = "ABC",
    name_CN           = "分裂三狗",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 击中光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    --actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 72,              -- CD冷却占位
    castTime          = 0,             -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "100105死亡后分裂出3只100106",
    --bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210302"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "100106", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130423"] = skill -- 130201

-------------------------烈火精灵（ID=100303）技能----------------------
local skill = {
    mainID            = "130424",
    name_EN           = "ABC",
    name_CN           = "引燃",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 67,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每秒-15生命,持续10秒",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200305"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "100105", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130424"] = skill -- 130201

-------------------------冰霜巨龙（ID=100503）技能----------------------
local skill = {
    mainID            = "130425",
    name_EN           = "ABC",
    name_CN           = "冰封领域",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 600,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 74,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "随机朝目标吐突出一个600像素的冰封领域,使通过的怪物获得50%速度提升",
    bulletType        = "150125",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200305"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "120162", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130425"] = skill -- 130201

-------------------------大恶魔王（ID=100505）技能----------------------
local skill = {
    mainID            = "130426",
    name_EN           = "ABC",
    name_CN           = "恶魔大军",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Cast",              -- 调用动作
    actionObject      = {0, 1, 1, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 1000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 5},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 75,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 10000,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "引导10秒,每秒召唤1个恶魔",
    bulletType        = "150617",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200305"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "100414", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130426"] = skill -- 130201

-------------------------恶魔爪牙（ID=100414）技能----------------------
local skill = {
    mainID            = "130427",
    name_EN           = "ABC",
    name_CN           = "撕裂召唤兵",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 1, 0, 0, 0, 0, 0, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost             = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 30000,           -- 技能冷却CD
    CDplace           = 76,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "瞬间吞噬掉召唤兵（造成100%HP伤害）",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 3, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200301"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210305"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130427"] = skill -- 130201

-------------------------冰霜巨龙（ID=100503）技能----------------------
local skill = {
    mainID            = "130428",
    name_EN           = "ABC",
    name_CN           = "领域巡视",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_02",              -- 调用动作
    --actionObject      = {0, 1, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {2, 10},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 77,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "沿着地图横屏吐息飞行,沿途的塔将会被冻结",
    weatherAddition   = "",              -- 天气对技能的加成影响
    --bulletType        = "150101",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{10000, "200305"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    -- callUnit          = {10000, "120162", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130428"] = skill -- 130201

local skill = {
    mainID            = "130438",
    name_EN           = "ABC",
    name_CN           = "冰之冻结",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 1, 1, 1, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 17},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 3000,           -- 技能冷却CD
    CDplace           = 81,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "使范围内的建筑塔被冻结无法攻击，持续3秒，玩家可以手动点击移除",
    --weatherAddition   = "",              -- 天气对技能的加成影响
    bulletType        = "150531",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "220912"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    -- callUnit          = {10000, "120162", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130438"] = skill -- 130201

local skill = {
    mainID            = "130439",
    name_EN           = "ABC",
    name_CN           = "风之迅捷",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 1, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 300,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 17},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 3000,           -- 技能冷却CD
    CDplace           = 82,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "使范围内的精灵移动速度+50%，持续3秒",
    --weatherAddition   = "",              -- 天气对技能的加成影响
    bulletType        = "150530",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "220913"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
       --{10000, "210303"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    -- callUnit          = {10000, "120162", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130439"] = skill -- 130201

-------------------------天兵2（ID=100407）技能----------------------
local skill = {
    mainID            = "130422",
    name_EN           = "ABC",
    name_CN           = "龙鳞甲",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               -- 把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 2000,             -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,               -- 技能冷却CD
    CDplace           = 71,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每间隔15秒释放吸伤盾,吸收[当前生命100%]的伤害量,持续8秒",
    --bulletType        = "150104",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {20000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
       --{5000, "200307"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    selfState         = {
       {10000, "210306"},       -- 附加自身状态, {附加概率_状态编号}
    },
    --callUnit            = {10000, "100405", 1},  -- {召唤概率_召唤ID_召唤个数},召唤概率万分比
    --cleansing         = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130422"] = skill -- 130201

-----------------------------5级仙术塔技能---------------------------------
local skill = {
    mainID            = "130501",
    name_EN           = "ABC",
    name_CN           = "高级法弹",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 6000,            -- 技能冷却CD
    CDplace           = 70,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "普通攻击被技能130501替换,造成150%伤害。",
    bulletType        = "150105",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {15000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130501"] = skill -- 130201

-----------------------------关卡13魔像技能---------------------------------
local skill = {
    mainID            = "130601",
    name_EN           = "ABC",
    name_CN           = "蘑菇爆裂打野机关",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,           -- 技能冷却CD
    CDplace           = 71,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "魔像向四周发散音波,使范围700像素内的所有目标速度-30%,持续3秒。",
    bulletType        = "150514",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {30000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200401"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130601"] = skill -- 130201

-----------------------------火图腾群体伤害---------------------------------
local skill = {
    mainID            = "130802",
    name_EN           = "ABC",
    name_CN           = "1级火图腾群体攻击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 180,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 1500,              -- 技能冷却CD
    CDplace           = 72,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "造成70点真实伤害。",
    bulletType        = "150527",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 70},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "200401"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130802"] = skill -- 130201

local skill = {
    mainID            = "130803",
    name_EN           = "ABC",
    name_CN           = "2级火图腾群体攻击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 180,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 1500,               -- 技能冷却CD
    CDplace           = 72,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "造成75点真实伤害。",
    bulletType        = "150527",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 75},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "200401"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130803"] = skill -- 130201

local skill = {
    mainID            = "130804",
    name_EN           = "ABC",
    name_CN           = "3级火图腾群体攻击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target          = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange      = 180,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 1500,               -- 技能冷却CD
    CDplace           = 72,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "造成80点真实伤害。",
    bulletType        = "150527",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 80},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "200401"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130804"] = skill -- 130201

------------------牛魔王普攻击套表现动作不同----------------------
local skill = {
    mainID            = "130901",
    name_EN           = "ABC",
    name_CN           = "老牛普攻重击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_02",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "对目标造成120%攻击",
    bulletType        = "150702",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {12000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130901"] = skill -- 130201

------------------悟空普攻击套表现动作不同----------------------
local skill = {
    mainID            = "130902",
    name_EN           = "ABC",
    name_CN           = "元素重击",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_02",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,          -- 技能冷却CD
    CDplace           = 12,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "对目标造成120%攻击",
    bulletType        = "150702",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {12000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130902"] = skill -- 130201

-----------------------------小树精嘲讽技能---------------------------------
local skill = {
    mainID            = "130605",
    name_EN           = "ABC",
    name_CN           = "嘲讽",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 73,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每次普通攻击20%概率附6秒嘲讽,使他2种援军对其伤害+25%",
    bulletType        = "150702",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 2},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200906"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130605"] = skill -- 130201


-----------------------------水精分裂技能---------------------------------
local skill = {
    mainID            = "130606",
    name_EN           = "ABC",
    name_CN           = "水精分裂",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "",              -- 调用动作
    actionObject      = {1, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 74,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "水精死亡后分裂出3个小元素,存在3秒。",
    --bulletType        = "150527",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {0, 0, 2},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- hitState          = {
    --    {10000, "200906"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    -- },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    callUnit          = {10000, "170205", 3, 3000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130606"] = skill -- 130201

-----------------------------金龙吐弹技能---------------------------------
local skill = {
    mainID            = "130607",
    name_EN           = "ABC",
    name_CN           = "踏地",
    featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 160,            -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 0},          -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 0,               -- 技能冷却CD
    CDplace           = 75,              -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能引导时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每次普攻击50%概率使范围80地面目标造成10点真实伤害,3秒内减速20%",
    bulletType        = "150208",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {0, 0, 10},       -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200907"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    -- selfState         = {
    --     {10000, "210201"},       -- 附加自身状态, {附加概率_状态编号}
    -- },
    -- callUnit          = {10000, "170205", 3, 3000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["130607"] = skill -- 130201

-- ------------------箭塔A天赋“淬毒”----------------------
-- local skill = {
--     mainID            = "230201",
--     name_EN           = "ABC",
--     name_CN           = "淬毒",
--     level             = 1,               -- 等级
--     effect            = "effectName",    -- 释放光效
--     sound             = "soundName",     -- 音效
--     actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
--     target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
--     --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
--     weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
--     powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
--     skillCD           = 0,           -- 技能冷却CD
--     CDplace           = 3,               -- CD冷却占位
--     castTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     skillText_EN      = "ABC",
--     skillText_CN      = "每次击中目标35%概率使其中毒3秒,每秒造成1点毒伤。",
--     bulletType        = "150101",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
--     skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
--                                          --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
--                                          --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
--     hitState          = {
--       {10000, "200601"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
--     },
--     --selfState         = {
--     --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
--     --},
--     --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
--     --cleansing           = 10000,      --净化概率,净化掉不利BUFF
--     --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
--     --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
-- }
-- defines["230201"] = skill -- 130201

-- local skill = {
--     mainID            = "230202",
--     name_EN           = "ABC",
--     name_CN           = "淬毒",
--     level             = 2,               -- 等级
--     effect            = "effectName",    -- 释放光效
--     sound             = "soundName",     -- 音效
--     actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
--     target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
--     --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
--     weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
--     powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
--     skillCD           = 0,          -- 技能冷却CD
--     CDplace           = 3,               -- CD冷却占位
--     castTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     skillText_EN      = "ABC",
--    skillText_CN      = "每次击中目标35%概率使其中毒3秒,每秒造成2点毒伤。",
--     bulletType        = "150101",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
--     skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
--                                          --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
--                                          --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
--     hitState          = {
--       {10000, "200602"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
--     },
--     --selfState         = {
--     --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
--     --},
--     --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
--     --cleansing           = 10000,      --净化概率,净化掉不利BUFF
--     --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
--     --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
-- }
-- defines["230202"] = skill -- 130201

-- local skill = {
--     mainID            = "230203",
--     name_EN           = "ABC",
--     name_CN           = "淬毒",
--     level             = 3,               -- 等级
--     effect            = "effectName",    -- 释放光效
--     sound             = "soundName",     -- 音效
--     actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
--     target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
--     --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
--     weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
--     powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
--     skillCD           = 0,          -- 技能冷却CD
--     CDplace           = 3,               -- CD冷却占位
--     castTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
--     skillText_EN      = "ABC",
--    skillText_CN      = "每次击中目标35%概率使其中毒3秒,每秒造成3点毒伤。",
--     bulletType        = "150101",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
--     skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
--                                          --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
--                                          --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
--     hitState          = {
--       {10000, "200603"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
--     },
--     --selfState         = {
--     --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
--     --},
--     --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
--     --cleansing           = 10000,      --净化概率,净化掉不利BUFF
--     --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
--     --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
-- }
-- defines["230203"] = skill -- 130201

------------------箭塔B天赋“火焰箭”----------------------
local skill = {
    mainID            = "230301",
    name_EN           = "ABC",
    name_CN           = "火焰箭",
    sound             = "MgicII",       --释放技能时播放的音效
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 190,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 3000,           -- 技能冷却CD
    CDplace           = 81,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每3秒发射一支火焰箭击中目标造成100%伤害,并爆裂对小范围内地面最多2目标造成$20$点火伤",
    bulletType        = "150206",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230301"] = skill -- 130201

local skill = {
    mainID            = "230302",
    name_EN           = "ABC",
    name_CN           = "火焰箭",
    sound             = "MgicII",       --释放技能时播放的音效
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 190,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 3000,          -- 技能冷却CD
    CDplace           = 81,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每3秒发射一支火焰箭击中目标造成100%伤害,并爆裂对小范围内地面最多2目标造成$30$点火伤",
    bulletType        = "150206",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230302"] = skill -- 130201

local skill = {
    mainID            = "230303",
    name_EN           = "ABC",
    name_CN           = "火焰箭",
    sound             = "MgicII",       --释放技能时播放的音效
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 190,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 3000,          -- 技能冷却CD
    CDplace           = 81,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "每3秒发射一支火焰箭击中目标造成100%伤害,并爆裂对小范围内地面最多2目标造成$40$点火伤",
    bulletType        = "150206",        -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {10000, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230303"] = skill -- 130201


------------------炮塔A天赋“火图腾”----------------------
local skill = {
    mainID            = "230601",
    name_EN           = "ABC",
    name_CN           = "火图腾",
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,           -- 技能冷却CD
    CDplace           = 82,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "在炮塔附近召唤一根$300$点生命火图腾,灼烧途径目标,并同时对自身反噬等量伤害。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170401", 1, 1800000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230601"] = skill -- 130201

local skill = {
    mainID            = "230602",
    name_EN           = "ABC",
    name_CN           = "火图腾",
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,          -- 技能冷却CD
    CDplace           = 82,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "在炮塔附近召唤一根$400$点生命火图腾,灼烧途径目标,并同时对自身反噬等量伤害。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170402", 1, 1800000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230602"] = skill -- 130201

local skill = {
    mainID            = "230603",
    name_EN           = "ABC",
    name_CN           = "火图腾",
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    roleAction        = "Attack_Far_01",              -- 调用动作
    --actionObject      = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    --target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 10000,          -- 技能冷却CD
    CDplace           = 82,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "在炮塔附近召唤一根$500$点生命火图腾,灼烧途径目标,并同时对自身反噬等量伤害。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    --hitState          = {
    --   {10000, "200204"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    --},
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    callUnit          = {10000, "170403", 1, 1800000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["230603"] = skill -- 130201

------------------仙术塔A天赋“狐魅术”----------------------
local skill = {
    mainID            = "231001",
    name_EN           = "ABC",
    name_CN           = "狐魅术",
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 16000,           -- 技能冷却CD
    CDplace           = 83,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "6秒降低目标的护甲25%,冷却$16$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200905"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},


    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231001"] = skill -- 130201

local skill = {
    mainID            = "231002",
    name_EN           = "ABC",
    name_CN           = "狐魅术",
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 14000,          -- 技能冷却CD
    CDplace           = 83,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "6秒降低目标的护甲25%,冷却$14$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200905"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231002"] = skill -- 130201

local skill = {
    mainID            = "231003",
    name_EN           = "ABC",
    name_CN           = "狐魅术",
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "soundName",     -- 音效
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 1},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 1,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    --skillRange        = 80,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 90000,          -- 技能冷却CD
    CDplace           = 83,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "6秒降低目标的护甲25%,冷却$12$秒。",
    --bulletType        = "0",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    --attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    --skillAttack       = {13000, 1, 8},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
                                         --   0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,
                                         --   6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    hitState          = {
       {10000, "200905"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
    --selfState         = {
    --    {10000, "210103"},       -- 附加自身状态, {附加概率_状态编号}
    --},
    --callUnit          = {10000, "170101", 3, 25000},  -- {召唤概率_召唤ID_召唤个数_存活时间},召唤概率万分比,存活时间单位毫秒
    --cleansing           = 10000,      --净化概率,净化掉不利BUFF
    --dispel            = 10000,      --驱散概率,驱散掉有利BUFF
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231003"] = skill -- 130201

------------------仙术塔B天赋“千年狐火”----------------------
local skill = {
    mainID            = "231201",
    name_EN           = "ABC",
    name_CN           = "破坏之光",
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Destruction",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 160,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 22000,           -- 技能冷却CD
    CDplace           = 84,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "发射一束狐火随机沿途移动,并灼烧碰触目标造成425%点伤害,冷却$22$秒。",
    bulletType        = "150801",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {42500, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231201"] = skill -- 130201

local skill = {
    mainID            = "231202",
    name_EN           = "ABC",
    name_CN           = "破坏之光",
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Destruction",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 180,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 16000,          -- 技能冷却CD
    CDplace           = 84,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "发射一束狐火随机沿途移动,并灼烧碰触目标造成425%伤害,冷却$18$秒。",
    bulletType        = "150801",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {42500, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231202"] = skill -- 130201

local skill = {
    mainID            = "231203",
    name_EN           = "ABC",
    name_CN           = "破坏之光",
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    sound             = "Destruction",     -- 音效
    roleAction        = "Skill_01",              -- 调用动作
    actionObject      = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0},  -- {自己_英雄队伍_召唤兵_箭塔_炮塔_法师塔_祭坛塔_地面怪物_地下怪物_空中怪物}
    target            = 2,               --把XX锁定为目标,1=普攻目标为技能目标,2=技能通过范围自己确定目标
    skillRange        = 160,              -- 技能范围（射程）,当target=1时,字段无效
    weatherValue      = {10000, 10000, 10000, 10000, 10000}, -- {晴天_夜晚_雨天_雪天_风天}技能的伤害系数
    powerCost         = {0, 100},        -- {能量类型_数量} 能量类型, 0/1/2依次表示无消耗/金钱/MP, 数量,具体消耗数值
    skillCD           = 14000,          -- 技能冷却CD
    CDplace           = 84,               -- CD冷却占位
    castTime          = 0,               -- 技能吟唱时间,单位:毫秒
    bootTime          = 0,               -- 技能吟唱时间,单位:毫秒
    skillText_EN      = "ABC",
    skillText_CN      = "发射一束狐火随机沿途移动,并灼烧碰触目标造成425%伤害,冷却$14$秒。",
    bulletType        = "150801",             -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,               -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    attackType        = 2,               -- 1=真实伤害,2=护伤害甲,3=治疗
    skillAttack       = {42500, 1, 0},   -- {X_数据源_Y} 威力程式=X*数据源+Y , X=10000表示100%
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
    --skillAddGold      = {2500, 1},  --技能击中25%概率获得1点金币
}
defines["231203"] = skill -- 130201

function AutoSkillProperties.get(id)
    -- print("AutoSkillProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return AutoSkillProperties