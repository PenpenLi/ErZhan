
------------ MAP src/maps/MapA0005-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 6
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {13770, 19830, 0, 0}
objects["heroAddExp"] = 9.86

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 64400
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 5

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 66800
objects["round:2"]["award"] = 113
objects["round:2"]["total"] = 12

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 12000,
    deadGold = 8,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 0,
    intervalTime = 12000,
    deadGold = 8,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 12000,
    deadGold = 8,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 4,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 6,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 74000
objects["round:3"]["award"] = 113
objects["round:3"]["total"] = 17

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 14400,
    deadGold = 8,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 14400,
    deadGold = 8,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 45600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 45600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 66800
objects["round:4"]["award"] = 113
objects["round:4"]["total"] = 20

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 8400,
    deadGold = 8,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 5,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"]["sub_round:20"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 4,
    delayTime = 31200,
    intervalTime = 8400,
    deadGold = 8,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 68000
objects["round:5"]["award"] = 113
objects["round:5"]["total"] = 18

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 9600,
    deadGold = 8,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 9600,
    deadGold = 8,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 9600,
    deadGold = 8,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 40800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 6,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 80000
objects["round:6"]["award"] = 113
objects["round:6"]["total"] = 24

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 6,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 51600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 44400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 52800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 58800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:23"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 52800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:24"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 4,
    delayTime = 42000,
    intervalTime = 800,
    deadGold = 8,
}

monster.objects = objects

return monster