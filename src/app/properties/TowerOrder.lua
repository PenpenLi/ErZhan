
local TowerOrder = {}

local TowerOrder = {}

local defines = {
---------------1级图鉴-------------
    "160101",--箭塔lv1
    "160201",--战争古树lv2
    "160301",--魔法塔lv3

---------------2级图鉴-------------
    "160102",--箭塔lv1
    "160202",--战争古树lv2
    "160302",--魔法塔lv3

---------------3级图鉴-------------
    "160103",--箭塔lv1
    "160203",--战争古树lv2
    "160303",--魔法塔lv3

---------------分支图鉴-------------
    "160104",--箭塔lv1
    "160105",--箭塔lv1

    "160204",--战争古树lv2
    "160205",--战争古树lv2
     
    "160304",--魔法塔lv3
    "160305",--魔法塔lv3
}

function TowerOrder.get(i)
    return clone(defines[i])
end

function TowerOrder.getAll()
    return clone(defines)
end

return TowerOrder
