
-- 帧动画的缓存类


local CsbAniCache      = class("CsbAniCache")

CsbAniCache.CsbAniCache       = {}



-- 没有new，就不会调用ctor()函数
function CsbAniCache:ctor(object)

end

function CsbAniCache.addCsbAniCache(monsterId, fileName)
	print("CsbAniCache.addCsbAniCache monsterId = "..tostring(monsterId))

	local aniData   = require("app.animation.Ani_"..tostring(monsterId))
	dump(aniData, "dump CsbAniCache.addCsbAniCache aniData")

	display.addSpriteFrames("monster/"..monsterId..".plist", "monster/"..monsterId..".png")

	-- 缓存这个角色的所有动画
	if not CsbAniCache.CsbAniCache[monsterId] then
		CsbAniCache.CsbAniCache[monsterId] = {}
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
			-- print("test all img frames i = "..tostring(i).." frameName = "..tostring(frameName))
			frames[#frames + 1] = cc.SpriteFrameCache:getInstance():getSpriteFrame(frameName)
		end

		animation = display.newAnimation(frames, data.intervalTime) --  0.5/2)     --0.5s里面播放2帧
		animation:retain()

    	CsbAniCache.CsbAniCache[monsterId][aniName]  = animation

    	-- 使用系统的Cache
    	-- display.setAnimationCache(tostring(monsterId)..tostring(aniName), animation)
	end
	dump(CsbAniCache.CsbAniCache, "dump CsbAniCache.CsbAniCache")

end

function CsbAniCache.removeCsbAniCache(monsterId)
	local CsbAniCache = CsbAniCache.CsbAniCache[monsterId]
	if CsbAniCache then
		-- remove的时候必须要手动给调用release
		for aniName, animation in pairs(CsbAniCache) do
			animation:release()
		end
		CsbAniCache.CsbAniCache[monsterId] = nil
	end
end

function CsbAniCache.removeAllCsbAniCache()
	for k,CsbAniCache in pairs(CsbAniCache.CsbAniCache) do
		-- remove的时候必须要手动给调用release
		for aniName, animation in pairs(CsbAniCache) do
			animation:release()
		end
		CsbAniCache.CsbAniCache[k] = nil
	end
end

-- 获得动画
function CsbAniCache.getCsbAniCache(monsterId, aniName)
	print("CsbAniCache.getCsbAniCache monsterId = "..tostring(monsterId)
		.." aniName = "..tostring(aniName))
    return CsbAniCache.CsbAniCache[monsterId][aniName]
end

function CsbAniCache.getAllCsbAniCache()
    return CsbAniCache.CsbAniCache
end


return CsbAniCache
