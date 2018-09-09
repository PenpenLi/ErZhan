
------------ MAP src/maps/MapA0014-2Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 12
objects["addMonsterHp"] = {105, 120, 120}
objects["heroUpLevelLimit"] = {11753, 16924, 19157, 20567}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 66800
objects["round:1"]["award"] = 142
objects["round:1"]["total"] = 10

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 5,
    delayTime = 4800,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:1"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 4,
    delayTime = 30000,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:1"]["sub_round:4"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 5,
    delayTime = 32400,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:1"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:1"]["sub_round:6"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 7200,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:1"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:1"]["sub_round:8"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 4,
    delayTime = 14400,
    intervalTime = 4800,
    deadGold = 12,
}
objects["round:1"]["sub_round:9"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 4,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:1"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:2"] = {}
objects["round:2"]["delayTime"] = 60800
objects["round:2"]["award"] = 142
objects["round:2"]["total"] = 12

objects["round:2"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:2"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 2,
    delayTime = 12000,
    intervalTime = 4800,
    deadGold = 12,
}
objects["round:2"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 4800,
    deadGold = 12,
}
objects["round:2"]["sub_round:4"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 600,
    deadGold = 12,
}
objects["round:2"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 2,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 600,
    deadGold = 12,
}
objects["round:2"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 6,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:2"]["sub_round:7"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 7,
    delayTime = 27600,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:2"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 9,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:2"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 8,
    delayTime = 12000,
    intervalTime = 4800,
    deadGold = 12,
}
objects["round:2"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 7,
    delayTime = 27600,
    intervalTime = 4800,
    deadGold = 12,
}
objects["round:2"]["sub_round:11"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:2"]["sub_round:12"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:3"] = {}
objects["round:3"]["delayTime"] = 66800
objects["round:3"]["award"] = 142
objects["round:3"]["total"] = 11

objects["round:3"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:2"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:3"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:3"]["sub_round:4"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 6,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:6"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 5,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:8"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:3"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 2,
    pathId = 8,
    delayTime = 19200,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:10"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 8,
    delayTime = 40800,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:3"]["sub_round:11"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 8,
    delayTime = 43200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"] = {}
objects["round:4"]["delayTime"] = 58400
objects["round:4"]["award"] = 142
objects["round:4"]["total"] = 12

objects["round:4"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 0,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:4"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 6,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:3"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:4"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 25200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:4"]["sub_round:5"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 34800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:7"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 1,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:8"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 8,
    delayTime = 21600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:4"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 9,
    delayTime = 13200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:4"]["sub_round:11"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:4"]["sub_round:12"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 7,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"] = {}
objects["round:5"]["delayTime"] = 64400
objects["round:5"]["award"] = 142
objects["round:5"]["total"] = 19

objects["round:5"]["sub_round:1"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:2"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 5,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:5"]["sub_round:3"] = {
    resourceId  = "100402",
    num = 2,
    pathId = 4,
    delayTime = 24000,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:5"]["sub_round:4"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 26400,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:5"]["sub_round:5"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 8,
    delayTime = 22800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 2,
    delayTime = 4800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:7"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 8,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 8,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:11"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 9,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:12"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 3,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:13"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:14"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 7,
    delayTime = 31200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:15"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:16"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 4,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:17"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:18"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 5,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:5"]["sub_round:19"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"] = {}
objects["round:6"]["delayTime"] = 56000
objects["round:6"]["award"] = 142
objects["round:6"]["total"] = 14

objects["round:6"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 2,
    delayTime = 9600,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:6"]["sub_round:2"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:3"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 3,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 4,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 6,
    delayTime = 2400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:7"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:8"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 8,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:6"]["sub_round:10"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 7,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 7,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:6"]["sub_round:12"] = {
    resourceId  = "100201",
    num = 1,
    pathId = 9,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:13"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 9,
    delayTime = 28800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:6"]["sub_round:14"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:7"] = {}
objects["round:7"]["delayTime"] = 59600
objects["round:7"]["award"] = 142
objects["round:7"]["total"] = 14

objects["round:7"]["sub_round:1"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 1,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:7"]["sub_round:2"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:7"]["sub_round:3"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 3,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:7"]["sub_round:4"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 5,
    delayTime = 2400,
    intervalTime = 10800,
    deadGold = 12,
}
objects["round:7"]["sub_round:5"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 4,
    delayTime = 7200,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:7"]["sub_round:6"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 15600,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:7"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 4,
    delayTime = 21600,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:7"]["sub_round:8"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 5,
    delayTime = 21600,
    intervalTime = 10800,
    deadGold = 12,
}
objects["round:7"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 6,
    delayTime = 30000,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:7"]["sub_round:10"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 9,
    delayTime = 4800,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:7"]["sub_round:11"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 8,
    delayTime = 0,
    intervalTime = 13200,
    deadGold = 12,
}
objects["round:7"]["sub_round:12"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 7,
    delayTime = 27600,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:7"]["sub_round:13"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 10,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:7"]["sub_round:14"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 11,
    delayTime = 30000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"] = {}
objects["round:8"]["delayTime"] = 76400
objects["round:8"]["award"] = 142
objects["round:8"]["total"] = 16

objects["round:8"]["sub_round:1"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:2"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:8"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 3,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:8"]["sub_round:4"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:5"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 4,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:6"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 6,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:7"] = {
    resourceId  = "100408",
    num = 4,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:8"]["sub_round:8"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 8,
    delayTime = 3600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 7,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:8"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 9,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:8"]["sub_round:11"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 8,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:12"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 1,
    delayTime = 30000,
    intervalTime = 9600,
    deadGold = 12,
}
objects["round:8"]["sub_round:13"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 9,
    delayTime = 38400,
    intervalTime = 9600,
    deadGold = 12,
}
objects["round:8"]["sub_round:14"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 11,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:15"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 10,
    delayTime = 26400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:8"]["sub_round:16"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 11,
    delayTime = 45600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"] = {}
objects["round:9"]["delayTime"] = 68000
objects["round:9"]["award"] = 142
objects["round:9"]["total"] = 18

objects["round:9"]["sub_round:1"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:2"] = {
    resourceId  = "100408",
    num = 4,
    pathId = 2,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:9"]["sub_round:3"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 2,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:9"]["sub_round:4"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 4,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:9"]["sub_round:6"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 6,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:7"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:8"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:9"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 6,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 4,
    delayTime = 27600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:9"]["sub_round:11"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:12"] = {
    resourceId  = "100414",
    num = 3,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:9"]["sub_round:13"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:14"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 9,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:15"] = {
    resourceId  = "100408",
    num = 4,
    pathId = 8,
    delayTime = 18000,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:9"]["sub_round:16"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 7,
    delayTime = 33600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:9"]["sub_round:17"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 11,
    delayTime = 9600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:9"]["sub_round:18"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 10,
    delayTime = 36000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"] = {}
objects["round:10"]["delayTime"] = 60800
objects["round:10"]["award"] = 142
objects["round:10"]["total"] = 18

objects["round:10"]["sub_round:1"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 1,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:2"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 2,
    delayTime = 25200,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:10"]["sub_round:3"] = {
    resourceId  = "100104",
    num = 5,
    pathId = 3,
    delayTime = 28800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:4"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 1,
    delayTime = 13200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:5"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 2,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:6"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 3,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:7"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 4,
    delayTime = 4800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:8"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:10"]["sub_round:9"] = {
    resourceId  = "100104",
    num = 3,
    pathId = 6,
    delayTime = 4800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:10"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 5,
    delayTime = 12000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:11"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 4,
    delayTime = 16800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:12"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 6,
    delayTime = 20400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:13"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 7,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:14"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 8,
    delayTime = 13200,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:10"]["sub_round:15"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 9,
    delayTime = 16800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:10"]["sub_round:16"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 7,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:17"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 8,
    delayTime = 27600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:10"]["sub_round:18"] = {
    resourceId  = "100408",
    num = 1,
    pathId = 9,
    delayTime = 24000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:11"] = {}
objects["round:11"]["delayTime"] = 70400
objects["round:11"]["award"] = 142
objects["round:11"]["total"] = 24

objects["round:11"]["sub_round:1"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 9600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:2"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:11"]["sub_round:3"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 3,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:4"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 2,
    delayTime = 10800,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:11"]["sub_round:5"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 1,
    delayTime = 31200,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:11"]["sub_round:6"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 3,
    delayTime = 37200,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:11"]["sub_round:7"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 2,
    delayTime = 27600,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:11"]["sub_round:8"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 4,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:9"] = {
    resourceId  = "100106",
    num = 4,
    pathId = 6,
    delayTime = 0,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:10"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 5,
    delayTime = 1200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:11"]["sub_round:11"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 4,
    delayTime = 18000,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:11"]["sub_round:12"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 5,
    delayTime = 19200,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:11"]["sub_round:13"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 6,
    delayTime = 24000,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:11"]["sub_round:14"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 42000,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:11"]["sub_round:15"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:11"]["sub_round:16"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 42000,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:11"]["sub_round:17"] = {
    resourceId  = "100205",
    num = 2,
    pathId = 5,
    delayTime = 43200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:11"]["sub_round:18"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 7,
    delayTime = 18000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:19"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 8,
    delayTime = 14400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:11"]["sub_round:20"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 9,
    delayTime = 24000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:11"]["sub_round:21"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 8,
    delayTime = 19200,
    intervalTime = 3600,
    deadGold = 12,
}
objects["round:11"]["sub_round:22"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 7,
    delayTime = 39600,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:11"]["sub_round:23"] = {
    resourceId  = "100105",
    num = 3,
    pathId = 8,
    delayTime = 37200,
    intervalTime = 2400,
    deadGold = 12,
}
objects["round:11"]["sub_round:24"] = {
    resourceId  = "100106",
    num = 3,
    pathId = 9,
    delayTime = 32400,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:12"] = {}
objects["round:12"]["delayTime"] = 84800
objects["round:12"]["award"] = 142
objects["round:12"]["total"] = 39

objects["round:12"]["sub_round:1"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:2"] = {
    resourceId  = "100105",
    num = 1,
    pathId = 5,
    delayTime = 8400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:3"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 8,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:4"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 1,
    delayTime = 2400,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:5"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 2,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:6"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 11,
    delayTime = 36000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:7"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:8"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 5,
    delayTime = 14400,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:9"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 6,
    delayTime = 12000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:10"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 10,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:11"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 8,
    delayTime = 6000,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:12"] = {
    resourceId  = "100414",
    num = 2,
    pathId = 9,
    delayTime = 3600,
    intervalTime = 1200,
    deadGold = 12,
}
objects["round:12"]["sub_round:13"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 1,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:14"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 3,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:15"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 4,
    delayTime = 60000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:16"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 6,
    delayTime = 60000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:17"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 7,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:18"] = {
    resourceId  = "100205",
    num = 1,
    pathId = 9,
    delayTime = 15600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:19"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 2,
    delayTime = 19200,
    intervalTime = 20400,
    deadGold = 12,
}
objects["round:12"]["sub_round:20"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 2,
    delayTime = 22800,
    intervalTime = 9600,
    deadGold = 12,
}
objects["round:12"]["sub_round:21"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 5,
    delayTime = 33600,
    intervalTime = 20400,
    deadGold = 12,
}
objects["round:12"]["sub_round:22"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 5,
    delayTime = 37200,
    intervalTime = 9600,
    deadGold = 12,
}
objects["round:12"]["sub_round:23"] = {
    resourceId  = "100410",
    num = 1,
    pathId = 8,
    delayTime = 19200,
    intervalTime = 20400,
    deadGold = 12,
}
objects["round:12"]["sub_round:24"] = {
    resourceId  = "100408",
    num = 2,
    pathId = 8,
    delayTime = 22800,
    intervalTime = 9600,
    deadGold = 12,
}
objects["round:12"]["sub_round:25"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:26"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 3,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:27"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 1,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:28"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 6,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:29"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 4,
    delayTime = 46800,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:30"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 6,
    delayTime = 54000,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:31"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 9,
    delayTime = 25200,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:32"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 7,
    delayTime = 32400,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:33"] = {
    resourceId  = "100414",
    num = 1,
    pathId = 9,
    delayTime = 39600,
    intervalTime = 0,
    deadGold = 12,
}
objects["round:12"]["sub_round:34"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 2,
    delayTime = 46800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:12"]["sub_round:35"] = {
    resourceId  = "100104",
    num = 4,
    pathId = 8,
    delayTime = 46800,
    intervalTime = 800,
    deadGold = 12,
}
objects["round:12"]["sub_round:36"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 1,
    delayTime = 54000,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:12"]["sub_round:37"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 10,
    delayTime = 22800,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:12"]["sub_round:38"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 11,
    delayTime = 44400,
    intervalTime = 6000,
    deadGold = 12,
}
objects["round:12"]["sub_round:39"] = {
    resourceId  = "100105",
    num = 2,
    pathId = 9,
    delayTime = 54000,
    intervalTime = 6000,
    deadGold = 12,
}

monster.objects = objects

return monster