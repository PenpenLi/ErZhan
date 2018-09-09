

local BuffProperties = {}

local defines = {}

------------------系统状态----------------------
local buff = {
    mainID            = "220301",
    name              = "罗刹",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 4,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "永久性暴击威力+50%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},    --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},     --{吸伤概率_X_数据源_Y} 
    -- 数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- reboundAttack     = {5000, 0, 0, 1, 1},  --反弹攻击，{反伤概率_ X_数据源_Y _反弹伤害类型}
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {1, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 5000},            -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack            = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                --是否消失，英雄被移除
    },
}
defines["220301"] = buff -- 技能130321

local buff = {
    mainID            = "220302",
    name              = "罗刹",
    --featureSkill    = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 4,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "永久性暴击威力+100%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 10000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},             -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220302"] = buff -- 技能130321

local buff = {
    mainID            = "220303",
    name              = "罗刹",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 4,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "永久性暴击威力+150%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 15000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220303"] = buff -- 技能130321

local buff = {
    mainID            = "220501",
    name              = "风驰电掣",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 23,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "鹏魔王参与执行任务时，任务完成速度提升20%，额外获得$10%$金币收益",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220501"] = buff -- 技能130321

local buff = {
    mainID            = "220502",
    name              = "风驰电掣",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 23,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "鹏魔王参与执行任务时，任务完成速度提升20%，额外获得$20%$金币收益",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220502"] = buff -- 技能130321

local buff = {
    mainID            = "220503",
    name              = "风驰电掣",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 23,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "鹏魔王参与执行任务时，任务完成速度提升20%，额外获得$30%$金币收益",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220503"] = buff -- 技能130321

local buff = {
    mainID            = "220601",
    name              = "自然馈赠",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 27,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "治疗效果提升$30%$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        treatmentEffect      = {0, 13000},          -- 治疗效果，治疗效果*110%
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220601"] = buff -- 技能130321

local buff = {
    mainID            = "220602",
    name              = "自然馈赠",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 27,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "治疗效果提升$60%$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        treatmentEffect      = {0, 16000},          -- 治疗效果，治疗效果*110%
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220602"] = buff -- 技能130321

local buff = {
    mainID            = "220603",
    name              = "自然馈赠",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 27,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "治疗效果提升$100%$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        treatmentEffect      = {0, 20000},          -- 治疗效果，治疗效果*110%
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220603"] = buff -- 技能130321

local buff = {
    mainID            = "220701",
    name              = "疾风",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 30,              -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "箭矢攻击+25%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {0, 3},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220701"] = buff -- 技能130321

local buff = {
    mainID            = "220702",
    name              = "疾风",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 31,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "箭矢攻击+50%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {0, 3},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220702"] = buff -- 技能130321

local buff = {
    mainID            = "220703",
    name              = "疾风",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 32,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "箭矢攻击+75%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 5000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {0, 3},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220703"] = buff -- 技能130321

local buff = {
    mainID            = "220801",
    name              = "大爆裂",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 31,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "炮塔暴击威力提升50%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        --critical             = {0, 5000},         -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220801"] = buff -- 技能130321

local buff = {
    mainID            = "220802",
    name              = "大爆裂",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 32,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "炮塔暴击威力提升100%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        --critical             = {1, 13000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220802"] = buff -- 技能130321

local buff = {
    mainID            = "220803",
    name              = "大爆裂",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 33,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "炮塔暴击威力提升150%",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        --critical            = {0, 14500},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["220803"] = buff -- 技能130321

local buff = {
    mainID            = "220901",
    name              = "软猬甲",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_rebound",  -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 36,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "受到攻击时反弹15点伤害",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},    --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},     --{吸伤概率_X_数据源_Y} 
    -- 数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    reboundAttack     = {10000, 0, 0, 15},  --反弹攻击，{反伤概率_ X_数据源_Y},反弹伤害默认为真实伤害
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack            = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                --是否消失，英雄被移除
    },
}
defines["220901"] = buff -- 技能130321

local buff = {
    mainID            = "220902",
    name              = "魅惑穿透",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 40,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "普通攻击无视目标30%免伤",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},    --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},     --{吸伤概率_X_数据源_Y} 
    -- 数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- reboundAttack     = {10000, 0, 0, 1},  --反弹攻击，{反伤概率_ X_数据源_Y},反弹伤害默认为真实伤害
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack            = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        addReduceDamage   = {0, 3000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                --是否消失，英雄被移除
    },
}
defines["220902"] = buff -- 技能130321

local buff = {
    mainID            = "220903",
    name              = "魅惑穿透",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 41,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "普通攻击无视目标60%免伤",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},    --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},     --{吸伤概率_X_数据源_Y} 
    -- 数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- reboundAttack     = {10000, 0, 0, 1},  --反弹攻击，{反伤概率_ X_数据源_Y},反弹伤害默认为真实伤害
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack            = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        addReduceDamage   = {0, 3000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                --是否消失，英雄被移除
    },
}
defines["220903"] = buff -- 技能130321

local buff = {
    mainID            = "220904",
    name              = "魅惑穿透",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 42,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "普通攻击无视目标90%免伤",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},    --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},     --{吸伤概率_X_数据源_Y} 
    -- 数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    -- reboundAttack     = {10000, 0, 0, 1},  --反弹攻击，{反伤概率_ X_数据源_Y},反弹伤害默认为真实伤害
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack            = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        addReduceDamage   = {0, 3000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                --是否消失，英雄被移除
    },
}
defines["220904"] = buff -- 技能130321

local buff = {
    mainID            = "220905",
    name              = "细水长流",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_220905_buff",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 41,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 30000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "最大生命+30%，持续30秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220905"] = buff

local buff = {
    mainID            = "220906",
    name              = "RMB塔圣塔光辉",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_170201_glory_2",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 41,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 15000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "全屏范围内随机强化最多4个攻击塔，攻击+50%，持续15秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        attack               = {1, 15000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220906"] = buff

local buff = {
    mainID            = "220907",
    name              = "冰龙冻塔",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100503_tour_2",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 48,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "冰冻住塔，玩家手动点击移除",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                  --是否消失，英雄被移除
        isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220907"] = buff

local buff = {
    mainID            = "220908",
    name              = "岩浆点燃",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100504_shielded_3",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 49,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 600000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "点燃一座塔，再次点燃时候摧毁该塔",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        --isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220908"] = buff

local buff = {
    mainID            = "220909",
    name              = "光之护甲",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100301_shield",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 50,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = -1,            -- 持续时间,单位：毫秒，-1表示永久
    superposition     = 0,               -- 是否层叠
    buffText          = "光之精灵护甲大幅度提升（+50%伤害减免）",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        reduceDamage         = {0, 5000},           -- 免伤比例基础加成,500表示5.00%
        armor                = {0, 100},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        --isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220909"] = buff

local buff = {
    mainID            = "220910",
    name              = "光之恢复",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100403_restore",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 51,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒，-1表示永久
    superposition     = 0,               -- 是否层叠
    buffText          = "水之精灵每秒恢复20%生命。",
    --sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {2000, 3, 0, 10},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {10, 3000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        --isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220910"] = buff

local buff = {
    mainID            = "220911",
    name              = "暗之行走",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 52,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 60000,            -- 持续时间,单位：毫秒，-1表示永久
    superposition     = 0,               -- 是否层叠
    buffText          = "暗之精灵进入影遁，建筑塔无法攻击，需要英雄对战，建筑塔方可攻击",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {1000, 3, 0, 60},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {10, 3000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        --isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220911"] = buff

local buff = {
    mainID            = "220912",
    name              = "冰之冻结",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100503_tour_2",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 53,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 60000,            -- 持续时间,单位：毫秒，-1表示永久
    superposition     = 0,               -- 是否层叠
    buffText          = "使范围内的建筑塔被冻结无法攻击，持续3秒，玩家可以手动点击移除",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {1000, 3, 0, 60},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {10, 3000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220912"] = buff

local buff = {
    mainID            = "220913",
    name              = "风之迅捷",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100211_accelerate_2",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 54,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒，-1表示永久
    superposition     = 0,               -- 是否层叠
    buffText          = "使范围内的精灵移动速度+50%，持续3秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {1000, 3, 0, 60},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed             = {0, 60},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage        = {10, 3000},           -- 免伤比例基础加成,500表示5.00%
        --armor              = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 13000},            -- 最大 HP基础加成
        --attack               = {1, 10150},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
        --isHide               = 1,                  --是否不进行碰撞检测
    },
}
defines["220913"] = buff

local buff = {
    mainID            = "220914",
    name              = "法阵激活",          ---------第九关模式3
    --featureSkill    = "animationName",   -- 特写动画
    level             = 1,                -- 等级
    effect            = "eff_magicmatrix",    -- 释放光效
    buffType          = 3,                -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 55,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 30000,            -- 持续时间,单位：毫秒
    superposition     = 0,                -- 是否层叠
    buffText          = "三个英雄拾取1个法阵后，持续激活显示",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed                = {1, 4500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["220914"] = buff

local buff = {
    mainID            = "220915",
    name              = "火焰精华",          ---------第十关模式3
    --featureSkill    = "animationName",   -- 特写动画
    level             = 1,                -- 等级
    effect            = "eff_jinghua2",    -- 释放光效
    buffType          = 3,                -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 56,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 20000,            -- 持续时间,单位：毫秒
    superposition     = 0,                -- 是否层叠
    buffText          = "拾取并且运送精华",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed                = {1, 4500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["220915"] = buff

-----------------增益状态------------------
local buff = {
    mainID            = "210501",
    name              = "杏花雨露",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 28,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每0.5秒回复$3.0%$附加$4$点生命，持续5秒。",
    sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {300, 9, 4, 10}, --{X_数据源_Y_跳数}
    --impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210501"] = buff -- 技能130321

local buff = {
    mainID            = "210502",
    name              = "杏花雨露",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 28,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每0.5秒回复$3.5%$附加$5$点生命，持续5秒。",
    sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {350, 9, 5, 10}, --{X_数据源_Y_跳数}
    --impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210502"] = buff -- 技能130321

local buff = {
    mainID            = "210503",
    name              = "杏花雨露",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 28,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每0.5秒回复$4.0%$附加$7$点生命，持续5秒。",
    sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {400, 9, 7, 10}, --{X_数据源_Y_跳数}
    --impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210503"] = buff -- 技能130321

local buff = {
    mainID            = "210504",
    name              = "杏花雨露",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 28,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每0.5秒回复$4.5%$附加$9$点生命，持续5秒。",
    sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {450, 9, 9, 10}, --{X_数据源_Y_跳数}
    --impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210504"] = buff -- 技能130321

local buff = {
    mainID            = "210505",
    name              = "杏花雨露",
    --featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 28,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每0.5秒回复$5.0%$附加$11$点生命，持续5秒。",
    sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {500, 9, 11, 10}, --{X_数据源_Y_跳数}
    --impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210505"] = buff -- 技能130321

local buff = {
    mainID            = "210901",
    name              = "龙吟回血",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Treat",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 33,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 1000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "回复30%生命",
    --sound           = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {3000, 3, 0, 1},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 3333},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210901"] = buff

local buff = {
    mainID            = "210701",
    name              = "狐狸吸盾",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110101_shield",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 34,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 30000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "每隔30秒获得1个30秒吸伤盾，吸收相当自身生命45%的伤害时破掉。",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    absorbShield      = {10000, 4500, 3, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210701"] = buff -- 技能130321

local buff = {
    mainID            = "210801",
    name              = "精灵起源",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_attackup_1",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 35,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,           -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "10秒内攻击力+10",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 2000, 3, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 8500},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold            = {1, 0},            -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {0, 10},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210801"] = buff -- 技能130321


local buff = {
    mainID            = "220401",
    name              = "雷扰",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 13,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "建筑塔攻击速度-100%，持续10秒",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        cooldown            = {1, 20000},           -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 15000},         -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220401"] = buff -- 技能130321

local buff = {
    mainID            = "220402",
    name              = "漏电",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 14,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "建筑塔攻击范围-50%，持续10秒。",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        fireRange            = {1, 5000},            -- 近战范围基础加成,单位：像素
        --cooldown            = {1, 5000},         -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 15000},         -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220402"] = buff -- 技能130321

local buff = {
    mainID            = "220403",
    name              = "玲珑塔",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 17,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "罩住英雄消失5秒",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        --fireRange            = {1, 5000},            -- 近战范围基础加成,单位：像素
        --cooldown            = {1, 5000},         -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 15000},         -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220403"] = buff -- 技能130321

local buff = {
    mainID            = "220404",
    name              = "哮天犬",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 3,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 18,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,              -- 持续时间,-1表示无限
    superposition     = 0,               -- 是否层叠
    buffText          = "罩住英雄消失5秒",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {0, 0, 0, 0},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命

    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        --fireRange            = {1, 5000},        -- 近战范围基础加成,单位：像素
        --cooldown            = {1, 5000},         -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 15000},         -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp            = {0, 5},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        addGold              = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["220404"] = buff -- 技能130321

------------------增益状态----------------------
local buff = {
    mainID            = "210101",
    name              = "狂怒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110301_shield",    -- 持续光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 3,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "10秒吸伤盾,最多可吸收$250$点伤害,效果期间普攻吸血+$50$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    absorbShield      = {10000, 0, 0, 250},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        suckHp              = {0, 50},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},             -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210101"] = buff

local buff = {
    mainID            = "210102",
    name              = "狂怒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110301_shield",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 3,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "10秒吸伤盾,最多可吸收$300$点伤害,效果期间普攻吸血+$65$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    absorbShield      = {10000, 0, 0, 300},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        suckHp              = {0, 65},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},             -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210102"] = buff

local buff = {
    mainID            = "210103",
    name              = "狂怒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110301_shield",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 3,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "10秒吸伤盾,最多可吸收$350$点伤害,效果期间普攻吸血+$80$",
    --sound             = "soundName",     -- 音效
    -- attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    -- stateAttack       = {0, 0, 0, 0},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    absorbShield      = {10000, 0, 0, 350},   --{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        suckHp              = {0, 80},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},             -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210103"] = buff

local buff = {
    mainID            = "210201",
    name              = "狐威",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 6,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续3秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},          -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1            = {1, 3000},        -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210201"] = buff

local buff = {
    mainID            = "210202",
    name              = "狐威",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 20,              -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续3秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown          = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},             -- 近战冷却时间基础加成 ,
        cooldown2           = {1, 2500},             -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210202"] = buff

local buff = {
    mainID            = "210203",
    name              = "狐威",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 21,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续3秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},          -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210203"] = buff

local buff = {
    mainID            = "210204",
    name              = "狐威",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 22,              -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续3秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 3333},          -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210204"] = buff

----------------------快速射击发动存在时间延长0.5秒-----------
local buff = {
    mainID            = "210601",
    name              = "暴走",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 6,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续5秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},          -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1            = {1, 3000},        -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210601"] = buff

local buff = {
    mainID            = "210602",
    name              = "暴走",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 20,              -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续5秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown          = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},             -- 近战冷却时间基础加成 ,
        cooldown2           = {1, 2500},             -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210602"] = buff

local buff = {
    mainID            = "210603",
    name              = "暴走",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 21,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续5秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},          -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210603"] = buff

local buff = {
    mainID            = "210204",
    name              = "暴走",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110204_speed",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 22,              -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "远程攻击速度提高400%，持续5秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 3333},          -- 近战冷却时间基础加成 ,
        cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210604"] = buff

-------------------------------

local buff = {
    mainID            = "210401",
    name              = "潜能激发",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110205_attack",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 26,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "攻击力提升$50%$，持续10秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},          -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1            = {1, 3000},        -- 近战冷却时间基础加成 ,
        --cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {1, 15000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210401"] = buff

local buff = {
    mainID            = "210402",
    name              = "潜能激发",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110205_attack",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 26,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "攻击力提升$75%$，持续10秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},          -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1            = {1, 3000},        -- 近战冷却时间基础加成 ,
        --cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {1, 17500},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210402"] = buff

local buff = {
    mainID            = "210403",
    name              = "潜能激发",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110205_attack",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 26,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "攻击力提升$200%$，持续10秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},          -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1            = {1, 3000},        -- 近战冷却时间基础加成 ,
        --cooldown2            = {1, 2500},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210403"] = buff

local buff = {
    mainID            = "210301",
    name              = "回血",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100403_restore",    -- 持续光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 8,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒回复10%生命，持续5秒",
    --sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {1000, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 3333},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 3333},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210301"] = buff

local buff = {
    mainID            = "210302",
    name              = "狂暴",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 10,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "攻击+100%，攻击速度+100%，持续5秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210302"] = buff

local buff = {
    mainID            = "210303",
    name              = "强化",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 11,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 60000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "攻击+300%，攻击速度+100%，持续60秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {10, 3, 0, 5},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage         = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor                = {1, 20000},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        attack               = {1, 30000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210303"] = buff

local buff = {
    mainID            = "210304",
    name              = "熔岩血脉",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100403_restore",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 11,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒恢复1%生命，持续10秒",
    --sound             = "soundName",     -- 音效
    attackType        = 3,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {100, 3, 0, 10},      --{X_数据源_Y_跳数}
    -- impact           = 1,                    --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage         = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor                = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 15000},            -- 最大 HP基础加成
        --attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210304"] = buff

local buff = {
    mainID            = "210305",
    name              = "狂奔",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 19,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 2000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "300%速度狂奔2秒，对沿途的敌人造成200%伤害，撞到目标后停止狂奔",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                 -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {200, 1, 0, 1},      --{X_数据源_Y_跳数}
    impact            = {1,20000,1,0,2},        --{撞击次数_X_数据源_Y_伤害类型}，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 30000},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage         = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor                = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 15000},            -- 最大 HP基础加成
        --attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["210305"] = buff

local buff = {
    mainID            = "210306",
    name              = "龙鳞盾",
    --featureSkill    = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100407_shield",    -- 释放光效
    buffType          = 2,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 8,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 8000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "释放吸伤盾，吸收[当前生命100%]的伤害量，持续8秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                 -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {200, 1, 0, 1},      --{X_数据源_Y_跳数}
    --impact            = {1,20000,1,0,2},        --{撞击次数_X_数据源_Y_伤害类型}，数值，表示同个目标的撞击次数限制
    absorbShield      = {10000, 10000, 4, 0},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed                = {1, 20000},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        --reduceDamage         = {1, 20000},           -- 免伤比例基础加成,500表示5.00%
        --armor                = {1, 20000},             -- 护甲基础加成
        --maxHp                = {1, 15000},            -- 最大 HP基础加成
        --attack               = {1, 20000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                --是否消失，英雄被移除
    },
}
defines["210306"] = buff

------------------减益状态----------------------
local buff = {
    mainID            = "200101",
    name              = "天罗地网",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110204_wasp_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 5,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "昏迷3秒,每秒造成$20%$攻击附加$2$点伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {2000, 1, 2, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200101"] = buff

local buff = {
    mainID            = "200102",
    name              = "天罗地网",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110204_wasp_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 5,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "昏迷3秒,每秒造成$24%$攻击附加$3$点伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {2400, 1, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200102"] = buff

local buff = {
    mainID            = "200103",
    name              = "天罗地网",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110204_wasp_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 5,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "昏迷3秒,每秒造成$28%$攻击附加$4$点伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {2800, 1, 4, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200103"] = buff

local buff = {
    mainID            = "200104",
    name              = "天罗地网",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110204_wasp_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 5,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "昏迷3秒,每秒造成$32%$攻击附加$5$点伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {3200, 1, 16, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200104"] = buff

local buff = {
    mainID            = "200105",
    name              = "天罗地网",
    --featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "eff_110204_wasp_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 5,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "昏迷3秒,每秒造成$36%$攻击附加$6$点伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {3600, 1, 6, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200105"] = buff

------------------减益状态----------------------
local buff = {
    mainID            = "200106",
    name              = "明王愤伤",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160305_destroy_1_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 57,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 500,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并有一定几率造成$沙特当前生命*50%$伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {5000, 4, 0, 1},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200106"] = buff

local buff = {
    mainID            = "200107",
    name              = "明王愤伤",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_160305_destroy_1_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 57,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 500,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并有一定几率造成$沙特当前生命*50%$伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {5000, 4, 0, 1},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200107"] = buff

local buff = {
    mainID            = "200108",
    name              = "明王愤伤",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_160305_destroy_1_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 57,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 500,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并有一定几率造成$沙特当前生命*50%$伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {5000, 4, 0, 1},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200108"] = buff

local buff = {
    mainID            = "200109",
    name              = "明王愤伤",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_160305_destroy_1_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 57,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 500,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并有一定几率造成$沙特当前生命*50%$伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {5000, 4, 0, 1},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200109"] = buff

local buff = {
    mainID            = "200110",
    name              = "明王愤伤",
    --featureSkill      = "animationName", -- 特写动画
    level             = 5,               -- 等级
    effect            = "eff_160305_destroy_1_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 57,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 500,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并有一定几率造成$沙特当前生命*50%$伤害。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {5000, 4, 0, 1},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200110"] = buff

----------------
local buff = {
    mainID            = "200201",
    name              = "龙吟",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110102_weaken",    -- 持续光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 7,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 2000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "护甲-20,持续时间$2$秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},           -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},           -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},          -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},           -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        reduceDamage         = {0, -2000},          -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200201"] = buff

local buff = {
    mainID            = "200202",
    name              = "龙吟",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_110102_weaken",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 7,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "护甲-20,持续时间$3$秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        reduceDamage      = {0, -2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200202"] = buff

local buff = {
    mainID            = "200203",
    name              = "龙吟",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_110102_weaken",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 7,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 4000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "护甲-20,持续时间$4$秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        reduceDamage      = {0, -2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200203"] = buff

local buff = {
    mainID            = "200204",
    name              = "龙吟",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    effect            = "eff_110102_weaken",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 7,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "护甲-20,持续时间$5$秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        reduceDamage      = {0, -2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 0,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200204"] = buff

local buff = {
    mainID            = "200501",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$6$点真实伤害，持续5秒。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 6, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 9500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200501"] = buff

local buff = {
    mainID            = "200502",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$10$点真实伤害，持续5秒。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 10, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 9000},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200502"] = buff

local buff = {
    mainID            = "200503",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$16$点真实伤害，持续5秒。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 16, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200503"] = buff

local buff = {
    mainID            = "200504",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
     effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$30$点真实伤害，持续5秒。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 30, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200504"] = buff

local buff = {
    mainID            = "200601",
    name              = "淬毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 29,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "中毒5秒，每秒造成3点毒伤",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200601"] = buff

local buff = {
    mainID            = "200602",
    name              = "淬毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 29,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 8000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "中毒5秒，每秒造成6点毒伤",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 6, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200602"] = buff

local buff = {
    mainID            = "200603",
    name              = "淬毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 29,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 12000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "中毒5秒，每秒造成9点毒伤",
    --sound             = "soundName",   -- 音效
    attackType        = 1,               -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 9, 5},    --{X_数据源_Y_跳数}
    -- impact           = 1,             --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200603"] = buff

local buff = {
    mainID            = "200301",
    name              = "巨魔沉睡",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Hypnosis",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 9,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "英雄陷入5秒沉睡",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200301"] = buff

local buff = {
    mainID            = "200302",
    name              = "熊吼",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Coma",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 12,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 4000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "英雄陷入2秒昏迷",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200302"] = buff

local buff = {
    mainID            = "200303",
    name              = "巨掌流血",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Bleed",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 16,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒-10点生命，持续5秒。",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 10, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        -- speed             = {0, 10},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200303"] = buff

local buff = {
    mainID            = "200304",
    name              = "麻痹毒素",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160304_buff_slow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 45,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 12000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "使人麻痹，移动速度-50%，持续12秒",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 10, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed             = {1, 5000},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200304"] = buff

local buff = {
    mainID            = "200305",
    name              = "引燃",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_100202_fire_2",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 46,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 10000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒-15生命，持续5秒",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 15,10},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed             = {1, 5000},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200305"] = buff

local buff = {
    mainID            = "200306",
    name              = "恶魔蝙蝠撕咬",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160104_poisoning",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 47,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 15000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成1%生命伤害，持续15秒",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {100, 9, 0,15},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        -- cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        -- cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed             = {1, 5000},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200306"] = buff

local buff = {
    mainID            = "200401",
    name              = "魔像减速",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110301_slow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 19,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "魔像向四周发散音波，使范围800像素内的所有目标速度-60%，持续5秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed               = {1, 4000},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200401"] = buff
-------------------------------羁绊明王忿化附加减速效果---------
local buff = {
    mainID            = "200701",
    name              = "蛟龙减速",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110301_slow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 32,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "移速-75%，持续3秒。",
    --sound             = "soundName",     -- 音效
    --attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {3200, 1, 9, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        -- cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 5000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 5000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed               = {1, 2500},            -- 移动速度基础加成,单位：像素/秒
        -- criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        -- suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 2000},              -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        -- attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 0,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200701"] = buff

local buff = {
    mainID            = "200801",
    name              = "龙吟DOT",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_110102_sustained_damage",    -- 持续光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 34,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 4000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "4秒内每0.5秒-20生命",
    --sound             = "soundName",     -- 音效
    attackType        = 2,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 20, 8},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed               = {1, 8500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200801"] = buff

----------------荆棘花毒附带减速-------------
local buff = {
    mainID            = "200901",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$10$点真实伤害，持续5秒。期间，移动速度-25%",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 10, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed               = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200901"] = buff

local buff = {
    mainID            = "200902",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$15$点真实伤害，持续5秒。期间，移动速度-25%",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 15, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed               = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200902"] = buff

local buff = {
    mainID            = "200903",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "并每秒造成$20$点真实伤害，持续5秒。期间，移动速度-25%",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 20, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown         = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1         = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2         = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed               = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp              = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold              = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack               = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma                 = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly            = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear            = 1,                  --是否消失，英雄被移除
    },
}
defines["200903"] = buff

local buff = {
    mainID            = "200904",
    name              = "荆棘花毒",
    --featureSkill      = "animationName", -- 特写动画
    level             = 4,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 25,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "每秒造成$30$点真实伤害，持续5秒。期间，移动速度-25%",
    --sound             = "soundName",     -- 音效
    attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    stateAttack       = {0, 0, 30, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        -- reduceDamage      = {0, 500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                  --是否消失，英雄被移除
    },
}
defines["200904"] = buff

local buff = {
    mainID            = "200905",
    name              = "狐魅术",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    --effect            = "effectName",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 37,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 6000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "6秒降低目标的护甲25%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed                = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},          -- 祭坛塔的生产钱
        reduceDamage      = {1, 7500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},       -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    addData = {
        --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
        --forbidSkill        = 0,                  --禁止手技能
        --forbidStealth      = 0,                  --禁止地行走
        --forbidFly          = 1,                  --禁止飞行
        --deformation        = 0,                  --是否变形
        --fear               = 0,                  --是否恐惧
        --invincible         = 0,                  --是否无敌
        --disappear          = 1,                  --是否消失，英雄被移除
    },
}
defines["200905"] = buff

local buff = {
    mainID            = "200906",
    name              = "嘲讽",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_170301_anger",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 38,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 6000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "6秒嘲讽，使他2种援军对其伤害+25%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        --speed              = {1, 7500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["200906"] = buff

local buff = {
    mainID            = "200907",
    name              = "踏地减速",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "Coma",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 38,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "3秒内减速50%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 5000},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["200907"] = buff

local buff = {
    mainID            = "200908",
    name              = "奥术枷锁",
    --featureSkill      = "animationName", -- 特写动画
    level             = 1,               -- 等级
    effect            = "eff_160304_buffslow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 42,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 2000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "2秒内减速75%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 2500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["200908"] = buff

local buff = {
    mainID            = "200909",
    name              = "奥术枷锁",
    --featureSkill      = "animationName", -- 特写动画
    level             = 2,               -- 等级
    effect            = "eff_160304_buffslow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 42,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 3000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "3秒内减速55%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 2500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["200909"] = buff

local buff = {
    mainID            = "200910",
    name              = "奥术枷锁",
    --featureSkill      = "animationName", -- 特写动画
    level             = 3,               -- 等级
    effect            = "eff_160304_buffslow",    -- 释放光效
    buffType          = 1,               -- 类型,1/2/3,1=减益,2=增益,3=系统
    occupied          = 42,               -- 状态占位相同时,新来顶掉原来,原来直接删除
    retainTime        = 5000,            -- 持续时间,单位：毫秒
    superposition     = 0,               -- 是否层叠
    buffText          = "5秒内减速75%",
    --sound             = "soundName",     -- 音效
    --attackType        = 1,                -- 1=真实伤害,2=护伤害甲,3=治疗
    --stateAttack       = {0, 0, 3, 5},        --{X_数据源_Y_跳数}
    -- impact           = 1,                --撞击能力，数值，表示同个目标的撞击次数限制
    --absorbShield      = {10000, 0, 0, 100},   --吸伤盾{吸伤概率_X_数据源_Y} 
    --数据源：0=无,1=攻击,2=护甲,3=最大生命,4=当前生命5=闪避率,6=暴击率,7=暴击威力,8=当前金币,9=目标最大生命,10=目标当前生命
    
    buffData = {                                   -- 第一个参数为0表示增加数值,1表示增加万分比 
        -- fireVision        = {0, 10},            -- 射击范围基础加成,单位：像素
        -- fireRange         = {0, 10},            -- 近战范围基础加成,单位：像素
        --cooldown           = {1, 6000},            -- 塔的攻击冷却时间，单位：毫秒
        --cooldown1          = {1, 6000},          -- 近战冷却时间基础加成 ,
        --cooldown2          = {1, 6000},          -- 远程冷却时间基础加成 ,单位：毫秒
        speed                = {1, 2500},            -- 移动速度基础加成,单位：像素/秒
        --criticalPower      = {0, 5000},           -- 暴击伤害的威力基础加成 50%
        -- dodge             = {0, 500},           -- 闪避率基础加成。值代表5%
        --suckHp             = {0, 20},             -- 普攻吸血基础加成 5点
        -- atkGold           = {0, 1},             -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
        -- addGold           = {1, 0},             -- 祭坛塔的生产钱
        -- reduceDamage         = {0, -2500},           -- 免伤比例基础加成,500表示5.00%
        -- armor             = {0, 5},             -- 护甲基础加成
        -- maxHp             = {0, 20},            -- 最大 HP基础加成
        --attack             = {1, 14000},         -- 攻击力基础加成
        -- critical          = {0, 1000},          -- 暴击率基础加成。值代表10%
        -- restoreHp         = {0, 18},            -- 生命回复/波 基础加成
        -- addReduceDamage   = {0, 1000},          -- 穿透率率基础加成。值代表10%
    },
    -- addData = {
    --     --coma               = 1,                  --是否昏迷,0表示不昏迷,1表示昏迷
    --     --forbidSkill        = 0,                  --禁止手技能
    --     --forbidStealth      = 0,                  --禁止地行走
    --     --forbidFly          = 1,                  --禁止飞行
    --     --deformation        = 0,                  --是否变形
    --     --fear               = 0,                  --是否恐惧
    --     --invincible         = 0,                  --是否无敌
    --     --disappear          = 1,                  --是否消失，英雄被移除
    -- },
}
defines["200910"] = buff



function BuffProperties.get(id)
    -- print("BuffProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return BuffProperties