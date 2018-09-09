
------------ MAP src/maps/MapA0004-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 6
objects["addMonsterHp"] = {100, 125, 120}
objects["heroUpLevelLimit"] = {9836, 14164, 0, 0}
objects["heroAddExp"] = 9.86

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 54800
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 6

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 25200,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 53600
objects["round:2"]["award"] = 76
objects["round:2"]["total"] = 7

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 76400
objects["round:3"]["award"] = 76
objects["round:3"]["total"] = 11

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 48000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 76400
objects["round:4"]["award"] = 76
objects["round:4"]["total"] = 14

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 43200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 44400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 5,
    delayTime = 48000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 77600
objects["round:5"]["award"] = 76
objects["round:5"]["total"] = 11

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 26400,
    intervalTime = 6000,
    deadGold = 5,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 50400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 52800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 93200
objects["round:6"]["award"] = 76
objects["round:6"]["total"] = 22

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 44400,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 50400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 50400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 57600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 57600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 60000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 67200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 6,
    delayTime = 67200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 69600,
    intervalTime = 0,
    deadGold = 5,
}

monster.objects = objects

return monster