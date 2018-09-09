
local GlobalData            = require("tools.GlobalData")
local EffectAniCache        = require("app.map.spine.EffectAniCache")
local scheduler = cc.Director:getInstance():getScheduler()
cc.c4fFromc4b = function (c4b)
	return cc.c4f(c4b.r/255.0, c4b.g/255.0, c4b.b/255.0, c4b.a/255.0)
end

-- SpriteBatchNode
cc.Node.reorderChild = function(self, sp, zorder)
	sp:setLocalZOrder(zorder)
end

utils = {}

if cc.NVGDrawNode then
	utils.useNVGDrawNode = true
end

function utils.drawCircle(radius, params)
	if utils.useNVGDrawNode then
		params = params or {}
		local posX = params.x or 0
        local posY = params.y or 0
        local borderColor = params.borderColor or cc.c4f(1, 1, 1, 1)

		local drawNode = cc.NVGDrawNode:create()
		drawNode:setLineWidth(0.5)
		drawNode:drawCircle(cc.p(posX, posY), radius, borderColor)

		return drawNode
	else
		return display.newCircle(radius, params)
	end
end

function utils.drawRect(rect, params)
	if not rect then
	end

	if utils.useNVGDrawNode then
		params = params or {}
        local borderColor = params.borderColor or cc.c4f(1, 1, 1, 1)

		local drawNode = cc.NVGDrawNode:create()
		if params.borderWidth then
			drawNode:setLineColor(params.borderWidth)
		end
		if params.fillColor then
			drawNode:setFillColor(params.fillColor)
			drawNode:setFill(true)
		end
		drawNode:drawRect(cc.p(rect.x, rect.y),
			cc.p(rect.x, rect.y + rect.height),
			cc.p(rect.x + rect.width, rect.y + rect.height),
			cc.p(rect.x + rect.width, rect.y),
			borderColor)

		return drawNode
	else
		return display.newRect(radius, params)
	end
end

function utils.drawPolygon(points)
	if utils.useNVGDrawNode then
		local path = {}

		for _, v in ipairs(points) do
			table.insert(path, cc.p(v[1], v[2]))
		end

		params = params or {}
        local borderColor = params.borderColor or cc.c4f(1, 1, 1, 1)

		local drawNode = cc.NVGDrawNode:create()
		drawNode:setLineWidth(0.5)
		drawNode:drawPolygon(path, #path, false, borderColor);

		return drawNode
	else
		return display.newPolygon(points)
	end
end
--判断平台读取相应资源
--path 路径或字段名
--exName 扩展名
function utils.getName(path,exName)
    exName = exName or nil
    local globalData = require("tools.GlobalData")
    local curStr = globalData.getLanguage()
    local str = string.format("%s_%s",path,curStr)
    if exName then
        str = string.format("%s.%s",str,exName)
    else
    end
    return str
end
--弹出式界面需要播放一个动作
function utils.playAction(root,panel,isChoose )
    if root then
        if panel then
            panel:setScale(1000)  
        end       
        local function actBack()
            return true
        end
        local scale = 1
        -- change by Owen, 2016.6.12, 只有要显示win上的页面的时候，
        -- 有弹出特效的UI才需要缩放0.8
        if GLOBAL_SHOW_WIN_TYPE and (device.platform == "mac" or device.platform == "windows") then
            scale = 0.8
        else
            scale = GLOBAL_HALL_UI_SCALE2
        end
        root:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1,scale),cc.CallFunc:create(actBack)))
    end
end
--换鼠标图 播放动作
--isNormal 是否是正常鼠标
--图片路径
--图片缩放比例
function utils.changeMouse(isNormal,path,scale)
    path = path or "ui/common/finger.png"
    local mouse = viewMgr.find(viewMgr.def.MOUSE_UI)
    local image = mouse:getChildByName("mouseImage")
    scale = scale or 1
    if not isNormal then
        local changeImage = ccui.ImageView:create(path)
        changeImage:setScale(scale)
        changeImage:setName("changeImage")
        changeImage:setCascadeOpacityEnabled(false)
        changeImage:runAction(cc.RepeatForever:create(cc.RotateBy:create(2, 360)))
        local size = image:getContentSize()
        changeImage:setPosition(cc.p(size.width/2,size.height/2))
        image:addChild(changeImage)
        image:setOpacity(0)
    else
        image:setOpacity(255)
        if image:getChildByName("changeImage") then
            image:getChildByName("changeImage"):removeFromParent()
        end
    end
end
--创建一个上飘消失的文字
function utils.createAniFont(str,node,fontSize,fontName,pos,scale,flyTime, notNeedTouch)
    local function unpause()
        if node:getChildByName("AniText") then
            if utils.schedulerEntry then
                scheduler:unscheduleScriptEntry(utils.schedulerEntry)
                utils.schedulerEntry = nil
            end
            --return
        end
        fontSize = fontSize or 20
        fontName = fontName or GLOBAL_FONTNAME
    
        -- change by Owen, 2016.6.26, 默认为不缩放
        if not scale then
            scale = 1.0
        end
        -- change by Owen, 2016.6.26, 默认为飞行1秒之后消失
        if not flyTime then
            flyTime = 1.0
        end

        if node then
            local text = ccui.Text:create(str,fontName,fontSize)
            text:setName("AniText")
            local frame = ccui.ImageView:create("ui/getTips/frame.png")
            local textSize = text:getContentSize()
            frame:setScaleX(0.8)
            frame:setScaleY(0.2)
            frame:setPosition(cc.p(textSize.width/2,textSize.height/2))
            text:addChild(frame,-1)
            if pos == nil then
                local size = node:getContentSize()
                text:setPosition(size.width/2,size.height-10)
            else
                text:setPosition(pos)
            end
            text:setScale(scale)
            node:addChild(text,10)
            local move = cc.MoveBy:create(flyTime,cc.p(0,50))
            local function later()
                if text then
                    -- change by Owen, 2016.7.16, 第7关模式3战斗页面飘字动画不用设置能否点击
                    if not notNeedTouch then
                        node:setTouchEnabled(true)
                    end
                    if utils.schedulerEntry then
                        scheduler:unscheduleScriptEntry(utils.schedulerEntry)
                        utils.schedulerEntry = nil
                    end
                   text:removeFromParent()
                end
            end
            local action = cc.Sequence:create(move,cc.CallFunc:create(later))
            text:runAction(action)
            -- change by Owen, 2016.7.16, 第7关模式3战斗页面飘字动画不用设置能否点击
            if not notNeedTouch then
                node:setTouchEnabled(false)
            end
        end
    end
    if utils.schedulerEntry == nil then
       utils.schedulerEntry = scheduler:scheduleScriptFunc(unpause,0,false)
    end
end

-- add by Owen, 2016.6.15, 获得友盟统计的关卡ID
-- change by Owen, 2016.7.11, 由于友盟自定义事件, 每一个参数只支持10个赋值，
--    所以所有的自定义事件都改为获得4-14关模式1简单难度，其他模式下都不发送自定义事件
-- isUserDef 参数表示是否是自定义事件
function utils.getSDKLevelID(isUserDef)
    local level    = GlobalData.getGameLv()
    local levelOri = level
    local mode     = GlobalData.getGameMode()
    local hard     = GlobalData.getHardMode()    -- 这一关的难度
    if mode == 1 then
        if hard == 1 then
            level = level.."01"
        else
            level = level.."02"
        end
    elseif mode == 2 then
        level = level.."03"
    elseif mode == 3 then
        level = level.."04"
    end
    level = "level_"..level

    -- 只有在4-14关模式1简单难度，才发友盟自定义事件，
    -- 其他模式下都不发送自定义事件
    if isUserDef then
        -- 如果是友盟的用户自定义事件
        if levelOri >= 3 and  levelOri <= 12
            and mode == 1 and hard == 1 then
                return level
        else
            return nil
        end
    else
        return level
    end
    
end
--判断是否超过一天
function utils.isExcDay(lastTime)
    local theTime = os.time()
    --local distance = (theTime - lastTime)
    local day_1 = math.floor(theTime/86400)
    local day_2 = math.floor(lastTime/86400)
    if day_1 and day_2 then
        local distance = day_1 - day_2
        if distance >= 1 then
            return true
        else
            return false
        end
    else
        return false
    end
end
--总天数倒计时
function utils.totalTime(totalTime)
    local curTime = (totalTime - os.time())
    local day  = math.floor(curTime/86400)
    local hour = math.floor((curTime%86400)/3600)
    local minute = math.floor((curTime%86400 - hour*3600)/60)
    local second = math.floor((curTime%86400 - hour*3600-minute*60))
    local str = string.format("%d天%d:%d:%d",day,hour,minute,second)
    local timeExist = true
    if day < 0 or hour < 0 or minute < 0 or second < 0 then
        timeExist = false
    end
    return str,timeExist 
end
--是否激活了格若尔
function getGeruoerState()
    local GlobalData = require("tools.GlobalData")
    return GlobalData.getGrlState()
end

