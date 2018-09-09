
-- 已废弃
-- 新版子弹，不用这个了，还是用老版本的


-- 动画的文件夹
local PATH_PREFIX = "bullets"

-- 动画路径格式
local PATH_FORMAT = PATH_PREFIX .. "/%s_%s"

-- 默认特效前缀
local DEFAULT = "default"

-- 各特效的默认 state
local DEFAULT_STATE = "idle"

-- @private
-- print
local function debug(this, s)
	bullet_log("----------------------------------------------------------------------------------------------------")
	bullet_log("Bullet （{1})", s)
end

-- 子弹状态
local BulletState = require("app.map.bullets.BulletState")

-- math2d
local math2d = require("math2d")


local MapConstants = require("app.map.MapConstants")

-- 放到本地速度更快
local INIT = BulletState.INIT
local CHARGE_START = BulletState.CHARGE_START
local CHARGING = BulletState.CHARGING
local FLY_START = BulletState.FLY_START
local FLYING = BulletState.FLYING
local HIT = BulletState.HIT
local MISS = BulletState.MISS
local COMPLETE = BulletState.COMPLETE
local CANCEL = BulletState.CANCEL
local DISPOSE = BulletState.DISPOSE

-- 新版子弹
local Bullet = class("Bullet")

-- 创建一个新的 Bullet
-- @params 参数，允许的值有
-- {
-- 	a = 必选，攻
-- 	b = 必选，守
--  runtime = 可选，将自动添加到 MapRuntime 中。默认 nil
--  charge = 可选，发射前的蓄气动画；nil 表示不显示。默认 nil
-- 	bullet = 可选，子弹动画；nil 表示不显示。默认 nil
-- 	hit = 可选，命中特效；nil 表示使用默认出血特效。默认 nil
-- 	miss = 可选，miss 特效；nil 表示不显示特效。默认 nil
--  cancel = 可选，cancel 特效；nil 表示和 miss 使用相同特效。默认 nil
-- 	flyDuration = 可选，子弹飞行时间；nil 表示根据距离自动计算
-- 	isRotate = 可选，子弹飞行时是否旋转。默认使用 MapConstants 中的设定
--  isHitOnFoot = 可选，命中特效是否落在脚下，默认 false。
--  damageFunction = function (who) end 可选，命中时伤害计算函数，应返回一个 Damage 对象。nil 表示不产生伤害，子弹会进入 HIT 状态，默认 nil。
--  onCharge = function (who) end，可选，蓄气时回调
-- 	onHit = function (who) end，可选，命中时回调
-- 	onMiss = function (who) end，可选，miss 时回调
-- 	onDispose = function (who) end，释放时回调
-- }
function Bullet:ctor(params)
	if (params) then
		self:setParams(params)
	end
end

-- 静态方法：创建 AOE 的子弹列表
-- @params 和 ctor 的参数一样，但是有特例：
-- {
-- b = 不可选
-- runtime = 必选
-- x = 释放的 x
-- y = 释放的 y
-- range = 释放范围
-- }
-- @return 创建了的子弹数组
function Bullet.aoe(params)
	assert(params.b == nil, "不能使用属性 b")
	assert(params.runtime ~= nil, "runtime 是必选的")

	local bs = params.runtime:getRangeTargets(params.a, true, params.x, params.y, params.range)
	bullet_log("----------------------------------------------------------------------------------------------------")
	bullet_log("Bullet.aoe count({1})", #bs)

	local result = {}

    for i, b in ipairs(bs) do
    	bullet_log("Bullet.aoe id({1}) x({2}) y({3})", b:getId(), b.x_, b.y_)
    	params.b = b
        result[i] = Bullet.new(params)
    end

    return result
end

local function bringToFront(relative, sprite)
	sprite:setZOrder(relative:getView():getZOrder() + 1)
end

-- @private
-- 立即切换到指定状态
-- @param this 子弹
-- @param state 状态
local function setState(this, state, dt)
	this.state = state
	this:tick(dt)
end

-- @private																																																				   
-- 删除所有 sprite
local function removeAllSprites(this)
	if (not this.sprites) then
		return
	end
	for k, sprite in pairs(this.sprites) do
		if sprite then
			sprite:removeSelf()
		end
	end
	this.sprites = nil
end

-- 删除一个 sprite
local function removeSprite(this, key)
	if (not this.sprites) then
		return
	end
	if (this.sprites[key]) then
		this.sprites[key]:removeSelf()
		this.sprites[key] = nil
	end
end

-- 设置参数
function Bullet:setParams(value)
	local params = value

	assert(params.b ~= nil, "子弹不能没有 B")

	-- a 和 b
	self.a = params.a
	self.b = params.b
	print("Bullet:setParams self.b = "..tostring(self.b))

	-- 5 种动画
	self.charge = params.charge
	self.bullet = params.bullet
	self.hit = params.hit or DEFAULT
	self.miss = params.miss
	self.cancel = params.cancel or params.miss

	-- 把所有动画引用存到这个 table 里
	removeAllSprites(self)

	-- 子弹飞行时间
	self.flyDuration = params.flyDuration

	-- 是否命中在脚下
	self.isHitOnFoot = params.isHitOnFoot

	-- 子弹是否旋转
	if (params.isRotate == nil) then
		self.isRotate = false -- MapConstants.bullets[tostring(params.a.resId_)] ~= nil
	else
		self.isRotate = params.isRotate
	end
	self.isRotate = true

	-- 回调函数
	self.onCharge = params.onCharge
	self.onHit = params.onHit
	self.onMiss = params.onMiss
	self.onCancel = params.onCancel
	self.onDispose = params.onDispose

	-- 打出去的子弹是不是溅射攻击的
	self.isBallistic = false
	if self.a.ballisticType_ and self.a.ballisticType_[1] ~= 0 then 
		self.isBallistic = true
	end

	-- 伤害函数
	self.damageFunction = params.damageFunction

	-- 子弹造成的伤害
	self.damage = nil

	-- 本来在 flyComplete() 函数中计算伤害值，那个时候obj和target的状态可能改变了
	-- 所以要一开始的时候就计算
	if (self.damageFunction) then
		print("")
		self.damage = self.damageFunction(self)
	end

	-- 状态
	self.state = INIT

	-- 自动添加到 MapRuntime
	if (params.runtime) then
        params.runtime:addBullet(self)
        self.runtime = params.runtime
	end
end

-- 状态处理函数
local stateFunctions = {}

stateFunctions[INIT] = function (this, dt)
	-- 立即进入 CHARGE_START
	setState(this, CHARGE_START, dt)
end

stateFunctions[CHARGE_START] = function (this, dt)
	-- 蓄力动画
	local sprite = this:getSprite("charge")
	
	-- TODO 还没侧过
	if (sprite) then
		-- 蓄气动画出现在脚下
		sprite:setPosition(a.x_, b.y_)

		sprite:play(DEFAULT_STATE,
			-- 播放完毕删除自己
			function (who)
				removeSprite("charge")
			end,
			-- hit 时进入 FLY_START
			function (who)
				this.state = FLY_START
			end)

		-- 切换到 CHARGING
		this.state = CHARGING
		if (this.onCharge) then
			this.onCharge(this)
		end
	else
		-- 没有蓄力动画，立即进入 FLY_START
		setState(this, FLY_START, dt)
	end
end

stateFunctions[CHARGING] = function (this, dt)
	-- 不做任何事
end

local function checkHit(this)


    local target = this.b
    if target and (target.collisionLock_ > 0 or not target.collisionEnabled_ or target.destroyed_) then
        -- print("目标死亡了，所以miss了")
        return false
    end

    local x, y = this:getSprite("bullet"):getPosition()
    local targetX = target.x_ + target.radiusOffsetX_
    local targetY = target.y_ + target.radiusOffsetY_
    -- print("x = "..tostring(x).." y = "..tostring(y).." targetX = "
    -- 	..tostring(targetX).." targetY = "..tostring(targetY))

    if math2d.dist(x, y, targetX, targetY) <= target.radius_ then
        return true
    end

    return false
end

-- 飞行结束
local function flyComplete(this)
	-- 放到一开始的时候就去计算伤害值
	-- if (this.damageFunction) then
	-- 	this.damage = this.damageFunction(this)
	-- end
	-- print("Bullet flyComplete(this)")

	if (not this.damage) then
		-- print("Bullet flyComplete(this) 1")
		this.state = CANCEL
		if (this.onCancel) then
			this.onCancel(this)
		end
	elseif (this.damage.isHit == false) then  --  (this.damage.isMiss) then
		-- print("Bullet flyComplete(this) 2")
		this.state = MISS
		if (this.onMiss) then
			this.onMiss(this)
		end
	elseif (this.damage.isHit) then
		-- print("Bullet flyComplete(this) 3")
		-- 虽然目标没有闪避掉这次攻击，但还需要判定一下子弹是否落在目标的范围内
		if checkHit(this) then
			this.state = HIT
			if (this.onHit) then
				this.onHit(this)
			end
		else
			-- 目标已经离开了子弹落在的那个区域
			-- print("miss 了，目标已经离开了子弹落在的那个区域")
			this.state = MISS
			if (this.onMiss) then
				this.onMiss(this)
			end
		end
	end
end

stateFunctions[FLY_START] = function (this, dt)
	local sprite = this:getSprite("bullet")

	-- 如果没有 bullet ，立即产生伤害
	if (not sprite) then
		flyComplete(this)
		return
	end

	local a = this.a
	local b = this.b

	-- 子弹起始坐标
	local scaleX = -1
	if (a.flipView_) then
		scaleX = 1
	end

	this.time_ = 0
	this.g_ = -1000

    local offsetX, offsetY = 1,1 -- a:getView():getOffset("p1")

    if (offsetX == 0) then
        offsetX = a.radiusOffsetX_ + a.fireOffsetX_ * scaleX
    else
        offsetX = offsetX * scaleX
    end
    if (offsetY == 0) then
        offsetY = a.radiusOffsetY_ + a.fireOffsetY_
    end


	this.startX_ = a.x_ + offsetX
	this.startY_ = a.y_ + offsetY

	-- 设置子弹到初始位置
	sprite:setPosition(this.startX_, this.startY_)

	this.prevX_ = this.startX_
	this.prevY_ = this.startY_

	-- 根据距离计算飞行时间
	if (this.flyDuration == nil) then
		local speed = 500
		local distance = math2d.dist(this.startX_, this.startY_, b.x_, b.y_)
		this.flyDuration = distance / speed
	end

	local targetX, targetY
	if b:hasBehavior("MovableBehavior") and b:isMoving() then
		targetX, targetY = b:getFuturePosition(this.flyDuration)
	else
		targetX, targetY = b.x_, b.y_
	end
	targetX = targetX + b.radiusOffsetX_ + b.hitOffsetX_
	targetY = targetY + b.radiusOffsetY_ + b.hitOffsetY_

	-- 子弹会落在目标中心点的一定范围内
	local radius = b.radius_
	-- local offset = radius * (math.random(90, 100) / 100)
	local offset = radius * (math.random(90, 100) / 100) * 0.7
	if math.random(1, 2) % 2 == 0 then
		this.dropOffsetX = offset
	else
		this.dropOffsetX = -offset
	end

	targetX = targetX + this.dropOffsetX

	offset = radius * (math.random(90, 100) / 100) * 0.7
	if math.random(1, 2) % 2 == 0 then
		this.dropOffsetY = offset * 0.5
	else
		this.dropOffsetY = - offset * 0.5
	end
	
	targetY = targetY + this.dropOffsetY

	this.targetX_ = targetX
	this.targetY_ = targetY
	print(" this.targetX_ = "..tostring(this.targetX_).." this.targetY_ = "..tostring(this.targetY_))

	-- 根据距离计算飞行时间
	if (this.flyDuration == nil) then
		local speed = 250
		local distance = math2d.dist(this.startX_, this.startY_, this.targetX_, this.targetY_)
		this.flyDuration = distance / speed
	end

	local ft = this.flyDuration
	this.speedX_ = (this.targetX_ - this.startX_) / ft
	-- 这样计算speedY，才有一个抛物线的效果
	this.speedY_ = ((this.targetY_ - this.startY_) - ((this.g_ * ft) * (ft / 2))) / ft
	-- this.speedY_ = (this.targetY_ - this.startY_) / ft
	
	this.state = FLYING
end

local radians4point   = math2d.radians4point
local radians2degrees = math2d.radians2degrees

-- 飞行状态
stateFunctions[FLYING] = function (this, dt)
	this.time_ = this.time_ + dt

	local time = this.time_

	-- 计算出当前 XY
	local x = this.startX_ + time * this.speedX_
	-- 这样计算Y，才有一个抛物线的效果
	local y = this.startY_ + time * this.speedY_ + this.g_ * time * time / 2
	-- local y = this.startY_ + time * this.speedY_

	local sprite = this:getSprite("bullet")
	sprite:setPosition(x, y)

	-- 计算旋转
	if (this.isRotate) then
		local degrees = radians2degrees(radians4point(this.prevX_, this.prevY_, x, y))
		-- sprite:setRotationY(degrees)
		sprite:setRotation(degrees)
	end

	this.prevX_, this.prevY_ = x, y
	-- print("flyDuration = "..tostring(this.flyDuration))
	if (time >= this.flyDuration) then
		flyComplete(this)
	end
end

stateFunctions[HIT] = function (this, dt)
	removeSprite(this, "bullet")

	local sprite = this:getSprite("hit")
	if (not sprite) then
		this.state = COMPLETE
		return
	end

	local a = this.a
	local b = this.b

	local targetX = b.x_
	local targetY = b.y_

	if (not this.isHitOnFoot) then
		targetX = targetX + b.hitOffsetX_
		targetY = targetY + b.hitOffsetY_
	end

	sprite:setPosition(targetX, targetY)
	
	this:dispose()
   
	-- b:setColor(ccc3(0xf0,0,0))
	
	-- if (b.x_ > a.x_) then
	--     b:setRotation(5)
	-- else
	--     b:setRotation(-5)
	-- end

	-- --TODO_DEV 临时屏蔽报错
	-- if this.b:getView() ~= nil then
	-- 	bringToFront(this.b, sprite)
	-- end

	-- sprite:play("idle", function()
	--     b:setColor(ccc3(0xff,0xff,0xff))
	    
	--     b:setRotation(0)
	--     removeSprite("bullet")
	--     this:dispose()
	-- end)

	-- this.state = COMPLETE
end

stateFunctions[MISS] = function (this, dt)
	-- 删除子弹
	removeSprite(this, "bullet")
	
	local sprite = this:getSprite("miss")
	if (not sprite) then
		this.state = COMPLETE
		return
	end
	local b = this.b
	local targetX = b.x_ + b.radiusOffsetX_ + this.dropOffsetX
	local targetY = b.y_ + b.radiusOffsetY_ + this.dropOffsetY
	sprite:setPosition(targetX, targetY)

	this:dispose()
	
	-- sprite:play(DEFAULT_STATE, function()
	-- 	removeSprite(this, "miss")
	-- 	this:dispose()
	-- end)

	this.state = COMPLETE
end

stateFunctions[CANCEL] = function (this, dt)
	-- 删除子弹
	removeSprite(this, "bullet")
	
	local sprite = this:getSprite("cancel")
	if (not sprite) then
		this.state = COMPLETE
		return
	end

	local b = this.b
	local targetX = b.x_ + b.radiusOffsetX_ + this.dropOffsetX
	local targetY = b.y_ + b.radiusOffsetY_ + this.dropOffsetY
	sprite:setPosition(targetX, targetY)
	sprite:play(DEFAULT_STATE, function()
		removeSprite(this, "cancel")
		this:dispose()
	end)

	this.state = COMPLETE
end

stateFunctions[COMPLETE] = function (this, dt)
	
end

stateFunctions[DISPOSE] = function (this, dt)
end

-- 每帧都会执行，是主要方法
function Bullet:tick(dt)
	local f = stateFunctions[self.state]
	assert(f ~= nil, "state 不正确: " .. tostring(self.state))
	f(self, dt)
end

-- 根据 key 获得指定的 sprite，返回的 sprite 已被添加到 a 的视图同级
-- @param key 允许的值有 charge, bullet, hit, miss, cancel
function Bullet:getSprite(key)
	if key == "charge" or key == "cancel" then
		-- return display.newSprite("#Arrow01.png") 
		return nil
	end
	-- -- 没有指定 key 的参数，直接返回 nil
	-- if (self[key] == nil) then
	-- 	-- print(format([[Bullet:getSprite ("{1}") -> value=nil]], key))
	-- 	return nil
	-- end

	-- 延迟创建 sprites
	if (not self.sprites) then
		self.sprites = {}
	end

	-- 先查询缓存
	local result = self.sprites[key]
	if (result ~= nil) then
		return result
	end

	-- -- 之前已经查询过，资源并不存在，返回 nil
	-- if (result == false) then
	-- 	return nil

	-- -- 返回已缓存了的资源
	-- elseif (result ~= nil) then
	-- 	return result
	-- end

	-- -- 组装路径
	-- local path = string.format(PATH_FORMAT, self[key], key)

	-- -- 找到指定的动画
	-- result = ResourceManager.getAnimation(path)
	-- --兼容
	-- if result==nil and (key=="bullet" or key=="hit") then
	-- 	local oldPath = nil
	-- 	if key=="bullet" then
	-- 		oldPath = format("anim/{1}_bullet", self.bullet)
	-- 	elseif key=="hit" then	
	-- 		oldPath = format("anim/{1}_bullet_hit", self.bullet)
	-- 	end
	-- 	bullet_log("子弹资源 {1}", oldPath)
	-- 	result = ResourceManager.getAnimation(oldPath)
	-- end
	-- if result==nil and (key=="bullet" or key=="hit") then
	-- 	local oldPath = nil
	-- 	if key=="bullet" then
	-- 		oldPath = format("bullet/{1}_bullet", self.bullet)
	-- 	elseif key=="hit" then	
	-- 		oldPath = format("bullet/{1}_bullet_hit", self.bullet)
	-- 	end
	-- 	bullet_log("子弹资源 {1}", oldPath)
	-- 	result = ResourceManager.getAnimation(oldPath)
	-- end
	-- print(format([[Bullet:getSprite ("{1}") -> path="{2}", isExist=({3})]], key, path, result ~= nil))

	if result == nil then
		result = display.newSprite("#Arrow01.png") -- this:getSprite("bullet")
	end

	if (result ~= nil and self.a.map_) then
		self.sprites[key] = result

		-- 添加到 a 同级
		local aView = self.a:getView()
		aView:getParent():addChild(result, 10) -- aView:getZOrder() + 1)
	else
		-- 找不到资源，标记为不存在
		self.sprites[key] = false
	end
	
	return result
end


-- 释放资源
function Bullet:dispose()
	if (self.state == BulletState.DISPOSE) then
		return
	end

	removeAllSprites(self)
	if (self.onDispose) then
		self.onDispose(self)
	end

	self.state = DISPOSE
end

function Bullet:dump()
	-- dump({
		-- a = self.a:getId(),
		-- b = self.b:getId(),
		-- charget = self.charge,
		-- bullet = self.bullet,
		-- hit = self.hit,
		-- cancel = self.cancel,
		-- flyDuration = self.flyDuration,
		-- isRotate = self.isRotate,
		-- isHitOnFoot = self.isHitOnFoot,
		-- damageFunction = self.damageFunction or "nil",
		-- onCharge = self.onCharge or "nil",
		-- onHit = self.onHit or "nil",
		-- onMiss = self.onMiss or "nil",
		-- onDispose = self.onDispose or "nil"
	-- }, "Bullet")
end

return Bullet