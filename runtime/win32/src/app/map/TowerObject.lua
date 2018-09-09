
local TowerObjectsProperties = require("app.properties.TowerObjectsProperties")
local TowerTalentProperties  = require("app.properties.TowerTalentProperties")
local BattleDataManager      = require("app.map.data.BattleDataManager")
local BuffProperties         = require("app.properties.BuffProperties")
local BuffBase               = require("app.map.skills.BuffBase")
local SkillFactory           = require("app.map.skills.SkillFactory")
local StableGameProperties   = require("app.properties.StableGameProperties")
local ObjectBase             = require("app.map.ObjectBase")
local BulletFactory          = require("app.map.bullets.BulletFactory")
local BulletType             = require("app.map.bullets.BulletType")
local BulletProperties       = require("app.properties.BulletProperties")
local MapConstants           = require("app.map.MapConstants")
local CsbAni                 = require("app.map.spine.CsbAni")
local EffectAniCache         = require("app.map.spine.EffectAniCache")
local GlobalData             = require("tools.GlobalData")
local BattleDataManager      = require("app.map.data.BattleDataManager")
local TowerObject = class("TowerObject", ObjectBase)

-- 新建塔
function TowerObject:ctor(id, state, map)
    assert(state.defineId ~= nil, "TowerObject:ctor() - invalid state.defineId")
    local define = TowerObjectsProperties.get(state.defineId)
    for k, v in pairs(define) do
        if state[k] == nil then
            state[k] = v
        end
    end
    TowerObject.super.ctor(self, id, state, map)

    self.radiusOffsetX_ = checkint(self.radiusOffsetX_)
    self.radiusOffsetY_ = checkint(self.radiusOffsetY_)
    self.radius_        = checkint(self.radius_)
    self.flipSprite_    = checkbool(self.flipSprite_)
    self.visible_       = true
    self.valid_         = true
    self.sprite_        = nil
    self.spriteSize_    = nil
    -- TO-DO, 程序中先写死掉子弹的类型
    self.bulletType_     = BulletType.CANNON -- BulletType.ARROW

    -- 记录这个塔都有什么天赋
    self.talent_ = {}
    -- 记录塔天赋等级
    self.talentOneLv_ = 0
    self.talentTwoLv_ = 0
    -- 记录塔升到目前天赋消耗了多少金币
    self.talentCostGold_ = 0

end

function TowerObject:getDefineId()
    return self.defineId_
end

function TowerObject:getRadius()
    return self.radius_
end

function TowerObject:isFlipSprite()
    return self.flipSprite_
end

function TowerObject:setFlipSprite(flipSprite)
    self.flipSprite_ = flipSprite
    self.sprite_:setFlippedX(flipSprite)
end

function TowerObject:getView()
    return self.sprite_
end

function TowerObject:createView(batch, marksLayer, debugLayer)
    -- print("TowerObject:createView ")
    TowerObject.super.createView(self, batch, marksLayer, debugLayer)

    local imageName
    if self.framesName_ then
        local frames = display.newFrames(self.framesName_, self.framesBegin_, self.framesLength_)
        self.sprite_ = display.newSprite(frames[1])
        self.sprite_:playAnimationForever(display.newAnimation(frames, self.framesTime_))
    else
        imageName = self.imageName_
        if type(imageName) == "table" then
            imageName = imageName[1]
        end
        -- self.sprite_ = display.newSprite(imageName)
    end

    -- 如果配置文件中形象有png，则表示还是一张图片
    if string.find(imageName, "png") then
        self.sprite_ = display.newSprite(imageName)
    elseif string.find(imageName, "csb") then

        local bHasPeople = true
        -- 记录下是不是都有背面，如果有背面的话，待机名字就是Idle_01
        local bHasBack = true

        -- 炮塔是没有背面的，4级炮塔是没有人的
        if (self.towerType_ == MapConstants.TOWER_TYPE_TURRET ) then
            bHasPeople = false
            bHasBack   = true
            if self.level_ == 4 then
                bHasPeople = true
            end
            if self.level_ >= 4 then
                bHasBack = false
            end
        end

        if string.find(self.mainID_, "1604") then
            local isJiTan = true
            -- add by Owen, 2016.6.20, 如果配置的祭坛塔，掠夺、产钱、召唤援兵全都被禁止了，
            -- 则替换形象为lanjitan2
            if not BattleDataManager:getCanPlunder() 
                and not BattleDataManager:getCanCallSoldier()
                and self.addGold_[1] == 0 then
                -- 不能掠夺、不能产钱、不能招兵，则显示这个形象
                imageName = "tower/lanjitan2.csb"
                isJiTan = false
            elseif not BattleDataManager:getCanPlunder() then
                -- 其他情况下，只要不能掠夺, 则显示这个形象
                imageName = "tower/lanjitan1.csb"
                isJiTan = false
            end

            -- 如果是祭坛塔
            self.sprite_ = CsbAni.new(self.mainID_, imageName, nil, nil, nil, isJiTan)
            self.isCsb_ = true
            -- add by Owen, 2016.4.28, 增加一个变量记录祭坛塔存储能量的状态，
            -- 用来控制4层特效的可见不可见
            self._plunderEffState = MapConstants.PLUNDER_EFF_STATE_ZERO

        else
            self.sprite_ = CsbAni.new(self.mainID_, imageName, bHasPeople, bHasBack, true)
            self.isCsb_ = true
        end
    end
    
    -- 如果配置文件中形象有png，则表示还是一张图片
    -- if string.find(imageName, "png") then
    --     self.sprite_ = display.newSprite(imageName)
    -- elseif string.find(imageName, "pvr") then
    --     -- 配置中没有 -3 的话，则表示这个角色已经打包成一个帧动画了
    --     self.sprite_ = FrameAni.new(self.mainID_, imageName)
    -- else
    --     self.sprite_ = SpineAni.new(self.mainID_, imageName)
    -- end




    local size = self.sprite_:getContentSize()
    self.spriteSize_ = {size.width, size.height}

    if self.scale_ then
        pirnt("TowerObject:createView self.scale_ = "..tostring(self.scale_))
        self.sprite_:setScale(self.scale_)
    end
    batch:addChild(self.sprite_)
end

-- 用来播放塔的攻击动画
function TowerObject:playAni(name, isForerer, forceStop, eventFunc, finishFunc)
    if string.find(self.imageName_, "csb") then
        self.sprite_:playAni(name, isForerer, forceStop, eventFunc, finishFunc, nil, self)
    else
        if eventFunc then
            eventFunc()
        end
        if finishFunc then
            finishFunc()
        end
    end
end

-- add by Owen, 2016.4.16, 增加动画的暂停，游戏暂停以后，动画也需要暂停
function TowerObject:pause()
    if string.find(self.imageName_, "csb") then
        self.sprite_:pause()
    end
end

-- add by Owen, 2016.4.16, 增加csb动画暂停后继续播放
function TowerObject:resume()
    if string.find(self.imageName_, "csb") then
        self.sprite_:resume()
    end
end


function TowerObject:removeView()
    -- print("TowerObject:removeView()")
    if not self.sprite_ then
        return
    end

    self.sprite_:removeSelf()
    self.sprite_ = nil
    TowerObject.super.removeView(self)
end

-- 塔升级以后，修改显示的图片
function TowerObject:changeView(imageName, nextID, towerInAureoles)
    -- print("TowerObject:changeView imageName = "..tostring(imageName))
    if not self.sprite_ then
        return
    end

    -- print("TowerObject:changeView 1")

    if self.isCsb_ then
        -- print("TowerObject:changeView 2")
        -- 把csb动画node给移除了
        local delayTime = 0
        local act1 = cc.DelayTime:create(delayTime)
        local act2 = cc.ScaleTo:create(0.1, 0.9)
        -- print("TowerObject:changeView 3")

        local function finc()
            -- print("TowerObject:changeView 4")
            self.sprite_:removeSelf()

            -- change by Owen, 2016.5.23, 因为升级塔做了特效，
            -- 把数值的修改放到 TowerObject:changeView() 中删除老的塔之后处理
            self:upLevel(nextID)

            -- print("TowerObject:changeView 8")
            local bHasPeople = true
            -- 记录下是不是都有背面，如果有背面的话，待机名字就是Idle_01
            local bHasBack = true

            -- 炮塔是没有背面的，4级炮塔是没有人的
            if (self.towerType_ == MapConstants.TOWER_TYPE_TURRET ) then
                bHasPeople = false
                -- print("self.level_ = "..self.level_)
                if self.level_ == 4 then
                    bHasPeople = true
                end
                if self.level_ >= 4 then
                    bHasBack = false
                end
            end
            
            self.sprite_ = CsbAni.new(self.mainID_, imageName, bHasPeople, bHasBack, true)
            self.batch_:addChild(self.sprite_)
            self.sprite_:setVisible(false)

            -- 塔进入了这个光环
            for i,v in ipairs(towerInAureoles) do
                v:objectEnterRange(self)
            end


            -- print("TowerObject:changeView 5")

            local delayTime1 = 0
            local act5 = cc.DelayTime:create(delayTime1)
            -- print("TowerObject:changeView 6")
            local function finc2()

                -- print("TowerObject:changeView 7")

                if string.find(imageName, "csb") then

                    -- self.sprite_ = CsbAni.new(self.mainID_, imageName, bHasPeople, bHasBack, true)
                    -- self.batch_:addChild(self.sprite_)

                    -- 播放塔升级特效，也用来做造塔特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("ui_tower_upgrade", nil, nil, tower)
                    self.sprite_:addChild(effect)
                    -- print("塔升级特效，offsetY = "..tostring(offsetY))
                    effect:setPosition(offsetX, offsetY)

                    self.sprite_:setVisible(true)
                    self.isCsb_ = true

                    -- 塔升级完了替换图片以后，设置一下Zorder
                    self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
                    
                    --调整位置
                    self:updateView()
                else
                    self.sprite_ = display.newSprite(imageName)
                    self.batch_:addChild(self.sprite_)

                    -- 塔升级完了替换图片以后，设置一下Zorder
                    self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
                    
                    --调整位置
                    self:updateView()
                end

                -- print("TowerObject:changeView 9")
                self.sprite_:setScale(0.9)
            end

            -- print("TowerObject:changeView 10")

            local act6 = cc.CallFunc:create(finc2)
            local act7 = cc.ScaleTo:create(0.1, 1.1)
            local act8 = cc.ScaleTo:create(0.1, 1.0)

            -- print("TowerObject:changeView 11")

            -- delayTime = delayTime + 0.45
            local seq  = cc.Sequence:create(act5, act6, act7, act8)
            self.sprite_:runAction(seq)

            -- print("TowerObject:changeView 12")


        end
        local act3 = cc.CallFunc:create(finc)
        local seq  = cc.Sequence:create(act1, act2, act3)
        self.sprite_:runAction(seq)

        -- print("TowerObject:changeView 13")




        -- self.sprite_:removeSelf()
        -- if string.find(imageName, "csb") then
        --     local bHasPeople = true
        --     -- 记录下是不是都有背面，如果有背面的话，待机名字就是Idle_01
        --     local bHasBack = true

        --     -- 炮塔是没有背面的，4级炮塔是没有人的
        --     if (self.towerType_ == MapConstants.TOWER_TYPE_TURRET ) then
        --         bHasPeople = false
        --         -- print("self.level_ = "..self.level_)
        --         if self.level_ == 4 then
        --             bHasPeople = true
        --         end
        --         if self.level_ >= 4 then
        --             bHasBack = false
        --         end
        --     end
        --     self.sprite_ = CsbAni.new(self.mainID_, imageName, bHasPeople, bHasBack, true)
        --     self.batch_:addChild(self.sprite_)
        --     self.isCsb_ = true

        --     -- 塔升级完了替换图片以后，设置一下Zorder
        --     self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
            
        --     --调整位置
        --     self:updateView()
        -- else
        --     self.sprite_ = display.newSprite(imageName)
        --     self.batch_:addChild(self.sprite_)

        --     -- 塔升级完了替换图片以后，设置一下Zorder
        --     self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
            
        --     --调整位置
        --     self:updateView()
        -- end
    else
        self.sprite_:setTexture(imageName)

        -- 塔升级完了替换图片以后，设置一下Zorder
        self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
        
        --调整位置
        self:updateView()
    end
    
    -- -- 这个函数的参数是一张图片的名字
    -- self.sprite_:setTexture(imageName)

    -- -- 塔升级完了替换图片以后，设置一下Zorder
    -- self.sprite_:setLocalZOrder(MapConstants.MAX_OBJECT_ZORDER - (self.y_ + self.offsetY_))
    
    -- --调整位置
    -- self:updateView()

    -- print("changeView")
    -- 这个函数的参数是一个大的png里面的一小个图片的名字,且前面有#号
    -- self.sprite_:setSpriteFrame(imageName)
end

function TowerObject:updateView()
    if not self.sprite_ then
        return
    end

    local sprite = self.sprite_
    sprite:setPosition(math.floor(self.x_ + self.offsetX_), math.floor(self.y_ + self.offsetY_))
    -- print("updateView self.offsetX_ = "..tostring(self.offsetX_))
    -- sprite:setFlippedX(self.flipSprite_)
end

function TowerObject:fastUpdateView()
    if not self.updated__ then return end
    local sprite = self.sprite_
    sprite:setPosition(self.x_ + self.offsetX_, self.y_ + self.offsetY_)
    -- sprite:setFlippedX(self.flipSprite_)
    -- print("fastUpdateView self.offsetX_ = "..tostring(self.offsetX_))
end

-- 处理生产金币的功能，传入经过的时间，传出生产的金币
function TowerObject:updateGoldProduce(passTime)--ms
    if self.addGold_[1] ~= 0 then
        if self.addGoldCooldown == nil then
            self.addGoldCooldown = self.addGold_[2]
        end
        self.addGoldCooldown = self.addGoldCooldown - passTime
        local goldAdd = 0

        while(self.addGoldCooldown <= 0)
        do
           goldAdd = goldAdd+self.addGold_[1]
           self.addGoldCooldown = self.addGoldCooldown+self.addGold_[2]
        end
        return goldAdd
    end
    -- body
end

-- 处理塔的掠夺技能
-- 正常的在mapruntime:tick()中调用这个函数，传入dt，通过时间来增长能量
-- 怪物死亡的时候也会调用这个函数，dt == nil， directCount传入需要修改的能量
function TowerObject:dealTowerPlunderPower(dt, directCount)
    -- add by Owen, 2016.5.11, 第一关和第二关的模式1，以及祭坛塔被禁止掠夺的情况下，能量点不要涨
    local gameLv = GlobalData.getGameLv()
    local mode   = GlobalData.getGameMode()
    if (gameLv == 1 or gameLv == 2) and mode == 1 then
        return
    end
    -- 祭坛塔被禁止掠夺的情况下，能量点不要涨
    if not BattleDataManager:getCanPlunder() then
        return
    end

    if not self._plunderPower then
        self._plunderPower = 0
    end
    if dt then
        self._plunderPower = self._plunderPower + dt*self.restorePower_[1]
    else
        self._plunderPower = self._plunderPower + directCount
    end

    -- add by Owen, 2016.4.28, 根据储能的5种状态，来控制祭坛塔4层特效的可见不可见
    local plunderPower = self._plunderPower       -- 目前存储了多少能量点
    local needPower    = self.restorePower_[2]    -- 储满的话需要多少能量点
    -- print("TowerObject:dealTowerPlunderPower plunderPower = "..tostring(plunderPower)
    --     .." needPower = "..tostring(needPower))
    if plunderPower >= needPower then
        self.sprite_:showPlunderEff(4)
        -- 能量满了，要把满的特效也显示出来
        if not self._plunderFullEff then
            -- 把祭坛塔可以掠夺的特效改为程序处理
            local sprite = display.newSprite("ui/fight/soldierTower/jitan_plunder.png")
            self.sprite_:addChild(sprite)

            -- local act1 = cc.RotateBy:create(1, 360)
            -- local seq  = cc.Sequence:create(act1)
            -- local rotateAction1 = cc.RepeatForever:create(seq)

            local fade1 = cc.FadeTo:create(0.5, 100)
            local fade2 = cc.FadeTo:create(0.3, 255)
            local seq_2 = cc.Sequence:create(fade1, fade2)
            local rotateAction2 = cc.RepeatForever:create(seq_2)
            -- local action_1 = cc.Spawn:create(rotateAction1, rotateAction2)

            sprite:runAction(rotateAction2)

            sprite:setScaleX(self.plunderRange_/280)
            sprite:setScaleY(0.8 * self.plunderRange_/280)

            sprite:setPositionY(25)
            self._plunderFullEff = sprite
        end

    elseif plunderPower > needPower*3/4 then
        self.sprite_:showPlunderEff(3)

    elseif plunderPower > needPower/2 then
        self.sprite_:showPlunderEff(2)

    elseif plunderPower > needPower/4 then
        self.sprite_:showPlunderEff(1)
    else
        self.sprite_:showPlunderEff(0)
    end
    if self._plunderPower >= self.restorePower_[2] then
        self._plunderPower = self.restorePower_[2]

        -- add by Owen, 2016.5.4, 第3关的模式1没有通关，
        -- 祭坛塔第一次掠夺能量点够了之后，需要显示祭坛掠夺新手引导弹窗
        local gameLv = GlobalData.getGameLv()
        if gameLv == 3 then
            local lvStar = GlobalData.getLvStar(gameLv)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                -- 发信号给BattleUI，显示祭坛掠夺新手引导弹窗
                NotifyCenter.notify(EventNames.SHOW_PLUNDER_GUIDE_TIPS)
            end
        end
    end

    -- -- 显示兵塔的掠夺倒计时
    -- if not self._addViw then
    --     self._addViw = {}
    -- end
    -- if not self._addViw["plunderPower"] then
    --     -- print("添加祭坛塔储能数值 1 object.index_ = "..tostring(self.index_))
    --     local showCount = math.ceil(self._plunderPower)
    --     self._addViw["plunderPower"] = self:addView("掠夺能量点:"..showCount.."/"
    --         ..self.restorePower_[2],
    --                         150, false)
    -- else
    --     local showCount = math.ceil(self._plunderPower)
    --     self._addViw["plunderPower"]:setString("掠夺能量点:"..showCount.."/"
    --         ..self.restorePower_[2])
    -- end
end

-- 处理塔的天赋技能
function TowerObject:dealUpTowerTalent(index)
    -- 获得当前天赋的配置
    local talentConfig      = self.talent_[index]
    local nextTalentID
    -- 如果未升级过天赋，那么就从塔的配置中去取可以升级的天赋if
    if not talentConfig then
        nextTalentID = self.towerTalent_[index]
    else
        nextTalentID = talentConfig.nextLvID
    end
    local nextTalentConfig  = TowerTalentProperties.get(nextTalentID)
    if not nextTalentConfig then
        return
    else
        -- 给自己加天赋技能
        self:dealTalent(nextTalentConfig)

        self.talent_[index]  = nextTalentConfig
        self.talentCostGold_ = self.talentCostGold_ + nextTalentConfig.levelGold
        BattleDataManager:costGold(nextTalentConfig.levelGold)

        -- 处理成就，第一次点满防御塔天赋 的成就
        if nextTalentConfig.level == 3 then
            local state1 = GlobalData.getAchieve("141207") 
            if state1 == 0 then
                GlobalData.setAchieve("141207", 1)
            end
        end
    end
end

-- 给自己加天赋技能, 真正的增加效果
function TowerObject:dealTalent(talentConfig)
    -- 如果是给自己加Buff的
    if talentConfig.selfState then
        -- 具体的buff配置
        local buff
        for i,v in ipairs(talentConfig.selfState) do
            buff = BuffProperties.get(v[2])
            BuffBase.addTimeBuff(self, buff, self, nil)
        end
    end
    -- 如果是给自己增加一个技能
    if talentConfig.AIskill then
        -- print("TowerObject:dealTalent add AIskill")
        -- 先清空原有的技能
        SkillFactory.clearAISkill(self)
        SkillFactory.addAISkill(self, talentConfig.AIskill, true)
    end
end

-- 生成魂魄子弹, index表示是第一个子弹还是第二个子弹，根据这个index来确定子弹的初始位置
-- 如果有攻击目标，才生成子弹，并返回true
function TowerObject:newSoulBullet(index)
    local bulletConfig = BulletProperties.get(StableGameProperties.FOUR_LV_MAGIC_SOUL_BULLET_ID)
    -- 随机取一条路径，然后取得这个路径上血量最多的怪物
    local moreHpTarget
    -- 随机取一条路径
    local pathIds   = self.map_:getPathIds()
    -- dump(pathIds, "dump TowerObject:newSoulBullet pathIds")
    local pathIndex = math.random(#pathIds)
    -- 取得所有的怪物
    for i, object in pairs(self.map_.objects_) do
        -- print("object.bindingPathId_ 1 = "..tostring(object.bindingPathId_))
        if object.bindingPathId_ == pathIds[pathIndex] then
            -- print("object.bindingPathId_ 2 = "..tostring(object.bindingPathId_))
            -- 地下的怪物不能作为攻击目标
            -- add by Owen, 2016.4.25, 如果是isHide的怪物，也不能攻击，防止攻击飞到屏幕外面的冰龙
            if object.walkLayer_ ~= MapConstants.MONSTER_WALK_LAYER_UNDER 
                and not object.isHide then
                if not moreHpTarget then
                    moreHpTarget = object
                else
                    if object.hp_ > moreHpTarget.hp_ then
                        moreHpTarget = object
                    end
                end
            end
        end
    end

    if moreHpTarget then
        -- dump(moreHpTarget, "dump moreHpTarget")

        -- 把存储的图片置为不可见
        self._soulBulletImgs[index]:setVisible(false)

        local bullet = BulletFactory.newBullets(bulletConfig.bulletType, 
            self, moreHpTarget, 0, bulletConfig, nil)    -- object.trajectory_)
        self.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
        self.mapRuntime_:addBullet(bullet)
        return true
    end
    return false
end

-- 处理4级法师塔的仙术天赋, 每次只是把这两个子弹给显示出来
function TowerObject:dealTowerFantasy(dt)
    if not self._allSouls then
        self._allSouls = 0
    end
    
    -- print("TowerObject:dealTowerFantasy 当前搜集的魂魄点 = "..tostring(self._allSouls))
    -- 处理发射第二个子弹
    if self._secondBulletInterval then
        self._secondBulletInterval = self._secondBulletInterval - dt
        if self._secondBulletInterval <= 0 then
            if self:newSoulBullet(2) then
                self._secondBulletInterval = nil
            end
        end
    end

    self._allSouls = self._allSouls + StableGameProperties.FOUR_LV_MAGIC_TIME_RESTORE * dt
    if self._allSouls >= StableGameProperties.FOUR_LV_MAGIC_NEED_SOULS then

        -- 显示两个魂魄子弹图片
        if not self._soulBulletImgs then
            local bulletConfig = BulletProperties.get(StableGameProperties.FOUR_LV_MAGIC_SOUL_BULLET_ID)
            self._soulBulletImgs = {}
            local diffX = 100
            local diffY = 20
            for i = 1, 2 do
                local sprite
                if string.find(bulletConfig.bulletImages, "png") then
                    sprite = display.newSprite(bulletConfig.bulletImages)
                else
                    sprite, offsetY = EffectAniCache.getEffectAniCache(bulletConfig.bulletImages, true)
                end
                self._soulBulletImgs[i] = sprite
                local tarX = self.x_ + self.radiusOffsetX_ + self.fireOffsetX_
                local tarY = self.y_ + self.radiusOffsetY_ + self.fireOffsetY_
                if i == 1 then
                    self._soulBulletImgs[i]:setPosition(tarX + diffX, tarY + diffY)
                else
                    self._soulBulletImgs[i]:setPosition(tarX - diffX, tarY + diffY)
                end
                self.map_:getBatchLayer():addChild(self._soulBulletImgs[i], MapConstants.BULLET_ZORDER)
            end
        else
            self._soulBulletImgs[1]:setVisible(true)
            self._soulBulletImgs[2]:setVisible(true)
        end

        if self:newSoulBullet(1) then
            self._allSouls = 0
            self._secondBulletInterval = StableGameProperties.FOUR_LV_MAGIC_FIRE_INTERVAL/MapConstants.MILLISECOND
        else
            self._allSouls = StableGameProperties.FOUR_LV_MAGIC_NEED_SOULS
        end
    end

    -- -- 显示当前收集的魂魄数
    -- if not self._addViw then
    --     self._addViw = {}
    -- end
    -- if not self._addViw["soulAttackCount"] then
    --     -- print("添加钉魂箭数值 1 object.index_ = "..tostring(self.index_))
    --     local showCount = math.ceil(self._allSouls)
    --     self._addViw["soulAttackCount"] = self:addView("魂魄数"..showCount.."/"
    --         ..StableGameProperties.FOUR_LV_MAGIC_NEED_SOULS,
    --                         150, false)
    -- else
    --     local showCount = math.ceil(self._allSouls)
    --     self._addViw["soulAttackCount"]:setString("魂魄数"..showCount.."/"
    --         ..StableGameProperties.FOUR_LV_MAGIC_NEED_SOULS)
    -- end
end

-- 在4级法师塔的收集范围内被击杀的怪物，直接给4级法师塔充能
function TowerObject:addTowerFantasy(count)
    if not self._allSouls then
        self._allSouls = count
    else
        self._allSouls = self._allSouls + count
    end
end

-- 根据塔的优先级来重新获得塔应该攻击的目标
function TowerObject:checkAttackTargets(targets)

    if targets and #targets > 0 then
        -- print("#targets = "..tostring(#targets))
        for i = #targets, 1, -1 do
            -- print("targets[i].isHide = "..tostring(targets[i].isHide))
            if targets[i].isHide == true then
                -- print("targets[i].isHide == true")
                table.remove(targets, i)
            end
        end
        if targets and #targets > 0 then
            -- print("在塔攻击范围内的怪物数量总共有 #targets = "..tostring(#targets))


            local bHasNoBuffTargets = {}    -- 用来记录所有的目标中是否有未中 淬毒Buff 的
            for i,v in ipairs(targets) do
                if (not v.buffs_.timeBuff_)
                    or (v.buffs_.timeBuff_ and 
                        not v.buffs_.timeBuff_[StableGameProperties.FIVE_LV_TOWER_POISON_BUFF_OCCP])
                    then
                    bHasNoBuffTargets[#bHasNoBuffTargets + 1] = v
                end
            end


            local tarNum = self.atkNumber_    -- 塔同时可以攻击的目标数量
            local finalTargets = {}    -- 根据优先级以及可以攻击的个数来获得最终目标

            local priority = self.atkPriority_
            local atkNum = 0
            local bNeedPriority = true    -- 是否需要优先级来判定 

            -- targets 是用来做优先级遍历的table
            -- finalTargets 是塔最终要攻击的目标
            -- print("#bHasNoBuffTargets = "..tostring(#bHasNoBuffTargets).." tarNum = "..tostring(tarNum)
            --     .." self.mainID = "..self.mainID_.." self.fireRange_ = "..tostring(self.fireRange_))
            if #bHasNoBuffTargets > tarNum then
                -- 如果有大于可同时攻击数量的物体，没有中 淬毒Buff
                -- print("未中Buff数大于可攻击数目")
                targets = bHasNoBuffTargets
                -- print("在塔攻击范围内的怪物数量总共有 2 #targets = "..tostring(#targets))
            elseif #bHasNoBuffTargets == tarNum then
                -- 恰好有可同时攻击数量的物体，没有中 淬毒Buff
                -- print("未中Buff数等于可攻击数目")
                bNeedPriority = false
                finalTargets = bHasNoBuffTargets
            elseif #bHasNoBuffTargets < tarNum then
                -- 少于可同时攻击数量的物体，没有中 淬毒Buff
                -- print("未中Buff数小于可攻击数目")
                for i,v in ipairs(bHasNoBuffTargets) do
                    finalTargets[i] = bHasNoBuffTargets[i]
                    tarNum = tarNum - 1    -- 塔可以同时攻击的目标数量要 减一
                    -- 从targets中移除这个目标
                    for i2 = #targets, 1, -1 do 
                        if targets[i2].index_ == finalTargets[i].index_ then
                            table.remove(targets, i2)
                            break
                        end
                    end
                end
            end
            
            -- 塔 需要根据优先目标来做一次筛选
            if bNeedPriority and #targets > 0 then
                for i,v in ipairs (priority) do
                    if atkNum > tarNum then
                        break
                    end
                    for i2,v2 in ipairs(targets) do
                        -- print("v2.AImode_  = "..tostring(v2.AImode_ ))
                        if v2.AImode_ == v and atkNum < tarNum then
                            finalTargets[#finalTargets + 1] = v2
                            atkNum = atkNum + 1
                        end
                    end
                end
            end

            return finalTargets
            -- if #finalTargets > 0 then
            --     -- 给塔赋值bList，用来在触发技能，判定技能目标的时候用到
            --     object.bList = finalTargets
            --     -- 判定普攻是否触发了技能
            --     local hasReleaseSkill = false
            --     if object.attackTriggerSkill and #object.attackTriggerSkill > 0 then
            --         hasReleaseSkill = SkillFactory.checkAttackTriggerSkill(object, finalTargets[1])
            --     end
            --     object.bList = nil    -- 塔技能用完以后，就把bList置为nil
            --     -- 如果普攻没有触发技能，那么塔才可以普通攻击
            --     if not hasReleaseSkill then
            --         local bullets = object:fire(finalTargets)
            --         -- dump(bullets, MapEventHandler:fire(object, target))
            --         for i, bullet in ipairs(bullets) do
            --             object.map_:getBatchLayer():addChild(bullet:getView(), MapConstants.BULLET_ZORDER)
            --             object.mapRuntime_:addBullet(bullet)
            --         end
            --     else
            --         -- print("塔普攻触发了技能")
            --     end
            -- end
        end
    end

end

function TowerObject:isVisible()
    return self.visible_
end

function TowerObject:setVisible(visible)
    self.sprite_:setVisible(visible)
    self.visible_ = visible
end

function TowerObject:preparePlay()
end

function TowerObject:vardump()
    local state = TowerObject.super.vardump(self)
    state.defineId    = self.defineId_
    state.flipSprite  = self.flipSprite_
    return state
end

return TowerObject
