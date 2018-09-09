
local BulletType = {}

-- 子弹的类型
BulletType.ARROW  		  = 1	-- 射击子弹
BulletType.CANNON 		  = 2	-- 爆炸子弹
BulletType.CHAIN	 	  = 3	-- 链式子弹
BulletType.DART		 	  = 4	-- 回旋子弹
BulletType.DIFFUSE	 	  = 5	-- 扩散子弹
BulletType.DROP		 	  = 6	-- 坠落子弹
BulletType.DIRECT	 	  = 7	-- 直接对攻击目标进行处理的子弹
BulletType.LASER	 	  = 8	-- 激光子弹
BulletType.TRACK	 	  = 9	-- 跟踪子弹
BulletType.JUMP           = 10  -- 跳跃子弹

-- BulletType.MANUL_dIFFUSE  = 8	-- 手动扩散子弹，以手指按的位置为中心点，周围一圈寻找目标
									-- 改为如果是手动技能调用扩散子弹，那么程序写死用手指点击为中心

-- 子弹的轨迹
BulletType.STRAIGHT     = 1 -- 直线子弹
BulletType.PARABOLA     = 2 -- 抛物线子弹
BulletType.CIRCLE       = 3 -- 跟踪转圈子弹

return BulletType
