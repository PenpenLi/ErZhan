
local SoldierProperties = {}

local defines = {}
---------------------------召唤兵（MT型）-----------------------------
local soldier = {
    mainID            = "170101",
    name              = "1级猴兵",    --孙悟空主动技能召唤兵
    bornEffect        = "eff_110201_summon", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 20000,    -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "0",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 40,       -- 射击范围，单位：像素
    fireRange         = 40,       -- 近战范围，单位：像素
    cooldown1         = 829,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 829,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 1500,      -- 免伤比例，500表示5.00%
    armor             = 3,         -- 护甲
    maxHp             = 35,        -- 最大 HP
    attack            = 6,         -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 5,         -- 生命回复/波
}
defines["170101"] = soldier

local soldier = {
    mainID            = "170102",
    name              = "2级猴兵",    --孙悟空主动技能召唤兵
    bornEffect        = "eff_110201_summon", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 20000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "0",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 40,       -- 射击范围，单位：像素
    fireRange         = 40,       -- 近战范围，单位：像素
    cooldown1         = 829,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 829,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
    armor             = 5,        -- 护甲
    maxHp             = 45,      -- 最大 HP
    attack            = 8,        -- 攻击力
    critical          = 1000,     -- 暴击率。值代表10%
    restoreHp         = 8,       -- 生命回复/波
}
defines["170102"] = soldier

local soldier = {
    mainID            = "170103",
    name              = "3级猴兵",    --孙悟空主动技能召唤兵
    bornEffect        = "eff_110201_summon", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 20000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "150107",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 120,       -- 射击范围，单位：像素
    fireRange         = 40,       -- 近战范围，单位：像素
    cooldown1         = 829,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 829,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
    armor             = 9,        -- 护甲
    maxHp             = 55,     -- 最大 HP
    attack            = 12,        -- 攻击力
    critical          = 1000,     -- 暴击率。值代表10%
    restoreHp         = 10,       -- 生命回复/波
}
defines["170103"] = soldier

local soldier = {
    mainID            = "170104",
    name              = "4级猴兵",    --孙悟空主动技能召唤兵
    bornEffect        = "eff_110201_summon", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 20000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "150108",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 140,       -- 射击范围，单位：像素
    fireRange         = 40,       -- 近战范围，单位：像素
    cooldown1         = 829,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 829,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
    armor             = 15,        -- 护甲
    maxHp             = 65,     -- 最大 HP
    attack            = 16,        -- 攻击力
    critical          = 1000,     -- 暴击率。值代表10%
    restoreHp         = 12,       -- 生命回复/波
}
defines["170104"] = soldier

local soldier = {
    mainID            = "170105",
    name              = "5级猴兵",    --孙悟空主动技能召唤兵
    bornEffect        = "eff_110201_summon", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 20000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "150109",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 160,       -- 射击范围，单位：像素
    fireRange         = 40,       -- 近战范围，单位：像素
    cooldown1         = 829,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 829,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
    armor             = 24,        -- 护甲
    maxHp             = 75,        -- 最大 HP
    attack            = 24,         -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 15,         -- 生命回复/波
}
defines["170105"] = soldier
------------------------------祭坛塔援兵-------------
local soldier = {
    mainID            = "170106",
    name              = "金龙",       --祭坛他高级援兵
    bornEffect        = "effect/bornEffect/170105.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 60000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    --bulletType        = "150120",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    --trajectory        = 2,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 80,      -- 射击范围，单位：像素
    fireRange         = 80,       -- 近战范围，单位：像素
    cooldown1         = 3000,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 3000,      -- 远程冷却时间，单位：毫秒
    speed             = 30,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        {2, 5000, "130607"},      -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    reduceDamage      = 6000,      -- 免伤比例，500表示5.00%
    armor             = 60,        -- 护甲
    maxHp             = 300,        -- 最大 HP
    attack            = 60,        -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 0,        -- 生命回复/波
}
defines["170106"] = soldier

---------------------------召唤兵（DPS型）-----------------------------
local soldier = {
    mainID            = "170401",
    name              = "1级火图腾",    --炮塔A召唤兵
    bornEffect        = "effect/bornEffect/170201.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 1800000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 0,      -- 拔刀范围
    pairAmount        = 0,        -- 配对怪物数
    --bulletType        = "150109", -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    --trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 0,       -- 射击范围，单位：像素
    fireRange         = 0,       -- 近战范围，单位：像素
    cooldown1         = 1000,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 1000,      -- 远程冷却时间，单位：毫秒
    speed             = 0,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
        {3, 1500, "130802"},  -- 3表示CD触发的技能，CD时间到了就会释放130251，中间的CD参数无意义
    }, 
    -- passiveSkill      = {         -- 被动技能ID
    --     "230504",
    -- },
    reduceDamage      = 0,      -- 免伤比例，500表示5.00%
    armor             = 0,        -- 护甲
    maxHp             = 200,        -- 最大 HP
    attack            = 0,        -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 0,         -- 生命回复/波
}
defines["170401"] = soldier

local soldier = {
    mainID            = "170402",
    name              = "2级火图腾",    --炮塔A召唤兵
    bornEffect        = "effect/bornEffect/170202.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 1800000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 0,      -- 拔刀范围
    pairAmount        = 0,        -- 配对怪物数
    --bulletType        = "150109",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    --trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 0,       -- 射击范围，单位：像素
    fireRange         = 0,       -- 近战范围，单位：像素
    cooldown1         = 1000,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 1000,      -- 远程冷却时间，单位：毫秒
    speed             = 0,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
        {3, 1500, "130803"},  -- 3表示CD触发的技能，CD时间到了就会释放130251，中间的CD参数无意义
    },
    -- passiveSkill      = {         -- 被动技能ID
    --     "230504",
    -- }, 
    reduceDamage      = 0,      -- 免伤比例，500表示5.00%
    armor             = 0,        -- 护甲
    maxHp             = 300,        -- 最大 HP
    attack            = 0,        -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 0,         -- 生命回复/波
}
defines["170402"] = soldier

local soldier = {
    mainID            = "170403",
    name              = "3级火图腾",    --炮塔A召唤兵
    bornEffect        = "effect/bornEffect/170203.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 1800000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 0,      -- 拔刀范围
    pairAmount        = 0,        -- 配对怪物数
    --bulletType        = "150109",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    --trajectory        = 1,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 0,       -- 射击范围，单位：像素
    fireRange         = 0,       -- 近战范围，单位：像素
    cooldown1         = 1000,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 1000,      -- 远程冷却时间，单位：毫秒
    speed             = 0,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
        {3, 1500, "130804"},      -- 3表示CD触发的技能，CD时间到了就会释放130251，中间的CD参数无意义
    }, 
    -- passiveSkill      = {         -- 被动技能ID
    --     "230504",
    -- },
    reduceDamage      = 0,      -- 免伤比例，500表示5.00%
    armor             = 0,        -- 护甲
    maxHp             = 400,        -- 最大 HP
    attack            = 0,        -- 攻击力
    critical          = 1000,      -- 暴击率。值代表10%
    restoreHp         = 0,         -- 生命回复/波
}
defines["170403"] = soldier
-----------------------------------祭坛塔援兵--------------------
local soldier = {
    mainID            = "170204",
    name              = "水精灵",    --祭坛塔中级援兵
    bornEffect        = "effect/bornEffect/170203.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 60000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1,2},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 30,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "150117",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 2,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 280,      -- 射击范围，单位：像素
    fireRange         = 30,       -- 近战范围，单位：像素
    cooldown1         = 800,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 800,      -- 远程冷却时间，单位：毫秒
    speed             = 35,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        {1, 0, "130606"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    --passiveSkill      = {         -- 被动技能ID
    --   "",
    --},
    reduceDamage      = 500,      -- 免伤比例，500表示5.00%
    armor             = 10,        -- 护甲
    maxHp             = 50,        -- 最大 HP
    attack            = 100,        -- 攻击力
    critical          = 2000,      -- 暴击率。值代表10%
    restoreHp         = 0,         -- 生命回复/波
}
defines["170204"] = soldier

local soldier = {
    mainID            = "170205",
    name              = "小水精",    --水精死掉后风裂出来的小怪物
    bornEffect        = "effect/bornEffect/170203.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 6000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1,2},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 0,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    bulletType        = "150117", -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    trajectory        = 2,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 280,      -- 射击范围，单位：像素
    fireRange         = 0,       -- 近战范围，单位：像素
    cooldown1         = 800,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 800,      -- 远程冷却时间，单位：毫秒
    speed             = 0,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    --passiveSkill      = {         -- 被动技能ID
    --   "",
    --},
    reduceDamage      = 0,      -- 免伤比例，500表示5.00%
    armor             = 10,        -- 护甲
    maxHp             = 30,        -- 最大 HP
    attack            = 50,        -- 攻击力
    critical          = 2000,      -- 暴击率。值代表10%
    restoreHp         = 0,         -- 生命回复/波
}
defines["170205"] = soldier

---------------------------祭坛塔援兵（辅助型）-----------------------------
local soldier = {
    mainID            = "170301",
    name              = "小树精",    --祭坛塔初级援兵
    bornEffect        = "effect/bornEffect/170203.png", -- 召唤怪物出现光效
    walkLayer         = 1,        -- 1表示地表，2表示空中，3表示底下
    liveTime          = 60000,        -- 生存周期，单位毫秒
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型，{1表示对地面，2表示对空，3表示对地下}，不写代表不可攻击
    patrolRange       = 80,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    --bulletType        = "150117",      -- 子弹类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=坠砸
    --trajectory        = 2,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 1,        -- 最大仙品，当前为最高5
    maxLevel          = 1,        -- 最大等级，当前为最高5
    fireVision        = 0,        -- 射击范围，单位：像素
    fireRange         = 80,       -- 近战范围，单位：像素
    cooldown1         = 1000,      -- 近战冷却时间，单位：毫秒
    cooldown2         = 1000,      -- 远程冷却时间，单位：毫秒
    speed             = 40,       -- 移动速度，单位：像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率。值代表5%
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 0,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 0,        -- 复活CD，单位：毫秒
    atkGold           = 0,        -- 0代表无法获得金钱，数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机，例如：治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量，1500表示少于15%时会出发130241
        {2, 2000, "130605"},   -- 2表示自身每次攻击，5000表示有50%概率会出发130241
    }, 
    --passiveSkill      = {         -- 被动技能ID
    --    "",
    --},
    reduceDamage      = 1500,     -- 免伤比例，500表示5.00%
    armor             = 15,       -- 护甲
    maxHp             = 120,       -- 最大 HP
    attack            = 10,        -- 攻击力
    critical          = 2000,     -- 暴击率。值代表10%
    restoreHp         = 0,        -- 生命回复/波
}
defines["170301"] = soldier

function SoldierProperties.get(id)
    return clone(defines[id])
end

return SoldierProperties
