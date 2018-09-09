local DiamondProperties = {}

local defines = {
    {
        GoodsId    = 1,     -- 钻石1号柜台
        name       = "一堆钻石（6元）",
        money      = 6.00,     -- 购买的RMB价格，单位：元
        count      = 90,    -- 钻石数量（原价）
        addCount   = 0,     -- 钻石数量（内赠送）
        discount   = "",     -- 右上角斜角标
    },
    {
        GoodsId    = 2,      -- 钻石2号柜台
        name       = "一袋钻石（18元）",
        money      = 18.00,   -- 购买的RMB价格，单位：元
        count      = 300,    -- 钻石数量（原价）
        addCount   = 30,     -- 钻石数量（内赠送）
        discount   = "内赠30",     -- 右上角斜角标
    },
    {
        GoodsId    = 3,     -- 钻石3号柜台
        name       = "一箱钻石（30元）",
        money      = 30.00,     -- 购买的RMB价格，单位：元
        count      = 550,    -- 钻石数量（原价）
        addCount   = 100,    -- 钻石数量（内赠送）
        discount   = "内增100",     -- 右上角斜角标
    },
}

function DiamondProperties.get(i)
    return clone(defines[i])
end

function DiamondProperties.getAll()
    return clone(defines)
end

return DiamondProperties
