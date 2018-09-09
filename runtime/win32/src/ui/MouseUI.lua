--region NewFile_1.lua
--Author : 王钢蛋
--Date   : 2016/4/15
local MouseUI = class("MouseUI", function()
    return display.newNode()
end)

function MouseUI:ctor()
    
    local image = ccui.ImageView:create("ui/common/finger.png")
    image.state = true
    image:setName("mouseImage")
    image:setRotation(10)
    -- 添加鼠标的横向偏移
    local diffX = 15
    local imageSize = image:getContentSize()
    self:setAnchorPoint(cc.p(1,1))
    self:addChild(image)
    local scene = display.getRunningScene()
    local function clickUp(touch,event)
        if image.state then
            image:loadTexture("ui/common/finger.png")
        end
        local pos = touch:getLocation()        
        local curPos = self:convertToNodeSpace(pos)
        image:setPosition(cc.p(curPos.x + diffX,-curPos.y-imageSize.height/2))
    end
    local function move(touch,event)
        local pos = touch:getLocation()
        local curPos = self:convertToNodeSpace(pos)
        local anchor = image:getAnchorPoint().y
        image:setPosition(cc.p(curPos.x + diffX,-curPos.y-imageSize.height/2))
    end
    local function click(touch,event)
        if image.state then
            image:loadTexture("ui/common/fingerClick.png")
        end
        local pos = touch:getLocation()
        local curPos = self:convertToNodeSpace(pos)
        image:setPosition(cc.p(curPos.x + diffX,-curPos.y-imageSize.height/2))
    end
    local listener = cc.EventListenerMouse:create()
    listener:registerScriptHandler(clickUp,cc.Handler.EVENT_MOUSE_UP )
    listener:registerScriptHandler(move,cc.Handler.EVENT_MOUSE_MOVE )
    listener:registerScriptHandler(click,cc.Handler.EVENT_MOUSE_DOWN )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,self)
end
function MouseUI:getPage()
    return self
end

return MouseUI