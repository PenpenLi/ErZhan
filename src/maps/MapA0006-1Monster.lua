
------------ MAP src/maps/MapA0006-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 7
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {9828, 14152, 16020, 0}
objects["heroAddExp"] = 9.86

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 69200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 5

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 13200,
    deadGold = 10,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100301",
    num = 4,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 2,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 66800
objects["round:2"]["award"] = 103
objects["round:2"]["total"] = 9

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 1200,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 3,
    delayTime = 39600,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 66800
objects["round:3"]["award"] = 103
objects["round:3"]["total"] = 10

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 15600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 84800
objects["round:4"]["award"] = 103
objects["round:4"]["total"] = 14

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 1,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100301",
    num = 3,
    pathId = 2,
    delayTime = 46800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 3,
    delayTime = 57600,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100101",
    num = 3,
    pathId = 1,
    delayTime = 56400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 78800
objects["round:5"]["award"] = 103
objects["round:5"]["total"] = 9

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 1,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 7,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 7,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 83600
objects["round:6"]["award"] = 103
objects["round:6"]["total"] = 14

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 43200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 49200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 2,
    delayTime = 44400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100101",
    num = 4,
    pathId = 2,
    delayTime = 54000,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 107600
objects["round:7"]["award"] = 103
objects["round:7"]["total"] = 18

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 1,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 2,
    delayTime = 43200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 18000,
    deadGold = 10,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 3,
    delayTime = 70800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 1,
    delayTime = 63600,
    intervalTime = 18000,
    deadGold = 10,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 73200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:15"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 2,
    delayTime = 58800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:16"] = {
    resourceId  = "100101",
    num = 5,
    pathId = 2,
    delayTime = 68400,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:7"]["sub_round:17"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 2,
    delayTime = 78000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:18"] = {
    resourceId  = "100501",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}

monster.objects = objects

return monster