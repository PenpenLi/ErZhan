
------------ MAP src/maps/MapA0002-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 3
objects["addMonsterHp"] = {100, 200, 120}
objects["heroUpLevelLimit"] = {1375, 1979, 2241, 2405}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 50000
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 6

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 1200,
    deadGold = 150,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 50000
objects["round:2"]["award"] = 100
objects["round:2"]["total"] = 9

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 60,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 120,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 120,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 1200,
    deadGold = 60,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 120,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 60,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 120,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 60,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100501",
    num = 1,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 60,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 50000
objects["round:3"]["award"] = 100
objects["round:3"]["total"] = 10

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 100,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 50,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 100,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 50,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 50,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 50,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 50,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 50,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 50,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 50,
}

monster.objects = objects

return monster