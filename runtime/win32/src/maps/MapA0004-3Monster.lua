
------------ MAP src/maps/MapA0004-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 2
objects["addMonsterHp"] = {100, 110, 120}
objects["heroUpLevelLimit"] = {4600, 6623, 7497, 0}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 119600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 18

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 178,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 178,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 48000,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 52800,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 8,
    pathId = 3,
    delayTime = 61200,
    intervalTime = 3600,
    deadGold = 178,
}
objects["round:1"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 9,
    pathId = 5,
    delayTime = 58800,
    intervalTime = 3600,
    deadGold = 178,
}
objects["round:1"]["sub_round:13"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 6,
    delayTime = 57600,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:14"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 1,
    delayTime = 64800,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:15"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 6,
    delayTime = 72000,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:16"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 1,
    delayTime = 79200,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:17"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 6,
    delayTime = 86400,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:1"]["sub_round:18"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 1,
    delayTime = 90000,
    intervalTime = 800,
    deadGold = 178,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 119600
objects["round:2"]["award"] = 0
objects["round:2"]["total"] = 22

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100502",
    num = 1,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 4,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 1,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100502",
    num = 1,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 3,
    delayTime = 52800,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 4,
    delayTime = 52800,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:15"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 1,
    delayTime = 61200,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:16"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 6,
    delayTime = 61200,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:17"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 66000,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:18"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 72000,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:19"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 78000,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:20"] = {
    resourceId  = "100502",
    num = 1,
    pathId = 5,
    delayTime = 82800,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:21"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 88800,
    intervalTime = 0,
    deadGold = 80,
}
objects["round:2"]["sub_round:22"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 94800,
    intervalTime = 0,
    deadGold = 80,
}

monster.objects = objects

return monster