
-- 特效帧动画的缓存类


local EffectAniCache      = class("EffectAniCache")

EffectAniCache.effectAniCache       = {}



-- 没有new，就不会调用ctor()函数
function EffectAniCache:ctor(object)

end

function EffectAniCache.addEffectAniCache(effectName, data)
	-- print("EffectAniCache.addEffectAniCache")

	-- local aniData   = require("app.properties.EffectProperties")
	-- dump(aniData, "dump EffectAniCache.addEffectAniCache aniData")

	-- add by Owen, 2016.6.21, 如果这个特效文件已经缓存过了，那么直接返回
	if EffectAniCache.effectAniCache[effectName] then
		return
	end

	local animation           -- 生成的动画
	local frames    = {}      -- 最终用来生成动画的所有的frame
	local allCount            -- 配置的特效动画总共有几帧
	local aniName          -- 特效图片存放的位置
	local frameName           -- 每一帧的名字
	-- for effectName, data in pairs(aniData) do

		frames = {}

		allCount = data.count

		aniName = data.name

		-- 缓存这个特效的动画
		if not EffectAniCache.effectAniCache[effectName] then
			EffectAniCache.effectAniCache[effectName] = {}
		end

		display.addSpriteFrames(aniName..".plist", aniName..".png")

		for i = 1, allCount do
			frameName = effectName.."_"..i..".png"
			-- print("test all img frames i = "..tostring(i).." frameName = "..tostring(frameName))
			frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
		end


		animation = display.newAnimation(frames, data.intervalTime) --  0.5/2)     --0.5s里面播放2帧
		animation:retain()

		-- change by Owen, 2016.3.23, 增加Y轴中心点的配置，和X轴方向上偏移的配置
		local offsetY = 0
		local centerY = 0
		local offsetX = 0
		if data.offsetY then
			offsetY = data.offsetY
		end
		if data.centerY then
			centerY = data.centerY
		end
		if data.offsetX then
			offsetX = data.offsetX
		end

    	EffectAniCache.effectAniCache[effectName]  = {animation, offsetY, centerY, offsetX}

    	-- 使用系统的Cache
    	-- display.setAnimationCache(tostring(effectName)..tostring(aniName), animation)
	-- end
	-- dump(EffectAniCache.effectAniCache, "dump EffectAniCache.effectAniCache")

end

function EffectAniCache.removeEffectAniCache(effectName)
	local effectAniCache = EffectAniCache.effectAniCache[effectName]
	if effectAniCache then
		-- remove的时候必须要手动给调用release
		effectAniCache[1]:release()
		EffectAniCache.effectAniCache[effectName] = nil
	end
end

function EffectAniCache.removeAllEffectAniCache()
	for k,effectAniCache in pairs(EffectAniCache.effectAniCache) do
		-- remove的时候必须要手动给调用release
		effectAniCache[1]:release()
		EffectAniCache.effectAniCache[k] = nil
	end
end

-- 获得动画。    target 表示需要添加这个effect的object
-- needRetain    true表示播放一次后不需要移除，用来做第11关的开路动画
function EffectAniCache.getEffectAniCache(effectName, isForever, finishFunc, target, needRetain)
	-- print("EffectAniCache.getEffectAniCache effectName = "..tostring(effectName))
	local animation = EffectAniCache.effectAniCache[effectName][1]
	local offsetY   = EffectAniCache.effectAniCache[effectName][2]
	local centerY   = EffectAniCache.effectAniCache[effectName][3]
	local offsetX   = EffectAniCache.effectAniCache[effectName][4]
	
	local sprite = display.newSprite("#"..effectName.."_1.png")
	-- dump(animation, "dump animation")
	-- dump(sprite, "dump sprite")
	if isForever then
		sprite:playAnimationForever(animation)
	else
		if needRetain then
			sprite:playAnimationOnce(animation, nil, finishFunc)
		else
			sprite:playAnimationOnce(animation, "removeWhenFinished", finishFunc)
		end
	end

	
	-- 1=脚底为中心，2=体积为中心，3=头顶位中心
	if target then
		if centerY == 2 then
			-- 特效要对在目标的中心点位置
			offsetY = offsetY + target.radiusOffsetY_ + offsetY
		elseif centerY == 3 then
			-- 特效要对在目标的头顶位置
			offsetY = offsetY + target.radiusOffsetY_ + target.radius
		end
	end

    return sprite, offsetY, offsetX
end

-- add by Owen, 2016.5.5, 添加一个获得手指动画的接口给大厅调用
function EffectAniCache.getFingerInHall()
	display.addSpriteFrames("effect/common/Finger.plist", "effect/common/Finger.png")

	local effectName = "Finger"
	local frameName
	local frames     = {}
	for i = 1, 17 do
		frameName = effectName.."_"..i..".png"
		-- print("test all img frames i = "..tostring(i).." frameName = "..tostring(frameName))
		frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
	end

	local sprite = display.newSprite("#"..effectName.."_1.png")
	local animation = display.newAnimation(frames, 0.067) --  0.5/2)     --0.5s里面播放2帧
	
	sprite:playAnimationForever(animation)
    return sprite
end

function EffectAniCache.getAllEffectAniCache()
    return EffectAniCache.effectAniCache
end


return EffectAniCache
