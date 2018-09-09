local PainterProperties = {}

PainterProperties.aniIdx = {11,24}

PainterProperties.aniType = {
    fadeIn   = 1,      --显现
    leftIn   = 2,      --左侧进入
    Scale    = 3,      --缩放
    leftFade = 4       --左侧显现
}

local defines = {}

local painter = {
    Path     = "painter/page01/01.jpg",              --漫画路径
    Pos_X    = 252,                                  --x坐标偏移值
    Pos_Y    = 98,                                 --y坐标偏移值
    Time     = 1600,                                 --展示时间
    ShowType = 4,                             --展示方式
    Scale    = 1
}
defines[1] = painter

local painter = {
    Path     = "painter/page01/02.jpg",              --漫画路径
    Pos_X    = 585,                                  --x坐标偏移值
    Pos_Y    = 98,                                 --y坐标偏移值
    Time     = 1600,                                 --展示时间
    ShowType = 1,                              --展示方式
    Scale    = 1
}
defines[2] = painter

local painter = {
    Path     = "painter/page01/03.jpg",              --漫画路径
    Pos_X    = 998,                                  --x坐标
    Pos_Y    = 98,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[3] = painter

local painter = {
    Path     = "painter/page01/04.jpg",              --漫画路径
    Pos_X    = 356,                                  --x坐标
    Pos_Y    = 324,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[4] = painter

local painter = {
    Path     = "painter/page01/04y.png",              --漫画路径
    Pos_X    = 285,                                  --x坐标
    Pos_Y    = 276,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[5] = painter
local painter = {
    Path     = "painter/page01/05.jpg",              --漫画路径
    Pos_X    = 962,                                  --x坐标
    Pos_Y    = 324,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[6] = painter

local painter = {
    Path     = "painter/page01/06.jpg",              --漫画路径
    Pos_X    = 205,                                  --x坐标
    Pos_Y    = 579,                                 --y坐标
    Time     = 400,                                 --展示时间
    ShowType = 3,                             --展示方式
    Scale    = 1
}
defines[7] = painter
local painter = {
    Path     = "painter/page01/07.jpg",              --漫画路径
    Pos_X    = 838,                                  --x坐标
    Pos_Y    = 579,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[8] = painter
local painter = {
    Path     = "painter/page01/07y.png",              --漫画路径
    Pos_X    = 700,                                  --x坐标
    Pos_Y    = 500,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[9] = painter
local painter = {
    Path     = "painter/page01/07y1.png",              --漫画路径
    Pos_X    = 1047,                                  --x坐标
    Pos_Y    = 509,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[10] = painter
local painter = {
    Path     = "painter/page01/07y2.png",              --漫画路径
    Pos_X    = 1062,                                  --x坐标
    Pos_Y    = 597,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[11] = painter

local painter = {
    Path     = "painter/page02/01.jpg",              --漫画路径
    Pos_X    = 225,                                  --x坐标
    Pos_Y    = 98,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 2,                             --展示方式
    Scale    = 1
}
defines[12] = painter
local painter = {
    Path     = "painter/page02/01y.jpg",              --漫画路径
    Pos_X    = 140,                                  --x坐标
    Pos_Y    = 186,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[13] = painter
local painter = {
    Path     = "painter/page02/02.jpg",              --漫画路径
    Pos_X    = 518,                                  --x坐标
    Pos_Y    = 98,                                 --y坐标
    Time     = 400,                                 --展示时间
    ShowType = 3,                             --展示方式
    Scale    = 1
}
defines[14] = painter
local painter = {
    Path     = "painter/page02/03.jpg",              --漫画路径
    Pos_X    = 955,                                  --x坐标
    Pos_Y    = 98,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[15] = painter
local painter = {
    Path     = "painter/page02/04.jpg",              --漫画路径
    Pos_X    = 440,                                  --x坐标
    Pos_Y    = 324,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[16] = painter
local painter = {
    Path     = "painter/page02/04y1.png",              --漫画路径
    Pos_X    = 132,                                  --x坐标
    Pos_Y    = 250,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[17] = painter
local painter = {
    Path     = "painter/page02/04y2.png",              --漫画路径
    Pos_X    = 117,                                  --x坐标
    Pos_Y    = 399,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[18] = painter
local painter = {
    Path     = "painter/page02/04y3.png",              --漫画路径
    Pos_X    = 448,                                  --x坐标
    Pos_Y    = 343,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[19] = painter
local painter = {
    Path     = "painter/page02/04y4.png",              --漫画路径
    Pos_X    = 538,                                  --x坐标
    Pos_Y    = 253,                                 --y坐标
    Time     = 800,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[20] = painter

local painter = {
    Path     = "painter/page02/05.jpg",              --漫画路径
    Pos_X    = 1048,                                  --x坐标
    Pos_Y    = 273,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[21] = painter
local painter = {
    Path     = "painter/page02/06.jpg",              --漫画路径
    Pos_X    = 1060,                                  --x坐标
    Pos_Y    = 388,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[22] = painter
local painter = {
    Path     = "painter/page02/07.jpg",              --漫画路径
    Pos_X    = 640,                                  --x坐标
    Pos_Y    = 579,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 1,                             --展示方式
    Scale    = 1
}
defines[23] = painter

local painter = {
    Path     = "painter/page02/07y.jpg",              --漫画路径
    Pos_X    = 1057,                                  --x坐标
    Pos_Y    = 688,                                 --y坐标
    Time     = 1600,                                 --展示时间
    ShowType = 3,                             --展示方式
    Scale    = 1
}
defines[24] = painter

function PainterProperties.get(i)
    return clone(defines[i])
end

function PainterProperties.getAll()
    return clone(defines)
end
--第idx页动画截止id
function PainterProperties.getPageNum(idx)
    if idx <= #PainterProperties.aniIdx then
        return PainterProperties.aniIdx[idx]
    else
        return nil
    end
end
--一共有几组漫画
function PainterProperties.getGroup()
    return #PainterProperties.aniIdx
end
return PainterProperties