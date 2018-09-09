
------------ MAP src/maps/MapA0001-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 180, 120}
objects["heroUpLevelLimit"] = {1924, 2771, 3137, 3368}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 50000
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 7

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100401",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 39,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 39,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100401",
    num = 3,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 39,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 39,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 39,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 39,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 39,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 50000
objects["round:2"]["award"] = 100
objects["round:2"]["total"] = 8

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 33,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 50000
objects["round:3"]["award"] = 100
objects["round:3"]["total"] = 7

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 57,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 57,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 57,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 57,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 57,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 57,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 57,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 50000
objects["round:4"]["award"] = 100
objects["round:4"]["total"] = 3

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100103",
    num = 4,
    pathId = 2,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 72,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100411",
    num = 4,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 72,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 4,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 72,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 50000
objects["round:5"]["award"] = 100
objects["round:5"]["total"] = 9

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 1,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 111,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 111,
}

monster.objects = objects

return monster