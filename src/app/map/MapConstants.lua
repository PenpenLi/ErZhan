
local MapConstants = {}

MapConstants.SIDE_BAR_WIDTH         = 110

MapConstants.PLAY_DEFAULT_SCALE     = 0.7
MapConstants.ZOOM_TIME              = 0.1
MapConstants.FIRE_RANGE_SIZE        = 128
MapConstants.FIRE_RANGE_SCALE_Y     = 0.8

MapConstants.TOWER_LOCATION_ZORDER = -1

MapConstants.FIRE_RANGE_ZORDER      = 150
MapConstants.DEFAULT_OBJECT_ZORDER  = 100
MapConstants.MAX_OBJECT_ZORDER      = 20000
MapConstants.BULLET_ZORDER          = 21000

-- 区域的底图的zorder
MapConstants.AREA_IMAGE_ZORDER      = 0

-- Buff的zorder
MapConstants.OBJECT_BUFF_ZORDER     = 1

-- 光环的zorder，贴在object的view的-1层
MapConstants.AUREOLE_IMAGE_ZORDER   = -1
MapConstants.AREA_IMAGE_ZORDER      = 1    -- 进入区域的物体，挂在身上的特效，zorder为1


MapConstants.NORMAL_TRACKING_SPEED  = 3
MapConstants.FAST_TRACKING_SPEED    = 12
MapConstants.SET_FAST_TRACKING_DIST = display.height / 3

MapConstants.CROSS_POINT_TAP_RADIUS = 50
MapConstants.HP_BAR_ZORDER          = 30000
MapConstants.HP_BAR_OFFSET_Y        = 10
MapConstants.RADIUS_CIRCLE_SCALE_Y  = 0.85

MapConstants.LEVEL_LABEL_OFFSET_Y   = 26
MapConstants.LEVEL_LABEL_FONT       = display.DEFAULT_TTF_FONT
MapConstants.LEVEL_LABEL_FONT_SIZE  = 16

MapConstants.PLAYER_CAMP            = 1
MapConstants.ENEMY_CAMP             = 2
MapConstants.NPC_CAMP               = 3

-------------------- 通过 campId和maskId 来在C的碰撞检测中实现只检测对应的物体 --------------
MapConstants.NO_CAMP 				= 0
MapConstants.TOWER_CAMP				= 1
MapConstants.HERO_CAMP 				= 2
MapConstants.SOLDIER_CAMP 			= 4    -- 游戏中的召唤兵也是用的HERO_CAMP
MapConstants.MONSTER_CAMP 			= 8
MapConstants.BOSS_CAMP			    = 16   -- 游戏中的Boss也是用的MONSTER_CAMP
MapConstants.KING_CAMP 				= 32

MapConstants.TOWER_CAMP_MASK 		= MapConstants.MONSTER_CAMP + MapConstants.BOSS_CAMP
MapConstants.HERO_CAMP_MASK 		= MapConstants.MONSTER_CAMP + MapConstants.BOSS_CAMP
MapConstants.SOLDIER_CAMP_MASK 		= MapConstants.MONSTER_CAMP + MapConstants.BOSS_CAMP
MapConstants.MONSTER_CAMP_MASK 		= MapConstants.HERO_CAMP 
MapConstants.BOSS_CAMP_MASK			= MapConstants.HERO_CAMP + MapConstants.SOLDIER_CAMP
MapConstants.KING_CAMP_MASK 		= MapConstants.NO_CAMP
------------------------------------- campId和maskId end ------------------------------------

MapConstants.MAP_TILE_SIZE	        = 16    -- 行走区域，tile的大小

MapConstants.MAP_TYPE_NORMAL 		= 1     -- 地图类型(关卡类型)，正常
MapConstants.MAP_TYPE_RUSH   		= 1     -- 地图类型(关卡类型)，无尽模式

-- 英雄碰撞检测的范围
MapConstants.HERO_COLLISION_RANGE = 5

-- 1 为逃跑怪
-- 2 为远1，就是在射击范围内会A英雄，开火冷却时间在原地不动
-- 3 为远2，就是在射击范围内会A英雄，开火冷却时间继续沿着路径往前走
-- 4 为近战
-- 5 表示为逃跑精灵
MapConstants.MONSTER_AI_MODE_ONE   = 1
MapConstants.MONSTER_AI_MODE_TWO   = 2
MapConstants.MONSTER_AI_MODE_THREE = 3
MapConstants.MONSTER_AI_MODE_FOUR  = 4
MapConstants.MONSTER_AI_MODE_Five  = 5

-- 怪物是地面、空中还是地下
MapConstants.MONSTER_WALK_LAYER_EARTH = 1  -- 地面
MapConstants.MONSTER_WALK_LAYER_SKY   = 2  -- 空中
MapConstants.MONSTER_WALK_LAYER_UNDER = 3  -- 地下

-- 区域类型
MapConstants.BORN_RANGE			= 1        -- 怪物出生点
MapConstants.END_RANGE			= 2        -- 怪物终点
MapConstants.HERO_BORN_RANGE	= 3 	   -- 英雄出生位置
MapConstants.SLOW_DOWN_RANGE	= 4        -- 减速区域
MapConstants.SKILL_RANGE		= 5        -- 机关技能，点击后会释放某个技能
MapConstants.TASK_RANGE			= 6        -- 任务区域
MapConstants.PACKAGE_RANGE		= 7        -- 可拾取物
MapConstants.THROW_ENEMY_RANGE	= 8        -- 一只鸟进来，把怪物仍在这个区域
MapConstants.JUMP_RANGE			= 9        -- 跳跃区域，怪物直接跳到下一个路径点
MapConstants.HIDE_RANGE			= 10       -- 遮挡
MapConstants.ENTER_RANGE		= 11       -- 暗道入口
MapConstants.OUT_RANGE			= 12       -- 暗道出口
MapConstants.DAYE_RANGE			= 13       -- 打野区域

MapConstants.AREA_RANGE			= 100      -- 策划配的区域
-- MapConstants.BUILDING_RANGE		= 11       -- 装饰物，无作用

-- 打野元素的类型, 1表示一直存在不能点击；2表示偶尔出现，不能点击；
-- 3表示偶尔出现，可以点击; 4表示一直存在，时间到了变成可以点击
-- 5表示一直存在，时间到了以后先播放出生动作，然后变成可以点击
MapConstants.DAYE_TYPE_ONE      = 1
MapConstants.DAYE_TYPE_TWO      = 2
MapConstants.DAYE_TYPE_THREE    = 3
MapConstants.DAYE_TYPE_FOUR     = 4
MapConstants.DAYE_TYPE_FIVE     = 5
MapConstants.DAYE_TYPE_SIX      = 6
MapConstants.DAYE_TYPE_SEVEN    = 7
MapConstants.DAYE_TYPE_SEVEN_TWO= 71    -- 第十关模式3的精华的老家
MapConstants.DAYE_TYPE_EIGHT    = 8



-- 打野元素的状态，1表示idle，2表示可点击动画，3表示点击完以后播放的动画
MapConstants.DAYE_STATE_IDLE          = 1
MapConstants.DAYE_STATE_CAN_CLICK     = 2
MapConstants.DAYE_STATE_AFTER_CLICK   = 3

-- 技能的伤害作用方式
--[[0=无，1=攻击，2=护甲，3=最大生命，4=当前生命5=闪避率，
    6=暴击率，7=暴击威力，8=当前金币，9=目标最大生命，10=目标当前生命]]
MapConstants.ATTACK_SRC_NIL	            = 0
MapConstants.ATTACK_SRC_ATTACK          = 1    
MapConstants.ATTACK_SRC_ARMOR	        = 2    
MapConstants.ATTACK_SRC_SRC_MAXHP	    = 3 	   
MapConstants.ATTACK_SRC_SRC_HP	        = 4        
MapConstants.ATTACK_SRC_DODGE	        = 5        
MapConstants.ATTACK_SRC_CRITICAL		= 6    
MapConstants.ATTACK_SRC_CRITICALPOWER 	= 7        
MapConstants.ATTACK_SRC_GOLD			= 8       
MapConstants.ATTACK_SRC_TARGET_MAXHP	= 9    
MapConstants.ATTACK_SRC_TARGET_HP		= 10   

-- 技能类型，1表示是手动技能，2表示是自动技能，3表示是被动技能, 4表示是道具技能
MapConstants.SKILL_TYPE_MANUAL			= 1      
MapConstants.SKILL_TYPE_AUTO            = 2   
MapConstants.SKILL_TYPE_PASSIVE 		= 3  
MapConstants.SKILL_TYPE_RMB             = 4

-- 用例处理百分比，暴击率等，都用配的值类除以10000
MapConstants.FOUDATION_PERCENT          = 10000
-- 毫秒时间换成成秒的的时候用来做除数
MapConstants.MILLISECOND                = 1000

-- 基本塔的类型，1 = 箭塔, 2 = 炮塔,3 = 仙术塔, 4 = 祭坛塔, 5 = 特殊塔
MapConstants.TOWER_TYPE_TOWER         = 1
MapConstants.TOWER_TYPE_TURRET        = 2
MapConstants.TOWER_TYPE_MAGIC	      = 3
MapConstants.TOWER_TYPE_ALTAR	      = 4   
MapConstants.TOWER_TYPE_SPECIAL	      = 5   

-- buff类型， 类型,1/2/3,1=减益,2=增益,3=系统
MapConstants.BUFF_TYPE_BAD            = 1
MapConstants.BUFF_TYPE_GOOD           = 2
MapConstants.BUFF_TYPE_SYSTEM	      = 3

-- 伤害类型，1表示要计算目标的免伤概率，2表示直接伤害，3表示加血
MapConstants.ATTACK_TYPE_REDUCE       = 1
MapConstants.ATTACK_TYPE_DIRECT       = 2
MapConstants.ATTACK_TYPE_ADDHP 	      = 3

-- 释放技能时需要消耗资源，0 表示不需要消耗，1表示消耗金币，2表示消耗MP
MapConstants.SKILL_COST_NIL   		  = 0
MapConstants.SKILL_COST_GOLD          = 1
MapConstants.SKILL_COST_MP 	          = 2

-- 释放技能时搜寻作用对象的方式，1表示攻击目标，2表示技能范围中随机一个目标
MapConstants.SKILL_FIND_FIRE_TARGET   = 1
MapConstants.SKILL_FIND_RANGE_TARGET  = 2

-- 区域类型，1表示定点区域，2表示光环区域
MapConstants.AREA_TYPE_IMMOVABLE      = 1
MapConstants.AREA_TYPE_AUREOLE        = 2

-- 从屏幕上方飘下一个按钮，1
MapConstants.FLY_BTN_TYPE_RETURN_GOLD     = 1    -- 鹏翅金羽释放后返还一片金羽，拾取后随机获得所消耗金币*5%~15%
MapConstants.FLY_BTN_TYPE_ADD_HERO_MAX_HP = 2    -- 雨润杏花释放后返还一朵杏花，拾取后随机使一个英雄30秒内生命上限提升35%
MapConstants.FLY_BTN_TYPE_CHANGE_WEATHER  = 3    -- 菩提祖师每次论道讲禅可能引起天变，飘下一个按钮，切换晴/雨/风/夜/雪状态，拾取后改变为相应的天气

-- 游戏模式，分别表示模式1/2/3
MapConstants.GAME_MODE_ONE                = 1
MapConstants.GAME_MODE_TWO                = 2
MapConstants.GAME_MODE_THREE              = 3

-- 游戏是简单还是困难，1表示简单，2表示困难
MapConstants.DIFFICULTY_MODE_EASY               = 1
MapConstants.DIFFICULTY_MODE_HARD               = 2


-- 用来做游戏中的不同类型的Tips展示
MapConstants.TipsType_RoundStart   = 1       -- 手动出怪Tips
MapConstants.TipsType_HeroMove     = 2       -- 英雄移动Tips
MapConstants.TipsType_JiTanPlunder = 3       -- 祭坛掠夺Tips
MapConstants.TipsType_NewEnemy     = 4       -- 出现新怪Tips
MapConstants.TipsType_ModeThree    = 5       -- 模式3玩法的Tips
MapConstants.TipsType_JiTanSummon  = 6       -- 祭坛召唤Tips


-- 记录祭坛塔存储能量的状态，用来控制4层特效的可见不可见
MapConstants.PLUNDER_EFF_STATE_ZERO       = 0    -- 表示播放0个特效
MapConstants.PLUNDER_EFF_STATE_ONE        = 1    -- 表示储能25%时，播放第一层特效
MapConstants.PLUNDER_EFF_STATE_TWO        = 2    -- 表示储能50%时，播放第二层特效
MapConstants.PLUNDER_EFF_STATE_THREE      = 3    -- 表示储能75%时，播放第三层特效
MapConstants.PLUNDER_EFF_STATE_FOUR       = 4    -- 表示储能100%时，播放第四层特效


-- add by Owen, 2016.6.12, 每一关开始的时候需要移动地图到对应位置
MapConstants.MapPos_Left       = 1
MapConstants.MapPos_Right      = 2
MapConstants.MapPos_Down       = 3
MapConstants.MapPos_UP         = 4
MapConstants.MapPos_Left_Down  = 5
MapConstants.MapPos_Left_Up    = 6
MapConstants.MapPos_Right_Down = 7
MapConstants.MapPos_Right_Up   = 8



--[[ 记录自动技能的触发点：
	1. 攻击套路和攻击中概率触发：HeroBehavior:getAttackMode()
	2. CD触发：  在FireBehavior中调用SkillFactory.checkTimeTriggerSkill
	3. 血量触发：在DestroyedBehavior:decreaseHp()
			猴子的重生技能：在MapRuntime:removeObject()
]]

-- add by Owen, 记录程序运行的过程中给object添加的各种变量
--[[
        变量名                日期       类名
	_isSoldier                         HeroBehavior  记录这个拥有HeroBehavior的object是不是士兵
	_absorbedDamage        2015.7.24   BuffBase      添加timeBuff时,如果有吸伤盾,记录object已经吸收了多少伤害
	_absorbedMaxDamage     2015.7.24   BuffBase      记录吸伤盾总共能吸收多少伤害
	_attackIntervalTime    2015.7.27   BuffBase      记录buff处理间隔伤害，两次伤害的间隔
    _attackIndex           2015.7.27   BuffBase      记录buff处理间隔伤害，已经跳了几次伤害
	_attack                2015.7.27   BuffBase      记录buff处理间隔伤害，记录每次跳的伤害
	_isComa                2015.7.29   BuffBase      记录buff处理昏迷状态，表示这个物体昏迷了
	_impactedCount         2015.8.3    BuffBase      记录buff狂奔技能的撞击次数
	_actionObject          2015.8.3    BuffBase      记录buff狂奔技能的撞击目标类型，从技能配置中读取
	_impactedObject        2015.8.3    BuffBase      记录buff狂奔技能的已经撞击过的物体
	_isImpact              2015.8.3    BuffBase      记录中了狂奔buf的怪物，不能被英雄配对
	_disappeerX            2015.8.5    BuffBase      记录中了消失buff，buff以后后要回到的原点X
	_disappeerY            2015.8.5    BuffBase      记录中了消失buff，buff以后后要回到的原点Y
	_canTouch              2015.8.6    RangeObject   记录任务区域，一开始的时候是不能点击的
	_gameStartTime         2015.8.11   NormalMapEventHandler   在startRound函数中，开始第一波的时候记录一下游戏开始的时间
	_skillConfig           2015.8.11   BuffBase      给buff记录一下调用这个buff的技能配置，在算buff伤害的时候要用到技能的天气配置
	_addViw                2015.8.17   BuffBase      物体中了buff以后，显示文字，文字存在这个table中
	_aureoleImage          2015.8.20   AreaObject    物体进入光环以后，显示的光环图片存在这个table中
	object._areaImage      2016.1.28   AreaObject    物体进入区域以后，显示在身上的区域效果图片存在这个table中
	_isWalkable			   2015.9.8    Road          标记这条路是不是可行走区域
	_willNearAttackIndex   2015.9.9    BattleDataManager   记录英雄、怪物将要近战攻击的单位，这样在C里面做碰撞的时候，只需要检测这个物体
	soldier._towerID       2015.10.12  MapRuntime    标记兵塔招出来的士兵，是被哪个兵塔召唤出来的
	soldier._isReplaceDie  2015.10.12  MapRuntime    标记兵塔召唤出来的大水元素是被替换死掉的，这时候是不能分裂小水元素的
	_soulAttack            2015.10.16  ArrowBullet   记录5级箭塔钉魂箭的附加伤害
	_soulAttackTime        2015.10.16  ArrowBullet   记录5级箭塔钉魂箭的攻击时间，在monsterBehavior:tick 中，会累加这个值，一旦超过3秒，就会将_soulAttack 置为0
	_towerIndex            2015.10.19  CallUnitSkill 记录4级炮塔召唤出来的火图腾，用来记录这个火图腾是被那个塔召唤出来的
	_inRangePoints         2015.10.19  CallUnitSkill 记录在4级炮塔射程范围内的所有路径点
	_totemPosIndex         2015.10.19  CallUnitSkill 记录上一次放置火图腾的路径点的在_inRangePoints中的index
	_allSouls              2015.10.28  TowerObject   记录4级法师塔魂魄天赋，当前存了多少个魂魄
	_soulAttackCount       2015.10.28  TrackBullet   记录被4级法师塔的魂魄攻击次数
	_fourMagicAttackTime   2015.10.28  TrackBullet   记录被4级法师塔的魂魄攻击以后，过了多久，时间到了以后，要清空被攻击的次数
	_soulBulletImgs        2015.10.28  TowerObject   记录被4级法师塔存储的魂魄子弹图片，开始攻击的话把图片隐藏，然后生成子弹
	_isMoveByUser 		   2016.2.19   MovableBehavior  表示是否是玩家操纵英雄的移动，用来判定是生成astar还是直接两点间移动
	_bossNormalLiveCD      2016.2.25   MonsterBehavior  记录Boss正常行走了多久，用来做Boss的休息逻辑判定 
	_needRest 			   2016.2.25   MonsterBehavior  表示Boss后面需要播放休息动作了
	_bossRestTime		   2016.2.25   MonsterBehavior  记录Boss休息了多久
	_dieToCallUnitFunc     2016.3.22   DestroyedBehavior  记录怪物死亡以后的召唤功能，在rt里面怪物死亡动画播完了以后再执行召唤功能
	_hasBeRemoved          2016.3.30   Map              记录物体是否已经从map的数据结构中移除，用来替代object.map_ = nil
	_isPlayBackAni         2016.3.31   FireBehavior     记录物体在播放攻击的时候，是否是播放的背面的动作
	_beforeFlyPosX         2016.4.4    SkillFactory     记录冰龙飞出屏幕前的位置X
	_beforeFlyPosY         2016.4.4    SkillFactory     记录冰龙飞出屏幕前的位置Y
	_bingLongObj           2016.4.4    MapRuntime       记录在被隐藏的那个冰龙物体
	_bingLongAni           2016.4.4    MapRuntime       记录在屏幕中飞行的那个冰龙
	_bingClockedTower      2016.4.4    MapRuntime       记录这一次冰龙飞行被冰冻过的塔
	_bingClickCount        2016.4.4    BattleUI         记录中了冰龙buff以后的塔被点击了几次
	_beforeFlyPosX         2016.4.6    SkillFactory     记录大恶魔王 位面传送前的位置X
	_beforeFlyPosY         2016.4.6    SkillFactory     记录大恶魔王 位面传送前的位置Y
	_plunderEffState       2016.4.28,  TowerObject      增加一个变量记录祭坛塔存储能量的状态，用来控制4层特效的可见不可见
	_plunderFullEff        2016.5.10,  TowerObject      增加一个变量记录祭坛塔能量满了以后显示的特效
	_oriHeroProperty       2016.5.15   MapRuntime 	    用一个变量记录英雄初始的最大血量和攻击力, 用来做第11关的模式3，英雄没杀死一个怪物增加自己的血量和攻击力
	_farAttStateTime       2016.5.31   FireBehavior     记录一下塔的 FAR_ATTACK 状态存在了多久, 用来防止塔播放完攻击动作以后，不会调用结束函数回到Idle状态，导致塔一直不会攻击
	_towerIdleName         2016.5.31   FireBehavior     记录一下塔的Idle动画的名字，用来解决塔不攻击的Bug
	_isSoldierAlive        2016.6.19   MapRuntime       记录这个祭坛塔的某个index的召唤兵是否还活着
	_allPathDist           2016.7.13   MovableBehavior  记录这条路径，也就是这个怪物总共要走多长的距离
    _allNeedMoveDist       2016.7.13   MovableBehavior  记录一下这个怪物还需要走多少距离才到终点
]]


--[[ 程序中用来做判定的ID，策划不得修改
       ID 号        所属配置文件             缘由
       所有技能ID   手动、自动技能           对技能的特殊处理均是通过技能ID 的前五位，来做判定  
       19           GroupProperties	         通过ID号来取得鸟语花香BuffID，雨润杏花释放后返还一朵杏花，拾取后随机使一个英雄30秒内生命上限提升35%
       110301       GroupProperties	         通过ID号来取得鸟语花香BuffID，雨润杏花释放后返还一朵杏花，拾取后随机使一个英雄30秒内生命上限提升35%
       13016        ManualSkillProperties    用来做鸟语花香羁绊的触发判定
       13070        AutoSkillProperties	     用来做天道羁绊的触发判定

]]

return MapConstants
