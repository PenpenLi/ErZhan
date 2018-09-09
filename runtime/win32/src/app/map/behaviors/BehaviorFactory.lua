
local behaviorsClass = {
    CollisionBehavior          = require("app.map.behaviors.CollisionBehavior"),
    CampBehavior               = require("app.map.behaviors.CampBehavior"),
    DecorateBehavior           = require("app.map.behaviors.DecorateBehavior"),
    BuildingBehavior           = require("app.map.behaviors.BuildingBehavior"),
    FireBehavior               = require("app.map.behaviors.FireBehavior"),
    MovableBehavior            = require("app.map.behaviors.MovableBehavior"),
    DestroyedBehavior          = require("app.map.behaviors.DestroyedBehavior"),
    TowerBehavior              = require("app.map.behaviors.TowerBehavior"),
    NPCBehavior                = require("app.map.behaviors.NPCBehavior"),

    PathEditorBehavior         = require("app.map.behaviors.PathEditorBehavior"),
    RangeEditorBehavior        = require("app.map.behaviors.RangeEditorBehavior"),
    StaticObjectEditorBehavior = require("app.map.behaviors.StaticObjectEditorBehavior"),

    TowerLocationBehavior      = require("app.map.behaviors.TowerLocationBehavior"),
    TowerLocationEditorBehavior= require("app.map.behaviors.TowerLocationEditorBehavior"),
    RangeObjectEditorBehavior  = require("app.map.behaviors.RangeObjectEditorBehavior"),
    TowerObjectEditorBehavior  = require("app.map.behaviors.TowerObjectEditorBehavior"),
    RoadEditorBehavior         = require("app.map.behaviors.RoadEditorBehavior"),
    MonsterBehavior            = require("app.map.behaviors.MonsterBehavior"),
    HeroBehavior               = require("app.map.behaviors.HeroBehavior"),
}

local BehaviorFactory = {}

function BehaviorFactory.createBehavior(behaviorName)
    local class = behaviorsClass[behaviorName]
    assert(class ~= nil, string.format("BehaviorFactory.createBehavior() - Invalid behavior name \"%s\"", tostring(behaviorName)))
    return class.new()
end

local allStaticObjectBehaviors = {
    BuildingBehavior  = true,
    CampBehavior      = true,
    CollisionBehavior = true,
    DecorateBehavior  = true,
    DestroyedBehavior = true,
    FireBehavior      = true,
    MovableBehavior   = true,
    NPCBehavior       = true,
    TowerBehavior     = true,

    TowerLocationBehavior       = true,
    TowerLocationEditorBehavior = true,
    TowerObjectEditorBehavior   = true,
    RoadEditorBehavior          = true,
    MonsterBehavior             = true,
    HeroBehavior                = true,
}

function BehaviorFactory.getAllStaticObjectBehaviorsName()
    return table.keys(allStaticObjectBehaviors)
end

function BehaviorFactory.isStaticObjectBehavior(behaviorName)
    return allStaticObjectBehaviors[behaviorName]
end

return BehaviorFactory
