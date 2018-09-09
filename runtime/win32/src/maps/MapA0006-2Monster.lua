
------------ MAP src/maps/MapA0006-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 7
objects["addMonsterHp"] = {105, 120, 120}
objects["heroUpLevelLimit"] = {12187, 17549, 19864, 0}
objects["heroAddExp"] = 9.86

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 69200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 10

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 6000,
    deadGold = 4,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 72800
objects["round:2"]["award"] = 103
objects["round:2"]["total"] = 14

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 42000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 40800,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 86000
objects["round:3"]["award"] = 103
objects["round:3"]["total"] = 14

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 8400,
    deadGold = 4,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 5,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 4800,
    deadGold = 4,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100301",
    num = 5,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 4800,
    deadGold = 4,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 1,
    delayTime = 55200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 58800,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 104000
objects["round:4"]["award"] = 103
objects["round:4"]["total"] = 19

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 31200,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 2,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 50400,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 68400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 52800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 1,
    delayTime = 56400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 1,
    delayTime = 62400,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100101",
    num = 6,
    pathId = 3,
    delayTime = 75600,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 3,
    delayTime = 62400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 500,
    deadGold = 4,
}
objects["round:4"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 46800,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 78800
objects["round:5"]["award"] = 103
objects["round:5"]["total"] = 15

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 4,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 50400,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 8000,
    deadGold = 4,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 48000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 44400,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 4800,
    deadGold = 4,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 52800,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 108800
objects["round:6"]["award"] = 103
objects["round:6"]["total"] = 26

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 49200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 49200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 60000,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 60000,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100101",
    num = 2,
    pathId = 2,
    delayTime = 63600,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 68400,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 80400,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 75600,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 76800,
    intervalTime = 2400,
    deadGold = 4,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100301",
    num = 1,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 800,
    deadGold = 4,
}
objects["round:6"]["sub_round:23"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:6"]["sub_round:24"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 3,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:6"]["sub_round:25"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 1,
    delayTime = 72000,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:6"]["sub_round:26"] = {
    resourceId  = "100206",
    num = 1,
    pathId = 3,
    delayTime = 69600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 107600
objects["round:7"]["award"] = 103
objects["round:7"]["total"] = 21

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 43200,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 8400,
    deadGold = 4,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 66000,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 1,
    delayTime = 63600,
    intervalTime = 8400,
    deadGold = 4,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 68400,
    intervalTime = 3600,
    deadGold = 4,
}
objects["round:7"]["sub_round:15"] = {
    resourceId  = "100206",
    num = 5,
    pathId = 2,
    delayTime = 62400,
    intervalTime = 600,
    deadGold = 4,
}
objects["round:7"]["sub_round:16"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 2,
    delayTime = 72000,
    intervalTime = 600,
    deadGold = 4,
}
objects["round:7"]["sub_round:17"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 81600,
    intervalTime = 1200,
    deadGold = 4,
}
objects["round:7"]["sub_round:18"] = {
    resourceId  = "100501",
    num = 1,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:7"]["sub_round:19"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:7"]["sub_round:20"] = {
    resourceId  = "100403",
    num = 1,
    pathId = 3,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 4,
}
objects["round:7"]["sub_round:21"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 4,
}

monster.objects = objects

return monster