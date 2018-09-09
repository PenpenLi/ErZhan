
------------ MAP src/maps/MapA0011-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {0, 0, 0, 0}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 54800
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 3

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 24000,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 71600
objects["round:2"]["award"] = 100
objects["round:2"]["total"] = 6

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 3,
    delayTime = 33600,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 4,
    delayTime = 40800,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 6,
    delayTime = 37200,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 62000
objects["round:3"]["award"] = 100
objects["round:3"]["total"] = 6

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 30,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 3,
    delayTime = 15600,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 30,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100414",
    num = 4,
    pathId = 4,
    delayTime = 14400,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 30,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 4,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 30,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 70400
objects["round:4"]["award"] = 100
objects["round:4"]["total"] = 6

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 30,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 30,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 8,
    delayTime = 2400,
    intervalTime = 6000,
    deadGold = 30,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100410",
    num = 2,
    pathId = 8,
    delayTime = 26400,
    intervalTime = 12000,
    deadGold = 30,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 71600
objects["round:5"]["award"] = 100
objects["round:5"]["total"] = 5

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 7200,
    deadGold = 30,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 7200,
    deadGold = 30,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 4,
    delayTime = 8400,
    intervalTime = 7200,
    deadGold = 30,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 6,
    delayTime = 20400,
    intervalTime = 7200,
    deadGold = 30,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100204",
    num = 4,
    pathId = 8,
    delayTime = 28800,
    intervalTime = 6000,
    deadGold = 30,
}

monster.objects = objects

return monster