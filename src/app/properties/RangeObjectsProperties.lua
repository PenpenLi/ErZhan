
--[[--

定义了所有的区域对象，相当于策划说的NPC

]]

--[[
rangeType 用来表示是什么类型的区域/NPC
    1:  表示怪物出生点
    2:  表示怪物的终点
    3:  表示英雄出生点
    4:  减速区域
    5:  表示机关技能，点击后会释放一个技能
    6:  表示任务探索NPC，确认后，英雄会消失去做任务
    7:  表示可拾取物
    8:  表示飞鸟抛物
    9:  表示传送门，怪物进入后会从另外一个门里出来
    10: 遮挡区域
    11: 暗道入口
    12：暗道出口
    13: 表示打野元素
]]

local MapConstants = require("app.map.MapConstants")

local RangeObjectsProperties = {}

local defines = {}

----------------------------------------
-- 定义圈物体，包括出生点、死亡点、特殊功能的区域

local object = {
    classId       = "rangeobject",    -- 在RangeObjectTool中根据这个来新建物体
    imageName     = "rangeobject/BornRange.png",  -- "BornRange.png",
    radius        = 40,
    radiusOffsetY = 0,
    -- offsetY       = 33,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 1,    -- 表示出生点
    campId        = MapConstants.NPC_CAMP,  -- 一定要设置campId属性,不然默认为2,enemy,将不会与敌人做碰撞检测
    mapId         = "A0001",
}
defines["BornRange"] = object

----------------------------------------

local object = {
    classId       = "rangeobject",
    imageName     = "#Building01.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 33,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 2,    -- 表示怪物的终点
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["EndRange"] = object

----------------------------------------
-- 英雄出生点
local object = {
    classId       = "rangeobject",
    imageName     = "#Building01Destroyed.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 33,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 3,    -- 表示是一个装饰物
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["HeroBornRange"] = object

----------------------------------------
-- 怪物进入这个区域后会有特殊处理，比如减速等
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/SlowDown.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 4,    -- 表示这个圈里的怪物会被减速
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
    roleToAffect = 0,    -- 作用对象，0表示怪物，1表示英雄
    slowPercent       = 50,   -- 减速百分比，50表示减速50%
}
defines["SlowDownRange"] = object

----------------------------------------

-- 机关技能NPC，点击后会释放某个技能
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/Skill.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 5,    -- 表示机关技能
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
    skillId       = 0,    -- 表示调用的技能id
}
defines["SkillRange"] = object

----------------------------------------

-- 任务探索NPC，确认后所有英雄会消失去做任务
local object = {
    mainID        = "quest001",
    classId       = "rangeobject",
    imageName     = "daye/quest001.csb",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 6,    -- 表示任务探索NPC
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
    appearTime    = 0,    -- 任务出现时间
    spendTime     = 0,    -- 表示任务耗时
    awardCount    = 0,    -- 表示奖励道具Id
}
defines["TaskRange"] = object

----------------------------------------

-- 可拾取物NPC，怪物或者英雄可以背着这个东西，然后做一些操作
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/Package.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 7,    -- 表示可拾取物
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
    roleToAffect  = 0,    -- 作用对象，0表示怪物可以拾取，1表示英雄可以拾取
    moveSpeed     = 0,    -- 表示搬运移动速度
    callScripts   = 0,    -- 表示调用脚本  TO-DO 待确认是什么意思
}
defines["PackageRange"] = object

----------------------------------------

-- -- 飞鸟抛物NPC，一只鸟会飞进来，然后把怪物扔到这个点上
-- local object = {
--     classId       = "rangeobject",
--     imageName     = "rangeobject/ThrowEnemy.png",
--     radius        = 40,
--     radiusOffsetY = 0,
--     offsetY       = 0,
--     decorations   = {"ShipWavesUp", "ShipWaves"},
--     behaviors     = {},
--     rangeType     = 8,    -- 表示飞鸟抛物
--     campId        = MapConstants.NPC_CAMP,
--     mapId         = "A0001",
--     intervalTime  = 0,    -- 表示间隔时间  TO-DO 待确认是什么意思
--     monsterId     = 0,    -- 表示携带的怪物Id
--     monsterNum    = 0,    -- 表示携带的怪物数量
--     callScripts   = 0,    -- 表示调用脚本  TO-DO 待确认是什么意思
-- }
-- defines["ThrowEnemyRange"] = object

----------------------------------------

-- 传送门NPC，怪物进入这里以后会被传送到另一个门
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/Deliver.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 9,    -- 表示传送门NPC
    delayTime     = 2000, -- 多长时间后从下一个路径点出现
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["JumpRange"] = object

----------------------------------------
-- 遮挡区域
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/HideRange.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 10,    -- 表示传送门NPC
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["HideRange"] = object

----------------------------------------
-- 暗道入口
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/EnterRange.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 11,    -- 表示暗道入口
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["EnterRange"] = object

----------------------------------------
-- 暗道出口
local object = {
    classId       = "rangeobject",
    imageName     = "rangeobject/OutRange.png",
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 12,    -- 表示暗道出口
    campId        = MapConstants.NPC_CAMP,
    mapId         = "A0001",
}
defines["OutRange"] = object

----------------------------------------
-- -- 地图装饰物，无任何作用
-- local object = {
--     classId       = "rangeobject",
--     imageName     = "#Building01Destroyed.png",
--     radius        = 40,
--     radiusOffsetY = 0,
--     offsetY       = 33,
--     decorations   = {"ShipWavesUp", "ShipWaves"},
--     behaviors     = {},
--     rangeType     = 3,    -- 表示是一个装饰物
--     campId        = MapConstants.NPC_CAMP,
--     mapId         = "A0001",
-- }
-- defines["BuildingRange"] = object

----------------------------------------


-------------------------------- 打野元素 --------------------------------

-----1-3关打野元素-----
local object = {
    mainID        = "1",
    classId       = "rangeobject",
    imageName     = "daye/810103.csb",--岩石后面的兔子
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,      -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击  4,一直存在时间到可以点（蒲公英） 5，时间到了先播出生，然后可以点（地鼠）
    mapId         = {"A0001", "A0002", "A0003"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["1"] = object

local object = {
    mainID        = "2",
    classId       = "rangeobject",
    imageName     = "daye/810116.csb",--装饰小精灵A
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 1,           -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0001","A0002","A0003"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = false,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["2"] = object

local object = {
    mainID        = "3",
    classId       = "rangeobject",
    imageName     = "daye/810117.csb",--装饰小精灵B
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 1,           -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0001","A0002","A0003"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = false,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["3"] = object

local object = {
    mainID        = "4",
    classId       = "rangeobject",
    imageName     = "daye/810113.csb",--可采集的蘑菇
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 4,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0001","A0002","A0003"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = false,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["4"] = object

local object = {
    mainID        = "5",
    classId       = "rangeobject",
    imageName     = "daye/810104.csb",-------可采集的蒲公英
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = -30,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 4,           -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0001", "A0002", "A0003"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["5"] = object

-----------4-6关打野元素-----------------------------

local object = {
    mainID        = "6",
    classId       = "rangeobject",
    imageName     = "daye/810118.csb",-- 一直存在，时间到了以后可以点击的地鼠 810118
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,           -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0004", "A0005", "A0006"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5,7},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 10,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 0,           -- 表示调用的技能id
}
defines["6"] = object

-----------关卡7-9打野---------
local object = {
    mainID        = "7",
    classId       = "rangeobject",
    imageName     = "daye/810109.csb",--滚动的雪球
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0007", "A0008", "A0009"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5,7,9},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 30,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
}
defines["7"] = object 

-----------关卡10-12打野---------

local object = {
    mainID        = "10",
    classId       = "rangeobject",
    imageName     = "daye/810111.csb",  --火精灵
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0010", "A0011", "A0012"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5,7,9},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 20,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
}
defines["10"] = object 

-----------关卡13-15打野---------
local object = {
    mainID        = "13",
    classId       = "rangeobject",
    imageName     = "daye/810113.csb",--蘑菇机关
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0013","A0014","A0015"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {2,4,6,8,10,12,14,18},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 20,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 130601,           -- 表示调用的技能id
}
defines["13"] = object

local object = {
    mainID        = "14",
    classId       = "rangeobject",
    imageName     = "daye/810113.csb",--蘑菇机关
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 5,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0013","A0014","A0015"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {1,2,3},         -- 表示编辑模式1的时候会调用
    canClick      = true,       -- 表示是否可以点击，不可以点击就是纯装饰物
    checkWave     = {1,3,5,7,9,11,13,15,17},          -- 表示第几波开始的时候需要判定是否变成可以点击
    checkCD       = 20,          -- 表示这一波开始的时候过了多久判定一次是否变成可以点击
    random        = 50,          -- 表示每次判定的时候有50%的概率可以变为可点击状态
    addGold       = 100,         -- 表示点击以后的奖励多少金币
    skillId       = 130601,           -- 表示调用的技能id
}
defines["14"] = object
------------------------------------------
-- dayeType 打野元素的类型, 1表示一直存在不能点击；2表示偶尔出现，不能点击；
-- 3表示偶尔出现，可以点击; 4表示一直存在，时间到了变成可以点击
-- 5表示一直存在，时间到了以后先播放出生动作，然后变成可以点击

-- 一直存在，时间到了以后可以点击的地鼠 810118

----------------------------------------

-- add by Owen, 2016.6.5, 用打野元素来做第三模式需要拾取的东西

-- dayeType      = 6 表示用来做第九关模式3的拾取物品

-- 第九关模式3 
local object = {
    mainID        = "0903",
    classId       = "rangeobject",
    imageName     = "daye/fazhen.csb",    --激活法阵
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,            -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 6,             -- 6 表示用来做第九关模式3的拾取物品
    mapId         = {"A0009"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {3},           -- 表示编辑模式1的时候会调用
    canClick      = false,         -- 表示是否可以点击，不可以点击就是纯装饰物
    addBuff       = "220914",      -- 英雄走到这里以后, 附加一个Buff到英雄身上
}
defines["0903"] = object

----------------------------------------

-- dayeType      = 7 表示用来做第十关模式3的拾取物品

-- 第十关模式3 
local object = {
    mainID        = "1003",
    classId       = "rangeobject",
    imageName     = "daye/810103.csb",--蘑菇机关
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 7,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0010"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {3},         -- 表示编辑模式1的时候会调用
    addBuff       = "220915",           -- 英雄走到这里以后, 附加一个Buff到英雄身上
}
defines["1003"] = object

-- 第十关模式3, 用来做精华收集区域的那个范围
local object = {
    mainID        = "10032",
    classId       = "rangeobject",
    imageName     = "daye/jinghuajia.csb",--蘑菇机关
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 71,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0010"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {3},         -- 表示编辑模式1的时候会调用
}
defines["10032"] = object

----------------------------------------

-- dayeType      = 8 表示用来做第14关模式3的拾取物品

-- 第14关模式3 
local object = {
    mainID        = "1403",
    classId       = "rangeobject",
    imageName     = "daye/boxs.png",--待守护的宝箱
    radius        = 40,
    radiusOffsetY = 0,
    offsetY       = 0,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
    rangeType     = 13,    -- 表示是打野元素
    campId        = MapConstants.NPC_CAMP,
    dayeType      = 8,     -- 表示打野元素的类型，1表示一直存在不能点击；2表示偶尔出现，不能点击；3表示偶尔出现，可以点击
    mapId         = {"A0014"},     -- 表示编辑第一张地图的时候会调用
    modeId        = {3},         -- 表示编辑模式1的时候会调用
}
defines["1403"] = object

----------------------------------------

function RangeObjectsProperties.getAllIds()
    local keys = table.keys(defines)
    table.sort(keys)
    return keys
end

-- 返回static属性的物体
function RangeObjectsProperties:getStaticIds()
    local keys = {}
    for k,v in pairs(defines) do
        if string.find(v.classId, "static") then
            keys[#keys+1] = k
        end
    end
   
    return keys
end

-- 返回range属性的物体
function RangeObjectsProperties:getRangeIds()
    local keys = {}
    for k,v in pairs(defines) do
        if string.find(v.classId, "rangeobject") then
            keys[#keys+1] = k
        end
    end
    table.sort(keys)
    return keys
end

function RangeObjectsProperties.get(defineId)
    assert(defines[defineId], string.format("RangeObjectsProperties.get() - invalid defineId %s", tostring(defineId)))
    return clone(defines[defineId])
end

function RangeObjectsProperties.isExists(defineId)
    return defines[defineId] ~= nil
end

return RangeObjectsProperties
