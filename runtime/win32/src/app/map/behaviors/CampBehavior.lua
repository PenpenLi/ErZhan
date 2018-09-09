
-- change by Owen, 2016.1.12 已废弃

local MapConstants = require("app.map.MapConstants")

local BehaviorBase = require("app.map.behaviors.BehaviorBase")
local CampBehavior = class("CampBehavior", BehaviorBase)

function CampBehavior:ctor()
    CampBehavior.super.ctor(self, "CampBehavior", nil, 1)
end

function CampBehavior:bind(object)
    object.campId_ = checkint(object.state_.campId)
    -- change by Owen, 设置阵营，改为如果没有配置阵营，就是中立的NO_CAMP，
    -- 中立生物和谁都不会进行碰撞检测
    -- if object.campId_ ~= MapConstants.ENEMY_CAMP and object.campId_ ~= MapConstants.PLAYER_CAMP then
    --     object.campId_ = MapConstants.ENEMY_CAMP
    -- end
    if not object.campId_ then
        object.campId_ = MapConstants.NO_CAMP
    end

    local function getCampId(object)
        return object.campId_
    end
    object:bindMethod(self, "getCampId", getCampId)

    local function getMaskId(object)
        return object.maskId_
    end
    object:bindMethod(self, "getMaskId", getMaskId)
    
    local function campCheck(object,target)
        if object:hasBehavior("MonsterBehavior") and target:hasBehavior("HeroBehavior") then
            return true
        else
            return false
        end

        if object:hasBehavior("HeroBehavior") and target:hasBehavior("MonsterBehavior") then
            return true
        else
            return false
        end

        if object:hasBehavior("TowerBehavior") and target:hasBehavior("MonsterBehavior") then
            return true
        else
            return false
        end

        -- return Math2dC:andOperation(object.maskId_,target.campId_)
    end
    object:bindMethod(self, "campCheck", campCheck)
    
    local function canAttack(object, target)
        if (object:hasBehavior("HeroBehavior") or object:hasBehavior("SoldierBehavior")) then
            -- 英雄和塔可以攻击小怪和 BOSS, 不能攻击逃跑怪
            return (target:hasBehavior("MonsterBehavior") or target:hasBehavior("BossBehavior") )
        elseif (object:hasBehavior("TowerBehavior")) then
            -- 这里用来判定塔的溅射伤害，范围内的这些单位都要溅射到
            return (target:hasBehavior("MonsterBehavior") or target:hasBehavior("BossBehavior") )
        elseif object:hasBehavior("MonsterBehavior") then
            -- 小怪可以攻击英雄
            return target:hasBehavior("HeroBehavior")
        elseif (object:hasBehavior("BossBehavior")) then
            -- BOSS 可以攻击英雄和塔
            return target:hasBehavior("HeroBehavior") or target:hasBehavior("SoldierBehavior")
        end
    end
    object:bindMethod(self, "canAttack", canAttack)

    local function vardump(object, state)
        state.campId = object.campId_
        return state
    end
    object:bindMethod(self, "vardump", vardump)
end

function CampBehavior:unbind(object)
    object.campId_ = nil
    object:unbindMethod(self, "getCampId")
    object:unbindMethod(self, "vardump")
end

return CampBehavior
