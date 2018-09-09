
------------ MAP src/maps/MapA0012-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 11
objects["addMonsterHp"] = {105, 120, 120}
objects["heroUpLevelLimit"] = {12371, 17814, 20165, 21649}
objects["heroAddExp"] = 7.39

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 62000
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 6

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 6,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 57200
objects["round:2"]["award"] = 240
objects["round:2"]["total"] = 8

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 12,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 10,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 63200
objects["round:3"]["award"] = 240
objects["round:3"]["total"] = 12

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 4,
    delayTime = 14400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 8,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 16800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 9,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 11,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 10,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 66800
objects["round:4"]["award"] = 240
objects["round:4"]["total"] = 14

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 4,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 1,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 1,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 8,
    delayTime = 10800,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100413",
    num = 1,
    pathId = 12,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100413",
    num = 1,
    pathId = 7,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 12,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 11,
    delayTime = 44400,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 10,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 63200
objects["round:5"]["award"] = 240
objects["round:5"]["total"] = 16

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 5,
    delayTime = 26400,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 4,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 4,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 7,
    delayTime = 1200,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 11,
    delayTime = 26400,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 9,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 12,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100303",
    num = 1,
    pathId = 10,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 70400
objects["round:6"]["award"] = 240
objects["round:6"]["total"] = 18

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 44400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 13200,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 0,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 5,
    delayTime = 9600,
    intervalTime = 13200,
    deadGold = 10,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 33600,
    intervalTime = 13200,
    deadGold = 10,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100303",
    num = 4,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 7,
    delayTime = 44400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 9,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 12,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 10,
    delayTime = 0,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 11,
    delayTime = 9600,
    intervalTime = 13200,
    deadGold = 10,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 11,
    delayTime = 38400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 10,
    delayTime = 33600,
    intervalTime = 13200,
    deadGold = 10,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 12,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 70400
objects["round:7"]["award"] = 240
objects["round:7"]["total"] = 15

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 2,
    delayTime = 42000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 1000,
    deadGold = 10,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 8,
    delayTime = 0,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 10,
    delayTime = 15600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 9,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 11,
    delayTime = 31200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 12,
    delayTime = 21600,
    intervalTime = 1000,
    deadGold = 10,
}
objects["round:7"]["sub_round:15"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 9,
    delayTime = 34800,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:7"]["sub_round:16"] = {
    resourceId  = "100413",
    num = 4,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 63200
objects["round:8"]["award"] = 240
objects["round:8"]["total"] = 20

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 5,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 4,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 6,
    delayTime = 8400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 7,
    delayTime = 15600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:13"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 9,
    delayTime = 20400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:14"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 10,
    delayTime = 8400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:15"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 11,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:16"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 12,
    delayTime = 8400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:17"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:18"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 11,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:19"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 11,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:20"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 10,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"] = {}
objects["round:9"]["delayTime"] = 82400
objects["round:9"]["award"] = 240
objects["round:9"]["total"] = 28

objects["round:9"]["sub_round:1"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:2"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:3"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:4"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:5"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:6"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 3,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:7"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:8"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:9"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 4,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:10"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 6,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:11"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 7,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:12"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 8,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:13"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 9,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:14"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:15"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 7,
    delayTime = 40800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:16"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 8,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:17"] = {
    resourceId  = "100413",
    num = 2,
    pathId = 9,
    delayTime = 40800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:18"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 12,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:19"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 10,
    delayTime = 50400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:20"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 50400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:21"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:22"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:23"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:24"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 11,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:25"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 10,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:26"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 11,
    delayTime = 52800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:9"]["sub_round:27"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:9"]["sub_round:28"] = {
    resourceId  = "100204",
    num = 3,
    pathId = 5,
    delayTime = 48000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:10"] = {}
objects["round:10"]["delayTime"] = 74000
objects["round:10"]["award"] = 240
objects["round:10"]["total"] = 28

objects["round:10"]["sub_round:1"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:4"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:5"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:6"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:7"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 8,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:8"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 8,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 8,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:10"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 11,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:11"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 11,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 11,
    delayTime = 9600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:13"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:15"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 8,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:16"] = {
    resourceId  = "100103",
    num = 1,
    pathId = 11,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:17"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:18"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 6,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:19"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 7,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:20"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 12,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:21"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 2,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:22"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 6,
    delayTime = 48000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:23"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 7,
    delayTime = 48000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:24"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 11,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:25"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 2,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:26"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:27"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 8,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:28"] = {
    resourceId  = "100412",
    num = 1,
    pathId = 11,
    delayTime = 49200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"] = {}
objects["round:11"]["delayTime"] = 122000
objects["round:11"]["award"] = 240
objects["round:11"]["total"] = 29

objects["round:11"]["sub_round:1"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:2"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 8,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:3"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:4"] = {
    resourceId  = "100204",
    num = 1,
    pathId = 11,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:5"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:11"]["sub_round:6"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 6,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:7"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 7,
    delayTime = 15600,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:11"]["sub_round:8"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 12,
    delayTime = 13200,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:11"]["sub_round:9"] = {
    resourceId  = "100504",
    num = 1,
    pathId = 11,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:10"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:11"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 1,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:12"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 3,
    delayTime = 58800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:13"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:11"]["sub_round:14"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 8,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:15"] = {
    resourceId  = "100413",
    num = 3,
    pathId = 10,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:16"] = {
    resourceId  = "100303",
    num = 3,
    pathId = 12,
    delayTime = 58800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:17"] = {
    resourceId  = "100204",
    num = 2,
    pathId = 11,
    delayTime = 45600,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:11"]["sub_round:18"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:19"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 5,
    delayTime = 70800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:20"] = {
    resourceId  = "100412",
    num = 2,
    pathId = 8,
    delayTime = 70800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:21"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 9,
    delayTime = 49200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:22"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 1,
    delayTime = 81600,
    intervalTime = 18000,
    deadGold = 10,
}
objects["round:11"]["sub_round:23"] = {
    resourceId  = "100103",
    num = 2,
    pathId = 12,
    delayTime = 81600,
    intervalTime = 18000,
    deadGold = 10,
}
objects["round:11"]["sub_round:24"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 5,
    delayTime = 85200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:25"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 6,
    delayTime = 87600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:26"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 7,
    delayTime = 85200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:27"] = {
    resourceId  = "100303",
    num = 2,
    pathId = 8,
    delayTime = 87600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:28"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 2,
    delayTime = 90000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:29"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 11,
    delayTime = 90000,
    intervalTime = 1200,
    deadGold = 10,
}

monster.objects = objects

return monster