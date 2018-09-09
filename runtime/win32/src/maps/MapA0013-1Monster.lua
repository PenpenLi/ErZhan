
------------ MAP src/maps/MapA0013-1Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 11
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {12079, 17394, 19689, 21138}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 68000
objects["round:1"]["award"] = 123
objects["round:1"]["total"] = 17

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 3,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 2,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 2,
    delayTime = 37200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 25200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:1"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 1,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:1"]["sub_round:12"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 40800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:1"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:1"]["sub_round:14"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:15"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 25200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:1"]["sub_round:16"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:1"]["sub_round:17"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 6,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 64400
objects["round:2"]["award"] = 123
objects["round:2"]["total"] = 12

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100402",
    num = 3,
    pathId = 3,
    delayTime = 7200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 3,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 58400
objects["round:3"]["award"] = 123
objects["round:3"]["total"] = 8

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 19200,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 5,
    delayTime = 20400,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 52400
objects["round:4"]["award"] = 123
objects["round:4"]["total"] = 9

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 1200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 3,
    delayTime = 21600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 63200
objects["round:5"]["award"] = 123
objects["round:5"]["total"] = 9

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 4,
    pathId = 4,
    delayTime = 6000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 12000,
    deadGold = 10,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 3,
    delayTime = 32400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 60800
objects["round:6"]["award"] = 123
objects["round:6"]["total"] = 14

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 3,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 22800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 34800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 10800,
    deadGold = 10,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 2,
    delayTime = 28800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 64400
objects["round:7"]["award"] = 123
objects["round:7"]["total"] = 10

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 2,
    delayTime = 0,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100105",
    num = 5,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 1,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 3,
    delayTime = 22800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 500,
    deadGold = 10,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 6,
    delayTime = 12000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100205",
    num = 4,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 4,
    delayTime = 26400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 4,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 68000
objects["round:8"]["award"] = 123
objects["round:8"]["total"] = 24

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 3,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:12"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:13"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 38400,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:8"]["sub_round:14"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:15"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:16"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:17"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:8"]["sub_round:18"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:8"]["sub_round:19"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:20"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:8"]["sub_round:21"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:22"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 38400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:23"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:8"]["sub_round:24"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 36000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"] = {}
objects["round:9"]["delayTime"] = 56000
objects["round:9"]["award"] = 123
objects["round:9"]["total"] = 24

objects["round:9"]["sub_round:1"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:2"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:9"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:9"]["sub_round:5"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:8"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 2,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:9"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 24000,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:9"]["sub_round:10"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 1,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 3,
    delayTime = 24000,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:9"]["sub_round:12"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:13"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 4,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:14"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:15"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:16"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:17"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:18"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:19"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 6,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:20"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:21"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:22"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:23"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:9"]["sub_round:24"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"] = {}
objects["round:10"]["delayTime"] = 81200
objects["round:10"]["award"] = 123
objects["round:10"]["total"] = 25

objects["round:10"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 3,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:4"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 26400,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:10"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:10"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 34800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:10"]["sub_round:8"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 43200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:9"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 1,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:10"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 3,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:11"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 50400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:12"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 1,
    delayTime = 55200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:13"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 3,
    delayTime = 58800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 4,
    delayTime = 1200,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:15"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 800,
    deadGold = 10,
}
objects["round:10"]["sub_round:16"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:17"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:10"]["sub_round:18"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:10"]["sub_round:19"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:20"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:21"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 4,
    delayTime = 28800,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:10"]["sub_round:22"] = {
    resourceId  = "100201",
    num = 2,
    pathId = 6,
    delayTime = 34800,
    intervalTime = 8400,
    deadGold = 10,
}
objects["round:10"]["sub_round:23"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 40800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:24"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 4,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:10"]["sub_round:25"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 49200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"] = {}
objects["round:11"]["delayTime"] = 101600
objects["round:11"]["award"] = 123
objects["round:11"]["total"] = 39

objects["round:11"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 1,
    delayTime = 0,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:11"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 2400,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:11"]["sub_round:3"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 3,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:6"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:7"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 2,
    delayTime = 30000,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:11"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 5,
    pathId = 1,
    delayTime = 61200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 2,
    delayTime = 45600,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:10"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 3,
    delayTime = 43200,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:11"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 55200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:12"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 58800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:13"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 62400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:14"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 2,
    delayTime = 66000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:15"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 1,
    delayTime = 70800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:16"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 3,
    delayTime = 75600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:17"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 0,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:11"]["sub_round:18"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 1200,
    intervalTime = 600,
    deadGold = 10,
}
objects["round:11"]["sub_round:19"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:20"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:21"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 6,
    delayTime = 18000,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:22"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:23"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:24"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:25"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 4,
    delayTime = 48000,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:26"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 6000,
    deadGold = 10,
}
objects["round:11"]["sub_round:27"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 6,
    delayTime = 58800,
    intervalTime = 2400,
    deadGold = 10,
}
objects["round:11"]["sub_round:28"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 6,
    delayTime = 55200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:29"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 61200,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:30"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 64800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:31"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 68400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:32"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 72000,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:33"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 4,
    delayTime = 70800,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:34"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 4,
    delayTime = 75600,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:35"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:36"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 3,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 10,
}
objects["round:11"]["sub_round:37"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 10,
}
objects["round:11"]["sub_round:38"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 3600,
    deadGold = 10,
}
objects["round:11"]["sub_round:39"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 10,
}

monster.objects = objects

return monster