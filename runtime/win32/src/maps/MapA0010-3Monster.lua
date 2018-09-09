
------------ MAP src/maps/MapA0010-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {5223, 7522, 8514, 9141}
objects["heroAddExp"] = 7.39

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 57200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 9

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 8,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 12,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 16800,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 11,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 66800
objects["round:2"]["award"] = 137
objects["round:2"]["total"] = 14

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 32400,
    intervalTime = 6000,
    deadGold = 5,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 12,
    delayTime = 10800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 10,
    delayTime = 36000,
    intervalTime = 6000,
    deadGold = 5,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 8,
    delayTime = 15600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 9,
    delayTime = 20400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 66800
objects["round:3"]["award"] = 137
objects["round:3"]["total"] = 12

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 6,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 4,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 7,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 10,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 8,
    delayTime = 27600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100413",
    num = 5,
    pathId = 11,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 6,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 68000
objects["round:4"]["award"] = 137
objects["round:4"]["total"] = 20

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 8,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 8,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 11,
    delayTime = 12000,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 12,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 12,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 10,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 8,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:19"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 5,
    delayTime = 39600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:4"]["sub_round:20"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 11,
    delayTime = 39600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 68000
objects["round:5"]["award"] = 137
objects["round:5"]["total"] = 22

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 9,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 5,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 9600,
    deadGold = 5,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 8400,
    deadGold = 5,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 8,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 10,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 12,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 11,
    delayTime = 20400,
    intervalTime = 9600,
    deadGold = 5,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 11,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 6,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:19"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 10,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:20"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 12,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:21"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 2,
    delayTime = 42000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:22"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 1200,
    deadGold = 5,
}

monster.objects = objects

return monster