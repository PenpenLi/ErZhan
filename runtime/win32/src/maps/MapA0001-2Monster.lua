
------------ MAP src/maps/MapA0001-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 4
objects["addMonsterHp"] = {100, 180, 120}
objects["heroUpLevelLimit"] = {8000, 0, 0, 0}
objects["heroAddExp"] = 11.83

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 34400
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 5

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100401",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 45200
objects["round:2"]["award"] = 14
objects["round:2"]["total"] = 6

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 40400
objects["round:3"]["award"] = 14
objects["round:3"]["total"] = 4

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 69200
objects["round:4"]["award"] = 14
objects["round:4"]["total"] = 16

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 1,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 2,
}

monster.objects = objects

return monster