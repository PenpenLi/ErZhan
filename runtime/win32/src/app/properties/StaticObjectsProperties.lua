
--[[--

定义了所有的静态对象

]]

local MapConstants = require("app.map.MapConstants")

local StaticObjectsProperties = {}

local defines = {}

-----------------非-逃跑-----------------------

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100101.csb",
    radius        = 20,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = 10,                          --怪物中心点向下偏移像素                 
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100101"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100102.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 25,                          --怪物体积向下偏移量
    offsetY       = 13,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100102"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100103.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 25,                          --怪物体积向下偏移量
    offsetY       = 13,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100103"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100104.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 30,                          --怪物体积向下偏移量
    offsetY       = 15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100104"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100105.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 2,                          --怪物体积向下偏移量
    offsetY       = -7,                         --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100105"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100106.csb",
    radius        = 15,                         --怪物高度（体积直径）
    radiusOffsetY = 10,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100106"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100107.csb",
    radius        = 20,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100107"] = object

-----------------主动-远程-----------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100201.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100201"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100202.csb",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100202"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100203.csb",
    radius        = 30,                          --怪物高度（体积直径）
    radiusOffsetY = 30,                          --怪物体积向下偏移量
    offsetY       = 0,                          --怪物中心点向下偏移像素
    fireOffsetX   = 30,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = -25,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100203"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100204.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100204"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100205.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 60,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    fireOffsetX   = 30,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 60,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100205"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100206.csb",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100206"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100207",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100207"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100208",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100208"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100209",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100209"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100210",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100210"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100211",
    radius        = 22,                          --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100211"] = object

-----------------半主动-远程-----------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100301.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    fireOffsetX   = 10,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100301"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100302.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100302"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100303.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 20,                          --怪物体积向下偏移量
    offsetY       = 0,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100303"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100304-3.png",
    radius        = 15,
    radiusOffsetY = 3,
    offsetY       = 3,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100304"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100305-3.png",
    radius        = 15,
    radiusOffsetY = 3,
    offsetY       = 3,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100305"] = object

-----------------被动-近战-----------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100401.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100401"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100402.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100402"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100403.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100403"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100404.csb",
    radius        = 25,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100404"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100405-3.png",
    radius        = 15,
    radiusOffsetY = 3,
    offsetY       = 3,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100405"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100106.csb",
    radius        = 15,                         --怪物高度（体积直径）
    radiusOffsetY = 10,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100406"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100407.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100407"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100408.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 20,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100408"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100409.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100409"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100410.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100410"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100411.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100411"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100412.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100412"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100413.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 10,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100413"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100414.csb",
    radius        = 20,                         --怪物高度（体积直径）
    radiusOffsetY = 10,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100414"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100415.csb",
    radius        = 18,                         --怪物高度（体积直径）
    radiusOffsetY = 10,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100415"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100416.csb",
    radius        = 35,                         --怪物高度（体积直径）
    radiusOffsetY = 20,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100416"] = object

-----------------BOSS怪物-----------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100501",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100501"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100502",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100502"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100503",
    radius        = 60,                          --怪物高度（体积直径）
    radiusOffsetY = 100,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    fireOffsetX   = 90,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = -25,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100503"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100504",
    radius        = 50,                         --怪物高度（体积直径）
    radiusOffsetY = 20,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100504"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100505",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 50,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100505"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100506-3.png",
    radius        = 15,
    radiusOffsetY = 3,
    offsetY       = 3,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100506"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100507-3.png",
    radius        = 15,
    radiusOffsetY = 3,
    offsetY       = 3,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100507"] = object

------------------坦克型英雄---------------
local object = {          
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110101",    ---------spin方式实现文件
    radius        = 35,                         --怪物体积半径
    radiusOffsetY = 23,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 100,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110101"] = object     ----------牛魔王（矮人）

local object = {          
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110102",
    radius        = 35,                         --怪物体积半径
    radiusOffsetY = 25,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 100,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110102"] = object     ----------蛟魔王（和尚）

------------------输出型英雄---------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110201",
    radius        = 35,                         --怪物体积半径
    radiusOffsetY = 32,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 100,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110201"] = object   ----------齐天大圣（元素）

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110202",
    radius        = 35,                         --怪物体积半径
    radiusOffsetY = 25,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 100,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110202"] = object   ----------铁扇公主（暗夜女）

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110203",
    radius        = 30,                         --怪物体积半径
    radiusOffsetY = 70,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 100,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110203"] = object   ----------大鹏金翅雕

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110204",
    radius        = 35,                         --怪物体积半径
    radiusOffsetY = 23,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 0,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110204"] = object   ----------玉面狐狸（精灵射手）

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110205",
    radius        = 40,                         --怪物体积半径
    radiusOffsetY = 45,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = -15,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 80,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    fireOffsetX_L = -15,                         -- 远程动作Attck_far动作子弹, 9点钟方向的时候, 发射点X坐标（独角兽特有）
    fireOffsetY_L = 80,                           -- 远程动作Attck_far动作子弹, 9点钟方向的时候, 发射点Y坐标（独角兽特有）
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110205"] = object   ----------独角兽女孩

------------------辅助型英雄---------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/110301",
    radius        = 40,                         --怪物体积半径
    radiusOffsetY = 25,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = 0,                          --怪物脚底基于地面上移3个像素
    fireOffsetX   = 90,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 0,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["110301"] = object   ----------德鲁伊

------------------召唤兵---------------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170101.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170101"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170101.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170102"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170103.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170103"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170103.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170104"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170103.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170105"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170106.csb",
    radius        = 30,                         --怪物高度（体积直径）
    radiusOffsetY = 25,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    fireOffsetX   = 50,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = 30,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170106"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170204.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170204"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170205.csb",
    radius        = 15,
    radiusOffsetY = 30,
    offsetY       = 33,
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170205"] = object

------------------祭坛塔援兵--------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170301.csb",
    radius        = 22,                         --怪物高度（体积直径）
    radiusOffsetY = 15,                          --怪物体积向下偏移量
    offsetY       = -3,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170301"] = object    --援兵枯木战士

----------------火图腾召唤兵---------------------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170401.csb",
    radius        = 20,
    radiusOffsetY = 15,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = -10,                          --怪物脚底基于地面上移3个像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170401"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170401.csb",
    radius        = 20,
    radiusOffsetY = 15,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = -10,                          --怪物脚底基于地面上移3个像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170402"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "hero/170401.csb",
    radius        = 20,
    radiusOffsetY = 15,                          --怪物体积中心点基于怪物脚底上移3个像素
    offsetY       = -10,                          --怪物脚底基于地面上移3个像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["170403"] = object

-----------------第三模式第九关新增怪物----------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100501",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100601"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100502",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100602"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100503",
    radius        = 60,                          --怪物高度（体积直径）
    radiusOffsetY = 100,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    fireOffsetX   = 90,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = -25,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100603"] = object

-----------------第三模式第五关新增怪物----------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100501",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100604"] = object
--------------------------------------------

-----------------第三模式第十五关新增怪物----------
local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100501",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100605"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100502",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 40,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100606"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100503",
    radius        = 60,                          --怪物高度（体积直径）
    radiusOffsetY = 100,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    fireOffsetX   = 90,                         -- 远程动作Attck_far动作子弹发射点X坐标
    fireOffsetY   = -25,                           -- 远程动作Attck_far动作子弹发射点Y坐标
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100607"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100504",
    radius        = 50,                         --怪物高度（体积直径）
    radiusOffsetY = 20,                          --怪物体积向下偏移量
    offsetY       = -5,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100608"] = object

local object = {
    classId       = "static",
    objType       = "static",
    imageName     = "monster/100505",
    radius        = 60,                         --怪物高度（体积直径）
    radiusOffsetY = 50,                          --怪物体积向下偏移量
    offsetY       = -15,                          --怪物中心点向下偏移像素
    decorations   = {"ShipWavesUp", "ShipWaves"},
    behaviors     = {},
}
defines["100609"] = object

function StaticObjectsProperties.getAllIds()
    local keys = table.keys(defines)
    table.sort(keys)
    return keys
end

-- 返回static属性的物体
function StaticObjectsProperties:getStaticIds()
    local keys = {}
    for k,v in pairs(defines) do
        if string.find(v.classId, "static") then
            keys[#keys+1] = k
        end
    end
   
    return keys
end

-- 返回塔基和特殊属性的塔
function StaticObjectsProperties:getTowerLocationIds()
    local keys = {}
    for k,v in pairs(defines) do
        if string.find(v.objType, "SpecialTower") or string.find(v.objType, "TowerLocation") then
            keys[#keys+1] = k
        end
    end
    table.sort(keys)
    return keys
end

function StaticObjectsProperties.get(defineId)
    -- assert(defines[defineId], string.format("StaticObjectsProperties.get() - invalid defineId %s", tostring(defineId)))
    if not defines[defineId] then
        -- print(string.format("StaticObjectsProperties.get() 找不到Id %s, 开始到RangeObjectsProperties中去取", 
        --     tostring(defineId)))
        return
    else
        return clone(defines[defineId])
    end
end

function StaticObjectsProperties.isExists(defineId)
    return defines[defineId] ~= nil
end

return StaticObjectsProperties
