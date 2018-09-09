--region NewFile_1.lua
--Author : wanggangdan
--Date   : 2016/4/5
local MonsterData = require("app.properties.MonsterOrder")
local TowerData   = require("app.properties.TowerOrder")
local GlobalData  = require("tools.GlobalData")
local HandBookUI = class("ui/HandBook.lua")
local object = nil
local cellCount = 0
function HandBookUI:ctor()
    object = self
    self.curShowPage = 1
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "clickEvent" then
            return function () 
                if node:getName() == "close_btn" then
                    AudioMgr.playSound(AudioMgr.allUIEffect.Menu,false)
                    viewMgr.hide(viewMgr.def.HANDBOOK_UI)
                    return
                end 
                if node:getName() == "btn_Monster" then
                    self.tableView:setTouchEnabled(true)
                    self.curShowPage = 1
                    self.btn_Monster:loadTextureNormal("ui/hall/encyclopedia/btn_monster.png")
                    self.btn_def:loadTextureNormal("ui/hall/encyclopedia/btn_def_off.png")
                    self.tableView:reloadData()
                    HandBookUI.chooseIcon(1)
                end 
                if node:getName() == "btn_def" then
                    self.tableView:setTouchEnabled(false)
                    self.curShowPage = 2
                    self.btn_def:loadTextureNormal("ui/hall/encyclopedia/btn_def.png")
                    self.btn_Monster:loadTextureNormal("ui/hall/encyclopedia/btn_monster_off.png")
                    self.tableView:reloadData()
                    HandBookUI.chooseTower(1)
                end      
            end         
        end      
    end
    GlobalData.unlockOneMonster("0")
    NotifyCenter.notify(EventNames.REFRUSH_WORLDHALL,nil)
    local result = import("ui.EncyclopediaStudio").create(clickBack)
    self.page = result.root
    self.Panel_2 = result.Panel_2
    self.Panel_2:setVisible(false)
    self.Panel_3 = result.Panel_3
    self.Panel_3:setVisible(false)
    self.jt   = result.jt
    self.zzgs = result.zzgs
    self.mft  = result.mft
    self.line = result.line
    local bg = result.Panel_5
    utils.playAction(self.page,bg,true)
    --
    self.btn_Monster = result.btn_Monster
    self.btn_Monster:loadTextureNormal("ui/hall/encyclopedia/btn_monster.png")
    self.btn_def     = result.btn_def

    self.tableView = cc.TableView:create(cc.size(620,460))
    self.tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.tableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    self.tableView:setDelegate()
    self.tableView:setPosition(cc.p(-537,-240))
    self.page:addChild(self.tableView)
    self.tableView:registerScriptHandler(HandBookUI.numberOfCellsInTableView,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)  
    self.tableView:registerScriptHandler(HandBookUI.cellSizeForTable,cc.TABLECELL_SIZE_FOR_INDEX)
    self.tableView:registerScriptHandler(HandBookUI.tableCellAtIndex,cc.TABLECELL_SIZE_AT_INDEX)
    self.tableView:reloadData()
    --元素

    -- 怪物描述
    self.monsterInfoText = result.monsterInfoText
    -- 内容文字要自动换行
    self.monsterInfoText:ignoreContentAdaptWithSize(false); 
    self.monsterInfoText:setContentSize(cc.size(280,120)); 
    -- self.monsterInfoText:setPositionY(self.monsterInfoText:getPositionY() - 80)
    self.monsterInfoText:setFontName(GLOBAL_FONTNAME)


    self.monsterImg      = result.monsterImg
    -- 血量
    self.hp_text         = result.hp_text
    self.hp_text:setFontName(GLOBAL_FONTNAME)
    -- 攻击
    self.attack_text     = result.attack_text
    self.attack_text:setFontName(GLOBAL_FONTNAME)
    -- 护甲
    self.armor_text      = result.armor_text
    self.armor_text:setFontName(GLOBAL_FONTNAME)
    -- 速度
    self.speed_text      = result.speed_text
    self.speed_text:setFontName(GLOBAL_FONTNAME)
    -- 扣血量
    self.killHp_text     = result.killHp_text
    self.killHp_text:setFontName(GLOBAL_FONTNAME)
    -- 名字
    self.heroNameTxt     = result.heroNameTxt
    self.heroNameTxt:setFontName(GLOBAL_FONTNAME)

    --攻击
    self.attack_text_2 = result.attack_text_2
    -- 护甲
    self.armor_text_4  = result.armor_text_4
    -- 移动速度
    self.speed_text_6 = result.speed_text_6
    self.speedIcon    = result.speed_170_9
    self.defIcon    = result.armor_169_6

    self.chooseIcon(1)
end

function HandBookUI.numberOfCellsInTableView(table)
    if object.curShowPage == 1 then
        local monsterCount = MonsterData.getAll()
        cellCount    = math.ceil(#monsterCount/5)
    else
        cellCount    = 4
    end
    return cellCount
end

function HandBookUI.cellSizeForTable(table,idx)
    return 100,124
end

function HandBookUI.tableCellAtIndex(table,idx)
    local cell = table:dequeueCell()
    if cell == nil  then
        cell = cc.TableViewCell:new()        
    end
    if object.curShowPage == 1 then
        object.jt:setVisible(false)
        object.zzgs:setVisible(false)
        object.mft:setVisible(false)
        object.line:setVisible(false)
        HandBookUI.createCell(idx,cell)
    else
        object.jt:setVisible(true)
        object.zzgs:setVisible(true)
        object.mft:setVisible(true)
        object.line:setVisible(true)
        HandBookUI.createTower(idx,cell)
    end
    return cell
end
--防御塔
function HandBookUI.createTower(idx,cell)
    object.Panel_2:setVisible(false)
    object.Panel_3:setVisible(true)
    for k = 1,5 do
        local btn = cell:getChildByName(string.format("btn_%d",k))        
        if btn then
            btn:removeFromParent(true)
        end       
    end
    for j = 1,6 do
        local btn2 = cell:getChildByName(string.format("btn2_%d",j))
        if btn2 then
            btn2:removeFromParent(true)
        end
    end
    if idx <= 2 then
        for i = 1,3 do
            local index = idx * 3 + i
            local data = TowerData.get(index)
            if data ~= nil then
                local touchPos = nil
                local path = "ui/hall/encyclopedia/monsterBtn.png"
                btn = ccui.Button:create(path,path,nil)
                btn:setScale(1.1)
                btn.index = index
                btn:setTouchEnabled(false)
                btn:setName(string.format("btn_%d",i))
                btn:setPosition(cc.p(i * 100+(i-1)*90+50,20-idx*11))
                local sizeBtn = btn:getContentSize()
                cell:addChild(btn)
                local path = string.format("ui/Icons/towerIcon/%s.png",data)
                local image = ccui.ImageView:create()
                image:setName("image")
                image:loadTexture(path)
                image:setScale(1/1.1)
                local size = image:getContentSize()
                image:setPosition(cc.p(sizeBtn.width/2-1,sizeBtn.height/2+1))
                btn:addChild(image,-1)
                local function onTouchBegan(touch,event)
                    touchPos = touch:getLocation()
                    return true
                end 
                local function onTouchEnd(touch,event)
                    local target = event:getCurrentTarget()  
                    local pos = touch:getLocation()    
                    local locationInNode = target:convertToNodeSpace(pos)
                    local size = target:getContentSize()
                    local rect = cc.rect(0,0,size.width,size.height)
                    if cc.rectContainsPoint(rect,locationInNode) then
                        local image = target:getChildByName("image")
                        if math.abs(touchPos.x-pos.x) <= 10 or math.abs(touchPos.y-pos.y) <= 10 then
                            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
                            HandBookUI.chooseTower(target.index)
                        end
                    end
                end
                local listener = cc.EventListenerTouchOneByOne:create()
                listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
                listener:registerScriptHandler(onTouchEnd,cc.Handler.EVENT_TOUCH_ENDED )

                local eventDispatcher = btn:getEventDispatcher()
                eventDispatcher:addEventListenerWithSceneGraphPriority(listener,btn)
            end
        end
    else
         for i = 1,6 do
            local index = idx * 3 + i
            local data = TowerData.get(index)
            if data ~= nil then
                local path = "ui/hall/encyclopedia/monsterBtn.png"
                btn = ccui.Button:create(path,path,nil)
                btn:setScale(1.1)
                btn.index = index
                btn:setTouchEnabled(false)
                btn:setName(string.format("btn2_%d",i))
                local delta = 40
                if i % 2 == 0 then
                    delta = 30
                end
                btn:setPosition(cc.p(i * 66+(i-1)*30+delta,-18))
                local sizeBtn = btn:getContentSize()
                cell:addChild(btn)
                local path = string.format("ui/Icons/towerIcon/%s.png",data)
                local image = ccui.ImageView:create()
                image:setName("image")
                image:loadTexture(path)
                image:setScale(1/1.1)
                local size = image:getContentSize()
                image:setPosition(cc.p(sizeBtn.width/2-1,sizeBtn.height/2+1))
                btn:addChild(image,-1)
                local function onTouchBegan(touch,event)
                    touchPos = touch:getLocation()
                    return true
                end 
                local function onTouchEnd(touch,event)
                    local target = event:getCurrentTarget()  
                    local pos = touch:getLocation()    
                    local locationInNode = target:convertToNodeSpace(pos)
                    local size = target:getContentSize()
                    local rect = cc.rect(0,0,size.width,size.height)
                    if cc.rectContainsPoint(rect,locationInNode) then
                        local image = target:getChildByName("image")
                        if math.abs(touchPos.x-pos.x) <= 10 or math.abs(touchPos.y-pos.y) <= 10 then
                            AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
                            HandBookUI.chooseTower(target.index)
                        end
                    end
                end
                local listener = cc.EventListenerTouchOneByOne:create()
                listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
                listener:registerScriptHandler(onTouchEnd,cc.Handler.EVENT_TOUCH_ENDED )

                local eventDispatcher = btn:getEventDispatcher()
                eventDispatcher:addEventListenerWithSceneGraphPriority(listener,btn)
            end
        end
    end
end
--怪物
function HandBookUI.createCell(idx,cell)
    object.Panel_2:setVisible(true)
    object.Panel_3:setVisible(false)
    for k = 1,5 do
        local btn = cell:getChildByName(string.format("btn_%d",k))
        if btn then
            btn:removeFromParent(true)
        end
    end
    for j = 1,6 do
        local btn2 = cell:getChildByName(string.format("btn2_%d",j))
        if btn2 then
            btn2:removeFromParent(true)
        end
    end
    for i = 1,5 do
        local index = idx * 5 + i
        local data = MonsterData.get(index)
        if data ~= nil then
            local touchPos = nil
            local btn = cell:getChildByName(string.format("btn_%d",i))
            if btn then
                local path = nil
                if string.sub(data,1,5) == "10050" then
                    path = "ui/hall/encyclopedia/monsterBtnH.png"
                else
                    path = "ui/hall/encyclopedia/monsterBtn.png"
                end
                btn:loadTextures(path,path,nil)
                local btnSize = btn:getContentSize()
                local image = btn:getChildByName("image")
                local path = string.format("ui/Icons/monsterIcon/%s.jpg",data)
                image:loadTexture(path)
                image:setPosition(cc.p(btnSize.width/2-1,btnSize.height/2+1))
                local size = image:getContentSize()
                btn:setVisible(true)
                btn.index = index
                local isLock = GlobalData.getOneMonsterHasBeSee(data)
                local lock = image:getChildByName("lock")
                lock:setVisible(not isLock)
            else
                local path = nil
                if string.sub(data,1,5) == "10050" then
                    path = "ui/hall/encyclopedia/monsterBtnH.png"
                else
                    path = "ui/hall/encyclopedia/monsterBtn.png"
                end
                btn = ccui.Button:create(path,path,nil)
                btn.index = index
                btn:setTouchEnabled(false)
                btn:setName(string.format("btn_%d",i))
                btn:setPosition(cc.p(i * 85+(i-1)*30+20,45))
                local sizeBtn = btn:getContentSize()
                cell:addChild(btn)
                local path = string.format("ui/Icons/monsterIcon/%s.jpg",data)
                local image = ccui.ImageView:create()
                image:setName("image")
                image:loadTexture(path)
                local size = image:getContentSize()
                image:setPosition(cc.p(sizeBtn.width/2-1,sizeBtn.height/2+1))
                btn:addChild(image,-1)
                --锁
                local lock = ccui.ImageView:create("ui/common/lock.png")
                lock:setName("lock")
                lock:setScale(0.6)
                local isLock = GlobalData.getOneMonsterHasBeSee(data)
                lock:setVisible(not isLock)
                lock:setPosition(cc.p(size.width/2,size.height/2))
                image:addChild(lock)
                 local function onTouchBegan(touch,event)
                        touchPos = touch:getLocation()
                        return true
                 end 
                local function onTouchEnd(touch,event)
                    local target = event:getCurrentTarget()  
                    local pos = touch:getLocation()    
                    local locationInNode = target:convertToNodeSpace(pos)
                    local size = target:getContentSize()
                    local rect = cc.rect(0,0,size.width,size.height)
                    if cc.rectContainsPoint(rect,locationInNode) then
                        local image = target:getChildByName("image")
                        local lock = image:getChildByName("lock")
                        if target:isVisible() and  not lock:isVisible() then
                            if math.abs(touchPos.x-pos.x) <= 10 or math.abs(touchPos.y-pos.y) <= 10 then
                                AudioMgr.playSound(AudioMgr.allUIEffect.Choice,false)
                                HandBookUI.chooseIcon(target.index)
                            end
                        else
                            AudioMgr.playSound(AudioMgr.allUIEffect.Error,false)
                        end
                    end
                end   
                local listener = cc.EventListenerTouchOneByOne:create()
                listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
                listener:registerScriptHandler(onTouchEnd,cc.Handler.EVENT_TOUCH_ENDED )

                local eventDispatcher = btn:getEventDispatcher()
                eventDispatcher:addEventListenerWithSceneGraphPriority(listener,btn)
            end
        else
           local btn = cell:getChildByName(string.format("btn_%d",i))
           if btn then
                btn:setVisible(false)
           end 
        end
    end
end
function HandBookUI.chooseTower(index)
    local x = 0
    local y = 0
    if index <= 9 then
        local line = math.ceil(index / 3)
        local col = index % 3
        if col == 0 then
            col = 3
        end
        x = col * 100+(col-1)*90+50
        y = (4-line) * 100 - (line - 1)*10 + 20
    else
        local delta = 30
        if index % 2 == 0 then
            delta = 39
        end
        x = (index - 9) * 66+(index - 10)*30+delta
        y = -16
    end     
    if object.selectImage == nil then 
        object.selectImage = ccui.ImageView:create()
        object.selectImage:loadTexture("ui/hall/encyclopedia/light.png")
        object.selectImage:setScale(1.1)
        object.tableView:addChild(object.selectImage,-1)
        object.selectImage:setPosition(cc.p(x,y))
    else
        object.selectImage:setPosition(cc.p(x,y))
        object.selectImage:setScale(1.1)
    end
    local id                     = TowerData.get(index)
    local TowerProperties        = require("app.properties.TowerProperties")
    local towerConfig            = TowerProperties.get(id)
    -- 更新怪物的信息
    object.monsterImg:setTexture(string.format("ui/Icons/towerIcon/big/%s.jpg",id))

    -- 名字
    local key = utils.getName("name")
    object.heroNameTxt:setString(towerConfig[key])
    -- 描述
    local key = utils.getName("text")
    object.monsterInfoText:setString(towerConfig[key])
    -- 攻击
    object.attack_text_2:setString(towerConfig.attack)
    -- 护甲
    --local key = utils.getName("speedText")
    object.armor_text_4:setString(towerConfig.fireRange)
    --速度
    local key = utils.getName("speedText")   
    object.speed_text_6:setString(towerConfig[key])

    object.speedIcon:setTexture("ui/fight/cooldown.png")
    object.defIcon:setTexture("ui/fight/fireRangeIcon.png")
end
function HandBookUI.chooseIcon(index)
    
    local line = math.ceil(index/5)
    local col  = index%5
    if col == 0 then
        col = 5
    end
    local tableSize = object.tableView:getContentSize()
    local y = tableSize.height - (line * 100) + 45
    local pos = cc.p(col * 85+(col-1)*30+19,y)
    if object.selectImage == nil then 
        object.selectImage = ccui.ImageView:create()
        object.selectImage:loadTexture("ui/hall/encyclopedia/light.png")
        object.selectImage:setScale(1)
        object.tableView:addChild(object.selectImage,-1)
        object.selectImage:setPosition(pos)
    else
        object.selectImage:setPosition(pos)
        object.selectImage:setScale(1)
    end
    local id                     = MonsterData.get(index)
    local MonsterProperties      = require("app.properties.MonsterProperties")
    local monsterConfig          = MonsterProperties.get(id)
    -- 更新怪物的信息
    object.monsterImg:setTexture(string.format("ui/Icons/monsterIcon/big/%s.jpg",id))

    -- 名字
    local key = utils.getName("name")
    object.heroNameTxt:setString(monsterConfig[key])
    -- 描述
    local key = utils.getName("text")
    object.monsterInfoText:setString(monsterConfig[key])
    -- 血量
    object.hp_text:setString(monsterConfig.maxHp)
    -- 攻击
    object.attack_text:setString(monsterConfig.attack)
    -- 护甲
    object.armor_text:setString(monsterConfig.armor)
    -- 移动速度
    object.speed_text:setString(monsterConfig.speed)
    -- 扣的血量
    object.killHp_text:setString(monsterConfig.passValue)
end

function HandBookUI:getPage()
    return self.page
end
return HandBookUI