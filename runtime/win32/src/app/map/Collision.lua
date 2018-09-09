
local SkillBase    = require("app.map.skills.SkillBase")
local MapConstants = require("app.map.MapConstants")
local ObjectState  = require("app.map.ObjectState")
local ObjectBase   = require("app.map.ObjectBase")
local Collision = {}


local MAP_EVENT_COLLISION_BEGAN = 1
local MAP_EVENT_COLLISION_ENDED = 2
local MAP_EVENT_FIRE            = 3
local MAP_EVENT_NO_FIRE_TARGET  = 4

local kMapEventCollisionBegan    = 1
local kMapEventCollisionEnded    = 2
local kMapEventCollisionFire     = 3
local kMapEventCollisionNoTarget = 4

-- copy global to local
local kMapObjectClassIndexPath       = kMapObjectClassIndexPath
local kMapObjectClassIndexRange      = kMapObjectClassIndexRange
local kMapObjectClassIndexStatic     = kMapObjectClassIndexStatic

local CLASS_INDEX_PATH   = ObjectBase.CLASS_INDEX_PATH
local CLASS_INDEX_RANGE  = ObjectBase.CLASS_INDEX_RANGE
local CLASS_INDEX_STATIC = ObjectBase.kMapObjectClassIndexStatic -- ObjectBase.CLASS_INDEX_STATIC


function Collision.check(checkobjects, colls, dt)

	local events = {}
    for i1, t1 in pairs(checkobjects) do
       
        if t1.collisionEnabled_ and not t1.destroyed_ and t1.classIndex_ == kMapObjectClassIndexStatic then
            local notarget = true       -- 在fireRange范围中没有物体
            local fireTargets = {}  	-- 用来记录在t1的fireRange范围中的物体
            if type(colls[t1:getId()]) ~= "table" then
                colls[t1:getId()] = {}
            end

            for i2,t2 in pairs(checkobjects) do 
           
                if type(colls[t1:getId()][t2:getId()] ) ~= "table" then
                    colls[t1:getId()][t2:getId()] = {}
                end 
           
                if t2.classIndex_ == kMapObjectClassIndexRange then

                    local bNeedCheck = true
                    -- 物体和区域做碰撞检测，判断一下t1是否属于t2的作用对象
                    if t2.classId_ == "areaobject" then
                        -- 判断这个物体能不能被这个区域作用
                        if not SkillBase.checkSkillTarget(t1, t2.actionObject) then
                            bNeedCheck = false
                        end
                    elseif t2.classId_ == "rangeobject" then
                        local rangeType = t2:getRangeType()
			            
			            if rangeType == MapConstants.END_RANGE or rangeType == MapConstants.JUMP_RANGE
			            	or rangeType == MapConstants.HIDE_RANGE or rangeType == MapConstants.ENTER_RANGE
			            	or rangeType == MapConstants.OUT_RANGE then
			            	-- 这些区域只对怪物有效
			            	if not t1:hasBehavior("MonsterBehavior") then
			            		bNeedCheck = false
			            	end
			            elseif rangeType == MapConstants.SLOW_DOWN_RANGE then
			            	-- 减速可能对怪物和英雄有效
			            	if not t1:hasBehavior("MonsterBehavior") and not t1:hasBehavior("HeroBehavior") then
			            		bNeedCheck = false
			            	end
			            end
                    end

                    -- 先简单算一下两点的距离，大于区域的半径的话就不需要进行椭圆的计算了
                    if bNeedCheck then
                    	if not t2.radiusOffsetX_ then t2.radiusOffsetX_ = 0 end
				        if not t2.radiusOffsetY_ then t2.radiusOffsetY_ = 0 end
				        local objX = t1.x_ + t1.radiusOffsetX_
				        local objY = t1.y_ + t1.radiusOffsetY_
				        
				        local tarX = t2.x_ + t2.radiusOffsetX_
				        local tarY = t2.y_ + t2.radiusOffsetY_
				        if math.abs(objX - tarX) > (t2.radius_ + t1.radius_)
				        	or math.abs(objY - tarY) > (t2.radius_ + t1.radius_) then
				        	bNeedCheck = false
				        end
                    end

                    -- 物体属于区域的作用对象才需要做碰撞检测
                    if bNeedCheck then

                        -- print("t1.mainID_ = "..tostring(t1.mainID_).." t1.id_ = "..t1.id_
                        --     .." t2.mainID_ = "..tostring(t2.mainID_).."t2.id_ = "..t2.id_)
                        local isCollision = t1:isInRange(t2)

                    	-- 之前是在区域中的
                        if colls[t1:getId()][t2:getId()][1] then
                            if not isCollision then
                                events[#events+1] = {kMapEventCollisionEnded,t1,t2}
                            end
                        else
                            if isCollision then
                                events[#events+1] = {kMapEventCollisionBegan,t1,t2} 
                            end
                        end
                       
                        colls[t1:getId()][t2:getId()][1] = isCollision
                    end
              
               elseif t2.classIndex_ == kMapObjectClassIndexStatic then-- and t2.collisionEnabled_  and not t2.destroyed_  and t1:hasBehavior("CampBehavior") and t1:campCheck(t2) then
                    

                    -- t1 和 t2 都是staticObject

                    -- 先判定t2是否在t1的fireVision中，也就是英雄和怪物的远程射击范围
                    local bFireRange  = true
                    local bFireVision = true

                    if t1:hasBehavior("MonsterBehavior") then
                    	if t1.fireVision_ == 80 then
                    		-- 如果是近战的英雄或者怪物，是不需要检索fireVision的
	                    	bFireVision = false
                    	elseif t1.curState == ObjectState.ATTACK or t1.curState == ObjectState.FAR_ATTACK
                    		or t1.curState == ObjectState.Coma or t1.curState == ObjectState.RELEASE_SKILL then
                    		-- 攻击、眩晕、放技能的时候，不需要做判定
                    		bFireRange  = false
                    		bFireVision = false
	                    elseif t2:hasBehavior("MonsterBehavior") then
	                    	-- 怪物不需要跟怪物进行检测
	                    	bFireRange  = false
	                    	bFireVision = false
	                    end
	                elseif t1:hasBehavior("HeroBehavior") then
                    	if t1.fireVision_ == 80 then
                    		-- 如果是近战的英雄或者怪物，是不需要检索fireVision的
	                    	bFireVision = false
	                    elseif t1.curState == ObjectState.ATTACK or t1.curState == ObjectState.FAR_ATTACK
                    		or t1.curState == ObjectState.COMA or t1.curState == ObjectState.RELEASE_SKILL 
                    		or t1.curState == ObjectState.MOVE then
                    		-- 攻击、眩晕、放技能、被玩家操作移动的时候，不需要做判定
                    		bFireRange  = false
                    		bFireVision = false
	                    elseif t2:hasBehavior("HeroBehavior") then
	                    	-- 英雄不需要跟英雄进行检测
	                    	bFireRange  = false
	                    	bFireVision = false
	                    end
                    end
                    -- 塔是没有fireVision的
                    if not t1.fireVision_ then
                    	bFireVision = false
                    end
                    -- 先大致判定距离
                    if bFireRange then
                    	local objX = t1.x_ + t1.radiusOffsetX_
				        local objY = t1.y_ + t1.radiusOffsetY_
				        
				        local tarX = t2.x_ + t2.radiusOffsetX_
				        local tarY = t2.y_ + t2.radiusOffsetY_
				        if math.abs(objX - tarX) > (t1.fireRange_ + t2.radius_)
				        	or math.abs(objY - tarY) > (t1.fireRange_ + t2.radius_) then
				        	bFireRange = false
				        end
				    end
                    if bFireVision then
				        local objX = t1.x_ + t1.radiusOffsetX_
				        local objY = t1.y_ + t1.radiusOffsetY_
				        
				        local tarX = t2.x_ + t2.radiusOffsetX_
				        local tarY = t2.y_ + t2.radiusOffsetY_
				        if math.abs(objX - tarX) > (t1.fireVision_ + t2.radius_)
				        	or math.abs(objY - tarY) > (t1.fireVision_ + t2.radius_) then
				        	bFireVision = false
				        end
                    end

                    -- 做具体的距离判定
                    if bFireRange then
 
                    	local isCollision = t1:isFireRangeCollision(t2)
                    	if isCollision then
                    		-- fireRange中有物体，加入fireTargets列表中
                    		notarget = false
                    		fireTargets[#fireTargets+1] = t2  
                    	end
                    end

                    if bFireVision then
                    	local isCollision = t1:isFireVisionCollision(t2)
                    	if colls[t1:getId()][t2:getId()][2] then
                    		-- 之前在fireVision内，现在不在了
                    		if not isCollision then
                    			events[#events+1] = {kMapEventCollisionEnded,t1,t2}
                    		end
                    	else
                    		-- 之前不在fireVision内，现在在了
                    		if isCollision then
                    			events[#events+1] = {kMapEventCollisionBegan,t1,t2} 
                    		end
                    	end
                    	colls[t1:getId()][t2:getId()][2] = isCollision
                    end
                    


                 --    local isCollision = t1:isCollision(t2)
                 --    if isCollision then
                 --        notarget = false
                   
                 --    end
                 --    local isFireCollision = t1:isFireCollision(t2)
                 --    if colls[t1:getId()] then
                 --        if colls[t1:getId()][t2:getId()] and colls[t1:getId()][t2:getId()][1] then
                           
                           
                 --            local flag = false
                 --            if not isCollision then
                 --                events[#events+1] = {kMapEventCollisionEnded,t1,t2}
                 --            --       print(string.format("[%s] collision end 1 with[%s]",t1:getId(),t2:getId()))
                 --                flag = true
                 --            end
                 --            if colls[t1:getId()][t2:getId()][2] then
                 --                if not isFireCollision then
                 --                    events[#events+1] = {kMapEventCollisionEnded,t1,t2} 
                 --                    isCollision = false
                 --                    flag = true
                 --                --      print(string.format("[%s] collision end 2 with[%s]",t1:getId(),t2:getId()))
                 --                end
                 --            end
                          
                 --            if not flag then
                 --                events[#events+1] = {kMapEventCollisionBegan,t1,t2} 
                 --            --      print(string.format("[%s] collision began 3 with[%s]",t1:getId(),t2:getId()))
                 --            end
                          
                 --        else
                 --            if isCollision then
                 --                events[#events+1] = {kMapEventCollisionBegan,t1,t2} 
                 --            --     print(string.format("[%s] collision began 4 with[%s]",t1:getId(),t2:getId()))
                 --            end
                 --        end
                 --    else
                 --        if isCollision then
                 --            events[#events+1] = {kMapEventCollisionBegan,t1,t2}
                 --        --      print(string.format("[%s] collision began 5 with[%s]",t1:getId(),t2:getId()))
                 --        end
                 --    end
                   
	                -- if not t1.fireTarget_ then
	                --     colls[t1:getId()][t2:getId()][3] = false
	                -- else
	                --     colls[t1:getId()][t2:getId()][3] = isCollision
	                -- end

	                -- colls[t1:getId()][t2:getId()][1] = isCollision
	                -- colls[t1:getId()][t2:getId()][2] = isFireCollision
                   
                   
                   
                 --    if t1.fireEnabled_ and t1.fireCooldown_ <= 0 and isFireCollision then
                 --        fireTargets[#fireTargets+1] = t2    
                 --    end
                end
              
            end
           
           if #fireTargets > 0 then
               events[#events+1] = {kMapEventCollisionFire,t1,fireTargets}
               
             --   print(string.format("[%s] collision fire 6 ",t1:getId()))
           end
           if notarget then
        
               events[#events+1] = {kMapEventCollisionNoTarget,t1}
             --   print(string.format("[%s] collision no target 7",t1:getId()))
               colls[t1:getId()] = {}
           end
       else
            if not t1.collisionEnabled_ and not t1.destroyed_ and t1.classIndex_ == kMapObjectClassIndexStatic then
               events[#events+1] = {kMapEventCollisionNoTarget,t1}
               colls[t1:getId()] = {}
           end
       end
   end

    return events
end


return Collision