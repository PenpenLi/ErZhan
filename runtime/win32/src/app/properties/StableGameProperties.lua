
local StableGameProperties = {}


-- 近战攻击的子弹程序写死
StableGameProperties.NEAR_ATTACK_BULLET      		= "150702"

-- 通过消耗钻石来使英雄立刻复活，配置需要消耗的钻石数量
StableGameProperties.HERO_RELIVE_NEED_DIAMOND       = 10

-- 铁扇公主的罗刹鬼斩技能，增加暴击率4200
StableGameProperties.TIE_SHAN_ADD_CRI       		= 4200

-- 英雄每多死亡一次，多增加的复活时间，以及英雄死亡复活时间最长是多少
StableGameProperties.HERO_DEAD_ADD_TIME     		= 3    --每次死亡增加复活时间步长，单位：秒
StableGameProperties.HERO_DEAD_MAX_TIME     		= 60   --最长复活时间，单位：秒

-- 通过消耗钻石来使英雄立刻复活，配置需要消耗的钻石数量，第8次死亡后金币统一为第八次
StableGameProperties.HERO_RELIVE_NEED_DIAMOND       = {1,3,5,7,10,13,16,20}

-- 凯尔 花钱消灾 技能，消耗当前金币数量的百分比
StableGameProperties.KAI_ER_MANUL_SKILL_COST_GOLD   = 5000     --单位：万分比

-- 凯尔鹏参与执行任务时，任务完成速度提升20%，额外获得10%金币收益（分别对应1、2、3级技能效果）
StableGameProperties.PENG_MO_WANG_QUEST      		= {{1000, 3000}, {2000, 5000}, {3000, 7000}}

-- 英雄restoreHP字段回血的单位时间
StableGameProperties.RESTORE_HP_TIME       	  		= 3000   --回血单位时间，单位：毫秒

-- 英雄脱战状态下idleRestoreHP字段回血的单位时间
StableGameProperties.IDLE_RESTORE_HP_TIME           = 1000   --回血单位时间，单位：毫秒

-- 精灵起源羁绊技能的触发CD
StableGameProperties.LOVE_RIVAL_CD            		= 20000     -- 单位秒

-- 精灵起源羁绊技能附加的buff id
StableGameProperties.LOVE_RIVAL_BUFF_ID       		= "210801"

-- 爱丽丝释放潜能激发，有这么多的概率是赛尔瑞下次生命之露范围扩大
StableGameProperties.GROUP_21_RANDOM                = 3000     --单位：万分比

-- ------------------------游戏剧情对白-----------------------
StableGameProperties.FIRST_GUIDE_WORD  = {
	"可恶，恶魔势力越来越强，有点抵挡不住了。格若尔你怎么了？",
	"嗯。。真是不堪一击。小精灵，你的援军已经被封印住了。哈哈……",
	"不要慌，每次通关都会减弱封印，干掉比蒙王我就能解封了。快！",
}
StableGameProperties.PROP_GUIDE_WORD  = {
	"棒棒哒！后面关卡越来越难，我们要先去商店买点道具才行。",
}
StableGameProperties.DAILY_GUIDE_WORD  = {
	"终于轮到我上场了，快，走起！",	
	"提示：点击技能查看属性",
	"继续第五关",
}
------------------前5关，每通过一关拼图对话框上要显示的文字内容------
StableGameProperties.PINGTU_GUIDE_WORD  = {
	"收集到一块",	
	"拼图又多了",
	"加油三块啦",
	"快成功了",
	"差最后一块啦",
}
-----------------英雄洗点需要消耗的钻石-----------------------------
StableGameProperties.HERO_RESET_COST_DIAMOND        = 50
--------------------------------------------------------------------

-----------------天气系统（风天）-------------------------------------------
StableGameProperties.WINDY_EFF_SHOW_TIME     	    = 8000    -- 风天的时候，每过多久显示一次风天特效，单位：毫秒

------------------------------------------------------------------------------

-- 处理第4关rmb技能的引导, 表示为第五波开始刷怪前25s，也就是按钮出现前5s
StableGameProperties.RMB_GUIDE_BEFORE_TIME          = 25000

----------------------------- 处理塔学习CD出发的技能，一开始的CD的百分比 ---------------------
-- 学习以后过了CD的50%时间，会出发这个技能
StableGameProperties.TOWER_CD_SKILL_FIRST_CD        = 2000    ----万分比      

--------------------------- 处理塔学习CD出发的技能，一开始的CD的百分比 end -------------------

-----------------------------------------  光环特效配置  -----------------------------------------

-- 气元素光环特效的缩放比例，分别为在英雄身上和塔身上不同的缩放比例
StableGameProperties.QI_AUREOLE_SCALE_HERO       		= 0.42
StableGameProperties.QI_AUREOLE_SCALE_TOWER       		= 0.7

-- 矮人光环特效的缩放比例，分别为在英雄身上和塔身上不同的缩放比例
StableGameProperties.AI_AUREOLE_SCALE_HERO        		= 0.42
StableGameProperties.AI_AUREOLE_SCALE_TOWER        		= 0.7


-----------------------------------------  祭坛塔功能 -------------------------------------------
-- 兵塔招的三种类型的士兵的数量，分别是树精、水精、石妖
StableGameProperties.TOWER_SOLDIER_NUMS       		= {3, 1, 1}

-- 兵塔召唤出来的大水元素，攻击记下以后死亡
StableGameProperties.WATER_ELENTAL_ATT_COUNT        = 10

-- 地图中每死亡一个怪物，给祭坛塔固定增加的能量点数
StableGameProperties.MONSTER_DIE_ADD_PLUNDER_POWER  = 1

----------------------------------------- 处理菩提老祖的天变羁绊 --------------------------------

-- 从屏幕上面飞下来的按钮的飞行速度,200像素每秒
StableGameProperties.FLY_BTN_SPEED                  = 80

-- 从屏幕上面飞下来的变换天气按钮，每过多长时间变换一下按钮，单位毫秒
StableGameProperties.CHANGE_WEATHER_BTN_INTERVAL    = 2500

-- 拾取了飘下来的菩提老祖的变天按钮以后，过了这么长时间以后，要回到原来配置的天气
StableGameProperties.RETURN_ORIGINAL_WEATHER_TIME   = 15000

-------------------------------------- 处理菩提老祖的天变羁绊 end -------------------------------


----------------------------------------- 处理4级、5级箭塔的天赋 --------------------------------

-- 记录4级箭塔将调用的子弹，用来做普攻触发淬毒技能
StableGameProperties.FOUR_LV_TOWER_BULLET_ID        = "150529"

-- 记录4级箭塔的淬毒Buff的occupied占位符，用来做淬毒天赋，优先攻击目标的判定
StableGameProperties.FIVE_LV_TOWER_POISON_BUFF_OCCP = 29

-- 记录5级箭塔火焰箭技能调用的子弹
StableGameProperties.FIRE_ARROW_BULLET_ID           = "150206"

-- 记录5级箭塔调用的子弹, 用来做钉魂箭
StableGameProperties.FIVE_LV_TOWER_BULLET_ID        = "150118"

-- 记录5级箭塔钉魂箭清空CD
StableGameProperties.SOUL_ATTACK_CLEAR_CD           = 4000    --单位毫秒

-------------------------------------- 处理4级、5级箭塔的天赋 end -------------------------------

----------------------------------------- 处理4级、5级炮塔的天赋 --------------------------------

-- 记录4级炮塔的子弹，用来做塔的大爆裂天赋
StableGameProperties.FOUR_LV_TURRET_BULLET_ID       = "150207"

-- 记录4级炮塔火图腾技能的调用的子弹，在BulletBase中要给自己反伤
StableGameProperties.FIRE_TOTEM_BULLET_ID           = "150527"

-- 记录5级炮塔的子弹，用来做锁链和积雷天赋
StableGameProperties.FIVE_LV_TURRET_BULLET_ID       = "150307"

------------------------------------- 处理4级、5级炮塔的天赋 end --------------------------------


--------------------------------------- 处理4级仙术塔的能力、天赋 -------------------------------

-- 4级法师塔收集满50点魂魄后，才可以释放技能
StableGameProperties.FOUR_LV_MAGIC_NEED_SOULS       = 20

-- 4级法师塔每秒收集几点魂魄
StableGameProperties.FOUR_LV_MAGIC_TIME_RESTORE     = 1

-- 4级法师塔,每次魂魄攻击=基础攻击力*X%，下面为X参数，单位万分比
StableGameProperties.FOUR_LV_MAGIC_ADD_ATTACK       = 10000

-- 4级法师塔,每次魂魄攻击，连击时最终伤害加成比列%, 第一次1，第二次1*1.2,第三次1*1.2*1.2
StableGameProperties.FOUR_LV_MAGIC_ADD_PERCENT_ATT  = 12000   ------万分比

-- 被4级法师塔攻击的目标, 会记录被攻击次数，记录次数清除时间
StableGameProperties.FOUR_LV_MAGIC_CLEAR_TIME       = 30000   ------单位：毫秒

-- 被4级法师塔两个魂魄攻击间隔，单位毫秒
StableGameProperties.FOUR_LV_MAGIC_FIRE_INTERVAL    = 1500

-- 被4级法师塔魂魄攻击使用的跟踪子弹 id
StableGameProperties.FOUR_LV_MAGIC_SOUL_BULLET_ID   = "150901"

------------------------------------- 处理4级法师塔的能力、天赋 end ------------------------------
------------------------------------- BOSS AI -----------------------------------------------------
-- 冰龙从屏幕上飞过的速度
StableGameProperties.BING_LONG_FLY_SPEED       		= 550

-- 塔被冰龙冻住以后，需要点击几次才能够给塔解Buff
StableGameProperties.BING_LONG_TOWER_CLICK_COUNT	= 2

-- 地狱炎魔进入休息的时候，给自己加回血Buff的概率
StableGameProperties.YAN_MO_ADD_HP_RANDOM       	= 3000

-- 地狱炎魔从休息进入正常状态的时候，释放岩浆暴怒技能的概率
StableGameProperties.YAN_MO_RELEASE_RANDOM       	= 7500

-- 炎魔在引导，要释放演讲爆裂的时候，需要点击几次才能够给塔解Buff
StableGameProperties.YAN_MO_TOWER_CLICK_COUNT	   = 1

-- 大恶魔王的恶魔大军召唤技能，第1/2/3/4点击以后打恶魔王回退的概率
StableGameProperties.DA_E_MO_CLICK_RETURN_RANDOM    = {2000, 4000, 6000, 10000}

--------------------------------- 第七-九关打野雪球-----------------
StableGameProperties.XUE_QIU_CLICK_COUNT            = 3       --雪球点击几次可摧毁
StableGameProperties.XUE_QIU_SEVEN_SPEED            = 300     --第7关雪球滚动的速度，表示100像素/秒
StableGameProperties.XUE_QIU_EIGHT_SPEED            = 300     --第8关雪球滚动的速度，表示100像素/秒
StableGameProperties.XUE_QIU_NINE_SPEED             = 300     --第9关雪球滚动的速度，表示100像素/秒

--------------------------------- 第七关模式3的逃跑精灵参数 ----------------------------------
StableGameProperties.WUSHA_ELVES_COUNT              = 5        -- 第7关，模式3，可以误杀的逃跑精灵的数量

--------------------------------- 第八关模式3的天气变化参数 ----------------------------------
StableGameProperties.CHANGE_WEATHER_AUTO_TIME       = 10000   -- 单位毫秒，每过10s中，游戏中的天气会自动变化
StableGameProperties.MACHINE_CHANGE_TIME            = 5000    -- 单位毫秒，每过3s钟，天气制造机的天气图标变换一次
StableGameProperties.MACHINE_COOLDOWN_TIME          = 10000   -- 单位毫秒，天气制造机点击后的冷却时间
StableGameProperties.MACHINE_RETAIN_TIME            = 5000   -- 单位毫秒，天气制造机改变的天气的持续时间
StableGameProperties.WEATHER_TOWER_CLICK_COUNT	    = 1       -- 雪天，雪元素把塔冻住以后，需要点击几次才能够给塔解Buff

--------------------------------- 第9关模式3的法阵参数 ----------------------------------
StableGameProperties.ROUND_CHECK_CD                 = 50000    -- 每一波开始过了2.5秒以后，显示3个法阵出来
StableGameProperties.FA_ZHEN_RETAIN_TIME            = 30000    -- 3个法阵显示出来后的持续时间

--------------------------------- 第10关模式3的精华参数 ----------------------------------
StableGameProperties.Essence_CHECK_CD              = 20000      -- 精华刷新间隔
StableGameProperties.Essence_RETAIN_TIME           = 10000     -- 精华地面存在时间
StableGameProperties.Essence_NEED_COUNT            = 8         -- 总共需要收集的精华数量

--------------------------------- 第11关模式3的英雄增强参数 ----------------------------------
StableGameProperties.ADD_HP_PERCENT                 = 2500    -- 每杀死一个怪物增加的血量, 为基础的最大血量*这个万分比
StableGameProperties.MAX_HP_PERCENT                 = 100000   -- 可以增加的最大血量的值，为基础的最大血量*这个万分比
StableGameProperties.ADD_ATTACK_PERCENT             = 5000    -- 每杀死一个怪物增加的攻击力, 为基础的攻击力*这个万分比
StableGameProperties.MAX_ATTACK_PERCENT             = 100000   -- 可以增加的最大攻击力的值，为基础的攻击力*这个万分比

--------------------------------- 第12关模式3的需要杀怪的数量 ----------------------------------
StableGameProperties.KILL_MONSTER_COUNT             = {3, 10, 30, 60, 90, 110}

--------------------------------- 第14关模式3的法阵参数 ----------------------------------
StableGameProperties.TREASURE_CHECK_CD              = 10000     -- 宝物刷新间隔
StableGameProperties.TREASURE_RETAIN_TIME           = 45000     -- 宝物存在时间
StableGameProperties.TREASURE_NEED_COUNT            = 5         -- 14关模式3，总共需要守护的宝物数量

return StableGameProperties
