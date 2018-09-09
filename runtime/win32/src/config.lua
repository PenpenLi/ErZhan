
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = false    -- true

-- dump memory info every 10 seconds
DEBUG_MEM = false -- false

-- load deprecated API
LOAD_DEPRECATED_API = true -- false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "landscape"

-- 判定是否需要对本地存储文件进行加解密
if GLOBAL_PUBLISH then
    GLOBAL_NEED_ENCRYPT = true
else
    GLOBAL_NEED_ENCRYPT = false
end

--是否需要新手引导
NEED_NEW_GUIDE = true
-- design resolution
-- CONFIG_SCREEN_WIDTH  = screenWidthInPixels  -- 1280 -- 960
-- CONFIG_SCREEN_HEIGHT = screenHeightInPixels   -- 720     -- 640

-- auto scale mode

-- CONFIG_SCREEN_AUTOSCALE = "SHOW_ALL"    -- "SHOW_ALL"    -- "FIXED_WIDTH"

-- auto scale callback function
CONFIG_SCREEN_AUTOSCALE_CALLBACK = function(screenWidthInPixels, screenHeightInPixels, deviceModel)
    -- if (device.platform == "ios" and device.model == "iphone") or device.platform == "android" then
    --     return nil, nil
    -- end

    -- change by Owen, 2015.11.27, 手机的分辨率是多少，就把设计分辨率设成这个值，然后用SHOW_ALL策略
    -- 保证了场景不被缩放，也就是战斗中的地图不会被缩放
    CONFIG_SCREEN_WIDTH  = screenWidthInPixels
    CONFIG_SCREEN_HEIGHT = screenHeightInPixels

    CONFIG_SCREEN_AUTOSCALE = "SHOW_ALL"    -- "SHOW_ALL"    -- "FIXED_WIDTH"

    -- 根据手机的分辨率，确定大厅UI的缩放比例
    GLOBAL_HALL_UI_SCALE = 1.0
    local minScaleV     = screenWidthInPixels  / 2048
    local minScaleH     = screenHeightInPixels / 1536

    local minScale      = minScaleV

    if minScaleH < minScale then minScale = minScaleH end
    GLOBAL_HALL_UI_SCALE = minScale


    print("GLOBAL_HALL_UI_SCALE = "..tostring(GLOBAL_HALL_UI_SCALE))


    local minScaleV     = screenWidthInPixels  / 1280
    local minScaleH     = screenHeightInPixels / 720
    local minScale      = minScaleV
    if minScaleH < minScale then minScale = minScaleH end
     GLOBAL_HALL_UI_SCALE2 = minScale

    -- add by Owen, 2016.3.11, 大的UI缩放的比例，
    GLOBAL_BIG_UI_SCALE = minScaleV
    if minScaleH > minScaleV then 
        GLOBAL_BIG_UI_SCALE = minScaleH
    end

    print("GLOBAL_HALL_UI_SCALE2 = "..tostring(GLOBAL_HALL_UI_SCALE2))

    -- 如果屏幕的宽度小于1024的话，要做裁剪，也就是屏幕外面的怪物、英雄、塔不用渲染
    if screenWidthInPixels <= 1024 then
        -- GLOBAL_NEED_CLIP = true
    end
    return 1, 1
end
