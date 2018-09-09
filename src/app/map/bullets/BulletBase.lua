
-- 子弹的最上层父类
-- 负责子弹发出的瞬间，计算攻方的攻击力、是否暴击
-- 以及飞行结束以后，判定是否命中，也就是子弹是否落在目标范围内

local math2d               = require("math2d")
local MapConstants         = require("app.map.MapConstants")
local BulletType           = require("app.map.bullets.BulletType")
local SkillBase            = require("app.map.skills.SkillBase")
local BuffBase             = require("app.map.skills.BuffBase")
local BuffProperties       = require("app.properties.BuffProperties")
local BattleDataManager    = require("app.map.data.BattleDataManager")
local EffectAniCache       = require("app.map.spine.EffectAniCache")
local StableGameProperties = require("app.properties.StableGameProperties")
local ObjectState          = require("app.map.ObjectState")
local MonsterProperties    = require("app.properties.MonsterProperties")
local AreaProperties       = require("app.properties.AreaProperties")
local BulletBase = class("BulletBase")

BulletBase.FLAG_NORMAL     = 0
BulletBase.FLAG_FROM_SKILL = 1

function BulletBase:ctor(source, target, sprite, delay)
    self.source_   = source
    self.target_   = target
    self.sprite_   = sprite
    self.delay_    = checknumber(delay)
    self.flag_     = 0

    -- self.hit_      = math.random(100) <= source.hitrate_
    -- change by Owen, 2016.3.31, 修改为根据正背面来读取出手点
    -- self.startX_   = source.x_ + source.radiusOffsetX_
    -- self.startY_   = source.y_ + source.radiusOffsetY_
    -- if source.fireOffsetX_ then
    --     self.startX_   = self.startX_ + source.fireOffsetX_
    -- end
    -- if source.fireOffsetY_ then
    --     self.startY_   = self.startY_ + source.fireOffsetY_
    -- end


    self.startX_, self.startY_ = self:calFirePoint(source)
    self.prevX_    = self.startX_
    self.prevY_    = self.startY_

    self.time_     = 0
    self.over_     = false
    self.isBegan_  = false

    -- 记录是否暴击
    self.isCri   = false

    -- 计算攻击发起者的攻击力，因为命中后发起者可能死亡了，所以要一开始就计算
    self.attack_ = self:calcSrcAttack(source)

    -- 记录攻方的阵营，在命中后获得区域内单位时要用到
    self.campId_ = source.campId_
end

-- 计算是否有命中
local function isHit(target, bullet, isSkill)

    if isSkill then
        return true
    end

    local hit_val = target.dodge_
    local random_val = math.random(MapConstants.FOUDATION_PERCENT)  --  ModuleManager.user:getRandom()
    local flag = random_val > hit_val

    return flag
end

-- 计算是否出发了暴击
local function isCri(source, bullet)
    local critical_val = source.critical_
    local random_val = math.random(MapConstants.FOUDATION_PERCENT)  --  ModuleManager.user:getRandom()
    local flag = random_val <= critical_val
    -- print("BulletBase.isCri 1 = "..critical_val.." 随机数 = "..random_val.." flag = "..tostring(flag))
    return flag
end


-- 计算攻击发起者的攻击力
function BulletBase:calcSrcAttack(source)
    local isCri = isCri(source, bullet)
    self.isCri = isCri
    local att = source.attack_
    -- 如果是技能调用子弹，那么初始攻击力要重新计算一下
    if self.isSkill then
        skillConfig = self.skillConfig
        if skillConfig.skillAttack then
            att = SkillBase.calcAttack(source, skillConfig.skillAttack[1],
                skillConfig.skillAttack[2], skillConfig.skillAttack[3], self.target_, skillConfig)
        end
    end
    -- print("BulletBase:calcSrcAttack 暴击判定前 att = "..tostring(att))
    if isCri then
        att = att * source.criticalPower_ / MapConstants.FOUDATION_PERCENT  -- 乘以暴击威力, 一般为1.5倍
        -- 不是技能调用的子弹，暴击后要提示
        if not self.isSkill and self.source_ then
            -- self.source_:addView("暴击", 60, true)
                -- -- -- 播放升级特效

            -- local effect, offsetY = EffectAniCache.getEffectAniCache("Kroom")
            -- source.sprite_:addChild(effect)
            -- effect:setPositionY(offsetY)
        end
    end
    -- print("BulletBase:calcSrcAttack 暴击判定后 att = "..tostring(att))
    return att
end

-- add by Owen, 2015.10.21, 根据目标的护甲计算伤害, attack为需要用来计算的数值
function BulletBase:calcReduceDamage(source, target, attack)
    local changeReduce = 0
    if source and source.addReduceDamage_ then
        changeReduce = source.addReduceDamage_/MapConstants.FOUDATION_PERCENT
    end

    local reduce = target.reduceDamage_
    -- 乘以目标的免伤比例
    att = attack * ( 1 - (reduce/MapConstants.FOUDATION_PERCENT)*(1 - changeReduce))
    return att
end

-- 子弹命中后，计算伤害数值,是否命中、miss等
function BulletBase:calcDamage(source,target)
    
    -- 根据目标的闪避率，计算是否命中
    local isHit = isHit(target, bullet, self.isSkill)
    
    local att = self.attack_

    if isHit then
        -- add by Owen, 2015.9.10, 增加攻击的修改免伤比例属性
        local changeReduce = 0
        if source and source.addReduceDamage_ then
            changeReduce = source.addReduceDamage_/MapConstants.FOUDATION_PERCENT
        end

        if self.isSkill == nil then
            -- change by Owen, 2015.11.4, 如果目标中了小树精的嘲讽Buff，200906
            -- 攻击方是水人或者山妖，那么免伤比例要变

            -- 如果是暴击的话，要在被攻击者身上显示暴击文字
            if self.isCri and not target.destroyed_ then
                local effect, offsetY, offsetX
                if target.campId_ and target.campId_ == MapConstants.HERO_CAMP then
                    effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Kroom_1",
                        nil, nil, target)
                else
                    effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Kroom",
                        nil, nil, target)
                end
                target.sprite_:addChild(effect)
                effect:setPosition(offsetX, offsetY)
            end
             
            -- change by Owen, 2015.8.11, 如果是法术塔，则减少目标50%的免伤比例
            local reduce = target.reduceDamage_
            -- if source and source:hasBehavior("TowerBehavior")
            --     and source.towerType_ == MapConstants.TOWER_TYPE_MAGIC then
                -- print("法术塔免伤 1 reduce = "..tostring(reduce))
                -- reduce = reduce * StableGameProperties.MAGIC_TOWER_REDUCE
                -- print("法术塔免伤 2 reduce = "..tostring(reduce))
            -- end
            -- 乘以目标的免伤比例
            att = att * ( 1 - (reduce/MapConstants.FOUDATION_PERCENT)*(1 - changeReduce))
            
            -- 处理反弹伤害
            if target.buffs_ and target.buffs_.timeBuff_ and source then
                for i,v in pairs (target.buffs_.timeBuff_) do
                    if v.reboundAttack then
                        local reboundAttack = v.reboundAttack
                        if math.random(MapConstants.FOUDATION_PERCENT) <= reboundAttack[1] then
                            local returnDamage = SkillBase.calcAttack(source, reboundAttack[2], 
                                reboundAttack[3], reboundAttack[4], target)
                            -- 对攻击源造成反弹伤害
                            target.mapRuntime_.handler_:hit(nil, source, returnDamage)
                        end
                    end
                end
            end
        else
            -- 是技能的话，根据配置的伤害方式，记性不同的计算, 1是有免伤，2没有
            if self.skillConfig.attackType == MapConstants.ATTACK_TYPE_REDUCE then
                -- 乘以目标的免伤比例
                att = att * ( 1 - target.reduceDamage_/MapConstants.FOUDATION_PERCENT)
            elseif self.skillConfig.attackType == MapConstants.ATTACK_TYPE_DIRECT then
                att = att
            end
        end
        if att < 0 then att = 0 end

        -- change by Owen, 2016.5.25, 如果是图片的击中效果的话不要在这里显示，只有前3级箭塔的击中特效是半只箭的图片
        -- 把半只箭的图片放到 ArrowBullet 中处理
        -- 显示子弹的击中光效
        if self.weaponConfig.hitImages and not string.find(self.weaponConfig.hitImages, "png")
            and not target.destroyed_ then
            -- print("显示子弹的击中光效 self.weaponConfig.hitImages = "..tostring(self.weaponConfig.hitImages))
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache(
                self.weaponConfig.hitImages, nil, nil, target)
            target.sprite_:addChild(effect)
            effect:setPosition(offsetX, offsetY)
        end
    else
        att = 0
        -- 不是技能调用的子弹，被真实闪避后要提示
        if not self.isSkill and self.target_ and not target.destroyed_ then
            -- self.target_:addView("闪避", 60, true)
            local effect, offsetY, offsetX
            if target.campId_ and target.campId_ == MapConstants.HERO_CAMP then
                effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Miss_1",
                    nil, nil, target)
            else
                effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Miss",
                    nil, nil, target)
            end
            target.sprite_:addChild(effect)
            effect:setPosition(offsetX, offsetY)
        end
    end

    return isHit, att
    
end

-- 处理技能调用子弹的伤害
-- 有伤害类型，以及伤害数值的计算方式
function BulletBase:dealSkillAttack(src, target)
    if self.skillConfig.skillAttack then
        local isHit, att = self:calcDamage(src, target)
        -- 如果技能伤害是根据目标的血量来计算伤害值的
        if (self.skillConfig.skillAttack[2] == MapConstants.ATTACK_SRC_TARGET_MAXHP
                or self.skillConfig.skillAttack[2] == MapConstants.ATTACK_SRC_TARGET_HP) then
            att = SkillBase.calcAttack(self.source_, self.skillConfig.skillAttack[1], 
                self.skillConfig.skillAttack[2], self.skillConfig.skillAttack[3], target, 
                self.skillConfig)
            if self.skillConfig.attackType == MapConstants.ATTACK_TYPE_REDUCE then
                -- 有免伤
                -- add by Owen, 2015.9.10, 增加攻击的修改免伤比例属性
                local changeReduce = 0
                if src and src.addReduceDamage_ then
                    changeReduce = src.addReduceDamage_/MapConstants.FOUDATION_PERCENT
                end
                att = att * ( 1 - (target.reduceDamage_/MapConstants.FOUDATION_PERCENT)*(1 - changeReduce))
            elseif self.skillConfig.attackType  == MapConstants.ATTACK_TYPE_DIRECT then
                -- 无视免伤
            end
        end
        
        -- print("BulletBase:dealSkillAttack 技能伤害 数值 = "..tostring(att))
        if self.skillConfig.attackType == MapConstants.ATTACK_TYPE_ADDHP then
            -- 如果是加血
            -- 英雄加血的话还要处理治疗效果这个字段
            if src and src:hasBehavior("HeroBehavior") and src.treatmentEffect_ then
                att = att * src.treatmentEffect_/MapConstants.FOUDATION_PERCENT
            end
            target:increaseHp(att)
        else
            -- add by Owen, 2015.10.10, 火图腾技能调用的子弹，要给自己伤害
            if self.weaponConfig.mainID == StableGameProperties.FIRE_TOTEM_BULLET_ID then
                -- print("火图腾技能调用的子弹，要给自己伤害")
                target.mapRuntime_.handler_:hit(nil, self.source_, att)
            end
            target.mapRuntime_.handler_:hit(nil, target, att)
        end

        -- 处理反弹伤害
        if target.buffs_ and target.buffs_.timeBuff_ and src then
            for i,v in pairs (target.buffs_.timeBuff_) do
                if v.reboundAttack then
                    local reboundAttack = v.reboundAttack
                    if math.random(MapConstants.FOUDATION_PERCENT) <= reboundAttack[1] then
                        local returnDamage = SkillBase.calcAttack(src, reboundAttack[2], 
                            reboundAttack[3], reboundAttack[4], target)
                        -- 对攻击源造成反弹伤害
                        target.mapRuntime_.handler_:hit(nil, src, returnDamage)
                    end
                end
            end
        end
    end

    -- 击中后给目标附加的状态
    if self.skillConfig.hitState ~= nil or self.skillConfig.cleansing ~= nil
        or self.skillConfig.dispel ~= nil then
        self:dealSkillHitState(target)
    end

    -- 处理技能偷金币逻辑
    if self.skillConfig.skillAddGold then
        if math.random(MapConstants.FOUDATION_PERCENT) < self.skillConfig.skillAddGold[1] then
            BattleDataManager:addGold(self.skillConfig.skillAddGold[2])
        end
    end

    -- 在目标位置召唤出一个怪物按新的路径行走
    if self.skillConfig.callUnit then
        self:dealBulletCallUnit()
    end

    -- add by Owen, 2016.5.12, 制作祭坛塔抢钱子弹，飞到祭坛塔以后，祭坛塔上跳3个金币
    if self.weaponConfig.mainID == "150102" then


            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("eff_moneybullet", nil, nil, object)
            self.target_.sprite_:addChild(effect)
            effect:setPositionY(offsetY + 100)
            -- effect:setScale(1.5)

        -- gold:setPosition(object.x_ + object.offsetX_, object.y_ + object.offsetY_)
        -- local moveTo = cc.MoveTo:create(0.5, cc.p(endPosX, endPosY))
        -- local function callback( ... )
        --     gold:removeSelf()
        -- end
        -- local cal    = cc.CallFunc:create(callback)
        -- local seq    = cc.Sequence:create(moveTo, cal);

        -- gold:runAction(seq)
    end
end

-- add by Owen, 2016.4.1, 通过子弹来召唤怪物和区域
function BulletBase:dealBulletCallUnit()
    -- print("通过子弹来召唤怪物、区域")
    local path       = self.weaponConfig.path
    local pointIndex = self.weaponConfig.pointIndex
    local monsterId  = self.skillConfig.callUnit[2]
    local monsterConfig = MonsterProperties.get(monsterId)
    local mapRuntime = self.source_.mapRuntime_
    
    if math.random(10000) < self.skillConfig.callUnit[1] then
        if monsterConfig then
            -- 召唤出来的是一个怪物
            local state = {
                -- npcId    = msterData["resourceId"],
                defineId = self.skillConfig.callUnit[2],-- "1001001",
                owenId   = "Enemy",
                behaviors = "MonsterBehavior",
            }

            local enemy = mapRuntime:newObject("static", state)
            -- 处理技能的初始化
            enemy:initMonsterSkillAndBuff(enemy.mapRuntime_)

            local state1     = { points = {}}
            local newPath    = mapRuntime.map_:newObject("path",state1)
            -- local startPos   = math2d.calcPos(src.x_, src.y_, soldierNum, 20)
            newPath:appendPoint(path.points_[pointIndex][1], path.points_[pointIndex][2])

            for k = pointIndex + 1, #path.points_, 1 do
                local x, y = path:getPoint(k)
                newPath:appendPoint(x, y)
            end
            -- dump(newPath, "dump newPath")

            local finishFunc = function( enemy )
                enemy:bindPath(newPath, 1)
                enemy:startMoving()
                enemy:setState(ObjectState.MOVE)
                enemy:playAni("Move_Side", true)
            end

            -- 设置怪物的初始位置, 以及是否翻转
            local beginX, beginY = self.sprite_:getPosition()
            enemy.x_ = beginX
            enemy.y_ = beginY
            enemy:setFlipSprite(self.source_.flipSprite_)
            
            -- 召唤出来的小怪，要先播放出生动画，然后才开始移动
            if string.find(enemy.imageName_, "png") then
                finishFunc(enemy)
            else
                enemy:setState(ObjectState.BORN)
                enemy:playAni("Born", false, false, nil, 
                    function ()
                        -- print("出生动画结束事件")
                        enemy:bindPath(newPath, 1)
                        enemy:startMoving()
                        enemy:setState(ObjectState.MOVE)
                        enemy:playAni("Move_Side", true)
                    end, nil)
            end


            -- 怪物召唤出来的单位死亡后都是没有金钱的
            enemy.deadGold_ = 0

            -- 增加地图中总共有多少怪物
            mapRuntime.map_:addTotalMonsterCountInThisMap(1)
        else
            -- 召唤出一个区域
            -- 改成map统一管理，这样C里面的碰撞检测做一次就知道区域中有谁
            local areaConfig = AreaProperties.get(monsterId)
            -- change by Owen, 处理羁绊对技能的影响
            areaConfig = SkillBase.dealChangeData(monsterId, areaConfig)
            local x, y = self.sprite_:getPosition()
            local state = {
                mapRuntime  = mapRuntime,
                skillConfig = self.skillConfig,
                areaConfig  = areaConfig,
                x           = x,
                y           = y,
                src         = self.source_,
                liveTime    = nil
            }
            mapRuntime:newObject("areaobject", state)
        end
    end
end

function BulletBase:dealSkillHitState(target)
    -- 取到要作用的对象后，给他附上状态
    -- print("BulletBase:dealSkillHitState")
    local skillConfig = self.skillConfig
    if skillConfig.hitState then
        -- 给目标加buff
        -- 状态触发是有概率的, hitState中存的第一个是概率，第二个是技能id
        for key,state in ipairs(skillConfig.hitState) do
            if math.random(MapConstants.FOUDATION_PERCENT) <= state[1] then
                local buffId = state[2]
                local buff = BuffProperties.get(buffId)
                -- change by Owen, 处理羁绊对技能的影响
                buff = SkillBase.dealChangeData(buffId, buff)
                -- 把buffData也就是这个buff会修改的基础属性字段添加到英雄的BuffBase列表中
                -- buffData是一个table，如函数上面的例子
                BuffBase.addTimeBuff(target, buff, self.source_, skillConfig)
            end
        end

    end
    if skillConfig.cleansing then
        -- print("BulletSkill:dealStateSkill 4")
        -- 净化目标,去掉不利的timebuff, 配的是一个触发概率
        if math.random(MapConstants.FOUDATION_PERCENT) <= skillConfig.cleansing then
            BuffBase.clearAllTimeBuff(target, true)
        end
    end
    if skillConfig.dispel then
        -- 驱散目标,去掉有利的timebuff
        -- print("驱散目标,去掉有利的timebuff")
        if math.random(MapConstants.FOUDATION_PERCENT) <= skillConfig.dispel then
            BuffBase.clearAllTimeBuff(target, false)
        end
    end

end

function BulletBase:setFlag(flag)
    self.flag_ = flag
end

function BulletBase:getView()
    return self.sprite_
end

function BulletBase:removeView()
    -- add by Owen, 2016.3.2, 增加一个保护，防止案桌上报错
    if self.sprite_ then
        self.sprite_:removeSelf()
    end
end

--[[
这个tick实现了子弹发射，保证了延时发送。
]]
function BulletBase:tick(dt)
    if not self.isBegan_ then
        if self.delay_ <= 0 then
            self:fireBegan()
            -- add by Owen, 2015.7.22, 增加target的死亡判定，防止射击进入终点的怪物会报错
            -- 因为会去预判target的位置，进入终点后target.map_就没了，会报错
            -- if self.source_.destroyed_ or (self.target_ and self.target_.destroyed_) then
            --     return
            -- end
            -- change by Owen, 2016.3.30, 去掉目标死亡的判定，需要朝尸体射击
            if self.source_.destroyed_ then
                return
            end
        else
            self.delay_ = self.delay_ - dt
            return
        end
    end

    self.time_ = self.time_ + dt
    self:tickBullet(dt)
end

--[[
判断是否已经摧毁，如果摧毁，则设置变量后返回 
如果没有摧毁，则设置位置，并设置self.isBegan_ = true
]]
function BulletBase:fireBegan()
    -- add by Owen, 2015.7.22, 增加target的死亡判定，防止设计进入终点的怪物会报错
    -- 因为会去预判target的位置，进入终点后target.map_就没了，会报错
    -- if self.source_.destroyed_ or self.target_.destroyed_ then
    -- change by Owen, 2016.3.30, 去掉目标死亡的判定，需要朝尸体射击
    if self.source_.destroyed_ then
        self.time_    = 0
        self.over_    = true
        self.isBegan_ = false
        return
    end

    local source = self.source_
    -- self.startX_  = source.x_ + source.radiusOffsetX_ + source.fireOffsetX_
    -- self.startY_  = source.y_ + source.radiusOffsetY_ + source.fireOffsetY_
    self.startX_, self.startY_ = self:calFirePoint(source)
    self.prevX_   = self.startX_
    self.prevY_   = self.startY_
    self.isBegan_ = true
end

function BulletBase:tickBullet(dt)
end

--[[
    判断是否击中（通过一个随机值来产生数值判断是否击中在ctor中实现） 
    未击中直接调用miss()退出。  
    如果击中则判断目标是否存在，因为也可能击中了但是对象已经不存在，
    多个攻击时候很容易出现这种情况，而且子弹还需要飞行，
    那么也调用miss()退出。  
    否则调用计算目标和子弹的举例是否小于子弹直径，
    如果小于直径则调用hit()退出。 其他情况下调用miss() 退出。
]]
function BulletBase:checkHit()
    -- print("BulletBase:checkHit()")
    -- change by Owen, 老版本的是否命中，现在放到具体的类中去做
    -- if not self.hit_ then
    --     self:miss()
    --     return false
    -- end
    -- print("BulletBase:checkHit() 1")
    local target = self.target_
    if target and (target.collisionLock_ > 0 or not target.collisionEnabled_ or target.destroyed_) then
        self:miss()
        return false
    end
    -- print("BulletBase:checkHit() 2")
    local x, y = self.sprite_:getPosition()
    local targetX = target.x_ + target.radiusOffsetX_
    local targetY = target.y_ + target.radiusOffsetY_

    if math2d.dist(x, y, targetX, targetY) <= target.radius_ then
        -- 在每个子弹类中做自己的命中处理
        -- print("BulletBase:checkHit() 3")
        self:hit()
        return true
    end
    -- print("BulletBase:checkHit() 4")
    self:miss()
    return false
end

-- 计算攻击时候的子弹出手点
function BulletBase:calFirePoint(source)
    -- add by Owen, 2016.4.26, 扩散/跳跃 子弹的话以自己的体积中心为子弹的出手点
    if self.weaponConfig.bulletType == BulletType.DIFFUS
        or self.weaponConfig.bulletType == BulletType.JUMP then
        local startX  = source.x_ + source.radiusOffsetX_
        local startY  = source.y_ + source.radiusOffsetY_
        return startX, startY
    end

    local fireOffsetX_ = source.fireOffsetX_
    local fireOffsetY_ = source.fireOffsetY_
    -- print("calFirePoint 1 fireOffsetX_ = "..fireOffsetX_
    --     .." source._isPlayBackAni = "..tostring(source._isPlayBackAni))
    if source._isPlayBackAni and source.fireOffsetX2_ then
        fireOffsetX_ = source.fireOffsetX2_
        fireOffsetY_ = source.fireOffsetY2_
    end
    -- print("calFirePoint 2 fireOffsetX_ = "..fireOffsetX_)
    local startX  = source.x_ + source.radiusOffsetX_
    local startY  = source.y_ + source.radiusOffsetY_
    -- print("calFirePoint 1 startX = "..startX..", startY = "..startY
    --     .." source.flipSprite_ = "..tostring(source.flipSprite_))
    if not source.flipSprite_ then
        startX = startX + fireOffsetX_
        startY = startY + fireOffsetY_
    else
        if source.fireOffsetX_L_ and source.fireOffsetX_L_ ~= 0 then
            startX = startX + source.fireOffsetX_L_
            startY = startY + source.fireOffsetY_L_
        else
            startX = startX - fireOffsetX_
            startY = startY + fireOffsetY_
        end
    end
    -- print("calFirePoint 2 startX = "..startX..", startY = "..startY)
    return startX, startY
end

function BulletBase:hit()
end

function BulletBase:miss()
end

function BulletBase:isOver()
    return self.over_
end

return BulletBase
