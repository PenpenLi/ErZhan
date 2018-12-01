
-- 通用卡牌简介配置

-- 侦察排
local card = {
    cardID            = "KP10001",    -- 卡牌id
    name              = "侦察排",
    country           = "国军",
    attack            = 0,    -- 攻击
    blood             = 3,    -- 血量
    attack_range      = 3,    -- 攻击范围
    cardType          = 1,    -- 兵种,{1,2,3,4} 分别表示步兵/炮兵/装甲/工事
    introduction      = "侦察排的简介",
    detail            = "侦察排的详细介绍",
}
defines["KP10001"] = card    -- 卡牌id

-- 29军大刀队
local card = {
    cardID            = "KP10002",    -- 卡牌id
    name              = "29军大刀队",
    country           = "国军",
    attack            = 0,    -- 攻击
    blood             = 4,    -- 血量
    attack_range      = 2,    -- 攻击范围
    cardType          = 1,    -- 兵种,{1,2,3,4} 分别表示步兵/炮兵/装甲/工事
    introduction      = "29军大刀队的简介",
    detail            = "29军大刀队的详细介绍",
}
defines["KP10002"] = card    -- 卡牌id

return CommonEffectData
