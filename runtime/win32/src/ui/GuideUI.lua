--region NewFile_1.lua
--Author : admin
--Date   : 2016/4/18
--此文件由[BabeLua]插件自动生成
local GuideUI = class("ui.GuideUI")
--title 标题
--Type 1.关闭按钮 2.×按钮
--imageTable 图片路径{"xxx","yyy"}

function GuideUI:ctor(onSelf,Type,image,titleImage,btnImage,func)
    
    local reslut = import("ui.GuideStudio.lua").create()
    self.page = reslut.root
    --local path = utils.getName("")
    local frameImage = ccui.ImageView:create(image)
    local frameSize = frameImage:getContentSize()
    self.page:addChild(frameImage)
    local imageTitle = ccui.ImageView:create(titleImage)
    local titleSize = imageTitle:getContentSize()
    imageTitle:setPosition(0,frameSize.height/2-titleSize.height/2)
    self.page:addChild(imageTitle)
    
    if Type == 1 then
        --local path = utils.getName("")
        local btn = ccui.Button:create(btnImage[1],btnImage[2],btnImage[3])
        local size = btn:getContentSize()
        btn:setPosition(cc.p(frameSize.width/2+50,-frameSize.height/2+size.height/2))
        self.page:addChild(btn)
        if func then
            local callBack = function()
                func()
            end
            btn:addClickEventListener(callBack)
        end
    elseif Type == 2 then
        local btn = ccui.Button:create(btnImage[1],btnImage[2],btnImage[3])
        local size = btn:getContentSize()
        btn:setPosition(cc.p(frameSize.width/2+50,frameSize.height/2-size.height/2))
        self.page:addChild(btn)
        local function closeFunc(sender)
            viewMgr.hide(viewMgr.def.GUIDE_UI)
        end
        btn:addClickEventListener(closeFunc)
    end
end
function GuideUI:getPage()
    return self.page
end
return GuideUI
--endregion
