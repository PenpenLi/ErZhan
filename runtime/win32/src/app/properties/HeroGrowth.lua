
local HeroGrowth = {}

local defines = {}

hero = {
	-- 齐天大圣1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 18,        -- 护甲
			maxHp             = 178,       -- 最大 HP
			attack            = 38,         -- 攻击力
			critical          = 600,       -- 暴击率。值代表10%
			restoreHp         = 45,        -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 29,        -- 护甲
			maxHp             = 196,     -- 最大 HP
			attack            = 47,        -- 攻击力
			critical          = 606,     -- 暴击率。值代表10%
			restoreHp         = 49,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 46,        -- 护甲
			maxHp             = 216,       -- 最大 HP
			attack            = 55,        -- 攻击力
			critical          = 612,       -- 暴击率。值代表10%
			restoreHp         = 54,        -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 74,        -- 护甲
			maxHp             = 237,     -- 最大 HP
			attack            = 63,        -- 攻击力
			critical          = 618,     -- 暴击率。值代表10%
			restoreHp         = 59,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 118,        -- 护甲
			maxHp             = 261,     -- 最大 HP
			attack            = 71,        -- 攻击力
			critical          = 624,     -- 暴击率。值代表10%
			restoreHp         = 65,       -- 生命回复/波
		},
	},
	-- 齐天大圣2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 24,        -- 护甲
			maxHp             = 278,       -- 最大 HP
			attack            = 8.7,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 28,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 38.4,        -- 护甲
			maxHp             = 306,     -- 最大 HP
			attack            = 9.5,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 31,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 61.5,        -- 护甲
			maxHp             = 337,     -- 最大 HP
			attack            = 10.3,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 34,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 98.4,        -- 护甲
			maxHp             = 370,     -- 最大 HP
			attack            = 11.3,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 37,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 157.5,        -- 护甲
			maxHp             = 407,     -- 最大 HP
			attack            = 12.3,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 41,       -- 生命回复/波
		},
	},
    -- 齐天大圣3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 28,        -- 护甲
			maxHp             = 434,     -- 最大 HP
			attack            = 13.6,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 43,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 44.8,        -- 护甲
			maxHp             = 478,     -- 最大 HP
			attack            = 14.8,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 48,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 71.7,        -- 护甲
			maxHp             = 526,     -- 最大 HP
			attack            = 16.2,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 53,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 114.8,        -- 护甲
			maxHp             = 578,     -- 最大 HP
			attack            = 17.6,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 58,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 183.7,        -- 护甲
			maxHp             = 636,     -- 最大 HP
			attack            = 19.2,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 64,       -- 生命回复/波
		},
	},
    -- 齐天大圣4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 32,        -- 护甲
			maxHp             = 678,     -- 最大 HP
			attack            = 21.3,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 68,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 51.2,        -- 护甲
			maxHp             = 746,     -- 最大 HP
			attack            = 29.1,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 75,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 82,        -- 护甲
			maxHp             = 821,     -- 最大 HP
			attack            = 31.6,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 82,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 131.2,        -- 护甲
			maxHp             = 903,     -- 最大 HP
			attack            = 34.5,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 90,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 210,        -- 护甲
			maxHp             = 993,     -- 最大 HP
			attack            = 37.5,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 99,       -- 生命回复/波
		},
	},
    -- 齐天大圣5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 36,        -- 护甲
			maxHp             = 1059,     -- 最大 HP
			attack            = 33.2,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 106,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 57.6,        -- 护甲
			maxHp             = 1165,     -- 最大 HP
			attack            = 36.2,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 117,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 92.2,        -- 护甲
			maxHp             = 1282,     -- 最大 HP
			attack            = 39.4,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 128,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 147.6,        -- 护甲
			maxHp             = 1410,     -- 最大 HP
			attack            = 42.9,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 141,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 236.2,        -- 护甲
			maxHp             = 1551,     -- 最大 HP
			attack            = 46.7,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 155,       -- 生命回复/波
		},
	},		
}
defines["110201"] = hero

hero = {
	-- 牛魔王1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 3750,      -- 免伤比例，500表示5.00%
			armor             = 23,        -- 护甲
			maxHp             = 294,     -- 最大 HP
			attack            = 33,        -- 攻击力
			critical          = 480,     -- 暴击率。值代表10%
			restoreHp         = 73,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 3750,      -- 免伤比例，500表示5.00%
			armor             = 37,        -- 护甲
			maxHp             = 323,     -- 最大 HP
			attack            = 41,        -- 攻击力
			critical          = 485,     -- 暴击率。值代表10%
			restoreHp         = 81,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 3750,      -- 免伤比例，500表示5.00%
			armor             = 59,        -- 护甲
			maxHp             = 356,     -- 最大 HP
			attack            = 48,        -- 攻击力
			critical          = 490,     -- 暴击率。值代表10%
			restoreHp         = 89,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 3750,      -- 免伤比例，500表示5.00%
			armor             = 95,        -- 护甲
			maxHp             = 391,     -- 最大 HP
			attack            = 55,        -- 攻击力
			critical          = 495,     -- 暴击率。值代表10%
			restoreHp         = 98,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 3750,      -- 免伤比例，500表示5.00%
			armor             = 152,        -- 护甲
			maxHp             = 430,     -- 最大 HP
			attack            = 62,        -- 攻击力
			critical          = 499,     -- 暴击率。值代表10%
			restoreHp         = 108,       -- 生命回复/波
		},
	},
	-- 牛魔王2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2087,      -- 免伤比例，500表示5.00%
			armor             = 30,        -- 护甲
			maxHp             = 459,     -- 最大 HP
			attack            = 6,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 46,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2087,      -- 免伤比例，500表示5.00%
			armor             = 48,        -- 护甲
			maxHp             = 505,     -- 最大 HP
			attack            = 6.9,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 50,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2087,      -- 免伤比例，500表示5.00%
			armor             = 76.8,        -- 护甲
			maxHp             = 555,     -- 最大 HP
			attack            = 7.5,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 56,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2087,      -- 免伤比例，500表示5.00%
			armor             = 122.9,        -- 护甲
			maxHp             = 611,     -- 最大 HP
			attack            = 8.2,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 61,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2087,      -- 免伤比例，500表示5.00%
			armor             = 196.7,        -- 护甲
			maxHp             = 672,     -- 最大 HP
			attack            = 8.9,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 67,       -- 生命回复/波
		},
	},
    -- 牛魔王3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2245,      -- 免伤比例，500表示5.00%
			armor             = 34.2,        -- 护甲
			maxHp             = 717,     -- 最大 HP
			attack            = 9.9,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 72,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2245,      -- 免伤比例，500表示5.00%
			armor             = 54.8,        -- 护甲
			maxHp             = 788,     -- 最大 HP
			attack            = 10.7,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 79,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2245,      -- 免伤比例，500表示5.00%
			armor             = 87.7,        -- 护甲
			maxHp             = 867,     -- 最大 HP
			attack            = 11.7,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 87,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2245,      -- 免伤比例，500表示5.00%
			armor             = 140.4,        -- 护甲
			maxHp             = 954,     -- 最大 HP
			attack            = 12.7,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 95,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2245,      -- 免伤比例，500表示5.00%
			armor             = 224.7,        -- 护甲
			maxHp             = 1049,     -- 最大 HP
			attack            = 13.9,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 105,       -- 生命回复/波
		},
	},
    -- 牛魔王4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2400,      -- 免伤比例，500表示5.00%
			armor             = 38.4,        -- 护甲
			maxHp             = 1119,     -- 最大 HP
			attack            = 15.4,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 112,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2400,      -- 免伤比例，500表示5.00%
			armor             = 61.5,        -- 护甲
			maxHp             = 1231,     -- 最大 HP
			attack            = 16.8,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 123,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2400,      -- 免伤比例，500表示5.00%
			armor             = 98.4,        -- 护甲
			maxHp             = 1354,     -- 最大 HP
			attack            = 18.3,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 135,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2400,      -- 免伤比例，500表示5.00%
			armor             = 157.5,        -- 护甲
			maxHp             = 1490,     -- 最大 HP
			attack            = 19.9,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 149,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2400,      -- 免伤比例，500表示5.00%
			armor             = 252,        -- 护甲
			maxHp             = 1639,     -- 最大 HP
			attack            = 21.7,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 164,       -- 生命回复/波
		},
	},
    -- 牛魔王5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2552,      -- 免伤比例，500表示5.00%
			armor             = 42.5,        -- 护甲
			maxHp             = 2132,     -- 最大 HP
			attack            = 29.3,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 213,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2552,      -- 免伤比例，500表示5.00%
			armor             = 68.1,        -- 护甲
			maxHp             = 2345,     -- 最大 HP
			attack            = 31.9,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 234,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2552,      -- 免伤比例，500表示5.00%
			armor             = 109,        -- 护甲
			maxHp             = 2579,     -- 最大 HP
			attack            = 34.8,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 258,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2552,      -- 免伤比例，500表示5.00%
			armor             = 174.4,        -- 护甲
			maxHp             = 2837,     -- 最大 HP
			attack            = 37.9,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 284,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2552,      -- 免伤比例，500表示5.00%
			armor             = 279.1,        -- 护甲
			maxHp             = 3121,     -- 最大 HP
			attack            = 41.2,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 312,       -- 生命回复/波
		},
	},		
}
defines["110101"] = hero

hero = {
	-- 铁扇公主1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1125,      -- 免伤比例，500表示5.00%
			armor             = 9,        -- 护甲
			maxHp             = 129,     -- 最大 HP
			attack            = 19,        -- 攻击力
			critical          = 2520,     -- 暴击率。值代表10%
			restoreHp         = 65,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1125,      -- 免伤比例，500表示5.00%
			armor             = 12,        -- 护甲
			maxHp             = 142,     -- 最大 HP
			attack            = 23,        -- 攻击力
			critical          = 2545,     -- 暴击率。值代表10%
			restoreHp         = 71,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1125,      -- 免伤比例，500表示5.00%
			armor             = 21,        -- 护甲
			maxHp             = 157,     -- 最大 HP
			attack            = 28,        -- 攻击力
			critical          = 2571,     -- 暴击率。值代表10%
			restoreHp         = 78,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1125,      -- 免伤比例，500表示5.00%
			armor             = 33,        -- 护甲
			maxHp             = 172,     -- 最大 HP
			attack            = 32,        -- 攻击力
			critical          = 2596,     -- 暴击率。值代表10%
			restoreHp         = 86,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1125,      -- 免伤比例，500表示5.00%
			armor             = 54,        -- 护甲
			maxHp             = 189,     -- 最大 HP
			attack            = 36,        -- 攻击力
			critical          = 2622,     -- 暴击率。值代表10%
			restoreHp         = 95,       -- 生命回复/波
		},
	},
	-- 铁扇公主2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 6,        -- 护甲
			maxHp             = 202,     -- 最大 HP
			attack            = 6.5,        -- 攻击力
			critical          = 2000,     -- 暴击率。值代表10%
			restoreHp         = 12,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 9.7,        -- 护甲
			maxHp             = 222,     -- 最大 HP
			attack            = 7.2,        -- 攻击力
			critical          = 2020,     -- 暴击率。值代表10%
			restoreHp         = 14,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 15.6,        -- 护甲
			maxHp             = 244,     -- 最大 HP
			attack            = 7.9,        -- 攻击力
			critical          = 2040,     -- 暴击率。值代表10%
			restoreHp         = 15,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 25,        -- 护甲
			maxHp             = 269,     -- 最大 HP
			attack            = 8.7,        -- 攻击力
			critical          = 2061,     -- 暴击率。值代表10%
			restoreHp         = 16,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 40,        -- 护甲
			maxHp             = 296,     -- 最大 HP
			attack            = 9.6,        -- 攻击力
			critical          = 2081,     -- 暴击率。值代表10%
			restoreHp         = 18,       -- 生命回复/波
		},
	},
    -- 铁扇公主3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 9.3,        -- 护甲
			maxHp             = 315,     -- 最大 HP
			attack            = 10.2,        -- 攻击力
			critical          = 2000,     -- 暴击率。值代表10%
			restoreHp         = 19,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 15,        -- 护甲
			maxHp             = 347,     -- 最大 HP
			attack            = 11.2,        -- 攻击力
			critical          = 2020,     -- 暴击率。值代表10%
			restoreHp         = 21,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 24,        -- 护甲
			maxHp             = 382,     -- 最大 HP
			attack            = 12.4,        -- 攻击力
			critical          = 2040,     -- 暴击率。值代表10%
			restoreHp         = 23,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 38.4,        -- 护甲
			maxHp             = 420,     -- 最大 HP
			attack            = 13.6,        -- 攻击力
			critical          = 2061,     -- 暴击率。值代表10%
			restoreHp         = 26,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 61.5,        -- 护甲
			maxHp             = 462,     -- 最大 HP
			attack            = 15,        -- 攻击力
			critical          = 2081,     -- 暴击率。值代表10%
			restoreHp         = 28,       -- 生命回复/波
		},
	},
    -- 铁扇公主4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 12.8,        -- 护甲
			maxHp             = 493,     -- 最大 HP
			attack            = 16,        -- 攻击力
			critical          = 2000,     -- 暴击率。值代表10%
			restoreHp         = 30,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 20.5,        -- 护甲
			maxHp             = 542,     -- 最大 HP
			attack            = 17.5,        -- 攻击力
			critical          = 2020,     -- 暴击率。值代表10%
			restoreHp         = 33,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 32.8,        -- 护甲
			maxHp             = 596,     -- 最大 HP
			attack            = 19.3,        -- 攻击力
			critical          = 2040,     -- 暴击率。值代表10%
			restoreHp         = 36,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 52.5,        -- 护甲
			maxHp             = 656,     -- 最大 HP
			attack            = 21.2,        -- 攻击力
			critical          = 2061,     -- 暴击率。值代表10%
			restoreHp         = 40,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 84,        -- 护甲
			maxHp             = 721,     -- 最大 HP
			attack            = 23.4,        -- 攻击力
			critical          = 2081,     -- 暴击率。值代表10%
			restoreHp         = 44,       -- 生命回复/波
		},
	},
    -- 铁扇公主5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 16.4,        -- 护甲
			maxHp             = 938,     -- 最大 HP
			attack            = 30.4,        -- 攻击力
			critical          = 2000,     -- 暴击率。值代表10%
			restoreHp         = 57,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 26.3,        -- 护甲
			maxHp             = 1032,     -- 最大 HP
			attack            = 33.4,        -- 攻击力
			critical          = 2020,     -- 暴击率。值代表10%
			restoreHp         = 63,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 42.1,        -- 护甲
			maxHp             = 1135,     -- 最大 HP
			attack            = 36.8,        -- 攻击力
			critical          = 2040,     -- 暴击率。值代表10%
			restoreHp         = 69,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 67.4,        -- 护甲
			maxHp             = 1249,     -- 最大 HP
			attack            = 40.4,        -- 攻击力
			critical          = 2061,     -- 暴击率。值代表10%
			restoreHp         = 76,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 107.9,        -- 护甲
			maxHp             = 1374,     -- 最大 HP
			attack            = 44.5,        -- 攻击力
			critical          = 2081,     -- 暴击率。值代表10%
			restoreHp         = 84,       -- 生命回复/波
		},
	},		
}
defines["110202"] = hero

hero = {
	-- 玉面狐狸1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 750,      -- 免伤比例，500表示5.00%
			armor             = 7,        -- 护甲
			maxHp             = 162,     -- 最大 HP
			attack            = 33,        -- 攻击力
			critical          = 600,     -- 暴击率。值代表10%
			restoreHp         = 40,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 750,      -- 免伤比例，500表示5.00%
			armor             = 9,        -- 护甲
			maxHp             = 178,     -- 最大 HP
			attack            = 40,        -- 攻击力
			critical          = 606,     -- 暴击率。值代表10%
			restoreHp         = 44,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 750,      -- 免伤比例，500表示5.00%
			armor             = 15,        -- 护甲
			maxHp             = 196,     -- 最大 HP
			attack            = 47,        -- 攻击力
			critical          = 612,     -- 暴击率。值代表10%
			restoreHp         = 49,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 750,      -- 免伤比例，500表示5.00%
			armor             = 23,        -- 护甲
			maxHp             = 215,     -- 最大 HP
			attack            = 54,        -- 攻击力
			critical          = 70,     -- 暴击率。值代表10%
			restoreHp         = 54,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 750,      -- 免伤比例，500表示5.00%
			armor             = 37,        -- 护甲
			maxHp             = 237,     -- 最大 HP
			attack            = 62,        -- 攻击力
			critical          = 103,     -- 暴击率。值代表10%
			restoreHp         = 59,       -- 生命回复/波
		},
	},
	-- 玉面狐狸2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 6,        -- 护甲
			maxHp             = 253,     -- 最大 HP
			attack            = 11.6,      -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 15,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 9.7,        -- 护甲
			maxHp             = 278,     -- 最大 HP
			attack            = 12.7,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 17,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 15.6,        -- 护甲
			maxHp             = 306,     -- 最大 HP
			attack            = 13.8,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 19,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 25,        -- 护甲
			maxHp             = 336,     -- 最大 HP
			attack            = 15,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 21,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 421,      -- 免伤比例，500表示5.00%
			armor             = 40,        -- 护甲
			maxHp             = 370,     -- 最大 HP
			attack            = 16.4,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 23,       -- 生命回复/波
		},
	},
    -- 玉面狐狸3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 9.3,        -- 护甲
			maxHp             = 394,     -- 最大 HP
			attack            = 18.2,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 24,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 15,        -- 护甲
			maxHp             = 434,     -- 最大 HP
			attack            = 19.8,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 26,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 24,        -- 护甲
			maxHp             = 477,     -- 最大 HP
			attack            = 21.6,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 29,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 38.4,        -- 护甲
			maxHp             = 525,     -- 最大 HP
			attack            = 23.5,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 32,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 612,      -- 免伤比例，500表示5.00%
			armor             = 61.5,        -- 护甲
			maxHp             = 577,     -- 最大 HP
			attack            = 25.6,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 35,       -- 生命回复/波
		},
	},
    -- 玉面狐狸4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 12.8,        -- 护甲
			maxHp             = 616,     -- 最大 HP
			attack            = 28.4,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 38,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 20.5,        -- 护甲
			maxHp             = 677,     -- 最大 HP
			attack            = 30.9,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 41,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 32.8,        -- 护甲
			maxHp             = 745,     -- 最大 HP
			attack            = 33.7,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 45,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 52.5,        -- 护甲
			maxHp             = 820,     -- 最大 HP
			attack            = 36.7,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 50,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 800,      -- 免伤比例，500表示5.00%
			armor             = 84,        -- 护甲
			maxHp             = 902,     -- 最大 HP
			attack            = 54.5,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 55,       -- 生命回复/波
		},
	},
    -- 玉面狐狸5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 16.4,        -- 护甲
			maxHp             = 1173,     -- 最大 HP
			attack            = 54.1,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 72,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 26.3,        -- 护甲
			maxHp             = 1290,     -- 最大 HP
			attack            = 58.9,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 79,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 42.1,        -- 护甲
			maxHp             = 1419,     -- 最大 HP
			attack            = 64.1,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 87,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 67.4,        -- 护甲
			maxHp             = 1561,     -- 最大 HP
			attack            = 69.8,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 95,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 984,      -- 免伤比例，500表示5.00%
			armor             = 107.9,        -- 护甲
			maxHp             = 1717,     -- 最大 HP
			attack            = 76.1,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 105,       -- 生命回复/波
		},
	},		
}
defines["110204"] = hero

hero = {
	-- 大鹏金翅雕1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2750,      -- 免伤比例，500表示5.00%
			armor             = 10,        -- 护甲
			maxHp             = 223,     -- 最大 HP
			attack            = 48,        -- 攻击力
			critical          = 480,     -- 暴击率。值代表10%
			restoreHp         = 56,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2750,      -- 免伤比例，500表示5.00%
			armor             = 16,        -- 护甲
			maxHp             = 245,     -- 最大 HP
			attack            = 59,        -- 攻击力
			critical          = 485,     -- 暴击率。值代表10%
			restoreHp         = 61,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2750,      -- 免伤比例，500表示5.00%
			armor             = 25,        -- 护甲
			maxHp             = 270,     -- 最大 HP
			attack            = 69,        -- 攻击力
			critical          = 490,     -- 暴击率。值代表10%
			restoreHp         = 67,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2750,      -- 免伤比例，500表示5.00%
			armor             = 40,        -- 护甲
			maxHp             = 296,     -- 最大 HP
			attack            = 79,        -- 攻击力
			critical          = 495,     -- 暴击率。值代表10%
			restoreHp         = 74,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2750,      -- 免伤比例，500表示5.00%
			armor             = 65,        -- 护甲
			maxHp             = 326,     -- 最大 HP
			attack            = 90,        -- 攻击力
			critical          = 499,     -- 暴击率。值代表10%
			restoreHp         = 82,       -- 生命回复/波
		},
	},
	-- 大鹏金翅雕2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1004,      -- 免伤比例，500表示5.00%
			armor             = 14.4,        -- 护甲
			maxHp             = 348,     -- 最大 HP
			attack            = 11.1,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 24,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1004,      -- 免伤比例，500表示5.00%
			armor             = 23.1,        -- 护甲
			maxHp             = 383,     -- 最大 HP
			attack            = 12.1,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 27,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1004,      -- 免伤比例，500表示5.00%
			armor             = 37,        -- 护甲
			maxHp             = 421,     -- 最大 HP
			attack            = 13.2,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 29,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1004,      -- 免伤比例，500表示5.00%
			armor             = 59.2,        -- 护甲
			maxHp             = 463,     -- 最大 HP
			attack            = 14.4,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 32,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1004,      -- 免伤比例，500表示5.00%
			armor             = 94.8,        -- 护甲
			maxHp             = 509,     -- 最大 HP
			attack            = 15.6,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 36,       -- 生命回复/波
		},
	},
    -- 大鹏金翅雕3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1184,      -- 免伤比例，500表示5.00%
			armor             = 18,        -- 护甲
			maxHp             = 543,     -- 最大 HP
			attack            = 17.6,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 38,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1184,      -- 免伤比例，500表示5.00%
			armor             = 28.9,        -- 护甲
			maxHp             = 598,     -- 最大 HP
			attack            = 18.9,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 42,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1184,      -- 免伤比例，500表示5.00%
			armor             = 46.3,        -- 护甲
			maxHp             = 657,     -- 最大 HP
			attack            = 20.6,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 46,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1184,      -- 免伤比例，500表示5.00%
			armor             = 74.1,        -- 护甲
			maxHp             = 723,     -- 最大 HP
			attack            = 22.4,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 51,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1184,      -- 免伤比例，500表示5.00%
			armor             = 118.6,        -- 护甲
			maxHp             = 795,     -- 最大 HP
			attack            = 24.2,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 56,       -- 生命回复/波
		},
	},
    -- 大鹏金翅雕4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1360,      -- 免伤比例，500表示5.00%
			armor             = 21.8,        -- 护甲
			maxHp             = 848,     -- 最大 HP
			attack            = 27.1,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 59,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1360,      -- 免伤比例，500表示5.00%
			armor             = 34.9,        -- 护甲
			maxHp             = 933,     -- 最大 HP
			attack            = 29.5,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 65,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1360,      -- 免伤比例，500表示5.00%
			armor             = 55.9,        -- 护甲
			maxHp             = 1026,     -- 最大 HP
			attack            = 32.2,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 72,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1360,      -- 免伤比例，500表示5.00%
			armor             = 89.5,        -- 护甲
			maxHp             = 1129,     -- 最大 HP
			attack            = 35,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 79,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1360,      -- 免伤比例，500表示5.00%
			armor             = 143.2,        -- 护甲
			maxHp             = 1242,     -- 最大 HP
			attack            = 38.2,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 87,       -- 生命回复/波
		},
	},
    -- 大鹏金翅雕5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1533,      -- 免伤比例，500表示5.00%
			armor             = 25.5,        -- 护甲
			maxHp             = 1616,     -- 最大 HP
			attack            = 51.7,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 113,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1533,      -- 免伤比例，500表示5.00%
			armor             = 40.9,        -- 护甲
			maxHp             = 1777,     -- 最大 HP
			attack            = 56.3,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 124,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1533,      -- 免伤比例，500表示5.00%
			armor             = 65.5,        -- 护甲
			maxHp             = 1955,     -- 最大 HP
			attack            = 61.3,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 137,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1533,      -- 免伤比例，500表示5.00%
			armor             = 104.8,        -- 护甲
			maxHp             = 2150,     -- 最大 HP
			attack            = 66.7,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 151,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1533,      -- 免伤比例，500表示5.00%
			armor             = 167.7,        -- 护甲
			maxHp             = 2365,     -- 最大 HP
			attack            = 72.7,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 166,       -- 生命回复/波
		},
	},		
}
defines["110203"] = hero

hero = {
	-- 蛟魔王1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 18,        -- 护甲
			maxHp             = 216,     -- 最大 HP
			attack            = 28,        -- 攻击力
			critical          = 480,     -- 暴击率。值代表10%
			restoreHp         = 54,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 29,        -- 护甲
			maxHp             = 237,     -- 最大 HP
			attack            = 33,        -- 攻击力
			critical          = 485,     -- 暴击率。值代表10%
			restoreHp         = 59,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 46,        -- 护甲
			maxHp             = 261,     -- 最大 HP
			attack            = 39,        -- 攻击力
			critical          = 490,     -- 暴击率。值代表10%
			restoreHp         = 65,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 74,        -- 护甲
			maxHp             = 287,     -- 最大 HP
			attack            = 45,        -- 攻击力
			critical          = 495,     -- 暴击率。值代表10%
			restoreHp         = 72,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 118,        -- 护甲
			maxHp             = 316,     -- 最大 HP
			attack            = 51,        -- 攻击力
			critical          = 499,     -- 暴击率。值代表10%
			restoreHp         = 79,       -- 生命回复/波
		},
	},
	-- 蛟魔王2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 24,        -- 护甲
			maxHp             = 337,     -- 最大 HP
			attack            = 11.5,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 21,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 38.4,        -- 护甲
			maxHp             = 370,     -- 最大 HP
			attack            = 12.5,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 23,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 61.5,        -- 护甲
			maxHp             = 407,     -- 最大 HP
			attack            = 13.6,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 25,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 98.4,        -- 护甲
			maxHp             = 448,     -- 最大 HP
			attack            = 14.8,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 27,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1670,      -- 免伤比例，500表示5.00%
			armor             = 157.5,        -- 护甲
			maxHp             = 493,     -- 最大 HP
			attack            = 16.1,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 30,       -- 生命回复/波
		},
	},
    -- 蛟魔王3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 28,        -- 护甲
			maxHp             = 526,     -- 最大 HP
			attack            = 17.9,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 32,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 44.8,        -- 护甲
			maxHp             = 578,     -- 最大 HP
			attack            = 19.5,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 35,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 71.7,        -- 护甲
			maxHp             = 636,     -- 最大 HP
			attack            = 21.3,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 39,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 114.8,        -- 护甲
			maxHp             = 700,     -- 最大 HP
			attack            = 23.1,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 43,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 183.7,        -- 护甲
			maxHp             = 770,     -- 最大 HP
			attack            = 25.2,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 47,       -- 生命回复/波
		},
	},
    -- 蛟魔王4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 32,        -- 护甲
			maxHp             = 821,     -- 最大 HP
			attack            = 28,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 55,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 51.2,        -- 护甲
			maxHp             = 903,     -- 最大 HP
			attack            = 30.5,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 55,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 82,        -- 护甲
			maxHp             = 994,     -- 最大 HP
			attack            = 33.2,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 61,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 131.2,        -- 护甲
			maxHp             = 1093,     -- 最大 HP
			attack            = 36.2,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 67,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 210,        -- 护甲
			maxHp             = 1202,     -- 最大 HP
			attack            = 39.4,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 73,       -- 生命回复/波
		},
	},
    -- 蛟魔王5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 36,        -- 护甲
			maxHp             = 1564,     -- 最大 HP
			attack            = 53.3,        -- 攻击力
			critical          = 800,     -- 暴击率。值代表10%
			restoreHp         = 95,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 57.6,        -- 护甲
			maxHp             = 1720,     -- 最大 HP
			attack            = 58,        -- 攻击力
			critical          = 808,     -- 暴击率。值代表10%
			restoreHp         = 105,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 92.2,        -- 护甲
			maxHp             = 1892,     -- 最大 HP
			attack            = 63.2,        -- 攻击力
			critical          = 816,     -- 暴击率。值代表10%
			restoreHp         = 115,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 147.6,        -- 护甲
			maxHp             = 2082,     -- 最大 HP
			attack            = 68.8,        -- 攻击力
			critical          = 824,     -- 暴击率。值代表10%
			restoreHp         = 127,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 236.2,        -- 护甲
			maxHp             = 2290,     -- 最大 HP
			attack            = 75,        -- 攻击力
			critical          = 832,     -- 暴击率。值代表10%
			restoreHp         = 140,       -- 生命回复/波
		},
	},		
}
defines["110102"] = hero

hero = {
	-- 杏仙1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1200,      -- 免伤比例，500表示5.00%
			armor             = 8,        -- 护甲
			maxHp             = 157,     -- 最大 HP
			attack            = 33,        -- 攻击力
			critical          = 600,     -- 暴击率。值代表10%
			restoreHp         = 39,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1200,      -- 免伤比例，500表示5.00%
			armor             = 11,        -- 护甲
			maxHp             = 173,     -- 最大 HP
			attack            = 40,        -- 攻击力
			critical          = 606,     -- 暴击率。值代表10%
			restoreHp         = 43,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1200,      -- 免伤比例，500表示5.00%
			armor             = 17,        -- 护甲
			maxHp             = 191,     -- 最大 HP
			attack            = 47,        -- 攻击力
			critical          = 612,     -- 暴击率。值代表10%
			restoreHp         = 48,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1200,      -- 免伤比例，500表示5.00%
			armor             = 26,        -- 护甲
			maxHp             = 210,     -- 最大 HP
			attack            = 54,        -- 攻击力
			critical          = 618,     -- 暴击率。值代表10%
			restoreHp         = 52,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1200,      -- 免伤比例，500表示5.00%
			armor             = 40,        -- 护甲
			maxHp             = 231,     -- 最大 HP
			attack            = 62,        -- 攻击力
			critical          = 624,     -- 暴击率。值代表10%
			restoreHp         = 58,       -- 生命回复/波
		},
	},
	-- 杏仙2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 670,      -- 免伤比例，500表示5.00%
			armor             = 9.6,        -- 护甲
			maxHp             = 246,     -- 最大 HP
			attack            = 10,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 24,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 670,      -- 免伤比例，500表示5.00%
			armor             = 15.5,        -- 护甲
			maxHp             = 271,     -- 最大 HP
			attack            = 10.9,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 26,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 670,      -- 免伤比例，500表示5.00%
			armor             = 24.8,        -- 护甲
			maxHp             = 298,     -- 最大 HP
			attack            = 11.8,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 29,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 670,      -- 免伤比例，500表示5.00%
			armor             = 39.7,        -- 护甲
			maxHp             = 327,     -- 最大 HP
			attack            = 12.9,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 31,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 670,      -- 免伤比例，500表示5.00%
			armor             = 63.6,        -- 护甲
			maxHp             = 360,     -- 最大 HP
			attack            = 14,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 35,       -- 生命回复/波
		},
	},
    -- 杏仙3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 857,      -- 免伤比例，500表示5.00%
			armor             = 13.1,        -- 护甲
			maxHp             = 384,     -- 最大 HP
			attack            = 15.6,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 37,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 857,      -- 免伤比例，500表示5.00%
			armor             = 21,        -- 护甲
			maxHp             = 422,     -- 最大 HP
			attack            = 17,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 41,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 857,      -- 免伤比例，500表示5.00%
			armor             = 33.6,        -- 护甲
			maxHp             = 465,     -- 最大 HP
			attack            = 18.5,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 45,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 857,      -- 免伤比例，500表示5.00%
			armor             = 53.8,        -- 护甲
			maxHp             = 511,     -- 最大 HP
			attack            = 20.1,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 49,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 857,      -- 免伤比例，500表示5.00%
			armor             = 86.1,        -- 护甲
			maxHp             = 562,     -- 最大 HP
			attack            = 21.9,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 54,       -- 生命回复/波
		},
	},
    -- 杏仙4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1040,      -- 免伤比例，500表示5.00%
			armor             = 16.6,        -- 护甲
			maxHp             = 600,     -- 最大 HP
			attack            = 24.3,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 58,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1040,      -- 免伤比例，500表示5.00%
			armor             = 26.7,        -- 护甲
			maxHp             = 660,     -- 最大 HP
			attack            = 26.5,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 70,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1040,      -- 免伤比例，500表示5.00%
			armor             = 42.8,        -- 护甲
			maxHp             = 726,     -- 最大 HP
			attack            = 28.9,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 70,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1040,      -- 免伤比例，500表示5.00%
			armor             = 68.5,        -- 护甲
			maxHp             = 798,     -- 最大 HP
			attack            = 31.4,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 77,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1040,      -- 免伤比例，500表示5.00%
			armor             = 109.6,        -- 护甲
			maxHp             = 878,     -- 最大 HP
			attack            = 34.2,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 84,       -- 生命回复/波
		},
	},
    -- 杏仙5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1219,      -- 免伤比例，500表示5.00%
			armor             = 20.3,        -- 护甲
			maxHp             = 1142,     -- 最大 HP
			attack            = 46.3,        -- 攻击力
			critical          = 1000,     -- 暴击率。值代表10%
			restoreHp         = 110,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1219,      -- 免伤比例，500表示5.00%
			armor             = 32.6,        -- 护甲
			maxHp             = 1257,     -- 最大 HP
			attack            = 50.5,        -- 攻击力
			critical          = 1010,     -- 暴击率。值代表10%
			restoreHp         = 121,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1219,      -- 免伤比例，500表示5.00%
			armor             = 52.2,        -- 护甲
			maxHp             = 1382,     -- 最大 HP
			attack            = 55,        -- 攻击力
			critical          = 1020,     -- 暴击率。值代表10%
			restoreHp         = 133,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1219,      -- 免伤比例，500表示5.00%
			armor             = 83.6,        -- 护甲
			maxHp             = 1520,     -- 最大 HP
			attack            = 59.9,        -- 攻击力
			critical          = 1030,     -- 暴击率。值代表10%
			restoreHp         = 146,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1219,      -- 免伤比例，500表示5.00%
			armor             = 133.8,        -- 护甲
			maxHp             = 1672,     -- 最大 HP
			attack            = 65.2,        -- 攻击力
			critical          = 1041,     -- 暴击率。值代表10%
			restoreHp         = 161,       -- 生命回复/波
		},
	},		
}
defines["110301"] = hero

hero = {
	-- 菩提老祖1星(鬼仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 20,        -- 护甲
			maxHp             = 248,     -- 最大 HP
			attack            = 69,        -- 攻击力
			critical          = 720,     -- 暴击率。值代表10%
			restoreHp         = 62,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 32,        -- 护甲
			maxHp             = 273,     -- 最大 HP
			attack            = 83,        -- 攻击力
			critical          = 727,     -- 暴击率。值代表10%
			restoreHp         = 68,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 51,        -- 护甲
			maxHp             = 300,     -- 最大 HP
			attack            = 98,        -- 攻击力
			critical          = 734,     -- 暴击率。值代表10%
			restoreHp         = 75,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 82,        -- 护甲
			maxHp             = 330,     -- 最大 HP
			attack            = 113,        -- 攻击力
			critical          = 742,     -- 暴击率。值代表10%
			restoreHp         = 83,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 3000,      -- 免伤比例，500表示5.00%
			armor             = 132,        -- 护甲
			maxHp             = 363,     -- 最大 HP
			attack            = 128,        -- 攻击力
			critical          = 749,     -- 暴击率。值代表10%
			restoreHp         = 91,       -- 生命回复/波
		},
	},
	-- 菩提老祖2星(人仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 26.4,        -- 护甲
			maxHp             = 387,     -- 最大 HP
			attack            = 10.9,        -- 攻击力
			critical          = 1200,     -- 暴击率。值代表10%
			restoreHp         = 45,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 42.3,        -- 护甲
			maxHp             = 426,     -- 最大 HP
			attack            = 11.9,        -- 攻击力
			critical          = 1212,     -- 暴击率。值代表10%
			restoreHp         = 49,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 67.7,        -- 护甲
			maxHp             = 469,     -- 最大 HP
			attack            = 12.9,        -- 攻击力
			critical          = 1224,     -- 暴击率。值代表10%
			restoreHp         = 54,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 108.4,        -- 护甲
			maxHp             = 516,     -- 最大 HP
			attack            = 14.1,        -- 攻击力
			critical          = 1236,     -- 暴击率。值代表10%
			restoreHp         = 60,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 1837,      -- 免伤比例，500表示5.00%
			armor             = 173.5,        -- 护甲
			maxHp             = 567,     -- 最大 HP
			attack            = 15.4,        -- 攻击力
			critical          = 1249,     -- 暴击率。值代表10%
			restoreHp         = 66,       -- 生命回复/波
		},
	},
    -- 菩提老祖3星(神仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 30.5,        -- 护甲
			maxHp             = 605,     -- 最大 HP
			attack            = 17,        -- 攻击力
			critical          = 1200,     -- 暴击率。值代表10%
			restoreHp         = 70,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 48.8,        -- 护甲
			maxHp             = 665,     -- 最大 HP
			attack            = 18.6,        -- 攻击力
			critical          = 1212,     -- 暴击率。值代表10%
			restoreHp         = 77,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 78.1,        -- 护甲
			maxHp             = 732,     -- 最大 HP
			attack            = 20.2,        -- 攻击力
			critical          = 1224,     -- 暴击率。值代表10%
			restoreHp         = 85,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 125,        -- 护甲
			maxHp             = 805,     -- 最大 HP
			attack            = 22,        -- 攻击力
			critical          = 1236,     -- 暴击率。值代表10%
			restoreHp         = 93,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2000,      -- 免伤比例，500表示5.00%
			armor             = 200,        -- 护甲
			maxHp             = 886,     -- 最大 HP
			attack            = 24,        -- 攻击力
			critical          = 1249,     -- 暴击率。值代表10%
			restoreHp         = 103,       -- 生命回复/波
		},
	},
    -- 菩提老祖4星(地仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 34.6,        -- 护甲
			maxHp             = 945,     -- 最大 HP
			attack            = 26.6,        -- 攻击力
			critical          = 1200,     -- 暴击率。值代表10%
			restoreHp         = 110,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 55.3,        -- 护甲
			maxHp             = 1039,     -- 最大 HP
			attack            = 29,        -- 攻击力
			critical          = 1212,     -- 暴击率。值代表10%
			restoreHp         = 121,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 88.5,        -- 护甲
			maxHp             = 1143,     -- 最大 HP
			attack            = 31.6,        -- 攻击力
			critical          = 1224,     -- 暴击率。值代表10%
			restoreHp         = 133,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 141.6,        -- 护甲
			maxHp             = 1257,     -- 最大 HP
			attack            = 34.4,        -- 攻击力
			critical          = 1236,     -- 暴击率。值代表10%
			restoreHp         = 146,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2160,      -- 免伤比例，500表示5.00%
			armor             = 226.6,        -- 护甲
			maxHp             = 1383,     -- 最大 HP
			attack            = 37.4,        -- 攻击力
			critical          = 1249,     -- 暴击率。值代表10%
			restoreHp         = 160,       -- 生命回复/波
		},
	},
    -- 菩提老祖5星(天仙)配置
	{
		-- 1级配置
		{
			reduceDamage      = 2317,      -- 免伤比例，500表示5.00%
			armor             = 38.6,        -- 护甲
			maxHp             = 1799,     -- 最大 HP
			attack            = 50.7,        -- 攻击力
			critical          = 1200,     -- 暴击率。值代表10%
			restoreHp         = 209,       -- 生命回复/波
		},
		-- 2级配置
		{
			reduceDamage      = 2317,      -- 免伤比例，500表示5.00%
			armor             = 61.8,        -- 护甲
			maxHp             = 1979,     -- 最大 HP
			attack            = 55.2,        -- 攻击力
			critical          = 1212,     -- 暴击率。值代表10%
			restoreHp         = 230,       -- 生命回复/波
		},
		-- 3级配置
		{
			reduceDamage      = 2317,      -- 免伤比例，500表示5.00%
			armor             = 98.9,        -- 护甲
			maxHp             = 2177,     -- 最大 HP
			attack            = 60.1,        -- 攻击力
			critical          = 1224,     -- 暴击率。值代表10%
			restoreHp         = 253,       -- 生命回复/波
		},
		-- 4级配置
		{
			reduceDamage      = 2317,      -- 免伤比例，500表示5.00%
			armor             = 158.3,        -- 护甲
			maxHp             = 2395,     -- 最大 HP
			attack            = 65.5,        -- 攻击力
			critical          = 1236,     -- 暴击率。值代表10%
			restoreHp         = 278,       -- 生命回复/波
		},
		-- 5级配置
		{
			reduceDamage      = 2317,      -- 免伤比例，500表示5.00%
			armor             = 253.8,        -- 护甲
			maxHp             = 2634,     -- 最大 HP
			attack            = 71.3,        -- 攻击力
			critical          = 1249,     -- 暴击率。值代表10%
			restoreHp         = 306,       -- 生命回复/波
		},
	},		
}
defines["110205"] = hero

function HeroGrowth.get(id)
    return clone(defines[id])
end

return HeroGrowth 