
-- 定义一个枚举table
-- 方便记录在地图编辑器中新建了什么类型的数据，以及在map中通过这个去获取数据
-- 用来 map.lua 函数中，newObject、remove的classId

local ObjectType = {}

-- 可以用来造塔的坑位
ObjectType.TOWER_LOCATION        = "towerlocation"

return ObjectType
