
-- 用来做进入游戏的时候，在加载页面里面显示的游戏提示内容

local LoadingTips = {}

local defines = {}

local defines = {
	------
    CN = {
    	"提示: 箭塔可以有效对付空中和快速单位",
    	"提示: 如果怪物潮水般袭来，建造战争古树是最高效的选择",
    	"提示: 雷电古树和熔岩古树最大区别，在于雷电还能攻击空中单位",
    	"提示: 魔法塔擅长对付皮糙血厚单位",
    	"提示: 记得当水晶点亮时，掠夺周围怪物身上的金币",
    	"提示: 水晶掠夺范围内，怪物数量越多，掠夺金币越多",
    	"提示: 当你来不及阻挡怪物时，记得利用水晶召唤援兵协助",
    	"提示: 水晶援兵枯木战士，价格便宜，数量多，记得经常召唤他们",
    	"提示: 水晶援兵水元素，远程高攻，记得伤害不足时召唤他们",
    	"提示: 水晶援兵金龙，皮厚并有范围控制能力，特别适合对抗BOSS",
		"提示: 当某个水晶召唤的援兵还活着，请别再次召唤他们，因为他们不能同时存在",
		"提示: 不同英雄有各不同的作用，合理搭配他们非常重要",
		"提示: 在塔数量足够时，提升塔的等级非常重要",
    	"提示: 在英雄大厅可查看每个英雄的技能说明",
		"提示: 英雄在战场中通过击溃怪物也能升级，最高等级和关卡有关",
    	"提示: 当你失败了，检查下英雄搭配是否合理",
    	"提示: 并非技能冷却后立刻释放，合理释放将事半功倍",
    	"提示: 别轻言放弃，仔细总结出怪规律，你总能找到克制过关的方法",
    	"提示: 指挥英雄战略性撤退，尤其面对远程攻击怪物时至关重要",

	},
	EN = {
        "Tips: Guard Tower can deal with air and fast units.",
        "Tips: Ancient of War can deal with numerous units.",
        "Tips: Ancient of Lightning can deal with air units.",
        "Tips: Magic Tower can deal with numerous units.",
        "Tips: Plunder coins from monsters when the crystal shines.",
        "Tips: More monsters will get more coins within the plunder scope.",
        "Tips: Summonning minions to withstand monsters in necessity.",
        "Tips: Wood warriors are cheap and numerous.",
        "Tips: Water Elementals deal high ranged damage.",
        "Tips: Dragolds are tanks that issue range controlling and fit for BOSS.",
        "Tips: Do not summon a minion twice in its presence.",
        "Tips: Coordinate heroes with different traits reasonably.",
        "Tips: The level of towers is important.",
        "Tips: View the skills of each hero in the hall.",
        "Tips: Heroes can upgrade by slaying monsters. The maximum level matters.",
        "Tips: Reflect on whether your coordination is reasonable when lost.",
        "Tips: Cast the skills reasonably rather than promptly.",
        "Tips: Summed up the law and do not relinquish.",
        "Tips: Make a strategic retreat especially confront with ranged enemies.",
	},

}

function LoadingTips.getAll()
    return clone(defines)
end

return LoadingTips
