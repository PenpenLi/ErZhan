
------------ MAP src/maps/MapA0008-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 5
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {4674, 6730, 7618, 8179}
objects["heroAddExp"] = 8.45

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 65600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 10

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 2,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 8,
    delayTime = 0,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 1,
    delayTime = 20400,
    intervalTime = 4800,
    deadGold = 15,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100208",
    num = 1,
    pathId = 9,
    delayTime = 14400,
    intervalTime = 4800,
    deadGold = 15,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 3,
    delayTime = 31200,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100209",
    num = 3,
    pathId = 7,
    delayTime = 25200,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 5,
    delayTime = 39600,
    intervalTime = 3600,
    deadGold = 15,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 4800,
    deadGold = 15,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 69200
objects["round:2"]["award"] = 118
objects["round:2"]["total"] = 27

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 3,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 7,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 9,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 4,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 8,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:13"] = {
    resourceId  = "100207",
    num = 1,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:14"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:15"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 7,
    delayTime = 24000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:16"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:17"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:18"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:19"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:20"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 2,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:21"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 8,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:22"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 8,
    delayTime = 34800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:23"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:2"]["sub_round:24"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 3,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:25"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 3,
    delayTime = 48000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:26"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 9,
    delayTime = 42000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:2"]["sub_round:27"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 9,
    delayTime = 44400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 71600
objects["round:3"]["award"] = 118
objects["round:3"]["total"] = 18

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100210",
    num = 1,
    pathId = 5,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 8,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 8,
    delayTime = 18000,
    intervalTime = 6000,
    deadGold = 15,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100208",
    num = 1,
    pathId = 4,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100208",
    num = 1,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 1,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:12"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:13"] = {
    resourceId  = "100209",
    num = 1,
    pathId = 9,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:14"] = {
    resourceId  = "100208",
    num = 1,
    pathId = 2,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:3"]["sub_round:15"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 2,
    delayTime = 44400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:16"] = {
    resourceId  = "100208",
    num = 1,
    pathId = 8,
    delayTime = 33600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:17"] = {
    resourceId  = "100209",
    num = 3,
    pathId = 8,
    delayTime = 40800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:3"]["sub_round:18"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 77600
objects["round:4"]["award"] = 118
objects["round:4"]["total"] = 15

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 8,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 5,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 8,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100207",
    num = 3,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 9,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 5,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100207",
    num = 3,
    pathId = 8,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 5,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:4"]["sub_round:13"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 2,
    delayTime = 52800,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:4"]["sub_round:14"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 8,
    delayTime = 51600,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:4"]["sub_round:15"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 5,
    delayTime = 60000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 78800
objects["round:5"]["award"] = 118
objects["round:5"]["total"] = 27

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 9,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100207",
    num = 3,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100207",
    num = 1,
    pathId = 6,
    delayTime = 16800,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 9,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 2,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 8,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 5,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100207",
    num = 1,
    pathId = 1,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 9,
    delayTime = 31200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 5,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:19"] = {
    resourceId  = "100207",
    num = 2,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:20"] = {
    resourceId  = "100210",
    num = 2,
    pathId = 7,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:21"] = {
    resourceId  = "100208",
    num = 2,
    pathId = 4,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:22"] = {
    resourceId  = "100211",
    num = 1,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 15,
}
objects["round:5"]["sub_round:23"] = {
    resourceId  = "100207",
    num = 3,
    pathId = 8,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 15,
}
objects["round:5"]["sub_round:24"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 6,
    delayTime = 45600,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:25"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 1,
    delayTime = 50400,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:26"] = {
    resourceId  = "100209",
    num = 2,
    pathId = 9,
    delayTime = 55200,
    intervalTime = 1200,
    deadGold = 15,
}
objects["round:5"]["sub_round:27"] = {
    resourceId  = "100211",
    num = 2,
    pathId = 5,
    delayTime = 52800,
    intervalTime = 1200,
    deadGold = 15,
}

monster.objects = objects

return monster