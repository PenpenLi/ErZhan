
-- 
-- 记录了对象状态值,用来在FireBehavior中的tick函数中做判定
local ObjectState = {}

-- 什么都没有的状态（目前还没用到）
ObjectState.NULL = 0

-- 移动中，此时不会自动索敌，直到移动完毕
ObjectState.MOVE = 2

-- 原地不动的状态，一旦找到目标，将进入 TRACK 状态
ObjectState.IDLE = 3

-- 跟踪中，直到目标进入攻击范围
ObjectState.TRACK = 4

-- 远程攻击中，直到目标死亡或离开视野，或者进入自己的拔刀范围
ObjectState.FAR_ATTACK = 5

-- 攻击中，直到目标死亡或离开视野
ObjectState.ATTACK = 6

-- 强制停止的状态，不会攻击也不会移动
ObjectState.STOP = 7

-- 正在释放技能，包括技能引导的时候也是这个状态
ObjectState.RELEASE_SKILL = 8

-- 物体被击晕的状态
ObjectState.COMA = 9

-- 巡逻状态，这个状态没有用到
ObjectState.PATROL = 10

-- 打完怪物以后，拔刀范围内没有怪物了，回答驻扎点
ObjectState.MOVE_TO_PATROL = 11

-- 正在播放死亡动画的状态
ObjectState.DEATH = 12

-- 英雄死亡后的尸体状态
ObjectState.DEATHED = 13

-- 英雄复活的时候，播放复活动画的状态
ObjectState.RELIVE = 14

-- 怪物从空中变成地面，播放下落动画的状态
ObjectState.FALL = 15

-- 英雄播放跳舞动作的状态
ObjectState.DANCE = 16

-- 召唤出来的怪物，或者士兵，播放出生动画
ObjectState.BORN  = 17

-- Boss的时间到了，正在休息
ObjectState.BOSS_REST  = 18

-- 地下怪物从地下钻出到地面
ObjectState.UP_TO_LAND  = 19

-- 地下怪物从地面钻入到地下
ObjectState.DOWN_TO_DOWNLAND  = 20


local STATE_VALUE_USE_STRING = __IS_DEBUG

-- 调试模式：状态值使用字符串记录以方便调试
if (STATE_VALUE_USE_STRING) then
	ObjectState.NULL 			= "NULL"
	ObjectState.MOVE 			= "MOVE"
	ObjectState.IDLE 			= "IDLE"
	ObjectState.TRACK 			= "TRACK"
	ObjectState.FAR_ATTACK 		= "FAR_ATTACK"
	ObjectState.ATTACK 			= "ATTACK"
	ObjectState.STOP 			= "STOP"
	ObjectState.RELEASE_SKILL 	= "RELEASE_SKILL"
	ObjectState.COMA          	= "COMA"
	ObjectState.PATROL 			= "PATROL"
	ObjectState.MOVE_TO_PATROL  = "MOVE_TO_PATROL"
end


--[[
	1. 怪物初始是MOVE状态
	2. 在攻击的时候状态置为ATTACK和FAR_ATTACK，在帧事件回调中调用子弹出伤害
		在动画结束回调中，将状态置为IDLE，并播放Idle动画
	3. 在FireBehavior:tick()中，如果object的状态是ATTACK、FAR_ATTACK、RELEASE_SKILL
		那么直接return，不进行tick处理，因为要等动画播放完了以后在重新计算攻击CD
	4. 在FireBehavior:tick()中，如果英雄向怪物靠近，也就是调用track函数，那么将状态置为TRACK
	5. 在FireBehavior:tick()中，当英雄近战范围内有怪物，但攻击CD没到，把状态置为IDLE
	6. 在FireBehavior:tick()中，当怪物被配对后在等英雄时，把状态置为IDLE，这样就不会移动了
	7. 在FireBehavior:tick()中，怪物解除配对等其他情况要开始移动时，把状态置为MOVE
	8. 在rt:tick()中，拔刀范围内没有敌人，回到驻扎地点时，将状态置为MOVE_TO_PATROL，
		并让英雄开始移动，在MovableBehavior moveComplete()中，移动完成时会把状态置为IDLE
	9. 在rt:moveMasterTo、moveSingleHeroTo中，调用moveTo()时，将英雄的状态置为MOVE
	10. 在MovableBehavior:tick()中，只有MOVE、TRACK、MOVE_TO_PATROL这三个状态下才可以移动
	11. 在MovableBehavior:tick()中，当移动完成时moveComplete()中，把状态置为IDLE
]]


return ObjectState