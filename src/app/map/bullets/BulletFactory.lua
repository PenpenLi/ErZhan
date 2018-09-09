
local BulletType    = require("app.map.bullets.BulletType")
local ArrowBullet   = require("app.map.bullets.ArrowBullet")
local CannonBullet  = require("app.map.bullets.CannonBullet")
local ChainBullet   = require("app.map.bullets.ChainBullet")
local DartBullet    = require("app.map.bullets.DartBullet")
local DiffuseBullet = require("app.map.bullets.DiffuseBullet")
local DropBullet    = require("app.map.bullets.DropBullet")
local DirectBullet  = require("app.map.bullets.DirectBullet")
local LaserBullet   = require("app.map.bullets.LaserBullet")
local TrackBullet   = require("app.map.bullets.TrackBullet")
local JumpBullet    = require("app.map.bullets.JumpBullet")

local BulletFactory = {}

function BulletFactory.newBullets(bulletType, source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    local delay = weaponConfig.delay
    if not delay then
        delay = 0
    end
    delay = delay/1000

    if bulletType == BulletType.ARROW then
    	-- 射击武器
        return ArrowBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
        -- return {ArrowBullet.new(source, target, delay)}
    elseif bulletType == BulletType.CANNON then
        -- 爆炸武器
        return CannonBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
        -- return {CannonBullet.new(source, target, delay)}
	elseif bulletType == BulletType.CHAIN then
	    -- 链式子弹
	    return ChainBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.DART then
        -- 回旋子弹
        return DartBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.DIFFUSE then
        -- 扩散子弹
        return DiffuseBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.DROP then
        -- 陨落子弹
        return DropBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.DIRECT then
        -- 直接处理子弹
        return DirectBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.LASER then
        -- 激光子弹
        return LaserBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.TRACK then
        -- 跟踪子弹
        return TrackBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    elseif bulletType == BulletType.JUMP then
        -- 跳跃子弹
        return JumpBullet.new(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    end

    echoError("BulletFactory.newBullets() - invalid bullet type %s", tostring(bulletType))
end

return BulletFactory
