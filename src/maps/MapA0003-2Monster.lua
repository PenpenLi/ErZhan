
------------ MAP src/maps/MapA0003-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 6
objects["addMonsterHp"] = {105, 120, 120}
objects["heroUpLevelLimit"] = {11148, 16052, 0, 0}
objects["heroAddExp"] = 11.83

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 57200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 8

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 57200
objects["round:2"]["award"] = 42
objects["round:2"]["total"] = 11

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100401",
    num = 2,
    pathId = 6,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 6,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 4800,
    deadGold = 2,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 51200
objects["round:3"]["award"] = 42
objects["round:3"]["total"] = 11

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 68000
objects["round:4"]["award"] = 42
objects["round:4"]["total"] = 18

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 4,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 2,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 2,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 1,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:17"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:4"]["sub_round:18"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 1200,
    deadGold = 2,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 68000
objects["round:5"]["award"] = 42
objects["round:5"]["total"] = 16

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 1,
    delayTime = 3000,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 2,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 2,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100502",
    num = 1,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 2,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 93200
objects["round:6"]["award"] = 42
objects["round:6"]["total"] = 23

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 24000,
    intervalTime = 600,
    deadGold = 3,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 6,
    delayTime = 50400,
    intervalTime = 600,
    deadGold = 3,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 3,
    pathId = 2,
    delayTime = 55200,
    intervalTime = 6000,
    deadGold = 3,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 5,
    pathId = 1,
    delayTime = 46800,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 6,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 3,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 3,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100402",
    num = 5,
    pathId = 6,
    delayTime = 55200,
    intervalTime = 2400,
    deadGold = 3,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 2,
    delayTime = 48000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 3,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 5,
    delayTime = 52800,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 4,
    delayTime = 60000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 5,
    delayTime = 66000,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100402",
    num = 1,
    pathId = 4,
    delayTime = 68400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 3,
}
objects["round:6"]["sub_round:23"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 3,
}

monster.objects = objects

return monster