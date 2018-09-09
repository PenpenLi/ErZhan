
local math2d                 = require("math2d")
local StableGameProperties   = require("app.properties.StableGameProperties")
local MapConstants           = require("app.map.MapConstants")
local BuffProperties         = require("app.properties.BuffProperties")
local BuffBase               = require("app.map.skills.BuffBase")
local CurvedBulletBase       = require("app.map.bullets.CurvedBulletBase")
local EffectAniCache         = require("app.map.spine.EffectAniCache")

local ArrowBullet = class("ArrowBullet", CurvedBulletBase)

-- 射击子弹，负责图片更换和命中后的处理
-- 以目标作为子弹消失点，命中目标后计算伤害

function ArrowBullet:ctor(source, target, delay, weaponConfig, trajectory, isSkill, skillConfig, skillType)
    self.weaponConfig = weaponConfig
    self.isSkill      = isSkill
    self.skillConfig  = skillConfig
    self.skillType    = skillType
    local test = tonumber(weaponConfig.flyTime)
    -- print("ArrowBullet:ctor test = "..tostring(test).." trajectory = "..tostring(trajectory))
    local params = {
        flyTime     = weaponConfig.flyTime/1000,  -- math.random(50, 65) / 100,
        g           = -1400,
        isRotation  = true,
        delay       = delay or 0,
        trajectory  = trajectory,    -- 子弹轨迹，直线还是抛物线，还是其他
    }
    -- 子弹图片本身是否旋转
    if weaponConfig.isRotateSelf then
        params.isRotateSelf = true
    end

    -- 如果是4级箭塔的子弹，学了毒箭天赋的话，需要对子弹的属性进行修改，修改图片
    if self.weaponConfig.mainID == StableGameProperties.FOUR_LV_TOWER_BULLET_ID then
        if source.talent_ and source.talent_[2] then
            local change
            local changeData
            for k,v in pairs(source.talent_[2].changeBullets) do
                if type(v) ~= "table" then
                    -- 不是table的话，表示直接替换
                    self.weaponConfig[k] = v
                else
                    changeData = self.weaponConfig[k]
                    if v[1] == 1 then 
                        change = changeData*(v[2]/MapConstants.FOUDATION_PERCENT - 1)
                    else 
                        change = v[2]
                    end
                    -- print("修改子弹的属性 name = "..tostring(k).." value = "..tostring(change))
                    self.weaponConfig[k] = changeData + change
                end
            end
        end
    end
    -- 如果是5级箭塔的子弹，学了钉魂箭天赋的话，需要对子弹的属性进行修改，修改图片
    if self.weaponConfig.mainID == StableGameProperties.FIVE_LV_TOWER_BULLET_ID then
        if source.talent_ and source.talent_[2] then
            local change
            local changeData
            for k,v in pairs(source.talent_[2].changeBullets) do
                if type(v) ~= "table" then
                    -- 不是table的话，表示直接替换
                    self.weaponConfig[k] = v
                else
                    changeData = self.weaponConfig[k]
                    if v[1] == 1 then
                        change = changeData*(v[2]/MapConstants.FOUDATION_PERCENT - 1)
                    else
                        change = v[2]
                    end
                    -- print("修改子弹的属性 name = "..tostring(k).." value = "..tostring(change))
                    self.weaponConfig[k] = changeData + change
                end
            end
        end
    end

    -- local sprite = display.newSprite("#Arrow01.png")

    -- 有png的话，表示是一张图片，否则是一个序列帧的特效
    local sprite
    if string.find(weaponConfig.bulletImages, "png") then
        sprite = display.newSprite(weaponConfig.bulletImages)
    else
        sprite, offsetY = EffectAniCache.getEffectAniCache(weaponConfig.bulletImages, true)
        sprite:setAnchorPoint(0.8, 0.5)
    end
    sprite:setVisible(params.delay == 0)

    -- 子弹的轨迹为直线, 根据目标位置和攻击值的距离，与射程取一个百分比，然后修改子弹的飞行时间
    if self.weaponConfig.mainID ~= "150102" then
        -- if target.hasBehavior and target:hasBehavior("MovableBehavior") 
        --     and target:isMoving()  then
            
            local startX, startY = self:calFirePoint(source)
            local targetX, targetY = target.x_, target.y_
            if target.hasBehavior and target:hasBehavior("MovableBehavior") 
                and target:isMoving()  then
                targetX, targetY= target:getFuturePosition(params.flyTime + params.delay)
            end
            targetX = targetX + target.radiusOffsetX_ + target.hitOffsetX_
            targetY = targetY + target.radiusOffsetY_ + target.hitOffsetY_
            local dist = math2d.dist(startX, startY, targetX, targetY)
            local percent = 1
            if source.campId_ == MapConstants.TOWER_CAMP then
                if source.fireRange_ then
                    percent = dist/source.fireRange_
                end
            elseif source.campId_ == MapConstants.HERO_CAMP 
                or source.campId_ == MapConstants.MONSTER_CAMP  then
                if source.fireVision_ then
                    percent = dist/source.fireVision_
                end 
            end
            params.flyTime = params.flyTime * percent
        -- end


        -- add by Owen, 2016.5.23, 祭坛塔抢钱子弹，有一个从小到大，再从大到小渐变的过程
    else -- self.weaponConfig.mainID == "150102" then
        sprite:setScale(0.5)
        -- cc.ScaleTo:create(0.1, 1.1)
        local scale1 = cc.ScaleTo:create(params.flyTime/2, 1.2)
        local scale2 = cc.ScaleTo:create(params.flyTime/2, 0.5)
        local seq  = cc.Sequence:create(scale1, scale2)
        sprite:runAction(seq)
    end

    return ArrowBullet.super.ctor(self, source, target, sprite, params)
end

function ArrowBullet:fireBegan()
    ArrowBullet.super.fireBegan(self)
    self.sprite_:setVisible(true)
end

function ArrowBullet:showBulletEffect(isHit)


    local target = self.target_
    -- local targetView = target:getView()
    local targetView
    if target.getView then
        targetView = target:getView()
    end

    -- 如果弓箭类型的子弹没有命中目标的话，需要插一支箭在地上
    if not isHit and string.find(self.source_.mainID_, "16010") then
        -- 箭塔miss了插在地板上也要显示图片
        local arrow = display.newSprite("bullet/eff_160101_halfarrows.png")    -- "#BrokenArrow01.png")
        arrow.hideDelay_ = 2.4
        local rotation = self.sprite_:getRotation()
        local x, y = self.sprite_:getPosition()
        if rotation > 90 then
            rotation = rotation    -- - math.random(10, 30)
        else
            rotation = rotation    -- + math.random(10, 30)
        end
        arrow:setRotation(rotation)

        local parent = self.sprite_:getParent()
        parent:addChild(arrow)
        arrow:setPosition(self.sprite_:getPositionX(), self.sprite_:getPositionY())

        transition.fadeOut(arrow, {
            time = 0.8,
            delay = math.random(50, 100) / 100,
            onComplete = function()
                if not tolua.isnull(arrow) then
                    arrow:removeSelf()
                end
            end
        })
    end


    -- 怪物没被销毁, 并且命中了, 才能显示子弹的击中效果
    -- 火焰箭不需要显示, 因为在hit()函数中已经显示了火焰箭的命中效果
    if targetView and isHit and self.weaponConfig.hitImages 
        and self.weaponConfig.mainID ~= "150206" then
        if self.weaponConfig.hitImages then
            if string.find(self.weaponConfig.hitImages, "png") then
                local arrow = display.newSprite(self.weaponConfig.hitImages)    -- "#BrokenArrow01.png")
                arrow.hideDelay_ = 2.4
                local rotation = self.sprite_:getRotation()
                local x, y = self.sprite_:getPosition()
                if rotation > 90 then
                    rotation = rotation    -- - math.random(10, 30)
                else
                    rotation = rotation    -- + math.random(10, 30)
                end
                arrow:setRotation(rotation)

                targetView:addChild(arrow)

                local tx, ty = target.x_, target.y_
                local cw, ch = target.spriteSize_[1], target.spriteSize_[2]
                cw = cw / 2
                ch = ch / 2

                if target.flipSprite_ then
                    x = tx - x + cw
                else
                    x = x - tx + cw
                end
                arrow:setPosition(x, y - ty - target.offsetY_ + ch)

                transition.fadeOut(arrow, {
                    time = 0.3,
                    delay = math.random(50, 100) / 100,
                    onComplete = function()
                        if not tolua.isnull(arrow) then
                            arrow:removeSelf()
                        end
                    end
                })
            else
                local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache(
                    self.weaponConfig.hitImages, nil, nil, target)
                target.sprite_:addChild(effect)
                effect:setPosition(offsetX, offsetY)
            end
        end
    end
end

-- 显示火焰箭爆炸范围
local function shwoFireArrowRange(sprite, parent, weaponConfig)
    -- 如果是扩散子弹
    local centerX, centerY = sprite:getPosition()

    -- 爆炸半径
    local range = weaponConfig.blastRadius

    -- 显示爆炸半径的特效
    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache(weaponConfig.bombImages, false)
    local x, y = sprite:getPosition()
    effect:setPosition(x + offsetX, y + offsetY)
    local parent = sprite:getParent()
    parent:addChild(effect, sprite:getLocalZOrder())

    -- 显示一个扩散的范围的图片, 0.6秒后开始隐藏
    -- local sprite     = display.newSprite("ui/fight/circle.png")
    -- local scale     = range*2/sprite:getContentSize().width
    -- sprite:setScaleY(0.8*scale) 
    -- sprite:setScaleX(scale)
    -- -- local parent = sprite:getParent()
    -- parent:addChild(sprite, sprite:getLocalZOrder())
    -- sprite:setPosition(centerX, centerY)
    -- transition.fadeOut(sprite, {
    --     time = 0.3,
    --     delay = 0.6,
    --     onComplete = function()
    --         if not tolua.isnull(sprite) then
    --             sprite:removeSelf()
    --         end
    --     end
    -- })
end

-- 命中处理
function ArrowBullet:hit()
    -- print("ArrowBullet:hit()")

    self:showBulletEffect(true)

    -- change by Owen, 2015.11.2, 如果是火焰箭子弹，要变成区域伤害
    if self.weaponConfig.mainID == "150206" then
        local x, y = self.sprite_:getPosition()
        local targets  = self.target_.mapRuntime_:getRangeTargets(nil, true, x, 
            y, self.weaponConfig.blastRadius, true, self.campId_)

        for index, target in ipairs (targets) do
            -- self.weaponConfig.blastNumber 表示溅射伤害的个数, 并且是地面单位
            if index <= self.weaponConfig.blastNumber
                and target.walkLayer_ == MapConstants.MONSTER_WALK_LAYER_EARTH then 
                local isHit, att = self:calcDamage(self.source_, target)
                if isHit then
                    self.target_.mapRuntime_.handler_:hit(self.source_, target, att)
                end
            end
        end
        -- 显示火焰箭爆炸范围
        shwoFireArrowRange(self.sprite_, self.sprite_:getParent(), self.weaponConfig)
        -- 删掉子弹图片
        self:removeView()
        return
    end

    if self.isSkill then
        self:dealSkillAttack(self.source_, self.target_)
    else 
        -- 计算伤害
        local isHit, att = self:calcDamage(self.source_, self.target_)
        -- 调用 MapEventHandler:() 来扣血
        -- self.target_肯定存在，因为不存在了不会调用 hit() 函数
        -- print("ArrowBullet:hit() att = "..tostring(att))
        if isHit then
            -- -- 给命中的目标计算伤害
            -- self.target_.mapRuntime_.handler_:hit(self.source_, self.target_, att)

            -- add by Owen, 2015.7.27, 处理普攻吸血
            if self.source_ and self.source_.suckHp_ and self.source_.suckHp_ ~= 0 then
                self.source_:increaseHp(self.source_.suckHp_)
            end

            -- add by Owen, 2015.10.15, 4级箭塔普攻触发淬毒技能
            if self.weaponConfig.mainID == StableGameProperties.FOUR_LV_TOWER_BULLET_ID then
                if self.source_.talent_ and self.source_.talent_[2] then
                    local hitBuffs = self.source_.talent_[2].hitState
                    local buff
                    for i,v in ipairs(hitBuffs) do
                        if math.random(MapConstants.FOUDATION_PERCENT) <= v[1] then
                            buff = BuffProperties.get(v[2])
                            BuffBase.addTimeBuff(self.target_, buff, self.source_, nil)
                        end
                    end
                end
            end

            -- add by Owen, 2015.10.16, 制作5级箭塔的钉魂箭技能
            if self.weaponConfig.mainID == StableGameProperties.FIVE_LV_TOWER_BULLET_ID then
                if self.source_.talent_ and self.source_.talent_[2] then
                    -- 记录钉魂箭每次攻击附加的伤害
                    -- 每攻击一次伤害增加的步长, 步长也需要计算护甲免伤
                    local addDamage = self.source_.talent_[2].addDamage
                    addDamage = self:calcReduceDamage(self.source_, self.target_, addDamage)

                    if not self.target_._soulAttack or self.target_._soulAttack == 0 then
                        self.target_._soulAttack = addDamage
                    else
                        self.target_._soulAttack = self.target_._soulAttack + addDamage
                    end

                    -- 钉魂箭累加的伤害有一个最大值
                    local addAttack = self.target_._soulAttack
                    if addAttack > self.source_.talent_[2].maxDamage then
                        addAttack = self.source_.talent_[2].maxDamage
                        self.target_._soulAttack = self.source_.talent_[2].maxDamage
                    end

                    -- 记录物体被攻击的时间，因为如果3秒内没有被攻击的话，附加伤害就要清空
                    -- 在monsterBehavior:tick中,会累加这个值,一旦超过3秒,就会将_soulAttack置为0
                    self.target_._soulAttackTime = 0

                    -- 给物体附加伤害
                    -- 给命中的目标计算伤害, 增加的伤害需要计算护甲免伤
                    -- print("钉魂箭附加伤害 addAttack = "..tostring(addAttack))
                    addAttack = self:calcReduceDamage(self.source_, self.target_, addAttack)
                    -- print("钉魂箭附加伤害 计算完免伤后的伤害值 addAttack = "..tostring(addAttack))
                    att = att + addAttack

                    -- print("添加钉魂箭数值")
                    -- add by Owen, 2015.10.27, 显示中了钉魂箭文字
                    if not self.target_._addViw then
                        self.target_._addViw = {}
                    end
                    if not self.target_._addViw["soulArrow"] then
                        -- print("添加钉魂箭数值 1 object.index_ = "..tostring(self.target_.index_))
                        self.target_._addViw["soulArrow"] = self.target_:addView("钉魂箭"..self.target_._soulAttack,
                            100, false)

                        -- add by Owen, 2016.3.7, 添加钉魂箭特效
                        local sprite, offsetY = EffectAniCache.getEffectAniCache("eff_160105_cumulative", true, 
                            nil, self.target_)
                        self.target_._addViw["soulArrowEff"] = self.target_:addView(sprite,
                            offsetY, false, true, MapConstants.OBJECT_BUFF_ZORDER)
                    elseif not self.target_.destroyed_ then
                        -- dump(self.target_._addViw["soulArrow"], "dump 钉魂箭")
                        -- print("添加钉魂箭数值 2 object.index_ = "..tostring(self.target_.index_))
                        self.target_._addViw["soulArrow"]:setString("钉魂箭"..self.target_._soulAttack)
                    end
                end
            end
            -- 给命中的目标计算伤害
            self.target_.mapRuntime_.handler_:hit(self.source_, self.target_, att)
        end
    end

    -- 删掉子弹图片
    self:removeView()

end

function ArrowBullet:miss()
    -- print("ArrowBullet:miss()")
    self:showBulletEffect(false)    
    -- miss要删掉子弹图片
    self:removeView()
end

return ArrowBullet
