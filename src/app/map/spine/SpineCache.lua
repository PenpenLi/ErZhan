
-- Spine动画的缓存类


local SpineCache      = class("SpineCache")

SpineCache.spineCache       = {}    -- 缓存spine动画，通过这个动画才能获得skeletonData
SpineCache.spineSkeleDataCache    = {}    -- 缓存spine中的skeletonData


-- 没有new，就不会调用ctor()函数
function SpineCache:ctor(object)

end

function SpineCache.addSpineCache(monsterId, spineAnimation)
	-- 因为传进来的spineAnimation是一个node，所以必须要retain一下，不然就变成null了
	print("SpineCache.addSpineCache monsterId = "..tostring(monsterId))
	spineAnimation:retain()
    SpineCache.spineCache[monsterId]  = spineAnimation
end

function SpineCache.removeSpineCache(monsterId)
	print("SpineCache.removeSpineCache monsterId = "..tostring(monsterId))
	local spineAnimation = SpineCache.spineCache[monsterId]
	if spineAnimation then
		print("SpineCache.removeSpineCache 1 monsterId = "..tostring(monsterId))
		-- remove的时候必须要手动给调用release
		spineAnimation:release()
		SpineCache.spineCache[monsterId] = nil
	end
end

-- 从游戏里面退出以后，要调用这个函数来释放掉缓存的 spine 动画
function SpineCache.removeAllSpineCache()
	print("SpineCache.removeAllSpineCache()")
	for k,v in pairs(SpineCache.spineCache) do
		print("SpineCache.removeAllSpineCache() k = "..tostring(k))
		-- remove的时候必须要手动给调用release
		v:release()
		SpineCache.spineCache[k] = nil
	end
end

function SpineCache.getSpineCache(monsterId)
    return SpineCache.spineCache[monsterId]
end

function SpineCache.getAllSpineCache()
    return SpineCache.spineCache
end


return SpineCache
