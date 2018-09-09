
------------ MAP A0011 ------------

local map = {}

map.size = {width = 1434, height = 768}
map.imageName = "mapBg/MapA0011Bg.jpg"

local objects = {}

local object = {
    points = {
        {1291,  -14}, {1281,   40}, {1215,   84}, {1124,  134}, {1028,  171}, { 926,  177},
        { 759,  144}, { 647,  160}, { 550,  231}, { 463,  288}, { 390,  312}, { 250,  316},
        { 192,  258}, { 203,  166}, { 267,   89}, { 329,   42}, { 365,  -25},
     }
}
objects["path:1"] = object

----

local object = {
    points = {
        {1331,  -16}, {1298,   47}, {1235,  103}, {1134,  162}, {1035,  195}, { 920,  200},
        { 855,  190}, { 769,  173}, { 670,  184}, { 532,  274}, { 399,  339}, { 234,  343},
        { 162,  262}, { 177,  156}, { 240,   79}, { 300,   38}, { 337,  -26},
     }
}
objects["path:2"] = object

----

local object = {
    points = {
        {1365,  -18}, {1333,   56}, {1248,  128}, {1128,  187}, {1035,  221}, { 939,  230},
        { 799,  205}, { 737,  194}, { 662,  212}, { 511,  326}, { 388,  369}, { 228,  365},
        { 130,  256}, { 146,  145}, { 217,   64}, { 263,   29}, { 300,  -25},
     }
}
objects["path:3"] = object

----

local object = {
    points = {
        {1480,  555}, {1381,  551}, {1266,  533}, {1131,  498}, {1071,  447}, {1022,  372},
        { 960,  340}, { 861,  339}, { 795,  357}, { 705,  412}, { 594,  517}, { 553,  544},
        { 464,  556}, { 278,  508}, { 144,  525}, {  18,  589}, { -49,  623},
     }
}
objects["path:4"] = object

----

local object = {
    points = {
        {1479,  588}, {1387,  582}, {1252,  559}, {1109,  518}, {1053,  471}, {1012,  399},
        { 960,  370}, { 868,  361}, { 799,  384}, { 732,  421}, { 635,  527}, { 564,  567},
        { 462,  593}, { 271,  541}, { 150,  554}, {  19,  615}, { -50,  657},
     }
}
objects["path:5"] = object

----

local object = {
    points = {
        {1481,  617}, {1379,  609}, {1236,  585}, {1093,  538}, {1039,  501}, { 999,  431},
        { 941,  396}, { 874,  397}, { 804,  414}, { 751,  445}, { 665,  532}, { 578,  589},
        { 467,  634}, { 266,  570}, { 148,  584}, {  33,  649}, { -43,  685},
     }
}
objects["path:6"] = object

----

local object = {
    points = {
        {1148,  784}, {1110,  737}, { 997,  712}, { 895,  665}, { 820,  619}, { 699,  594},
        { 639,  585}, { 580,  591}, { 464,  631}, { 265,  572}, { 147,  581}, {  38,  649},
        { -47,  686},
     }
}
objects["path:7"] = object

----

local object = {
    points = {
        {1187,  786}, {1149,  723}, {1023,  688}, { 913,  644}, { 828,  589}, { 702,  566},
        { 635,  554}, { 563,  569}, { 460,  593}, { 272,  543}, { 147,  555}, {  19,  619},
        { -46,  660},
     }
}
objects["path:8"] = object

----

local object = {
    points = {
        {1237,  789}, {1173,  708}, {1050,  669}, { 922,  613}, { 842,  568}, { 707,  539},
        { 627,  525}, { 555,  543}, { 464,  557}, { 278,  512}, { 136,  523}, {  17,  586},
        { -49,  619},
     }
}
objects["path:9"] = object

----

local object = {
    campId = 3,
    defineId = "HeroBornRange",
    flipSprite = false,
    gateId = 0,
    imageName = "#Building01Destroyed.png",
    offsetY = 33,
    pathIds = {
    },
    radius = 40,
    radiusOffsetY = 0,
    rangeType = 3,
    tag = 0,
    x = 869,
    y = 374,
}
objects["rangeobject:174"] = object

----

local object = {
    campId = 3,
    defineId = "BornRange",
    flipSprite = false,
    gateId = 0,
    imageName = "rangeobject/BornRange.png",
    offsetY = 0,
    pathIds = {
        "path:3",
        "path:2",
        "path:1",
    },
    radius = 50,
    radiusOffsetY = 0,
    rangeType = 1,
    tag = 0,
    x = 1323,
    y = -11,
}
objects["rangeobject:18"] = object

----

local object = {
    campId = 3,
    defineId = "BornRange",
    flipSprite = false,
    gateId = 0,
    imageName = "rangeobject/BornRange.png",
    offsetY = 0,
    pathIds = {
        "path:5",
        "path:6",
        "path:4",
    },
    radius = 48,
    radiusOffsetY = 0,
    rangeType = 1,
    tag = 0,
    x = 1471,
    y = 586,
}
objects["rangeobject:19"] = object

----

local object = {
    campId = 3,
    defineId = "BornRange",
    flipSprite = false,
    gateId = 0,
    imageName = "rangeobject/BornRange.png",
    offsetY = 0,
    pathIds = {
        "path:7",
        "path:8",
        "path:9",
    },
    radius = 51,
    radiusOffsetY = 0,
    rangeType = 1,
    tag = 0,
    x = 1195,
    y = 785,
}
objects["rangeobject:20"] = object

----

local object = {
    campId = 3,
    defineId = "EndRange",
    flipSprite = false,
    gateId = 0,
    imageName = "#Building01.png",
    offsetY = 33,
    pathIds = {
    },
    radius = 56,
    radiusOffsetY = 0,
    rangeType = 2,
    tag = 0,
    x = 314,
    y = -23,
}
objects["rangeobject:21"] = object

----

local object = {
    campId = 3,
    defineId = "EndRange",
    flipSprite = false,
    gateId = 0,
    imageName = "#Building01.png",
    offsetY = 33,
    pathIds = {
    },
    radius = 57,
    radiusOffsetY = 0,
    rangeType = 2,
    tag = 0,
    x = -37,
    y = 653,
}
objects["rangeobject:22"] = object

----

local object = {
    isDefault = true,
    points = {
        {  -1,   -1}, {1288,    8}, {1304,    8}, {1320,    8}, {1336,    8}, {1352,    8},
        {1336,   24}, {1336,   40}, {1320,   40}, {1320,   56}, {1320,   72}, {1304,   72},
        {1304,   88}, {1304,  104}, {1288,  104}, {1288,  120}, {1272,  120}, {1240,  152},
        {1224,  168}, {1208,  168}, {1192,  184}, {1176,  184}, {1160,  184}, {1144,  200},
        {1128,  200}, {1112,  200}, {1096,  200}, {1080,  200}, {1064,  200}, {1048,  200},
        {1032,  200}, {1016,  200}, {1016,  184}, {1000,  184}, { 984,  184}, { 968,  184},
        { 952,  184}, { 952,  168}, { 936,  168}, { 920,  168}, { 904,  168}, { 888,  168},
        { 872,  168}, { 856,  168}, { 840,  168}, { 824,  168}, { 808,  168}, { 792,  168},
        { 776,  168}, { 760,  168}, { 744,  168}, { 728,  168}, { 712,  168}, { 696,  168},
        { 680,  168}, { 664,  168}, { 664,  184}, { 648,  184}, { 632,  200}, { 632,  216},
        { 616,  216}, { 616,  232}, { 600,  232}, { 600,  248}, { 584,  248}, { 584,  264},
        { 568,  264}, { 568,  280}, { 552,  280}, { 536,  296}, { 520,  312}, { 264,  392},
        { 216,  376}, { 152,  280}, { 168,  280}, { 184,  280}, { 184,  296}, { 200,  296},
        { 216,  296}, { 232,  296}, { 248,  296}, { 248,  312}, { 264,  312}, { 280,  312},
        { 296,  312}, { 312,  312}, { 328,  312}, { 344,  312}, { 408,  312}, { 424,  312},
        { 440,  296}, { 440,  280}, { 456,  280}, { 456,  264}, { 472,  264}, { 472,  248},
        { 488,  232}, { 504,  216}, {1128,  120}, {1160,  104}, {1176,   88}, {1192,   72},
        { 568,  520}, { 584,  504}, { 632,  456}, { 648,  440}, { 664,  424}, { 696,  392},
        {  24,  568}, {  40,  552}, {  56,  552}, {  72,  552}, {  88,  552}, { 104,  552},
        { 120,  552}, { 136,  552}, { 136,  568}, { 152,  568}, { 168,  568}, { 184,  568},
        { 200,  568}, { 216,  568}, { 280,  584}, { 328,  600}, { 344,  600}, { 360,  600},
        { 376,  600}, { 392,  600}, { 392,  616}, { 408,  616}, { 424,  616}, { 440,  616},
        { 456,  616}, { 472,  616}, { 488,  616}, { 504,  616}, { 520,  616}, { 536,  600},
        { 552,  600}, { 568,  600}, { 584,  600}, { 584,  584}, { 600,  584}, { 616,  584},
        { 632,  568}, { 648,  568}, { 664,  568}, { 664,  552}, { 680,  552}, { 680,  536},
        { 696,  536}, { 696,  520}, { 712,  520}, { 712,  504}, { 728,  488}, { 728,  472},
        { 744,  472}, { 744,  456}, { 744,  440}, { 760,  440}, { 760,  424}, { 776,  424},
        { 776,  408}, { 792,  408}, { 792,  392}, { 808,  392}, { 824,  392}, { 824,  376},
        { 840,  376}, { 856,  376}, { 872,  376}, { 888,  376}, { 904,  376}, { 920,  376},
        { 920,  392}, { 936,  392}, { 952,  392}, { 968,  408}, { 968,  424}, { 984,  424},
        { 984,  440}, {1000,  440}, {1000,  456}, {1432,  616}, {1432,  600}, {1432,  584},
        {1432,  568}, {1432,  552}, {1416,  552}, {1400,  552}, {1384,  552}, {1368,  552},
        {1352,  552}, {1336,  552}, {1320,  552}, {1304,  552}, {1288,  552}, {1272,  552},
        {1256,  552}, {1240,  552}, {1224,  552}, {1208,  536}, {1192,  536}, {1176,  536},
        {1176,  520}, {1160,  520}, {1144,  504}, {1128,  504}, {1128,  488}, {1112,  488},
        {1112,  472}, {1096,  456}, {1096,  440}, {1080,  440}, {1080,  424}, {1064,  408},
        { 152,  328}, { 152,  312}, { 152,  296}, { 168,  344}, { 168,  328}, { 168,  312},
        { 168,  296}, { 184,  312}, { 200,  312}, { 216,  312}, { 232,  312}, { 248,  328},
        { 232,  328}, { 216,  328}, { 200,  328}, { 184,  328}, { 184,  344}, { 200,  344},
        { 216,  344}, { 232,  344}, { 248,  344}, { 264,  344}, { 264,  360}, { 280,  360},
        { 248,  360}, { 232,  360}, { 216,  360}, { 200,  360}, { 184,  360}, { 248,  376},
        { 264,  376}, { 280,  376}, { 296,  376}, { 232,  376}, { 280,  392}, { 296,  392},
        { 312,  392}, { 328,  392}, { 376,  376}, { 360,  376}, { 344,  376}, { 328,  376},
        { 312,  376}, { 296,  360}, { 312,  360}, { 328,  360}, { 344,  360}, { 360,  360},
        { 376,  360}, { 328,  344}, { 312,  344}, { 296,  344}, { 280,  344}, { 264,  328},
        { 280,  328}, { 296,  328}, { 312,  328}, { 328,  328}, { 344,  328}, { 360,  328},
        { 376,  328}, { 392,  328}, { 376,  344}, { 360,  344}, { 344,  344}, { 392,  344},
        { 408,  344}, { 424,  328}, { 408,  328}, { 392,  360}, { 392,  376}, { 408,  376},
        { 408,  360}, { 440,  360}, { 424,  344}, { 424,  360}, { 440,  344}, { 440,  328},
        { 440,  312}, { 456,  344}, { 456,  328}, { 456,  312}, { 472,  344}, { 472,  328},
        { 472,  312}, { 472,  296}, { 472,  280}, { 456,  296}, { 488,  328}, { 488,  312},
        { 488,  296}, { 488,  280}, { 488,  264}, { 488,  248}, { 504,  280}, { 504,  296},
        { 504,  312}, { 504,  328}, { 504,  264}, { 504,  248}, { 504,  232}, { 520,  264},
        { 520,  280}, { 520,  296}, { 536,  280}, { 536,  264}, { 520,  248}, { 520,  232},
        { 520,  216}, { 520,  200}, { 536,  248}, { 536,  232}, { 536,  216}, { 536,  200},
        { 536,  184}, { 552,  232}, { 552,  248}, { 552,  264}, { 568,  248}, { 568,  232},
        { 568,  216}, { 568,  200}, { 568,  184}, { 552,  184}, { 552,  200}, { 552,  216},
        { 568,  168}, { 584,  152}, { 584,  168}, { 584,  184}, { 584,  200}, { 584,  216},
        { 584,  232}, { 600,  152}, { 600,  168}, { 600,  184}, { 600,  200}, { 600,  216},
        { 616,  200}, { 616,  184}, { 616,  168}, { 616,  152}, { 632,  136}, { 632,  152},
        { 632,  168}, { 632,  184}, { 648,  136}, { 648,  152}, { 648,  168}, { 664,  152},
        { 664,  136}, { 728,  104}, { 808,  120}, { 792,  120}, { 776,  120}, { 760,  120},
        { 680,  120}, { 664,  120}, { 696,  120}, { 712,  120}, { 728,  120}, { 744,  120},
        { 872,  136}, { 856,  136}, { 840,  136}, { 824,  136}, { 808,  136}, { 792,  136},
        { 776,  136}, { 760,  136}, { 744,  136}, { 728,  136}, { 712,  136}, { 696,  136},
        { 680,  136}, { 696,  152}, { 712,  152}, { 680,  152}, { 728,  152}, { 744,  152},
        { 760,  152}, { 776,  152}, { 792,  152}, { 840,  152}, { 856,  152}, { 872,  152},
        { 888,  152}, { 904,  152}, {1016,  152}, {1032,  152}, { 824,  152}, { 808,  152},
        {1080,  136}, {1096,  136}, {1112,  136}, {1048,  152}, {1064,  152}, {1080,  152},
        {1096,  152}, {1112,  152}, {1112,  168}, {1096,  168}, {1080,  168}, {1064,  168},
        {1048,  168}, {1032,  168}, {1016,  168}, {1000,  168}, { 984,  168}, { 968,  168},
        {1096,  184}, {1080,  184}, {1064,  184}, {1048,  184}, {1032,  184}, {1112,  184},
        {1128,  184}, {1144,  184}, {1144,  168}, {1144,  152}, {1128,  152}, {1128,  168},
        {1128,  136}, {1144,  120}, {1160,  120}, {1176,  104}, {1192,  104}, {1192,   88},
        {1208,   88}, {1208,   72}, {1224,   72}, {1224,   56}, {1240,   40}, {1272,   24},
        {1288,   24}, {1304,   24}, {1320,   24}, {1304,   40}, {1304,   56}, {1288,   72},
        {1288,   88}, {1272,  104}, {1256,  120}, {1256,  136}, {1240,  136}, {1224,  152},
        {1192,  168}, {1176,  168}, {1160,  168}, {1160,  136}, {1176,  136}, {1192,  136},
        {1192,  120}, {1176,  120}, {1144,  136}, {1160,  152}, {1176,  152}, {1192,  152},
        {1208,  152}, {1224,  136}, {1208,  136}, {1208,  120}, {1224,  120}, {1240,  120},
        {1208,  104}, {1224,  104}, {1240,  104}, {1256,  104}, {1240,   88}, {1256,   88},
        {1272,   88}, {1224,   88}, {1272,   72}, {1256,   72}, {1240,   72}, {1240,   56},
        {1256,   56}, {1272,   56}, {1272,   40}, {1256,   40}, {1288,   40}, {1288,   56},
        {  72,  536}, {  88,  536}, { 104,  536}, { 120,  520}, { 120,  536}, { 136,  520},
        { 136,  536}, { 152,  520}, { 152,  536}, { 152,  552}, { 152,  504}, { 168,  520},
        { 168,  536}, { 168,  552}, { 184,  552}, { 184,  536}, { 184,  520}, { 184,  504},
        { 168,  504}, { 200,  552}, { 200,  536}, { 200,  520}, { 216,  536}, { 216,  552},
        { 216,  520}, { 232,  520}, { 232,  536}, { 232,  552}, { 232,  568}, { 248,  552},
        { 248,  536}, { 264,  552}, { 264,  568}, { 248,  568}, { 264,  536}, { 280,  552},
        { 280,  536}, { 280,  568}, { 296,  552}, { 296,  536}, { 296,  568}, { 296,  584},
        { 312,  584}, { 312,  568}, { 312,  552}, { 328,  552}, { 328,  568}, { 328,  584},
        { 344,  552}, { 344,  568}, { 344,  584}, { 360,  552}, { 360,  568}, { 376,  568},
        { 376,  584}, { 360,  584}, { 392,  584}, { 408,  584}, { 424,  584}, { 440,  600},
        { 456,  600}, { 472,  600}, { 424,  600}, { 408,  600}, { 488,  600}, { 504,  600},
        { 520,  600}, { 552,  584}, { 568,  584}, { 600,  568}, { 616,  568}, { 616,  552},
        { 632,  552}, { 632,  536}, { 632,  520}, { 648,  520}, { 616,  536}, { 600,  536},
        { 584,  536}, { 568,  552}, { 552,  552}, { 536,  552}, { 520,  552}, { 504,  568},
        { 488,  568}, { 472,  568}, { 456,  568}, { 440,  568}, { 424,  568}, { 440,  584},
        { 456,  584}, { 472,  584}, { 488,  584}, { 504,  584}, { 520,  584}, { 536,  584},
        { 408,  568}, { 392,  568}, { 504,  552}, { 520,  568}, { 536,  568}, { 552,  568},
        { 568,  568}, { 584,  568}, { 584,  552}, { 600,  552}, { 552,  536}, { 568,  536},
        { 648,  536}, { 664,  536}, { 648,  552}, { 664,  520}, { 680,  520}, { 680,  504},
        { 696,  504}, { 696,  488}, { 712,  488}, { 712,  472}, { 728,  456}, { 728,  440},
        { 744,  424}, { 760,  408}, { 776,  392}, { 744,  408}, { 728,  408}, { 728,  424},
        { 712,  424}, { 712,  440}, { 696,  440}, { 680,  456}, { 664,  456}, { 664,  472},
        { 648,  488}, { 632,  488}, { 632,  504}, { 616,  504}, { 600,  504}, { 600,  520},
        { 584,  520}, { 616,  520}, { 616,  488}, { 664,  488}, { 664,  504}, { 648,  504},
        { 680,  488}, { 696,  472}, { 696,  456}, { 712,  456}, { 680,  440}, { 648,  472},
        { 632,  472}, { 648,  456}, { 664,  440}, { 680,  424}, { 696,  424}, { 712,  408},
        { 728,  392}, { 744,  392}, { 760,  376}, { 776,  376}, { 744,  376}, { 712,  392},
        { 696,  408}, { 760,  392}, { 680,  472}, { 728,  376}, { 744,  360}, { 760,  360},
        { 776,  360}, { 792,  376}, { 792,  360}, { 792,  344}, { 968,  328}, { 952,  328},
        { 936,  328}, { 920,  328}, { 904,  328}, { 888,  328}, { 872,  328}, { 856,  328},
        { 840,  328}, { 952,  344}, { 936,  344}, { 920,  344}, { 904,  344}, { 888,  344},
        { 872,  344}, { 856,  344}, { 840,  344}, { 824,  344}, { 808,  344}, { 808,  376},
        { 824,  360}, { 840,  360}, { 856,  360}, { 872,  360}, { 888,  360}, { 904,  360},
        { 920,  360}, { 936,  360}, { 952,  360}, { 968,  360}, { 808,  360}, { 936,  376},
        { 952,  376}, { 872,  392}, { 856,  392}, { 840,  392}, { 888,  392}, { 904,  392},
        { 984,  344}, { 968,  344}, {1000,  344}, {1016,  360}, {1032,  376}, {1048,  392},
        {1048,  408}, {1064,  424}, {1064,  440}, {1080,  456}, {1080,  472}, {1096,  472},
        {1096,  488}, {1096,  504}, {1112,  504}, {1112,  520}, {1080,  488}, {1064,  472},
        {1064,  456}, {1048,  440}, {1048,  424}, {1032,  424}, {1032,  408}, {1032,  392},
        {1016,  392}, {1016,  376}, {1000,  376}, {1000,  360}, { 984,  360}, {1016,  408},
        {1048,  456}, {1032,  440}, {1016,  424}, {1000,  408}, {1000,  392}, { 984,  392},
        { 984,  376}, { 968,  376}, { 984,  408}, {1000,  424}, {1016,  440}, {1032,  456},
        {1048,  472}, {1064,  488}, {1080,  504}, {1032,  472}, {1016,  456}, { 968,  392},
        {1096,  520}, {1128,  536}, {1144,  536}, {1160,  536}, {1160,  552}, {1176,  552},
        {1192,  552}, {1192,  568}, {1208,  568}, {1224,  568}, {1224,  584}, {1240,  584},
        {1256,  584}, {1272,  584}, {1272,  600}, {1208,  552}, {1144,  520}, {1128,  520},
        {1400,  616}, {1384,  616}, {1368,  616}, {1352,  616}, {1336,  616}, {1320,  616},
        {1416,  616}, {1416,  600}, {1400,  600}, {1384,  600}, {1368,  600}, {1352,  600},
        {1336,  600}, {1320,  600}, {1304,  600}, {1288,  600}, {1240,  568}, {1256,  568},
        {1272,  568}, {1288,  568}, {1304,  568}, {1320,  568}, {1336,  568}, {1352,  568},
        {1368,  568}, {1384,  568}, {1400,  568}, {1416,  568}, {1416,  584}, {1384,  584},
        {1368,  584}, {1352,  584}, {1336,  584}, {1320,  584}, {1304,  584}, {1288,  584},
        {  40,  568}, {  56,  568}, {  72,  568}, {  88,  568}, { 104,  568}, { 104,  584},
        { 120,  584}, { 136,  584}, { 152,  584}, { 168,  584}, { 408,  632}, { 424,  632},
        { 440,  632}, { 456,  632}, { 472,  632}, { 488,  632}, { 504,  632}, { 520,  632},
        { 536,  632}, { 552,  632}, { 552,  616}, { 568,  616}, { 520,  648}, { 504,  648},
        { 488,  648}, { 472,  648}, { 456,  648}, { 120,  568}, { 376,  616}, { 536,  616},
        { 568,  632}, { 584,  616}, { 600,  616}, { 232,  280}, { 216,  280}, { 200,  280},
        { 184,  264}, { 168,  264}, { 152,  264}, { 136,  248}, { 200,  264}, {1432,  536},
        {1416,  536}, {1400,  536}, {1384,  536}, {1368,  536}, {1352,  536}, {1320,  520},
        {1304,  520}, {1288,  520}, { 952,  408}, { 952,  424}, { 936,  408}, { 920,  408},
        { 904,  408}, { 808,  408}, {1160,  504}, {1192,  520}, {1208,  520}, {1224,  536},
        {1240,  536}, {1256,  536}, {1336,  536}, {1320,  536}, {1304,  536}, {1288,  536},
        {1272,  536}, {1240,  520}, {1224,  520}, {1256,  520}, {1272,  520}, { 888,  408},
        { 872,  408}, { 856,  408}, { 840,  408}, { 824,  408}, { 648,  584}, { 632,  584},
        { 616,  600}, { 600,  600}, { 632,  600}, { 760,  456}, { 776,  456}, { 776,  440},
        { 792,  440}, { 824,  424}, { 808,  424}, { 792,  424}, { 360,  312}, { 376,  312},
        { 392,  312}, { 408,  296}, { 424,  296}, { 424,  280}, { 392,  296}, { 376,  296},
        { 440,  264}, { 408,  280}, { 456,  248}, { 392,  280}, { 424,  264}, { 648,  200},
        { 680,  184}, { 696,  184}, { 712,  184}, { 728,  184}, { 744,  184}, { 760,  184},
        { 776,  184}, { 792,  184}, { 808,  184}, { 824,  184}, { 840,  184}, { 856,  184},
        { 872,  200}, { 888,  200}, { 904,  200}, { 920,  200}, { 936,  200}, { 952,  200},
        { 968,  200}, { 984,  200}, {1000,  200}, { 872,  216}, { 888,  216}, { 904,  216},
        { 920,  216}, { 936,  216}, { 952,  216}, { 968,  216}, { 984,  216}, {1000,  216},
        {1016,  216}, {1032,  216}, {1048,  216}, { 856,  216}, { 840,  216}, { 824,  216},
        { 824,  200}, { 808,  200}, { 792,  200}, { 776,  200}, { 888,  232}, { 904,  232},
        { 920,  232}, { 936,  232}, { 952,  232}, { 968,  232}, { 984,  232}, { 856,  200},
        { 840,  200}, { 920,  184}, { 936,  184}, { 904,  184}, { 888,  184}, { 872,  184},
        {1000,  232}, {1016,  232}, {1032,  232}, {1048,  232}, {1064,  216}, {1080,  216},
        {1096,  216}, {1320,   88}, {1336,   72}, {1336,   56}, {1352,   40}, {1352,   24},
        {1368,   24}, {1368,    8}, {1352,   56}, {1384,    8}, { 216,  264}, { 200,  248},
        { 184,  232}, { 184,  216}, { 168,  216}, { 168,  200}, { 152,  200}, { 152,  184},
        { 136,  184}, { 136,  168}, { 152,  248}, { 168,  248}, { 184,  248}, { 136,  232},
        { 152,  232}, { 168,  232}, { 136,  216}, { 152,  216}, { 216,  248}, { 200,  232},
        { 344,  392}, {   8,  632}, {  24,  616}, {  40,  616}, {  56,  616}, {  56,  600},
        {  72,  600}, {  88,  600}, {  88,  584}, { 472,  552}, { 456,  552}, { 440,  552},
        { 424,  552}, { 424,  536}, { 408,  536}, { 392,  520}, { 376,  520}, { 360,  520},
        { 296,  504}, { 216,  504}, { 200,  504}, { 136,  600}, { 120,  600}, { 104,  600},
        {  88,  616}, {  72,  616}, {  40,  632}, {  24,  632}, { 408,  552}, { 392,  552},
        { 376,  552}, { 392,  536}, { 376,  536}, { 360,  536}, { 344,  536}, { 328,  536},
        { 312,  536}, { 328,  520}, { 344,  520}, { 312,  520}, { 296,  520}, { 280,  520},
        { 264,  520}, { 248,  520}, { 248,  504}, { 264,  504}, { 280,  504}, { 232,  504},
        {  72,  584}, {  56,  584}, {  40,  584}, {  24,  584}, {   8,  584}, {   8,  600},
        {  24,  600}, {  40,  600}, {   8,  616}, {   8,  648}, {  24,  648}, {  56,  632},
        {  72,  632}, { 104,  616}, {  88,  632}, {  56,  648}, {  40,  648}, {   8,  664},
        {  24,  664}, {  40,  664}, { 136,  200}, { 248,   56}, { 200,  216}, { 200,  200},
        { 200,  184}, { 200,  168}, { 216,  168}, { 216,  152}, { 232,  152}, { 232,  136},
        { 248,  136}, { 280,  104}, { 136,  296}, { 136,  280}, { 136,  264}, { 216,  184},
        { 184,  200}, { 184,  184}, { 168,  184}, { 120,  200}, { 120,  216}, { 120,  232},
        { 120,  184}, { 136,  152}, { 136,  136}, { 152,  120}, { 152,  104}, { 168,  104},
        { 168,   88}, { 184,   88}, { 184,   72}, { 200,   72}, { 200,   56}, { 216,   56},
        { 232,   56}, { 232,   40}, { 248,   40}, { 264,   24}, { 280,   24}, { 296,    8},
        { 312,    8}, { 296,   88}, { 248,   24}, { 280,    8}, { 280,   40}, { 264,   40},
        { 264,   56}, { 248,   72}, { 232,  104}, { 216,  120}, { 200,  120}, { 200,  136},
        { 184,  152}, { 184,  168}, { 168,  168}, { 152,  168}, { 152,  152}, { 152,  136},
        { 168,  136}, { 168,  120}, { 168,  152}, { 200,  152}, { 216,  136}, { 232,  120},
        { 248,  120}, { 264,  104}, { 280,   88}, { 296,   72}, { 312,   72}, { 312,   56},
        { 328,   56}, { 344,   40}, { 360,   24}, { 376,    8}, { 360,    8}, { 344,   24},
        { 328,   24}, { 312,   24}, { 328,    8}, { 344,    8}, { 312,   40}, { 296,   40},
        { 296,   24}, { 328,   40}, { 296,   56}, { 280,   56}, { 232,   72}, { 216,   72},
        { 216,   88}, { 200,   88}, { 200,  104}, { 184,  104}, { 184,  120}, { 184,  136},
        { 216,  104}, { 248,  104}, { 264,   88}, { 280,   72}, { 264,   72}, { 248,   88},
        { 232,   88}, { 120,  248}, { 120,  264}, { 264,    8}, {1400,  584}, { 216,   40},
        { 232,   24}, { 248,    8}, {1032,  488}, {1048,  488}, {1288,  616}, {1304,  616},
        {1032,  520}, {1032,  504}, {1016,  488}, {1016,  472}, {1016,  504}, {1000,  472},
        { 984,  456}, { 968,  440}, {1160,  584}, {1176,  584}, {1192,  584}, {1208,  584},
        {1048,  520}, {1048,  504}, {1064,  504}, {1064,  520}, {1080,  520}, {1064,  536},
        {1080,  536}, {1080,  552}, {1096,  552}, {1112,  568}, {1128,  568}, {1112,  552},
        {1144,  568}, {1160,  568}, {1176,  568}, {1144,  552}, {1128,  552}, {1096,  536},
        {1112,  536}, {1256,  600}, {1240,  600}, {1224,  600}, {1208,  600}, {1144,  488},
        {1176,  504}, {1128,  472}, {1160,  488}, {1192,  504}, {1176,  488}, {1208,  504},
        {1224,  504}, {1240,  504}, {1144,  584}, {1112,  456}, { 184,  584}, { 200,  584},
        { 216,  584}, { 232,  584}, { 248,  584}, { 264,  584}, { 152,  600}, { 312,  600},
        { 312,  504}, { 328,  504}, {1272,    8}, {1256,   24}, { 360,  392}, { 680,  408},
        { 840,  312}, { 840,  296}, { 840,  280}, { 840,  264}, { 840,  248}, { 840,  232},
        { 856,  312}, { 856,  296}, { 856,  280}, { 856,  264}, { 856,  248}, { 856,  232},
        { 872,  312}, { 872,  296}, { 872,  280}, { 872,  232}, { 872,  248}, { 872,  264},
        { 328,  488}, { 328,  472}, { 328,  456}, { 328,  440}, { 328,  424}, { 328,  408},
        { 344,  408}, { 344,  424}, { 344,  440}, { 344,  456}, { 344,  472}, { 344,  488},
        { 344,  504}, { 360,  504}, { 360,  488}, { 360,  472}, { 360,  456}, { 360,  440},
        { 360,  424}, { 360,  408}, { 888,  248}, { 888,  264}, { 888,  280}, { 888,  296},
        { 888,  312}, { 312,  488}, { 312,  472}, { 312,  456}, { 312,  440}, { 312,  424},
        { 312,  408}, { 456,  360}, { 472,  360}, { 488,  344}, { 504,  344}, { 520,  344},
        { 520,  328}, { 536,  328}, { 552,  328}, { 552,  312}, { 568,  312}, { 568,  296},
        { 584,  296}, { 584,  280}, { 600,  280}, { 600,  264}, { 616,  264}, { 632,  264},
        { 632,  248}, { 648,  248}, { 648,  232}, { 664,  232}, { 664,  216}, { 680,  216},
        { 680,  200}, { 696,  200}, { 712,  200}, { 728,  200}, { 744,  200}, { 760,  200},
        { 792,  216}, { 808,  216}, { 776,  216}, { 760,  216}, { 744,  216}, { 664,  200},
        { 648,  216}, { 632,  232}, { 616,  248}, { 552,  296}, { 536,  312}, { 744,  104},
        { 712,  104}, { 712,   88}, { 696,   88}, { 680,   88}, { 664,   88}, { 664,  104},
        { 648,  104}, { 632,  104}, { 632,  120}, { 616,  120}, { 600,  120}, { 600,  136},
        { 584,  136}, { 568,  152}, { 552,  152}, { 552,  168}, { 536,  168}, { 616,  136},
        { 648,  120}, { 680,  104}, { 696,  104}, { 968,  312}, { 968,  296}, { 984,  296},
        { 984,  280}, { 984,  264}, { 984,  248}, {1016,  248}, {1016,  264}, {1016,  280},
        {1000,  296}, {1000,  312}, {1000,  328}, { 984,  312}, {1000,  280}, { 984,  328},
        {1000,  264}, {1000,  248}, { 952,  312}, { 952,  296}, { 968,  280}, { 968,  264},
        { 968,  248}, {1048,  376}, {1064,  392}, {1080,  408}, {1096,  424}, {1112,  440},
        {1112,  424}, {1096,  408}, {1000,  504}, {1000,  488}, { 984,  472}, { 968,  472},
        { 968,  456}, { 984,  488},
     }
}
objects["road:1"] = object

----

local object = {
    points = {
        {  -1,   -1}, { 680,  568}, { 696,  552}, { 712,  536}, { 664,  584}, { 696,  568},
        { 712,  552}, { 728,  536}, { 744,  536}, { 760,  536}, { 776,  536}, { 776,  552},
        { 792,  552}, { 808,  552}, { 824,  552}, { 840,  552}, { 856,  552}, { 856,  568},
        { 872,  568}, { 888,  568}, { 888,  584}, { 904,  584}, { 920,  584}, { 920,  600},
        { 936,  600}, { 936,  616}, { 952,  616}, { 968,  616}, { 968,  632}, { 984,  632},
        {1000,  632}, {1000,  648}, {1016,  648}, {1032,  648}, {1048,  664}, {1064,  664},
        {1080,  664}, {1096,  664}, {1112,  680}, {1128,  680}, {1144,  680}, {1144,  696},
        {1160,  696}, {1176,  696}, {1176,  712}, {1192,  712}, {1192,  728}, {1208,  728},
        {1224,  728}, {1224,  744}, {1240,  744}, {1256,  760}, {1240,  760}, {1016,  728},
        {1000,  728}, { 984,  728}, { 936,  712}, { 904,  696}, { 888,  680}, { 872,  680},
        { 872,  664}, { 856,  664}, { 840,  648}, { 824,  648}, { 808,  632}, { 744,  616},
        { 728,  616}, { 712,  616}, { 648,  600}, { 680,  584}, { 712,  568}, { 696,  584},
        { 696,  600}, { 680,  600}, { 664,  600}, { 712,  584}, { 728,  584}, { 728,  568},
        { 728,  552}, { 744,  552}, { 760,  552}, { 760,  568}, { 744,  568}, { 744,  584},
        { 728,  600}, { 712,  600}, { 744,  600}, { 760,  600}, { 776,  600}, { 776,  584},
        { 792,  584}, { 792,  568}, { 808,  568}, { 776,  568}, { 760,  584}, { 824,  568},
        { 840,  568}, { 872,  584}, { 904,  600}, { 920,  616}, { 952,  632}, { 968,  648},
        { 984,  648}, {1000,  664}, {1016,  664}, { 936,  632}, { 920,  632}, { 904,  616},
        { 888,  616}, { 888,  600}, { 872,  600}, { 856,  600}, { 840,  584}, { 824,  584},
        { 808,  584}, { 856,  584}, { 952,  648}, { 904,  632}, { 872,  616}, { 856,  616},
        { 840,  600}, { 824,  600}, { 808,  600}, { 792,  600}, { 760,  616}, { 776,  616},
        { 792,  616}, { 808,  616}, { 824,  616}, { 840,  616}, { 872,  632}, { 888,  632},
        { 920,  648}, { 936,  648}, { 968,  664}, { 984,  664}, {1000,  680}, { 984,  680},
        { 952,  664}, { 936,  664}, { 904,  648}, { 888,  648}, { 856,  632}, { 840,  632},
        { 824,  632}, { 856,  648}, { 872,  648}, { 888,  664}, { 904,  664}, { 904,  680},
        { 920,  680}, { 936,  680}, { 936,  696}, { 952,  696}, { 952,  712}, { 968,  712},
        { 920,  696}, { 920,  664}, { 952,  680}, { 968,  696}, { 984,  712}, {1000,  712},
        {1032,  728}, {1048,  728}, {1064,  728}, {1064,  744}, {1080,  744}, {1096,  744},
        {1128,  760}, {1144,  760}, {1160,  760}, {1176,  760}, {1192,  760}, {1208,  760},
        {1224,  760}, {1192,  744}, {1176,  744}, {1160,  744}, {1144,  744}, {1128,  744},
        {1112,  744}, {1208,  744}, {1080,  728}, {1096,  728}, {1112,  728}, {1128,  728},
        {1144,  728}, {1160,  728}, {1176,  728}, {1064,  712}, {1048,  712}, {1032,  712},
        {1016,  712}, {1080,  712}, {1096,  712}, {1112,  712}, {1128,  712}, {1144,  712},
        {1160,  712}, {1128,  696}, {1112,  696}, {1096,  696}, {1080,  696}, {1064,  696},
        {1048,  696}, {1032,  696}, {1016,  696}, {1000,  696}, { 984,  696}, {1096,  680},
        {1080,  680}, {1064,  680}, {1048,  680}, {1032,  680}, {1016,  680}, { 968,  680},
        {1032,  664}, {1112,  760},
     }
}
objects["road:2"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 235,
    y = 435,
}
objects["towerlocation:122"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 563,
    y = 383,
}
objects["towerlocation:136"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 984,
    y = 79,
}
objects["towerlocation:163"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 774.66666666667,
    y = 270,
}
objects["towerlocation:24"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 855,
    y = 472,
}
objects["towerlocation:25"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 1009,
    y = 567,
}
objects["towerlocation:26"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 674,
    y = 616,
}
objects["towerlocation:27"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 312,
    y = 626,
}
objects["towerlocation:30"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 465,
    y = 140,
}
objects["towerlocation:32"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 326,
    y = 229,
}
objects["towerlocation:35"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 652,
    y = 324,
}
objects["towerlocation:60"] = object

----

local object = {
    behaviors = {
        "CampBehavior",
        "CollisionBehavior",
        "DestroyedBehavior",
        "FireBehavior",
        "TowerBehavior",
        "TowerObjectEditorBehavior",
    },
    campId = 1,
    collisionEnabled = true,
    defineId = "160512",
    flipSprite = false,
    tag = 0,
    towerId = "160512",
    x = 909,
    y = 297,
}
objects["towerobject:179"] = object

----

local object = {
    behaviors = {
        "CampBehavior",
        "CollisionBehavior",
        "DecorateBehavior",
        "DestroyedBehavior",
        "FireBehavior",
        "TowerBehavior",
        "TowerObjectEditorBehavior",
    },
    campId = 1,
    collisionEnabled = true,
    decorationsMore = {
    },
    defineId = "160451",
    flipSprite = false,
    tag = 0,
    towerId = "160451",
    x = 423,
    y = 442,
}
objects["towerobject:36"] = object

----

local object = {
    behaviors = {
        "CampBehavior",
        "CollisionBehavior",
        "DecorateBehavior",
        "DestroyedBehavior",
        "FireBehavior",
        "TowerBehavior",
        "TowerObjectEditorBehavior",
    },
    campId = 1,
    collisionEnabled = true,
    decorationsMore = {
    },
    defineId = "160451",
    flipSprite = false,
    tag = 0,
    towerId = "160451",
    x = 1091,
    y = 278,
}
objects["towerobject:58"] = object

----

map.objects = objects

return map
