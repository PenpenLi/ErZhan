local DailyPackageProperties = {}

local defines = {}

local package = {
	path    = "1.png",           --签到UI形象
    --diamond = 0,          --签到奖励钻石个数
    hero    = {"110301",2},    --签到奖励英雄体验次数
    --skill 	= {"id",3}	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "赛尔瑞体验2次"
}
defines[1] = package       --第一日签到奖励池

local package = {
	path    = "5.png" ,          --签到UI形象
    --diamond = 10,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    skill 	= {"710301",6},	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "雷霆卷轴6个"
}
defines[2] = package       --第二日签到奖励池

local package = {
	path    = "2.png",           --签到UI形象
    diamond = 90,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    --skill 	= {"id",3}	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "钻石90个"
}
defines[3] = package       --第三日签到奖励池


local package = {
	path    = "6.png",           --签到UI形象
    --diamond = 10,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    skill 	= {"710201",24},	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "光辉宝珠24个"
}
defines[4] = package       --第四日签到奖励池

local package = {
	path    = "3.png",           --签到UI形象
    diamond = 120,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    --skill 	= {"id",3}	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "钻石120个"
}
defines[5] = package       --第五日签到奖励池

local package = {
	path    = "7.png",           --签到UI形象
    --diamond = 10,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    skill 	= {"710101",12},	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "时间沙漏12个"
}
defines[6] = package       --第六日签到奖励池

local package = {
	path    = "4.png",           --签到UI形象
    diamond = 200,          --签到奖励钻石个数
    --hero    = {"id",3},    --签到奖励英雄体验次数
    --skill 	= {"id",3}	   --签到奖励道具技能个数  710101-时间沙漏 710201-圣塔光辉 710301-雷霆之怒
    name    = "钻石200个"
}
defines[7] = package       --第七日签到奖励池


function DailyPackageProperties.get(i)
    return clone(defines[i])
end

function DailyPackageProperties.getAll()
    return clone(defines)
end

return DailyPackageProperties