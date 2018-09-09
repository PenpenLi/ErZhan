
-- 帧动画的缓存类


local FrameAniCache      = class("FrameAniCache")

FrameAniCache.frameAniCache       = {}



-- 没有new，就不会调用ctor()函数
function FrameAniCache:ctor(object)

end

function FrameAniCache.addFrameAniCache(monsterId, fileName)
	print("FrameAniCache.addFrameAniCache monsterId = "..tostring(monsterId))

	local aniData   = require("app.animation.Ani_"..tostring(monsterId))
	dump(aniData, "dump FrameAniCache.addFrameAniCache aniData")

	display.addSpriteFrames("monster/"..monsterId..".plist", "monster/"..monsterId..".pvr.ccz")

	-- 缓存这个角色的所有动画
	if not FrameAniCache.frameAniCache[monsterId] then
		FrameAniCache.frameAniCache[monsterId] = {}
	end

	local animation           -- 生成的动画
	local frames    = {}      -- 最终用来生成动画的所有的frame
	local allFrames           -- 配置的帧顺序
	local frameName           -- 每一帧的名字
	for aniName, data in pairs(aniData) do

		frames = {}

		allFrames = data.frames

		for i = 1, #allFrames do
			frameName = monsterId.."-"..aniName.."_"..allFrames[i]..".png"
			print("test all img frames i = "..tostring(i).." frameName = "..tostring(frameName))
			frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
		end

		animation = display.newAnimation(frames, data.intervalTime) --  0.5/2)     --0.5s里面播放2帧
		animation:retain()

    	FrameAniCache.frameAniCache[monsterId][aniName]  = animation

    	-- 使用系统的Cache
    	-- display.setAnimationCache(tostring(monsterId)..tostring(aniName), animation)
	end
	dump(FrameAniCache.frameAniCache, "dump FrameAniCache.frameAniCache")

end

function FrameAniCache.removeFrameAniCache(monsterId)
	local frameAniCache = FrameAniCache.frameAniCache[monsterId]
	if frameAniCache then
		-- remove的时候必须要手动给调用release
		for aniName, animation in pairs(frameAniCache) do
			animation:release()
		end
		FrameAniCache.frameAniCache[monsterId] = nil
	end
end

function FrameAniCache.removeAllFrameAniCache()
	for k,frameAniCache in pairs(FrameAniCache.frameAniCache) do
		-- remove的时候必须要手动给调用release
		for aniName, animation in pairs(frameAniCache) do
			animation:release()
		end
		FrameAniCache.frameAniCache[k] = nil
	end
end

-- 获得动画
function FrameAniCache.getFrameAniCache(monsterId, aniName)
	print("FrameAniCache.getFrameAniCache monsterId = "..tostring(monsterId)
		.." aniName = "..tostring(aniName))
    return FrameAniCache.frameAniCache[monsterId][aniName]
end

function FrameAniCache.getAllFrameAniCache()
    return FrameAniCache.frameAniCache
end


return FrameAniCache
