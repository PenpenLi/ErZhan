local math2d = require("math2d")

local StaticObject      = require("app.map.StaticObject")
local MapConstants      = require("app.map.MapConstants")
local GlobalData        = require("tools.GlobalData")
local EffectAniCache    = require("app.map.spine.EffectAniCache")
local BattleDataManager = require("app.map.data.BattleDataManager")
local SkillFactory      = require("app.map.skills.SkillFactory")
local BuffBase          = require("app.map.skills.BuffBase")
local BuffProperties    = require("app.properties.BuffProperties")
local StableGameProperties  = require("app.properties.StableGameProperties")
local RangeObject = class("RangeObject", StaticObject)

RangeObject.DEFAULT_RADIUS = 80
RangeObject.MIN_RADIUS     = 16
RangeObject.MAX_RADIUS     = 500


-- 区域/NPC 物体的类型
RangeObject.TYPE_BORN_RANGE        = 1    --  1: 表示怪物出生点
RangeObject.TYPE_END_RANGE         = 2    --  2: 表示怪物的终点
RangeObject.TYPE_BUILDING_RANGE    = 3    --  3: 表示是一个装饰物，无任何功能
RangeObject.TYPE_SLOW_DOWN_RANGE   = 4    --  4: 减速区域
RangeObject.TYPE_SKILL_RANGE       = 5    --  5: 表示机关技能，点击后会释放一个技能
RangeObject.TYPE_TASK_RANGE        = 6    --  6: 表示任务探索NPC，确认后，英雄会消失去做任务
RangeObject.TYPE_PACKAGE_RANGE     = 7    --  7: 表示可拾取物
RangeObject.TYPE_THROW_ENEMY_RANGE = 8    --  8: 表示飞鸟抛物
RangeObject.JUMP_RANGE             = 9    --  9: 表示跳跃，会直接跳到下一个路径点
RangeObject.DAYE_RANGE             = 13   --  13: 表示打野区域


-- 门的打开状态
local CLOSED = 0
local OPENING = 1
local OPENED = 2

function RangeObject:ctor(id, state, map)
    
    RangeObject.super.ctor(self, id, state, map)
    self.valid_            = true
    self.collisionEnabled_ = true
    self.radius_           = math.round(tonumber(self.radius_)) -- toint(self.radius_)
    if not self.pathIds_ then
        self.pathIds_ = {}
    end
    
    if self.radius_ <= 0 then
        self.radius_ = RangeObject.DEFAULT_RADIUS
    end
    
    if not self.rangeType_ then
        self.rangeType_ = RangeObject.TYPE_RANGE
    end

    -- add by Owen, 2015.7.6, 如果是英雄出生点，那么自动填充三个英雄进去
    if self.rangeType_ == MapConstants.HERO_BORN_RANGE then
        
        local x, y = self.x_, self.y_
        -- 根据英雄出生点的位置，计算三个英雄站的位置
        local pos = map:calPos(self.x_, self.y_,"hero")
        -- pos[1] = {x = self.x_, y = self.y_ + 30}
        -- pos[2] = {x = self.x_ - 35, y = self.y_ -25}
        -- pos[3] = {x = self.x_ + 35, y = self.y_ -25}

        local heros = GlobalData.getHeroInFight() -- HeroInFight.getAll()
        -- dump(heros, "dump heros in fight")
        for i, v in ipairs (heros) do
            if v ~= 0 then
                local state = {
                    defineId = v,
                    owenId   = "Hero"..v,      -- 用来调试的时候方便查看
                    behaviors = "HeroBehavior",
                    x = pos[i].x,
                    y = pos[i].y,
                    patrolX = pos[i].x,
                    patrolY = pos[i].y,
                }
                -- dump(state, "dump hero state")
                map:newHero(state)
            end
        end
    end

    -- add by Owen, 2015.8.6, 如果是任务区域，一开始置为不可点击
    if self.rangeType_ == MapConstants.TASK_RANGE then
        -- 如果这个任务是过一段时间后才能出现
        if self.appearTime_ > 0 and not map.debugViewEnabled_  then
            self._canTouch = false
        end
    end

    -- add by Owen, 2015.8.6, 如果是机关区域，记录一下机关点击CD
    if self.rangeType_ == MapConstants.SKILL_RANGE then
        self._clickCD = self.rangeClickCD_
        self._canTouch = false
    end

    -- add by Owen, 2016.3.18, 打野区域初始化一些状态变量
    if self.rangeType_ == MapConstants.DAYE_RANGE then
        -- 打野元素的状态，1表示idle，2表示可点击动画，3表示点击完以后播放的动画
        self._dayeCurState   = MapConstants.DAYE_STATE_IDLE
        self._canClickInGame = false    -- 在游戏中是否可以点击
        self._needCheck      = false    -- 是否需要检测切换为可点击动画
        self._checkTime      = 0        -- 表示从需要开始检测开始，经过了多久

        self.xueQiuOriX = self.x_
        self.xueQiuOriY = self.y_
        -- print("记录雪球打野元素的位置 self.xueQiuOriX = "..tostring(self.xueQiuOriX)
        --     .." self.xueQiuOriY "..tostring(self.xueQiuOriY))

    end


    if not self.gateId_ then
        self.gateId_ = 0
    end

    if not self.campId_ then
        self.gateId_ = MapConstants.NPC_CAMP
    end

    self.openState = CLOSED
end

-- 为了保证有些区域是开始的时候不出现的，覆盖这个函数 
function RangeObject:createView(batch, marksLayer, debugLayer)
    RangeObject.super.createView(self, batch, marksLayer, debugLayer)
    -- add by Owen, 2015.8.6, 如果是任务区域，一开始置为不可见
    if self.rangeType_ == MapConstants.TASK_RANGE then
        -- print("RangeObject:createView task range")
        -- 如果这个任务是过一段时间后才能出现
        if self.appearTime_ > 0 then
            self:setVisible(false)
        end
        if self.map_.debugViewEnabled_ then
        -- if not self.mapRuntime_ then
            self:setVisible(true) 
        end
    elseif self.rangeType_ == MapConstants.JUMP_RANGE  then
        -- add by Owen, 2016.4.25, 传送区域需要置为不可见
        self:setVisible(false)
    elseif self.rangeType_ == MapConstants.BORN_RANGE then
        -- add by Owen, 2016.5.16, 游戏开始之后，起点和终点也要置为不可见
        self:setVisible(false)
    elseif self.rangeType_ == MapConstants.END_RANGE then
        -- add by Owen, 2016.5.16, 游戏开始之后，起点和终点也要置为不可见
        self:setVisible(false)
    elseif self.rangeType_ == MapConstants.DAYE_RANGE then
        -- add by Owen, 2016.6.5, 做第九关模式3, 把里面的法阵都置为不可见
        if self.dayeType_ == 6 or self.dayeType_ == 8 or self.dayeType_ == 7 then
            self:setVisible(false)
        end
        -- 71 表示的是第10关模式3，精华收集的场所，需要在头上放8个图
        if self.dayeType_ == 71 then
            self:playAni("Idle", true)

            local bg
            local essence
            -- 用来记录8个精华图片
            self.essenceIcons = {}
            -- 精华对应的位置
            local posX  = self.x_ - 75
            local diffX = 25
            local posY  = self.y_ + 70
            local allCount = StableGameProperties.Essence_NEED_COUNT
            for i = 1, 8 do
                bg = display.newSprite("ui/fight/threeMode/ten/bg.png")
                    :addTo(self.batch_)
                    :pos(posX + (i-1)*diffX, posY)
                essence = display.newSprite("ui/fight/threeMode/ten/essence.png")
                    :addTo(self.batch_)
                    :pos(posX + (i-1)*diffX, posY)
                    :setVisible(false)

                self.essenceIcons[i] = essence
            end
        end
    end

    self.gameLv = GlobalData.getGameLv()

end

-- -- 为了保证出生的门的图片和圈的位置不偏移，覆盖这个函数 
function RangeObject:updateView()
    if not self.sprite_ then
        return
    end
    RangeObject.super.updateView(self)
    -- 隐藏掉英雄出生点的图片
    if self.rangeType_ == MapConstants.HERO_BORN_RANGE then
        self:setVisible(false)
    end


    -- local sprite = self.sprite_
    -- -- sprite:setPosition(math.floor(self.x_ + self.offsetX_), math.floor(self.y_ + self.offsetY_))
    -- sprite:setPosition(math.floor(self.x_ ), math.floor(self.y_ ))
    -- sprite:setFlippedX(self.flipSprite_)
end

-- -- 为了保证出生的门的图片和圈的位置不偏移，覆盖这个函数 
-- function RangeObject:fastUpdateView()
--     if not self.updated__ then return end
--     local sprite = self.sprite_
--     -- sprite:setPosition(self.x_ + self.offsetX_, self.y_ + self.offsetY_)
--     sprite:setPosition(math.floor(self.x_ ), math.floor(self.y_ ))
--     sprite:setFlippedX(self.flipSprite_)
-- end

-- add by Owen, 2016.3.18, 增加区域的tick函数，
-- 在rt中会判定，只有打野元素才会调用这个函数
function RangeObject:tick(dt)
    -- print("打野区域 RangeObject:tick")
    if self._needCheck and self._dayeCurState ~= MapConstants.DAYE_STATE_CAN_CLICK then
        self._checkTime = self._checkTime + dt
        if self._checkTime >= self.checkCD_ then
            -- print("打野区域 CD 到了，判定一次是否改成可点击")
            self._checkTime = 0
            -- 判定的时间到了，还要判定一下概率
            if math.random(100) < self.random_ then
                -- 打野元素的类型, 1表示一直存在不能点击；2表示偶尔出现，不能点击；
                -- 3表示偶尔出现，可以点击; 4表示一直存在，时间到了变成可以点击
                -- 5表示一直存在，时间到了以后先播放出生动作，然后变成可以点击
                if self.dayeType_ == MapConstants.DAYE_TYPE_THREE then
                    self._needCheck = false
                    self._dayeCurState = MapConstants.DAYE_STATE_CAN_CLICK
                    -- print("RangeObject:tick() 一个打野元素变成可点击了 1")

                    local finic = function ( ... )
                        -- print("偶尔出现的可以点击的打野元素的出生动作 Born 播放完了")
                        self._dayeCurState = MapConstants.DAYE_STATE_CAN_CLICK

                        self.sprite_:playAni("CanClick", true)
                    end
                    self.sprite_:playAni("Born", false, nil, nil, finic)

                elseif self.dayeType_ == MapConstants.DAYE_TYPE_FOUR then
                    self._needCheck = false
                    self._dayeCurState = MapConstants.DAYE_STATE_CAN_CLICK
                    -- print("RangeObject:tick() 一个打野元素变成可点击了 2")
                    self.sprite_:playAni("CanClick", true)
                elseif self.dayeType_ == MapConstants.DAYE_TYPE_FIVE then
                    self._needCheck = false
                    -- self._dayeCurState = MapConstants.DAYE_STATE_CAN_CLICK
                    -- print("RangeObject:tick() 一个打野元素变成可点击了 1")

                    local finic = function ( ... )
                        -- print("偶尔出现的可以点击的打野元素的出生动作 Born 播放完了")
                        self._dayeCurState = MapConstants.DAYE_STATE_CAN_CLICK

                        self.sprite_:playAni("CanClick", true)
                    end
                    self.sprite_:playAni("Born", false, nil, nil, finic)

                    if self.mainID_ == "7" then
                        -- if self.gameLv == 9 or self.gameLv == 7 then
                            self.sprite_:setScaleX(-1)
                        -- end
                        -- print("RangeObject:tick setLocalZOrder")
                        self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER)
                    end
                end
            end
        end
    end

    -- 处理雪球滚动
    if self.mainID_ == "7" and self._dayeCurState == MapConstants.DAYE_STATE_CAN_CLICK then
        self:dealXueQiu(dt)
    end

    -- add by Owen, 2016.6.5, 制作第九关模式3，
    -- 每一波开始以后，过了一段时间需要把7个法阵中的3个置为可见
    -- dayeType == 6 表示是第九关模式3的法阵
    if self.gameLv == 9 and GlobalData.getGameMode() == 3 then
        -- 如果到了这一波3个法阵出现，还没有被判定过
        if not BattleDataManager:getHasCheck93() and self.check93Time then
            self.check93Time = self.check93Time + dt
            -- 如果到了这一波的选择3个法阵出现的判定时间
            -- print("self.check93Time = "..tostring(self.check93Time))

            if self.check93Time >= StableGameProperties.ROUND_CHECK_CD/1000 then
                -- print("把3个法阵置为可见")

                -- UI上显示一个法阵的倒计时
                self.map_.uiLayer.infoPanel:showFaZhenTime()

                -- 设置已经进行过把3个法阵置为可见的判定了
                BattleDataManager:setHasCheck93(true)
                
                -- 取到所有的法阵
                local faZhen = {}
                for i, rangeObject in pairs(self.map_.dayeItems_) do
                    if rangeObject.dayeType_ == 6 then
                        faZhen[#faZhen + 1] = rangeObject
                    end
                end
                -- 随机把3个法阵置为可见
                local result = math2d.getNRandom(1, #faZhen, 3)
                dump(result, "dump result 随机把3个法阵置为可见")
                -- 记录3个需要检测的法阵
                self.needCheck93Range = {}

                -- 记录3个法阵已经存在了多久，需要在配置的时间之后，把法阵都置为不可见
                self.faZhenRetainTime = 0

                faZhen[result[1]]:setVisible(true)
                local function finic( ... )
                    faZhen[result[1]]:playAni("CanClick", true)
                end
                faZhen[result[1]]:playAni("Born", false, nil, nil, finic)
                self.needCheck93Range[#self.needCheck93Range + 1] = faZhen[result[1]]
                
                faZhen[result[2]]:setVisible(true)
                local function finic( ... )
                    faZhen[result[2]]:playAni("CanClick", true)
                end
                faZhen[result[2]]:playAni("Born", false, nil, nil, finic)
                self.needCheck93Range[#self.needCheck93Range + 1] = faZhen[result[2]]
                
                faZhen[result[3]]:setVisible(true)
                local function finic( ... )
                    faZhen[result[3]]:playAni("CanClick", true)
                end
                faZhen[result[3]]:playAni("Born", false, nil, nil, finic)
                self.needCheck93Range[#self.needCheck93Range + 1] = faZhen[result[3]]
            end
        end
        -- 如果已经记录了3个需要判定的法阵，那么就需要开始判定英雄有没有进入这个法阵了
        if self.needCheck93Range and self.faZhenRetainTime then
            -- 记录3个法阵已经存在了多久，需要在配置的时间之后，把法阵都置为不可见
            self.faZhenRetainTime = self.faZhenRetainTime + dt
            if self.faZhenRetainTime > StableGameProperties.FA_ZHEN_RETAIN_TIME/1000 then
                -- print("时间到了，把法阵置为不可见")
                for i, v in ipairs(self.needCheck93Range) do
                    local function finic( ... )
                        v:setVisible(false)
                    end
                    v:playAni("AfterClick", false, nil, nil, finic)
                    -- v:setVisible(false)
                end
                self.faZhenRetainTime = nil
                self.needCheck93Range = nil

                -- 隐藏UI上显示的法阵倒计时
                self.map_.uiLayer.infoPanel:hideFaZhenTime()
            end

            -- 判定英雄是不是踩中了法阵
            if self.needCheck93Range then
                local heros = self.map_:getHero()
                for i, v in ipairs(self.needCheck93Range) do
                    -- 英雄踩中法阵以后，会把法阵置为不可见
                    if v.sprite_:isVisible() then
                        for i2, v2 in ipairs(heros) do
                            local dist = math2d.dist(v.x_ + v.radiusOffsetX_,
                                v.y_ + v.radiusOffsetY_,
                                v2.x_ + v2.radiusOffsetX_,
                                v2.y_ + v2.radiusOffsetY_)
                            -- print("英雄和法阵之间的距离为 dist = "..tostring(dist))
                            if dist < self.radius_ and not v2._has93Buff then
                                -- print("英雄踩中法阵以后，给英雄加Buff，并把法阵置为不可见")
                                
                                local function finic( ... )
                                    -- 英雄踩中法阵以后，给英雄加Buff，并把法阵置为不可见
                                    local buff  = BuffProperties.get(self.addBuff_)
                                    BuffBase.addTimeBuff(v2, buff)
                                    v:setVisible(false)
                                    v2._has93Buff = true

                                    -- 如果3个英雄都踩中了法阵，那么就把地图上所有的怪物都杀掉
                                    -- 上阵英雄数量必须为3个
                                    local checkHeros = self.map_:getHero()
                                    if #checkHeros == 3 then
                                        local bAllHasBuff = true
                                        for i, v in ipairs(checkHeros) do
                                            -- 有一个英雄没有中法阵的Buff
                                            if not v._has93Buff then
                                                bAllHasBuff = false
                                                break
                                            end
                                        end
                                        -- 3个英雄都中了法阵，把所有怪物都杀掉，然后清空自己
                                        if bAllHasBuff then
                                            -- 杀死所有的怪物
                                            for i, v in pairs(self.map_.simpleMonsters) do
                                                self.mapRuntime_.handler_:hit(nil, v, v.hp_)
                                            end
                                            for i, v in pairs(self.map_.bossMonsters) do
                                                self.mapRuntime_.handler_:hit(nil, v, v.hp_)
                                            end

                                            -- 清空英雄的Buff
                                            for i, v in ipairs(checkHeros) do
                                                local buff  = BuffProperties.get(self.addBuff_)
                                                BuffBase.clearOneTimeBuff(v, buff.occupied)
                                                v._has93Buff = nil
                                            end
                                            -- 把法阵置为不可见, 并且不进行其他判定
                                            if self.needCheck93Range then
                                                for i, v in ipairs(self.needCheck93Range) do
                                                    v:setVisible(false)
                                                end
                                            end
                                            -- 法阵持续时间为0
                                            self.faZhenRetainTime = nil
                                            -- 清空需要检测的法阵区域
                                            self.needCheck93Range = nil

                                            -- 隐藏UI上显示的法阵倒计时
                                            self.map_.uiLayer.infoPanel:hideFaZhenTime()
                                        end
                                    end
                                end
                                v:playAni("AfterClick", false, nil, nil, finic)
                                -- v:setVisible(false)
                            end
                        end
                    end
                end

                
            end
        end
    end
end

-- add by Owen, 2016.5.17, 处理雪球的滚动, 碰到塔以后，要把塔给爆掉
function RangeObject:dealXueQiu(dt)
    if self.gameLv == 7 then
        -- 第7关滚动的角度为20度
        local speedX = StableGameProperties.XUE_QIU_SEVEN_SPEED * 0.94
        local speedY = StableGameProperties.XUE_QIU_SEVEN_SPEED * 0.34
        self.x_ = self.x_ - speedX * dt
        self.y_ = self.y_ - speedY * dt
        self.sprite_:setPosition(self.x_, self.y_)
    elseif self.gameLv == 8 then
        -- 第7关滚动的角度为70度
        local speedX = StableGameProperties.XUE_QIU_SEVEN_SPEED * 0.57
        local speedY = StableGameProperties.XUE_QIU_SEVEN_SPEED * 0.82
        self.x_ = self.x_ - speedX * dt
        self.y_ = self.y_ - speedY * dt
        self.sprite_:setPosition(self.x_, self.y_)
    elseif self.gameLv == 9 then
        -- print("RangeObject:dealXueQiu self.y_ - 200*dt = "..tostring(self.y_ - 200*dt))
        self.y_ = self.y_ - StableGameProperties.XUE_QIU_NINE_SPEED * dt
        self.sprite_:setPositionY(self.y_)
    end

        -- 表示滚到屏幕外面了
        if self.y_ < (0 - display.height - 100) then

            -- 清除记录的，塔已经中了雪球冰冻Buff的记录
            for i, towerLocation in pairs(self.mapRuntime_.towers_) do
                object = towerLocation[4].tower
                object._hasAddXueQiuBuf = nil
            end

            local finishFunc = function ()
                self.x_ = self.xueQiuOriX
                self.y_ = self.xueQiuOriY
                self.sprite_:setPosition(self.x_, self.y_)
            
                self._dayeCurState = MapConstants.DAYE_STATE_IDLE
                self.sprite_:playAni("Idle", true)

                self.xueQiuClickCount = 0
            end
            self.sprite_:playAni("AfterClick", false, false, nil, finishFunc)
        end

        -- 如果有撞到塔的话，那么给塔上一个冰冻爆掉的特效，特效播完后移除塔
        local object
        for i, towerLocation in pairs(self.mapRuntime_.towers_) do
            object = towerLocation[4].tower

            if not object._hasAddXueQiuBuf then

                local dist = math2d.dist(self.x_, self.y_, object.x_, object.y_)
                if math.abs(self.x_ - object.x_) <= object.radius_ * 2.5 then
                    if self.gameLv == 9 and math.abs(self.y_ - object.y_) <= 10 then

                        local towerObj = object
                        local function finc()
                            -- 给塔加一个冰龙把塔冰冻的Buff
                            -- print("给塔加一个冰龙把塔冰冻的Buff")
                            local buff  = BuffProperties.get("220907")
                            BuffBase.addTimeBuff(towerObj, buff)
                            towerObj._hasAddXueQiuBuf = true
                        end
                        local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("xueqiushouji", false, finc, object)
                            object.sprite_:addChild(effect)
                        effect:setPosition(offsetX, offsetY)
                    end
                end
                if self.gameLv == 7 and dist <= 60 then
                    -- and math.abs(self.x_ - object.x_) <= 30 then
                    local towerObj = object
                    local function finc()
                        -- 给塔加一个冰龙把塔冰冻的Buff
                        -- print("给塔加一个冰龙把塔冰冻的Buff")
                        local buff  = BuffProperties.get("220907")
                        BuffBase.addTimeBuff(towerObj, buff)
                        towerObj._hasAddXueQiuBuf = true
                    end
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("xueqiushouji", false, finc, object)
                        object.sprite_:addChild(effect)
                    effect:setPosition(offsetX, offsetY)
                end
                if self.gameLv == 8 and dist <= 60 then
                    -- and math.abs(self.x_ - object.x_) <= 30 then
                    local towerObj = object
                    local function finc()
                        -- 给塔加一个冰龙把塔冰冻的Buff
                        -- print("给塔加一个冰龙把塔冰冻的Buff")
                        local buff  = BuffProperties.get("220907")
                        BuffBase.addTimeBuff(towerObj, buff)
                        towerObj._hasAddXueQiuBuf = true
                    end
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("xueqiushouji", false, finc, object)
                        object.sprite_:addChild(effect)
                    effect:setPosition(offsetX, offsetY)
                end
            end
        end
    
end

-- 根据传进来的点击位置，确认一下是不是点中了雪球
function RangeObject:onClickXueQiu(x, y)
    if self._dayeCurState == MapConstants.DAYE_STATE_CAN_CLICK then
        local dist = math2d.dist(self.x_, self.y_, x, y)
        if dist <= 55 then
            if not self.xueQiuClickCount then
                self.xueQiuClickCount = 0
            end
            self.xueQiuClickCount = self.xueQiuClickCount + 1

            -- print("点击了雪球 点击次数 self.xueQiuClickCount = "..tostring(self.xueQiuClickCount))
            if self.xueQiuClickCount >= StableGameProperties.XUE_QIU_CLICK_COUNT then

                -- 清除记录的，塔已经中了雪球冰冻Buff的记录
                for i, towerLocation in pairs(self.mapRuntime_.towers_) do
                    object = towerLocation[4].tower
                    object._hasAddXueQiuBuf = nil
                end

                local finishFunc = function ()
                    self.x_ = self.xueQiuOriX
                    self.y_ = self.xueQiuOriY
                    self.sprite_:setPosition(self.x_, self.y_)

                    self._dayeCurState = MapConstants.DAYE_STATE_IDLE
                    self.sprite_:playAni("Idle", true)

                    self.xueQiuClickCount = 0
                end
                self.sprite_:playAni("AfterClick", false, false, nil, finishFunc)
            end
        end
    end
end

-- 一波开始的时候，会调用这个函数，来判定打野元素是不是该显示了
function RangeObject:roundStart(round)
    -- 如果是类型1的打野元素，则不需要
    if self.dayeType_ ~= MapConstants.DAYE_TYPE_ONE 
        and self.dayeType_ ~= MapConstants.DAYE_TYPE_SIX
        and self.dayeType_ ~= MapConstants.DAYE_TYPE_SEVEN
        and self.dayeType_ ~= MapConstants.DAYE_TYPE_SEVEN_TWO
        and self.dayeType_ ~= MapConstants.DAYE_TYPE_EIGHT then
        -- 到我这一波了，表示我需要check
        for i,v in pairs(self.checkWave_) do
            if v == round and self._dayeCurState ~= MapConstants.DAYE_STATE_CAN_CLICK then
                self._needCheck = true
                self._checkTime = 0
            end
        end
    end

    -- add by Owen, 2016.6.5, 制作第九关模式3，
    -- 每一波开始以后，过了一段时间需要把7个法阵中的3个置为可见
    -- dayeType == 6 表示是第九关模式3的法阵
    if self.gameLv == 9 and GlobalData.getGameMode() == 3 then
        self.check93Time = 0
    end
end

-- 点击了这个打野元素的区域，需要做一些处理
function RangeObject:onClick()
    -- 如果是类型1的打野元素，则不需要
    if self.dayeType_ ~= MapConstants.DAYE_TYPE_ONE
        and self._dayeCurState == MapConstants.DAYE_STATE_CAN_CLICK then

        -- print("RangeObject:onClick() 点击了一个打野元素")

        self._dayeCurState = MapConstants.DAYE_STATE_AFTER_CLICK

        self._needCheck = false
        self._checkTime = 0

        if self.addGold_ and self.addGold_ > 0 then
            -- 点击打野元素以后，增加金币
            -- print("点击打野元素以后，增加金币")
            -- 播放跳金币的特效
            local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Add_gold", false)
            self.batch_:addChild(effect, MapConstants.HP_BAR_ZORDER)
            effect:setPosition(self.x_ + offsetX, self.y_ + self.offsetY_ + 20 + offsetY)

            BattleDataManager:addGold(self.addGold_)
        end
        if self.skillId_ and type(self.skillId_) == "table" and #self.skillId_ > 0 then
            -- 点击打野元素以后，释放一个技能
            -- print("点击打野元素以后，释放一个技能")
            -- (object, skillId, skillType, mapRuntime, src, target, x, y, isAttackMode)
            for i, skillId in pairs(self.skillId_) do
                SkillFactory.releaseSkill(self, skillId, MapConstants.SKILL_TYPE_AUTO, 
                    self.mapRuntime_, self, nil, self.x_, self.y_)
            end
        end
        local finishFunc = function ()
            self._dayeCurState = MapConstants.DAYE_STATE_IDLE
            self.sprite_:playAni("Idle", true)
        end
        self._dayeCurState = MapConstants.DAYE_STATE_AFTER_CLICK
        self.sprite_:playAni("AfterClick", false, false, eventFunc, finishFunc)

    end
end

--[[--

返回区域半径

]]
function RangeObject:getRadius()
    return self.radius_
end

-- 获取绑定了的 RoadID
function RangeObject:getRoadID()
    return self.roadID_
end

function RangeObject:setRoadID(id)
    self.roadID_ = id
end

--[[--

设置区域半径

]]
function RangeObject:setRadius(radius)
    if radius < RangeObject.MIN_RADIUS then radius = RangeObject.MIN_RADIUS end
    if radius > RangeObject.MAX_RADIUS then radius = RangeObject.MAX_RADIUS end
    self.radius_ = math.round(radius)
end

--[[--

导出 RangeObject 对象的状态

]]
function RangeObject:vardump()
    self:bindPathIds()
    local state = RangeObject.super.vardump(self)
    state.radius = self.radius_
    state.rangeType  = self.rangeType_
    state.delayTime  = self.delayTime_
    state.pathIds = self.pathIds_
    state.gateId = self.gateId_
    state.flipSprite = self.flipSprite_
    state.roadID = self.roadID_
    state.campId = self.campId_

    -- add by Owen, 2016.5.9, 写入区域的半径偏移量和形象偏移量
    state.radiusOffsetY = self.radiusOffsetY_
    state.offsetY       = self.offsetY_

    -- 写入减速区域作用对象，写入可拾取区域的作用对象
    if self.roleToAffect_ then
        state.roleToAffect = self.roleToAffect_
    end
    -- 写入减速区域减速百分比
    if self.slowPercent_ then
        state.slowPercent = self.slowPercent_
    end
    -- 写入机关技能区域调用技能id
    if self.skillId_ then
        -- state.skillId = {}
        -- dump(self.skillId_)
        -- print("self.skillId_ = "..tostring(self.skillId_))
        -- if string.len(self.skillId_) > 8 then
        --     -- 分割逗号，然后插入table中
        --     local ids = split(self.skillId_, ",");
        --     dump(ids, "dump 技能区域中配置的技能id")
        --     state.skillId = ids
        -- else
        --     -- print("配置的技能id = "..tostring(self.skillId_))
        --     table.insert(state.skillId, id)
        -- end
        state.skillId = self.skillId_
        -- print("222 self.skillId_ = "..tostring(self.skillId_))
        dump(state.skillId, "dump 222 state.skillId")
    end
    -- 写入机关技能区域点击的CD，也就是点过一次以后，CD就重置
    if self.rangeClickCD_ then
        state.rangeClickCD = self.rangeClickCD_
    end
    -- 写入任务探索消耗的时间
    if self.spendTime_ then
        state.spendTime = self.spendTime_
    end
    -- 写入任务探索区域金币奖励数量
    if self.awardCount_ then
        state.awardCount = self.awardCount_
    end
    -- 写入任务探索区域在游戏中的出现时间
    if self.appearTime_ then
        state.appearTime = self.appearTime_
    end
    -- 任务的图片是不一样的
    if self.imageName_ then
        state.imageName = self.imageName_
    end
    -- EditorScene:playMap()函数中会调到这里来，也就是地图运行后，将为到时间的任务置为不可见
    if self.rangeType_ == MapConstants.TASK_RANGE then
        -- print("RangeObject:createView task range")
        -- 如果这个任务是过一段时间后才能出现
        if self.appearTime_ > 0 then
            self:setVisible(false)
        end
    end
    -- 写入可拾取区域的搬运移动速度
    if self.moveSpeed_ then
        state.moveSpeed = self.moveSpeed_
    end
    -- 写入可拾取区域的调用脚本，写入飞鸟抛入的调用脚本
    if self.callScripts_ then
        state.callScripts = self.callScripts_
    end
    -- 写入飞鸟抛物的间隔时间
    if self.intervalTime_ then
        state.intervalTime = self.intervalTime_
    end
    -- 写入飞鸟抛物携带的怪物id
    if self.monsterId_ then
        state.monsterId = self.monsterId_
    end
    -- 写入飞鸟抛物携带的怪物数量
    if self.monsterNum_ then
        state.monsterNum = self.monsterNum_
    end
    -- add by Owen, 2016.3.18, 写入打野区域的配置
    if self.rangeType_ == MapConstants.DAYE_RANGE then
        -- print("RangeObject:vardump() da ye range")
        if self.dayeType_ then
            state.dayeType  = self.dayeType_
        end
        if self.canClick_ then
            state.canClick  = self.canClick_
        end
        if self.checkWave_ then
            state.checkWave  = self.checkWave_
        end
        if self.checkCD_ then
            state.checkCD  = self.checkCD_
        end
        if self.random_ then
            state.random  = self.random_
        end
        if self.addGold_ then
            state.addGold  = self.addGold_
        end
    end

    return state
end

function RangeObject:bindPathIds()
    local ids = {}
    for id, path in pairs(self.map_:getObjectsByClassId("path")) do
        local px,py = path:getPoint(1)
      
        if math2d.dist(self.x_,self.y_,px,py) <= self.radius_ then
            ids[#ids+1] = path:getId()
        end
    end
    self:addPathIds(ids)
end

function RangeObject:addPathIds(pids)
    self.pathIds_ = clone(pids)
end

function RangeObject:setRangeType(newValue)
    self.rangeType_ = newValue
end

function RangeObject:getRangeType()
    return self.rangeType_
end

function RangeObject:setCampId(newValue)
    self.campId_ = newValue
end

function RangeObject:getCampId()
    return self.campId_
end

function RangeObject:setRoleToAffect(newValue)
    self.roleToAffect_ = newValue
end

function RangeObject:getRoleToAffect()
    return self.roleToAffect_
end

function RangeObject:setSlowPercent(newValue)
    self.slowPercent_ = newValue
end

function RangeObject:getRoleToAffect()
    return self.slowPercent_
end

function RangeObject:setSkillId(newValue)

    local function split(str, reps)
        local resultStrsList = {};
        string.gsub(str, '[^' .. reps ..']+', function(w) 
            table.insert(resultStrsList, w) 
        end );
        return resultStrsList;
    end
    
    dump(newValue)
    -- print("self.skillId_ = "..tostring(self.skillId_))
    if string.len(newValue) > 8 then
        -- 分割逗号，然后插入table中
        local ids = split(newValue, ",");
        dump(ids, "dump 技能区域中配置的技能id")
        self.skillId_ = ids
    else
        self.skillId_ = {}
        -- print("配置的技能id = "..tostring(newValue))
        table.insert(self.skillId_, newValue)
    end

    dump(self.skillId_)
    -- print("self.skillId_ = "..tostring(self.skillId_))
end

function RangeObject:getSkillId()
    return self.skillId_
end

function RangeObject:setRangeClickCD(newValue)
    self.rangeClickCD_ = newValue
end

function RangeObject:getRangeClickCD()
    return self.rangeClickCD_
end

-- 打野元素的类型
function RangeObject:setDayeType(newValue)
    self.dayeType_ = newValue
end

function RangeObject:getDayeType()
    return self.dayeType_
end

-- 打野元素是否可以点击
function RangeObject:setCanClick(newValue)
    if newValue == "true" then
        self.canClick_ = true
    else
        self.canClick_ = false
    end
end

function RangeObject:getCanClick()
    return self.canClick_
end

-- 打野元素第几波开始的时候需要判定是否变成可以点击
function RangeObject:setCheckWave(newValue)
    local function split(str, reps)
        local resultStrsList = {};
        string.gsub(str, '[^' .. reps ..']+', function(w) 
            table.insert(resultStrsList, tonumber(w)) 
        end );
        return resultStrsList;
    end
    
    dump(newValue)
    if string.find(newValue, ",") then
        -- 分割逗号，然后插入table中
        local waves = split(newValue, ",");
        dump(waves, "dump 打野区域中，需要检查的波数")
        self.checkWave_ = waves
    else
        self.checkWave_ = {}
        -- print("配置的要检查的波数 wave = "..tostring(newValue))
        table.insert(self.checkWave_, newValue)
    end

    dump(self.checkWave_)
    -- print("self.checkWave_ = "..tostring(self.checkWave_))

end

function RangeObject:getCheckWave()
    return self.checkWave_
end

-- 打野元素, 这一波开始的时候过了多久判定一次是否变成可以点击
function RangeObject:setCheckCD(newValue)
    self.checkCD_ = newValue
end

function RangeObject:getCheckCD()
    return self.checkCD_
end

-- 打野元素, 每次判定的时候有50%的概率可以变为可点击状态
function RangeObject:setRandom(newValue)
    self.random_ = newValue
end

function RangeObject:getRandom()
    return self.random_
end

-- 打野元素, 点击以后奖励多少金币
function RangeObject:setAddGold(newValue)
    self.addGold_ = newValue
end

function RangeObject:getAddGold()
    return self.addGold_
end


function RangeObject:setSpendTime(newValue)
    self.spendTime_ = newValue
end

function RangeObject:getSpendTime()
    return self.spendTime_
end

function RangeObject:setAwardCount(newValue)
    self.awardCount_ = newValue
end

function RangeObject:getAwardCount()
    return self.awardCount_
end

function RangeObject:setAppearTime(newValue)
    self.appearTime_ = newValue
end

function RangeObject:getAppearTime()
    return self.appearTime_
end

function RangeObject:setImageName(newValue)
    self.imageName_ = newValue
    -- print("RangeObject:setImageName newValue = "..tostring(newValue))
    self:changeView(newValue)
end

function RangeObject:getImageName()
    return self.imageName_
end

function RangeObject:setMoveSpeed(newValue)
    self.moveSpeed_ = newValue
end

function RangeObject:getMoveSpeed()
    return self.moveSpeed_
end

function RangeObject:setCallScripts(newValue)
    self.callScripts_ = newValue
end

function RangeObject:getCallScripts()
    return self.callScripts_
end

function RangeObject:setIntervalTime(newValue)
    self.intervalTime_ = newValue
end

function RangeObject:getIntervalTime()
    return self.intervalTime_
end

function RangeObject:setMonsterId(newValue)
    self.monsterId_ = newValue
end

function RangeObject:getMonsterId()
    return self.monsterId_
end

function RangeObject:setMonsterNum(newValue)
    self.monsterNum_ = newValue
end

function RangeObject:getMonsterNum()
    return self.monsterNum_
end

function RangeObject:setDelayTime(newValue)
    self.delayTime_ = newValue
end

function RangeObject:getDelayTime()
    return self.delayTime_
end



-- 播放开门动画，重复调用也只会播放一次
-- @param onComplete 播放完毕后调用。如果动画正在播放中，onComplete 会等播完了再调用。如果动画已经播完，onComplete 会直接被调用
function RangeObject:playOpen(onComplete)
    -- 添加到 Signal
    if (not self.onOpenComplete) then
        self.onOpenComplete = Signal.new()
    end

    -- 总之先加到队列里
    if (onComplete ~= nil) then
        self.onOpenComplete:addOnce(onComplete)
    end

    -- 已经打开或没有 open 动画：直接广播 onOpenComplete
    if (self.openState == OPENED or not self.view_:hasAnimation("open")) then
        self.openState = OPENED
        self.onOpenComplete:dispatch(self)
        self.onOpenComplete:removeAll()
    -- 还没打开：播放动画
    elseif (self.openState == CLOSED) then
        -- 播放
        self.openState = OPENING
        self.onOpenComplete:addOnce(self.fillRoad, self)

        self:play("open", function (who)
            -- print([[self.view_:hasAnimation("open")]], self.view_:hasAnimation("open"))
            -- dump(self.view_:getAnimationNames())
            if (self.view_:hasAnimation("open")) then
                self.rt:showGuideOnce(506, true)
            end
            self.openState = OPENED
            self.onOpenComplete:dispatch(self)
            self.onOpenComplete:removeAll()

        end)
    end
end

-- 打开时自动填充路
function RangeObject:fillRoad()
    local road = self.map_:getObject(self:getRoadID())
    if (road) then
        self.map_:fillGrid(road)
    end
end

return RangeObject
