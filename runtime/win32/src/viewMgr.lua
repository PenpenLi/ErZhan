--region NewFile_1.lua
--Author : wanggangdan
--Date   : 2016/3/29
viewMgr = {}
--存储已经在显示的界面
viewMgr.allLayer = {}
--界面层级
viewMgr.zOrder = {
    LOWEST = 1,     -- 
    LOWER = 2,
    LOW = 3,
    MIDDLE = 4,     -- 
    HIGH = 5,
    HIGHER = 6,
    HIGHEST = 7,    -- 
    DEFAULT = 15,
}
--界面展示方式
viewMgr.showType = {
    POP     = 1,
    DEFAULT = 2,
}
--存储相应的类
viewMgr.allInstance = {}
viewMgr.def = {
    WORLD_UI       = { path = "hall.worldHall.lua", zOrder = viewMgr.zOrder.LOWER,name = "hall",showType = viewMgr.showType.DEFAULT },
    STORE_UI       = { path = "ui.StoreUI.lua", zOrder = viewMgr.zOrder.MIDDLE,name = "store",showType = viewMgr.showType.POP },
    TIPS_UI        = { path = "ui.TipsUI.lua",zOrder = viewMgr.zOrder.HIGH,name = "tips",showType = viewMgr.showType.POP},
    HANDBOOK_UI    = { path = "ui.HandBookUI.lua",zOrder = viewMgr.zOrder.LOW,name = "handBook",showType = viewMgr.showType.POP},
    ACHIEVE_UI     = { path = "ui.AchieveUI.lua",zOrder = viewMgr.zOrder.LOW,name = "achieve",showType = viewMgr.showType.POP},
    INFORMATE_UI   = { path = "ui.InformateUI.lua",zOrder = viewMgr.zOrder.LOW,name = "informate",showType = viewMgr.showType.POP},
    MOUSE_UI       = { path = "ui.MouseUI.lua",zOrder = viewMgr.zOrder.DEFAULT,name = "mouseui",showType = viewMgr.showType.DEFAULT},
    CHOOSE_UI      = { path = "hall.ChooseModePanelTest.lua",zOrder = viewMgr.zOrder.LOW,name = "chooseui",showType = viewMgr.showType.POP},
    SETTING_UI     = { path = "ui.SettingUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "settingui",showType = viewMgr.showType.POP},
    GETTIPS_UI     = { path = "ui.GetTipsUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "getTipsUI",showType = viewMgr.showType.POP},
    SHOWSTAR_UI    = { path = "ui.ShowStarUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "showStarUI",showType = viewMgr.showType.POP},
    NEWMONSTER_UI  = { path = "ui.NewMonsterUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "monsterui",showType = viewMgr.showType.POP},
    SUTTLE_UI      = { path = "ui.SuttleUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "suttleui",showType = viewMgr.showType.POP},
    Package_UI     = { path = "ui.PackageUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "packageui",showType = viewMgr.showType.POP},
    Touch_UI       = { path = "ui.TouchDisableUI.lua",zOrder = viewMgr.zOrder.HIGHEST,name = "touchui",showType = viewMgr.showType.POP},
    DailyAward     = { path = "ui.DailyAward.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "signui",showType = viewMgr.showType.POP},
    ITEMSTORE_UI   = { path = "ui.ItemStoreUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "itemstore",showType = viewMgr.showType.DEFAULT},
    HallScene_ErZhan_UI = { path = "ui.HallScene_ErZhan.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "HallScene_ErZhan",showType = viewMgr.showType.DEFAULT},
    LoginScene_ErZhan = { path = "ui.LoginScene_ErZhan.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "LoginScene_ErZhan",showType = viewMgr.showType.DEFAULT},
    HallAllCardsScene_ErZhan = { path = "ui.HallAllCardsScene_ErZhan.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "HallAllCardsScene_ErZhan",showType = viewMgr.showType.DEFAULT},
    
    GETNEWHERO_UI  = { path = "ui.GetNewHeroUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "getnewhero",showType = viewMgr.showType.POP},
    JIGSAW_UI      = { path = "ui.JigsawStudioUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "jigsaw",showType = viewMgr.showType.POP},
    HERORESET_UI   = { path = "ui.HeroResetStudioUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "heroreset",showType = viewMgr.showType.POP},
    OPENMODE_UI    = { path = "ui.OpenModeStudioUI.lua",zOrder = viewMgr.zOrder.MIDDLE,name = "openmode",showType = viewMgr.showType.POP}
}
function viewMgr.show(layer,...)
    print("viewMgr.show 1")
    if layer == viewMgr.def.Touch_UI then return end
    print("viewMgr.show 2")
    if layer then
        if device.platform ~= "windows" and device.platform ~= "mac" then
            if layer.name == "mouseui" then
                return
            end
        end
        print("viewMgr.show 3")
        if viewMgr.allInstance[layer.name] ~= nil and layer.name ~= "mouseui" then
            return
        end
        print("viewMgr.show 4")
        local scene = display.getRunningScene()
        if scene == nil then
            scene = display.newScene("uiRoot")
            display.replaceScene(scene)            
        end
        print("viewMgr.show 5")
        local path = viewMgr.getPath(layer)
        local layerClass = require(path)
        local instance = layerClass:new(...) 
        local page = instance:getPage()
        print("viewMgr.show page = "..tostring(page))
        local zorder = viewMgr.getzOrder(layer)
        if page then
            scene:addChild(page,zorder)
            page:setPosition(cc.p(display.cx,display.cy))
            if layer.showType == viewMgr.showType.POP then
                print("page:setScale(0.8)")
                page:setScale(0.8)
            else
                print("page:setScale(GLOBAL_HALL_UI_SCALE2) = "..tostring(GLOBAL_HALL_UI_SCALE2))
                page:setScale(GLOBAL_HALL_UI_SCALE2)
            end
            if instance.onEnter then
                instance:onEnter()
            end
            local name = viewMgr.getName(layer)
            viewMgr.allLayer[name] = page
            viewMgr.allInstance[name] = instance
            return page
        else
            print("layer must be no empty")
        end
    else
        print("layer must be no empty")
    end
end
function viewMgr.hide(layer)
    if layer == viewMgr.def.Touch_UI then return end
    if layer then
        for key,value in pairs(viewMgr.allLayer) do
            if key == layer.name then
                local page = viewMgr.allLayer[key]
                local instance = viewMgr.allInstance[key]
                if instance.onExit then
                    instance:onExit()
                end
                value:removeFromParent()
                viewMgr.allLayer[key] = nil
                viewMgr.allInstance[key] = nil
                return page
            end
        end
        print("no find layer")
        return 
    else
        print("layer must be no empty ")
    end
end
function viewMgr.find(layer)
    if layer then
        for key,value in pairs(viewMgr.allLayer) do
            if key == layer.name then
                return viewMgr.allLayer[key]
            end
        end
        print("no find layer")
        return nil
    else
        print("layer must be no empty")
    end
end
--layer全路径
function viewMgr.getPath(layer)
    return layer.path
end
--layer层级
function viewMgr.getzOrder(layer)
    return layer.zOrder
end
--layer名字
function viewMgr.getName(layer)
    return layer.name
end