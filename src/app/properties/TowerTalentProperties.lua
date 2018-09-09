

local TowerTalentProperties = {}

local defines = {}

------------------箭塔A天赋“疾风”----------------------
local skill = {
    mainID            = "630101",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    text_EN           = "Increase attacking.",
    text_CN           = "增加箭塔的攻击",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Shoot rate +16%",
    effectText_CN     = "基础攻击+16%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630102",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_1",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220701"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["630101"] = skill -- 130201

local skill = {
    mainID            = "630102",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    text_EN           = "Increase attacking.",
    text_CN           = "增加箭塔的攻击",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Shoot rate +34%",
    effectText_CN     = "基础攻击+34%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630103",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_1",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220702"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["630102"] = skill -- 130201

local skill = {
    mainID            = "630103",
    name_EN           = "Storm Arrow",
    name_CN           = "疾风",
    text_EN           = "Increase attacking.",
    text_CN           = "增加箭塔的攻击",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Shoot rate +50%",
    effectText_CN     = "基础攻击+50%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_1",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220703"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["630103"] = skill -- 130201

------------------箭塔A天赋“淬毒”----------------------
local skill = {
    mainID            = "630201",
    name_EN           = "Poisoned Arrow",
    name_CN           = "淬毒之矢",
    text_EN           = "Poinson the targets.",
    text_CN           = "被击中目标可能中毒5秒",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Poison 5 secs.",
    effectText_CN     = "每秒3点毒伤",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630202",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "bullet/eff_160104_poison.png",      -- 子弹图片
    },

    hitState          = {
      {3000, "200601"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    }, 
}
defines["630201"] = skill -- 130201

local skill = {
    mainID            = "630202",
    name_EN           = "Poisoned Arrow",
    name_CN           = "淬毒之矢",
    text_EN           = "Poinson the targets.",
    text_CN           = "被击中目标可能中毒5秒",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Poison 8 secs.",
    effectText_CN     = "每秒6点毒伤",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630203",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "bullet/eff_160104_poison.png",      -- 子弹图片
    },

    hitState          = {
      {3000, "200602"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    }, 
}
defines["630202"] = skill -- 130201

local skill = {
    mainID            = "630203",
    name_EN           = "Poisoned Arrow",
    name_CN           = "淬毒之矢",
    text_EN           = "Poinson the targets.",
    text_CN           = "被击中目标可能中毒5秒",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Poison 12 secs.",
    effectText_CN     = "每秒9点毒伤",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160104_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "bullet/eff_160104_poison.png",      -- 子弹图片
    },

    hitState          = {
      {3000, "200603"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    }, 
}
defines["630203"] = skill -- 130201

------------------箭塔B天赋“火焰箭”----------------------
local skill = {
    mainID            = "630301",
    name_EN           = "Flame Arrow",
    name_CN           = "爆裂火矢",
    text_EN           = "Release flame arrows and burst on the ground.",
    text_CN           = "对地面目标发射火焰箭并爆裂",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "15 Fire damage.",
    effectText_CN     = "15点火焰爆裂",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630302",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160105_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 6000, "230301"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
    sputterDamage      = 15     --火焰箭溅射的真实伤害

}
defines["630301"] = skill -- 130201

local skill = {
    mainID            = "630302",
    name_EN           = "Flame Arrow",
    name_CN           = "爆裂火矢",
    text_EN           = "Release flame arrows and burst on the ground.",
    text_CN           = "对地面目标发射火焰箭并爆裂",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "30 Fire damage.",
    effectText_CN     = "30点火焰爆裂",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630303",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160105_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 6000, "230302"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
    sputterDamage      = 30     --火焰箭溅射的真实伤害

}
defines["630302"] = skill -- 130201

local skill = {
    mainID            = "630303",
    name_EN           = "Flame Arrow",
    name_CN           = "爆裂火矢",
    text_EN           = "Release flame arrows and burst on the ground.",
    text_CN           = "对地面目标发射火焰箭并爆裂",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "45 Fire damage.",
    effectText_CN     = "45点火焰爆裂",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160105_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 6000, "230303"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
    sputterDamage      = 45     --火焰箭溅射的真实伤害
}
defines["630303"] = skill -- 130201

------------------箭塔B天赋“钉魂箭”----------------------
local skill = {
    mainID            = "630401",
    name_EN           = "Weakness Strike",
    name_CN           = "弱点击破",
    text_EN           = "Deal bonus damage.",
    text_CN           = "箭矢射击会造成叠加伤害",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "+4 attack.",
    effectText_CN     = "+4伤害/每击",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630402",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160105_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "eff_160104_magic",      -- 子弹图片
    },

    addDamage         = 4,               -- 钉魂箭每次攻击计甲伤害增加的步长
    maxDamage         = 80,              -- 钉魂箭最多附加的计甲伤害

}
defines["630401"] = skill -- 130201

local skill = {
    mainID            = "630402",
    name_EN           = "Weakness Strike",
    name_CN           = "弱点击破",
    text_EN           = "Deal bonus damage.",
    text_CN           = "箭矢射击会造成叠加伤害",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "+7 attack.",
    effectText_CN     = "+7伤害/每击",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630403",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160105_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "eff_160104_magic",      -- 子弹图片
    },

    addDamage         = 7,               -- 钉魂箭每次攻击计甲伤害增加的步长
    maxDamage         = 80,              -- 钉魂箭最多附加的计甲伤害

}
defines["630402"] = skill -- 130201

local skill = {
    mainID            = "630403",
    name_EN           = "Weakness Strike",
    name_CN           = "弱点击破",
    text_EN           = "Deal bonus damage.",
    text_CN           = "箭矢射击会造成叠加伤害",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "+10 attack.",
    effectText_CN     = "+10伤害/每击",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160105_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        bulletImages  = "eff_160104_magic",      -- 子弹图片
    },

    addDamage         = 10,               -- 钉魂箭每次攻击计甲伤害增加的步长
    maxDamage         = 80,               -- 钉魂箭最多附加的计甲伤害

}
defines["630403"] = skill -- 130201

------------------炮塔A天赋“大爆裂”----------------------
local skill = {
    mainID            = "630501",
    name_EN           = "Burst",
    name_CN           = "爆裂",
    text_EN           = "Improve the explosion scope",
    text_CN           = "暴击威力大幅度提升",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Burst scope +20%",
    effectText_CN     = "暴击伤害额外+50%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630502",
    levelGold         = 425,             -- 升到本级所需金币
    clickIcon         = "160204_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        --blastRadius   = {1, 12000},      -- 爆炸半径增加15%
        bulletImages  = "eff_160204_burst",      -- 子弹图片
        bombImages    = "eff_160204_burst_2",      -- 子弹击中地面后的爆炸效果
    },

    selfState         = {
       {10000, "220801"},                -- 附加自身状态, {附加概率_状态编号}
    },

}
defines["630501"] = skill -- 130201

local skill = {
    mainID            = "630502",
    name_EN           = "Burst",
    name_CN           = "爆裂",
    text_EN           = "Improve the explosion scope",
    text_CN           = "子弹爆裂范围大幅度提升",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Burst scope +30%",
    effectText_CN     = "暴击伤害额外+100%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630503",
    levelGold         = 425,             -- 升到本级所需金币
    clickIcon         = "160204_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        --blastRadius   = {1, 13000},      -- 爆炸半径增加10%
        bulletImages  = "eff_160204_burst",      -- 子弹图片
        bombImages    = "eff_160204_burst_2",      -- 子弹击中地面后的爆炸效果
    },

    selfState         = {
       {10000, "220802"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["630502"] = skill -- 130201

local skill = {
    mainID            = "630503",
    name_EN           = "Burst",
    name_CN           = "爆裂",
    text_EN           = "Improve the explosion scope",
    text_CN           = "子弹爆裂范围大幅度提升",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Burst scope +45%",
    effectText_CN     = "暴击伤害额外+150%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 425,             -- 升到本级所需金币
    clickIcon         = "160204_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        --blastRadius   = {1, 14500},      -- 爆炸半径增加10%
        bulletImages  = "eff_160204_burst",      -- 子弹图片
        bombImages    = "eff_160204_burst_2",      -- 子弹击中地面后的爆炸效果
    },

    selfState         = {
       {10000, "220803"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["630503"] = skill -- 130201

------------------炮塔A天赋“火图腾”----------------------
local skill = {
    mainID            = "630601",
    name_EN           = "Division",
    name_CN           = "小火树",
    text_EN           = "Summon a fire tree.",
    text_CN           = "召唤小火树协助战斗",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Inferior fire tree.",
    effectText_CN     = "低级小火树",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630602",
    levelGold         = 600,             -- 升到本级所需金币
    clickIcon         = "160204_2",      -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 20000, "230601"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["630601"] = skill -- 130201

local skill = {
    mainID            = "630602",
    name_EN           = "Division",
    name_CN           = "小火树",
    text_EN           = "Summon a fire tree.",
    text_CN           = "召唤小火树协助战斗",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Intermediate fire tree.",
    effectText_CN     = "中级小火树",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630603",
    levelGold         = 600,             -- 升到本级所需金币
    clickIcon         = "160204_2",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 20000, "230602"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["630602"] = skill -- 130201

local skill = {
    mainID            = "630603",
    name_EN           = "Division",
    name_CN           = "小火树",
    text_EN           = "Summon a fire tree.",
    text_CN           = "召唤小火树协助战斗",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Superior fire tree.",
    effectText_CN     = "高级小火树",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 600,             -- 升到本级所需金币
    clickIcon         = "160204_2",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 20000, "230603"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["630603"] = skill -- 130201

------------------炮塔A天赋“雷裂”----------------------
local skill = {
    mainID            = "630801",
    name_EN           = "Chain Lightning",
    name_CN           = "闪电链",
    text_EN           = "Add targets of Chain Lightning.",
    text_CN           = "增加雷电跳跃目标个数",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Add another 1 target.",
    effectText_CN     = "跳跃目标+1",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630802",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160205_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpNumber    = {0,1},           -- 雷电跳跃增加次数
    }
}
defines["630801"] = skill -- 130201

local skill = {
    mainID            = "630802",
    name_EN           = "Chain Lightning",
    name_CN           = "闪电链",
    text_EN           = "Add targets of Chain Lightning.",
    text_CN           = "增加雷电跳跃目标个数",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Add another 2 target.",
    effectText_CN     = "跳跃目标+2",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630803",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160205_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpNumber    = {0,2},           -- 雷电跳跃增加次数
    }
 
}
defines["630802"] = skill -- 130201

local skill = {
    mainID            = "630803",
    name_EN           = "Chain Lightning",
    name_CN           = "闪电链",
    text_EN           = "Add targets of Chain Lightning.",
    text_CN           = "增加雷电跳跃目标个数",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Add another 3 target.",
    effectText_CN     = "跳跃目标+3",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160205_1",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpNumber    = {0,3},           -- 雷电跳跃增加次数
    }
 
}
defines["630803"] = skill -- 130201

------------------炮塔B天赋“积雷”----------------------
local skill = {
    mainID            = "630901",
    name_EN           = "Flocked Lightning",
    name_CN           = "积雷",
    text_EN           = "Increase the damage bonus every leap.",
    text_CN           = "增加雷电每次跳跃伤害加成",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Damage +10% per leap.",
    effectText_CN     = "每跳跃1次伤害+10%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "630902",
    levelGold         = 500,             -- 升到本级所需金币
    clickIcon         = "160205_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpReduce    = {1,11000},       -- 跳跃衰减, 攻击衰减程式=a*攻击衰减^跳次
    }

}
defines["630901"] = skill -- 130201

local skill = {
    mainID            = "630902",
    name_EN           = "Flocked Lightning",
    name_CN           = "积雷",
    text_EN           = "Increase the damage bonus every leap.",
    text_CN           = "增加雷电每次跳跃伤害加成",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Damage +15% per leap.",
    effectText_CN     = "每跳跃1次伤害+15%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "630903",
    levelGold         = 500,             -- 升到本级所需金币
    clickIcon         = "160205_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpReduce    = {1,11500},       -- 跳跃衰减, 攻击衰减程式=a*攻击衰减^跳次
    }

}
defines["630902"] = skill -- 130201

local skill = {
    mainID            = "630903",
    name_EN           = "Flocked Lightning",
    name_CN           = "积雷",
    text_EN           = "Increase the damage bonus every leap.",
    text_CN           = "增加雷电每次跳跃伤害加成",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Damage +20% per leap.",
    effectText_CN     = "每跳跃1次伤害+20%",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 500,             -- 升到本级所需金币
    clickIcon         = "160205_2",              -- 游戏中升级天赋点击ICON

    changeBullets     = {                -- 第一个参数为0表示增加数值,1表示增加万分比 
        jumpReduce    = {1,12000},           -- 跳跃衰减, 攻击衰减程式=a*攻击衰减^跳次
    }
}
defines["630903"] = skill -- 130201

------------------仙术塔A天赋“追魂幡”----------------------
local skill = {
    mainID            = "631001",
    name_EN           = "Arcane Shackles",
    name_CN           = "奥术枷锁",
    text_EN           = "Slow down the target in 2 seconds.",
    text_CN           = "奥术飞弹缠绕目标使其减速",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Speed -75%",
    effectText_CN     = "减速2秒",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "631002",
    levelGold         = 550,             -- 升到本级所需金币
    clickIcon         = "160304_1",              -- 游戏中升级天赋点击ICON

    hitState          = {
        {10000, "200908"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
}
defines["631001"] = skill -- 130201

local skill = {
    mainID            = "631002",
    name_EN           = "Arcane Shackles",
    name_CN           = "奥术枷锁",
    text_EN           = "Slow down the target in 4 seconds.",
    text_CN           = "奥术飞弹缠绕目标使其减速",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Speed -75%",
    effectText_CN     = "减速3秒",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "631003",
    levelGold         = 550,             -- 升到本级所需金币
    clickIcon         = "160304_1",              -- 游戏中升级天赋点击ICON

    hitState          = {
        {10000, "200909"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    }, 
}
defines["631002"] = skill -- 130201

local skill = {
    mainID            = "631003",
    name_EN           = "Arcane Shackles",
    name_CN           = "奥术枷锁",
    text_EN           = "Slow down the target in 7 seconds.",
    text_CN           = "奥术飞弹缠绕目标使其减速",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Speed -75%",
    effectText_CN     = "减速5秒",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 550,             -- 升到本级所需金币
    clickIcon         = "160304_1",              -- 游戏中升级天赋点击ICON

    hitState          = {
        {10000, "200910"},       -- 击中目标状态, {附加概率_状态编号} 1000表示10%
    },
}
defines["631003"] = skill -- 130201

------------------仙术塔A天赋“招魂幡”----------------------
local skill = {
    mainID            = "631101",
    name_EN           = "Flocked Magic",
    name_CN           = "魔力积攒",
    text_EN           = "Deflower magic from the deads.",
    text_CN           = "奥术塔可召唤附近阵亡目标的魔力",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Magic +1.",
    effectText_CN     = "+1点魔力/阵亡怪物",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "631102",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160304_2",              -- 游戏中升级天赋点击ICON

    killRestore       = 1,               -- 每杀死一个怪收集几点魂魄
}
defines["631101"] = skill -- 130201

local skill = {
    mainID            = "631102",
    name_EN           = "Flocked Magic",
    name_CN           = "魔力积攒",
    text_EN           = "Deflower magic from the deads.",
    text_CN           = "奥术塔可召唤附近阵亡目标的魔力",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Magic +2.",
    effectText_CN     = "+2点魔力/阵亡怪物",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "631103",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160304_2",              -- 游戏中升级天赋点击ICON

    killRestore       = 2,               -- 每杀死一个怪收集几点魂魄
}
defines["631102"] = skill -- 130201

local skill = {
    mainID            = "631103",
    name_EN           = "Flocked Magic",
    name_CN           = "魔力积攒",
    text_EN           = "Deflower magic from the deads.",
    text_CN           = "奥术塔可召唤附近阵亡目标的魔力",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Magic +3.",
    effectText_CN     = "+3点魔力/阵亡怪物",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160304_2",              -- 游戏中升级天赋点击ICON

    killRestore       = 3,               -- 每杀死一个怪收集几点魂魄
}
defines["631103"] = skill -- 130201

------------------仙术塔B天赋“千年狐火”----------------------
local skill = {
    mainID            = "631201",
    name_EN           = "Destructive Beam",
    name_CN           = "破坏之光",
    text_EN           = "Emit a Destructive Beam.",
    text_CN           = "发射一束毁灭激光",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Cooldown: 22 seconds.",
    effectText_CN     = "22秒冷却",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "631202",
    levelGold         = 300,             -- 升到本级所需金币
    clickIcon         = "160305_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 22000, "231201"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["631201"] = skill -- 130201

local skill = {
    mainID            = "631202",
    name_EN           = "Destructive Beam",
    name_CN           = "破坏之光",
    text_EN           = "Emit a Destructive Beam.",
    text_CN           = "发射一束毁灭激光",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Cooldown: 18 seconds.",
    effectText_CN     = "18秒冷却",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "631203",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160305_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 18000, "231202"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["631202"] = skill -- 130201

local skill = {
    mainID            = "631203",
    name_EN           = "Destructive Beam",
    name_CN           = "破坏之光",
    text_EN           = "Emit a Destructive Beam.",
    text_CN           = "发射一束毁灭激光",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = "Cooldown: 14 seconds.",
    effectText_CN     = "14秒冷却",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 500,             -- 升到本级所需金币
    clickIcon         = "160305_1",              -- 游戏中升级天赋点击ICON

    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        -- {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 3500, "230203"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 14000, "231203"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },
}
defines["631203"] = skill -- 130201

------------------仙术塔B天赋“魅惑之击”----------------------
local skill = {
    mainID            = "631301",
    name_EN           = "Elemental Destruction",
    name_CN           = "元素破坏",
    text_EN           = "Get Armor Piercing permanently. ",
    text_CN           = "太阳塔获得永久穿透效果",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = " +30% Pierce.",
    effectText_CN     = "忽略30%护甲",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 1,               -- 等级
    nextLvID          = "631302",
    levelGold         = 400,             -- 升到本级所需金币
    clickIcon         = "160305_2",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220902"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["631301"] = skill -- 130201

local skill = {
    mainID            = "631302",
    name_EN           = "Elemental Destruction",
    name_CN           = "元素破坏",
    text_EN           = "Get Armor Piercing permanently. ",
    text_CN           = "太阳塔获得永久穿透效果",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = " +60% Pierce.",
    effectText_CN     = "忽略60%护甲",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 2,               -- 等级
    nextLvID          = "631303",
    levelGold         = 500,             -- 升到本级所需金币
    clickIcon         = "160305_2",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220903"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["631302"] = skill -- 130201

local skill = {
    mainID            = "631303",
    name_EN           = "Elemental Destruction",
    name_CN           = "元素破坏",
    text_EN           = "Get Armor Piercing permanently. ",
    text_CN           = "太阳塔获得永久穿透效果",    -- TIPS显示：塔天赋描述文字,用来在界面中显示
    effectText_EN     = " +90% Pierce.",
    effectText_CN     = "忽略90%护甲",      -- TIPS显示：效果描述文字,用来在界面中显示
    level             = 3,               -- 等级
    nextLvID          = "",
    levelGold         = 600,             -- 升到本级所需金币
    clickIcon         = "160305_2",              -- 游戏中升级天赋点击ICON

    selfState         = {
       {10000, "220904"},                -- 附加自身状态, {附加概率_状态编号}
    },
}
defines["631303"] = skill -- 130201

function TowerTalentProperties.get(id)
    -- print("TowerTalentProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return TowerTalentProperties