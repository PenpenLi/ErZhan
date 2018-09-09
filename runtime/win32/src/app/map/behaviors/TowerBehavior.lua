
local TowerProperties           = require("app.properties.TowerProperties")
local SpecialTowerProperties    = require("app.properties.SpecialTowerProperties")
local MapConstants              = require("app.map.MapConstants")
local BehaviorBase              = require("app.map.behaviors.BehaviorBase")
local BuffBase                  = require("app.map.skills.BuffBase")
local SkillFactory              = require("app.map.skills.SkillFactory")
local ObjectState               = require("app.map.ObjectState")
local TowerBehavior = class("TowerBehavior", BehaviorBase)

function TowerBehavior:ctor()
    local depends = {
        "DestroyedBehavior",
        "FireBehavior",
        -- "DecorateBehavior",
    }
    TowerBehavior.super.ctor(self, "TowerBehavior", depends, 100)
end

function TowerBehavior:bind(object)
    -- 增加阵营和碰撞检测的mask
    object.campId_ = MapConstants.TOWER_CAMP
    object.maskId_ = MapConstants.TOWER_CAMP_MASK

    object.towerId_ = object.state_.towerId

    -- buff列表
    object.buffs_={}

    if type(object.towerId_) ~= "string" then object.towerId_ = "" end

    local function getTowerId(object)
        return object.towerId_
    end
    object:bindMethod(self, "getTowerId", getTowerId)

    local function setTowerId(object, towerId)
        -- print("TowerBehavior setTowerId, towerId = "..tostring(towerId))
        object.towerId_ = towerId

        local define = TowerProperties.get(object.towerId_)
        if not define then
            -- change by Owen, 2015.6.26
            define =  SpecialTowerProperties.get(object.towerId_)
            -- object.towerId_ = object.defineId_ .. "L01"
            -- define = TowerProperties.get(object.towerId_)
        end
        if define then
            for k, v in pairs(define) do
                local kn = k .. "_"
                object[kn] = v
                object.state_[k] = v
            end
        end

        -- 把射程的单位由米改为像素
        -- if object.fireRange_ then
        --     -- print("reRange_ = object.fireRange_/100*32")
        --     object.fireRange_ = object.fireRange_/100*32
        --     object.state_.fireRange = object.fireRange_
        -- end

        if object.staticIndex_ then
            local index = object.staticIndex_

            if type(object.state_.offsetX) == "table" then
                object.offsetX_ = object.state_.offsetX[index]
            end
            if type(object.state_.offsetY) == "table" then
                object.offsetY_ = object.state_.offsetY[index]
            end
            if type(object.state_.radiusOffsetX) == "table" then
                object.radiusOffsetX_ = object.state_.radiusOffsetX[index]
            end
            if type(object.state_.radiusOffsetY) == "table" then
                object.radiusOffsetY_ = object.state_.radiusOffsetY[index]
            end
            if type(object.state_.radius) == "table" then
                object.radius_ = object.state_.radius[index]
            end
            if type(object.state_.imageName)  == "table" then
                object.imageName_ = object.state_.imageName[index]
            end
            if type(object.state_.fireOffsetX) == "table" then
                object.fireOffsetX_ = object.state_.fireOffsetX[index]
            end
            if type(object.state_.fireOffsetY) == "table" then
                object.fireOffsetY_ = object.state_.fireOffsetY[index]
            end
            if type(object.state_.fireOffsetX2) == "table" then
                object.fireOffsetX2_ = object.state_.fireOffsetX2[index]
            end
            if type(object.state_.fireOffsetY2) == "table" then
                object.fireOffsetY2_ = object.state_.fireOffsetY2[index]
            end
            if type(object.state_.fireOffsetX_L) == "table" then
                object.fireOffsetX_L_ = object.state_.fireOffsetX_L[index]
            end
            if type(object.state_.fireOffsetY_L) == "table" then
                object.fireOffsetY_L_ = object.state_.fireOffsetY_L[index]
            end
        end

        -- 保存物体的基础属性
        BuffBase.restoreOriginalPro(object)
    end
    object:bindMethod(self, "setTowerId", setTowerId)

    -- add by Owen, 2015.8.10, 初始化塔的技能
    -- 在TowerLocationBehavior:addTower() 函数中，新建塔的时候会调用
    -- 在TowerBehavior:upLevel() 函数中，塔升级的时候会调用
    local function initTowerSkillAndBuff(object, mapRuntime)
        SkillFactory.initSkillAndBuff(object, mapRuntime)
    end
    object:bindMethod(self, "initTowerSkillAndBuff", initTowerSkillAndBuff)

    -- 塔死亡的时候做一些处理，显示死亡图片，隐藏掉子弹
    -- local function showDestroyedStatus(object, skipAnim)
    --     object:getView():setVisible(false)
    --     -- TO-DO 显示塔死亡的图片
    --     -- object:getDecoration(object.defineId_ .. "Destroyed"):getView():setVisible(true)

    --     local decorationName = object:getDefineId() .. "Fire"
    --     if object:isDecorationExists(decorationName) then
    --         local decoration = object:getDecoration(decorationName)
    --         decoration:setVisible(false)
    --     end

    --     local decorationName = object:getDefineId() .. "Fire2"
    --     if object:isDecorationExists(decorationName) then
    --         local decoration = object:getDecoration(decorationName)
    --         decoration:setVisible(false)
    --     end
    -- end
    -- object:bindMethod(self, "showDestroyedStatus", showDestroyedStatus)

    -- local function hideDestroyedStatus(object, skipAnim)
    --     object:getView():setVisible(true)
    --     object:getDecoration(object.defineId_ .. "Destroyed"):getView():setVisible(false)
    -- end
    -- object:bindMethod(self, "hideDestroyedStatus", hideDestroyedStatus)

    local function vardump(object, state)
        state.towerId = object.towerId_
        return state
    end
    object:bindMethod(self, "vardump", vardump)

    -- 升级塔，2015.4.27新加, 在TowerControlPanel:onClickBuildBtn中调用
    local function upLevel(object, nextID)
        -- print("TowerBehavior upLevel, towerId = "..tostring(object.mainID)..
        --     " level = "..tostring(object.level_).." nextID = "..tostring(nextID))

        local define = TowerProperties.get(nextID)

        if define then
            for k, v in pairs(define) do
                local kn = k .. "_"
                object[kn] = v
                object.state_[k] = v
            end
        end

        if object.staticIndex_ then
            local index = object.staticIndex_

            if type(object.state_.offsetX) == "table" then
                object.offsetX_ = object.state_.offsetX[index]
                -- print("object.offsetX_ = "..tostring(object.offsetX_))
            end
            if type(object.state_.offsetY) == "table" then
                object.offsetY_ = object.state_.offsetY[index]
            end
            if type(object.state_.radiusOffsetX) == "table" then
                object.radiusOffsetX_ = object.state_.radiusOffsetX[index]
            end
            if type(object.state_.radiusOffsetY) == "table" then
                object.radiusOffsetY_ = object.state_.radiusOffsetY[index]
            end
            if type(object.state_.radius) == "table" then
                object.radius_ = object.state_.radius[index]
            end
            if type(object.state_.imageName)  == "table" then
                object.imageName_ = object.state_.imageName[index]
            end
            if type(object.state_.fireOffsetX) == "table" then
                object.fireOffsetX_ = object.state_.fireOffsetX[index]
            end
            if type(object.state_.fireOffsetY) == "table" then
                object.fireOffsetY_ = object.state_.fireOffsetY[index]
            end
            if type(object.state_.fireOffsetX2) == "table" then
                object.fireOffsetX2_ = object.state_.fireOffsetX2[index]
            end
            if type(object.state_.fireOffsetY2) == "table" then
                object.fireOffsetY2_ = object.state_.fireOffsetY2[index]
            end
            if type(object.state_.fireOffsetX_L) == "table" then
                object.fireOffsetX_L_ = object.state_.fireOffsetX_L[index]
            end
            if type(object.state_.fireOffsetY_L) == "table" then
                object.fireOffsetY_L_ = object.state_.fireOffsetY_L[index]
            end
        end
        -- 保存物体的基础属性
        BuffBase.restoreOriginalPro(object)
        -- add by Owen, 2015.8.10, 初始化塔的技能
        object:initTowerSkillAndBuff(object.mapRuntime_)
        -- add by Owen, 2015.8.18, 祭坛塔升级以后，加钱的时间要重新计算
        if object.addGold_[1] ~= 0 then
            object.addGoldCooldown = object.addGold_[2]
        end
        -- add by Owen, 2016.2.16, 升级以后要把状态置为Idle
        object:setState(ObjectState.IDLE)
    end
    object:bindMethod(self, "upLevel", upLevel)
end

function TowerBehavior:unbind(object)
    object.towerId_ = nil

    object:unbindMethod(self, "getTowerId")
    object:unbindMethod(self, "setTowerId")
    object:unbindMethod(self, "initTowerSkillAndBuff")
    -- object:unbindMethod(self, "showDestroyedStatus")
    -- object:unbindMethod(self, "hideDestroyedStatus")
    object:unbindMethod(self, "vardump")
end

function TowerBehavior:reset(object)
    object:setTowerId(object:getTowerId())
end

return TowerBehavior
