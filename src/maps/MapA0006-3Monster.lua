
------------ MAP src/maps/MapA0006-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 3
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {2474, 3563, 4033, 4330}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 95600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 11

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100411",
    num = 4,
    pathId = 2,
    delayTime = 31200,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 46800,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 2,
    delayTime = 62400,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 1,
    delayTime = 61200,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 3,
    delayTime = 61200,
    intervalTime = 2400,
    deadGold = 0,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 72800
objects["round:2"]["award"] = 103
objects["round:2"]["total"] = 13

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 3,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 51600,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100403",
    num = 2,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100409",
    num = 2,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100409",
    num = 1,
    pathId = 1,
    delayTime = 56400,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100403",
    num = 3,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100409",
    num = 3,
    pathId = 5,
    delayTime = 45600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 84800
objects["round:3"]["award"] = 103
objects["round:3"]["total"] = 13

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 2,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 4,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 4,
    delayTime = 55200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 58800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 51600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 5,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100411",
    num = 1,
    pathId = 2,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 0,
}

monster.objects = objects

return monster