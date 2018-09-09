
-- 子弹状态
local BulletState = {}

-- 初始化的状态
BulletState.INIT = 0

-- 开始蓄力
BulletState.CHARGE_START = 1

-- 蓄力中
BulletState.CHARGING = 2

-- 开始飞行
BulletState.FLY_START = 3

-- 飞行中
BulletState.FLYING = 4

-- 命中
BulletState.HIT = 5

-- miss
BulletState.MISS = 6

-- 取消
BulletState.CANCEL = 7

-- 完成
BulletState.COMPLETE = 8

-- 释放资源
BulletState.DISPOSE = 9

return BulletState