
local Tips = class("ui.Tips", function ()
    return require("ui.Container").new()
end)


-- 默认大小参数
Tips.DEFAULT_BG = {src="Common.Tips_bg", anchor="0,0", scale9Grid=true}

-- 创建一个新的 Tips
-- @param width 宽，默认是全屏宽
-- @param height 高，默认是全屏高
function Tips:ctor(params)
    self:setAnchorPoint(ccp(0.5, 0.5))
    self:setIgnoreAnchorPointForPosition(false)
    self:setTouchEnabled(false)
    self:setIsBubble(false)
    self:setSize(params.width or ConfigManager.getGlobalConfig("designScreenWidth"), params.height or ConfigManager.getGlobalConfig("designScreenHeight"))
   
end

-- 设置背景
function Tips:setBg(params)
    params = table.merge(clone(Tips.DEFAULT_BG), params or {})
    if (params.width == nil) then
        params.width = self:getWidth()
    end

    if (params.height == nil) then
        params.height = self:getHeight()
    end
    params.parent = self
    self.bg = LayoutParser.createSprite(params)
    self.bg:setCascadeOpacityEnabled(true)
    self.bg:setCascadeColorEnabled(true)
    

    
    return self.bg
end

function Tips:setText(params)
    if not self.text then
        params.parent = self
        
        self.text = LayoutParser.createLabel2(params)
        
        
    
        self.text:setCascadeOpacityEnabled(true)
        self.text:setCascadeColorEnabled(true)
        
        local width = self.text:getContentSize().width + 60
        local height = self.text:getContentSize().height +16
        local old_width = self:getWidth()
        local old_height = self:getHeight()
        
        self:setSize(width,height)
        if self.bg then
         --   self.bg:setScaleX(width/old_width)
        --    self.bg:setScaleY(height/old_height)
            self.bg:setContentSize(CCSize(width,height))
        end
        
        self.text:setPosition(ccp(self:getWidth()/2.0,self:getHeight()/2.0))
    end
    self.text:setString(params.text)
end



return Tips

