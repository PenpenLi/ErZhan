
local AchievementsProperties = {}

local defines = {}

---------------------------------关卡成就---------------------------------
local monster = {
    mainID            = "141203",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage3 on Normal",
    name_CN           = "第一次三星通关第三关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141203"] = monster

local monster = {
    mainID            = "141206",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage4 on Normal",
    name_CN           = "第一次三星通关第四关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141206"] = monster

local monster = {
    mainID            = "141210",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage5 on Normal",
    name_CN           = "第一次三星通关第五关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141210"] = monster

local monster = {
    mainID            = "141211",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage6 on Normal",
    name_CN           = "第一次三星通关第六关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141211"] = monster

local monster = {
    mainID            = "141212",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage7 on Normal",
    name_CN           = "第一次三星通关第七关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141212"] = monster

local monster = {
    mainID            = "141214",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage8 on Normal",
    name_CN           = "第一次三星通关第八关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        hero    = "110102", -- 奖励获得英雄
    },
}
defines["141214"] = monster

local monster = {
    mainID            = "141218",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage9 on Normal",
    name_CN           = "第一次三星通关第九关普通模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110203", -- 奖励获得英雄
    },
}
defines["141218"] = monster

local monster = {
    mainID            = "141230",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage3 on Difficult",
    name_CN           = "第一次三星通关第三关困难模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141230"] = monster

local monster = {
    mainID            = "141231",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage6 on Difficult",
    name_CN           = "第一次三星通关第六关困难模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141231"] = monster

local monster = {
    mainID            = "141232",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage9 on Difficult",
    name_CN           = "第一次三星通关第九关困难模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        hero    = "110301", -- 奖励获得英雄
    },
}
defines["141232"] = monster

local monster = {
    mainID            = "141233",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage10 on Difficult",
    name_CN           = "第一次三星通关第十二关困难模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110301", -- 奖励获得英雄
    },
}
defines["141233"] = monster

local monster = {
    mainID            = "141234",     -- 成就ID
    name_EN           = "Earn 3 Stars In Stage15 on Difficult",
    name_CN           = "第一次三星通关第十五关困难模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141234"] = monster

local monster = {
    mainID            = "141235",     -- 成就ID
    name_EN           = "Collect 18 Stars",
    name_CN           = "通关总星数达18星",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141235"] = monster

local monster = {
    mainID            = "141236",     -- 成就ID
    name_EN           = "Collect 36 Stars",
    name_CN           = "通关总星数达36星",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141236"] = monster

local monster = {
    mainID            = "141237",     -- 成就ID
    name_EN           = "Collect 54 Stars",
    name_CN           = "通关总星数达54星",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141237"] = monster

local monster = {
    mainID            = "141238",     -- 成就ID
    name_EN           = "Collect 72 Stars",
    name_CN           = "通关总星数达72星",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        hero    = "110205", -- 奖励获得英雄
    },
}
defines["141238"] = monster

local monster = {
    mainID            = "141239",     -- 成就ID
    name_EN           = "Collect 90 Stars",
    name_CN           = "通关总星数达90星",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141239"] = monster

local monster = {
    mainID            = "141240",     -- 成就ID
    name_EN           = "Complete Mode 2",
    name_CN           = "第一次通关第二模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141240"] = monster

local monster = {
    mainID            = "141241",     -- 成就ID
    name_EN           = "Complete Mode 3",
    name_CN           = "第一次通关第三模式",   -- 名字
    achieveType       = 1,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141241"] = monster

---------------------------------建造成就---------------------------------
local monster = {
    mainID            = "141201",     -- 成就ID
    name_EN           = "Unlock The Guard Tower Talent",
    name_CN           = "解锁箭塔天赋",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141201"] = monster

local monster = {
    mainID            = "141205",     -- 成就ID
    name_EN           = "The Lightning Ancient Talent",
    name_CN           = "解锁雷战争树天赋",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141205"] = monster

local monster = {
    mainID            = "141207",     -- 成就ID
    name_EN           = "Click All Tower Talents",
    name_CN           = "第一次点满防御塔天赋",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141207"] = monster

local monster = {
    mainID            = "141208",     -- 成就ID
    name_EN           = "The Elemental Tower Talent",
    name_CN           = "解锁元素塔天赋",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141208"] = monster

local monster = {
    mainID            = "141221",     -- 成就ID
    name_EN           = "Build 50 Towers",
    name_CN           = "建造50座防御塔",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141221"] = monster

local monster = {
    mainID            = "141222",     -- 成就ID
    name_EN           = "Build 100 Towers",
    name_CN           = "建造100座防御塔",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141222"] = monster

local monster = {
    mainID            = "141223",     -- 成就ID
    name_EN           = "Altar Plunder For 50 Times",
    name_CN           = "祭坛掠夺50次",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141223"] = monster

local monster = {
    mainID            = "141224",     -- 成就ID
    name_EN           = "Altar Plunder For 100 Times",
    name_CN           = "祭坛掠夺100次",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141224"] = monster

local monster = {
    mainID            = "141225",     -- 成就ID
    name_EN           = "Altar Recruitment For 50 Times",
    name_CN           = "祭坛招募50次",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141225"] = monster

local monster = {
    mainID            = "141226",     -- 成就ID
    name_EN           = "Altar Recruitment For 100 Times",
    name_CN           = "祭坛招募100次",   -- 名字
    achieveType       = 2,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141226"] = monster

---------------------------------杀戮成就---------------------------------
local monster = {
    mainID            = "141202",     -- 成就ID
    name_EN           = "Defeat The Dark Warlord",
    name_CN           = "击败恶魔统领",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141202"] = monster

local monster = {
    mainID            = "141209",     -- 成就ID
    name_EN           = "Defeat The Ancient Behemoth",
    name_CN           = "击败比蒙皇",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        hero    = "110204", -- 奖励获得英雄
    },
}
defines["141209"] = monster

local monster = {
    mainID            = "141216",     -- 成就ID
    name_EN           = "Defeat The Frost Wyrm",
    name_CN           = "击败冰霜巨龙",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110102", -- 奖励获得英雄
    },
}
defines["141216"] = monster

local monster = {
    mainID            = "141219",     -- 成就ID
    name_EN           = "Defeat The Knarama",
    name_CN           = "击败地狱炎魔",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141219"] = monster

local monster = {
    mainID            = "141220",     -- 成就ID
    name_EN           = "Defeat The Demara",
    name_CN           = "击败大恶魔",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141220"] = monster

local monster = {
    mainID            = "141227",     -- 成就ID
    name_EN           = "Kill 3000 Creeps",
    name_CN           = "击杀3000只小怪",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141227"] = monster

local monster = {
    mainID            = "141228",     -- 成就ID
    name_EN           = "Kill 5000 Creeps",
    name_CN           = "击杀5000只小怪",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141228"] = monster

local monster = {
    mainID            = "141229",     -- 成就ID
    name_EN           = "Kill 10000 Creeps",
    name_CN           = "击杀10000只小怪",   -- 名字
    achieveType       = 3,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141229"] = monster

---------------------------------英雄成就---------------------------------
local monster = {
    mainID            = "141204",     -- 成就ID
    name_EN           = "Get One Hero to Lvl. 3",
    name_CN           = "第一次将英雄升级到3级",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141204"] = monster

local monster = {
    mainID            = "141215",     -- 成就ID
    name_EN           = "Get One Hero to Lvl. 5",
    name_CN           = "第一次将英雄升级到5级",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141215"] = monster

local monster = {
    mainID            = "141213",     -- 成就ID
    name_EN           = "Get One Hero to Class 5",
    name_CN           = "任意一个英雄进到5阶",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141213"] = monster

local monster = {
    mainID            = "141217",     -- 成就ID
    name_EN           = "Collect 5 Heros",
    name_CN           = "获得5个英雄",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141217"] = monster

local monster = {
    mainID            = "141242",     -- 成就ID
    name_EN           = "Unlock Hero Kael",
    name_CN           = "获得英雄“凯尔”",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141242"] = monster

local monster = {
    mainID            = "141243",     -- 成就ID
    name_EN           = "Unlock Hero Selri",
    name_CN           = "获得英雄“赛尔瑞”",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141243"] = monster

local monster = {
    mainID            = "141244",     -- 成就ID
    name_EN           = "Unlock Hero Ellis",
    name_CN           = "获得英雄“爱丽丝”",   -- 名字
    achieveType       = 4,        -- 成就类型,1表示关卡,2表示建造,3表示杀戮,4表示英雄
    text              = "", -- 成就描述文字
    award             = {
        diamond = 0,       -- 奖励多少个钻石
        --hero    = "110204", -- 奖励获得英雄
    },
}
defines["141244"] = monster

function AchievementsProperties.get(i)
    return clone(defines[i])
end

function AchievementsProperties.getAll()
    return clone(defines)
end

return AchievementsProperties
