
#ifndef __MAP_RUNTIME_C_H_
#define __MAP_RUNTIME_C_H_

#include "cocos2d.h"
#include "CCLuaEngine.h"
#include <string>

extern "C" {
#include "lua.h"
}

#define NS_MAP_GAME_LUABINDING_BEGIN namespace GameLuabinding {
#define NS_MAP_GAME_LUABINDING_END }

using namespace std;
using namespace cocos2d;

//NS_MAP_GAME_LUABINDING_BEGIN

#ifndef kMapRuntimeDebug
#define kMapRuntimeDebug                0
#endif

#define kMapObjectClassIndexPath        1
#define kMapObjectClassIndexCrossPoint  2
#define kMapObjectClassIndexRange       3
#define kMapObjectClassIndexStatic      4
#define kMapObjectClassIndexStandRange  5
#define kMapObjectClassIndexPoint       6   

#define kMapEventCollisionBegan         1
#define kMapEventCollisionEnded         2
#define kMapEventCollisionFire          3
#define kMapEventCollisionNoTarget      4


#define MAPRUNTIME_C_DISTS_TABLE_KEY        "dists"
#define MAPRUNTIME_C_COLLISIONS_TABLE_KEY   "collisions"

// 定义阵营
#define NO_CAMP							0
#define TOWER_CAMP						1
#define HERO_CAMP						2
#define SOLDIER_CAMP					4
#define MONSTER_CAMP					8
#define BOSS_CAMP						16
#define KING_CAMP						32

// 定义物体的状态
#define ObjectState_NULL				0
#define ObjectState_MOVE				2
#define ObjectState_IDLE				3
#define ObjectState_TRACK				4
#define ObjectState_FAR_ATTACK			5
#define ObjectState_ATTACK				6
#define ObjectState_STOP				7
#define ObjectState_RELEASE_SKILL		8
#define ObjectState_COMA				9
#define ObjectState_PATROL				10
#define ObjectState_MOVE_TO_PATROL		11

#define GET_OBJ_PROP_FLOAT(name, key)       lua_pushstring(L, key); \
                                            lua_rawget(L, -2); \
                                            float name = lua_tonumber(L, -1); \
                                            lua_pop(L, 1);

#define GET_OBJ_PROP_INT(name, key)         lua_pushstring(L, key); \
                                            lua_rawget(L, -2); \
                                            int name = lua_tointeger(L, -1); \
                                            lua_pop(L, 1);

#define GET_OBJ_PROP_BOOL(name, key)        lua_pushstring(L, key); \
                                            lua_rawget(L, -2); \
                                            bool name = lua_toboolean(L, -1); \
                                            lua_pop(L, 1);

#define GET_OBJ_PROP_STRING(name, key)      lua_pushstring(L, key); \
                                            lua_rawget(L, -2); \
                                            std::string name = lua_tostring(L, -1); \
                                            lua_pop(L, 1);


struct LuaObject {  //class S 效果一样
	std::string		id_;
	int				index_;
	int             classIndex_;
	bool			destroyed_;
	bool			collisionEnabled_;
	int				collisionLock_;
	float			radius_;
	float			x_;
	float			y_;
	float			radiusOffsetX_;
	float			radiusOffsetY_;
	int				fireVision_;
	int				fireRange_;
	int				campId_;
	int				maskId_;
	int				curState;
	int             _willNearAttackIndex;
};


class MapRuntimeC : public Node
{
public:
    static MapRuntimeC *create(void);
    ~MapRuntimeC(void);
    
    LUA_TABLE tick(LUA_TABLE objectsLua, LUA_TABLE collsLua, float dt);

	void dealFire(LuaObject* i_obj, LuaObject* j_obj, float checkRadius);

	void dealCollision(LuaObject* i_obj, LuaObject* j_obj, float checkRadius, bool needCheckFireRange);

	LUA_TABLE newTick(LUA_TABLE objectsLua, LUA_TABLE collsLua, LUA_TABLE addObjs, LUA_TABLE removeObjs, float dt);
	
    
    LUA_TABLE getFireTargets(LUA_TABLE objectLua,LUA_TABLE targetsLua, LUA_TABLE collsLua,int firerange);

private:
    MapRuntimeC(void);

	// vector中存储的需要检测碰撞的物体，vector中的物体x、y坐标不会更新
	std::vector<LuaObject> checkObjects;

	// map中存储的需要检测碰撞的物体，map中的物体x、y坐标会更新
	std::map<int, LuaObject> mapCheckObjects;

	// 记录的在FireVison、Range中的物体
	std::map <int, vector<std::string>> objInRangeMap;

	// 记录的在FireRange中的物体
	std::map <int, vector<std::string>> objInFireMap;

	std::vector<int> testInt;

	int eventIndex;
	int testSize;

    lua_State *L;
};

//NS_MAP_GAME_LUABINDING_END

#endif // __MAP_RUNTIME_C_H_
