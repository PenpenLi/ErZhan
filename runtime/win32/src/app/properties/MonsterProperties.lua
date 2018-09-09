
local MonsterProperties = {}

local defines = {}
---------------------------非-逃跑型怪物-----------------------------
local monster = {
    mainID            = "100101", -- 名字
    name_EN           = "Thunderbirds",
    name_CN           = "小雷鸟",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Eating rotten birds that live on the plains of the.",
    text_CN           = "生活在兽人平原上的食腐鸟",     -- 描述
    feature_CN        = "飞行类怪物，无法阻拦移动。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 500,     -- 免伤比例,表示5.00%
    armor             = 5,       -- 护甲
    maxHp             = 140,       -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 100,      -- 速度,单位：像素/秒
    dodge             = 700,      -- 闪避率。值代表10%
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100101"] = monster

local monster = {
    mainID            = "100102", -- 名字
    name_EN           = "Frost Whelp",
    name_CN           = "冰龙宝宝",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A purebred whelp of Dragon, different from some Drakonid. Only because of its under age ,it has a limited strength but an amazing speed.",
    text_CN           = "正统龙族小孩,和某龙人不一样的。不过因为未成年,力量有限,但是速度惊人。",     -- 描述
    feature_CN        = "飞行类怪物，无法阻拦移动。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 1000,      -- 免伤比例,表示5.00%
    armor             = 10,        -- 护甲
    maxHp             = 200,        -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 80,      -- 速度,单位：像素/秒
    dodge             = 300,     -- 闪避率。值代表10%
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100102"] = monster

local monster = {
    mainID            = "100103", -- 名字
    name_EN           = "Lava Guard",
    name_CN           = "熔岩卫士",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The guardian of lava. Though there were some treasures, they all became ashes in the lava.",
    text_CN           = "熔岩的守卫者,虽然感觉就算熔岩里有宝物,也已经燃烧成灰了。",     -- 描述
    feature_CN        = "嘲讽型怪物，会吸引防御塔的进攻，但是不会理会任何人的阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4000,      -- 免伤比例,表示5.00%
    armor             = 40,        -- 护甲
    maxHp             = 1500,       -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 45,      -- 速度,单位：像素/秒
    dodge             = 100,     -- 闪避率。值代表10%
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表s示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100103"] = monster

local monster = {
    mainID            = "100104", -- 名字
    name_EN           = "bats",
    name_CN           = "熔岩蝙蝠",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Love survive in lava, stealing various biological blood bat.",
    text_CN           = "喜爱在熔岩中生存，偷食各种生物献血的蝙蝠。",     -- 描述
    feature_CN        = "飞行类怪物，无法阻拦移动。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 500,     -- 免伤比例,表示5.00%
    armor             = 5,       -- 护甲
    maxHp             = 260,       -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 80,      -- 速度,单位：像素/秒
    dodge             = 700,      -- 闪避率。值代表10%
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100104"] = monster

local monster = {
    mainID            = "100105", -- 名字
    name_EN           = "Cerberus",
    name_CN           = "地狱三头犬",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A hardworking watchdog ,successfully grows more heads to get more powerful strength. Something like …Unleash the Cerberus!",
    text_CN           = "努力型的看门犬,生长了更多的脑袋,获得更强大的力量！比如...关门,放地狱犬！",     -- 描述
    feature_CN        = "冲刺型怪物，不会被阻拦，同时死亡后会召唤地狱犬。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 280,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,      -- 免伤比例,表示15.00%
    armor             = 35,        -- 护甲
    maxHp             = 350,       -- 最大 HP
    attack            = 0,         -- 攻击
    speed             = 65,      -- 速度,单位：像素/秒
    dodge             = 500,      -- 闪避率。值代表10%
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        {1, 0, "130423"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100105"] = monster

local monster = {
    mainID            = "100106", -- 名字
    name_EN           = "Hellhound",
    name_CN           = "地狱犬",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The watchdog in the hell, which you can not despise. Behold…well, where is it now?",
    text_CN           = "地狱的看门犬,但是不能因此小瞧他。看好了...咦,跑哪去了？",     -- 描述
    feature_CN        = "冲刺型怪物，不会被阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 1500,      -- 免伤比例,表示10.00%
    armor             = 15,        -- 护甲
    maxHp             = 50,       -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 100,      -- 速度,单位：像素/秒
    dodge             = 600,      -- 闪避率。值代表10%
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100106"] = monster

local monster = {
    mainID            = "100107", -- 名字
    name_EN           = "Fleeting Elves",
    name_CN           = "逃跑的精灵",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The captured elves are now fleeting.",
    text_CN           = "被抓的精灵，找到了机会逃脱出来了。",     -- 描述
    feature_CN        = "特殊的冲刺型友军，不会被阻拦，但是会被防御塔攻击。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 0,        --怪物达到终点关卡扣除的生命点数
    AImode            = 5,        -- AI类型,1/2/3/4/5依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型/逃跑精灵
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2500,      -- 免伤比例,表示10.00%
    armor             = 10,        -- 护甲
    maxHp             = 300,       -- 最大 HP
    attack            = 0,        -- 攻击
    speed             = 60,      -- 速度,单位：像素/秒
    dodge             = 600,      -- 闪避率。值代表10%
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 0,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100107"] = monster
---------------------------主动-远程型怪物-----------------------------
local monster = {
    mainID            = "100201", -- 名字
    name_EN           = "Magog",
    name_CN           = "玛格",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It is a demon who likes playing with fire. Do not say that you're not afraid of them, for you shall bedestroyed by the burning flames. ",
    text_CN           = "爱玩火的恶魔,不要说你不怕,那燃烧的火焰会毁灭你！",     -- 描述
    feature_CN        = "主动攻击型怪物，会主动停下脚步进攻，并且有攻击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示40.00%
    armor             = 30,       -- 护甲
    maxHp             = 300,       -- 最大 HP
    attack            = 8,       -- 攻击
    bulletType        = "150110", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 85,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1250,      -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1250,      -- 远程攻击间隔,单位：毫秒
    speed             = 45,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 240,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},     -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130410"},    -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100201"] = monster

local monster = {
    mainID            = "100202", -- 名字
    name_EN           = "Frost Furbolg",
    name_CN           = "冰霜熊怪",     -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Innocent cub with powerful strength. ",
    text_CN           = "憨憨的熊宝宝,不过力量还是很强悍的",     -- 描述
    feature_CN        = "被动攻击型怪物，可以被阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示40.00%
    armor             = 30,       -- 护甲
    maxHp             = 380,       -- 最大 HP
    attack            = 25,       -- 攻击
    --bulletType        = "150112", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    --trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,      -- 视野,远程攻击范围
    fireRange         = 60,       -- 射程,近战攻击范围
    cooldown1         = 1500,      -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,      -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 0,      -- 闪避率。值代表10%
    criticalPower     = 20000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 240,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100202"] = monster

local monster = {
    mainID            = "100203", -- 名字
    name_EN           = "Frost Dragoon",
    name_CN           = "冰霜龙骑",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A top warrior that must to be taken seriously. Although the jockey is just a priest. ",
    text_CN           = "顶级战斗兵种,绝对不容小觑！虽然骑手只是个祭祀。",     -- 描述
    feature_CN        = "飞行类怪物，同时是主动攻击型，死亡后会出现冰霜巨魔祭祀。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2500,     -- 免伤比例,表示25.00%
    armor             = 25,        -- 护甲
    maxHp             = 200,       -- 最大 HP
    attack            = 50,         -- 攻击
    bulletType        = "150122", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 320,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 4000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 4000,     -- 远程攻击间隔,单位：毫秒
    speed             = 80,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        {1, 0, "130420"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},  -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100203"] = monster

local monster = {
    mainID            = "100204", -- 名字
    name_EN           = "Lava Spider",
    name_CN           = "熔岩蛛母",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The queen of Lava Spider. It's her responsibility to breed the offspring. But it's not good to overdo it. ",
    text_CN           = "熔岩蜘蛛种群的皇后,繁衍后代是她的责任,不过过度生育可不好哦。",     -- 描述
    feature_CN        = "被动型怪物，但是会繁殖后代，每隔一段时间便生出一只小蜘蛛。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示25.00%
    armor             = 30,        -- 护甲
    maxHp             = 1000,       -- 最大 HP
    attack            = 40,    -- 攻击
    bulletType        = "150702", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 2500,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130406",1,"130406",1,1,1,"130406",1,1,1,1,1,"130406"
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130407"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130256"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100204"] = monster

local monster = {
    mainID            = "100205", -- 名字
    name_EN           = "Fallen Angel",
    name_CN           = "堕落天使",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The angle who converted its faith became more violent ,more brutal and more beautiful… well, I mean wicked!",
    text_CN           = "信仰转变的天使,变得更加暴力,更加野性,更加美丽...额不,是邪恶！",     -- 描述
    feature_CN        = "主动攻击性怪物，会飞行，拥有强力攻击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    restCD            = {5000, 3000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示25.00%
    armor             = 30,        -- 护甲
    maxHp             = 700,       -- 最大 HP
    attack            = 30,       -- 攻击
    bulletType        = "150111", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 120,      -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 50,       -- 速度,单位：像素/秒
    critical          = 2500,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130407"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 15000, "130409"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100205"] = monster

local monster = {
    mainID            = "100206", -- 名字
    name_EN           = "Warg",
    name_CN           = "座狼",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It's not an ordinary wolf but a warg of orcs, the best beast for riding. But its master is also its brother. It will fight the hell out of it if it's brother died. ",
    text_CN           = "这不是普通的狼,是兽族座狼,是最好的兽族坐骑。不过他的主人就是他的胞兄,如果胞兄阵亡,他也会拼命的进攻。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 1000,     -- 免伤比例,表示15.00%
    armor             = 10,        -- 护甲
    maxHp             = 180,       -- 最大 HP
    attack            = 15,         -- 攻击
    fireVision        = 60,       -- 视野,远程攻击范围
    fireRange         = 60,       -- 射程,近战攻击范围
    cooldown1         = 1250,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1250,     -- 远程攻击间隔,单位：毫秒
    speed             = 120,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100206"] = monster

local monster = {
    mainID            = "100207", -- 名字
    name_EN           = "Luxotiko",
    name_CN           = "光之精灵",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It was allegedly from a realm without darkness, and it will be matchless when it's daytime.",
    text_CN           = "据说是在永远没有黑暗的地方诞生，虽然不知道这个地方在哪，但是在白天，这个精灵基本是无敌的。",
    feature_CN        = "被动型怪物，在晴天下会释放强大技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4000,     -- 免伤比例,表示15.00%
    armor             = 40,       -- 护甲
    maxHp             = 600,      -- 最大 HP
    attack            = 30,       -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100207"] = monster

local monster = {
    mainID            = "100208", -- 名字
    name_EN           = "Verntiko",
    name_CN           = "雨之精灵",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It was allegedly from the rainstorm, and it will be matchless when it's rainy.",
    text_CN           = "据说是从某场惊天暴雨天气中诞生，在下雨天气，这个精灵基本是无敌的。",
    feature_CN        = "被动型怪物，在雨天下会释放强大技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 0,     -- 免伤比例,表示15.00%
    armor             = 0,       -- 护甲
    maxHp             = 750,      -- 最大 HP
    attack            = 60,       -- 攻击
    bulletType        = "150110", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100208"] = monster

local monster = {
    mainID            = "100209", -- 名字
    name_EN           = "Noxotiko",
    name_CN           = "暗之精灵",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "An elf that was allegedly from a realm without light, and it will be matchless when it's night.",
    text_CN           = "据说是在永远没有白天的地方诞生，虽然不知道这个地方在哪，但是在夜晚，这个精灵基本是无敌的。",
    feature_CN        = "被动型怪物，在夜晚下会释放强大技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2000,     -- 免伤比例,表示15.00%
    armor             = 20,       -- 护甲
    maxHp             = 300,      -- 最大 HP
    attack            = 20,       -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 80,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100209"] = monster

local monster = {
    mainID            = "100210", -- 名字
    name_EN           = "Gelutiko",
    name_CN           = "冰之精灵",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "An elf that was allegedly from a realm of chillness, and it will be matchless when it's snowy.",
    text_CN           = "据说是在极冷之地诞生，这个地方我知道在哪，所以在冰雪天气，这个精灵基本是无敌的。",
    feature_CN        = "被动型怪物，在雪天下会释放强大技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,       -- 护甲
    maxHp             = 500,      -- 最大 HP
    attack            = 80,       -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100210"] = monster

local monster = {
    mainID            = "100211", -- 名字
    name_EN           = "Ferutiko",
    name_CN           = "风之精灵",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It was allegedly from the tornado, and it will be matchless when it's windy.",
    text_CN           = "据说是从龙卷风里诞生的精灵，在有风的天气，这个精灵基本是无敌的。",
    feature_CN        = "被动型怪物，在风天下会释放强大技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 1,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,       -- 护甲
    maxHp             = 300,      -- 最大 HP
    attack            = 20,       -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100211"] = monster
---------------------------半主动-远程型怪物-----------------------------
local monster = {
    mainID            = "100301", -- 名字
    name_EN           = "Hobgoblin",
    name_CN           = "大耳怪王",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "However small may the creature look, it will smash your head with weapons if not noticed. ",
    text_CN           = "看似渺小的生物,但是若一不留神,他就会拿武器砸你脑袋。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有主动远程攻击技能。",     --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2500,     -- 免伤比例,表示25.00%
    armor             = 25,        -- 护甲
    maxHp             = 200,       -- 最大 HP
    attack            = 30,       -- 攻击
    bulletType        = "150119", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 140,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 5000,     -- 远程攻击间隔,单位：毫秒
    speed             = 50,       -- 速度,单位：像素/秒
    critical          = 2000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 5000, "130241"},    -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130422"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100301"] = monster

local monster = {
    mainID            = "100302", -- 名字
    name_EN           = "Frost Trollpriest",
    name_CN           = "冰霜巨魔祭祀",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A guy with something like a stick or spear. Don't underestimate him, for he is a guy of high degree.",
    text_CN           = "一个拿着似枪似杖的家伙,不过不要太小看他,他的地位很高,十层塔那么高。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有加血技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4000,     -- 免伤比例,表示25.00%
    armor             = 40,        -- 护甲
    maxHp             = 380,       -- 最大 HP
    attack            = 40,        -- 攻击
    bulletType        = "150120", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 160,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 300,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,"130403",1,1,1,1,"130403",1,1,1,1,1,"130403",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130402"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100302"] = monster

local monster = {
    mainID            = "100303", -- 名字
    name_EN           = "Firelf",
    name_CN           = "烈火精灵",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "An elf that plunged into the hell for some raging energies.",
    text_CN           = "投身地狱的精灵, 掌握了更加狂暴的力量。",     -- 描述
    feature_CN        = "被动型怪物，可被阻拦，拥有持续灼烧敌人的能力。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4000,     -- 免伤比例,表示25.00%
    armor             = 40,        -- 护甲
    maxHp             = 400,       -- 最大 HP
    attack            = 30,    -- 攻击
    bulletType        = "150101", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 1,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130407"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 10000, "130424"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130424"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100303"] = monster


local monster = {
    mainID            = "100304", -- 名字
    name_EN           = "Demara",
    name_CN           = "大恶魔",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The final boss? Believe it or not, he's the last one to show up. Gorgeous skills and remarkable moves are his specialities. Kill him ,then you are the best warrior. ",
    text_CN           = "最终BOSS？不管你信不信,反正他最后出场,技能华丽,招式漂亮就是他的招牌。干掉他你就是最强的勇士。",     -- 描述
    feature_CN        = "BOSS，拥有传送召唤、蝙蝠攻击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6000,     -- 免伤比例,表示25.00%
    armor             = 60,        -- 护甲
    maxHp             = 750,       -- 最大 HP
    attack            = 8,       -- 攻击
    bulletType        = "150113", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 32,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130257"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130408"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    },    
}
defines["100304"] = monster

local monster = {
    mainID            = "100305", -- 名字
    name_EN           = "ABC",
    name_CN           = "独眼巨人",   -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4500,     -- 免伤比例,表示25.00%
    armor             = 45,        -- 护甲
    maxHp             = 500,       -- 最大 HP
    attack            = 16,       -- 攻击
    bulletType        = "150114", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 80,      -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 34,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130257"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130409"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100305"] = monster

---------------------------被动-近战型怪物-----------------------------
local monster = {
    mainID            = "100401", -- 名字
    name_EN           = "Imp",
    name_CN           = "小恶魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The creature at the bottom of the hell that can be judged from the outside. ",
    text_CN           = "地狱最低阶的生物,从外表看就知道了。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2500,     -- 免伤比例,表示15.00%
    armor             = 20,        -- 护甲
    maxHp             = 60,       -- 最大 HP
    attack            = 5,        -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1250,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1250,     -- 远程攻击间隔,单位：毫秒
    speed             = 34,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 0,        -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100401"] = monster

local monster = {
    mainID            = "100402", -- 名字
    name_EN           = "Hormon",
    name_CN           = "长角恶魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A normal kind in the hell. There's nothing left to say. ",
    text_CN           = "地狱中比较普通的生物,没有什么出彩的地方。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,     -- 免伤比例,表示25.00%
    armor             = 35,        -- 护甲
    maxHp             = 180,       -- 最大 HP
    attack            = 8,      -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100402"] = monster

local monster = {
    mainID            = "100403", -- 名字
    name_EN           = "Ogrevil",
    name_CN           = "食人魔王",  -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Ogrevil, who makes infants stop crying is fond of man-eating. Biological trait gives him the ability of storing food to digest anytime in use of recovery. ",
    text_CN           = "能让婴儿止啼的食人魔王,特爱吃人。生物特性使他拥有储存食物的能力,可以随时消化用来恢复自身。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有自动回复技能。",     --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,        -- 护甲
    maxHp             = 400,       -- 最大 HP
    attack            = 30,        -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 60,       -- 射程,近战攻击范围
    cooldown1         = 2500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 100,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130257"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130401"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100403"] = monster

local monster = {
    mainID            = "100404", -- 名字
    name_EN           = "ABC",
    name_CN           = "半兽人",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,       -- 护甲
    maxHp             = 300,       -- 最大 HP
    attack            = 4,        -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1250,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1250,     -- 远程攻击间隔,单位：毫秒
    speed             = 34,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100404"] = monster

local monster = {
    mainID            = "100405", -- 名字
    name_EN           = "ABC",
    name_CN           = "空闲",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,     -- 免伤比例,表示15.00%
    armor             = 35,        -- 护甲
    maxHp             = 300,       -- 最大 HP
    attack            = 5,       -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1250,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1250,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100405"] = monster

local monster = {
    mainID            = "100406", -- 名字
    name_EN           = "ABC",
    name_CN           = "空闲",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 1500,     -- 免伤比例,表示15.00%
    armor             = 15,        -- 护甲
    maxHp             = 100,       -- 最大 HP
    attack            = 8,      -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1250,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 34,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100406"] = monster

local monster = {
    mainID            = "100407", -- 名字
    name_EN           = "Frost Drakonid",
    name_CN           = "冰霜龙人",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "As for his history, it is said that it's something about the Frost Wyrm. You ask the human part? Sorry ,it's privacy. ",
    text_CN           = "关于他的来历,传说和冰霜巨龙有关,你想问人的部分？抱歉,隐私",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有护盾技能。",      --怪物特性
    --bornEffect      = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2000,     -- 免伤比例,表示15.00%
    armor             = 20,        -- 护甲
    maxHp             = 600,       -- 最大 HP
    attack            = 50,        -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 60,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},     -- 2表示自身每次攻击,5000表示有50%概率会出发130241 （顶替普攻）
        {3, 15000, "130422"},    -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100407"] = monster

local monster = {
    mainID            = "100408", -- 名字
    name_EN           = "Nightmare",
    name_CN           = "夜魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A night darling that watches you looking for it in vain.",
    text_CN           = "黑夜中的宠儿,当你想追寻她的足迹的时候,却一无所获,而不知道她在一旁看着你。",     -- 描述
    feature_CN        = "被动型怪物，同时拥有隐身技能，无法被防御塔攻击。被阻拦后将显形。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,2}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2000,     -- 免伤比例,表示5.00%
    armor             = 20,        -- 护甲
    maxHp             = 550,       -- 最大 HP
    attack            = 60,        -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 1000,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 3,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 5000, "130257"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130402"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        --{3, 10000, "130403"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100408"] = monster

local monster = {
    mainID            = "100409", -- 名字
    name_EN           = "Desert Nereid",
    name_CN           = "荒漠沙虫",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "It has the gift for moving underground ,but it will come out while encountering obstacles in the absence of eyes. ",
    text_CN           = "拥有潜入地下移动的天赋。不过因为没长眼睛,只有碰到障碍时才会钻出地面",     -- 描述
    feature_CN        = "被动型怪物，平时潜入地面，不受防御塔攻击，被阻拦后钻出。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6000,     -- 免伤比例,表示15.00%
    armor             = 60,        -- 护甲
    maxHp             = 400,       -- 最大 HP
    attack            = 50,        -- 攻击
    fireVision        = 60,       -- 视野,远程攻击范围
    fireRange         = 60,       -- 射程,近战攻击范围
    cooldown1         = 2500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2500,     -- 远程攻击间隔,单位：毫秒
    speed             = 80,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 3,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        -- {3, 10000, "130251"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100409"] = monster

local monster = {
    mainID            = "100410", -- 名字
    name_EN           = "Devioneer",
    name_CN           = "恶魔先锋",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A devil with well developed body and simple mind is the best pioneer. It never turns back unless knocking into the wall.",
    text_CN           = "头脑简单但肌肉十足的恶魔,最合适作先锋,跑疯起来除非撞墙,不然不会停。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有冲撞技能，冲撞时无法阻拦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 6,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1000毫秒回复1点
    reduceDamage      = 8000,     -- 免伤比例,表示15.00%
    armor             = 80,        -- 护甲
    maxHp             = 1000,       -- 最大 HP
    attack            = 40,       -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 34,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130404"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100410"] = monster

local monster = {
    mainID            = "100411", -- 名字
    name_EN           = "Wolfrider",
    name_CN           = "狼骑兽人",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The brother of warg. With the wargs together, they have a fearsome reputation as harvesters.  ",
    text_CN           = "座狼的胞兄,与胞弟狼一起,是领人闻风丧胆的兽族收割者,而且爱好生吃生物。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有吞噬技能。死亡后会出现座狼。",      --怪物特性
    --bornEffect      = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4500,     -- 免伤比例,表示15.00%
    armor             = 45,        -- 护甲
    maxHp             = 500,       -- 最大 HP
    attack            = 45,         -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 100,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        {1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130405"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100411"] = monster

local monster = {
    mainID            = "100412", -- 名字
    name_EN           = "Lava Elemental",
    name_CN           = "熔岩元素",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A creature that born in the magma, which makes the dangerous lava its paradise.",
    text_CN           = "岩浆中诞生的生物,因此危险高温的熔浆反而是它的乐园。",     -- 描述
    feature_CN        = "被动型怪物，可被阻拦，翻滚状态无法被防御塔攻击。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 8000,     -- 免伤比例,表示15.00%
    armor             = 80,        -- 护甲
    maxHp             = 1000,       -- 最大 HP
    attack            = 40,         -- 攻击
    fireVision        = 40,       -- 视野,远程攻击范围
    fireRange         = 40,       -- 射程,近战攻击范围
    cooldown1         = 2500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2500,     -- 远程攻击间隔,单位：毫秒
    speed             = 50,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 3,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130405"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100412"] = monster

local monster = {
    mainID            = "100413", -- 名字
    name_EN           = "Lava Spider",
    name_CN           = "熔岩蜘蛛",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The years of living in lava makes it mightier ,which also leads to his disability of creating spiderman. ",
    text_CN           = "常年在熔岩生活,使得身体变得更为强大,不过也丧失了制造蜘蛛侠的能力。",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有毒素技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    bornPos           = {-65, 0}, -- 蛛母3点钟的时候播放召唤动画,小蜘蛛基于蛛母的偏移坐标{X,Y}应该出现的位置
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 2000,     -- 免伤比例,表示15.00%
    armor             = 20,        -- 护甲
    maxHp             = 320,       -- 最大 HP
    attack            = 15,         -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 50,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,1,"130418",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130405"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100413"] = monster

local monster = {
    mainID            = "100414", -- 名字
    name_EN           = "Demonion",
    name_CN           = "恶魔爪牙",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Move swiftly and seckill the minions.",
    text_CN           = "移动迅捷,能够瞬间撕裂召唤兵",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有撕裂技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    --bornPos           = {-50, 0}, -- 蛛母3点钟的时候播放召唤动画,小蜘蛛基于蛛母的偏移坐标{X,Y}应该出现的位置
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,     -- 免伤比例,表示15.00%
    armor             = 35,        -- 护甲
    maxHp             = 500,       -- 最大 HP
    attack            = 35,         -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 800,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 800,     -- 远程攻击间隔,单位：毫秒
    speed             = 55,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130427"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100414"] = monster

local monster = {
    mainID            = "100415", -- 名字
    name_EN           = "Diablood",
    name_CN           = "恶魔之血",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Heal monsters around it.",
    text_CN           = "血之光环每秒治疗周围的怪物",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有回血光环。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    --bornPos         = {-50, 0}, -- 蛛母3点钟的时候播放召唤动画,小蜘蛛基于蛛母的偏移坐标{X,Y}应该出现的位置
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 0,     -- 免伤比例,表示15.00%
    armor             = 0,        -- 护甲
    maxHp             = 500,       -- 最大 HP
    attack            = 10,         -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 800,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 800,     -- 远程攻击间隔,单位：毫秒
    speed             = 80,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 1000, "130419"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100415"] = monster

local monster = {
    mainID            = "100416", -- 名字
    name_EN           = "Weather Generator",
    name_CN           = "天气制造机器",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "A strange thing that can change the weather… I want sunshine, never the darkness.",
    text_CN           = "一个奇怪的东西，居然可以改变天气...我想要永远晴天不要黑暗",     -- 描述
    feature_CN        = "被动型怪物，可以被阻拦，拥有改变天气的技能。但是需要玩家配合哦。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 3,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    --bornPos         = {-50, 0}, -- 蛛母3点钟的时候播放召唤动画,小蜘蛛基于蛛母的偏移坐标{X,Y}应该出现的位置
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 0,     -- 免伤比例,表示15.00%
    armor             = 0,        -- 护甲
    maxHp             = 2000,       -- 最大 HP
    attack            = 1,         -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 800,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 800,     -- 远程攻击间隔,单位：毫秒
    speed             = 25,      -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 500,     -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    --AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130421"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
       -- {3, 1000, "130419"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    --}, 
}
defines["100416"] = monster
---------------------------BOSS怪物-----------------------------
local monster = {
    mainID            = "100501", -- 名字
    name_EN           = "Ancient Behemoth",
    name_CN           = "比蒙皇",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The emperor of Behemoths ,who has the unbelievable physical strength and body intensity. Well, magic is not his cup of tea.",
    text_CN           = "比蒙族的皇者,拥有难以想象的身体力量以及肉体强度。魔法,并不是比蒙的菜。",     -- 描述
    feature_CN        = "BOSS，拥有群体晕眩以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {15000, 5000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,       -- 护甲
    maxHp             = 4500,     -- 最大 HP
    attack            = 50,       -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 50,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 200,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130415",1,1,1,1,"130415",1,1,1,"130415",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次普通攻击,5000表示有50%概率会出发130241
        {3, 5000, "130411"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100501"] = monster

local monster = {
    mainID            = "100502", -- 名字
    name_EN           = "Dark Warlord",
    name_CN           = "恶魔统领",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The middle rank commander of demons. He got an excellent blade skill besides the strong body. Well, from the demons'standpoint. . . ",
    text_CN           = "大恶魔王的前军总指挥，因此会召唤怪物助阵。",     -- 描述
    feature_CN        = "BOSS，拥有召唤怪物以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {8000, 2000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 5000,     -- 免伤比例,表示15.00%
    armor             = 50,        -- 护甲
    maxHp             = 3000,       -- 最大 HP
    attack            = 30,      -- 攻击
    fireVision        = 80,       -- 视野,远程攻击范围
    fireRange         = 80,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 0,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130412",1,"130412",1,"130413",1,"130412",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 4000, "130413"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 5000, "130413"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100502"] = monster

local monster = {
    mainID            = "100503", -- 名字
    name_EN           = "Frost Wyrm",
    name_CN           = "冰霜巨龙",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Dragon has always been in the highest link of the biological chain. But it is said that the circle of Dragon is complicated  all the time. You can judge it from the other Frost members. ",
    --text_CN           = "龙族一直都是生物链的顶层,不过据说龙族圈一直很乱,从冰霜族的其他成员的长相就能看出来了。",     -- 描述
    text_CN           = "龙族老大，擅长冰风加速、冻结建筑以及强大的攻击能力。",     -- 描述
    feature_CN        = "BOSS，主动攻击型，拥有加速冰道、飞行吐息以及强大攻击能力。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {4000, 1200},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    level             = 1,        -- 等级
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 85,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4500,     -- 免伤比例,表示15.00%
    armor             = 45,        -- 护甲
    maxHp             = 5000,       -- 最大 HP
    attack            = 70,      -- 攻击
    bulletType        = "150126", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 320,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 100,      -- 速度,单位：像素/秒
    critical          = 5000,     -- 暴击率。值代表10%
    dodge             = 1000,      -- 闪避率。值代表10%
    criticalPower     = 30000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130425",1,1,"130425",1,1,1,"130425",
    },
    AIskill           = {           -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},     -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130425"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        {3, 8000, "130428"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100503"] = monster

local monster = {
    mainID            = "100504", -- 名字
    name_EN           = "Knarama",
    name_CN           = "地狱炎魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The most ferocious and ruthless boss born in lava from the hell. Not? Not everybody can play with mud in the lava of high temperature.",
    text_CN           = "地狱熔岩诞生出最为凶残暴力的顶级BOSS。你觉得不是？你以为谁都能在那几千度的岩浆里玩泥巴么。",     -- 描述
    feature_CN        = "BOSS，钻地型，被阻拦后才会钻出地面。拥有熔岩爆裂技能。爆炸的塔可以回收部分资源。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {5000, 1500},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 50,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4500,     -- 免伤比例,表示15.00%
    armor             = 45,        -- 护甲
    maxHp             = 6000,       -- 最大 HP
    attack            = 100,       -- 攻击
    fireVision        = 120,       -- 视野,远程攻击范围
    fireRange         = 120,       -- 射程,近战攻击范围
    cooldown1         = 500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 6000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 25000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 3,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130414"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        --{3, 10000, "130415"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100504"] = monster

local monster = {
    mainID            = "100505", -- 名字
    name_EN           = "Demara",
    name_CN           = "大恶魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The final boss? Believe it or not, he's the last one to show up. Gorgeous skills and remarkable moves are his specialities. Kill him ,then you are the best warrior. ",
    text_CN           = "最终BOSS？不管你信不信,反正他最后出场,技能华丽,招式漂亮就是他的招牌。干掉他你就是最强的勇士。",     -- 描述
    feature_CN        = "BOSS，拥有传送召唤、蝙蝠攻击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,       -- 护甲
    maxHp             = 12000,     -- 最大 HP
    attack            = 60,        -- 攻击
    fireVision        = 120,       -- 视野,远程攻击范围
    fireRange         = 120,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 26,       -- 速度,单位：像素/秒
    critical          = 2000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 40000,    -- 暴击伤害的威力600%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,"130417",1,1,1,1,1,"130417",1,1,1,"130417",1,1,"130417",1,"130417",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130416"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100505"] = monster

--------------------第三模式九关增加怪物-------------
local monster = {
    mainID            = "100601", -- 名字
    name_EN           = "Ancient Behemoth",
    name_CN           = "比蒙皇",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The emperor of Behemoths ,who has the unbelievable physical strength and body intensity. Well, magic is not his cup of tea.",
    text_CN           = "比蒙族的皇者,拥有难以想象的身体力量以及肉体强度。魔法,并不是比蒙的菜。",     -- 描述
    feature_CN        = "BOSS，拥有群体晕眩以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {15000, 2000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,       -- 护甲
    maxHp             = 10000,     -- 最大 HP
    attack            = 50,       -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 25,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 200,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130415",1,1,1,1,"130415",1,1,1,"130415",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次普通攻击,5000表示有50%概率会出发130241
        {3, 5000, "130411"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100601"] = monster

local monster = {
    mainID            = "100602", -- 名字
    name_EN           = "Dark Warlord",
    name_CN           = "恶魔统领",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The middle rank commander of demons. He got an excellent blade skill besides the strong body. Well, from the demons'standpoint. . . ",
    text_CN           = "大恶魔王的前军总指挥",     -- 描述
    feature_CN        = "BOSS，拥有召唤怪物以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {8000, 1000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,        -- 护甲
    maxHp             = 5000,       -- 最大 HP
    attack            = 30,      -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 0,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,"130412",1,"130412",1,"130413",1,"130412",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 4000, "130413"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 5000, "130413"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100602"] = monster

local monster = {
    mainID            = "100603", -- 名字
    name_EN           = "Frost Wyrm",
    name_CN           = "冰霜巨龙",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Dragon has always been in the highest link of the biological chain. But it is said that the circle of Dragon is complicated  all the time. You can judge it from the other Frost members. ",
    text_CN           = "龙族一直都是生物链的顶层,不过据说龙族圈一直很乱,看看冰霜族的其他成员就能看出来了。",     -- 描述
    feature_CN        = "BOSS，主动攻击型，拥有强大攻击能力。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {8000, 2000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    level             = 1,        -- 等级
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 85,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,     -- 免伤比例,表示15.00%
    armor             = 35,        -- 护甲
    maxHp             = 20000,       -- 最大 HP
    attack            = 50,      -- 攻击
    bulletType        = "150126", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 160,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 3000,     -- 暴击率。值代表10%
    dodge             = 1000,      -- 闪避率。值代表10%
    criticalPower     = 50000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130425",1,1,1,"130425",1,1,1,1,"130425",1,1,1,1,1,"130425",1,1,1,1,1,1,1,1,"130425",
    },
    AIskill           = {           -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},     -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130425"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        --{3, 16000, "130428"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100603"] = monster

---------------------------第三模式第五关新增怪物-----------------------------
local monster = {
    mainID            = "100604", -- 名字
    name_EN           = "Ancient Behemoth",
    name_CN           = "比蒙皇",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The emperor of Behemoths ,who has the unbelievable physical strength and body intensity. Well, magic is not his cup of tea.",
    text_CN           = "比蒙族的皇者,拥有难以想象的身体力量以及肉体强度。魔法,并不是比蒙的菜。",     -- 描述
    feature_CN        = "BOSS，拥有群体晕眩以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {15000, 5000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 1,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,       -- 护甲
    maxHp             = 8000,     -- 最大 HP
    attack            = 30,       -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 35,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 200,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,1,1,1,"130415",1,1,1,1,"130415",1,1,1,"130415",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次普通攻击,5000表示有50%概率会出发130241
        {3, 5000, "130411"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100604"] = monster


---------第十五关模式三5个BOSS-----------

local monster = {
    mainID            = "100605", -- 名字
    name_EN           = "Ancient Behemoth",
    name_CN           = "比蒙皇",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The emperor of Behemoths ,who has the unbelievable physical strength and body intensity. Well, magic is not his cup of tea.",
    text_CN           = "比蒙族的皇者,拥有难以想象的身体力量以及肉体强度。魔法,并不是比蒙的菜。",     -- 描述
    feature_CN        = "BOSS，拥有群体晕眩以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {15000, 5000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,       -- 护甲
    maxHp             = 2000,     -- 最大 HP
    attack            = 25,       -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 2000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 2000,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 200,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130415",1,1,1,1,"130415",1,1,1,"130415",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次普通攻击,5000表示有50%概率会出发130241
        {3, 5000, "130411"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100605"] = monster

local monster = {
    mainID            = "100606", -- 名字
    name_EN           = "Dark Warlord",
    name_CN           = "恶魔统领",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The middle rank commander of demons. He got an excellent blade skill besides the strong body. Well, from the demons'standpoint. . . ",
    text_CN           = "大恶魔王的前军总指挥",     -- 描述
    feature_CN        = "BOSS，拥有召唤怪物以及重击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {8000, 2000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 6500,     -- 免伤比例,表示15.00%
    armor             = 65,        -- 护甲
    maxHp             = 3000,       -- 最大 HP
    attack            = 15,      -- 攻击
    fireVision        = 70,       -- 视野,远程攻击范围
    fireRange         = 70,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,       -- 速度,单位：像素/秒
    critical          = 1000,     -- 暴击率。值代表10%
    dodge             = 0,      -- 闪避率。值代表10%
    criticalPower     = 15000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,"130412",1,1,"130412",1,"130412",1,"130412",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        {2, 4000, "130413"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 5000, "130413"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100606"] = monster

local monster = {
    mainID            = "100607", -- 名字
    name_EN           = "Frost Wyrm",
    name_CN           = "冰霜巨龙",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "Dragon has always been in the highest link of the biological chain. But it is said that the circle of Dragon is complicated  all the time. You can judge it from the other Frost members. ",
    text_CN           = "龙族一直都是生物链的顶层,不过据说龙族圈一直很乱,从冰霜族的其他成员的长相就能看出来了。",     -- 描述
    feature_CN        = "BOSS，主动攻击型，拥有加速冰道、飞行吐息以及强大攻击能力。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {8000, 2000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    level             = 1,        -- 等级
    AImode            = 2,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 85,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 4500,     -- 免伤比例,表示15.00%
    armor             = 45,        -- 护甲
    maxHp             = 4000,       -- 最大 HP
    attack            = 25,      -- 攻击
    bulletType        = "150126", -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory        = 2,        -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    fireVision        = 160,       -- 视野,远程攻击范围
    fireRange         = 160,      -- 射程,近战攻击范围
    cooldown1         = 1500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1500,     -- 远程攻击间隔,单位：毫秒
    speed             = 40,      -- 速度,单位：像素/秒
    critical          = 5000,     -- 暴击率。值代表10%
    dodge             = 1000,      -- 闪避率。值代表10%
    criticalPower     = 30000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 2,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,"130425",1,1,1,"130425",1,1,1,1,"130425",1,1,1,1,1,"130425",1,1,1,1,1,1,1,1,"130425",
    },
    AIskill           = {           -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},     -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130425"},     -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        {3, 16000, "130428"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100607"] = monster

local monster = {
    mainID            = "100608", -- 名字-   ---程序特殊做，ID写死不能改变
    name_EN           = "Knarama",
    name_CN           = "地狱炎魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The most ferocious and ruthless boss born in lava from the hell. Not? Not everybody can play with mud in the lava of high temperature.",
    text_CN           = "地狱熔岩诞生出最为凶残暴力的顶级BOSS。你觉得不是？你以为谁都能在那几千度的岩浆里玩泥巴么。",     -- 描述
    feature_CN        = "BOSS，钻地型，被阻拦后才会钻出地面。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    restCD            = {5000, 3000},    -- 怪物行为AI逻辑配置,表示行动了10s,需要休息5s
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 50,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3500,     -- 免伤比例,表示15.00%
    armor             = 35,        -- 护甲
    maxHp             = 4000,       -- 最大 HP
    attack            = 40,       -- 攻击
    fireVision        = 120,       -- 视野,远程攻击范围
    fireRange         = 120,       -- 射程,近战攻击范围
    cooldown1         = 500,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 500,     -- 远程攻击间隔,单位：毫秒
    speed             = 30,      -- 速度,单位：像素/秒
    critical          = 6000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 25000,    -- 暴击伤害的威力 150%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 3,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},       -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 10000, "130414"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
        --{3, 10000, "130415"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100608"] = monster

local monster = {
    mainID            = "100609", -- 名字 ----程序特殊做，ID写死不能改变
    name_EN           = "Demara",
    name_CN           = "大恶魔",       -- 名字
    sound_dead        = "Animal",  -- 怪物死亡时播放的音效
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot",     --远程攻击时播放的音效
    text_EN           = "The final boss? Believe it or not, he's the last one to show up. Gorgeous skills and remarkable moves are his specialities. Kill him ,then you are the best warrior. ",
    text_CN           = "最终BOSS？不管你信不信,反正他最后出场,技能华丽,招式漂亮就是他的招牌。干掉他你就是最强的勇士。",     -- 描述
    feature_CN        = "BOSS，拥有传送召唤、蝙蝠攻击技能。",      --怪物特性
    --bornEffect        = "effect/bornEffect/100101.png", -- 召唤怪物出现光效
    level             = 1,        -- 等级
    passValue         = 20,        --怪物达到终点关卡扣除的生命点数
    AImode            = 4,        -- AI类型,1/2/3/4依次表示,逃跑型/主动进攻性/半主动进攻型/被动进攻型
    maxMP             = 100,      -- 最大能量
    restoreMP         = {1000,1}, -- 能量回复,表示每1秒回复1点
    reduceDamage      = 3000,     -- 免伤比例,表示15.00%
    armor             = 30,       -- 护甲
    maxHp             = 8000,     -- 最大 HP
    attack            = 30,        -- 攻击
    fireVision        = 120,       -- 视野,远程攻击范围
    fireRange         = 120,       -- 射程,近战攻击范围
    cooldown1         = 1000,     -- 近战攻击间隔,单位：毫秒
    cooldown2         = 1000,     -- 远程攻击间隔,单位：毫秒
    speed             = 26,       -- 速度,单位：像素/秒
    critical          = 2000,     -- 暴击率。值代表10%
    dodge             = 500,      -- 闪避率。值代表10%
    criticalPower     = 40000,    -- 暴击伤害的威力600%
    hitTower          = 0,        -- 0表示不打塔,1表示打塔
    walkLayer         = 1,        -- 1表示地表,2表示空中,3表示底下
    addExp            = 220,      -- 被杀死提供英雄经验
    attackMode        = {         -- 攻击模式,普,普,技能ID,普
        1,1,1,1,1,1,1,1,1,1,"130417",1,1,1,1,1,"130417",1,1,1,"130417",1,1,"130417",1,"130417",
    },
    AIskill           = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        -- {2, 5000, "130241"},   -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        {3, 10000, "130416"},      -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义
    }, 
}
defines["100609"] = monster




function MonsterProperties.get(id)
    return clone(defines[id])
end

return MonsterProperties
