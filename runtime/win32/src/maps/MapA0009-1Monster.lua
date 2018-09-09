
------------ MAP src/maps/MapA0009-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 9
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {6426, 9254, 10475, 11246}
objects["heroAddExp"] = 8.45

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 52400
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 5

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 9,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 7,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 9,
    delayTime = 21600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 7,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 8,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 69200
objects["round:2"]["award"] = 106
objects["round:2"]["total"] = 11

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 14400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 0,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 8,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100206",
    num = 2,
    pathId = 9,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 11,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 7,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 12,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 8,
    delayTime = 30000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 58400
objects["round:3"]["award"] = 106
objects["round:3"]["total"] = 10

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 600,
    deadGold = 15,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 4,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 8,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100302",
    num = 2,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 12,
    delayTime = 30000,
    intervalTime = 600,
    deadGold = 15,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 7,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 9,
    delayTime = 8400,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 7,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 8,
    delayTime = 24000,
    intervalTime = 600,
    deadGold = 15,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 9,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 69200
objects["round:4"]["award"] = 106
objects["round:4"]["total"] = 11

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 4,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 3,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100302",
    num = 3,
    pathId = 9,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 8,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 7,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 11,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 11,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 68000
objects["round:5"]["award"] = 106
objects["round:5"]["total"] = 10

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 1,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 1,
    delayTime = 40800,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 10,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 12,
    delayTime = 15600,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 12,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100203",
    num = 3,
    pathId = 7,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100203",
    num = 3,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 8,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100202",
    num = 3,
    pathId = 4,
    delayTime = 42000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 77600
objects["round:6"]["award"] = 106
objects["round:6"]["total"] = 12

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 4,
    delayTime = 1200,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 9,
    delayTime = 7200,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 7,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 3,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 12,
    delayTime = 48000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 10,
    delayTime = 51600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100102",
    num = 3,
    pathId = 11,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 5,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 4,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 8,
    delayTime = 46800,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 60800
objects["round:7"]["award"] = 106
objects["round:7"]["total"] = 11

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 5,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100102",
    num = 5,
    pathId = 7,
    delayTime = 19200,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100203",
    num = 1,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 2,
    delayTime = 14400,
    intervalTime = 7200,
    deadGold = 15,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100206",
    num = 3,
    pathId = 10,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 2,
    pathId = 11,
    delayTime = 26400,
    intervalTime = 7200,
    deadGold = 15,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 12,
    delayTime = 24000,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 69200
objects["round:8"]["award"] = 106
objects["round:8"]["total"] = 11

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 7200,
    deadGold = 15,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 1,
    pathId = 12,
    delayTime = 4800,
    intervalTime = 7200,
    deadGold = 15,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 12,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100203",
    num = 3,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100203",
    num = 3,
    pathId = 9,
    delayTime = 36000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100102",
    num = 9,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100102",
    num = 9,
    pathId = 8,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100407",
    num = 4,
    pathId = 6,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100407",
    num = 3,
    pathId = 7,
    delayTime = 18000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100503",
    num = 1,
    pathId = 13,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"] = {}
objects["round:9"]["delayTime"] = 89600
objects["round:9"]["award"] = 106
objects["round:9"]["total"] = 19

objects["round:9"]["sub_round:1"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 1,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:9"]["sub_round:2"] = {
    resourceId  = "100206",
    num = 4,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:9"]["sub_round:3"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:9"]["sub_round:4"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 1,
    delayTime = 68400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:5"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 4,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:6"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 4,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:7"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 5,
    delayTime = 49200,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:9"]["sub_round:8"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 9,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:9"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 8,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:10"] = {
    resourceId  = "100102",
    num = 4,
    pathId = 10,
    delayTime = 15600,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:9"]["sub_round:11"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 8,
    delayTime = 56400,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:9"]["sub_round:12"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 12,
    delayTime = 8400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:9"]["sub_round:13"] = {
    resourceId  = "100202",
    num = 2,
    pathId = 11,
    delayTime = 33600,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:9"]["sub_round:14"] = {
    resourceId  = "100206",
    num = 5,
    pathId = 10,
    delayTime = 44400,
    intervalTime = 800,
    deadGold = 15,
}
objects["round:9"]["sub_round:15"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:16"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 12,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:17"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 4,
    delayTime = 52800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:18"] = {
    resourceId  = "100302",
    num = 1,
    pathId = 9,
    delayTime = 57600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:9"]["sub_round:19"] = {
    resourceId  = "100407",
    num = 1,
    pathId = 12,
    delayTime = 68400,
    intervalTime = 0,
    deadGold = 15,
}

monster.objects = objects

return monster