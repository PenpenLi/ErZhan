
------------ MAP A0006 ------------

local map = {}

map.size = {width = 1434, height = 768}
map.imageName = "mapBg/MapA0006Bg.jpg"

local objects = {}

local object = {
    points = {
        {1490,  328}, {1338,  314}, {1159,  267}, { 953,  185}, { 769,  130}, { 553,   87},
        { 395,  112}, { 296,  187}, { 283,  291}, { 343,  393}, { 438,  454}, { 542,  458},
        { 653,  429}, { 843,  425}, { 913,  458}, { 949,  511}, { 960,  585}, { 923,  623},
        { 810,  664}, { 696,  685}, { 564,  722}, { 465,  796},
     }
}
objects["path:1"] = object

----

local object = {
    points = {
        {1488,  353}, {1331,  345}, {1149,  292}, { 939,  212}, { 759,  155}, { 558,  114},
        { 410,  135}, { 323,  198}, { 311,  294}, { 367,  384}, { 445,  432}, { 541,  429},
        { 656,  398}, { 846,  400}, { 931,  434}, { 979,  500}, { 991,  585}, { 953,  641},
        { 819,  689}, { 696,  711}, { 604,  736}, { 494,  808},
     }
}
objects["path:2"] = object

----

local object = {
    points = {
        {1486,  379}, {1329,  372}, {1133,  312}, { 931,  237}, { 753,  183}, { 557,  141},
        { 417,  159}, { 347,  211}, { 336,  296}, { 389,  371}, { 452,  407}, { 546,  405},
        { 651,  379}, { 849,  375}, { 953,  411}, {1009,  493}, {1015,  580}, { 971,  655},
        { 831,  711}, { 691,  735}, { 637,  749}, { 549,  816},
     }
}
objects["path:3"] = object

----

local object = {
    addGold = 100,
    campId = 3,
    canClick = true,
    checkCD = 10,
    checkWave = {
        1,
        3,
        5,
        7,
    },
    dayeType = 5,
    defineId = "6",
    flipSprite = false,
    gateId = 0,
    imageName = "daye/810118.csb",
    offsetY = 0,
    pathIds = {
    },
    radius = 40,
    radiusOffsetY = 0,
    random = 100,
    rangeType = 13,
    skillId = 0,
    tag = 0,
    x = 287,
    y = 546,
}
objects["rangeobject:105"] = object

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
    radius = 47,
    radiusOffsetY = 0,
    rangeType = 1,
    tag = 0,
    x = 1465,
    y = 355,
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
    radius = 64,
    radiusOffsetY = 0,
    rangeType = 2,
    tag = 0,
    x = 506,
    y = 822,
}
objects["rangeobject:22"] = object

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
    x = 749,
    y = 396,
}
objects["rangeobject:23"] = object

----

local object = {
    isDefault = true,
    points = {
        {  -1,   -1}, {1432,  392}, {1432,  376}, {1432,  360}, {1432,  344}, {1416,  344},
        {1416,  328}, {1416,  312}, {1432,  312}, {1432,  328}, {1400,  312}, {1384,  312},
        {1368,  312}, {1352,  312}, {1336,  312}, {1320,  312}, {1304,  312}, {1288,  296},
        {1272,  296}, {1256,  296}, {1224,  280}, {1192,  264}, {1176,  264}, {1144,  248},
        {1112,  232}, {1096,  232}, {1064,  216}, {1048,  216}, {1016,  200}, {1000,  200},
        { 984,  200}, { 968,  184}, { 952,  184}, { 936,  184}, { 920,  168}, { 904,  168},
        { 888,  168}, { 856,  152}, { 840,  152}, { 824,  152}, { 808,  152}, { 792,  152},
        { 792,  136}, { 776,  136}, { 760,  136}, { 744,  136}, { 728,  136}, { 712,  136},
        { 696,  136}, { 696,  120}, { 680,  120}, { 664,  120}, { 648,  120}, { 632,  120},
        { 616,  120}, { 600,  120}, { 584,  120}, { 568,  120}, { 552,  120}, { 536,  120},
        { 520,  120}, { 504,  120}, { 504,  136}, { 488,  136}, { 472,  136}, { 456,  136},
        { 440,  152}, { 424,  152}, { 408,  152}, { 408,  168}, { 392,  168}, { 376,  168},
        { 376,  184}, { 360,  200}, { 360,  216}, { 344,  216}, { 344,  232}, { 344,  248},
        { 344,  264}, { 344,  280}, { 344,  296}, { 344,  312}, { 344,  328}, { 360,  328},
        { 360,  344}, { 376,  344}, { 376,  360}, { 376,  376}, { 392,  376}, { 392,  392},
        { 408,  392}, { 424,  392}, { 424,  408}, { 440,  408}, { 456,  408}, { 456,  424},
        { 472,  424}, { 472,  440}, { 488,  440}, { 504,  440}, { 504,  456}, { 520,  456},
        { 536,  456}, { 904,  488}, { 920,  488}, { 936,  488}, { 936,  504}, { 952,  504},
        { 952,  520}, { 968,  520}, { 968,  536}, { 968,  552}, { 984,  552}, { 984,  568},
        { 984,  584}, { 968,  584}, { 968,  600}, { 952,  600}, { 952,  616}, { 936,  616},
        { 936,  632}, { 920,  632}, { 904,  632}, { 904,  648}, { 888,  648}, { 872,  648},
        { 856,  648}, { 840,  648}, { 840,  664}, { 824,  664}, { 808,  664}, { 792,  664},
        { 776,  664}, { 760,  664}, { 744,  664}, { 728,  680}, { 712,  680}, { 696,  680},
        { 680,  680}, { 664,  680}, { 648,  680}, { 632,  680}, { 616,  696}, { 600,  696},
        { 584,  696}, { 568,  696}, { 552,  712}, { 536,  712}, { 520,  712}, { 504,  712},
        { 504,  728}, { 488,  728}, { 472,  728}, { 472,  744}, { 456,  744}, { 456,  760},
        { 472,  760}, { 680,  744}, { 696,  744}, { 712,  744}, { 920,  408}, { 712,  200},
        { 728,  200}, { 744,  200}, { 776,  216}, { 824,  232}, { 840,  232}, { 872,  248},
        { 888,  248}, { 904,  248}, { 920,  264}, { 936,  264}, { 952,  264}, { 968,  264},
        { 968,  280}, { 984,  280}, {1000,  280}, {1016,  280}, {1016,  296}, {1032,  296},
        {1048,  296}, {1064,  296}, {1080,  312}, {1096,  312}, {1112,  312}, {1112,  328},
        {1128,  328}, {1144,  328}, {1160,  344}, {1176,  344}, {1192,  344}, {1208,  360},
        {1224,  360}, {1256,  376}, {1272,  376}, {1304,  392}, {1320,  392}, {1336,  392},
        {1352,  392}, {1368,  392}, {1416,  376}, {1416,  360}, {1416,  392}, {1400,  392},
        {1384,  392}, {1352,  376}, {1336,  376}, {1320,  376}, {1304,  376}, {1288,  376},
        {1368,  376}, {1384,  376}, {1400,  376}, {1368,  360}, {1352,  360}, {1336,  360},
        {1320,  360}, {1304,  360}, {1288,  360}, {1272,  360}, {1384,  360}, {1400,  360},
        {1400,  344}, {1384,  344}, {1368,  344}, {1368,  328}, {1352,  328}, {1336,  328},
        {1320,  328}, {1304,  328}, {1288,  328}, {1272,  328}, {1256,  328}, {1240,  328},
        {1272,  344}, {1288,  344}, {1304,  344}, {1320,  344}, {1336,  344}, {1352,  344},
        {1400,  328}, {1384,  328}, {1288,  312}, {1272,  312}, {1256,  312}, {1240,  312},
        {1224,  312}, {1224,  328}, {1256,  344}, {1256,  360}, {1240,  360}, {1064,  312},
        {1208,  344}, {1224,  344}, {1240,  344}, {1208,  328}, {1224,  296}, {1208,  296},
        {1192,  296}, {1240,  296}, {1176,  296}, {1160,  296}, {1144,  296}, {1144,  312},
        {1160,  312}, {1176,  312}, {1192,  312}, {1192,  328}, {1160,  328}, {1176,  328},
        {1208,  312}, {1192,  280}, {1208,  280}, {1176,  280}, {1160,  280}, {1144,  280},
        {1128,  280}, {1112,  280}, {1096,  280}, {1128,  296}, {1128,  312}, {1160,  264},
        {1144,  264}, {1128,  264}, {1112,  264}, {1112,  248}, {1096,  248}, {1080,  248},
        {1064,  248}, {1128,  248}, {1096,  296}, {1080,  296}, {1064,  280}, {1080,  280},
        {1112,  296}, {1096,  264}, {1080,  264}, {1064,  264}, {1048,  264}, {1032,  264},
        {1048,  280}, {1032,  280}, {1048,  248}, {1080,  232}, {1064,  232}, {1048,  232},
        {1032,  232}, {1016,  232}, {1000,  216}, { 984,  216}, {1016,  216}, {1032,  216},
        {1032,  248}, {1016,  248}, {1000,  248}, { 984,  248}, { 984,  264}, {1000,  264},
        {1016,  264}, {1000,  232}, { 984,  232}, { 968,  232}, { 952,  232}, { 936,  232},
        { 920,  232}, { 904,  232}, { 888,  232}, { 872,  232}, { 856,  232}, { 920,  248},
        { 936,  248}, { 952,  248}, { 968,  248}, { 968,  216}, { 968,  200}, { 952,  200},
        { 936,  200}, { 920,  200}, { 904,  200}, { 888,  200}, { 872,  200}, { 872,  184},
        { 856,  184}, { 840,  184}, { 824,  184}, { 808,  184}, { 792,  184}, { 776,  184},
        { 760,  184}, { 744,  184}, { 760,  200}, { 776,  200}, { 792,  200}, { 808,  200},
        { 808,  216}, { 824,  216}, { 840,  216}, { 856,  216}, { 872,  216}, { 888,  216},
        { 904,  216}, { 920,  216}, { 936,  216}, { 952,  216}, { 792,  216}, { 824,  200},
        { 840,  200}, { 856,  200}, { 920,  184}, { 904,  184}, { 888,  184}, { 856,  168},
        { 872,  168}, { 840,  168}, { 824,  168}, { 808,  168}, { 792,  168}, { 776,  152},
        { 760,  152}, { 744,  152}, { 728,  152}, { 712,  152}, { 696,  152}, { 680,  152},
        { 664,  152}, { 648,  152}, { 632,  152}, { 632,  136}, { 648,  136}, { 664,  136},
        { 680,  136}, { 616,  136}, { 600,  136}, { 584,  136}, { 568,  136}, { 552,  136},
        { 536,  136}, { 520,  136}, { 488,  152}, { 472,  152}, { 456,  152}, { 424,  168},
        { 392,  184}, { 376,  200}, { 360,  232}, { 360,  296}, { 360,  312}, { 376,  328},
        { 376,  312}, { 360,  280}, { 392,  200}, { 424,  184}, { 520,  152}, { 536,  152},
        { 552,  152}, { 568,  152}, { 584,  152}, { 600,  152}, { 616,  152}, { 776,  168},
        { 760,  168}, { 744,  168}, { 728,  168}, { 712,  168}, { 696,  168}, { 680,  168},
        { 664,  168}, { 648,  168}, { 632,  168}, { 616,  168}, { 600,  168}, { 504,  152},
        { 456,  168}, { 440,  168}, { 408,  184}, { 376,  216}, { 680,  184}, { 696,  184},
        { 712,  184}, { 728,  184}, { 392,  344}, { 392,  360}, { 408,  360}, { 408,  376},
        { 424,  376}, { 440,  376}, { 440,  392}, { 456,  392}, { 488,  392}, { 472,  392},
        { 472,  408}, { 504,  392}, { 504,  408}, { 488,  408}, { 488,  424}, { 568,  408},
        { 552,  408}, { 536,  408}, { 520,  408}, { 584,  408}, { 600,  408}, { 504,  424},
        { 520,  424}, { 536,  424}, { 552,  424}, { 568,  424}, { 584,  424}, { 600,  424},
        { 616,  424}, { 616,  440}, { 584,  440}, { 552,  440}, { 536,  440}, { 520,  440},
        { 568,  440}, { 600,  440}, { 616,  456}, { 600,  456}, { 584,  456}, { 568,  456},
        { 552,  456}, { 616,  408}, { 632,  408}, { 648,  408}, { 664,  408}, { 680,  408},
        { 696,  408}, { 712,  408}, { 728,  408}, { 744,  408}, { 760,  408}, { 872,  408},
        { 856,  408}, { 840,  408}, { 808,  408}, { 792,  408}, { 776,  408}, { 824,  408},
        { 888,  408}, { 904,  408}, { 920,  424}, { 904,  424}, { 888,  424}, { 872,  424},
        { 856,  424}, { 840,  424}, { 824,  424}, { 808,  424}, { 792,  424}, { 776,  424},
        { 760,  424}, { 744,  424}, { 728,  424}, { 712,  424}, { 696,  424}, { 680,  424},
        { 664,  424}, { 648,  424}, { 632,  424}, { 632,  440}, { 648,  440}, { 664,  440},
        { 680,  440}, { 696,  440}, { 712,  440}, { 728,  440}, { 744,  440}, { 760,  440},
        { 776,  440}, { 792,  440}, { 808,  440}, { 824,  440}, { 904,  440}, { 872,  440},
        { 856,  440}, { 840,  440}, { 888,  440}, { 920,  440}, { 920,  456}, { 904,  456},
        { 888,  456}, { 872,  456}, { 856,  456}, { 888,  472}, { 904,  472}, { 920,  472},
        { 936,  472}, { 952,  472}, { 968,  488}, { 984,  488}, {1000,  488}, {1000,  504},
        {1016,  520}, {1016,  552}, {1016,  536}, {1000,  520}, { 984,  504}, { 952,  488},
        { 984,  520}, {1000,  536}, {1016,  568}, {1016,  584}, {1000,  552}, { 968,  504},
        { 984,  536}, { 968,  472}, { 952,  456}, { 936,  440}, { 936,  424}, { 936,  456},
        { 952,  440}, { 952,  424}, { 968,  440}, { 984,  472}, { 968,  456}, {1000,  568},
        {1000,  584}, {1000,  600}, {1016,  600}, { 904,  696}, { 888,  696}, { 856,  712},
        { 840,  712}, { 824,  712}, { 808,  712}, { 792,  712}, { 776,  712}, { 760,  712},
        { 744,  712}, { 728,  712}, { 712,  728}, { 696,  728}, { 680,  728}, { 664,  728},
        { 648,  728}, { 632,  728}, { 616,  744}, { 600,  744}, { 584,  744}, { 568,  744},
        { 552,  744}, { 536,  744}, { 520,  744}, { 504,  744}, { 488,  760}, { 504,  760},
        { 520,  760}, { 536,  760}, { 552,  760}, { 488,  744}, { 632,  744}, { 648,  744},
        { 664,  744}, { 600,  728}, { 584,  728}, { 552,  728}, { 536,  728}, { 520,  728},
        { 568,  728}, { 616,  728}, { 600,  712}, { 584,  712}, { 568,  712}, { 552,  696},
        { 616,  712}, { 632,  712}, { 648,  712}, { 664,  712}, { 680,  712}, { 696,  712},
        { 712,  712}, { 712,  696}, { 696,  696}, { 680,  696}, { 664,  696}, { 648,  696},
        { 632,  696}, { 728,  696}, { 744,  696}, { 760,  696}, { 776,  696}, { 792,  696},
        { 808,  696}, { 824,  696}, { 840,  696}, { 856,  696}, { 872,  696}, { 840,  680},
        { 808,  680}, { 792,  680}, { 776,  680}, { 760,  680}, { 744,  680}, { 824,  680},
        { 856,  680}, { 872,  680}, { 888,  680}, { 904,  680}, { 920,  680}, { 920,  664},
        { 904,  664}, { 888,  664}, { 872,  664}, { 856,  664}, { 936,  664}, { 952,  664},
        { 952,  648}, { 920,  648}, { 936,  648}, { 968,  648}, { 984,  648}, {1000,  632},
        { 984,  632}, { 968,  632}, { 952,  632}, {1016,  616}, {1000,  616}, { 984,  616},
        { 968,  616}, { 984,  600}, { 744,  728}, { 728,  728}, { 760,  728}, { 776,  728},
        { 616,  680}, { 712,  664}, { 728,  664}, { 824,  648}, { 888,  632}, { 920,  616},
        { 680,  664}, { 696,  664}, { 760,  648}, { 776,  648}, { 792,  648}, { 808,  648},
        { 856,  632}, { 872,  632}, { 904,  616}, { 920,  600}, { 936,  568}, { 936,  552},
        { 936,  536}, { 920,  520}, { 904,  504}, { 920,  504}, { 936,  520}, { 952,  536},
        { 952,  552}, { 952,  568}, { 952,  584}, { 936,  584}, { 936,  600}, { 968,  568},
        {1016,  504}, {1000,  472}, { 984,  456}, { 936,  680}, { 920,  696}, { 952,  680},
        { 968,  664}, { 792,  728}, { 488,  712}, { 568,  760}, { 584,  760}, {1000,  648},
        { 536,  472}, { 520,  472}, { 504,  472}, { 488,  472}, { 472,  472}, { 456,  472},
        { 440,  472}, { 424,  456}, { 408,  456}, { 392,  440}, { 376,  440}, { 376,  424},
        { 360,  424}, { 360,  408}, { 344,  408}, { 344,  392}, { 328,  392}, { 328,  376},
        { 312,  376}, { 312,  360}, { 312,  344}, { 296,  344}, { 296,  328}, { 296,  312},
        { 296,  296}, { 296,  280}, { 296,  264}, { 296,  248}, { 296,  232}, { 296,  216},
        { 312,  216}, { 312,  200}, { 312,  184}, { 328,  184}, { 328,  168}, { 344,  168},
        { 344,  152}, { 360,  152}, { 360,  136}, { 376,  136}, { 376,  120}, { 392,  120},
        { 408,  120}, { 408,  104}, { 424,  104}, { 440,  104}, { 456,  104}, { 456,   88},
        { 472,   88}, { 488,   88}, { 504,   88}, { 520,   88}, { 536,   88}, { 552,   88},
        { 568,   88}, { 584,   88}, { 600,   88}, { 600,  104}, { 616,  104}, { 632,  104},
        { 296,  360}, { 280,  328}, { 280,  312}, { 280,  296}, { 264,  280}, { 264,  264},
        { 264,  248}, { 280,  216}, { 280,  200}, { 280,  184}, { 296,  184}, { 296,  168},
        { 312,  168}, { 312,  152}, { 328,  152}, { 344,  136}, { 424,  120}, { 472,  104},
        { 488,  104}, { 504,  104}, { 520,  104}, { 536,  104}, { 552,  104}, { 568,  104},
        { 584,  104}, { 648,  104}, { 664,  104}, { 488,  120}, { 472,  120}, { 456,  120},
        { 440,  120}, { 424,  136}, { 408,  136}, { 392,  136}, { 392,  152}, { 376,  152},
        { 360,  168}, { 296,  200}, { 280,  232}, { 280,  248}, { 280,  264}, { 280,  280},
        { 312,  328}, { 328,  344}, { 328,  360}, { 344,  360}, { 344,  376}, { 360,  392},
        { 376,  392}, { 376,  408}, { 392,  408}, { 392,  424}, { 408,  424}, { 408,  440},
        { 424,  440}, { 440,  440}, { 440,  456}, { 456,  456}, { 472,  456}, { 488,  456},
        { 456,  440}, { 424,  424}, { 440,  424}, { 408,  408}, { 360,  360}, { 344,  344},
        { 328,  328}, { 328,  312}, { 312,  312}, { 312,  296}, { 312,  280}, { 328,  232},
        { 328,  248}, { 328,  264}, { 328,  280}, { 328,  296}, { 312,  232}, { 328,  216},
        { 312,  264}, { 312,  248}, { 328,  200}, { 344,  184}, { 360,  184}, { 344,  200},
        { 360,  376}, { 440,  136}, { 712,  120}, { 680,  104}, {1016,  488}, {1000,  456},
        { 984,  440}, { 984,  424}, { 968,  424}, { 968,  408}, { 952,  408}, { 936,  392},
        { 920,  392}, { 920,  376}, { 904,  376}, { 888,  376}, { 872,  376}, { 856,  376},
        { 840,  360}, { 824,  360}, { 808,  360}, { 792,  360}, { 792,  376}, { 776,  376},
        { 760,  376}, { 744,  376}, { 728,  376}, { 712,  376}, { 696,  376}, { 680,  376},
        { 664,  376}, { 648,  376}, { 632,  376}, { 616,  376}, { 600,  376}, { 600,  392},
        { 584,  392}, { 568,  392}, { 552,  392}, { 520,  392}, { 536,  392}, { 616,  392},
        { 728,  360}, { 744,  360}, { 760,  360}, { 776,  360}, { 936,  408}, { 888,  392},
        { 872,  392}, { 856,  392}, { 904,  392}, { 840,  376}, { 824,  376}, { 808,  376},
        { 696,  392}, { 680,  392}, { 664,  392}, { 648,  392}, { 632,  392}, { 712,  392},
        { 728,  392}, { 744,  392}, { 760,  392}, { 776,  392}, { 792,  392}, { 808,  392},
        { 824,  392}, { 840,  392}, { 584,  376}, { 712,  360}, { 696,  360}, { 680,  360},
        { 664,  360}, { 552,  472}, { 952,  392}, { 600,  760}, { 616,  760}, { 632,  760},
        { 648,  760}, { 664,  760}, { 728,  744}, { 744,  744}, { 760,  744}, { 808,  728},
        { 824,  728}, { 840,  728}, { 872,  712}, { 888,  712}, { 440,  760}, { 424,  760},
        { 424,  472}, { 392,  456}, { 344,  424}, { 328,  408}, { 360,  264}, { 360,  248},
        { 328,  136}, { 360,  120}, { 392,  104}, { 376,  104}, { 344,  120}, { 440,   88},
        { 488,   72}, { 504,   72}, { 520,   72}, { 536,   72}, { 552,   72}, { 568,   72},
        { 584,   72}, { 616,   88}, { 632,   88}, { 696,  104}, { 728,  120}, { 744,  120},
        { 760,  120}, { 712,  104}, { 776,  120}, { 792,  120}, { 808,  136}, { 824,  136},
        { 872,  152}, { 888,  152}, { 904,  152}, { 936,  168}, { 952,  168}, { 984,  184},
        {1000,  184}, {1032,  200}, {1080,  216}, { 840,  136}, { 856,  136}, { 872,  136},
        {1240,  280}, {1256,  280}, {1272,  280}, {1304,  296}, {1320,  296}, {1208,  264},
        { 424,   88}, { 648,   88}, {1160,  248}, {1048,  200}, {1016,  184}, { 920,  152},
        { 728,  104}, { 664,   88}, { 664,  184}, { 584,  168}, { 472,   72}, { 408,   88},
        { 456,   72}, { 856,  360}, {1032,  568}, {1032,  552}, {1032,  536}, {1032,  520},
        {1032,  584}, { 984,  664}, { 968,  680}, { 936,  696}, { 904,  712}, { 856,  728},
        { 680,  760}, { 936,  376}, { 952,  360}, { 952,  344}, { 968,  344}, { 968,  328},
        { 968,  312}, { 984,  312}, { 984,  296}, {1000,  296}, {1016,  312}, {1000,  328},
        {1000,  344}, { 984,  344}, { 984,  360}, { 984,  376}, { 968,  376}, { 968,  392},
        { 968,  360}, { 952,  376}, { 936,  360}, { 984,  328}, {1000,  312}, {1128,  344},
        {1176,  360}, {1192,  360}, {1144,  344}, {1032,  504}, { 792,  344}, { 808,  344},
        { 808,  328}, { 808,  312}, { 824,  312}, { 824,  296}, { 824,  280}, { 840,  264},
        { 840,  248}, { 840,  344}, { 856,  344}, { 856,  328}, { 856,  312}, { 856,  296},
        { 872,  296}, { 872,  280}, { 872,  264}, { 856,  248}, { 856,  264}, { 840,  280},
        { 856,  280}, { 840,  296}, { 840,  312}, { 840,  328}, { 824,  328}, { 824,  344},
        { 824,  248}, { 824,  264}, { 664,  664}, { 680,  568}, { 584,  472}, { 568,  472},
        { 648,  664}, { 600,  680}, { 696,  200}, { 728,  216}, { 744,  216}, { 472,  168},
        { 488,  168}, { 536,  168}, { 552,  168}, { 568,  168}, { 584,  680},
     }
}
objects["road:1"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 837,
    y = 521,
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
    x = 1044,
    y = 354,
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
    x = 908,
    y = 90,
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
    x = 234,
    y = 392,
}
objects["towerlocation:31"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 451,
    y = 540,
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
    x = 225,
    y = 129,
}
objects["towerlocation:37"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 462,
    y = 263,
}
objects["towerlocation:54"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 678,
    y = 259,
}
objects["towerlocation:56"] = object

----

local object = {
    behaviors = {
        "TowerLocationBehavior",
        "TowerLocationEditorBehavior",
    },
    defineId = "TowerLocation01",
    radius = 35,
    tag = 0,
    x = 664,
    y = 551,
}
objects["towerlocation:58"] = object

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
    defineId = "160426",
    flipSprite = false,
    tag = 0,
    towerId = "160426",
    x = 910,
    y = 307,
}
objects["towerobject:38"] = object

----

map.objects = objects

return map
