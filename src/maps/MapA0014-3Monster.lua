
------------ MAP src/maps/MapA0014-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 120, 4399}
objects["heroUpLevelLimit"] = {6334, 7170, 7698, 6.57}
objects["heroAddExp"] = 1

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 80000
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 11

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100411",
    num = 4,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 4,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 80000
objects["round:2"]["award"] = 300
objects["round:2"]["total"] = 11

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 8,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 7,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 9,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 7,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 9,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 7,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 9,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100407",
    num = 4,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 80000
objects["round:3"]["award"] = 300
objects["round:3"]["total"] = 11

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 80000
objects["round:4"]["award"] = 300
objects["round:4"]["total"] = 11

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 3,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 11,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 11,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100204",
    num = 4,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 80000
objects["round:5"]["award"] = 300
objects["round:5"]["total"] = 11

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 11,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 4,
    delayTime = 43200,
    intervalTime = 0,
    deadGold = 11,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 6,
    delayTime = 43200,
    intervalTime = 0,
    deadGold = 11,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 4,
    delayTime = 50400,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 6,
    delayTime = 50400,
    intervalTime = 6000,
    deadGold = 11,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100105",
    num = 4,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100105",
    num = 4,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 12000,
    deadGold = 11,
}

monster.objects = objects

return monster