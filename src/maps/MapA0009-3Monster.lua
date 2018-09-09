
------------ MAP src/maps/MapA0009-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 3
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {4124, 5938, 6722, 7216}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 119600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 14

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 49200,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 5,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 4,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 6,
    delayTime = 43200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 4,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:1"]["sub_round:12"] = {
    resourceId  = "100602",
    num = 2,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 18000,
    deadGold = 8,
}
objects["round:1"]["sub_round:13"] = {
    resourceId  = "100602",
    num = 2,
    pathId = 5,
    delayTime = 58800,
    intervalTime = 18000,
    deadGold = 8,
}
objects["round:1"]["sub_round:14"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 5,
    delayTime = 84000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 119600
objects["round:2"]["award"] = 106
objects["round:2"]["total"] = 14

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 8,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 7,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 9,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 7,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 9,
    delayTime = 43200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 7,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100601",
    num = 2,
    pathId = 8,
    delayTime = 15600,
    intervalTime = 18000,
    deadGold = 8,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100601",
    num = 2,
    pathId = 8,
    delayTime = 58800,
    intervalTime = 18000,
    deadGold = 8,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 4,
    pathId = 8,
    delayTime = 84000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 10,
    delayTime = 6000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 12,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 10,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 12,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100411",
    num = 3,
    pathId = 10,
    delayTime = 49200,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 119600
objects["round:3"]["award"] = 106
objects["round:3"]["total"] = 16

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 1,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 3,
    delayTime = 63600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 2,
    delayTime = 72000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 12,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 11,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 12,
    delayTime = 44400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 11,
    delayTime = 46800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 10,
    delayTime = 76800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 12,
    delayTime = 76800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 11,
    delayTime = 82800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100603",
    num = 2,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 18000,
    deadGold = 8,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100603",
    num = 2,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 18000,
    deadGold = 8,
}

monster.objects = objects

return monster