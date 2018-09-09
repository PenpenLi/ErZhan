
------------ MAP src/maps/MapA0005-3Monster.lua ------------

local monster = {}

local objects = {}

objects["callScripts"] = "0"
objects["total"] = 1
objects["addMonsterHp"] = {100, 120, 120}
objects["heroUpLevelLimit"] = {2199, 3167, 3585, 3849}
objects["heroAddExp"] = 6.57

objects["round:1"] = {}
objects["round:1"]["delayTime"] = 71600
objects["round:1"]["award"] = 0
objects["round:1"]["total"] = 2

objects["round:1"]["sub_round:1"] = {
    resourceId  = "100604",
    num = 1,
    pathId = 2,
    delayTime = 0,
    intervalTime = 0,
    deadGold = 0,
}
objects["round:1"]["sub_round:2"] = {
    resourceId  = "100604",
    num = 1,
    pathId = 4,
    delayTime = 10800,
    intervalTime = 0,
    deadGold = 0,
}

monster.objects = objects

return monster