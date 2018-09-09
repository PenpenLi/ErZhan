

--[[--

从大厅进入游戏的切换场景

函数调用顺序：程序先到第二个场景的ctor中，然后再回到第一个场景的Onexit中，
    最后才到第二个场景的onEnter中

]]

local lfs = require("lfs")

local UpdateScene = class("UpdateScene", function()
    return display.newScene("UpdateScene")
end)

-- 下载的zip包url路径前面的固定网址
updateStableUrl = "https://raw.githubusercontent.com/xiaoiOwen/test/master/"

-- 根据文件名获取完整路径
local function getFullPath(filename)
    return string.gsub(device.writablePath, "[\\\\/]+$", "") .. "/" .. filename
end

local function makePathDirIfNeed(path)
    local pathSeg = string.split(path, device.directorySeparator)
    local p = ""
    for i = 1,#pathSeg - 1 do
        p = p .. pathSeg[i] .. device.directorySeparator
        -- lfs.attributes 获取路径p 指定属性mode
        local mode = lfs.attributes(p, "mode")
        --不是目录，则删除之
        if mode ~= "directory" then
            os.remove(p)
        end
        if (not mode) then
            lfs.mkdir(p)
        end
    end
end



-- version1表示本地的版本号
-- version2表示服务器上最新的版本号
function UpdateScene:ctor(version1, version2)
    print("UpdateScene:ctor")

    local function onError(errorCode)
        if errorCode == cc.ASSETSMANAGER_NO_NEW_VERSION then
            -- progressLable:setString("no new version")
            progressLable:setString("没有新的版本")
        elseif errorCode == cc.ASSETSMANAGER_NETWORK then
            -- progressLable:setString("network error")
            progressLable:setString("网络连接失败")
            self:showNoNetworkDialog()  
        end
    end

    local function onProgress( percent )
        print("onProgress percent = "..tostring(percent))
        if percent < 0 then
            percent = 0
        end
        local progress = string.format("正在下载 %d%%",percent)
        progressLable:setString(progress)
        progressLine:setPercentage(percent)
        if percent == 100 then 
            progressLable:setString("正在解压，此过程不消耗流量")
        end
    end

    -- 成功下下来，并且解压以后，会回调这个 onSuccess 函数
    local function onSuccess()
        print("onSuccess")
        oneFileUpdated = true
    end

    local function getAssetsManager()
        if nil == assetsManager then
            --资源目录
            local sharedApplication = cc.Application:getInstance()
            local target = sharedApplication:getTargetPlatform()
            if target == 0 then    -- cc.PLATFORM_OS_WINDOWS then
                -- 表示是windows平台
                print("windows 平台下设置热更新资源解压路径")
                local winPath = device.writablePath.."testRes"..device.directorySeparator
                print("winPath2 = "..tostring(winPath))

                pathToSave = device.writablePath.."testRes"..device.directorySeparator
            else
                pathToSave = device.writablePath.."testRes"..device.directorySeparator
                -- cc.FileUtils:getInstance():addSearchPath(writablePath.."testRes/res", true)
            end
            print("pathToSave = "..tostring(pathToSave))
            makePathDirIfNeed(pathToSave)

            pathToSave1 = getFullPath("")
            print("pathToSave1 = "..tostring(pathToSave1))

            -- assetsManager = cc.AssetsManager:new("https://raw.github.com/samuele3hu/AssetsManagerTest/master/package.zip",
            --                                "https://raw.github.com/samuele3hu/AssetsManagerTest/master/version",
            --                                pathToSave)
            assetsManager = cc.AssetsManager:new(
                                            "https://raw.githubusercontent.com/xiaoiOwen/test/master/1001.zip",
                                            -- "https://raw.github.com/HimiGame/himigame/master/hello.zip",
                                            -- "https://raw.github.com/samuele3hu/AssetsManagerTest/master/package.zip",
                                            
                                            -- "",
                                            "https://raw.github.com/samuele3hu/AssetsManagerTest/master/version",
                                            -- "https://github.com/xiaoiOwen/test/blob/master/test_Version",
                                            pathToSave)
            
            assetsManager:retain()
            assetsManager:setDelegate(onError, cc.ASSETSMANAGER_PROTOCOL_ERROR )
            assetsManager:setDelegate(onProgress, cc.ASSETSMANAGER_PROTOCOL_PROGRESS)
            assetsManager:setDelegate(onSuccess, cc.ASSETSMANAGER_PROTOCOL_SUCCESS )
            -- assetsManager:setDelegate(onDownloadSuccess, cc.ASSETSMANAGER_PROTOCOL_DOWNLOAD_SUCCESS )
            assetsManager:setConnectionTimeout(3)
        end

        return assetsManager
    end

    -- 下载并解压指定的zip包
    function doDownloadAndUncompress(zipUrl, zipName)
        print("doDownloadAndUncompress zipUrl = "..tostring(zipUrl)
            .." zipName = "..tostring(zipName))
        getAssetsManager():update(zipUrl)
    end

    -- self.params = params
    -- self.mapId  = self.params.mapId
    -- self.modeId = self.params.modeId
    -- dump(params, "dump UpdateScene:ctor params")

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


    local loadingTips = display.newTTFLabel({    -- ui.newTTFLabelWithOutline({
        -- UILabelType = 2,
        text = "正在检测更新",
        -- color = cc.c3b(255,214,0),
        font = GLOBAL_FONTNAME,
        size = 22,
    })
    :addTo(self)
    :pos(display.cx, display.cy - 20)
    loadingTips:enableOutline(cc.c4b(0, 0, 0, 255), 1)

    progressLable = loadingTips


    -- 进度条
    progressOut = display.newSprite("loadingAni/progressOut.png")
        :addTo(self)
        :pos(display.cx, display.cy - 70)
        :setVisible(false)


    self.progress = display.newProgressTimer("loadingAni/progress.png",
        display.PROGRESS_TIMER_BAR)
        :pos(833/2, 39/2)
        :addTo(progressOut)
    -- 设置进度条变化的方向, ccp(0,1)表示沿着y轴变化
    self.progress:setBarChangeRate(cc.p(1, 0))
    -- 设置进度条的起始位置, ccp(0,0)表示下面
    self.progress:setMidpoint(cc.p(0, 0))

    progressLine = self.progress

    -- -- 加载中的图片
    -- local loadTexImg  = display.newSprite("loadingAni/loading_EN.png")
    --     :addTo(progressOut)
    --     :pos(833/2, 39/2)


    -- 记录当前下载的是第几个zip文件
    updateIndex = version1 + 1
    -- 总共需要下载几个zip文件
    needUpdateCount = version2
    -- 一个zip文件是否已经更新完成了
    oneFileUpdated  = false

    print("updateIndex = "..tostring(updateIndex).." needUpdateCount = "..tostring(needUpdateCount))

    

    -- 每一帧都调用 tick 函数，用来做资源加载，防止小狗动画卡帧
    self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt) self:tick(dt) end)
    self:scheduleUpdate()

    local glview = cc.Director:getInstance():getOpenGLView()
    glview:setCursorVisible(true)

    
    if device.platform == "windows" then
        progressOut:setVisible(true)
        doDownloadAndUncompress(updateStableUrl..tostring(updateIndex)..".zip", updateIndex)
    else
        local networkState = network.getInternetConnectionStatus()
        if 0 ~= networkState then
            -- 有网络连接时才进行下载
            progressOut:setVisible(true)
            doDownloadAndUncompress(updateStableUrl..tostring(updateIndex)..".zip", updateIndex)
        else
            self:showNoNetworkDialog()  
        end
    end


end

-- 显示网络错误对话框
function UpdateScene:showNoNetworkDialog()

    -- 背景的黑色遮罩
    local maskBg = display.newSprite("ui/common/mask_img.png")
    self:addChild(maskBg)
    maskBg:setScale(1000)
    maskBg:setPosition(display.cx, display.cy)
    
    -- 背景图片
    local tipview = display.newSprite("update/bg.png")
        :pos(display.cx, display.cy)
        :addTo(self)

    local width  = tipview:getContentSize().width
    local height = tipview:getContentSize().height

    -- 提示图片
    local title = display.newSprite("update/title.png")
        :pos(width/2, height - 50)
        :addTo(tipview)

    -- 提示文字
    local  tipLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "网络连接失败，请稍后再试...",
        align = cc.ui.TEXT_ALIGN_RIGHT,
        font = GLOBAL_FONTNAME,
        size = 28,
        x = width/2 + 210,
        y = height/2 + 20,
    }):align(display.CENTER_RIGHT)
    :addTo(tipview)
    tipLabel:enableOutline(cc.c4b(0, 0, 0,255), 2)


    -------------------------------- 确认按钮 --------------------------------
    local confirmBtn = cc.ui.UIPushButton.new({normal = "ui/fight/heroRelive/btn.png",
        pressed = "ui/fight/heroRelive/btn_on.png",
        disabled = "ui/fight/heroRelive/btn_on.png"})
        :onButtonClicked(function(...)
            -- print("游戏中点击暂停按钮")
            os.exit()
        end)
        :addTo(tipview)
        :pos(330, 60)
        -- :scale(GLOBAL_FIGHT_UI_SCALE)

    -- 确认文字
    local confirmLabel = cc.ui.UILabel.new({
        UILabelType = 2,
        text = "确认",
        font = GLOBAL_FONTNAME,
        size = 28,
        -- x = diffX - 10,
        -- y = diffY,
    }):align(display.CENTER)
    confirmBtn:setButtonLabel("normal", confirmLabel)
    confirmLabel:enableOutline(cc.c4b(0, 0,0,255), 1)
end

function UpdateScene:tick(dt)
    -- 如果一个文件已经上传完成了
    if oneFileUpdated then
        -- 记录当前下载的是第几个zip文件
        updateIndex = updateIndex + 1
        -- 总共需要下载几个zip文件
        if updateIndex <= needUpdateCount then
            oneFileUpdated = false
            doDownloadAndUncompress(updateStableUrl..tostring(updateIndex)..".zip", updateIndex)
        else
            -- 所有zip文件都已经更新完成了，那么就要切换到开始场景去
            -- 更新本地的版本号文件
            local savePath = getFullPath("version.json")
            local data = {}
            data.version = needUpdateCount
            local s = json.encode(data)
            if (type(s) == "string") then
                io.writefile(savePath, s)
            end
            -- 切换场景
            local BenchmarkScene = require("ui.EnterChooseUI")
            display.replaceScene(BenchmarkScene.new())
        end
    end
end



-- 在onEnter中，做资源的预加载
function UpdateScene:onEnter()
    print("UpdateScene:onEnter")

    do
        return
    end

end



function UpdateScene:onExit()
    print("UpdateScene:onExit")
    display.removeSpriteFrameByImageName(self.imageName)

end

function UpdateScene:removeView()
    -- self.battleUI:removeFromParent()
end




return UpdateScene
