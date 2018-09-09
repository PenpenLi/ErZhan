
local MapConstants     = require("app.map.MapConstants")
local BulletBase       = require("app.map.bullets.BulletBase")
local SkillBase        = require("app.map.skills.SkillBase")
local CurvedBulletBase = require("app.map.bullets.CurvedBulletBase")
local GlobalData       = require("tools.GlobalData")
local CallUnitSkill    = require("app.map.skills.CallUnitSkill")
local math2d           = require("math2d")
local EffectAniCache   = require("app.map.spine.EffectAniCache")
local DropBullet = class("DropBullet", BulletBase)

-- 陨落子弹，负责图片更换和命中后的处理]
-- 以目标作为子弹消失点，命中目标后计算伤害

        -- 获得普通怪物以后，根据index来进行排序
function DropBullet.simpleMonsterSorter(a, b)
    return a.index_ < b.index_
end

function DropBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    -- local flyTime = (weaponConfig.dropTime * weaponConfig.dropWave) 
    --     + weaponConfig.dropInterval * (weaponConfig.dropWave - 1)
    -- 如果是技能调用子弹的话，需要记录这两个值
    self.isSkill     = isSkill
    self.skillConfig = skillConfig
    -- print("DropBullet:ctor test = "..tostring(test).." trajectory = "..tostring(trajectory))
    local params = {
        flyTime     = 1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = false,
        delay       = delay or 0,
        trajectory  = trajectory,    -- 子弹轨迹，直线还是抛物线，还是其他
    }

    local bulletImages = weaponConfig.bulletImages
    local sprite
    if string.find(bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
        self.isRotation_ = true
    else
        sprite = EffectAniCache.getEffectAniCache(bulletImages, true)
        -- 不需要旋转
        self.isRotation_ = true -- false
        -- sprite:setRotation(180)
        -- target.sprite_:addChild(effect)
        -- -- 如果被攻击的物体翻转了的话，那么飙血动画要翻转，因为飙血动画是9点钟的
        -- if target.flipSprite_ then
        --     effect:setScaleX(-1)
        -- end
        -- if target.campId_ == MapConstants.HERO_CAMP then
        --     effect:setPositionY(target.radiusOffsetY_)
        -- else
        --     effect:setPositionY(-target.radius_)
        -- end
    end
    -- local sprite = sp.SkeletonAnimation:create("effect/bulletImage/xia.json", "effect/bulletImage/xia.atlas", 1.0)
    -- sprite:setAnimation(0, "xia", true)
    sprite:setVisible(params.delay == 0)


    self.targetX = target.x_ + target.radiusOffsetX_ + target.hitOffsetX_
    self.targetY = target.y_ + target.radiusOffsetY_ + target.hitOffsetY_

    -- 如果是RMB技能的陨落子弹，第一个位置也是

    self.positionY = display.height    -- 记录子弹开始飞行时初始的高度

    self.startXs        = {}     -- 记录所有的子弹的初始X
    self.startYs        = {}     -- 记录所有的子弹的初始Y


    -- 根据角度、速度，计算陨落子弹初始位置 
    local startY = 0
    if weaponConfig.dropHeight == 0 then
        -- 表示从屏幕外飞下来
        startY = display.height - self.targetY
        -- self.speedX = 0
        -- self.speedY = weaponConfig.dropSpeed
        -- table.insert(self.startXs, self.targetX)
        -- table.insert(self.startYs, startY)
        
        -- self.diffX = 0
        -- self.diffX = 0
    else
        startY = weaponConfig.dropHeight
    end

    -- add by Owen, 2016.4.15, 弓箭手的箭雨技能，根据攻击手的朝向来修改子弹的下落方向
    if weaponConfig.mainID == "150604" then
        -- 如果弓箭手翻转成9点钟方向了
        if not source.flipSprite_ then
            weaponConfig.dropAngle = 180 - weaponConfig.dropAngle
        end
    end

    -- 根据下落的角度来计算初始的位置
    local diffX = math.cos(weaponConfig.dropAngle*math.pi / 180) * startY
    local diffY = math.sin(weaponConfig.dropAngle*math.pi / 180) * startY
    local dist  = math.sqrt(diffX * diffX + diffY * diffY)
    local flyTime = dist/weaponConfig.dropSpeed
    self.speedX = - diffX / flyTime
    -- print("test by Owen diffX = "..tostring(diffX))
    self.speedY = - diffY / flyTime
    table.insert(self.startXs, self.targetX + diffX)
    table.insert(self.startYs, self.targetY + diffY)

    -- 记录上一个位置，用来做子弹的旋转
    -- self.isRotation_ = true
    self.prevXs = {}
    self.prevYs = {}
    table.insert(self.prevXs, self.targetX + diffX)
    table.insert(self.prevYs, self.targetY + diffY)


    self.diffX = diffX
    self.diffY = diffY


    if GLOBAL_FIGHT_UI_SCALE == 0.5 then
        self.positionY = self.positionY * 2
    end
    sprite:setPosition(self.startXs[1], self.startYs[1])

    self.mapRuntime = source.mapRuntime_

    self.index          = 1      -- 当前是第几个子弹
    self.finishedIndex  = 0      -- 第几波子弹已经飞行完成了
    self.sprites        = {}     -- 记录所有的陨落子弹
    self.targetYs       = {}     -- 记录所有的目标位置的Y坐标
    table.insert(self.sprites, sprite)
    table.insert(self.targetYs, self.targetY)


    -- add by Owen, 2016.5.11, 如果是RMB调用的陨落技能, 后面的子弹都要砸到路径点上
    if self.weaponConfig.mainID == "150616" then
        -- local targetX, targetY = self.mapRuntime:getOneRandomPathPoint()

        -- 记录这个 rmb 技能，需要砸向的落点
        self.rmbDropPos = {}

        local monsterCount = self.weaponConfig.dropWave
        -- print("monsterCount = "..tostring(monsterCount))

        -- 地图中现有的普通怪物数量
        local simpleMonsters = self.mapRuntime.map_.simpleMonsters
        simpleMonsters = table.values(simpleMonsters)
        -- 对怪物进行排序，按照id的index进行排序
        table.sort(simpleMonsters, DropBullet.simpleMonsterSorter)
        local allMonsterCount = #simpleMonsters
        for i,v in ipairs(simpleMonsters) do
            -- print("simpleMonsters i = "..i.." id = "..v.id_)
        end
        
        local firstIndex            -- 遍历怪物的第一个index
        local lastIndex             -- 遍历怪物的最后一个index
        local allCount              -- 需要取得的怪物的数量
        local bNeedRandom = false   -- 需要随机取怪物
        if allMonsterCount <= monsterCount then
            -- 如果地图中怪物的数量少于技能作用的数量，就把所有怪物往后退
            firstIndex = 1
            allCount   = allMonsterCount
            lastIndex  = allMonsterCount
        else
            -- 如果地图中怪物的数量大于技能作用的数量*2
            -- 从前一半怪物中随机选几个怪物
            -- firstIndex = math.random(1, math.floor( (allMonsterCount - monsterCount) /2))
            -- allCount   = monsterCount
            -- lastIndex  = math.floor( (allMonsterCount - monsterCount) /2)

            firstIndex = 1
            allCount   = monsterCount
            lastIndex  = allMonsterCount

            bNeedRandom = true
        end

        -- print("firstIndex = "..firstIndex.." allMonsterCount = "..allMonsterCount
        --     .." allCount = "..allCount)

        local index  = 1             -- 怪物列表索引
        local count  = 0             -- 已经刷了几个怪物
        local object 
        -- 如果需要随机选择
        local resultTab
        if bNeedRandom then
            resultTab  = math2d.getNRandom(index, lastIndex, allCount)
        end

        while (index <= lastIndex and count < allCount) do
            if not bNeedRandom then
                object = simpleMonsters[index]
            else
                object = simpleMonsters[resultTab[index]]
            end

            if object and not object.destroyed_ then
                self.rmbDropPos[#self.rmbDropPos + 1] = {object.x_ + object.offsetX_,
                object.y_ + object.offsetY_}

                index = index + 1
                count = count + 1
            else
                index = index + 1
            end
        end

        -- 如果地图中怪物的数量，小于这个陨落子弹的波数，那么需要补充路径点作为子弹的落点
        if allMonsterCount < self.weaponConfig.dropWave then
            local begin = allMonsterCount + 1
            for i = begin, self.weaponConfig.dropWave do 
                local targetX, targetY = self.mapRuntime:getOneRandomPathPoint()
                self.rmbDropPos[#self.rmbDropPos + 1] = {targetX, targetY}
            end
        end
    end


    return DropBullet.super.ctor(self, source, target, sprite, params)
end

function DropBullet:fireBegan()
    self.sprite_:setPosition(self.startXs[1] + self.speedX * self.time_, 
        self.startYs[1] + self.speedY * self.time_)
    self.sprite_:setVisible(true)
    self.isBegan_ = true
end

function DropBullet:tickBullet(dt)
    -- 过了间隔了，要生成新的一个子弹
    -- local dropTime = self.weaponConfig.dropTime/1000
    local dropInterval = self.weaponConfig.dropInterval/1000

    if self.time_ >= self.index*dropInterval and self.index < self.weaponConfig.dropWave then
        -- 第一个间隔过了，生成一个新的子弹从天而降，生成第二个和后面的子弹，第一个不是这里生成的
        -- 在目标周围随机一个砸的位置

        local targetX
        local targetY
        -- 根据配置，在同一个地方下落，或者周围找一个位置下落
        if self.weaponConfig.diffRadius == 0 then 
            targetX = self.targetX 
            targetY = self.targetY 
        else
            local diff    = math.random(20,  self.weaponConfig.diffRadius * 2)
            targetX = self.targetX - self.weaponConfig.diffRadius + diff
            targetY = self.targetY - self.weaponConfig.diffRadius + diff
        end

        -- 如果是菩提老祖的子弹，要写死掉掉落位置，1掉在这里，2要周围偏移40像素，后面都全屏随机
        -- if string.sub(self.weaponConfig.mainID, 1, 5) == "15061" then
        if self.weaponConfig.mainID == "150610" then
            -- if self.index == 1 then
            --     local diff = math.random(-40, 40)
            --     targetX = self.targetX + diff
            --     targetY = self.targetY + diff
            -- else


                -- 地图中现有的普通怪物数量
                local simpleMonsters = self.mapRuntime.map_.simpleMonsters
                simpleMonsters = table.values(simpleMonsters)
                
                if #simpleMonsters > 0 then
                    -- 砸在怪物身上
                    local index = math.random(#simpleMonsters)
                    local monster = simpleMonsters[index]
                    targetX = monster.x_ + monster.offsetX_
                    targetY = monster.y_ + monster.offsetY_
                else
                    -- 砸在路径点上
                    targetX, targetY = self.mapRuntime:getOneRandomPathPoint()
                end
                



                -- targetX, targetY = self.mapRuntime:getOneRandomPathPoint()

            -- end
        end

        -- 如果是RMB调用的陨落技能, 后面的子弹都要砸到路径点上
        if self.weaponConfig.mainID == "150616" then
            dump(self.rmbDropPos, "dump self.rmbDropPos")
            -- print("self.index = "..tostring(self.index))
            targetX = self.rmbDropPos[self.index][1]
            targetY = self.rmbDropPos[self.index][2]
            -- print("150616 targetX = "..tostring(targetX).." targetY = "..tostring(targetY))
        end


        -- 计算子弹的初始位置
        table.insert(self.startXs, targetX + self.diffX)
        table.insert(self.startYs, targetY + self.diffY)
        table.insert(self.prevXs, targetX + self.diffX)
        table.insert(self.prevYs, targetY + self.diffY)

        -- local sprite2_ = display.newSprite("#CannonBall01.png")
        -- local sprite2_ = display.newSprite(self.weaponConfig.bulletImages)
        local sprite2_
        if string.find(self.weaponConfig.bulletImages, "png") then
            sprite2_ = display.newSprite(self.weaponConfig.bulletImages)
            self.isRotation_ = true
        else
            sprite2_ = EffectAniCache.getEffectAniCache(self.weaponConfig.bulletImages, true)
            self.isRotation_ = true
        end
        sprite2_:setPosition(targetX - self.diffX, targetY + self.diffY)
        table.insert(self.sprites, sprite2_)
        table.insert(self.targetYs, targetY)
        self.mapRuntime.map_:getBatchLayer():addChild(sprite2_, MapConstants.BULLET_ZORDER)
        self.index = self.index + 1
        -- print("生成第几个子弹 index = "..tostring(self.index).." x = "..tostring(targetX)
            -- .." y = "..tostring(self.positionY).." diff = "..tostring(diff))
    end
    local bFinished = true
    for i,v in ipairs(self.sprites) do
        -- if i > self.finishedIndex then
        if v:isVisible() then
            -- 这一波子弹还没有飞行完成
            -- local positionY =   self.positionY - (self.time_ - (i - 1)*dropInterval) * self.weaponConfig.dropSpeed
            local positionX = self.startXs[i] + self.speedX * (self.time_ - (i - 1)*dropInterval)
            local positionY = self.startYs[i] + self.speedY * (self.time_ - (i - 1)*dropInterval)
            v:setPosition(positionX, positionY)
            -- print("i = "..tostring(i).."positionY = "..tostring(positionY).." tarY = "..tostring(self.targetYs[i]))

            if self.isRotation_ then
                local degrees = math2d.radians2degrees(math2d.radians4point(self.prevXs[i], 
                    self.prevYs[i], positionX, positionY))
                self.prevXs[i], self.prevYs[i] = positionX, positionY
                v:setRotation(degrees)
            end
            
            bFinished = false

            local dist = positionY - self.targetYs[i]
            if dist <= 5 then
                v:setPositionY( self.targetYs[i])
                -- 到达要飞到的位置了，计算伤害
                local targets 
                if not self.isSkill then
                    targets = self.mapRuntime:getRangeTargets(nil, true, v:getPositionX(), 
                        self.targetYs[i], self.weaponConfig.dropRadius, true, self.campId_)
                else
                    -- 如果是技能调用伤害的子弹，那么根据技能的作用对象来取相应的目标
                    targets = SkillBase.dealTarget(self.mapRuntime, v:getPositionX(), self.targetYs[i], 
                        self.weaponConfig.dropRadius, self.weaponConfig.dropNumber, 
                        self.skillConfig.actionObject, self.source_)
                end

                -- add by Owen, 2016.5.4, 因为可能通过陨落子弹来召唤怪物，
                -- 所以陨落范围中没有怪物时也需要调用 self:dealBulletCallUnit()
                if #targets == 0 then
                    if self.isSkill and self.skillConfig.callUnit then
                        self:dealBulletCallUnit()
                    end
                else
                    for index, target in ipairs (targets) do
                        -- self.weaponConfig.blastNumber 表示溅射伤害的个数, 并且是地面单位
                        if index <= self.weaponConfig.dropNumber then
                            -- and target.walkLayer_ == MapConstants.MONSTER_WALK_LAYER_EARTH then 
                            local isHit, att = self:calcDamage(self.source_, target)
                            if self.isSkill then
                                self:dealSkillAttack(self.source_, target)
                            elseif isHit then
                                self.mapRuntime.handler_:hit(self.source_, target, att)
                            end
                        end
                    end
                end

                


                -- 如果是菩提老祖的子弹，兵器羁绊“菩提道”激活了，需要生成区域
                -- if string.sub(self.weaponConfig.mainID, 1, 5) == "15061" then
                if self.weaponConfig.mainID == "150610" then
                    local groups = GlobalData.getActiveGroup()
                    for i2,v2 in ipairs(groups) do
                        if v2 == "20" then
                            -- print("菩提道生成一个区域")
                            local skillConfig = {
                                mainID   = "puTiDao120191",
                                callUnit = {10000, "120191", 1},
                                weatherValue      = {10000, 10000, 10000, 10000, 10000},
                            }
                            CallUnitSkill.new(self.mapRuntime, MapConstants.SKILL_TYPE_AUTO, 
                                skillConfig, v:getPositionX(), v:getPositionY(), self.source_, nil)
                        end
                    end
                end

                -- 这一波的子弹已经飞行完成了
                self.finishedIndex = i
                v:setVisible(false)


                self:showBulletEffect(v)
                
                -- print("这一波的子弹已经飞行完成了 self.finishedIndex = "..tostring(self.finishedIndex))
            end
        end
    end
    -- if self.finishedIndex == self.weaponConfig.dropWave then
    if bFinished and self.index >= self.weaponConfig.dropWave then
        -- 子弹都结束了，清空所有
        -- print("子弹都结束了，清空所有")
        for i = #self.sprites, 1, -1 do
            local sprite = self.sprites[i]
            sprite:removeSelf()
            table.remove(self.sprites, i)
        end

        for i = #self.targetYs, 1, -1 do
            table.remove(self.targetYs, i)
        end

        self.over_ = true
    end



end

-- 显示击中 后的效果
function DropBullet:showBulletEffect(sprite)

    -- add by Owen, 2016.5.25, 陨落子弹击中地面的时候，需要播放音效
    if self.weaponConfig.bombSound then
        AudioMgr.playSound(self.weaponConfig.bombSound)
    end

    if string.find(self.weaponConfig.bombImages, "png") then
        local framesName = self.boomFramesName_
        if not framesName then framesName = "CannonBoom%04d.png" end
        local framesLength = self.boomFramesLength_
        if not framesLength then framesLength = 15 end
        local framesTime = self.boomFramesTime_
        if not framesTime then framesTime = 0.8 end

        local frames    = display.newFrames(framesName, 1, framesLength)
        local boom      = display.newSprite(frames[1])
        local animation = display.newAnimation(frames, framesTime / framesLength)

        local x, y = sprite:getPosition()
        boom:setPosition(x, y + 10)
        boom:setScale(math.random(100, 120) / 100)
        boom:playAnimationOnce(animation, "removeWhenFinished")

        -- local boom = sp.SkeletonAnimation:create("effect/bulletImage/dimian.json", "effect/bulletImage/dimian.atlas", 1.0)
        -- boom:setAnimation(0, "dimian", false)
        -- -- 注册动画结束事件
        -- boom:registerSpineEventHandler(function (event)
        --     -- 在回调中删除自己会直接奔溃, 先改为置为不可见
        --     boom:setVisible(false)
        --     -- boom:removeFromParent()
        -- end, sp.EventType.ANIMATION_COMPLETE)

        -- local x, y = sprite:getPosition()
        -- boom:setPosition(x, y)


        local parent = self.sprite_:getParent()
        parent:addChild(boom, self.sprite_:getLocalZOrder())

        -- 显示一个爆炸范围的圈
        local boom2     = display.newSprite("ui/fight/circle.png")
        boom2:setPosition(x, y)
        local scale = tonumber(self.weaponConfig.dropRadius) * 2/boom2:getContentSize().width
        -- print("set scale = "..scale)
        boom2:setScaleY(0.8*scale)
        boom2:setScaleX(scale)
        parent:addChild(boom2, self.sprite_:getLocalZOrder())
        transition.fadeOut(boom2, {
            time = 0.2,
            delay = 0.2, -- math.random(30, 100) / 100,
            onComplete = function()
                if not tolua.isnull(boom2) then
                    boom2:removeSelf()
                end
            end
        })
    else
        if not string.find(self.weaponConfig.bombImages, "png") then
            local boom, offsetY, offsetX = EffectAniCache.getEffectAniCache(self.weaponConfig.bombImages)

            local x, y = sprite:getPosition()
            boom:setPosition(x + offsetX, y + offsetY)
            -- boom:setScale(math.random(100, 120) / 100)
            local parent = self.sprite_:getParent()
            parent:addChild(boom, self.sprite_:getLocalZOrder())

            -- add by Owen, 2016.5.25, 弓箭手的箭雨技能，根据攻击手的朝向来修改子弹的下落方向
            if self.weaponConfig.mainID == "150604" then
                -- 如果弓箭手翻转成9点钟方向了
                if not self.source_.flipSprite_ then
                    -- weaponConfig.dropAngle = 180 - weaponConfig.dropAngle
                    boom:setScaleX(-1)
                end
            end
        end
    end

end

function DropBullet:removeView()
    -- DropBullet.super.removeView()
    for i = #self.sprites, 1, -1 do
        local sprite = self.sprites[i]
        sprite:removeSelf()
        table.remove(self.sprites, i)
    end

    for i = #self.targetYs, 1, -1 do
        table.remove(self.targetYs, i)
    end

end

-- 命中处理
function DropBullet:hit()
end

function DropBullet:miss()
end

return DropBullet
