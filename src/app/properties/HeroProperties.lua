

local HeroProperties = {}

local defines = {}

local npc = {
    mainID            = "110201",
    name_EN           = "Parris",
    name_CN           = "帕里斯", -- 齐天大圣
    text_EN           = "Elementals are masters of magic,force,and ilussion.$Doppelganger,2 Lives,Tower Aura$",
    text_CN           = "元素族将魔法与武力结合,是天生精通幻化的大师$召唤,重生,箭塔光环$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Parris_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Parris_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    --sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,     -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "0",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 80,       -- 射击范围,单位:像素
    fireRange         = 80,       -- 近战范围,单位:像素
    cooldown1         = 829,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 829,      -- 远程冷却时间,单位:毫秒
    speed             = 110,      -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,      -- 闪避率.值代表5%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,    -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,    -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        {1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130902",
    },
    manualSkill       = {         -- 手动技能ID
        "130101", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130201",
    },
    passiveSkill      = {         -- 被动技能ID
        "130301", 
    },
    activeOrder       = {         -- 技能学习顺序
        "130101", "130301","130201", 
    },
}
defines["110201"] = npc

local npc = {
    mainID            = "110101",
    name_EN           = "Thaurrer",
    name_CN           = "索瑞尔", -- 牛魔王
    text_EN           = "A boozy and bellicose dwarf lives in iceberg, is a defensive warrior.$Lethality,Shield,Turret Aura$",
    text_CN           = "生活冰川的矮人,嗜酒好战,是天生的防御战士$高伤技能,吸伤护盾,古树光环$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Thaurrer_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Thaurrer_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    --sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,  -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "0",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 80,       -- 射击范围,单位:像素
    fireRange         = 80,       -- 近战范围,单位:像素
    cooldown1         = 1000,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 1000,      -- 远程冷却时间,单位:毫秒
    speed             = 105,       -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 150,      -- 闪避率.值代表1.50%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,    -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {        -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        {1, 2500, "130211"},      -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130901",
    },
    manualSkill       = {         -- 手动技能ID
        "130111", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130211",
    },
    passiveSkill      = {         -- 被动技能ID
        "130311",
    },
    activeOrder       = {
        "130111","130311","130211",
    },
}
defines["110101"] = npc

local npc = {
    mainID            = "110202",
    name_EN           = "Tah'nel",
    name_CN           = "塔奈尔", --铁扇公主
    text_EN           = "An indifferent assassin in the night,deals deadly damages.$Decelerate,Brittle,Explosive$",
    text_CN           = "暗夜中的刺客,冷淡高傲总是出其不意的给与致命一击$放置减速区域,脆皮,恐怖爆发$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Tah'nel_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Tah'nel_battle",    --英雄上阵时候播放的音效
    sound_move        = "FeMale",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    --sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,  -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "0",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 80,       -- 射击范围,单位:像素
    fireRange         = 80,       -- 近战范围,单位:像素
    cooldown1         = 500,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 500,      -- 远程冷却时间,单位:毫秒
    speed             = 130,      -- 移动速度,单位:像素/秒
    criticalPower     = 20000,    -- 暴击伤害的威力 150%
    dodge             = 1500,      -- 闪避率.值代表9%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,        -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},   -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130221"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    --}, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130221",1,"130221","130221",1,1,"130221",1,"130221","130221","130221",1,1,1
    },
    manualSkill       = {         -- 手动技能ID
        "130121",
    },
    automaticSkill    = {         -- 自动技能ID
        "130221", 
    },
    passiveSkill      = {         -- 被动技能ID
        "130321",
    },
    activeOrder       = {
        "130121", "130221", "130321",
    },
}
defines["110202"] = npc

local npc = {
    mainID            = "110204",
    name_EN           = "Geh'rol",
    name_CN           = "格若尔", --玉面狐狸（精灵射手）
    text_EN           = "An Elf archer with brittle frame, deals significant ranged damage.$Fowling,Arrow Shower,Snap Shot$",
    text_CN           = "精灵射手,脆弱的小身板和精准的箭技是他最显著的特点$束缚飞行怪,高伤箭雨,急射$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Geh'rol_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Geh'rol_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1,2},    -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 50,       -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,  -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "150106", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 260,      -- 射击范围,单位:像素
    fireRange         = 45,       -- 近战范围,单位:像素
    cooldown1         = 1000,     -- 近战冷却时间,单位:毫秒
    cooldown2         = 600,     -- 远程冷却时间,单位:毫秒
    speed             = 120,       -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 600,     -- 闪避率.值代表6%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,    -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        --{1, 1500, "130231"},    -- 1表示自身血量,1500表示少于15%时会出发130241
        {2, 800, "130231", 900, 1000, 1100},     -- 2表示自身每次攻击,800表示有8%概率会出发130231,后面表示对应等级触发概率
        {3, 10000, "130241"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,1,
    },
    manualSkill       = {         -- 手动技能ID
        "130131", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130231", "130241",
    },
    passiveSkill      = {         -- 被动技能ID

    },
    activeOrder       = {
        "130131", "130231", "130241",
    },
}
defines["110204"] = npc

local npc = {
    mainID            = "110102",
    name_EN           = "Shatt",
    name_CN           = "沙特",--蛟魔王
    text_EN           = "An oriental monk who assists others with body and dharma.$Dispel,Purify,Weaken$",
    text_CN           = "东方武僧,以肉身和佛法守护世人,辅助效果异常强大$驱散敌人,净化英雄,削弱敌人$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Shatt_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Shatt_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    --sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,  -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "0",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 80,      -- 射击范围,单位:像素
    fireRange         = 80,       -- 近战范围,单位:像素
    cooldown1         = 1000,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 1000,     -- 远程冷却时间,单位:毫秒
    speed             = 105,       -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 500,     -- 闪避率.值代表5%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,        -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 2000, "130261"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130251"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    },      
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130261",1,1,1,"130261",1,1,1,1,"130261",1,1,"130261",
    },
    manualSkill       = {         -- 手动技能ID
        "130141", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130261", "130251",
    },
    passiveSkill      = {         -- 被动技能ID

    },
    activeOrder       = {
        "130141", "130261", "130251",
    },
}
defines["110102"] = npc

local npc = {
    mainID            = "110203",
    name_EN           = "Kael",
    name_CN           = "凯尔",--鹏魔王
    text_EN           = "A mercenary Angle, fight for money and hit enemy with coins.$Coin,Earn,Task Speed$",
    text_CN           = "嗜钱如命的天使佣兵,抢劫怪物,用钱砸人,有钱就是任性$用钱砸人,砍怪赚钱,任务加速$",
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Kael_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Kael_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    --sound_farAttack   = "Shoot_1",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 100,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,     -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    --bulletType        = "0",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 85,       -- 射击范围,单位:像素
    fireRange         = 85,       -- 近战范围,单位:像素
    cooldown1         = 1000,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 1000,      -- 远程冷却时间,单位:毫秒
    speed             = 140,       -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 3000,     -- 闪避率.值代表5%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,        -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130271",1,1,"130271",1,1,1,"130271",
    },
    manualSkill       = {         -- 手动技能ID
        "130151",
    },
    automaticSkill    = {         -- 自动技能ID
        "130271", 
    },
    passiveSkill      = {         -- 被动技能ID
        "130331",
    },
    activeOrder       = {
        "130151", "130271", "130331",
    },
}
defines["110203"] = npc

local npc = {
    mainID            = "110301",
    name_EN           = "Selri",
    name_CN           = "赛尔瑞", --杏仙
    text_EN           = "A natural Shaman who controls plants, is good at heal and fight.$Heal,Thorns,Freak$",
    text_CN           = "原始萨满师傅,擅长自然魔法,控制植物,伤害治疗两不误$群体治疗,召唤荆棘$",
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Selri_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Selri_battle",    --英雄上阵时候播放的音效
    sound_move        = "FeMale",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Magic",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1,2},      -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,     --非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "150115", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 260,       -- 射击范围,单位:像素
    fireRange         = 45,       -- 近战范围,单位:像素
    cooldown1         = 1000,      -- 近战冷却时间,单位:毫秒
    cooldown2         = 1000,      -- 远程冷却时间,单位:毫秒
    speed             = 100,      -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 900,     -- 闪避率.值代表9%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,    -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,"130281",1,1,"130281",1,"130281",1,"130281",
    },
    manualSkill       = {         -- 手动技能ID
        "130161", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130281", 
    },
    passiveSkill      = {         -- 被动技能ID
        "130341",
    },
    activeOrder       = {
        "130161", "130281", "130341",
    },
}
defines["110301"] = npc

local npc = {
    mainID            = "110205",
    name_EN           = "Ellis",
    name_CN           = "爱丽丝",--菩提老祖
    text_EN           = "A girl riding a unicorn, stand aside or die.$Starfall,LightningChain,CollectiveErupt$",
    text_CN           = "骑独角兽的小女孩,你最好绕道,否则分分钟电成扫把头$全屏陨火,雷电链,集体狂暴$",
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    sound_advance     = "Ellis_advance",    --英雄升阶时候播放的音效
    sound_battle      = "Ellis_battle",    --英雄上阵时候播放的音效
    sound_move        = "Male",      --控制英雄移动时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shock",     --远程攻击时播放的音效
    AImode            = 1,        -- AI类型
    enemyType         = {1,2},      -- 可以攻击的怪物类型,:{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    patrolRange       = 50,      -- 拔刀范围
    pairAmount        = 1,        -- 配对怪物数
    maxMP             = 100,      -- 最大能量
    restoreHP         = 0,        -- 生命回复,表示每间隔X秒恢复0点生命,间隔时间X数据在StableGameProperties
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    idleRestoreHP     = 1000,     -- 非战斗状态下生命恢复万分比,表示恢复间隔单位时间在StableGameProperties
    bulletType        = "150306",      -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    maxStarLevel      = 5,        -- 最大仙品,当前为最高5
    maxLevel          = 5,        -- 最大等级,当前为最高5
    fireVision        = 260,      -- 射击范围,单位:像素
    fireRange         = 80,      -- 近战范围,单位:像素
    cooldown1         = 1036,     -- 近战冷却时间,单位:毫秒
    cooldown2         = 1036,     -- 远程冷却时间,单位:毫秒
    speed             = 150,      -- 移动速度,单位:像素/秒
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    dodge             = 600,     -- 闪避率.值代表6%
    addReduceDamage   = 0,        -- 穿透率.值代表10000表示无视对方100%的免伤比例
    suckHp            = 0,        -- 普攻吸血
    treatmentEffect   = 10000,        -- 治疗效果
    resistControl     = 0,        -- 抵抗限制
    liveCd            = 20000,    -- 复活CD,单位:毫秒
    group             = {1,2,3},  -- 英雄羁绊ID组
    questSpeed        = {1000,1}, -- 关卡任务执行速度,表示每1000毫秒+1点任务点
    atkGold           = 0,        -- 0代表无法获得金钱,数值代表每次普通攻击获得金币量
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如:治疗技能、无敌等辅助技能
        -- {1, 1500, "130241"},      -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 30000, "130701"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
    }, 
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130291",1,1,"130291","130291",1,"130291","130291","130291",1,1,
    },
    manualSkill       = {         -- 手动技能ID
        "130171", 
    },
    automaticSkill    = {         -- 自动技能ID
        "130291", "130701"
    },
    passiveSkill      = {         -- 被动技能ID
        
    },
    activeOrder       = {
        "130171", "130291", "130701",
    },
}
defines["110205"] = npc

function HeroProperties.get(id)
    return clone(defines[id])
end

function HeroProperties.getAll()
    return clone(defines)
end

return HeroProperties
