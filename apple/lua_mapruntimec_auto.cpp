#include "lua_mapruntimec_auto.hpp"
#include "MapRuntimeC.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"


int lua_mapruntimec_MapRuntimeC_tick(lua_State* tolua_S)
{
	int argc = 0;
	MapRuntimeC* cobj = nullptr;
	bool ok = true;

#if COCOS2D_DEBUG >= 1
	tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
	if (!tolua_isusertype(tolua_S, 1, "MapRuntimeC", 0, &tolua_err)) goto tolua_lerror;
#endif

	cobj = (MapRuntimeC*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
	if (!cobj)
	{
		tolua_error(tolua_S, "invalid 'cobj' in function 'lua_mapruntimec_MapRuntimeC_tick'", nullptr);
		return 0;
	}
#endif

	argc = lua_gettop(tolua_S) - 1;
	if (argc == 3)
	{
		int arg0;
		int arg1;
		double arg2;

		// chang by Owen, 2015.5.13, 把参数0和1的luaval_to_int32改成toluafix_totable
		LUA_TABLE objectsLua = (toluafix_totable(tolua_S, 2, 0));
		LUA_TABLE collsLua = (toluafix_totable(tolua_S, 3, 0));

		//ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "MapRuntimeC:tick");

		//ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "MapRuntimeC:tick");

		ok &= luaval_to_number(tolua_S, 4, &arg2, "MapRuntimeC:tick");
		if (!ok)
		{
			tolua_error(tolua_S, "invalid arguments in function 'lua_mapruntimec_MapRuntimeC_tick'", nullptr);
			return 0;
		}
		int ret = cobj->tick(objectsLua, collsLua, arg2); // arg0, arg1, arg2);
		//tolua_pushnumber(tolua_S,(lua_Number)ret);
		return 1;
	}
	luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MapRuntimeC:tick", argc, 3);
	return 0;

#if COCOS2D_DEBUG >= 1
tolua_lerror:
	tolua_error(tolua_S, "#ferror in function 'lua_mapruntimec_MapRuntimeC_tick'.", &tolua_err);
#endif

	return 0;
}
int lua_mapruntimec_MapRuntimeC_getFireTargets(lua_State* tolua_S)
{
	int argc = 0;
	MapRuntimeC* cobj = nullptr;
	bool ok = true;

#if COCOS2D_DEBUG >= 1
	tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
	if (!tolua_isusertype(tolua_S, 1, "MapRuntimeC", 0, &tolua_err)) goto tolua_lerror;
#endif

	cobj = (MapRuntimeC*)tolua_tousertype(tolua_S, 1, 0);

#if COCOS2D_DEBUG >= 1
	if (!cobj)
	{
		tolua_error(tolua_S, "invalid 'cobj' in function 'lua_mapruntimec_MapRuntimeC_getFireTargets'", nullptr);
		return 0;
	}
#endif

	argc = lua_gettop(tolua_S) - 1;
	if (argc == 4)
	{
		int arg0;
		int arg1;
		int arg2;
		double arg3;

		// chang by Owen, 2015.5.28, 把参数0和1的luaval_to_int32改成toluafix_totable
		LUA_TABLE objectsLua = (toluafix_totable(tolua_S, 2, 0));
		LUA_TABLE collsLua = (toluafix_totable(tolua_S, 3, 0));
		LUA_TABLE targetsLua = (toluafix_totable(tolua_S, 4, 0));

		//ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "MapRuntimeC:getFireTargets");

		//ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "MapRuntimeC:getFireTargets");

		//ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "MapRuntimeC:getFireTargets");

		//ok &= luaval_to_int32(tolua_S, 5,(int *)&arg3, "MapRuntimeC:getFireTargets");
		ok &= luaval_to_number(tolua_S, 5, &arg3, "MapRuntimeC:getFireTargets");
		if (!ok)
		{
			tolua_error(tolua_S, "invalid arguments in function 'lua_mapruntimec_MapRuntimeC_getFireTargets'", nullptr);
			return 0;
		}
		int ret = cobj->getFireTargets(objectsLua, collsLua, targetsLua, arg3); // arg0, arg1, arg2, arg3);
		// chang by Owen, 2015.5.28, 这里不需要范围了，在getFireTargets这个函数里面去处理返回
		// tolua_pushnumber(tolua_S,(lua_Number)ret);
		return 1;
	}
	luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MapRuntimeC:getFireTargets", argc, 4);
	return 0;

#if COCOS2D_DEBUG >= 1
tolua_lerror:
	tolua_error(tolua_S, "#ferror in function 'lua_mapruntimec_MapRuntimeC_getFireTargets'.", &tolua_err);
#endif

	return 0;
}

int lua_mapruntimec_MapRuntimeC_newTick(lua_State* tolua_S)
{
    int argc = 0;
    MapRuntimeC* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"MapRuntimeC",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (MapRuntimeC*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_mapruntimec_MapRuntimeC_newTick'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 5) 
    {
		/*
        int arg0;
        int arg1;
        int arg2;
        int arg3;
		*/
        double arg4;

		LUA_TABLE arg0 = (toluafix_totable(tolua_S, 2, 0));
		LUA_TABLE arg1 = (toluafix_totable(tolua_S, 3, 0));
		LUA_TABLE arg2 = (toluafix_totable(tolua_S, 4, 0));
		LUA_TABLE arg3 = (toluafix_totable(tolua_S, 5, 0));

		/*
        ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "MapRuntimeC:newTick");

        ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "MapRuntimeC:newTick");

        ok &= luaval_to_int32(tolua_S, 4,(int *)&arg2, "MapRuntimeC:newTick");

        ok &= luaval_to_int32(tolua_S, 5,(int *)&arg3, "MapRuntimeC:newTick");
		*/

        ok &= luaval_to_number(tolua_S, 6,&arg4, "MapRuntimeC:newTick");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_mapruntimec_MapRuntimeC_newTick'", nullptr);
            return 0;
        }
        int ret = cobj->newTick(arg0, arg1, arg2, arg3, arg4);
        //tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "MapRuntimeC:newTick",argc, 5);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_mapruntimec_MapRuntimeC_newTick'.",&tolua_err);
#endif

    return 0;
}
int lua_mapruntimec_MapRuntimeC_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"MapRuntimeC",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_mapruntimec_MapRuntimeC_create'", nullptr);
            return 0;
        }
        MapRuntimeC* ret = MapRuntimeC::create();
        object_to_luaval<MapRuntimeC>(tolua_S, "MapRuntimeC",(MapRuntimeC*)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "MapRuntimeC:create",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_mapruntimec_MapRuntimeC_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_mapruntimec_MapRuntimeC_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (MapRuntimeC)");
    return 0;
}

int lua_register_mapruntimec_MapRuntimeC(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"MapRuntimeC");
    tolua_cclass(tolua_S,"MapRuntimeC","MapRuntimeC","cc.Node",nullptr);

    tolua_beginmodule(tolua_S,"MapRuntimeC");
        tolua_function(tolua_S,"tick",lua_mapruntimec_MapRuntimeC_tick);
        tolua_function(tolua_S,"getFireTargets",lua_mapruntimec_MapRuntimeC_getFireTargets);
        tolua_function(tolua_S,"newTick",lua_mapruntimec_MapRuntimeC_newTick);
        tolua_function(tolua_S,"create", lua_mapruntimec_MapRuntimeC_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(MapRuntimeC).name();
    g_luaType[typeName] = "MapRuntimeC";
    g_typeCast["MapRuntimeC"] = "MapRuntimeC";
    return 1;
}
TOLUA_API int register_all_mapruntimec(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,nullptr,0);
	tolua_beginmodule(tolua_S,nullptr);

	lua_register_mapruntimec_MapRuntimeC(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

