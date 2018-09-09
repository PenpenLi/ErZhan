
------------ MAP src/maps/MapA0003-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 4
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {3849, 5542, 6274, 6735}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 84800
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 22

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 6,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:1"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:15"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:1"]["sub_round:16"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:1"]["sub_round:17"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:18"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 56400,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:19"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 61200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:20"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:21"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 60000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:1"]["sub_round:22"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 61200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 65600
objects["round:2"]["award"] = 200
objects["round:2"]["total"] = 10

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 4,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100203",
    num = 2,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 6000,
    deadGold = 0,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100203",
    num = 2,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 6000,
    deadGold = 0,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 84800
objects["round:3"]["award"] = 200
objects["round:3"]["total"] = 22

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 6,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 800,
    deadGold = 0,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100411",
    num = 2,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:18"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 56400,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:19"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 61200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:20"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:21"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 60000,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:3"]["sub_round:22"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 61200,
    intervalTime = 1200,
    deadGold = 0,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 65600
objects["round:4"]["award"] = 200
objects["round:4"]["total"] = 10

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100103",
    num = 4,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100103",
    num = 3,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 8400,
    deadGold = 0,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 3600,
    deadGold = 0,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 6000,
    deadGold = 0,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 6000,
    deadGold = 0,
}

monster.objects = objects

return monster