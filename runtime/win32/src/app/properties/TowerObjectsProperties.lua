
--[[--

定义了所有的塔基，包含特殊塔

]]

local MapConstants = require("app.map.MapConstants")

local TowerObjectsProperties = {}

local defines = {}

-------------------箭塔形象---------------------

local object = {
    classId     = "towerobject",             -- ObjectFactory中根据classId来新建static、rangeobject、path物体
    imageName   = {"tower/160101.csb", "tower/160102.csb", "tower/160103.csb", "tower/160104.csb", "tower/160105.csb"},
    radius      = 32,                               -- 碰撞检测的区域半径
    offsetX     = {0, 0, 0, 0, 0},                  -- 图像的横向偏移量，默认值为 0,可负值
    offsetY     = {-5, -5, -5, 5, 5},                        -- 图像的纵向偏移量，默认值为 0
    towerId     = "160101",               -- 根据towerId到TowerProperties中读取属性
    decorations = {"PlayerTower01Destroyed"},       -- 死亡的时候显示的图片
    behaviors   = {"TowerBehavior"},                -- 拥有的行为
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 20, 20, 20, 20},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 正面3点钟攻击点位置X
    fireOffsetY = {24, 24, 24, 30, 24},             -- 正面3点钟攻击点位置Y
    fireOffsetX2 = {0, 0, 0, 0, 0},                  -- 背面3点钟攻击点位置X
    fireOffsetY2 = {24, 24, 24, 38, 50},             -- 背面3点钟攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,         -- 所属阵营
}
defines["160101"] = object

---------------------炮塔形象--------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/160201.csb", "tower/160202.csb","tower/160203.csb","tower/160204.csb","tower/160205.csb"},
    radius      = 32,                               -- 碰撞检测的区域半径
    offsetX     = {0, 0, 0, 0, 0},                  -- 图像的横向偏移量，默认值为 0,可负值
    offsetY     = {-10, -10, -10, 0, 5},                        -- 图像的纵向偏移量，默认值为 0
    towerId     = "160201",               -- 根据towerId到TowerProperties中读取属性
    decorations = {"PlayerTower01Destroyed"},       -- 死亡的时候显示的图片
    behaviors   = {"TowerBehavior"},                -- 拥有的行为
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 20, 20, 20, 20},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 正面3点钟攻击点位置X
    fireOffsetY = {24, 24, 24, 80, 24},             -- 正面3点钟攻击点位置Y
    fireOffsetX2 = {0, 0, 0, 0, 0},                  -- 背面3点钟攻击点位置X
    fireOffsetY2 = {45, 45, 45, 80, 24},             -- 背面3点钟攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,         -- 所属阵营
}
defines["160201"] = object

------------------仙术塔形象-----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/160301.csb", "tower/160302.csb","tower/160303.csb","tower/160304.csb","tower/160305.csb"},
    radius      = 32,                               -- 碰撞检测的区域半径
    offsetX     = {0, 0, 0, 0, 0},                  -- 图像的横向偏移量，默认值为 0,可负值
    offsetY     = {0, 0, 0, 0, 0},                        -- 图像的纵向偏移量，默认值为 0
    towerId     = "160301",               -- 根据towerId到TowerProperties中读取属性
    decorations = {"PlayerTower01Destroyed"},       -- 死亡的时候显示的图片
    behaviors   = {"TowerBehavior"},                -- 拥有的行为
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 20, 20, 20, 20},                 --塔体积中心点Y轴偏移
    fireOffsetX = {40, 0, 0, 0, 0},                   -- 正面3点钟攻击点位置X
    fireOffsetY = {50, 12, 12, 60, 80},             -- 正面3点钟攻击点位置Y
    fireOffsetX2 = {40, 0, 0, 0, 0},                  -- 背面3点钟攻击点位置X
    fireOffsetY2 = {70, 55, 55, 60, 100},             -- 背面3点钟攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,         -- 所属阵营
}
defines["160301"] = object

-----------------------祭坛塔形象--------------------

-- local object = {
--     classId     = "towerobject",
--     imageName   = {"tower/altar1.png", "tower/altar2.png","tower/altar3.png","tower/altar4.png","tower/altar5.png",},
--     radius      = 32,
--     offsetX     = {-15, -16, -16, -16, -16},
--     offsetY     = {3, 3, 2, 3, 2},
--     towerId     = "160401",
--     decorations = {"PlayerTower02Destroyed"},
--     behaviors   = {"TowerBehavior"},
--     fireOffsetX = {0, 0, 0, 0, 0},
--     fireOffsetY = {24, 24, 24, 24, 24},
--     campId      = MapConstants.TOWER_CAMP,
-- }
-- defines["160401"] = object

------------------特色熔岩关卡熔岩柱-----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/160512.csb"},
    radius      = 15,
    offsetX     = {15},
    offsetY     = {-60},
    towerId     = "160512",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {10},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0010","A0011","A0012",
    },                          --配置特色塔在编辑器载入的关卡ID
}
defines["160512"] = object

-------------------特色雷电塔形象----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/lightning.png"},
    radius      = 32,
    offsetX     = {-15},
    offsetY     = {3},
    towerId     = "160501",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", "A0002","A0003","A0004","A0005","A0006","A0007","A0008",
        "A0009","A0010","A0011","A0012","A0013","A0014","A0015",
    },                          --配置特色塔在编辑器载入的关卡ID
}
defines["160501"] = object

-------------------特色树人塔形象----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/treeMan.png"},
    radius      = 32,
    offsetX     = {-15},
    offsetY     = {3},
    towerId     = "160502",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", "A0002","A0003","A0004","A0005","A0006","A0007","A0008",
        "A0009","A0010","A0011","A0012","A0013","A0014","A0015",
    },                            --配置特色塔在编辑器载入的关卡ID
}
defines["160502"] = object

-------------------特色流星女神塔形象----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/shootingStar.png"},
    radius      = 32,
    offsetX     = {-15},
    offsetY     = {3},
    towerId     = "160503",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", "A0002","A0003","A0004","A0005","A0006","A0007","A0008",
        "A0009","A0010","A0011","A0012","A0013","A0014","A0015",
    },                            --配置特色塔在编辑器载入的关卡ID
}
defines["160503"] = object

-------------------特色赠送祭坛塔形象----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160401",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160401"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160406",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0002",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160406"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160411",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0003",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160411"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160416",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0004",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160416"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160421",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0005",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160421"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160426",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0006",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160426"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160431",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0007",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160431"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160436",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0008",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160436"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160441",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0009",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160441"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160446",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0010",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160446"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160451",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0011",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160451"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160456",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0012",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160456"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160461",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0013",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160461"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160466",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0014",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160466"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160471",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0015",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        1,2,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160471"] = object
----------------------------第3模式祭坛塔--------------
local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160481",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0003",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160481"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160482",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0008",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160482"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160483",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0009",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160483"] = object


local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160484",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0011",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160484"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160485",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0012",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160485"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160486",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160486"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160487",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0002", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160487"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160488",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0004", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160488"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160489",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0005", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160489"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160490",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0006", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160490"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160491",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0013", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160491"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160492",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0007", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160492"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160493",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0014", 
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160493"] = object

local object = {
    classId     = "towerobject",
    imageName   = {"tower/jitan.csb"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160494",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {0, 0, 0, 0, 0},                -- 塔体积中心点X轴偏移
    radiusOffsetY = {20, 0, 0, 0, 0},                 --塔体积中心点Y轴偏移
    fireOffsetX = {0, 0, 0, 0, 0},                   -- 攻击点位置X
    fireOffsetY = {0, 0, 0, 0, 0},             -- 攻击点位置Y
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0010",
    },                            --配置特色塔在编辑器载入的关卡ID
    modeID         = {
        3,
    },                            --配置特色塔在编辑器载入的模式ID
}
defines["160494"] = object
-------------------特色跟踪炮塔形象----------------------

local object = {
    classId     = "towerobject",
    imageName   = {"tower/tracking.png"},
    radius      = 32,
    offsetX     = {-15},
    offsetY     = {3},
    towerId     = "160505",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", "A0002","A0003","A0004","A0005","A0006","A0007","A0008",
        "A0009","A0010","A0011","A0012","A0013","A0014","A0015",
    },                            --配置特色塔在编辑器载入的关卡ID
}
defines["160505"] = object

-------------------特色扩散活树塔形象----------------------
local object = {
    classId     = "towerobject",
    imageName   = {"tower/firetree.png"},
    radius      = 32,
    offsetX     = {-15},
    offsetY     = {3},
    towerId     = "160506",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0001", "A0002","A0003","A0004","A0005","A0006","A0007","A0008",
        "A0009","A0010","A0011","A0012","A0013","A0014","A0015",
    },                            --配置特色塔在编辑器载入的关卡ID
}
defines["160506"] = object

-------------------特色慢速中式炮塔形象----------------------
local object = {
    classId     = "towerobject",
    imageName   = {"tower/stone.png"},
    radius      = 32,
    offsetX     = {0},
    offsetY     = {3},
    towerId     = "160511",
    decorations = {"PlayerTower02Destroyed"},
    behaviors   = {"TowerBehavior"},
    radiusOffsetX = {10, 0, 0, 0, 0},                --怪物体积中心点X轴偏移
    radiusOffsetY = {3, 0, 0, 0, 0},                 --怪物体积中心点Y轴偏移
    fireOffsetX = {0},
    fireOffsetY = {24},
    campId      = MapConstants.TOWER_CAMP,
    mapID         = {
        "A0010",
    },                            --配置特色塔在编辑器载入的关卡ID
}
defines["160511"] = object
----------------------------------------

local object = {
    classId     = "towerlocation",----------塔基
    imageName   = "tower/towerLocation.png",
    radius      = 32,
    offsetX     = 0,
    offsetY     = 0,
    behaviors   = {"TowerLocationBehavior"},        -- 拥有的行为
    campId      = MapConstants.NO_CAMP,         -- 所属阵营
}
defines["TowerLocation01"] = object

----------------------------------------


-- 返回所有key组成的一个table
function TowerObjectsProperties.getAllIds()
    local keys = table.keys(defines)
    table.sort(keys)
    return keys
end

function TowerObjectsProperties.get(defineId)
    assert(defines[defineId], string.format("TowerObjectsProperties.get() - invalid defineId %s", tostring(defineId)))
    return clone(defines[defineId])
end

function TowerObjectsProperties.getAll()
    -- print("TowerObjectsProperties.getAll()")
    return defines
end


function TowerObjectsProperties.isExists(defineId)
    return defines[defineId] ~= nil
end

return TowerObjectsProperties
