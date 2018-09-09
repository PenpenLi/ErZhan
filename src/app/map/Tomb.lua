
-- 墓碑类
-- 负责倒计时和复活功能

local MapConstants         = require("app.map.MapConstants")
local ObjectState          = require("app.map.ObjectState")
local EffectAniCache       = require("app.map.spine.EffectAniCache")
local StableGameProperties = require("app.properties.StableGameProperties")
local SkillFactory         = require("app.map.skills.SkillFactory")
local Tomb = class("Tomb")

-- ctor
-- isInTask 表示英雄死亡的时候，是不是在做任务
function Tomb:ctor(object, mapRuntime, map, isSkillRevive, reviveSkillCD, isInTask)

	-- o 代表已死亡的对象，复活时要用到
	self.object        = object
    self.reviveTime    = object.reviveTime_  -- 复活倒计时
    self.mainID        = object.mainID_
    self.x             = object.x_
    self.y             = object.y_
    self.patrolX       = object.patrolX_
    self.patrolY       = object.patrolY_
    self.mapRuntime    = mapRuntime
	self.map           = map
    self.isSkillRevive = isSkillRevive
    self.reviveSkillCD = reviveSkillCD - self.reviveTime
    self.isOver_       = false
    self.level         = object.level_
    self.exp           = object.exp_
    self.bFirstTick    = true             -- 用来标记是不是第一次执行Tomb:tick()函数，用来删除spine动画


	assert(object.isDead_, "英雄还没死亡")

    -- 不过不是技能复活，那么英雄的死亡次数要加1，复活时间也要相应增加
    if not isSkillRevive then
        object.heroDeadCount_ = object.heroDeadCount_ + 1
        -- print("object.heroDeadCount_ = "..tostring(object.heroDeadCount_))
        self.reviveTime = self.reviveTime + (object.heroDeadCount_ - 1)*StableGameProperties.HERO_DEAD_ADD_TIME
        if self.reviveTime > StableGameProperties.HERO_DEAD_MAX_TIME then
            self.reviveTime = StableGameProperties.HERO_DEAD_MAX_TIME
        end
    end
    -- add by Owen, 2016.4.19, 记录一个英雄不变的英雄复活时长，用在UI页面中处理
    self.allReviveTime = self.reviveTime

    self.heroDeadCount_   = object.heroDeadCount_

	-- 通过验证
	self.valid_ = true

	-- 移动到死亡位置
    local sprite = display.newSprite("hero/tomb.png")
    map:getBatchLayer():addChild(sprite)
    sprite:setPosition(object.x_, object.y_)
    self.sprite = sprite


    -- add by Owen, 2016.7.26, 如果英雄在做任务的时候死亡了，那么需要添加这么一段逻辑
    if isInTask then
        -- print("英雄在做任务的时候死亡了")
        self._disappeerX = object._disappeerX
        self._disappeerY = object._disappeerY
        -- print("英雄死亡的时候，墓碑移走 tomb._disappeerX = "..tostring(tomb._disappeerX))
        -- 把物体的坐标 x, y 都置为10000
        self.x = MapConstants.FOUDATION_PERCENT
        self.y = MapConstants.FOUDATION_PERCENT
        self:changePosition(self.x, self.y)
    end

    
    -- 显示的英雄复活倒计时
    self.timeLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = self.reviveTime,
        font = "Arial",
        color = cc.c3b(255, 255, 255),
        size  = 32,
        x = 10,
        y = 70,
    })
    -- 把倒计时的数字置为不可见
    self.timeLabel:setVisible(false)

    map:getBatchLayer():addChild(self.timeLabel)
    self.timeLabel:setPosition(object.x_ + 10, object.y_ + 70)
    -- self.sprite:addChild(self.timeLabel)
end

-- 走倒计时
function Tomb:tick(dt)

    -- 第一次进墓碑tick的时候，要把英雄过的spine动画给删掉，因为不能在spine的回调里面删除自己
    if self.bFirstTick then
        self.map:removeObject(self.object)
    end

    -- 英雄死亡了，处理复活CD
    self.reviveTime = self.reviveTime - dt
    self.timeLabel:setString(math.ceil(self.reviveTime))

    -- print("英雄死亡了，处理复活CD")
    if self.reviveTime <= 0 then
        -- print("英雄活了 self.x = "..tostring(self.x).." y = "..tostring(self.y))
        -- 重新生成一个英雄
        local state = {
            defineId = self.mainID,
            owenId   = "Hero"..self.mainID,      -- 用来调试的时候方便查看
            behaviors = "HeroBehavior",
            x = self.x,
            y = self.y,
            patrolX = self.patrolX,  -- self.x
            patrolY = self.patrolY,  -- self.y
        }
        -- dump(state, "dump hero state")

        -- 处理英雄死亡的时候，开始做任务，在做任务的过程中英雄复活了
        if self._disappeerX then
            -- print("在做任务的过程中英雄复活了 self._disappeerX = "
            --     ..tostring(self._disappeerX))
            --  add by Owen, 2016.4.22, 英雄的驻扎点也要改为在屏幕外的位置
            state.patrolX = self.x
            state.patrolY = self.y
        end

        -- 新建一个英雄
        local hero = self.map:newHero(state, self.mapRuntime, true)

        -- 记录英雄的死亡次数
        hero.heroDeadCount_ = self.heroDeadCount_

        -- 下面两行必须要，不然的话英雄复活以后，不可以移动
        hero:startPlay()
        hero.updated__ = true

        -- dump(hero,"yaoxiaoyang dump hero fuhuo")
        -- 给英雄附加一些初始变量
        -- hero.mapRuntime_:moveMasterTo(hero.mapRuntime_.heroX,hero.mapRuntime_.heroY)
        hero.map_ = self.map
        hero.level_ = self.level
        hero.exp_    = self.exp
        hero:heroDataInit()

        -- add by Owen, 2016.7.21, 英雄复活，处理完英雄的等级数据以后，
        -- 要重新初始化技能、羁绊等，否则英雄升级以后，就没有羁绊的效果了
        SkillFactory.initSkillAndBuff(hero, self.mapRuntime)

        -- 处理英雄死亡的时候，开始做任务，在做任务的过程中英雄复活了
        if self._disappeerX then
            hero._disappeerX = self._disappeerX
            hero._disappeerY = self._disappeerY
        end

        -- add by Owen, 2016.4.23, 英雄复活的时候，需要播放音效
        AudioMgr.playSound("Revive")

        -- 英雄复活，要播放复活动画
        hero.curState = ObjectState.RELIVE
        hero:playAni("Relive", false, false, nil, function ( ... )
            -- print("英雄复活，播放 Relive 动画 结束")
            hero:setState(ObjectState.IDLE)
            hero:playAni("Idle", true)
        end, nil)

        -- 播放复活特效
        local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Relive", nil, nil, hero)
        hero.sprite_:addChild(effect)
        effect:setPosition(offsetX, offsetY)

        -- 记录复活技能的CD
        if hero.hpTriggerSkill then
            for i,v in ipairs(hero.hpTriggerSkill) do
                -- 如果是血量为0时触发的技能，也就是英雄死亡是触发的技能
                if v[1] == 0 and string.sub(v[2], 1, 5) == "13020" then
                    -- 重置技能的CD
                    v[3] = self.reviveSkillCD
                    if v[3] <= 0 then
                        v[3] = 0
                    end
                    -- print("记录重生技能的CD， CD = "..tostring(v[3]))
                end
            end
        end

        self.timeLabel:removeSelf()
        self.sprite:removeSelf()
        self.isOver_ = true
    end
end

-- 英雄去做任务之后，墓碑的位置也要修改
function Tomb:changePosition(x, y)
    self.sprite:setPosition(x + 10, y + 70)
    if self.timeLabel then
        self.timeLabel:setPosition(x + 10, y + 70)
    end
end

function Tomb:isOver()
    return self.isOver_
end

-- function Tomb:createView(gameLayer, marksLayer, debugLayer)
-- 	ObjectBase.createView(self, gameLayer, marksLayer, debugLayer)
--     self.view = display.newSprite()
--     gameLayer:addChild(self.view)

--     -- 墓碑
--     LayoutParser.createSprite({parent=self.view, src="Battle.tomb", anchor="0.5,0"})

--     -- 倒计时时间
--     local bg = LayoutParser.createSprite({parent=self.view, src="Battle.revive_cd_bg", y=120})

--     -- 倒计时文本框
--     self.cdField = LayoutParser.createLabel2({parent=self.view, x=0, y=122, anchor="0.5,0.5", 
--         text=tostring(self.hero.cdCurrent), size=16, color="#FFFFFF", font=config.defaultFont})
-- end

-- 在rt:restart() 重新开始这一关的时候会调用刚进来，要把墓碑图片给隐藏掉
function Tomb:removeView()
    self.timeLabel:removeSelf()
    self.sprite:removeSelf()
	-- self.view:removeFromParent()
	-- self.view = nil
 --    ObjectBase.removeView(self)
end

-- function Tomb:updateView()
--     self.view:setPosition(self.x_, self.y_)
-- end

return Tomb