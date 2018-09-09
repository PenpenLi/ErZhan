local MapEvent          = require("app.map.MapEvent")
local MapEventHandler   = require("app.map.MapEventHandler")
local RangeObject       = require("app.map.RangeObject")
local EventNames        = require("tools.EventNames")
local NotifyCenter      = require("tools.NotifyCenter")
local ObjectState       = require("app.map.ObjectState")
local MapConstants      = require("app.map.MapConstants")
local SkillBase         = require("app.map.skills.SkillBase")
local SkillFactory      = require("app.map.skills.SkillFactory")
local GlobalData        = require("tools.GlobalData")
local BattleDataManager = require("app.map.data.BattleDataManager")
local EffectAniCache    = require("app.map.spine.EffectAniCache")
local BuffProperties         = require("app.properties.BuffProperties")
local BuffBase               = require("app.map.skills.BuffBase")
local StableGameProperties   = require("app.properties.StableGameProperties")
local CsbAni                 = require("app.map.spine.CsbAni")

require "socket"      -- 把这个require进来，是为了获得毫秒时间

local NormalMapEventHandler = class("NormalMapEventHandler", MapEventHandler)

-- 正常的关卡，地图事件处理器
-- 还有一个Rush是无尽模式时的地图事件处理器

function NormalMapEventHandler:preparePlay()
    -- print("NormalMapEventHandler:preparePlay()")
    -- print("开始运行时lua占用的内存： "..collectgarbage("count"))
    NormalMapEventHandler.super.preparePlay(self)

    self.nextRoundDelayTime_ = nil       -- 多长时间后刷下一波怪

    -- 记录上一波刷了多少怪物出来，防止上一波怪物没有刷完，就开始刷下一波了
    self.enemyCount_              = 0    

    -- 这个monsterData怪物数据，实际上就是读取了Map1000002-1Monster.lua里面的配置文件
    self.monsterData = BattleDataManager:getMonsterData()
    -- dump(self.monsterData, " hahaha dump self.monsterData")
    -- 获得所有的路径id
    self.pathcount = #self.map_:getPathIds()
    
    self.roundStarted = nil --用来标记第一波怪是否已经开始
    local firstRound = 1 -- BattleDataManager:getCurRound()-- 默认等于1
    --出现刷怪按钮，用第一波数据
    firstRoundStr= string.format("round:%s", firstRound) -- BattleDataManager:getCurRound())
    -- print("yaoxiaoyang preparePlay show UI_SHOW_ROUND_START_BTN"..tostring(firstRoundStr))
    local firstRoundData = BattleDataManager:getRoundMonsterData(firstRoundStr)
    firstRoundData.isFirstRound = true
    BattleDataManager:setCurRound(0)-- 往前设置一轮，因为点击刷怪按钮时会刷下一波
    NotifyCenter.notify(EventNames.UI_SHOW_ROUND_START_BTN,firstRoundData)
    -- 这个只用来刷第一波，第一波怪一定要手动的点击出怪
    --self:startRound(BattleDataManager:getCurRound())

    self.bBtnHasShow = false

    self.hahaha = true

end

-- 开始这个回合,下一波的刷怪时间是根据上一波刷怪的时间加上一个配置的delay时间
function NormalMapEventHandler:startRound(round)
    print("第"..tostring(round).."波开始了，上一波总共刷了"..tostring(self.enemyCount_).."个怪物")
    
    self.enemyCount_ = 0

    self.roundStarted = true
    -- 标记已经开始刷怪了
    BattleDataManager:setRoundStarted(round)
    if round <= BattleDataManager:getTotalRound() then

        -- add by Owen, 2016.4.24, 新手引导, 如果第一关的模式1没有通关，第四波的时候手动技能解锁
        if GlobalData.getGameLv() == 1 then
            local lvStar = GlobalData.getLvStar(1)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                if round == 1 then
                    -- 标记第一关第1波开始了
                    self.map_.uiLayer:guideWhenRoundStart(1)
                elseif round == 3 then
                    -- 标记第四波开始了
                    self.map_.uiLayer:guideWhenRoundStart(3)
                end
            end
        end
        

        -- 第一波开始的时候把游戏运行的时间置为0
        if round == 1 then
            self.runtime_._gameStartTime = self.runtime_.time_

            -- 播放音乐
            local gameLv = GlobalData.getGameLv()
            local lv = math.ceil(gameLv/3)
            -- print("当前进入的是第几个场景 "..tostring(lv))
            -- 播放音乐
            if GlobalData.getMusicOn() then
                AudioEngine.playMusic("music/map"..lv..".mp3", true)
                local percent = GlobalData.getMusicVolume()
                AudioEngine.setMusicVolume(percent/100)
            end
            GlobalData.setMusicName("music/map"..lv..".mp3")
        end

        -- add by Owen, 2016.5.15, 第15关，模式3，每一波开始的时候，需要爆掉一个塔
        -- 爆炸随机规则：
        -- 1级塔爆炸权重=2（参数）
        -- 2级塔爆炸权重=3（参数）
        -- 3级塔爆炸权重=4（参数）
        -- 4级塔爆炸权重=1（参数）
        if GlobalData.getGameLv() == 15 and GlobalData.getGameMode() == 3 and round ~= 1 then
            self:dealDestroyTower()
        end

        -- add by Owen, 根据配置，把一条路置为可行走的区域
        local needAddRoad = BattleDataManager:getAddRoad()
        if needAddRoad then
            -- print("根据配置，把一条路置为可行走的区域")
            for i, v in ipairs(needAddRoad) do
                if v[2] == round then
                    -- 播放开路的音效
                    AudioMgr.playSound("UpRoad")

                    -- change by Owen, 2016.6.22, 播放浮桥动画
                    local fuQiaoAni = CsbAni.new("fuQiao", "daye/fuqiao.csb")
                    fuQiaoAni:playAni("Born")
                    self.runtime_:addRoad(fuQiaoAni)
                    self.map_.batch_:addChild(fuQiaoAni)
                    fuQiaoAni:setPosition(970, 630)
                    
                    -- -- add by Owen, 2016.5.13, 播放第11关的开路动画
                    -- local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("upLoad",
                    --     nil, nil, nil, true)

                    -- -- mapRuntime 中记录一下这个开路动画，在重新开始的时候，要把这个动画移除
                    -- self.runtime_:addRoad(effect)
                    -- self.map_.batch_:addChild(effect)
                    -- effect:setPosition(970, 630)

                    local road = self.map_:getObject(v[1])
                    road._isWalkable = true
                    -- A* 寻路, 增加C++里面可以行走的区域
                    self.map_:addAstarLoad(road)
                end
            end
        end

        -- 这一波的配置数据
        local round_str = string.format("round:%s", BattleDataManager:getCurRound())
        self.currentRoundData =  BattleDataManager:getRoundMonsterData(round_str)

        -- 如果有下一波
        local nextRoundStr = string.format("round:%s",BattleDataManager:getCurRound() + 1)
        -- print("nextRoundStr = "..tostring(nextRoundStr))
        local nextRoundData = BattleDataManager:getRoundMonsterData(nextRoundStr)
        if nextRoundData then
            -- 过了这么多时间以后，再开始刷下一波怪
            -- self.nextRoundDelayTime_ = nextRoundData["delayTime"] 
            self.nextRoundDelayTime_ = self.currentRoundData["delayTime"]
            self.nextRoundData       = nextRoundData
        else
            self.nextRoundDelayTime_ = nil
        end


        self.roundStartTime = self.runtime_.time_*1000-- 记录这波怪物开始的刷怪时间,统一使用runtime的时间做标准

        --self.roundStartTime = self.runtime_.time_*1000 -- 记录这波怪物开始的刷怪时间
        -- 当前的毫秒时间,距离1970.x.x过去的毫秒数

        -- 这一波总共有几个小怪
        local totalMonsterCountInThisRound = 0
        for key,value in pairs(self.currentRoundData) do
            -- 如果key中包含sub_round字符，就表示这是一个小队数据
            if string.find(key, "sub_round") then
                -- dump(value, "hahah dump value")
                if value.num > 0 then 
                    totalMonsterCountInThisRound = totalMonsterCountInThisRound + value.num
                end
            end
        end
        self.map_:addTotalMonsterCountInThisMap(totalMonsterCountInThisRound)

        -- add by Owen, 2015.8.10, 每一波开始的时候给英雄加血, 加的数值是配的
        if round ~= 1 then
            for i,v in ipairs(self.map_:getHero()) do
                if not v.isDead_ and v.hp_ < v.originalPro_.maxHp then
                    v:increaseHp(v.restoreHp_)
                    -- 添加回血的特效
                    local effect, offsetY, offsetX = EffectAniCache.getEffectAniCache("Treat",
                        nil, nil, v)
                    v.sprite_:addChild(effect)
                    effect:setPosition(offsetX, offsetY)
                end
            end
        end

        -- 这一队小怪的刷怪间隔,可能同时刷几个小队，所有以一个表来记录，key为 sub_round:%s
        self.intervalTime = {}
        self.runtime_:setRoundMonsterFinished(false) -- 当前这一波的怪物还没有刷完

        -- 可以显示提前刷怪按钮
        self.bBtnHasShow = false

        -- add by Owen, 2016.3.18, 开始一波的时候调用map的函数，用来处理
        self.map_:startRound(round)

        -- add by Owen, 2016.6.8, 开始一波的时候调用rt的函数，用来做第14关的模式3
        self.runtime_:startRound(round)

        -- add by Owen, 2016.7.14, 开始一波的时候调用BattleUI的函数，用来处理
        self.map_.uiLayer:startRound(round)
    end

end

-- add by Owen, 2016.5.15, 第15关，模式3，每一波开始的时候，需要爆掉一个塔
-- 爆炸随机规则：
-- 1级塔爆炸权重=2（参数）
-- 2级塔爆炸权重=3（参数）
-- 3级塔爆炸权重=4（参数）
-- 4级塔爆炸权重=1（参数）
function NormalMapEventHandler:dealDestroyTower()
    -- print("NormalMapEventHandler:dealDestroyTower()")
    -- 用来记录不同的等级的塔的数量，等级1的个数，2,3,4,等级5的个数
    local lvTowerCount = {0, 0, 0, 0, 0}

    for i, v in pairs(self.runtime_.towers_) do
        local towerLocation = v[4]
        local tower = towerLocation.tower
        lvTowerCount[tower.level_] = lvTowerCount[tower.level_] + 1
    end

    local towerCount   = 0    -- 记录总共有几种不同等级的塔
    local randomPower = {}
    for i, v in ipairs(lvTowerCount) do
        if i < 4 and v ~= 0 then
            towerCount = towerCount + 1
        end
    end
    if lvTowerCount[4] ~= 0 or lvTowerCount[5] ~= 0 then
        towerCount = towerCount + 1
    end

    local level = 0    -- 哪个等级的塔会被爆掉

    -- 不同等级的塔，被爆掉的概率
    local levelRandom = {200, 300, 400, 100}
    
    if towerCount == 1 then
        -- 地图里面所有的塔的等级都是一样的
        -- print("地图里面所有的塔的等级都是一样的")
        for i, v in ipairs(lvTowerCount) do
            if i < 4 and v ~= 0 then
                level = i
            end
        end
        if level == 0 then
            level = 4
        end
    elseif towerCount == 2 then
        -- 地图上的的塔有两种等级
        -- print("地图上的的塔有两种等级")
        local levels = {}
        for i, v in ipairs(lvTowerCount) do
            if i < 4 and v ~= 0 then
                levels[#levels + 1] = i
            end
        end
        if #levels < 2 then
            levels[#levels + 1] = 4
        end
        -- 第一个塔爆掉的概率
        local randomOne = levelRandom[levels[1]]
        -- 第二个塔爆掉的概率
        local randomTwo = levelRandom[levels[2]]
        local index = math.random(randomOne + randomTwo)
        if index <= randomOne then
            level = levels[1]
        else
            level = levels[2]
        end
    elseif towerCount == 3 then
        -- 地图上的的塔有三种等级
        -- print("地图上的的塔有三种等级")
        local levels = {}
        for i, v in ipairs(lvTowerCount) do
            if i < 4 and v ~= 0 then
                levels[#levels + 1] = i
            end
        end
        if #levels < 3 then
            levels[#levels + 1] = 4
        end
        -- 第一个塔爆掉的概率
        local randomOne = levelRandom[levels[1]]
        -- 第二个塔爆掉的概率
        local randomTwo = levelRandom[levels[2]]
        -- 第三个塔爆掉的概率
        local randomThree = levelRandom[levels[3]]
        local index = math.random(randomOne + randomTwo)
        if index <= randomOne then
            level = levels[1]
        elseif index <= randomTwo then
            level = levels[2]
        else
            level = levels[3]
        end
    elseif towerCount == 4 then
        -- 地图上的的塔有四种等级
        -- print("地图上的的塔有四种等级")
        local index = math.random(1000)
        if index < 200 then
            level = 1
        elseif index < 500 then
            level = 2
        elseif index < 900 then
            level = 3
        elseif index <= 1000 then
            level = 4
        end
    end

    
    

    -- 如果要爆的这个等级的塔没有，则从最高级的塔往下选一个
    if lvTowerCount[level] == 0 then
        -- print("random 出来要爆掉的这个等级的塔 没有")
    end

    -- print("爆塔 level = "..tostring(level))
    for i, v in pairs(self.runtime_.towers_) do
        local towerLocation = v[4]
        local tower = towerLocation.tower
        if level < 4 then
            if tower.level_ == level then
                -- print("爆掉了一个塔，tower.level_ = "..tostring(tower.level_))
                -- 删除塔
                towerLocation:removeTower(self.runtime_)
                towerLocation:addLock()
                -- 删除记录的当前地图中这个塔的数量
                local towerId = tower.towerId_
                BattleDataManager:removeTowerNum(towerId)

                -- 增加金币
                BattleDataManager:addGold(tower.sellGold_)
                break
            end
        else
            -- 4/5级塔都要删除
            if tower.level_ == 4 or tower.level_ == 5 then
                -- print("爆掉了一个塔，2 tower.level_ = "..tostring(tower.level_))
                -- 删除塔
                towerLocation:removeTower(self.runtime_)
                towerLocation:addLock()
                -- 删除记录的当前地图中这个塔的数量
                local towerId = tower.towerId_
                BattleDataManager:removeTowerNum(towerId)

                -- 增加金币
                BattleDataManager:addGold(tower.sellGold_)
                break
            end
        end
    end
end

-- 通过点击开始按钮来开始下一波
function NormalMapEventHandler:startRoundByClickBtn()
    -- print("提前刷怪，NormalMapEventHandler:startRoundByClickBtn()")
    -- local passedTime = self.runtime_.time_*1000 - self.roundStartTime
    -- -- 提前了多少时间刷怪
    -- local prevTime = math.floor((passedTime - self.nextRoundDelayTime_)/1000)
    -- -- 增加金币，每提前一秒增加5金币
    -- print("提前了"..tostring(prevTime).."秒出怪, 奖励"..tostring(prevTime*5).."金币")
    -- BattleDataManager:addGold(prevTime*5)

    -- 开始这一回合
    round = BattleDataManager:getCurRound() + 1
    BattleDataManager:setCurRound(round)
    self:startRound(BattleDataManager:getCurRound())
end

-- 在地图中刷一个小怪出来
-- TO-DO 到时候需要改造成根据怪物的Id和Lv来创建对应的怪物
-- 第二个参数为这一小队的配置参数
function NormalMapEventHandler:addMonsterToMap(subRoundId, msterData)
    -- print("NormalMapEventHandler:addMonsterToMap")
    -- dump(msterData, "dump addMonsterToMap msterData")

    -- 执行一次这个函数耗时15ms

    local beginTime = socket.gettime()
    local oriBegin  = beginTime

    -- 如果这一小队还没刷过，或者大于了这一小队定义的刷怪时间
    if not self.intervalTime[subRoundId] or 
        ( self.runtime_.time_*1000 - self.intervalTime[subRoundId] >= msterData["intervalTime"] ) then
        local state = {
            -- npcId    = msterData["resourceId"],
            x = -100,
            y = -100,
            defineId = msterData["resourceId"],-- "1001001",
            owenId   = "Enemy",
            behaviors = "MonsterBehavior",
        }
        local enemy = self.runtime_:newObject("static", state)

        -- add by Owen, 2016.5.25, 先判定一下这个怪物之前是不是见过了，没见过的话，需要显示新怪提示
        -- add by Owen, 2016.6.14, 做一个怪物id前两位的判定，
        -- 如果是16开头的，则表示是同个形象的拷贝怪物，不需要做如下的判定
        if string.sub(enemy.mainID_, 1, 4) ~= "1006" then
            if not GlobalData.getOneMonsterHasBeSee(enemy.mainID_) then
                self.map_.uiLayer:seeOneNewEnemy(enemy.mainID_)
            end

            -- add by Owen, 2016.4.5, 记录在地图中刷了这个怪物，用来做图鉴
            GlobalData.seeOneMonster(enemy.mainID_)
        end

        self.enemyCount_ = self.enemyCount_ + 1    -- 记录这一波刷的怪物数量

        local endTime = socket.gettime()
        -- print("NormalMapEventHandler:addMonsterToMap 耗时 1 = "..(endTime - beginTime))
        beginTime = endTime

        -- add by Owen, 2015.11.3, 在技能初始化/也就是记录originalPro_之前，改变血量
        local hpScale = 1
        if GlobalData.getGameMode() == MapConstants.GAME_MODE_ONE then
            if GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_EASY then
                hpScale = self.monsterData.addMonsterHp[1]/100
            elseif GlobalData.getHardMode() == MapConstants.DIFFICULTY_MODE_HARD then
                hpScale = self.monsterData.addMonsterHp[2]/100
            end
            
            -- print("before enemy.maxHp_ = "..tostring(enemy.maxHp_))

            enemy.maxHp_ = enemy.maxHp_ * hpScale
            enemy.hp_    = enemy.hp_ * hpScale

            -- print("after enemy.maxHp_ = "..tostring(enemy.maxHp_))
        end

        local endTime = socket.gettime()
        -- print("NormalMapEventHandler:addMonsterToMap 耗时 2 = "..(endTime - beginTime))
        beginTime = endTime


        -- 处理技能的初始化
        enemy:initMonsterSkillAndBuff(enemy.mapRuntime_)

        
        local pathId = string.format("path:%d", msterData["pathId"])
        enemy.pathId  = pathId
        enemy:bindPath(self.map_:getObject(pathId), 1)
        enemy:startMoving()
        enemy:setState(ObjectState.MOVE)
        enemy:playAni("Move_Side", true)

        -- 刷怪的时候，曾加一个属性，怪物死亡后奖励的金币，是配在这个队列里面的
        enemy.deadGold_ = msterData.deadGold

        -- add by Owen, 2016.4.25, 堕落天使一开始的时候，要缩小80%，
        -- 上了强化Buff 210303 以后，再回复到100%大小
        if enemy.mainID_ == "100205" then
            enemy.sprite_:setScale(0.7)
        end

        -- add by Owen, 2016.5.13, 处理天气制造机，一开始刷出来的时候头上需要显示天气变换按钮
        if enemy.mainID_ == "100416" then
            -- UI需要显示一个倒计时的圈
            enemy.map_.uiLayer:showBossTimeLayer(enemy, 
                enemy.x_ + enemy.radiusOffsetX_,
                enemy.y_ + enemy.radiusOffsetY_ + enemy.radius_ + 50,
                10,
                5)
        end

        if GlobalData.getGameLv() == 8  and GlobalData.getGameMode() == 3 then
            self:dealWeather(enemy)
        end

        -- print("subRoundId = "..tostring(subRoundId).." deadGold = "..tostring(enemy.deadGold_))

        -- 数据是clone出来的，所以可以减1
        msterData.num = msterData.num - 1
        -- 记录一下这一小队中这个小怪刷出来的时间
        self.intervalTime[subRoundId] = self.runtime_.time_*1000
    end


    local endTime = socket.gettime()
    -- print("NormalMapEventHandler:addMonsterToMap 耗时 3 = "..(endTime - oriBegin))



end

-- add by Owen, 2016.5.17, 如果是第8关模式3，新刷出来的怪，要根据天气要给怪物加Buff
function NormalMapEventHandler:dealWeather(object)
    -- print("NormalMapEventHandler:dealWeather()")

    -- local weatherIndex = BattleDataManager:getWeather()
    -- print("BattleUI:updateWeather() weatherIndex = "..tostring(weatherIndex))
    -- local name = ""
    -- if weatherIndex == 0 then
    --     name = "sun"
    -- elseif weatherIndex == 1 then
    --     name = "night"
    -- elseif weatherIndex == 2 then
    --     name = "yu"
    -- elseif weatherIndex == 3 then
    --     name = "xue"
    -- elseif weatherIndex == 4 then
    --     name = "wind"
    -- end

    local weather = BattleDataManager:getWeather()
    -- print("weather = "..tostring(weather))

    -- 晴天-光之精灵 ID=100207, +30%伤害减免
    if object.mainID_ == "100207" and weather == 0 then
        local buff  = BuffProperties.get("220909")
        BuffBase.addTimeBuff(object, buff, object)
    end

    -- 雨天-水之精灵 ID=100208, 每秒恢复10%生命
    if object.mainID_ == "100208" and weather == 2 then
        local buff  = BuffProperties.get("220910")
        BuffBase.addTimeBuff(object, buff, object)
    end

    -- 夜晚-暗之精灵 ID=100209, 变成地下怪物
    if object.mainID_ == "100209" and weather == 1 then
        -- print("InfoPanel:changeWeather mainID_ = 100209")
        object.walkLayer_ = MapConstants.MONSTER_WALK_LAYER_UNDER
        object.sprite_:setOpacity(100)
    end

    -- 雪天-冰之精灵ID=100210, 变成地下怪物
    -- 雪天期间，冰之精灵自动释放，冷却3秒
    -- 使范围内的建筑塔被冻结无法攻击，持续3秒，玩家可以手动点击移除
    if object.mainID_ == "100210" and weather == 3 then
        -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
        SkillFactory.addAISkill(object, {{3, 3000, "130438"}})
    end


    -- 风天-风之精灵（ID=100211） 释放机制：风天期间，风之精灵自动释放，冷却3秒
    -- 使范围内的精灵移动速度+50%，持续3秒
    if object.mainID_ == "100211" and weather == 4 then
        -- 3表示CD触发的技能,CD时间到了就会释放130251,中间的CD参数无意义,中间的CD参数无意义
        SkillFactory.addAISkill(object, {{3, 3000, "130439"}})
    end

end

-- 为了准确的刷怪，每0.1秒会调用一次这个函数，在rt中调用
function NormalMapEventHandler:time(time, dt)
    -- 此处的time是由mapruntime统计的游戏进行时间，可以用作标准参照
    -- print("NormalMapEventHandler:time(time, dt)")
    NormalMapEventHandler.super.time(self, time, dt)

    -- 这个函数耗时15ms，虽然每隔0.1秒才会调用这个函数

    if BattleDataManager:getCurRound() > BattleDataManager:getTotalRound() then
        -- print("NormalMapEventHandler:time rturn")
        return
    end

    if self.roundStarted then  --如果已经开始刷怪，执行下列逻辑
        -- 现在距离这一波开始过了多长时间，单位是毫秒
        local passedTime = self.runtime_.time_*1000 - self.roundStartTime
        -- 距离下一波刷怪时间还有20秒时，显示刷怪倒计时按钮
        if self.nextRoundDelayTime_ and passedTime > self.nextRoundDelayTime_ - 20000 then
            if self.bBtnHasShow == false then
                NotifyCenter.notify(EventNames.UI_SHOW_ROUND_START_BTN, self.nextRoundData)
                self.bBtnHasShow = true
            end
            -- return
        end

        -- add by Owen, 2016.6.14, 新手引导, 如果第4关的模式1没有通关，
        -- 第5波开始前5秒钟，引导释放钻石技能
        if GlobalData.getGameLv() == 4 and GlobalData.getGameMode() == 1 then

            local lvStar = GlobalData.getLvStar(4)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                if BattleDataManager:getCurRound() == 1 then
                    -- 当前是第1波，距离第2波开始刷怪还有25秒钟, 显示祭坛塔召唤引导动画
                    if self.nextRoundDelayTime_ 
                        and passedTime > self.nextRoundDelayTime_ - StableGameProperties.RMB_GUIDE_BEFORE_TIME then
                        self.map_.uiLayer:onShowSummonGuideTips()
                    end
                elseif BattleDataManager:getCurRound() == 4 then
                    -- 当前是第4波，距离第5波开始刷怪还有25秒钟
                    if self.nextRoundDelayTime_ 
                        and passedTime > self.nextRoundDelayTime_ - StableGameProperties.RMB_GUIDE_BEFORE_TIME then
                        if not GlobalData.getItemSkillHasGuide(3) then
                            self.map_.uiLayer:guideItemSkill(3)
                        end
                    end
                end
            end
        end

        -- add by Owen, 2016.7.16, 新手引导, 如果第2关的模式1没有通关，
        -- 如果有怪物进入左上角，引导释放 怪物回退技能
        if GlobalData.getGameLv() == 2 and GlobalData.getGameMode() == 1 then
            -- and BattleDataManager:getCurRound() == 4 then

            local lvStar = GlobalData.getLvStar(2)
            if lvStar[1][1] == 0 and lvStar[1][2] == 0 then
                -- 取得当前所有怪物, 判定距离是不是到了 x < 665, y > 351
                if not GlobalData.getItemSkillHasGuide(1) then
                    for k, monster in pairs(self.map_.simpleMonsters) do 
                        if monster.x_ < 924 and monster.y_ > 370 then
                            self.map_.uiLayer:guideItemSkill(1)
                        end
                    end
                end
            end
        end


        -- 时间到了以后，就开始刷下一波
        if self.nextRoundDelayTime_ and passedTime > self.nextRoundDelayTime_ then
            if self.bBtnHasShow == true then
                -- 隐藏提前刷怪按钮
                NotifyCenter.notify(EventNames.UI_HIDE_ROUND_START_BTN)
            end

            BattleDataManager:setCurRound(BattleDataManager:getCurRound() + 1)
            self:startRound(BattleDataManager:getCurRound())
            return
        end

        -- 如果这一波的小怪都刷出来了，那这一波就不需要再刷了
        if self.runtime_.roundAllMonsterAppeared then
            return
        end

        local isRoundFinished = true


        local beginTime = socket.gettime()

        -- 遍历这一波中的所有小队，只要符合时间条件，还没有刷完的小队都需要刷一下
        local forCount = 0
        for key,value in pairs(self.currentRoundData) do
            -- 如果key中包含sub_round字符，就表示这是一个小队数据
            -- local endTime1 = socket.gettime()
            
            forCount = forCount + 1

            if string.find(key, "sub_round") then
                -- local endTime2 = socket.gettime()
                -- 多了下面这行log，300次调用整个for循环的时候，会有30次会耗时15毫秒
                -- print("NormalMapEventHandler:time string.find 耗时 = ")..(endTime2 - endTime1))

                -- dump(value, "hahah dump value")
                -- 如果到了刷这个小队的时间，并且还没刷完,每一次只会刷这个小队中的一个小怪出来
                -- print("time passedTime = "..tostring(passedTime))
                if value.num > 0 then 
                    isRoundFinished = false

                    if passedTime >= value["delayTime"] then
                        self:addMonsterToMap(key,value)
                    end
                end
            end
        end

        local endTime = socket.gettime()
        -- print("NormalMapEventHandler:time addMonsterToMap 耗时 = "..(endTime - beginTime).." forCount = "..forCount)

        -- 这一波的怪物已经全部刷完了
        if isRoundFinished then
            self.currentRoundFinished_ = true
            self.runtime_:setRoundMonsterFinished(true) -- 当前这一波的怪物还没有刷完
        end

    end
end

function NormalMapEventHandler:objectEnterRange(object, range)
    NormalMapEventHandler.super.objectEnterRange(self, object, range)

    -- if object.defineId_ == "EnemyShip01" and range:getId() == "range:21" then
    --     self.runtime_:removeObject(object)
    -- end
    -- print("range:getRangeType() = "..tostring(range:getRangeType()))
    
    -- type 2 表示是终点  -- RangeObject.TYPE_CASTLE then
    -- if object.defineId_ == "EnemyShip01" and range:getRangeType() == 2 then 
    if object:hasBehavior("MonsterBehavior") then
        if range:getRangeType() == MapConstants.END_RANGE then 

            -- add by Owen, 2016.4.23, 怪物进入了终点，扣血的时候，需要播放音效
            AudioMgr.playSound("Hemorrhage")

            local passValue = object.passValue_  -- 漏掉不同的怪物，扣的血量是不一样的
            BattleDataManager:setHp(BattleDataManager:getHp() - passValue)
            -- rt判定游戏是否结束, 只判定血量是否小于0
            self.runtime_:checkHp()

            -- 先执行rt:checkHp在执行rt:removeObject，否则只剩最后一个Boss的时候，Boss漏了显示胜利
            object:setHp(0)   -- 把怪物的血量置为0，在BulletBase:fireBegan()中就不会生成这个子弹了
            self.runtime_:removeObject(object, 0, true)
        elseif range:getRangeType() == MapConstants.JUMP_RANGE then
            -- 跳跃区域,怪物直接跳到下一个路径点
            -- 给物体一个变量，然后在MovableBehavior:setNextPosition()中做处理
            -- 在MovableBehavior:tick中，会根据jumpDelayTime来把object的isHide置为true
            object.needJump = true
            object.jumpDelayTime = range.delayTime_/1000
        elseif range:getRangeType() == MapConstants.HIDE_RANGE then
            -- 不让英雄远程射击我
            -- print("objectEnterRange object.id_ = "..tostring(object.id_))
            object.isHide = true
            object:changeOpacity(60)
            -- 不让英雄配对我
            BattleDataManager:clearHeroTargetThroughMonster(object) 
            -- 英雄不能近战攻击我
            BattleDataManager:clearHeroNearAttTargetThroughMonster(object)
            -- 从塔的攻击列表中清除, 放到FireBehavior:tick()函数中处理
            -- BattleDataManager:clearHeroTargetThroughMonster(object)
        elseif range:getRangeType() == MapConstants.ENTER_RANGE then
            -- 暗道入口
            object.isHide = true
            object:changeOpacity(60)
            -- 不让英雄配对我
            BattleDataManager:clearHeroTargetThroughMonster(object) 
            -- 英雄不能近战攻击我
            BattleDataManager:clearHeroNearAttTargetThroughMonster(object)
            -- 从塔的攻击列表中清除, 放到FireBehavior:tick()函数中处理
            -- BattleDataManager:clearHeroTargetThroughMonster(object)
        elseif range:getRangeType() == MapConstants.OUT_RANGE then
            -- 暗道出口
            -- print("objectEnterRange object.id_ = "..tostring(object.id_))
            object.isHide = false
            object:changeOpacity(255)
            -- -- 不让英雄配对我
            -- BattleDataManager:clearHeroTargetThroughMonster(object) 
            -- -- 从塔的攻击列表中清除, 放到FireBehavior:tick()函数中处理
            -- -- BattleDataManager:clearHeroTargetThroughMonster(object)
        end

    end
    
    -- 怪物进入减速速区域
    if object.defineId_ == "Monster1001" and range:getRangeType() == MapConstants.SLOW_DOWN_RANGE and self.hahaha then 
        object:setSpeed(100)
        self.hahaha = false
    end

    
end

function NormalMapEventHandler:objectExitRange(object, range)
    NormalMapEventHandler.super.objectExitRange(self, object, range)

    -- if object.defineId_ == "EnemyShip01" and range:getId() == "range:21" then
    --     self.runtime_:removeObject(object)
    -- end
    if object.defineId_ == "EnemyShip01" and range:getRangeType() == 4 then -- RangeObject.TYPE_CASTLE then
        object:setSpeed(370)
    end

    if object:hasBehavior("MonsterBehavior") then
        -- print("objectExitRange object.id_ = "..tostring(object.id_))
        if range:getRangeType() == MapConstants.HIDE_RANGE then
            -- 从遮挡区域出来后，判定一下自己是不是还在其他遮挡区域中，不是的话再取消隐藏
            local bStillInHideRange = false
            for range1, objects in pairs(self.objectsInRange_) do
                if range1:getRangeType() == MapConstants.HIDE_RANGE then
                    for object1, times in pairs(objects) do
                        -- 如果这个物体还在遮挡区域中
                        if object1.id_ == object.id_ then
                            bStillInHideRange = true
                        end
                    end
                end
            end
            if bStillInHideRange == false then
                object.isHide = false
                object:changeOpacity(255)
            end
        end

    end
    
end

return NormalMapEventHandler
