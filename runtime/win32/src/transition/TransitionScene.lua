
local SpineCache     = require("app.map.spine.SpineCache")
local FrameAniCache  = require("app.map.spine.FrameAniCache")
local FrameAni       = require("app.map.spine.FrameAni")
local EffectAniCache = require("app.map.spine.EffectAniCache")
local GlobalData     = require("tools.GlobalData")
local LoadingTips    = require("app.properties.LoadingTips")
local StaticObjectsProperties = require("app.properties.StaticObjectsProperties")

--[[--

从大厅进入游戏的切换场景

函数调用顺序：程序先到第二个场景的ctor中，然后再回到第一个场景的Onexit中，
    最后才到第二个场景的onEnter中

]]
local TransitionScene = class("TransitionScene", function()
    return display.newScene("TransitionScene")
end)

function TransitionScene:ctor(params)
    print("TransitionScene:ctor")

    self.params = params
    self.mapId  = self.params.mapId
    self.modeId = self.params.modeId
    dump(params, "dump TransitionScene:ctor params")

    self:setScale(GLOBAL_HALL_UI_SCALE2)

    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565)
    self.imageName = "loadingAni/bg.jpg"
    self.bgSprite = display.newSprite(self.imageName)
    cc.Texture2D:setDefaultAlphaPixelFormat(cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

    -- self.bgSprite:align(display.LEFT_BOTTOM, 0, 0)
    self:addChild(self.bgSprite)
    self.bgSprite:setPosition(display.cx, display.cy)


    -- local path = cc.FileUtils:getInstance():fullPathForFilename("monster/100106.csb") -- "ui/hall/MainScene.csb")
    -- print("path = "..tostring(path))
    -- local ani = cc.CSLoader:createNode("monster/100106.csb") --path)  
    -- ani:setPosition(display.cx, display.cy + 30)
    -- self:addChild(ani)


    -- local action = cc.CSLoader:createTimeline("monster/100106.csb")
    -- ani:runAction(action)
    -- -- action:gotoFrameAndPlay(0,60,true)  -- 通过帧数来播放
    -- action:play("Move_Side", true)  -- 通过名字播放


    local index = math.random(1000)
    -- 播放第几个loading动画
    local loadingIndex = 1
    if index >= 0 and index < 333 then
        loadingIndex = 1
    elseif index >= 333 and index < 666  then
        loadingIndex = 2
    elseif index >= 666 and index < 1000  then
        loadingIndex = 3
    end
    print("index = "..tostring(index).." loadingIndex = "..tostring(loadingIndex))

    -- 播放的箭塔动画
    local loadingAni
    if loadingIndex == 1 then
        loadingAni = cc.CSLoader:createNode("tower/160104.csb") --path)  
        local action = cc.CSLoader:createTimeline("tower/160104.csb")
        loadingAni:runAction(action)
        action:play("Idle_01", true)  -- 通过名字播放

        -- loadingAni = sp.SkeletonAnimation:create("loadingAni/160104_loading.json", "loadingAni/160104_loading.atlas", 1.0)
        -- loadingAni:setAnimation(0, "Idle", true)
    elseif loadingIndex == 2 then
        loadingAni = cc.CSLoader:createNode("tower/160305.csb") --path)  
        local action = cc.CSLoader:createTimeline("tower/160305.csb")
        loadingAni:runAction(action)
        action:play("Idle_01", true)  -- 通过名字播放

        -- loadingAni = sp.SkeletonAnimation:create("loadingAni/160305_loading.json", "loadingAni/160305_loading.atlas", 1.0)
        -- loadingAni:setAnimation(0, "Idle", true)
    elseif loadingIndex == 3 then
        loadingAni = cc.CSLoader:createNode("tower/160203.csb") --path)  
        local action = cc.CSLoader:createTimeline("tower/160203.csb")
        loadingAni:runAction(action)
        action:play("Idle_01", true)  -- 通过名字播放

        -- loadingAni = sp.SkeletonAnimation:create("loadingAni/160203_loading.json", "loadingAni/160203_loading.atlas", 1.0)
        -- loadingAni:setAnimation(0, "Idle_01", true)
    end

    loadingAni:setPosition(display.cx, display.cy + 35)
    loadingAni:setScale(1.2)
    self:addChild(loadingAni)


    -- 提示文字
    local tips = LoadingTips.getAll()
    if GlobalData.getLanguage() == "CN" then
        tips = tips["CN"]
    else
        tips = tips["EN"]
    end
    -- dump(tips, "dump loading tips")
    local index = math.random(#tips)

    local loadingTips = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
        -- UILabelType = 2,
        text = tips[index],
        -- color = cc.c3b(255,214,0),
        font = GLOBAL_FONTNAME,
        size = 22,
    })
    :addTo(self)
    :pos(display.cx, display.cy - 20)
    loadingTips:enableOutline(cc.c4b(0, 0, 0, 255), 1)


    -- 进度条
    local progressOut = display.newSprite("loadingAni/progressOut.png")
        :addTo(self)
        :pos(display.cx, display.cy - 70)

    self.progress = display.newProgressTimer("loadingAni/progress.png",
        display.PROGRESS_TIMER_BAR)
        :pos(833/2, 39/2)
        :addTo(progressOut)
    -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
    self.progress:setBarChangeRate(cc.p(1, 0))
    -- 设置进度条的起始位置, ccp(0,0)表示下面
    self.progress:setMidpoint(cc.p(0, 0))

    -- 加载中的文字
    local loadTexImg  = display.newSprite("loadingAni/loading_CN.png")
        :addTo(progressOut)
        :pos(833/2, 39/2)


    -- local text = cc.ui.UILabel.new({
    --     UILabelType = 2,
    --     text = "Loading...",
    --     font = GLOBAL_FONTNAME,
    --     align = cc.ui.TEXT_ALIGN_CENTER,
    --     size = 30,
    --     x = display.cx - 50,
    --     y = display.cy - 30,
    --     })
    --     :addTo(self)

    -- 每一帧都调用 tick 函数，用来做资源加载，防止小狗动画卡帧
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt) self:tick(dt) end)
    self:scheduleUpdate()

    -- 记录 tick 了几次
    self.tickCount = 0

    -- add by Owen, 2016.7.16, 第一次进入第一关的时候，为了提高加载速度
    -- 只加载第一关必须的资源
    self.gameLv = GlobalData.getGameLv()
    if self.gameLv == 1 then
        local star = GlobalData.getLvStar(self.gameLv)
        -- 记录一下第一关，模式1，简单和困难 模式下，总共获得了几个星星
        self.star  = star[1][1] + star[1][2]
    end
end

-- 在onEnter中，做资源的预加载
function TransitionScene:onEnter()
    print("TransitionScene:onEnter")
    -- add by Owen, 2016.4.15, 切换场景以后，要替换鼠标图片
    -- viewMgr.show(viewMgr.def.MOUSE_UI)

    -- 记录 tick 了几次
    self.tickCount = 0

    if self.params.isEnterFight then
        -- 如果是从大厅进入到战斗场景中
        -- 提前加载特效帧动画, 特效只需要预加载一下就好了
        if not GlobalData.getHasAddEffectCashe() then
            -- GlobalData.setHasAddEffectCashe()
            self.effAniData   = require("app.properties.EffectProperties")
            -- self.ipairEff     = table.values(self.effAniData)

            -- 如果是第一次进入关卡的加载，只加载第一关需要用到的特效资源
            if self.gameLv == 1 and self.star == 0 then
                local levelOneEff = {}
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_summon_aperture"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_cdup"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["ui_tower_upgrade"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Add_gold"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Bleed"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Kroom_1"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Kroom"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_160201_stone_2"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Treat"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_110301_poison"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_110301_poisoning"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_110301_slow"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Miss_1"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Miss"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_160301_magicwave"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_160304_magicwave_2"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_170101_time"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_170201_glory"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_170201_glory_2"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_170301_thunder"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_sunny"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["eff_windy"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Lv_up"]
                levelOneEff[#levelOneEff + 1] = self.effAniData["Relive"]

                
                self.ipairEff = levelOneEff
            else
                self.ipairEff     = table.values(self.effAniData)
            end
        else
            self.ipairEff = {}
        end
    end

    -- 预加载音乐
    local gameLv = GlobalData.getGameLv()
    local lv = math.ceil(gameLv/3)
    AudioEngine.preloadMusic("music/beforeFight.mp3", true)
    AudioEngine.preloadMusic("music/map"..lv..".mp3", true)


    -- -- 提前加载角色的骨骼动画和角色的帧动画
    -- self:addAniData()

    -- -- 异步加载图片纹理
    -- self:addImageAsync()
    
end

-- 每帧都会执行
-- 加载英雄和Boss的spine
-- 加载 小怪和塔 的plist
-- 加载   特效   的plist
function TransitionScene:tick(dt)
    if self.params.isEnterFight then

        -- 如果是从大厅进入到战斗场景中

        if self.tickCount == 0 then
            -- 提前加载角色的骨骼动画, 
            -- 计算有多少 角色 csb动画的 plist 文件需要预加载
            -- 计算有多少  塔  csb动画的 plist 文件需要预加载
            self.needAddSpine = {}    -- 记录需要加载的spinde动画文件名,["110301", "hero/110301"]
            self.needAddPlist = {}    -- 记录需要加载的plist文件名
            self.allSound     = {}    -- 记录需要预加载的音效
            -- 计算有多少音效需要预加载
            self:addPreloadSound()

            -- 计算有多少角色csb动画的 plist 文件需要预加载
            self:addAniData()

            self.progress:setPercentage(5)
            self.allCount = #self.needAddSpine + #self.needAddPlist + 1 + #self.ipairEff + #self.allSound

        else

            if self.tickCount <= #self.needAddSpine then
                -- add by Owen, 2016.5.13, 5种天气元素要特殊处理, 共用一个json文件
                local mainID = self.needAddSpine[self.tickCount][1]
                local spineData
                if tonumber(mainID) >= 100207 and tonumber(mainID) <= 100211 then
                    spineData = sp.SkeletonAnimation:create(
                        "monster/100.json",
                        self.needAddSpine[self.tickCount][2]..".atlas", 1.0)
                else
                    spineData = sp.SkeletonAnimation:create(
                        self.needAddSpine[self.tickCount][2]..".json",
                        self.needAddSpine[self.tickCount][2]..".atlas", 1.0)
                end
                SpineCache.addSpineCache(self.needAddSpine[self.tickCount][1], spineData)
            elseif self.tickCount <= #self.needAddSpine + #self.needAddPlist then
                local index = self.tickCount - #self.needAddSpine
                -- 加载 小怪和塔 的Plist
                display.addSpriteFrames(self.needAddPlist[index]..".plist",
                    self.needAddPlist[index]..".png")
            elseif self.tickCount < #self.needAddSpine + #self.needAddPlist + 1 + #self.ipairEff then
                local index = self.tickCount - #self.needAddSpine - #self.needAddPlist
                -- 提前加载特效帧动画, 特效只需要预加载一下就好了
                if not GlobalData.getHasAddEffectCashe() then
                    local data       = self.ipairEff[index]
                    local path       = string.split(data.name, "/")
                    local effectName = path[#path]
                    EffectAniCache.addEffectAniCache(effectName, data)
                end
            elseif not GlobalData.getHasAddEffectCashe()
                and ( self.tickCount < (#self.needAddSpine + #self.needAddPlist + 1 + #self.ipairEff
                    + #self.allSound) ) then

                    local index = self.tickCount - #self.needAddSpine - #self.needAddPlist - #self.ipairEff
                    -- print("预加载音效 index = "..tostring(index)
                    --     .." self.allSound[index] = "..tostring(self.allSound[index]))
                    AudioMgr.preloadSound(self.allSound[index])
            elseif not self.bEnd then
                -- 表示特效已经预加载过了
                if self.gameLv == 1 and self.star == 0 then
                else
                    GlobalData.setHasAddEffectCashe()
                end
                -- 异步加载图片纹理, 加载战斗的地图
                self:addImageAsync()
                self.bEnd = true
            end
            if not self.bEnd then
                if (100 * (self.tickCount + 5)/ (self.allCount+15) ) > 5 then
                    self.progress:setPercentage( 100 * (self.tickCount + 5)/ (self.allCount+5) )
                end
            end
        end
    end

    self.tickCount = self.tickCount + 1
end

-- 提前加载角色的骨骼动画, 计算有多少角色csb动画的 plist 文件需要预加载
function TransitionScene:addAniData()
    print("TransitionScene:addAniData() begin")
    -- 通过地图id，拿到地图配置，然后把这一关要刷的怪物都取出来

    -- add by Owen, 2016.1.21, 先清除掉老的缓存，从游戏里面返回大厅的时候就清理的话可能会crash
    SpineCache.removeAllSpineCache()


    local monsterModuleName = string.format("maps.Map%s-%sMonster", self.params.mapId,
        self.params.modeId)

    local data          = clone(require(monsterModuleName))
    local monsterData   = data["objects"]
    -- 总共有几波
    local totalRound    = monsterData["total"]
    -- 记录多有的怪物id
    local allMonsterObjIDs = {}
    -- 遍历每一波
    for i = 1, totalRound do 
        -- 这一波总共有几小队
        local subRoundCounts = monsterData["round:"..tostring(i)]["total"]
        -- 遍历所有小队，取得这一小队刷的怪物id
        for j = 1, subRoundCounts do
            local subRoundData = monsterData["round:"..tostring(i)]["sub_round:"..tostring(j)]
            -- dump(subRoundData, "dump subRoundData")
            local monsterId = subRoundData["resourceId"]
            -- print("round = "..i.." subRound = "..j.." monsterId = "..tostring(monsterId))
            allMonsterObjIDs[monsterId] = monsterId
        end
    end

    -- 添加上阵的英雄id
    local heros = GlobalData.getHeroInFight() -- HeroInFight.getAll()
    for i,v in ipairs(heros) do
        if v ~= 0 then
            allMonsterObjIDs[v] = v
        end
    end


    -- 去掉已经缓存过的怪物id
    for k,v in pairs(allMonsterObjIDs) do
        local isNew = true
        -- 这个角色应该缓存过spine
        for k2,v2 in pairs(SpineCache.getAllSpineCache()) do
            if v == k2 then
                isNew = false
            end
        end
        -- 这个角色应该缓存过帧动画
        if isNew then
            for k2,v2 in pairs(FrameAniCache.getAllFrameAniCache()) do
            if v == k2 then
                isNew = false
            end
        end
        end
        -- 已经在缓存中了，那么删除掉
        if not isNew then
            v = nil
        end
    end

    local needAddPlistCount = #self.needAddPlist
    
    -- 遍历这一关的怪物，新建怪物spine，或者怪物帧动画
    for k,v in pairs(allMonsterObjIDs) do
        local data      = StaticObjectsProperties.get(v)
        local fileName  = data.imageName
        if not string.find(fileName, "png") and not string.find(fileName, "pvr") 
            and not string.find(fileName, "csb") then
            -- StaticObjectsProperties配置中的fileName找不到png的就是spine动画
            print("怪物 "..tostring(v).." 的spine文件路径"..tostring(fileName))
            -- local spineData = sp.SkeletonAnimation:create(fileName..".json", fileName..".atlas", 1.0)
            -- SpineCache.addSpineCache(v, spineData)
            self.needAddSpine[#self.needAddSpine + 1] = {v, fileName}
        elseif string.find(fileName, "pvr") then
            -- 不是spine动画，fileName中又找不到 - 的，就是帧动画
            -- self:addFrameCache(v, fileName)
            FrameAniCache.addFrameAniCache(v, fileName)
        elseif string.find(fileName, "csb") then
            -- 不是spine动画，fileName中又找不到 - 的，就是帧动画

            -- self.needAddPlist[#self.needAddPlist + 1] = "monster/"..v
            needAddPlistCount = needAddPlistCount + 1
            self.needAddPlist[needAddPlistCount] = "monster/"..v
        end
        data = nil
    end

    -- 如果是第一次进入关卡的加载，只加载第一关需要用到的特效资源
    if self.gameLv == 1 and self.star == 0 then
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "tower/160101"
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "tower/160201"
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "tower/160301"
    else
        -- 需要预加载所有塔的plist和png
        for i = 1, 5 do
            if i ~= 2 and i ~= 3 then
                -- self.needAddPlist[#self.needAddPlist + 1] = "tower/".."16010"..i
                -- self.needAddPlist[#self.needAddPlist + 1] = "tower/".."16020"..i
                -- self.needAddPlist[#self.needAddPlist + 1] = "tower/".."16030"..i
                needAddPlistCount = needAddPlistCount + 1
                self.needAddPlist[needAddPlistCount] = "tower/".."16010"..i
                needAddPlistCount = needAddPlistCount + 1
                self.needAddPlist[needAddPlistCount] = "tower/".."16020"..i
                needAddPlistCount = needAddPlistCount + 1
                self.needAddPlist[needAddPlistCount] = "tower/".."16030"..i
                
            end
        end

        -- 需要预加载3种祭坛塔召唤兵, 以及分裂出来的小水元素的plist和png
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "hero/170301"
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "hero/170204"
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "hero/170205"
        needAddPlistCount = needAddPlistCount + 1
        self.needAddPlist[needAddPlistCount] = "hero/170301"
    end

    -- 需要预加载4种天气
    needAddPlistCount = needAddPlistCount + 1
    self.needAddPlist[needAddPlistCount] = "particle/eff_sunny"
    needAddPlistCount = needAddPlistCount + 1
    self.needAddPlist[needAddPlistCount] = "particle/eff_windy"
    -- needAddPlistCount = needAddPlistCount + 1
    -- self.needAddPlist[needAddPlistCount] = "particle/xue"
    -- needAddPlistCount = needAddPlistCount + 1
    -- self.needAddPlist[needAddPlistCount] = "particle/yu"


    -- 手动清一下内存
    data = nil
    monsterData = nil
    print("TransitionScene:addAniData() end")
end



-- 预加载特效的帧动画
function TransitionScene:addEffectData()
    EffectAniCache.addEffectAniCache()
end

--[[ 当调用这个函数创建sprite时，Sprite::create(pszFileName)
     如果文件名以前没有被加载时，它会创建一个新的Texture2D 对象，它会返回它。
     它将使用文件名作为key否则，它会返回一个引用先前加载的图像]]

-- 通过这个方法来动态加载图片纹理
function TransitionScene:addImageAsync()
    print("TransitionScene:addImageAsync() begin")
    -- dump(self.params, "dump self.params 1 ")

    self.progress:setPercentage( 100 )
    
    -- 地图背景加载好了以后就切换到游戏场景去
    local callback = function ( ... )

        print("TransitionScene:addImageAsync() end")
        dump(self.params, "dump self.params 2 ")
        display.replaceScene(require("editor.EditorScene").new({mapId = self.mapId -- self.params.mapId
            , modeId = self.modeId}))  -- self.params.modeId}))
        

    end

    print("self.params.mapId = "..self.params.mapId)
    local imagePath 
    -- if self.params.mapId == "A0001" then
        imagePath = string.format("mapBg/Map%sBg.jpg", self.params.mapId)
    -- else
    --     imagePath = string.format("mapBg/Map%sBg.png", self.params.mapId)
    -- end

    display.addImageAsync(imagePath, callback)
end

-- add by Owen, 2016.7.14, 预加载音效
function TransitionScene:addPreloadSound()

    -- 如果是第一次进入关卡的加载，只加载第一关需要用到的特效资源
    if self.gameLv == 1 and self.star == 0 then
self.allSound[#self.allSound + 1] = "Arataki"
        self.allSound[#self.allSound + 1] = "Tower"
        self.allSound[#self.allSound + 1] = "Enemies"
        self.allSound[#self.allSound + 1] = "Function"
        self.allSound[#self.allSound + 1] = "Shoot_2"
        self.allSound[#self.allSound + 1] = "Menu"
        self.allSound[#self.allSound + 1] = "Purchase"
        self.allSound[#self.allSound + 1] = "Animal"
        self.allSound[#self.allSound + 1] = "Jettisonin"
        self.allSound[#self.allSound + 1] = "Ground"
        self.allSound[#self.allSound + 1] = "Weapons"
        self.allSound[#self.allSound + 1] = "Magic"
        self.allSound[#self.allSound + 1] = "Storm_2"
        self.allSound[#self.allSound + 1] = "Storm_1"
        self.allSound[#self.allSound + 1] = "Armageddon"
        self.allSound[#self.allSound + 1] = "Sell"
        self.allSound[#self.allSound + 1] = "Upgrade"
        self.allSound[#self.allSound + 1] = "Revive"
        self.allSound[#self.allSound + 1] = "Hemorrhage"
        self.allSound[#self.allSound + 1] = "Victory"

    else

        self.allSound[#self.allSound + 1] = "Altar"
        self.allSound[#self.allSound + 1] = "Animal"
        self.allSound[#self.allSound + 1] = "Arataki"
        self.allSound[#self.allSound + 1] = "Armageddon"
        self.allSound[#self.allSound + 1] = "Arrows"
        self.allSound[#self.allSound + 1] = "Choice"
        self.allSound[#self.allSound + 1] = "Defeat"
        self.allSound[#self.allSound + 1] = "Delivery"
        self.allSound[#self.allSound + 1] = "Destruction"
        self.allSound[#self.allSound + 1] = "Dew"
        self.allSound[#self.allSound + 1] = "Dragon"
        -- self.allSound[#self.allSound + 1] = "Ellis_advance"
        -- self.allSound[#self.allSound + 1] = "Ellis_battle"
        self.allSound[#self.allSound + 1] = "Enemies"
        self.allSound[#self.allSound + 1] = "Error"
        self.allSound[#self.allSound + 1] = "Female"
        self.allSound[#self.allSound + 1] = "Firesea"
        self.allSound[#self.allSound + 1] = "Function"
        -- self.allSound[#self.allSound + 1] = "Geh'rol_advance"
        -- self.allSound[#self.allSound + 1] = "Geh'rol_battle"
        self.allSound[#self.allSound + 1] = "Ground"
        self.allSound[#self.allSound + 1] = "Hemorrhage"
        self.allSound[#self.allSound + 1] = "Horn"
        self.allSound[#self.allSound + 1] = "Human"
        self.allSound[#self.allSound + 1] = "Jettisonin"
        -- self.allSound[#self.allSound + 1] = "Kael_advance"
        -- self.allSound[#self.allSound + 1] = "Kael_battle"
        self.allSound[#self.allSound + 1] = "Kenkonitteki_1"
        self.allSound[#self.allSound + 1] = "Kenkonitteki_2"
        self.allSound[#self.allSound + 1] = "Levelup"
        self.allSound[#self.allSound + 1] = "Magic"
        self.allSound[#self.allSound + 1] = "MagicII"
        self.allSound[#self.allSound + 1] = "Male"
        self.allSound[#self.allSound + 1] = "Menu"
        self.allSound[#self.allSound + 1] = "Meteorite_1"
        self.allSound[#self.allSound + 1] = "Meteorite_2"
        self.allSound[#self.allSound + 1] = "Monster"
        self.allSound[#self.allSound + 1] = "Nets"
        self.allSound[#self.allSound + 1] = "Onikiri"
        -- self.allSound[#self.allSound + 1] = "Parris_advance"
        -- self.allSound[#self.allSound + 1] = "Parris_battle"
        self.allSound[#self.allSound + 1] = "Purchase"
        self.allSound[#self.allSound + 1] = "Readiness"
        self.allSound[#self.allSound + 1] = "Revive"
        self.allSound[#self.allSound + 1] = "Rob"
        self.allSound[#self.allSound + 1] = "Seed"
        self.allSound[#self.allSound + 1] = "Sell"
        -- self.allSound[#self.allSound + 1] = "Selri_advance"
        -- self.allSound[#self.allSound + 1] = "Selri_battle"
        -- self.allSound[#self.allSound + 1] = "Shatt_advance"
        -- self.allSound[#self.allSound + 1] = "Shatt_battle"
        self.allSound[#self.allSound + 1] = "Shine"
        self.allSound[#self.allSound + 1] = "Shock"
        self.allSound[#self.allSound + 1] = "Shoot"
        self.allSound[#self.allSound + 1] = "Shoot_1"
        self.allSound[#self.allSound + 1] = "Shoot_2"
        self.allSound[#self.allSound + 1] = "Stick"
        self.allSound[#self.allSound + 1] = "Storm_1"
        self.allSound[#self.allSound + 1] = "Storm_2"
        self.allSound[#self.allSound + 1] = "Sunelemental"
        -- self.allSound[#self.allSound + 1] = "Tah'nel_advance"
        -- self.allSound[#self.allSound + 1] = "Tah'nel_battle"
        -- self.allSound[#self.allSound + 1] = "Thaurrer_advance"
        -- self.allSound[#self.allSound + 1] = "Thaurrer_battle"
        self.allSound[#self.allSound + 1] = "Thunderstrike_1"
        self.allSound[#self.allSound + 1] = "Thunderstrike_2"
        self.allSound[#self.allSound + 1] = "Tower"
        self.allSound[#self.allSound + 1] = "Upgrade"
        self.allSound[#self.allSound + 1] = "UpRoad"
        self.allSound[#self.allSound + 1] = "Victory"
        self.allSound[#self.allSound + 1] = "Water"
        self.allSound[#self.allSound + 1] = "Weapons"
        self.allSound[#self.allSound + 1] = "Wood"

        self.allSound[#self.allSound + 1] = "KP1002"
        self.allSound[#self.allSound + 1] = "KP1004"
        self.allSound[#self.allSound + 1] = "KP1005"
        self.allSound[#self.allSound + 1] = "KP1007"
        self.allSound[#self.allSound + 1] = "KP1008"
        self.allSound[#self.allSound + 1] = "KP1010"

        self.allSound[#self.allSound + 1] = "KP2001"
        self.allSound[#self.allSound + 1] = "KP2003"
        self.allSound[#self.allSound + 1] = "KP2004"
        self.allSound[#self.allSound + 1] = "KP2005"
        self.allSound[#self.allSound + 1] = "KP2006"
        self.allSound[#self.allSound + 1] = "KP2007"

    end


    -- AudioMgr.preloadSound("Altar")
    -- AudioMgr.preloadSound("Animal")
    -- AudioMgr.preloadSound("Arataki")
    -- AudioMgr.preloadSound("Armageddon")
    -- AudioMgr.preloadSound("Arrows")
    -- AudioMgr.preloadSound("Choice")
    -- AudioMgr.preloadSound("Defeat")
    -- AudioMgr.preloadSound("Delivery")
    -- AudioMgr.preloadSound("Destruction")
    -- AudioMgr.preloadSound("Dew")
    -- AudioMgr.preloadSound("Dragon")
    -- -- AudioMgr.preloadSound("Ellis_advance")
    -- -- AudioMgr.preloadSound("Ellis_battle")
    -- AudioMgr.preloadSound("Enemies")
    -- AudioMgr.preloadSound("Error")
    -- AudioMgr.preloadSound("Female")
    -- AudioMgr.preloadSound("Firesea")
    -- AudioMgr.preloadSound("Function")
    -- -- AudioMgr.preloadSound("Geh'rol_advance")
    -- -- AudioMgr.preloadSound("Geh'rol_battle")
    -- AudioMgr.preloadSound("Ground")
    -- AudioMgr.preloadSound("Hemorrhage")
    -- AudioMgr.preloadSound("Horn")
    -- AudioMgr.preloadSound("Human")
    -- AudioMgr.preloadSound("Jettisonin")
    -- -- AudioMgr.preloadSound("Kael_advance")
    -- -- AudioMgr.preloadSound("Kael_battle")
    -- AudioMgr.preloadSound("Kenkonitteki_1")
    -- AudioMgr.preloadSound("Kenkonitteki_2")
    -- AudioMgr.preloadSound("Levelup")
    -- AudioMgr.preloadSound("Magic")
    -- AudioMgr.preloadSound("MagicII")
    -- AudioMgr.preloadSound("Male")
    -- AudioMgr.preloadSound("Menu")
    -- AudioMgr.preloadSound("Meteorite_1")
    -- AudioMgr.preloadSound("Meteorite_2")
    -- AudioMgr.preloadSound("Monster")
    -- AudioMgr.preloadSound("Nets")
    -- AudioMgr.preloadSound("Onikiri")
    -- -- AudioMgr.preloadSound("Parris_advance")
    -- -- AudioMgr.preloadSound("Parris_battle")
    -- AudioMgr.preloadSound("Purchase")
    -- AudioMgr.preloadSound("Readiness")
    -- AudioMgr.preloadSound("Revive")
    -- AudioMgr.preloadSound("Rob")
    -- AudioMgr.preloadSound("Seed")
    -- AudioMgr.preloadSound("Sell")
    -- -- AudioMgr.preloadSound("Selri_advance")
    -- -- AudioMgr.preloadSound("Selri_battle")
    -- -- AudioMgr.preloadSound("Shatt_advance")
    -- -- AudioMgr.preloadSound("Shatt_battle")
    -- AudioMgr.preloadSound("Shine")
    -- AudioMgr.preloadSound("Shock")
    -- AudioMgr.preloadSound("Shoot")
    -- AudioMgr.preloadSound("Shoot_1")
    -- AudioMgr.preloadSound("Shoot_2")
    -- AudioMgr.preloadSound("Stick")
    -- AudioMgr.preloadSound("Storm_1")
    -- AudioMgr.preloadSound("Storm_2")
    -- AudioMgr.preloadSound("Sunelemental")
    -- -- AudioMgr.preloadSound("Tah'nel_advance")
    -- -- AudioMgr.preloadSound("Tah'nel_battle")
    -- -- AudioMgr.preloadSound("Thaurrer_advance")
    -- -- AudioMgr.preloadSound("Thaurrer_battle")
    -- AudioMgr.preloadSound("Thunderstrike_1")
    -- AudioMgr.preloadSound("Thunderstrike_2")
    -- AudioMgr.preloadSound("Tower")
    -- AudioMgr.preloadSound("Upgrade")
    -- AudioMgr.preloadSound("UpRoad")
    -- AudioMgr.preloadSound("Victory")
    -- AudioMgr.preloadSound("Water")
    -- AudioMgr.preloadSound("Weapons")
    -- AudioMgr.preloadSound("Wood")
end

function TransitionScene:onExit()
    print("TransitionScene:onExit")
    display.removeSpriteFrameByImageName(self.imageName)

end

function TransitionScene:removeView()
    -- self.battleUI:removeFromParent()
end




return TransitionScene
