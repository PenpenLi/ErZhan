
------------ MAP src/maps/MapA0002-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 4
objects["addMonsterHp"] = {105, 200, 120}
objects["heroUpLevelLimit"] = {16000, 0, 0, 0}
objects["heroAddExp"] = 11.83

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 47600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 6

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 46400
objects["round:2"]["award"] = 37
objects["round:2"]["total"] = 8

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 72800
objects["round:3"]["award"] = 37
objects["round:3"]["total"] = 15

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 10800,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 3,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 43200,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 3,
    delayTime = 48000,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100106",
    num = 1,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 66800
objects["round:4"]["award"] = 37
objects["round:4"]["total"] = 16

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 1200,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 4800,
    deadGold = 3,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 5,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 3,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 3,
}

monster.objects = objects

return monster