

local BulletProperties = {}

local defines = {}
------------------------箭射型子弹---------------------
local bullet = {
    mainID            = "150101",
    name              = "1-3级箭塔用",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 650,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/eff_160101_arrows.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转，返回true/false
    hitImages         = "bullet/eff_160101_halfarrows.png",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150101"] = bullet

local bullet = {
    mainID            = "150102",
    name              = "祭坛塔掠夺用",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 1000,      -- 飞行时间,单位：毫秒
    bulletImages      = "ui/fight/gold.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转，返回true/false
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150102"] = bullet

local bullet = {
    mainID            = "150103",
    name              = "1-3级仙术塔子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 500,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160301_magicwave",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_160304_magicwave_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150103"] = bullet

local bullet = {
    mainID            = "150104",
    name              = "怪物技能哮天犬子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 900,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/fireball.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150104"] = bullet

local bullet = {
    mainID            = "150105",
    name              = "5级仙术塔高级法弹子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 750,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/blueFireball.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150105"] = bullet

local bullet = {
    mainID            = "150106",
    name              = "英雄精灵射手普攻子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 450,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/eff_160101_arrows.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150106"] = bullet

local bullet = {
    mainID            = "150107",
    name              = "3级召唤猴兵子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/170204_bullet_1.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150107"] = bullet

local bullet = {
    mainID            = "150108",
    name              = "4级召唤猴兵子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/170204_bullet_1.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150108"] = bullet

local bullet = {
    mainID            = "150109",
    name              = "5级召唤猴兵子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/170204_bullet_1.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150109"] = bullet

local bullet = {
    mainID            = "150110",
    name              = "怪物100201的射击子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,     -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160104_fire",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    --hitImages         = "eff_100201_burst",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150110"] = bullet

local bullet = {
    mainID            = "150111",
    name              = "堕落天使子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 300,     -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160304_slow",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150111"] = bullet

local bullet = {
    mainID            = "150112",
    name              = "怪物100202的射击子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 900,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/arrow.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150112"] = bullet

local bullet = {
    mainID            = "150113",
    name              = "怪物100304的射击子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 500,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/peach.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150113"] = bullet

local bullet = {
    mainID            = "150114",
    name              = "怪物100305的射击子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 500,     -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/shoe.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150114"] = bullet

local bullet = {
    mainID            = "150115",
    name              = "英雄德鲁伊普攻子弹",      -- 名字
    bulletType        = 1,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 800,     -- 飞行时间,单位：毫秒
    bulletImages      = "eff_110301_photoelastic",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_110301_photoelastic_2",   -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150115"] = bullet

local bullet = {
    mainID            = "150116",
    name              = "仙术塔奥术子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 800,      -- 飞行时间,单位：毫秒
    delay             = 100,        -- 子弹发射出去以后, 已经在飞行了，只是过了0.1s子弹图片再显示出来
    bulletImages      = "eff_160305_magicwave",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_shouji_160304",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150116"] = bullet

local bullet = {
    mainID            = "150117",
    name              = "中级援兵水精子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 600,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/170204_bullet_1.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150117"] = bullet

local bullet = {
    mainID            = "150118",
    name              = "5级箭塔子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/eff_160101_arrows.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150118"] = bullet

local bullet = {
    mainID            = "150119",
    name              = "大耳怪100301扔锤子",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/eff_100301_ax.png",  -- 子弹图片
    isRotateSelf      = true,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150119"] = bullet

local bullet = {
    mainID            = "150120",
    name              = "冰霜巨魔祭祀100302冰枪接子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160301_magicwave",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150120"] = bullet

local bullet = {
    mainID            = "150121",
    name              = "仙术塔太阳塔子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 500,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160304_magicwave",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_160305_destroy_1_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150121"] = bullet

local bullet = {
    mainID            = "150122",
    name              = "冰霜龙骑100203冰枪接子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160301_magicwave",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_160304_magicwave_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150122"] = bullet

local bullet = {
    mainID            = "150123",
    name              = "荆棘之种技能子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 600,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_110301_thorns",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    --hitImages         = "",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150123"] = bullet

local bullet = {
    mainID            = "150124",
    name              = "BOSS100502邪恶召唤子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_100502_bullet",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    --hitImages         = "",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150124"] = bullet

local bullet = {
    mainID            = "150125",
    name              = "BOSS100503冰封领域子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/circle.png",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    --hitImages         = "",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150125"] = bullet

local bullet = {
    mainID            = "150126",
    name              = "BOSS100503普通攻击子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_100503_2",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    hitImages         = "eff_100503",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150126"] = bullet

local bullet = {
    mainID            = "150127",
    name              = "奥术塔魔力收集子弹",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,      -- 飞行时间,单位：毫秒
    bulletImages      = "eff_160304_magic",  -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    --hitImages         = "eff_100503",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150127"] = bullet

------------------------爆炸型子弹---------------------
local bullet = {
    mainID            = "150201",
    name              = "1-3级炮塔用",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 1100,     -- 飞行时间
    blastRadius       = 120,       -- 爆炸半径
    blastNumber       = 10,        -- 目标上限
    bulletImages      = "bullet/bomb.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "eff_160201_stone_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150201"] = bullet

local bullet = {
    mainID            = "150202",
    name              = "特殊熔岩柱特殊塔子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 1200,     -- 飞行时间
    blastRadius       = 100,       -- 爆炸半径
    blastNumber       = 3,        -- 目标上限
    bulletImages      = "eff_lava_bullet",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "eff_lava_bullet_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150202"] = bullet

local bullet = {
    mainID            = "150203",
    name              = "玛格技能子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 400,     -- 飞行时间
    blastRadius       = 60,       -- 爆炸半径
    blastNumber       = 3,        -- 目标上限
    bulletImages      = "bullet/eff_100201_fireball.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "eff_100201_burst",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150203"] = bullet

local bullet = {
    mainID            = "150204",
    name              = "闲置",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 1200,     -- 飞行时间
    blastRadius       = 120,       -- 爆炸半径
    blastNumber       = 2,        -- 目标上限
    bulletImages      = "bullet/bomb.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "bullet/eteor.png",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150204"] = bullet

local bullet = {
    mainID            = "150205",
    name              = "跟踪炮塔用",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 4200,     -- 飞行时间
    blastRadius       = 100,       -- 爆炸半径
    blastNumber       = 99,        -- 目标上限
    bulletImages      = "bullet/shark.png",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "bullet/eteor.png",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150205"] = bullet

local bullet = {
    mainID            = "150206",
    name              = "箭塔分支火焰箭用",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 1,        -- 武器类型，备注：火焰箭比较特色，类型用1
    flyTime           = 650,      -- 飞行时间
    blastRadius       = 120,       -- 爆炸半径
    blastNumber       = 2,        -- 目标上限
    bulletImages      = "eff_160104_fire",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "eff_160105_explosion",      -- 子弹击中地面后的爆炸效果
    hitImages         = "eff_100201_burst",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150206"] = bullet

local bullet = {
    mainID            = "150207",
    name              = "4级分支炮塔子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 1100,     -- 飞行时间
    blastRadius       = 120,       -- 爆炸半径
    blastNumber       = 10,        -- 目标上限
    bulletImages      = "eff_160204_rock",      -- 子弹图片
    isRotateSelf      = false,      -- 子弹图片是否旋转
    bombImages        = "eff_160201_stone_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150207"] = bullet

local bullet = {
    mainID            = "150208",
    name              = "金龙170106吐爆裂弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 2,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 300,     -- 飞行时间
    blastRadius       = 60,       -- 爆炸半径
    blastNumber       = 5,        -- 目标上限
    bulletImages      = "eff_170106",      -- 子弹图片
    isRotateSelf      = true,      -- 子弹图片是否旋转
    bombImages        = "eff_170106_tread",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150208"] = bullet

------------------------链锁型子弹---------------------
local bullet = {
    mainID            = "150301",
    name              = "雷电塔子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 200,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 5,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 5000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150301"] = bullet

local bullet = {
    mainID            = "150302",
    name              = "1级九幽阴雷子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 100,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 2,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 10000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150302"] = bullet

local bullet = {
    mainID            = "150303",
    name              = "2级九幽阴雷子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 100,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 3,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 12000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150303"] = bullet

local bullet = {
    mainID            = "150304",
    name              = "3级九幽阴雷子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 100,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 4,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 14000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150304"] = bullet

local bullet = {
    mainID            = "150305",
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 100,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 5,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 16000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150305"] = bullet

local bullet = {
    mainID            = "150306",
    name              = "菩提祖师普攻子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 50,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 0,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 16000,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150306"] = bullet

local bullet = {
    mainID            = "150307",
    name              = "5级炮塔分支雷电子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 140,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 1,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 10500,    -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "eff_160205_lighting",    -- 子弹图片
    hitImages         = "eff_160205_lighting_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150307"] = bullet

local bullet = {
    mainID            = "150308",
    name              = "冰霜雪球子弹",      -- 名字
    bulletType        = 3,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    jumpDistance      = 120,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 2,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 10000,    -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "bullet/electric.png",    -- 子弹图片
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150308"] = bullet
------------------------回旋型子弹---------------------
local bullet = {
    mainID            = "150401",
    name              = "树人子弹",      -- 名字
    bulletType        = 4,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flySpeed          = 300,      -- 飞行速度，像素/秒，
    flyTime           = 3000,        -- 子弹不回旋时最远飞行时间，像素/秒,返回0/数值，0=飞出屏幕外。
    returnTime        = 1500,      -- 飞行多久后触发回旋，单位：毫秒。
    dartRadius        = 20,       -- 回旋子弹碰撞检测半径，单位：像素。
    bulletImages      = "bullet/dart.png",      -- 子弹图片
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150401"] = bullet

local bullet = {
    mainID            = "150402",
    name              = "大恶魔技能恶魔蝙蝠子弹",      -- 名
    bulletType        = 4,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flySpeed          = 300,      -- 飞行速度，像素/秒，
    flyTime           = 3000,     -- 子弹不回旋时最远飞行时间，像素/秒,返回0/数值，0=飞出屏幕外。
    returnTime        = 3000,     -- 飞行多久后触发回旋，单位：毫秒。
    dartRadius        = 20,       -- 回旋子弹碰撞检测半径，单位：像素。
    bulletImages      = "eff_100505_breath",      -- 子弹图片
    hitImages         = "eff_100505_breath_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150402"] = bullet

------------------------扩散型子弹---------------------
local bullet = {
    mainID            = "150501",
    name              = "扩散火树用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 160,      -- 扩散半径
    diffuseNumber     = 99,        -- 扩散个数上限
    bulletImages      = "ui/fight/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150501"] = bullet

local bullet = {
    mainID            = "150502",
    name              = "1幻玉掌子弹用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 40,      -- 扩散半径
    diffuseNumber     = 5,        -- 扩散个数上限
    bulletImages      = "eff_110204_wasp",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150502"] = bullet

local bullet = {
    mainID            = "150503",
    name              = "2幻玉掌子弹用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 45,      -- 扩散半径
    diffuseNumber     = 5,        -- 扩散个数上限
    bulletImages      = "eff_110204_wasp",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150503"] = bullet

local bullet = {
    mainID            = "150504",
    name              = "3幻玉掌子弹用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 50,      -- 扩散半径
    diffuseNumber     = 5,        -- 扩散个数上限
    bulletImages      = "eff_110204_wasp",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150504"] = bullet

local bullet = {
    mainID            = "150505",
    name              = "4幻玉掌子弹用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 55,      -- 扩散半径
    diffuseNumber     = 5,        -- 扩散个数上限
    bulletImages      = "eff_110204_wasp",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150505"] = bullet

local bullet = {
    mainID            = "150506",
    name              = "5幻玉掌子弹用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 60,      -- 扩散半径
    diffuseNumber     = 5,        -- 扩散个数上限
    bulletImages      = "eff_110204_wasp",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150506"] = bullet

local bullet = {
    mainID            = "150507",
    name              = "怪物技能治疗用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 160,      -- 扩散半径
    diffuseNumber     = 6,        -- 扩散个数上限
    bulletImages      = "ui/fight/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150507"] = bullet

local bullet = {
    mainID            = "150508",
    name              = "怪物技能沉睡用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 80,      -- 扩散半径
    diffuseNumber     = 1,        -- 扩散个数上限
    bulletImages      = "eff_100501_giddy",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150508"] = bullet

local bullet = {
    mainID            = "150509",
    name              = "比蒙皇技能熊吼用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 160,      -- 扩散半径
    diffuseNumber     = 3,        -- 扩散个数上限
    bulletImages      = "eff_100501_giddy",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150509"] = bullet
 
local bullet = {
    mainID            = "150510",
    name              = "龙吟子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 120,      -- 扩散半径
    diffuseNumber     = 99,        -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150510"] = bullet

local bullet = {
    mainID            = "150511",
    name              = "怪物技能漏电用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 200,      -- 扩散半径
    diffuseNumber     = 3,        -- 扩散个数上限
    bulletImages      = "ui/fight/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150511"] = bullet

local bullet = {
    mainID            = "150512",
    name              = "BOSSS岩浆爆裂子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 1000,      -- 扩散半径
    diffuseNumber     = 4,        -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150512"] = bullet

local bullet = {
    mainID            = "150513",
    name              = "5级炮塔专用",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 381,      -- 扩散半径
    diffuseNumber     = 99,        -- 扩散个数上限
    bulletImages      = "ui/fight/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150513"] = bullet

local bullet = {
    mainID            = "150514",
    name              = "蘑菇爆裂",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 200,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",       -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150514"] = bullet

local bullet = {
    mainID            = "150515",
    name              = "1级明王忿化",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_110102_disperse",        -- 子弹扩散效果
    hitImages         = "eff_110102_monster_dispersed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150515"] = bullet

local bullet = {
    mainID            = "150516",
    name              = "2级明王忿化",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_110102_disperse",        -- 子弹扩散效果
    hitImages         = "eff_110102_monster_dispersed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150516"] = bullet

local bullet = {
    mainID            = "150517",
    name              = "3级明王忿化",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_110102_disperse",        -- 子弹扩散效果
    hitImages         = "eff_110102_monster_dispersed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150517"] = bullet

local bullet = {
    mainID            = "150518",
    name              = "4级明王忿化",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_110102_disperse",        -- 子弹扩散效果
    hitImages         = "eff_110102_monster_dispersed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150518"] = bullet

local bullet = {
    mainID            = "150519",
    name              = "5级明王忿化",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_110102_disperse",        -- 子弹扩散效果
    hitImages         = "eff_110102_monster_dispersed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150519"] = bullet

local bullet = {
    mainID            = "150520",
    name              = "1级静心咒",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 600,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150520"] = bullet

local bullet = {
    mainID            = "150521",
    name              = "2级静心咒",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 600,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150521"] = bullet

local bullet = {
    mainID            = "150522",
    name              = "3级静心咒",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 600,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150522"] = bullet

local bullet = {
    mainID            = "150523",
    name              = "1-5级雨润杏花子弹",      -- 名字
    bulletType        = 5,        -- 武器 类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 60,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "eff_110301_treatment_rain",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150523"] = bullet

local bullet = {
    mainID            = "150524",
    name              = "缴擒爪子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 120,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    hitImages         = "Add_gold",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150524"] = bullet

local bullet = {
    mainID            = "150525",
    name              = "论道讲禅子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 300,     -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150525"] = bullet

local bullet = {
    mainID            = "150526",
    name              = "1-5级雨润杏花子弹扩大4倍版",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 180,      -- 扩散半径
    diffuseNumber     = 99,       -- 扩散个数上限
    bulletImages      = "eff_110301_treatment_rain",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150526"] = bullet

local bullet = {
    mainID            = "150527",
    name              = "火图腾群体攻击子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 100,      -- 扩散半径
    diffuseNumber     = 5,       -- 扩散个数上限
    bulletImages      = "eff_160204_burning",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150527"] = bullet

local bullet = {
    mainID            = "150528",
    name              = "恶魔之血子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 120,      -- 扩散半径
    diffuseNumber     = 5,      -- 扩散个数上限
    bulletImages      = "bullet/circle.png",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150528"] = bullet

local bullet = {
    mainID            = "150529",
    name              = "4级箭塔用",      -- 名字
    bulletType        = 1,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    flyTime           = 650,      -- 飞行时间,单位：毫秒
    bulletImages      = "bullet/eff_160101_arrows.png",      -- 子弹图片
    hitImages         = "bullet/eff_160101_halfarrows.png",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150529"] = bullet

local bullet = {
    mainID            = "150530",
    name              = "风之迅捷子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 300,      -- 扩散半径
    diffuseNumber     = 10,      -- 扩散个数上限
    bulletImages      = "eff_100501_giddy",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150530"] = bullet

local bullet = {
    mainID            = "1505301",
    name              = "冰之冻结子弹",      -- 名字
    bulletType        = 5,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    diffuseRadius     = 300,      -- 扩散半径
    diffuseNumber     = 10,      -- 扩散个数上限
    bulletImages      = "eff_100501_giddy",        -- 子弹扩散效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150531"] = bullet

------------------------陨落型子弹---------------------
local bullet = {
    mainID            = "150601",
    name              = "流星女神子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 90,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 80,       -- 陨落点半径
    dropSpeed         = 800,      -- 陨落速度，单位：像素
    dropInterval      = 500,      -- 陨落间隔，单位：毫秒
    dropWave          = 5,        -- 陨落波次
    dropNumber        = 3,        -- 陨落目标上限
    diffRadius        = 50,       -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eteor.png",      -- 子弹图片
    bombImages        = "bullet/eteor.png",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150601"] = bullet

local bullet = {
    mainID            = "150602",
    name              = "践踏山河子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 90,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 45,       -- 陨落点半径
    dropSpeed         = 1200,     -- 陨落速度，单位：像素
    dropInterval      = 0,        -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 3,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "eff_110101_hammer",       -- 子弹图片
    bombImages        = "eff_110101_hit_hammer",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150602"] = bullet

local bullet = {
    mainID            = "150603",
    name              = "怪物技能玲珑塔子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 90,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 100,      -- 陨落点半径
    dropSpeed         = 800,      -- 陨落速度，单位：像素
    dropInterval      = 0,        -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 5,        -- 陨落目标上限
    diffRadius        = 0,       -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eteor.png",      -- 子弹图片
    bombImages        = "bullet/eteor.png",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150603"] = bullet

local bullet = {
    mainID            = "150604",-------------由引导动作5个关键帧触发
    name              = "狐悲咏唱子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 300,      -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 60,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 50,       -- 陨落点半径
    dropSpeed         = 1000,     -- 陨落速度，单位：像素
    dropInterval      = 2000,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 10,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "eff_160104_fire",      -- 子弹图片
    bombImages        = "eff_110204_volley_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150604"] = bullet

local bullet = {
    mainID            = "150605",
    name              = "1级鹏翅金羽子弹",      -- 名字
    bombSound         = "Kenkonitteki_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 30,       -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,        -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150605"] = bullet

local bullet = {
    mainID            = "150606",
    name              = "2级鹏翅金羽子弹",      -- 名字
    bombSound         = "Kenkonitteki_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 30,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150606"] = bullet

local bullet = {
    mainID            = "150607",
    name              = "3级鹏翅金羽子弹",      -- 名字
    bombSound         = "Kenkonitteki_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 30,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150607"] = bullet

local bullet = {
    mainID            = "150608",
    name              = "4级鹏翅金羽子弹",      -- 名字
    bombSound         = "Kenkonitteki_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 30,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150608"] = bullet

local bullet = {
    mainID            = "150609",
    name              = "5级鹏翅金羽子弹",      -- 名字
    bombSound         = "Kenkonitteki_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 30,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150609"] = bullet

local bullet = {
    mainID            = "150610",
    name              = "玄天劫火子弹",      -- 名字
    bombSound         = "Meteorite_2",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 360,       -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 90,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 60,       -- 陨落点半径
    dropSpeed         = 600,     -- 陨落速度，单位：像素
    dropInterval      = 1000,     -- 陨落间隔，单位：毫秒
    dropWave          = 5,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 200,      -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "eff_110205_armageddon",      -- 子弹图片
    bombImages        = "eff_110205_aerolite",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150610"] = bullet

local bullet = {
    mainID            = "150611",
    name              = "1级鹏翅金羽子弹羁绊版",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 80,       -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150611"] = bullet

local bullet = {
    mainID            = "150612",
    name              = "2级鹏翅金羽子弹羁绊版",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 90,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150612"] = bullet

local bullet = {
    mainID            = "150613",
    name              = "3级鹏翅金羽子弹羁绊版",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 100,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150613"] = bullet

local bullet = {
    mainID            = "150614",
    name              = "4级鹏翅金羽子弹羁绊版",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 110,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150614"] = bullet

local bullet = {
    mainID            = "150615",
    name              = "5级鹏翅金羽子弹羁绊版",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 0,        -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 120,      -- 陨落角度，90=90度垂直陨落
    dropRadius        = 120,      -- 陨落点半径
    dropSpeed         = 1100,     -- 陨落速度，单位：像素
    dropInterval      = 0,        -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 0,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/eff_110203_money_1.png",      -- 子弹图片
    bombImages        = "eff_110203_money_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150615"] = bullet

local bullet = {
    mainID            = "150616",
    name              = "RMB雷霆之怒子弹",      -- 名字
    bombSound         = "Armageddon",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 100,       -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 90,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 60,       -- 陨落点半径
    dropSpeed         = 1000,      -- 陨落速度，单位：像素
    dropInterval      = 100,      -- 陨落间隔，单位：毫秒
    dropWave          = 7,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 500,      -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "bullet/circle.png",      -- 子弹图片
    bombImages        = "eff_170301_thunder",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150616"] = bullet

local bullet = {
    mainID            = "150617",-------------由引导动作10个关键帧触发
    name              = "恶魔大军子弹",      -- 名字
    bombSound         = "Ground",      -- 子弹击中地面后的音效
    bulletType        = 6,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    dropHeight        = 300,      -- 陨落高度，0表示屏幕外，具体数值表示距离目标区域的垂直距离，单位：像素
    dropAngle         = 60,       -- 陨落角度，90=90度垂直陨落
    dropRadius        = 20,       -- 陨落点半径
    dropSpeed         = 1000,     -- 陨落速度，单位：像素
    dropInterval      = 2000,     -- 陨落间隔，单位：毫秒
    dropWave          = 1,        -- 陨落波次
    dropNumber        = 6,        -- 陨落目标上限
    diffRadius        = 5,        -- 当陨落多波子弹，后一波子弹基于第1颗子弹中心的偏移量，一波时参数无效
    bulletImages      = "eff_110205_armageddon",      -- 子弹图片
    bombImages        = "eff_160204_burst_2",      -- 子弹击中地面后的爆炸效果
    -- hitImages         = "180",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150617"] = bullet

------------------------激光型子弹---------------------
local bullet = {
    mainID            = "150801",
    name              = "仙术塔B千年狐火子弹",      -- 名字
    bulletType        = 8,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落，8=激光
    moveSpeed         = 70,      -- 激光移动速度，像素/秒，
    moveTime          = 1300,     -- 激光移动时间，单位：毫秒
    laserRadius       = 10,       -- 激光击中点碰撞检测半径，单位：像素。
    bulletImages      = "eff_160305_destroy",      -- 子弹图片
    hitImages         = "eff_160305_destroy_1_2",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150801"] = bullet

------------------------跟踪型子弹---------------------
local bullet = {
    mainID            = "150901",
    name              = "仙术塔A招魂全屏追踪子弹",      -- 名字
    bulletType        = 9,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落，8=激光 9=跟踪弹
    flySpeed          = 200,      -- 激光移动速度，像素/秒，
    bulletImages      = "eff_160305_magicwave",      -- 子弹图片
    hitImages         = "eff_shouji_160304",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150901"] = bullet

------------------------ 跳跃型子弹---------------------
local bullet = {
    mainID            = "151001",
    name              = "雪球跳跃子弹",      -- 名字
    bulletType        = 10,       -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落，8=激光 9=跟踪弹, 10表示跳跃子弹
    trajectory        = 2,        -- 子弹轨迹，1=直线2=抛物线3=跟踪转圈
    flySpeed          = 130,      -- 移动速度，像素/秒，
    jumpDistance      = 200,      -- 跳跃距离限制,2个跳跃目标距离大于这个距离，将中断跳跃
    jumpNumber        = 5,        -- 跳跃次数, 跳跃次数达到后子弹消失
    jumpReduce        = 0,     -- 跳跃衰减, 攻击衰减程式=攻击*（1+攻击衰减）^跳次
    bulletImages      = "bullet/eff_100302_Wave_1.png",    -- 子弹图片
    -- hitImages         = "eff_160304_slow",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["151001"] = bullet

-------------------直接处理的子弹------------
local bullet = {
    mainID            = "150701",
    name              = "罗刹鬼斩子弹",      -- 名字
    bulletType        = 7,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落, 7=近战
    hitImages         = "eff_110301_crit",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150701"] = bullet

----------- 所有近战攻击都调用这个子弹，由程序写死掉 --------- 
local bullet = {
    mainID            = "150702",
    name              = "近战子弹",      -- 名字
    bulletType        = 7,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落
    hitImages         = "Bleed",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150702"] = bullet
-------------------直接处理的子弹------------
local bullet = {
    mainID            = "150703",
    name              = "邪恶斩杀弹",      -- 名字
    bulletType        = 7,        -- 武器类型，1=箭射，2=爆炸，3=链锁，4=回旋，5=扩散，6=陨落, 7=近战
    hitImages         = "eff_100502_cuted",    -- 受击光效,是怪物被击中后身上显示的一张小图,不是子弹带的图片
}
defines["150703"] = bullet
function BulletProperties.get(id)
    return clone(defines[id])
end

return BulletProperties
