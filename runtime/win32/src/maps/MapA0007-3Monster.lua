
------------ MAP src/maps/MapA0007-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 3
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {2749, 3959, 4481, 4811}
objects["heroAddExp"] = 8.45

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 75200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 11

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 20,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 6000,
    deadGold = 20,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 6000,
    deadGold = 20,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 6000,
    deadGold = 20,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 5,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 5,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 69200
objects["round:2"]["award"] = 125
objects["round:2"]["total"] = 14

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 3,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 20,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 1,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 4,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100107",
    num = 2,
    pathId = 6,
    delayTime = 42000,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 74000
objects["round:3"]["award"] = 125
objects["round:3"]["total"] = 26

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 20,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 2,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 4,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 1,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 3,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 20,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 6,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:18"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 4,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:19"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:20"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 5,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:3"]["sub_round:21"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:22"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:23"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 20,
}
objects["round:3"]["sub_round:24"] = {
    resourceId  = "100202",
    num = 4,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 20,
}
objects["round:3"]["sub_round:25"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 20,
}
objects["round:3"]["sub_round:26"] = {
    resourceId  = "100107",
    num = 1,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 20,
}

monster.objects = objects

return monster