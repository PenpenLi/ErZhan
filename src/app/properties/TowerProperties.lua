

local TowerProperties = {}

--------------------箭塔----------------
local TOWER01L01_FIRE_damage = 18     -- 攻击力
local TOWER01L02_FIRE_damage = 22
local TOWER01L03_FIRE_damage = 26
local TOWER01L04_FIRE_damage = 18
local TOWER01L05_FIRE_damage = 32

local TOWER01L01_FIRE_RANGE = 185    -- 箭塔射程,单位：像素
local TOWER01L02_FIRE_RANGE = 205
local TOWER01L03_FIRE_RANGE = 225
local TOWER01L04_FIRE_RANGE = 225
local TOWER01L05_FIRE_RANGE = 245

local TOWER01L01_FIRE_cooldown = 400   -- 开火冷却时间,单位：毫秒
local TOWER01L02_FIRE_cooldown = 400
local TOWER01L03_FIRE_cooldown = 400
local TOWER01L04_FIRE_cooldown = 400
local TOWER01L05_FIRE_cooldown = 400

--------------------炮塔----------------
local TOWER02L01_FIRE_damage = 48     -- 攻击力
local TOWER02L02_FIRE_damage = 56
local TOWER02L03_FIRE_damage = 62
local TOWER02L04_FIRE_damage = 70
local TOWER02L05_FIRE_damage = 44

local TOWER02L01_FIRE_RANGE = 175    -- 炮塔射程,单位：像素
local TOWER02L02_FIRE_RANGE = 195
local TOWER02L03_FIRE_RANGE = 215
local TOWER02L04_FIRE_RANGE = 215
local TOWER02L05_FIRE_RANGE = 235

local TOWER02L01_FIRE_cooldown = 3000   -- 开火冷却时间,单位：毫秒
local TOWER02L02_FIRE_cooldown = 3000
local TOWER02L03_FIRE_cooldown = 3000
local TOWER02L04_FIRE_cooldown = 3000
local TOWER02L05_FIRE_cooldown = 1200

--------------------仙术塔----------------
local TOWER03L01_FIRE_damage = 56     -- 攻击力
local TOWER03L02_FIRE_damage = 68
local TOWER03L03_FIRE_damage = 80
local TOWER03L04_FIRE_damage = 96
local TOWER03L05_FIRE_damage = 72

local TOWER03L01_FIRE_RANGE = 170    -- 仙术塔射程,单位：像素
local TOWER03L02_FIRE_RANGE = 190
local TOWER03L03_FIRE_RANGE = 210
local TOWER03L04_FIRE_RANGE = 210
local TOWER03L05_FIRE_RANGE = 230

local TOWER03L01_FIRE_cooldown = 2000   -- 开火冷却时间,单位：毫秒
local TOWER03L02_FIRE_cooldown = 2000
local TOWER03L03_FIRE_cooldown = 2000
local TOWER03L04_FIRE_cooldown = 2400
local TOWER03L05_FIRE_cooldown = 2000

--------------------祭坛塔----------------
local TOWER04L01_FIRE_damage = 2     -- 攻击力
local TOWER04L02_FIRE_damage = 3
local TOWER04L03_FIRE_damage = 4
local TOWER04L04_FIRE_damage = 5
local TOWER04L05_FIRE_damage = 6

local TOWER04L01_FIRE_RANGE = 240    -- 射程,单位：像素
local TOWER04L02_FIRE_RANGE = 264
local TOWER04L03_FIRE_RANGE = 291
local TOWER04L04_FIRE_RANGE = 320
local TOWER04L05_FIRE_RANGE = 352

local TOWER04L01_FIRE_cooldown = 1389   -- 开火冷却时间,单位：毫秒
local TOWER04L02_FIRE_cooldown = 1323
local TOWER04L03_FIRE_cooldown = 1260
local TOWER04L04_FIRE_cooldown = 1200
local TOWER04L05_FIRE_cooldown = 1143
-----------------------------------------


local defines = {}

----------------------------------------箭塔

local tower = {
    mainID        = "160101",
    towerType     = 1,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Guard Tower Lv1",
    name_CN       = "1级箭塔",     -- 最多6个中文字
    text_EN       = "Deal with aerial and quick units.",
    text_CN       = "擅长对付空中和快速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very fast",
    speedText_CN     = "非常快",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_2",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 120,     -- 升到本级所需金币
    sellGold      = 72,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER01L01_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150101",    -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,           -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,          -- 同时射几个子弹
    cooldown      = TOWER01L01_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER01L01_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力,150%
    atkGold       = 0,        -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 1,         --TowerObjectsProperties配置内形象偏移量所在列
    level         = 1,      -- 塔的等级,2015.4.27新加
}
defines["160101"] = tower -- 箭塔第1级


local tower = {
    mainID        = "160102",
    towerType     = 1,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Guard Tower Lv2",
    name_CN       = "2级箭塔",     -- 最多6个中文字
    text_EN       = "Deal with aerial and quick units.",
    text_CN       = "擅长对付空中和快速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very fast",
    speedText_CN  = "非常快",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_2",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 180,     -- 升到本级所需金币
    sellGold      = 180,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER01L02_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150101",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER01L02_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER01L02_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 2,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 2,      -- 塔的等级,2015.4.27新加
}
defines["160102"] = tower -- 箭塔第2级


local tower = {
    mainID        = "160103",
    towerType     = 1,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Guard Tower Lv3",
    name_CN       = "3级箭塔",     -- 最多6个中文字
    text_EN       = "Deal with aerial and quick units.",
    text_CN       = "擅长对付空中和快速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very fast",
    speedText_CN  = "非常快",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_2",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 260,     -- 升到本级所需金币
    sellGold      = 336,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER01L03_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150101",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER01L03_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER01L03_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 3,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 3,      -- 塔的等级,2015.4.27新加
}
defines["160103"] = tower -- 箭塔第3级

local tower = {
    mainID        = "160104",
    towerType     = 1,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Thorns Tower",
    name_CN       = "荆棘箭塔",     -- 最多6个中文字
    text_EN       = "Multi-shot and poison.",
    text_CN       = "拥有箭支分裂与毒素能力", -- TiPS显示,塔的描述
    speedText_EN  = "Fast",
    speedText_CN  = "快",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_2",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 375,     -- 升到本级所需金币
    sellGold      = 561,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER01L04_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150529",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 2,       -- 同时射几个子弹
    cooldown      = TOWER01L04_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER01L04_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 4,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 4,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"630101", "630201"},    --塔天赋
}
defines["160104"] = tower -- 箭塔第4级

local tower = {
    mainID        = "160105",
    towerType     = 1,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Elemental Tower",
    name_CN       = "火焰箭塔",     -- 最多6个中文字
    text_EN       = "Damage superposition and flame arrows.",
    text_CN       = "拥有射击叠伤与火焰箭能力", -- TiPS显示,塔的描述
    speedText_EN  = "Fast",
    speedText_CN  = "快",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shoot_2",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 400,     -- 升到本级所需金币
    sellGold      = 576,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER01L05_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150118",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER01L05_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER01L05_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1500,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 4,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 5,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"630301", "630401"},    --塔天赋
}
defines["160105"] = tower -- 箭塔第5级


----------------------------------------炮塔
local tower = {
    mainID        = "160201",
    towerType     = 2,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Ancient of War Lv1",
    name_CN       = "1级战争古树",     -- 最多6个中文字
    text_EN       = "Deal with slow groups.",
    text_CN       = "擅长对付抱团慢速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very slow",
    speedText_CN  = "非常慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Jettisonin",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 180,     -- 升到本级所需金币
    sellGold      = 108,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER02L01_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150201",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER02L01_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER02L01_FIRE_RANGE, -- 射程,单位：像素
    critical      = 5000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 1,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 1,      -- 塔的等级,2015.4.27新加
}
defines["160201"] = tower -- 炮塔第1级


local tower = {
    mainID        = "160202",
    towerType     = 2,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Ancient of War Lv2",
    name_CN       = "2级战争古树",     -- 最多6个中文字
    text_EN       = "Deal with slow groups.",
    text_CN       = "擅长对付抱团慢速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very slow",
    speedText_CN  = "非常慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Jettisonin",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 275,     -- 升到本级所需金币
    sellGold      = 273,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER02L02_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150201",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER02L02_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER02L02_FIRE_RANGE, -- 射程,单位：像素
    critical      = 5000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 2,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 2,      -- 塔的等级,2015.4.27新加
}
defines["160202"] = tower -- 炮塔第2级


local tower = {
    mainID        = "160203",
    towerType     = 2,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Ancient of War Lv3",
    name_CN       = "3级战争古树",     -- 最多6个中文字
    text_EN       = "Deal with slow groups.",
    text_CN       = "擅长对付抱团慢速移动单位", -- TiPS显示,塔的描述
    speedText_EN  = "Very slow",
    speedText_CN  = "非常慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Jettisonin",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 400,     -- 升到本级所需金币
    sellGold      = 513,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER02L03_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150201",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER02L03_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER02L03_FIRE_RANGE, -- 射程,单位：像素
    critical      = 5000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 3,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 3,      -- 塔的等级,2015.4.27新加
}
defines["160203"] = tower -- 炮塔第3级

local tower = {
    mainID        = "160204",
    towerType     = 2,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Ancient of Burst",
    name_CN       = "岩爆古树",     -- 最多6个中文字
    text_EN       = "Burst and summon division.",
    text_CN       = "拥有更大爆裂和召唤小火树能力", -- TiPS显示,塔的描述
    speedText_EN  = "Very slow",
    speedText_CN  = "非常慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Jettisonin",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 600,     -- 升到本级所需金币
    sellGold      = 873,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER02L04_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150207",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER02L04_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER02L04_FIRE_RANGE, -- 射程,单位：像素
    critical      = 5000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 4,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 4,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"630501", "630601"},    --塔天赋
}
defines["160204"] = tower -- 炮塔第4级

local tower = {
    mainID        = "160205",
    towerType     = 2,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Ancient of Lightning",
    name_CN       = "雷电古树",     -- 最多6个中文字
    text_EN       = "Lightning chain and anti-air.",
    text_CN       = "拥有可对空更大范围闪电链攻击", -- TiPS显示,塔的描述
    speedText_EN  = "Medium",
    speedText_CN  = "中等",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Shock",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 600,     -- 升到本级所需金币
    sellGold      = 873,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER02L05_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150307",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER02L05_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER02L05_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 15000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 5,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 5,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"630801", "630901"},    --塔天赋
}
defines["160205"] = tower -- 炮塔第5级

------------------------------------------

local tower = {
    mainID        = "160301",
    towerType     = 3,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Magic Tower Lv1",
    name_CN       = "1级魔法塔",     -- 最多6个中文字
    text_EN       = "Deal with units of high defence.",
    text_CN       = "擅长对付高血高防单体目标", -- TiPS显示,塔的描述
    speedText_EN  = "Slow",
    speedText_CN  = "慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Magic",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 155,     -- 升到本级所需金币
    sellGold      = 93,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER03L01_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150103",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER03L01_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER03L01_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 18000,    -- 暴击伤害的威力 150%
    atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 1,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 1,      -- 塔的等级,2015.4.27新加
    addReduceDamage   = 0,        -- 穿透率。值代表10000表示无视对方100%的免伤比例
}
defines["160301"] = tower -- 仙术塔第1级


local tower = {
    mainID        = "160302",
    towerType     = 3,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Magic Tower Lv2",
    name_CN       = "2级魔法塔",     -- 最多6个中文字
    text_EN       = "Deal with units of high defence.",
    text_CN       = "擅长对付高血高防单体目标", -- TiPS显示,塔的描述
    speedText_EN  = "Slow",
    speedText_CN  = "慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Magic",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 235,     -- 升到本级所需金币
    sellGold      = 234,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER03L02_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150103",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER03L02_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER03L02_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 18000,    -- 暴击伤害的威力 150%
    atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 2,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 2,      -- 塔的等级,2015.4.27新加
    addReduceDamage   = 0,        -- 穿透率。值代表10000表示无视对方100%的免伤比例
}
defines["160302"] = tower -- 仙术塔第2级


local tower = {
    mainID        = "160303",
    towerType     = 3,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Magic Tower Lv3",
    name_CN       = "3级魔法塔",     -- 最多6个中文字
    text_EN       = "Deal with units of high defence.",
    text_CN       = "擅长对付高血高防单体目标", -- TiPS显示,塔的描述
    speedText_EN  = "Slow",
    speedText_CN  = "慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Magic",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 340,     -- 升到本级所需金币
    sellGold      = 438,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER03L03_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150103",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER03L03_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER03L03_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 18000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 3,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 3,      -- 塔的等级,2015.4.27新加
    addReduceDamage   = 0,        -- 穿透率。值代表10000表示无视对方100%的免伤比例
}
defines["160303"] = tower -- 仙术塔第3级

local tower = {
    mainID        = "160304",
    towerType     = 3,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Arcane Tower",
    name_CN       = "奥术塔",     -- 最多6个中文字
    text_EN       = "Gether magic from deads and full-screen attack.",
    text_CN       = "汲取魔力释放2枚奥术飞弹全屏追踪攻击", -- TiPS显示,塔的描述
    speedText_EN  = "Slower",
    speedText_CN  = "较慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "MagicII",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 520,     -- 升到本级所需金币
    sellGold      = 750,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER03L04_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150116",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER03L04_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER03L04_FIRE_RANGE, -- 射程,单位：像素
    collectRange  = 460,      -- 魂魄收集范围,在这个范围内死掉的怪物,都会给塔充魂魄
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 20000,    -- 暴击伤害的威力 150%
    atkGold       = 0,        -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 4,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 4,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"631001", "631101"},    --塔天赋
    addReduceDamage   = 2500,        -- 穿透率。值代表10000表示无视对方100%的免伤比例

}
defines["160304"] = tower -- 仙术塔第4级

local tower = {
    mainID        = "160305",
    towerType     = 3,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
    name_EN       = "Sun Tower",
    name_CN       = "太阳塔",     -- 最多6个中文字
    text_EN       = "Emit sunlight to penetrate the armor.",
    text_CN       = "释放太阳光束灼烧并拥有穿透目标护甲能力", -- TiPS显示,塔的描述
    speedText_EN  = "Slow",
    speedText_CN  = "慢",    -- TiPS显示,塔的攻击速度描述文字
    sound_attack      = "Weapons",   --近战攻击时播放的音效
    sound_farAttack   = "Magic",     --远程攻击时播放的音效
    maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
    levelGold     = 485,     -- 升到本级所需金币
    sellGold      = 729,      -- 0表示不可出售,具体数值,表示出售金币价格
    atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
    attack        = TOWER03L05_FIRE_damage,      -- 对目标的伤害
    bulletType    = "150121",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
    trajectory    = 1,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
    atkNumber     = 1,      -- 同时射几个子弹
    cooldown      = TOWER03L05_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
    fireRange     = TOWER03L05_FIRE_RANGE, -- 射程,单位：像素
    critical      = 1000,     -- 暴击率。值代表10%
    criticalPower = 18000,    -- 暴击伤害的威力 150%
    atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
    addGold       = {0,1400},  --每1.4秒生产0金币
    enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
    staticIndex   = 5,       --TowerObjectsProperties配置内形象偏移量所在列
    level         = 5,      -- 塔的等级,2015.4.27新加
    towerTalent   = {"631201", "631301"},   --塔天赋
    addReduceDamage   = 0,        -- 穿透率。值代表10000表示无视对方100%的免伤比例
    AIskill       = {         -- 技能ID*根据AI判断技能释放时机,例如：治疗技能、无敌等辅助技能
        --{1, 0, "130201"},         -- 1表示自身血量,1500表示少于15%时会出发130241
        --{2, 5000, "130241"},      -- 2表示自身每次攻击,5000表示有50%概率会出发130241
        --{3, 6000, "231201"},        -- 3表示CD触发的技能,CD时间到了就会释放130501
    }, 
    -- attackMode        = {         -- 攻击模式,普,普,技能ID,普
    --     1,1,1,1,"130501",
    -- },
}
defines["160305"] = tower -- 仙术塔第5级

------------------------------------------

-- local tower = {
--     mainID        = "160401",
--     towerType     = 4,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
--     name_EN       = "ABC",
--     name_CN       = "1级祭坛塔",     -- 最多6个中文字
--     maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
--     levelGold     = 64,     -- 升到本级所需金币
--     sellGold      = 39,      -- 0表示不可出售,具体数值,表示出售金币价格
--     atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
--     attack        = TOWER04L01_FIRE_damage,      -- 对目标的伤害
--     bulletType    = "150102",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     atkNumber     = 1,      -- 同时射几个子弹
--     cooldown      = TOWER04L01_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
--     fireRange     = TOWER04L01_FIRE_RANGE, -- 射程,单位：像素
--     critical      = 1000,     -- 暴击率。值代表10%
--     criticalPower = 15000,    -- 暴击伤害的威力 150%
--     atkGold       = 1,     -- 0代表无法获得金钱,数值代表获得金币量
--     addGold       = {5,3000},  --每3秒生产0金币
--     enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
--     staticIndex   = 1,       --TowerObjectsProperties配置内形象偏移量所在列
--     level         = 1,      -- 塔的等级,2015.4.27新加
-- }
-- defines["160401"] = tower -- 祭坛塔第1级


-- local tower = {
--     mainID        = "160402",
--     towerType     = 4,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
--     name_EN       = "ABC",
--     name_CN       = "2级祭坛塔",     -- 最多6个中文字
--     maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
--     levelGold     = 102,     -- 升到本级所需金币
--     sellGold      = 100,      -- 0表示不可出售,具体数值,表示出售金币价格
--     atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
--     attack        = TOWER04L02_FIRE_damage,      -- 对目标的伤害
--     bulletType    = "150102",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     atkNumber     = 1,      -- 同时射几个子弹
--     cooldown      = TOWER04L02_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
--     fireRange     = TOWER04L02_FIRE_RANGE, -- 射程,单位：像素
--     critical      = 1000,     -- 暴击率。值代表10%
--     criticalPower = 15000,    -- 暴击伤害的威力 150%
--     atkGold       = 0,     -- 0代表无法获得金钱,数值代表获得金币量
--     addGold       = {7,3000},  --每3秒生产0金币
--     enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
--     staticIndex   = 2,       --TowerObjectsProperties配置内形象偏移量所在列
--     level         = 2,      -- 塔的等级,2015.4.27新加
-- }
-- defines["160402"] = tower -- 祭坛塔第2级


-- local tower = {
--     mainID        = "160403",
--     towerType     = 4,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
--     name_EN       = "ABC",
--     name_CN       = "3级祭坛塔",     -- 最多6个中文字
--     maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
--     levelGold     = 153,     -- 升到本级所需金币
--     sellGold      = 192,      -- 0表示不可出售,具体数值,表示出售金币价格
--     atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
--     attack        = TOWER04L03_FIRE_damage,      -- 对目标的伤害
--     bulletType    = "150102",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     atkNumber     = 1,      -- 同时射几个子弹
--     cooldown      = TOWER04L03_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
--     fireRange     = TOWER04L03_FIRE_RANGE, -- 射程,单位：像素
--     critical      = 1000,     -- 暴击率。值代表10%
--     criticalPower = 15000,    -- 暴击伤害的威力 150%
--     atkGold       = 0,        -- 0代表无法获得金钱,数值代表获得金币量
--     addGold       = {9,3000},  --每3秒生产0金币
--     enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
--     staticIndex   = 3,       --TowerObjectsProperties配置内形象偏移量所在列
--     level         = 3,      -- 塔的等级,2015.4.27新加
-- }
-- defines["160403"] = tower -- 祭坛塔第3级

-- local tower = {
--     mainID        = "160404",
--     towerType     = 4,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
--     name_EN       = "ABC",
--     name_CN       = "4级祭坛塔",     -- 最多6个中文字
--     maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
--     levelGold     = 230,     -- 升到本级所需金币
--     sellGold      = 330,      -- 0表示不可出售,具体数值,表示出售金币价格
--     atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
--     attack        = TOWER04L04_FIRE_damage,      -- 对目标的伤害
--     bulletType    = "150102",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     atkNumber     = 1,      -- 同时射几个子弹
--     cooldown      = TOWER04L04_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
--     fireRange     = TOWER04L04_FIRE_RANGE, -- 射程,单位：像素
--     critical      = 1000,     -- 暴击率。值代表10%
--     criticalPower = 15000,    -- 暴击伤害的威力 150%
--     atkGold       = 0,      -- 0代表无法获得金钱,数值代表获得金币量
--     addGold       = {12,3000},  --每3秒生产0金币
--     enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
--     staticIndex   = 4,       --TowerObjectsProperties配置内形象偏移量所在列
--     level         = 4,      -- 塔的等级,2015.4.27新加
-- }
-- defines["160404"] = tower -- 祭坛塔第4级

-- local tower = {
--     mainID        = "160405",
--     towerType     = 4,      -- 炮台类型, 1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔
--     name_EN       = "ABC",
--     name_CN       = "5级祭坛塔",     -- 最多6个中文字
--     maxHp         = 3,      -- 最大 HP,1点值代表被怪物攻击1次
--     levelGold     = 347,     -- 升到本级所需金币
--     sellGold      = 538,      -- 0表示不可出售,具体数值,表示出售金币价格
--     atkPriority   = {1,4,2,3}, -- first_second_third,1/2/3/4依次对应怪物非/主动/半主动/被动
--     attack        = TOWER04L05_FIRE_damage,      -- 对目标的伤害
--     bulletType    = "150102",       -- 子弹类型,1=箭射,2=爆炸,3=链锁,4=回旋,5=扩散,6=坠砸
--     trajectory    = 2,       -- 子弹轨迹,1=直线2=抛物线3=跟踪转圈
--     atkNumber     = 1,      -- 同时射几个子弹
--     cooldown      = TOWER04L05_FIRE_cooldown,   -- 开火冷却时间,单位：毫秒/次
--     fireRange     = TOWER04L05_FIRE_RANGE, -- 射程,单位：像素
--     critical      = 1000,     -- 暴击率。值代表10%
--     criticalPower = 15000,    -- 暴击伤害的威力 150%
--     atkGold       = 1,      -- 0代表无法获得金钱,数值代表获得金币量
--     addGold       = {15,3000},  --每3秒生产0金币
--     enemyType     = {1,2},     -- 可以攻击的怪物类型,{1表示对地面,2表示对空,3表示对地下},不写代表不可攻击
--     staticIndex   = 5,       --TowerObjectsProperties配置内形象偏移量所在列
--     level         = 5,      -- 塔的等级,2015.4.27新加
-- }
-- defines["160405"] = tower -- 祭坛塔第5级
----------------------------------------

function TowerProperties.get(id)
    -- print("TowerProperties.get(id) id = "..tostring(id))
    return clone(defines[id])
end

return TowerProperties