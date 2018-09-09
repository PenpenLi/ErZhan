
--[[
collectgarbage (opt [, arg])
　　功能：是垃圾收集器的通用接口，用于操作垃圾收集器
　　参数：
　　opt：操作方法标志
　　"Stop": 停止垃圾收集器
　　"Restart": 重启垃圾收集器
　　"Collect": 执行一次全垃圾收集循环
　　"Count": 返回当前Lua中使用的内存量(以KB为单位)
　　"Step": 单步执行一个垃圾收集. 步长 "Size" 由参数arg指定　(大型的值需要多步才能完成)，
		如果要准确指定步长，需要多次实验以达最优效果。如果步长完成一次收集循环，将返回True
　　"Setpause": 设置 arg/100 的值作为暂定收集的时长,并返回设置前的值。默认为200。
        控制了收集器在开始一个新的收集周期之前要等待多久。 
        随着数字的增大就导致收集器工作工作的不那么主动。 
        小于 1 的值意味着收集器在新的周期开始时不再等待。 
        当值为 2 的时候意味着在总使用内存数量达到原来的两倍时再开启新的周期。
　　"Setstepmul": 设置 arg/100 的值，作为步长的增幅(即新步长=旧步长*arg/100)
        作为步长的增幅(即新步长=旧步长*arg/100);并返回设置前的值。默认为200。
        控制了收集器的工作速度，这个速度是一个相对于内存分配的速度。
        更大的数字将导致收集器工作的更主动的同时，也使每步收集的尺寸增加。
        小于 1 的值会使收集器工作的非常慢，可能导致收集器永远都结束不了当前周期。
        缺省值为200%，这意味着收集器将以内存分配器的两倍速运行
]]

-- 设置多久执行一次垃圾回收
collectgarbage("step",1000)
collectgarbage("setpause", 101)    -- 默认为200，表示内存使用达到原来的两倍时开始回收
collectgarbage("setstepmul", 200)

--是否正式版 （开启新手引导 关卡开启加限制）
GLOBAL_PUBLISH = true

------------------------- VS 调试的时候在output窗口中输出lua 的print 信息 ---------------------
function babe_tostring(...)
    local num = select("#",...);
    local args = {...};
    local outs = {};
    for i = 1, num do
        if i > 1 then
            outs[#outs+1] = "\t";
        end
        outs[#outs+1] = tostring(args[i]);
    end
    return table.concat(outs);
end

local babe_print = print;
local babe_output = function(...)
    babe_print(...);

    if decoda_output ~= nil then
        local str = babe_tostring(...);
        decoda_output(str);
    end
end
print = babe_output;

---------------------- VS 调试的时候在output窗口中输出lua 的print 信息 END ------------------


function __G__TRACKBACK__(errorMessage)
    if not GLOBAL_PUBLISH then
        local a = "----------------------------------------".."\n"
        local b = "LUA ERROR: " .. tostring(errorMessage) .. "\n"
        local c = debug.traceback("", 2).."\n"
        print(a..b..c..a)
        LogToAndroid:WriteLog(a..b..c..a)
    end
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

package.path = package.path .. ";src/"
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("res/")


require("config")
require("cocos.init")
require("framework.init")

-- 本地存储
UserLocalStorage = require("tools.LocalStorage").new("mine")

require("utils")
require("tools.EventNames")
require("tools.tableFunc")
require("tools.NotifyCenter")

print("Language = "..tostring(Language))

require("tools.AudioMgr")

-- change by Owen, 2016.5.10, 语言包放到hallScene里面去Require
-- WordLanguage = require("tools.Language")
require("goodsGive")

display.addSpriteFrames("SheetMapBattle.plist", "SheetMapBattle.png")
display.addSpriteFrames("SheetEditor.plist", "SheetEditor.png")
-- display.addSpriteFrames("AllSprites.plist", "AllSprites.png")
display.addSpriteFrames("mapeditor/MapEditor.plist", "mapeditor/MapEditor.png")
-- display.addSpriteFrames("HalloweenLycan.plist", "HalloweenLycan.png")

-- display.replaceScene(require("editor.EditorScene").new())

-- 这个值在MapCamera中会重新赋值
GLOBAL_FIGHT_UI_SCALE = 1
-- if device.model == "ipad" or device.platform == "windows" and display.width == 1024 then 
--     -- ipad1的话放大2倍
--     print("hahaha camera:setScale(0.5)")
--     GLOBAL_FIGHT_UI_SCALE = 0.5
-- end

-- add by Owen, 2015.7.28, 添加一个手机版代码的宏
GLOBAL_MOBILE_UI_CODE = true

-- add by Owen, 2016.4.20, 添加PC版是否要显示PC版内容的宏, true的时候，表示显示的是PC版
GLOBAL_SHOW_WIN_TYPE  = false

-- 定义全局的字体
if device.platform == "ios"then
    GLOBAL_FONTNAME = "HelveticaNeue-Bold"
elseif device.platform == "android"then
    GLOBAL_FONTNAME = "fonts/FZZUNYY.TTF"    -- "DroidSerif-Bold"
else
    GLOBAL_FONTNAME = "fonts/FZZUNYY.TTF"    -- "fonts/Yahei Consolas Hybrid.ttf"
    local glview = cc.Director:getInstance():getOpenGLView()
    glview:setCursorVisible(false)
end
--GLOBAL_FONTNAME = "fonts/FZZUNYY.TTF"
-- 把图片置为灰色
function EnableGraySprite(sprite)
    local vertDefaultSource = "\n"..
    "attribute vec4 a_position; \n" ..
    "attribute vec2 a_texCoord; \n" ..
    "attribute vec4 a_color; \n"..                                                    
    "#ifdef GL_ES  \n"..
    "varying lowp vec4 v_fragmentColor;\n"..
    "varying mediump vec2 v_texCoord;\n"..
    "#else                      \n" ..
    "varying vec4 v_fragmentColor; \n" ..
    "varying vec2 v_texCoord;  \n"..
    "#endif    \n"..
    "void main() \n"..
    "{\n" ..
    "gl_Position = CC_PMatrix * a_position; \n"..
    "v_fragmentColor = a_color;\n"..
    "v_texCoord = a_texCoord;\n"..
    "}"
     
    local pszFragSource = "#ifdef GL_ES \n" ..
    "precision mediump float; \n" ..
    "#endif \n" ..
    "varying vec4 v_fragmentColor; \n" ..
    "varying vec2 v_texCoord; \n" ..
    "void main(void) \n" ..
    "{ \n" ..
    "vec4 c = texture2D(CC_Texture0, v_texCoord); \n" ..
    "gl_FragColor.xyz = vec3(0.4*c.r + 0.4*c.g +0.4*c.b); \n"..
    "gl_FragColor.w = c.w; \n"..
    "}"
 
    local pProgram = cc.GLProgram:createWithByteArrays(vertDefaultSource,pszFragSource)
     
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_POSITION,cc.VERTEX_ATTRIB_POSITION)
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_COLOR,cc.VERTEX_ATTRIB_COLOR)
    pProgram:bindAttribLocation(cc.ATTRIBUTE_NAME_TEX_COORD,cc.VERTEX_ATTRIB_FLAG_TEX_COORDS)
    pProgram:link()
    pProgram:updateUniforms()
    sprite:setGLProgram(pProgram)
end

function DisableGraySprite(sprite)
    sprite:setGLProgramState(cc.GLProgramState:getOrCreateWithGLProgram(cc.GLProgramCache:getInstance():getGLProgram("ShaderPositionTextureColor_noMVP")))
end


-- C++中的mapRuntimeC只需要新建一个
GLOBAL_MapRuntimeC = MapRuntimeC:create()
GLOBAL_MapRuntimeC:retain()
require "viewMgr.lua"
require "sdk.umeng.lua"

-- add by Owen, 2016.6.17, 调用一下友盟sdk的打开游戏的接口
umengSdk.setLogin_1()

local BenchmarkScene = require("ui.EnterChooseUI")
display.replaceScene(BenchmarkScene.new())
-- local gameScene = require("hall.HallScene")
-- display.replaceScene(gameScene.new())
-- display.replaceScene(require("app.TestUIListViewScene").new())
-- display.replaceScene(require("editor.EditorScene").new({mapId="A0002", modeId = 1}))
