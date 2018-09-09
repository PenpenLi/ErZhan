
------------ MAP src/maps/MapA0012-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {15120, 21773, 24646, 26460}
objects["heroAddExp"] = 7.39

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 62000
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 12

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 6,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 8,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 36000,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 12,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 11,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 12,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 62000
objects["round:2"]["award"] = 142
objects["round:2"]["total"] = 10

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 12,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 10,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 11,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 62000
objects["round:3"]["award"] = 142
objects["round:3"]["total"] = 12

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 6000,
    deadGold = 5,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 8,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 8,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 8,
    delayTime = 10800,
    intervalTime = 6000,
    deadGold = 5,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 8,
    pathId = 7,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 8,
    pathId = 9,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 11,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 10,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 62000
objects["round:4"]["award"] = 142
objects["round:4"]["total"] = 16

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 4,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 8,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 7,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 4,
    pathId = 11,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 8,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 10,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 12,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 9,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 8,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 62000
objects["round:5"]["award"] = 142
objects["round:5"]["total"] = 14

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 12000,
    deadGold = 5,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 6,
    delayTime = 8400,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 12000,
    deadGold = 5,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 4,
    delayTime = 50400,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 12000,
    deadGold = 5,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 9,
    delayTime = 25200,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 12,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 11,
    delayTime = 38400,
    intervalTime = 12000,
    deadGold = 5,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 11,
    delayTime = 50400,
    intervalTime = 800,
    deadGold = 5,
}

monster.objects = objects

return monster