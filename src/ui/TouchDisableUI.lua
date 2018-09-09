local TouchDisableUI = class("ui.TouchDisableUI")

function TouchDisableUI:ctor()
    local clickBack = function(luaFileName,node,callbackName)  
        if callbackName == "ClickEvent" then
            return function ()
               
            end         
        end      
    end
    local result = import("ui.TouchDisableStudio").create(clickBack)
    self.page = result.root
    local Panel = result.Image_2
    utils.playAction(self.page,Panel,true)
end
function TouchDisableUI:getPage()
    return self.page
end

return TouchDisableUI
