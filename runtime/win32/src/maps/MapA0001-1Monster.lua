
------------ MAP src/maps/MapA0001-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 4
objects["addMonsterHp"] = {100, 300, 120}
objects["heroUpLevelLimit"] = {4800, 0, 0, 0}
objects["heroAddExp"] = 11.83

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 34400
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 2

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100401",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 3600,
    deadGold = 20,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 45200
objects["round:2"]["award"] = 30
objects["round:2"]["total"] = 3

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100401",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100401",
    num = 1,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 40400
objects["round:3"]["award"] = 30
objects["round:3"]["total"] = 3

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 0,
    intervalTime = 4800,
    deadGold = 5,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 56000
objects["round:4"]["award"] = 30
objects["round:4"]["total"] = 6

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100401",
    num = 3,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 3600,
    deadGold = 5,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 5,
}

monster.objects = objects

return monster