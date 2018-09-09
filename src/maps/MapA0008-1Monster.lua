
------------ MAP src/maps/MapA0008-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 8
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {8179, 11777, 13331, 14313}
objects["heroAddExp"] = 8.45

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 54800
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 8

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 60800
objects["round:2"]["award"] = 118
objects["round:2"]["total"] = 14

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 6,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 8,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 8,
    delayTime = 10800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 20400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 8,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 63200
objects["round:3"]["award"] = 118
objects["round:3"]["total"] = 23

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 4,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100302",
    num = 0,
    pathId = 5,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"]["sub_round:18"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 8,
    delayTime = 3600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:19"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 8,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"]["sub_round:20"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:21"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 7,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:3"]["sub_round:22"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 8,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"]["sub_round:23"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 9,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 62000
objects["round:4"]["award"] = 118
objects["round:4"]["total"] = 16

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 8,
    delayTime = 0,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 7,
    delayTime = 30000,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:16"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 8,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 58400
objects["round:5"]["award"] = 118
objects["round:5"]["total"] = 14

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 7,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 9,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 9,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 64400
objects["round:6"]["award"] = 118
objects["round:6"]["total"] = 26

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 4800,
    deadGold = 10,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 7200,
    deadGold = 10,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 0,
    intervalTime = 4800,
    deadGold = 10,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 7200,
    deadGold = 10,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 7,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 9,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 8,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 7,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 9600,
    intervalTime = 7200,
    deadGold = 10,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:19"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:20"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:21"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 9,
    delayTime = 36000,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:6"]["sub_round:22"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 7,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:23"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 8,
    delayTime = 8400,
    intervalTime = 7200,
    deadGold = 10,
}
objects["round:6"]["sub_round:24"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 9,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:25"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:26"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 9,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 76400
objects["round:7"]["award"] = 118
objects["round:7"]["total"] = 31

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 3,
    delayTime = 26400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 1,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 54000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 50400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 8,
    delayTime = 16800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 8,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:15"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:16"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:17"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:18"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:19"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:20"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:21"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:22"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 9,
    delayTime = 45800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:23"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:24"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 7,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:25"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:26"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 9,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:27"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 7,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:28"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:29"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 9,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:30"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 7,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:7"]["sub_round:31"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 75200
objects["round:8"]["award"] = 118
objects["round:8"]["total"] = 25

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 49200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 4800,
    deadGold = 10,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 5,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 4,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:12"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:13"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 4,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:14"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:15"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 6,
    delayTime = 31200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:16"] = {
    resourceId  = "100202",
    num = 4,
    pathId = 8,
    delayTime = 12000,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:8"]["sub_round:17"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:18"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:19"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 9,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:20"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 8,
    delayTime = 15600,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:8"]["sub_round:21"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 8,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:22"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:23"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 9,
    delayTime = 45600,
    intervalTime = 4800,
    deadGold = 10,
}
objects["round:8"]["sub_round:24"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:8"]["sub_round:25"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 800,
    deadGold = 10,
}

monster.objects = objects

return monster