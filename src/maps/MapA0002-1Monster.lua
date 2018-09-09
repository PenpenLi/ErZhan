
------------ MAP src/maps/MapA0002-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 4
objects["addMonsterHp"] = {100, 180, 120}
objects["heroUpLevelLimit"] = {12800, 0, 0, 0}
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
    deadGold = 5,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100401",
    num = 1,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 60800
objects["round:2"]["award"] = 37
objects["round:2"]["total"] = 8

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 10800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 62000
objects["round:3"]["award"] = 37
objects["round:3"]["total"] = 12

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 5,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 66800
objects["round:4"]["award"] = 37
objects["round:4"]["total"] = 12

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 5,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 4,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 5,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 5,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 5,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 5,
}

monster.objects = objects

return monster