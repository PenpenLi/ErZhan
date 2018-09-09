
------------ MAP src/maps/MapA0007-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 8
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {12948, 18646, 21106, 0}
objects["heroAddExp"] = 8.45

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 57200
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 8

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 4800,
    deadGold = 8,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 31200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 65600
objects["round:2"]["award"] = 125
objects["round:2"]["total"] = 10

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 1,
    pathId = 4,
    delayTime = 37200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 71600
objects["round:3"]["award"] = 125
objects["round:3"]["total"] = 13

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 3,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 4,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 68000
objects["round:4"]["award"] = 125
objects["round:4"]["total"] = 14

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 1,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100206",
    num = 5,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 36000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 65600
objects["round:5"]["award"] = 125
objects["round:5"]["total"] = 18

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 6,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 4,
    delayTime = 31200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 78800
objects["round:6"]["award"] = 125
objects["round:6"]["total"] = 18

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 9600,
    deadGold = 8,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 3,
    delayTime = 32400,
    intervalTime = 9600,
    deadGold = 8,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 4,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:6"]["sub_round:15"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 5,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:6"]["sub_round:16"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 6,
    delayTime = 31200,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:6"]["sub_round:17"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 5,
    delayTime = 42000,
    intervalTime = 600,
    deadGold = 8,
}
objects["round:6"]["sub_round:18"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 5,
    delayTime = 31400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 88400
objects["round:7"]["award"] = 125
objects["round:7"]["total"] = 22

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 55200,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:15"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:16"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 54000,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:17"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:18"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:7"]["sub_round:19"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 50400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:7"]["sub_round:20"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 2,
    delayTime = 42000,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:7"]["sub_round:21"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 2,
    delayTime = 48000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:7"]["sub_round:22"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 58800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 82400
objects["round:8"]["award"] = 125
objects["round:8"]["total"] = 32

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100102",
    num = 2,
    pathId = 1,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 3,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 20400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 3,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 2,
    delayTime = 48000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 54000,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:8"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 8,
}
objects["round:8"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:14"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:15"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"]["sub_round:16"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:17"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:18"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:19"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:20"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:21"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:22"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:23"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 8,
}
objects["round:8"]["sub_round:24"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"]["sub_round:25"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 1,
    delayTime = 51600,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"]["sub_round:26"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 6,
    delayTime = 40800,
    intervalTime = 800,
    deadGold = 8,
}
objects["round:8"]["sub_round:27"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 5,
    delayTime = 38400,
    intervalTime = 6000,
    deadGold = 8,
}
objects["round:8"]["sub_round:28"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:29"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 55200,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:30"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 56400,
    intervalTime = 3600,
    deadGold = 8,
}
objects["round:8"]["sub_round:31"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 4,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 8,
}
objects["round:8"]["sub_round:32"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 4,
    delayTime = 52800,
    intervalTime = 3600,
    deadGold = 8,
}

monster.objects = objects

return monster