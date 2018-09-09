
------------ MAP src/maps/MapA0005-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 6
objects["addMonsterHp"] = {105, 120, 120}
objects["heroUpLevelLimit"] = {15738, 22662, 0, 0}
objects["heroAddExp"] = 9.86

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 71600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 11

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 34800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 14400,
    deadGold = 3,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 74000
objects["round:2"]["award"] = 113
objects["round:2"]["total"] = 20

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100101",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 43200,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:15"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:16"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:18"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:2"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:2"]["sub_round:20"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 90800
objects["round:3"]["award"] = 113
objects["round:3"]["total"] = 22

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 36000,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 48000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 5,
    delayTime = 56400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 56400,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:18"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:19"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:20"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 4,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:21"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 46800,
    intervalTime = 12000,
    deadGold = 3,
}
objects["round:3"]["sub_round:22"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 36000,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 92000
objects["round:4"]["award"] = 113
objects["round:4"]["total"] = 21

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 25200,
    deadGold = 3,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 52800,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 49200,
    intervalTime = 19200,
    deadGold = 3,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 4,
    delayTime = 51600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 55200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 51600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 61200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 5,
    delayTime = 63600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 6,
    delayTime = 62400,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:20"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:21"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 93200
objects["round:5"]["award"] = 113
objects["round:5"]["total"] = 25

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 38400,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 42000,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 42000,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 4,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 4,
    delayTime = 52800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 6,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 4,
    delayTime = 56400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:19"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 5,
    delayTime = 57600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:5"]["sub_round:20"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 50400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:21"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:22"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:23"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:5"]["sub_round:24"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 60000,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:5"]["sub_round:25"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 6,
    delayTime = 64800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 110000
objects["round:6"]["award"] = 113
objects["round:6"]["total"] = 27

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 0,
    intervalTime = 500,
    deadGold = 3,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 51600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 51600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 63600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 63600,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 78000,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 2,
    delayTime = 73200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 3,
    delayTime = 78000,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100301",
    num = 7,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 9600,
    deadGold = 3,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 9600,
    deadGold = 3,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 9600,
    deadGold = 3,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 6,
    delayTime = 51600,
    intervalTime = 500,
    deadGold = 3,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 52800,
    intervalTime = 20400,
    deadGold = 3,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 46800,
    intervalTime = 9600,
    deadGold = 3,
}
objects["round:6"]["sub_round:23"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 6,
    delayTime = 78000,
    intervalTime = 500,
    deadGold = 3,
}
objects["round:6"]["sub_round:24"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 500,
    deadGold = 3,
}
objects["round:6"]["sub_round:25"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 43200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:26"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 6,
    delayTime = 67200,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:27"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 60000,
    intervalTime = 500,
    deadGold = 3,
}

monster.objects = objects

return monster