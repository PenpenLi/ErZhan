
#include "MapRuntimeC.h"
#include <math.h>
#include <stdio.h>
#include <string.h>

#include <stdlib.h>
#include<iostream>
#include<iomanip>
using namespace std;

extern "C" {
#include "tolua_fix.h"
}
#include "CCLuaEngine.h"

//NS_MAP_GAME_LUABINDING_BEGIN

MapRuntimeC *MapRuntimeC::create(void)
{
    MapRuntimeC *runtime = new MapRuntimeC();
    //runtime->autorelease();
    return runtime;
}

MapRuntimeC::MapRuntimeC(void)
: L(NULL)
{
	L = LuaEngine::getInstance()->getLuaStack()->getLuaState();
	//L = CCLuaEngine::defaultEngine()->getLuaStack()->getLuaState();
}

MapRuntimeC::~MapRuntimeC(void)
{
    CCLOG("~~ MapRuntimeC");
}

// 处理kMapEventCollisionBegan和kMapEventCollisionEnd事件
// 判定staticIndex是不是在以rangeIndex为中心，radius为半径的半圆中
void MapRuntimeC::dealCollision(LuaObject* obj, LuaObject* range, float checkRadius, bool needCheckFireRange)
{
	// 这个函数耗时4ms

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();

	// 下面的5行代码执行619次，耗时6ms
	// 查询static是不是在这个range中
	bool bBeforeInRange = false;

	std::string *objId = &obj->id_;    // static obj的id_
	int         rangeIndex_ = range->index_;
	std::string *rangeId = &range->id_;    // range obj的id_

	//std::string *objId = &checkObjects[staticIndex].id_;    // static obj的id_
	//std::string *rangeId = &checkObjects[rangeIndex].id_;    // range obj的id_

	vector<std::string> &inRangeObjs = objInRangeMap[rangeIndex_];
	testSize = testSize + inRangeObjs.size();

	if (inRangeObjs.size() > 0)
	{
		int size = inRangeObjs.size();
		int k = 0;
		for (; k < size; k++)
		{
			// 比较id是否相等，两个 std::string 可以直接用 ==
			if (inRangeObjs[k] == *objId)
			{
				bBeforeInRange = true;
				break;
			}

		}
	}


	// 算一下现在是不是在range中
	bool bNowInRange = false;
	float x1 = obj->x_ + obj->radiusOffsetX_;
	float y1 = obj->y_ + obj->radiusOffsetY_;
	float x2 = range->x_ + range->radiusOffsetX_;
	float y2 = range->y_ + range->radiusOffsetY_;
	
	if ((fabs(x2 - x1) > checkRadius + obj->radius_)
		|| (fabs(y2 - y1) > checkRadius + obj->radius_))
	{
		// 之前在range中，现在不在了
		if (bBeforeInRange)
		{
			int size = inRangeObjs.size();
			int k = 0;
			for (; k < inRangeObjs.size(); k++)
			{
				// 比较id是否相等，两个 std::string 可以直接用 ==
				if (inRangeObjs[k] == *objId)
				{
					inRangeObjs.erase(inRangeObjs.begin() + k);
					break;
				}

			}
		}
	}
	else
	{
		float dx = x2 - x1;
		float dy = y2 - y1;
		float fr = checkRadius * checkRadius;
		float dist2 = dx*dx + dy*dy; // dist1to2 * dist1to2;
		float frp = sqrtf(0.64*fr*dx*dx / dist2 + fr*dy*dy / dist2);
		float temp_fireRange = 0.8*fr / frp;
		//float targetDist = dist1to2 - temp_fireRange - radius2;
		float targetDist = sqrtf(dx * dx + dy * dy) - temp_fireRange - obj->radius_;
		if (targetDist <= 0)
		{
			bNowInRange = true;
			// 之前不在range中，现在在了
			if (!bBeforeInRange)
			{
				inRangeObjs.push_back(*objId);
			}
		}
		else
		{
			// 之前在range中，现在不在了
			if (bBeforeInRange)
			{
				int size = inRangeObjs.size();
				int k = 0;
				for (; k < inRangeObjs.size(); k++)
				{
					// 比较id是否相等，两个 std::string 可以直接用 ==
					if (inRangeObjs[k] == *objId)
					{
						inRangeObjs.erase(inRangeObjs.begin() + k);
						break;
					}

				}
			}
		}
	}

	// 如果之前在range中，现在在range外面，添加事件kMapEventCollisionEnded，先压入key，再压入value，然后调用rawset
	// 第一个压入的是事件，第二个是static，第二个是range
	/*
		eventTable
		eventIndex
		eventsTable
	*/
	if ((!bBeforeInRange && bNowInRange) || (bBeforeInRange && !bNowInRange))
	{
		// 压入event的key
		lua_pushnumber(L, eventIndex);
		// 压入event table
		lua_newtable(L);
		lua_pushnumber(L, 1);

		// 之前不在range中，现在在了
		if (!bBeforeInRange && bNowInRange)
			lua_pushnumber(L, kMapEventCollisionBegan);
		if (bBeforeInRange && !bNowInRange)
			lua_pushnumber(L, kMapEventCollisionEnded);

		lua_rawset(L, -3);
		lua_pushnumber(L, 2);
		lua_pushstring(L, objId->c_str());
		lua_rawset(L, -3);
		lua_pushnumber(L, 3);
		lua_pushstring(L, rangeId->c_str());
		lua_rawset(L, -3);
		// 压入event到要返回给lua里面的events数组
		lua_rawset(L, -3);
		
		// 事件计数要+1
		eventIndex++;
	}
}


// 判断target是不是在object的fireRange中
void MapRuntimeC::dealFire(LuaObject* target, LuaObject* object, float fireRange)
{
	// 这个函数耗时3ms

	// 判定range是不是在object的fireRange中
	bool fireEvent = false;
	float x1 = target->x_ + target->radiusOffsetX_;
	float y1 = target->y_ + target->radiusOffsetY_;
	float x2 = object->x_ + object->radiusOffsetX_;
	float y2 = object->y_ + object->radiusOffsetY_;

	if ((fabs(x2 - x1) > object->fireRange_ + target->radius_)
		|| (fabs(y2 - y1) > object->fireRange_ + target->radius_))
	{
	}
	else
	{
		float fireRange = object->fireRange_;
		float dx = x2 - x1;
		float dy = y2 - y1;
		float fr = fireRange * fireRange;
		float dx_2 = dx * dx;
		float dy_2 = dy * dy;
		float dist2 = dx_2 + dy_2;    // dx*dx + dy*dy;    // dist1to2 * dist1to2;
		float frp = sqrtf(0.64*fr*dx_2 / dist2 + fr*dy_2 / dist2);
		float temp_fireRange = 0.8*fr / frp;
		//float targetDist = dist1to2 - temp_fireRange - radius2;
		float targetDist = sqrtf(dx_2 + dy_2) - temp_fireRange - target->radius_;
		if (targetDist <= 0)
		{
			fireEvent = true;
		}
	}
	if (fireEvent)
	{
		// 1ms
		vector<std::string> *inFire = &objInFireMap[object->index_];
		// 耗时4ms
		inFire->push_back(target->id_);

		/*
		// 压入event的key
		lua_pushnumber(L, eventIndex);
		// 压入event table
		lua_newtable(L);
		lua_pushnumber(L, 1);

		lua_pushnumber(L, kMapEventCollisionFire);

		lua_rawset(L, -3);
		lua_pushnumber(L, 2);
		lua_pushstring(L, (object->id_).c_str());
		lua_rawset(L, -3);
		lua_pushnumber(L, 3);
		lua_pushstring(L, (target->id_).c_str());
		lua_rawset(L, -3);
		// 压入event到要返回给lua里面的events数组
		lua_rawset(L, -3);

		// 事件计数要+1
		eventIndex++;
		*/
	}
}


LUA_TABLE MapRuntimeC::newTick(LUA_TABLE objectsLua, LUA_TABLE collsLua, LUA_TABLE addObjs, LUA_TABLE removeObjs, float dt)
{
	// 返回给lua的events数组的索引
	eventIndex  = 1;
	testSize	= 0;

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();
	//CCLOG("test MapRuntimeC::tick 1 start = %ld\n", start);

	// 移除不需要检测的物体
	lua_pushnil(L);
	while (lua_next(L, -3))
	{
		// 获得物体的id_属性
		GET_OBJ_PROP_INT(firstIndex_, "index_")

		mapCheckObjects.erase(firstIndex_);

		std::vector<LuaObject>::iterator iter = checkObjects.begin();
		for (; iter != checkObjects.end();)
		{
			if (firstIndex_ == iter->index_)
			{
				iter = checkObjects.erase(iter);
				CCLOG("remove check object id = %d", firstIndex_);
			}
			else
			{
				iter++;
			}
		}
		lua_pop(L, 1);
	}

	// 添加新的需要检测的物体
	lua_pushnil(L);
	while (lua_next(L, -4))
	{
		// 获得第一个物体的属性

		GET_OBJ_PROP_STRING(id_, "id_")
		GET_OBJ_PROP_INT(index_, "index_");	// 这个是id后面的数字，是不会重复的，可以作为map的id使用

		GET_OBJ_PROP_INT(classIndex_, "classIndex_")

		GET_OBJ_PROP_BOOL(destroyed_, "destroyed_")
		GET_OBJ_PROP_BOOL(collisionEnabled_, "collisionEnabled_")
		GET_OBJ_PROP_INT(collisionLock_, "collisionLock_")

		GET_OBJ_PROP_FLOAT(radius_, "radius_")

		GET_OBJ_PROP_FLOAT(x_, "x_")
		GET_OBJ_PROP_FLOAT(y_, "y_")
		GET_OBJ_PROP_FLOAT(radiusOffsetX_, "radiusOffsetX_")
		GET_OBJ_PROP_FLOAT(radiusOffsetY_, "radiusOffsetY_")

		GET_OBJ_PROP_INT(fireVision_, "fireVision_")
		GET_OBJ_PROP_INT(fireRange_, "fireRange_")

		GET_OBJ_PROP_INT(campId_, "campId_")
		GET_OBJ_PROP_INT(maskId_, "maskId_")
		GET_OBJ_PROP_INT(curState, "curState");

		LuaObject obj = { id_, index_, classIndex_, destroyed_, collisionEnabled_, collisionLock_, radius_, x_, y_,
			radiusOffsetX_, radiusOffsetY_, fireVision_, fireRange_, campId_, maskId_, curState, 0 };

		mapCheckObjects.insert(pair<int, LuaObject>(index_, obj));

		checkObjects.push_back(obj);

		lua_pop(L, 1);
	}

	// 更新vector中的对象的x、y坐标
	// 添加新的需要检测的物体

	int size = checkObjects.size();
	lua_pushnil(L);
	LuaObject *updateXYObj;
	while (lua_next(L, -6))
	{
		GET_OBJ_PROP_INT(secondIndex_, "index_")
		GET_OBJ_PROP_FLOAT(secondX_, "x_")
		GET_OBJ_PROP_FLOAT(secondY_, "y_")
		GET_OBJ_PROP_INT(secondCurState, "curState");

		// 如果map中不存在这个元素的话，会构造一个新的LuaObject，其中id_ = ""
		updateXYObj = &mapCheckObjects[secondIndex_];
		if (secondIndex_ == updateXYObj->index_)
		{
			updateXYObj->x_ = secondX_;
			updateXYObj->y_ = secondY_;
			updateXYObj->curState = secondCurState;
			
			// 如果是英雄或者怪物，还需要读取近战攻击目标
			if (updateXYObj->campId_ == HERO_CAMP || updateXYObj->campId_ == MONSTER_CAMP)
			{
				GET_OBJ_PROP_INT(second_WillNearAttackIndex, "_willNearAttackIndex");
				updateXYObj->_willNearAttackIndex = second_WillNearAttackIndex;
			}
		}
		/*
		// 下面这个遍历要消耗4-5毫秒
		int i = 1;
		for (; i < size; i++)
		{
			LuaObject *obj = &checkObjects[i];
			//if (strcmp(secondId_.c_str(), (obj->id_).c_str()) == 0)
			if (secondId_ == obj->id_)
			{
				obj->x_ = secondX_;
				obj->y_ = secondY_;
			}
		}
		*/
		
		lua_pop(L, 1);
	}

	// 传给lua的events事件
	lua_newtable(L);

	finish1 = clock();
	//CCLOG("test MapRuntimeC::tick 1-0 size = %d finish1 = %ld cast_time 1 = %ld\n", size, finish1, finish1 - start);

	start = finish1;

	// 计算所有物体的距离并存好， size 为257的时候，PC上计算要8毫秒
	float x1, y1, x2, y2;
	float dx, dy, dist;
	int campId_i, campId_j, maskId_i, maskId_j;
	int i, j;
	LuaObject * i_obj;
	LuaObject * j_obj;
	LuaObject * range;		// 传给dealCollision 做range和fireVision的判断
	LuaObject * obj;		// 传给dealCollision 做range和fireVision的判断
	bool        bMapData = false;
	//map <std::string, LuaObject>::iterator i_Iter = mapCheckObjects.begin();
	//map <std::string, LuaObject>::iterator j_Iter;

	// 先更新vector中的数据
	for (i = 0; i < size; i++)
	{
		i_obj = &checkObjects[i];
		j_obj = &mapCheckObjects[i_obj->index_];
		i_obj->x_ = j_obj->x_;
		i_obj->y_ = j_obj->y_;
		i_obj->curState = j_obj->curState;
		i_obj->_willNearAttackIndex = j_obj->_willNearAttackIndex;
	}

	for (i = 0; i < size; i++)
	{
		i_obj = &checkObjects[i];
		// 从map中取出两个物体，因为只有map中的数据x、y会实时修改
		//i_obj = &mapCheckObjects[checkObjects[i].id_];

		// 物体销毁或者不能碰撞，则进行下一个判定
		if (i_obj->destroyed_ || (!i_obj->collisionEnabled_))
		{
			continue;
		}

		//x1 = i_obj->x_ + i_obj->radiusOffsetX_;
		//y1 = i_obj->y_ + i_obj->radiusOffsetY_;

		for (j = i + 1; j < size; j++)
		{
			j_obj = &checkObjects[j];
			// 从map中取出两个物体，因为只有map中的数据x、y会实时修改
			//j_obj = &mapCheckObjects[checkObjects[j].id_];
		
			// 物体销毁或者不能碰撞，则进行下一个判定
			if (j_obj->destroyed_ || (!j_obj->collisionEnabled_))
			{
				continue;
			}
			// 如果两个都是range类型，不需要判定
			if (i_obj->classIndex_ == kMapObjectClassIndexRange && j_obj->classIndex_ == kMapObjectClassIndexRange)
			{
				continue;
			}

			bMapData = false;
			// 如果一个是static，一个是range
			if (i_obj->classIndex_ != j_obj->classIndex_)
			{

				// 如果第一个是range，第二个是static
				if (i_obj->classIndex_ == kMapObjectClassIndexRange && j_obj->classIndex_ == kMapObjectClassIndexStatic)
				{
					range = i_obj;
					obj   = j_obj;
					dealCollision(j_obj, i_obj, range->radius_, false);	// , x2, y2, x1, y1);
				}
				if (i_obj->classIndex_ == kMapObjectClassIndexStatic && j_obj->classIndex_ == kMapObjectClassIndexRange)
				{
					range = j_obj;
					obj = i_obj;
					dealCollision(i_obj, j_obj, range->radius_, false);	// , x1, y1, x2, y2);
				}
				
			}
			// 两个都是static
			if (i_obj->classIndex_ == kMapObjectClassIndexStatic && j_obj->classIndex_ == kMapObjectClassIndexStatic)
			{

				// 敌对阵营的才需要碰撞检测

				campId_i = i_obj->campId_;
				maskId_i = i_obj->maskId_;

				campId_j = j_obj->campId_;
				maskId_j = j_obj->maskId_;
				//bool flag = campId2 & maskId1;
				// 表示 j_obj 属于 i_obj 可以攻击的目标
				if (campId_i && (maskId_i & campId_j ))
				{
					// 进入fireVision_，是kMapEventCollisionBegan事件

					int i_FireVision = i_obj->fireVision_;
					int j_FireVision = j_obj->fireVision_;
					// 不相等就表示是远程的
					if (i_FireVision > 80) //i_obj->fireRange_)
					{
						// 判断 j 是不是进入了 i 的fireVision
						dealCollision(j_obj, i_obj, i_obj->fireVision_, false);	// , x2, y2, x1, y1);
					}
					if (i_obj->fireRange_ > 0)
					{
						if (i_obj->campId_ == MONSTER_CAMP)
						{
							// 怪物只有在IDLE状态下需要判定
							if (i_obj->curState == ObjectState_IDLE && i_obj->_willNearAttackIndex != 0)
							{
								// 判断 j 是不是 i 要近战攻击的目标
								if (j_obj->index_ == i_obj->_willNearAttackIndex)
								{
									// 判断 j 是不是进入了 i 的fireRange
									dealFire(j_obj, i_obj, i_obj->fireRange_);
								}
							}
						}
						else if(i_obj->campId_ == HERO_CAMP)
						{
							// 英雄有近战攻击目标的时候才需要判定
							if (i_obj->_willNearAttackIndex != 0)
							{
								// 判断 j 是不是 i 要近战攻击的目标
								if (j_obj->index_ == i_obj->_willNearAttackIndex)
								{
									// 判断 j 是不是进入了 i 的fireRange
									dealFire(j_obj, i_obj, i_obj->fireRange_);	// , x2, y2, x1, y1);
								}
							}
						}
						else
						{
							// 判断 j 是不是进入了 i 的fireRange
							dealFire(j_obj, i_obj, i_obj->fireRange_);	// , x2, y2, x1, y1);
						}
					}
				}

				// 表示 i_obj 属于 j_obj 可以攻击的目标
				if (campId_j && (maskId_j & campId_i))
				{
					int i_FireVision = i_obj->fireVision_;
					int j_FireVision = j_obj->fireVision_;

					if (j_FireVision > 80)
					{
						// 判断 i 是不是进入了 i 的fireVision
						dealCollision(i_obj, j_obj, j_obj->fireVision_, false);	// , x1, y1, x2, y2);
					}
					if (j_obj->fireRange_ > 0)
					{
						if (j_obj->campId_ == MONSTER_CAMP)
						{
							// 怪物只有在IDLE状态下需要判定
							if (j_obj->curState == ObjectState_IDLE && j_obj->_willNearAttackIndex != 0)
							{
								// 判断 i 是不是 j 要近战攻击的目标
								if (i_obj->index_ == j_obj->_willNearAttackIndex)
								{
									// 判断 i 是不是进入了 j 的fireRange
									dealFire(i_obj, j_obj, j_obj->fireRange_);
								}
							}
						}
						else if (j_obj->campId_ == HERO_CAMP)
						{
							// 英雄有近战攻击目标的时候才需要判定
							if (j_obj->_willNearAttackIndex != 0)
							{
								// 判断 i 是不是 j 要近战攻击的目标
								if (i_obj->index_ == j_obj->_willNearAttackIndex)
								{
									// 判断 i 是不是进入了 j 的fireRange
									dealFire(i_obj, j_obj, j_obj->fireRange_);	// , x1, y1, x2, y2);
								}
							}
						}
						else
						{
							// 判断 i 是不是进入了 j 的fireRange
							dealFire(i_obj, j_obj, j_obj->fireRange_);	// , x1, y1, x2, y2);
						}
					}
				}
			}
		}
	}

	// 遍历完了以后，组装Fire事件
	std::string objId;
	std::string tarId;
	int vectorSize;
	int objIndex;
	vector<std::string> *inFireVector;
	for (i =0; i < size; i++)
	{
		i_obj = &checkObjects[i];
		objId = i_obj->id_;
		objIndex = i_obj->index_;
		if (i_obj->classIndex_ == kMapObjectClassIndexStatic && i_obj->fireRange_ > 0)
		{
			inFireVector = &objInFireMap[objIndex];
			vectorSize = inFireVector->size();
			if (vectorSize == 0)
			{
				// 加入noTarget事件

				// 压入event的key
				lua_pushnumber(L, eventIndex);
				// 压入event table
				lua_newtable(L);
				lua_pushnumber(L, 1);
				lua_pushnumber(L, kMapEventCollisionNoTarget);
				lua_rawset(L, -3);
				lua_pushnumber(L, 2);
				lua_pushstring(L, objId.c_str());
				lua_rawset(L, -3);

				// 压入event到要返回给lua里面的events数组
				lua_rawset(L, -3);

				// 事件计数要+1
				eventIndex++;
			}
			else
			{
				// 加入Fire事件

				// 压入event的key
				lua_pushnumber(L, eventIndex);
				// 压入event table
				lua_newtable(L);
				lua_pushnumber(L, 1);
				lua_pushnumber(L, kMapEventCollisionFire);
				lua_rawset(L, -3);
				lua_pushnumber(L, 2);
				lua_pushstring(L, objId.c_str());
				lua_rawset(L, -3);
				// 压入targets，是一个table
				lua_pushnumber(L, 3);
				lua_newtable(L);
				for (j = 0; j < inFireVector->size(); j++)
				{
					tarId = (*inFireVector)[j]; //->at[j];
					lua_pushnumber(L, j + 1);
					lua_pushstring(L, tarId.c_str());
					lua_rawset(L, -3);
				}
				// 压入targets，是一个table
				lua_rawset(L, -3);
				// 压入Fire event
				lua_rawset(L, -3);
				eventIndex++;
				// 清空vector和map
				inFireVector->clear();
				objInFireMap.erase(objIndex);
			}
		}
	}

	//lua_pop(L, 1);

	finish1 = clock();
	//CCLOG("test MapRuntimeC::tick 1-1 finish1 = %ld cast_time 2 = %ld\n", finish1, finish1 - start);
	//CCLOG("MapRuntimeC::dealCollision eventIndex = %d testSize = %d\n", eventIndex, testSize);

	//lua_pop(L, 1);
	return 1;
}




// checks = {evts, dists, colls}
// 脚本传过来的table是放在栈顶的，即栈的-1位置
// 栈顶是-1，栈底是1，也就是第 1 个入栈的在栈底；也可以这么说：正数表示相对于栈底的位置（位移），负数表示相对于栈顶的位置（位移）；
// 第一个入栈的为1，最后一个入栈的为-1

/*
用到的lua api：
	lua_pop(L,n)        从堆栈中弹出 n 个元素
	lua_pushvalue(L, n) 压入堆栈上指定索引的一个抟贝到栈顶
	lua_insert(L, n)	移动栈顶元素到指定索引的位置，并将这个索引位置上面的元素全部上移至栈顶被移动留下的空隔
	lua_remove(L, n)    移除指定索引位置的元素，并将其上面所有的元素下移来填补这个位置的空白

对表的操作：
	lua_newtable(L)		创建一个新的空 table 然后将其入栈
	lua_settable(L, n)  拿到索引 n 指向的table，然后从栈顶弹出一个value，再弹出一个key，用这两个值修改 table或者增加一个键值对
	lua_rawset(L, n)    跟lua_settable是一样的，但是lua_settable将触发 __newindex 元方法，而lua_rawset不会触发metatable的__newindex
	lua_rawseti(L, index, key)  取到index指向的数组table，将栈顶的值弹出，赋值给取到的 table 索引 key，可以是增加和修改
	lua_gettable(L,n)   根据索引 n 指定取到相应的表; 取栈顶元素为key, 并弹出栈; 获取表中key的值压入栈顶.
	lua_rawget(L, n)    跟lua_gettable一样，只是不会触发metatable的__index
	
*/

LUA_TABLE MapRuntimeC::tick(LUA_TABLE objectsLua, LUA_TABLE collsLua, float dt)
{

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();
	CCLOG("test MapRuntimeC::tick 1 start = %ld\n", start);


	// 把dt从栈顶弹出，现在栈顶是collsLua
    lua_pop(L, 1);                                                      /* L: objs colls */
	// 创建一个table，放在栈顶
	// table的栈顶为-1，压入一个值后，原来的栈顶变成-2
    lua_newtable(L);                                                    /* L: objs colls evts */
    lua_newtable(L);                                                    /* L: objs colls evts dists */
    
    unsigned int eventIndex = 0;
    
	// calc static objects dist
    lua_pushnil(L);                                                     /* L: objs colls evts dists nil */
	
	/*
		现在栈中的数据是这样的：  1代表栈顶
		1：  nil
		2.   newtable1
		3.   newtable2
		4.   collsLua
		5.   objectsLua
		所以要遍历objec的时候就要用-5这个参数
	*/

#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
    CCLOG("----------------------------------------");
#endif
	// 依次获取一个object，只有static object才能做碰撞检测
	// static object来跟Range和其他的static object做检测
	// 调用了lua_next这个函数以后，栈顶的值就变成了objectsLua table中第一个键值对的值value
	// 在处理完这个value，想接着用while (lua_next(L, -5))来遍历下一个value时，就需要把栈顶pop掉lua_pop(L, 1);
    while (lua_next(L, -5))                                             /* L: objs colls evts dists id1 obj1 */
    {
		/* 
			现在栈顶（-1）是 value，-2 位置是对应的 key 
			现在栈中的数据是这样的：  1代表栈顶
			1.   objectsLua中存的需要检测的objects中的一个value，object1
			2.	 object1的索引，也就是object1.id_
			3.   newtable1
			4.   newtable2
			5.   collsLua
			6.   objectsLua
		*/

		/*
			lua_pushnil( pLua );  // nil 入栈作为初始 key 
			while( 0 != lua_next( pLua, nIndex ) ) 
			{ 
				// 现在栈顶（-1）是 value，-2 位置是对应的 key 
				// 这里可以判断 key 是什么并且对 value 进行各种处理 
				lua_pop( pLua, 1 );  // 弹出 value，让 key 留在栈顶 
			} 
			lua_next() 这个函数的工作过程是：
			1) 先从栈顶弹出一个 key
			2) 从栈指定位置的 table 里取下一对 key-value，先将 key 入栈再将 value 入栈
			3) 如果第 2 步成功则返回非 0 值，否则返回 0，并且不向栈中压入任何值
		*/


        bool skip = true;
        
        do
        {
            GET_OBJ_PROP_INT(classIndex1, "classIndex_");
            if (classIndex1 != kMapObjectClassIndexStatic) break;
            
            if (classIndex1 == kMapObjectClassIndexStatic)
            {
                GET_OBJ_PROP_BOOL(destroyed1, "destroyed_")
                if (destroyed1) break;
                
                GET_OBJ_PROP_BOOL(collisionEnabled1, "collisionEnabled_")
                if (!collisionEnabled1) break;
                
                GET_OBJ_PROP_INT(collisionLock1, "collisionLock_")
                if (collisionLock1 > 0) break;
                
				#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
                CCLOG("calc dist for static object %s, destroyed_: %d, collisionEnabled_: %d, collisionLock_: %d",
                      lua_tostring(L, -2),
                      destroyed1,
                      collisionEnabled1,
                      collisionLock1);
				#endif
            }
            
            skip = false;
        } while (false);
        
		// 如果不是static或者已销毁等，则不需要对这个物体进行判定了
        if (skip)
        {
            lua_pop(L, 1);                                              /* L: objs colls evts dists id1 */
            continue;
        }
        
		// 获得第一个物体的属性
        GET_OBJ_PROP_FLOAT(x1, "x_")
        GET_OBJ_PROP_FLOAT(y1, "y_")
        GET_OBJ_PROP_FLOAT(rx1, "radiusOffsetX_")
        GET_OBJ_PROP_FLOAT(ry1, "radiusOffsetY_")
        x1 += rx1;
        y1 += ry1;
        
        GET_OBJ_PROP_INT(campId1, "campId_")
        GET_OBJ_PROP_INT(maskId1, "maskId_")
        // dists[obj1] = {}
		// 新建一个table并压栈
        lua_newtable(L);                                                /* L: objs colls evts dists id1 obj1 t */

		/* 调用lua_newtable后栈中的数据是这样的：  1代表栈顶

		1.   newtable3
		2.   objectsLua中存的需要检测的object1
		3.	 object1的索引，也就是object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

		// lua_pushvalue(L, n) 压入堆栈上指定索引的一个抟贝到栈顶, 拷贝-2位置的值，然后把它放到栈顶
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists id1 obj1 t obj1 */
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists id1 obj1 t obj1 t */

		/* 调用两个lua_pushvalue后栈中的数据是这样的：  1代表栈顶
		1.   newtable3
		2.	 objectsLua中存的需要检测的object1
		3.   newtable3
		4.   objectsLua中存的需要检测的object1
		5.	 object1的索引，也就是object1.id_
		6.   newtable1
		7.   newtable2
		8.   collsLua
		9.   objectsLua
		*/

		// 拿到-6指向的table，然后从栈顶弹出一个value，再弹出一个key，用这两个值修改 table或者新增一个键值对
		// 给newtable1 赋值   newtable1[object1] = newtable3
        lua_rawset(L, -6);                             /* dists[obj1] = t, L: objs colls evts dists id1 obj1 t */

		/* 调用lua_rawset(L, -6)后栈中的数据是这样的：  1代表栈顶
		1.   newtable3
		2.   objectsLua中存的需要检测的object1
		3.	 object1的索引，也就是object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

        // lua_remove 移除指定索引位置的元素，并将其上面所有的元素下移来填补这个位置的空白
		lua_remove(L, -2);                                              /* L: objs colls evts dists id1 dists[obj1] */

		/* 调用lua_remove(L, -2)后栈中的数据是这样的：  1代表栈顶
		1.   newtable3
		2.	 object1的索引，也就是object1.id_
		3.   newtable1
		4.   newtable2
		5.   collsLua
		6.   objectsLua
		*/

        
		// 取得了table里面的第一个static物体以后，遍历后面所有的物体，分别做比较，只有static和range物体才能比较
		// 通过 campId和maskId 剔除不能与这个物体进行碰撞检测的物体
		// 上面位置是-6，后面又插入了一个nil，所以变成-7
        // calc dists to other static objects and range objects
        lua_pushnil(L);                                                 /* L: objs colls evts dists id1 dists[obj1] nil */
        while (lua_next(L, -7))                                         /* L: objs colls evts dists id1 dists[obj1] id2 obj2 */
        {

			/*
			现在栈顶（-1）是 value，-2 位置是对应的 key
			现在栈中的数据是这样的：  1代表栈顶
			1.   objectsLua中存的需要检测的object2
			2.	 object2的索引，也就是object2.id_
			3.   newtable3
			4.	 object1的索引，也就是object1.id_
			5.   newtable1
			6.   newtable2
			7.   collsLua
			8.   objectsLua
			*/

            bool skip = true;
            
            do
            {
				// 如果 -2 和 -4 位置上的object.id_相同，那么表示是同一个物体，不需要做后面的检测了
                if (lua_equal(L, -2, -4)) 
					break;

                GET_OBJ_PROP_INT(classIndex2, "classIndex_");
				//CCLOG("haha 1 classIndex2 = %d \n", classIndex2);
                if (classIndex2 != kMapObjectClassIndexStatic && classIndex2 != kMapObjectClassIndexRange) break;
                
                if (classIndex2 == kMapObjectClassIndexStatic)
                {
                    GET_OBJ_PROP_BOOL(destroyed2, "destroyed_")
                    if (destroyed2) break;
                    
                    GET_OBJ_PROP_BOOL(collisionEnabled2, "collisionEnabled_")
                    if (!collisionEnabled2) break;
                    
                    GET_OBJ_PROP_INT(collisionLock2, "collisionLock_")
                    if (collisionLock2 > 0) break;
                    
                    GET_OBJ_PROP_INT(campId2, "campId_")
               //     GET_OBJ_PROP_INT(maskId2, "maskId_")
                    
               //     if (campId1 && campId1 == campId2) break;
                    bool flag = campId2 & maskId1;
                   
                    
                    if(campId1 && !flag ) break;
                    
                    
					#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
                    CCLOG("    -> static object %s, destroyed_: %d, collisionEnabled_: %d, collisionLock_: %d",
                          lua_tostring(L, -2),
                          destroyed2,
                          collisionEnabled2,
                          collisionLock2);
					#endif
                }
                else
                {
					#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
                    CCLOG("    -> range %s", lua_tostring(L, -2));
					#endif
                }
                
				GET_OBJ_PROP_FLOAT(x2, "x_")
					GET_OBJ_PROP_FLOAT(y2, "y_")
					GET_OBJ_PROP_FLOAT(rx2, "radiusOffsetX_")
					GET_OBJ_PROP_FLOAT(ry2, "radiusOffsetY_")

				
				float dx = (x2 + rx2) - x1;
				float dy = (y2 + ry2) - y1;
				float dist = sqrtf(dx * dx + dy * dy);
				
				//float dist = 1.0;

				#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
                CCLOG("       dist = %0.2f", dist);
				#endif
				// 向栈顶压入一个number dist
                lua_pushnumber(L, dist);                                /* L: objs colls evts dists id1 dists[obj1] id2 obj2 dist1to2 */
				/*
				现在栈中的数据是这样的：  1代表栈顶
				1.   dist
				2.   objectsLua中存的需要检测的object2
				3.	 object2的索引，也就是object2.id_
				4.   newtable3
				5.	 object1的索引，也就是object1.id_
				6.   newtable1
				7.   newtable2
				8.   collsLua
				9.   objectsLua
				*/

				// 拿到-4指向的table，然后从栈顶弹出一个value，再弹出一个key，用这两个值修改 table或者新增一个键值对
				// 给newtable1 赋值   newtable3[object2] = dist
				// 之前给 newtable1 赋值过了， newtable1[object1] = newtable3
				// 现就就是newtable1[object1][object2] = dist
				lua_rawset(L, -4);        /* dists[obj1][obj2] = dist1to2, L: objs colls evts dists id1 dists[obj1] id2 */
				/*
				现在栈中的数据是这样的：  1代表栈顶
				1.	 object2的索引，也就是object2.id_
				2.   newtable3
				3.	 object1的索引，也就是object1.id_
				4.   newtable1
				5.   newtable2
				6.   collsLua
				7.   objectsLua
				*/
				// 因为后面skip = false了，所有不会再进行一次lua_pop(L, 1),这样保证objectsLua的索引还是在-7

                skip = false;
            } while (false);
            
            if (skip)
            {
                lua_pop(L, 1);                                          /* L: objs colls evts dists id1 dists[obj1] id2 */
            }
        }                                                               /* L: objs colls evts dists id1 dists[obj1] */
		/*
		在table遍历结束的时候会lua_pop(L, 1)一次，然后下面又调用了一次lua_pop(L, 1), 所以前面两个就被pop掉了，objectsLua的索引还是在-5
		1.	 object2的索引，也就是object2.id_
		2.   newtable3

		3.	 object1的索引，也就是object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/
        lua_pop(L, 1);                                                  /* L: objs colls evts dists id1 */
    }                                                                   /* L: objs colls evts dists */
    // complete calc dists

	// 计算物体之间的距离结束


    
#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
    CCLOG(" - - - - ");
#endif

	finish1 = clock();
	std::cout << std::setprecision(15) << finish1 << '\n';
	CCLOG("test MapRuntimeC::tick 2 finish1 = %ld, cal dist cast time = %ld\n", finish1, finish1 - start);
    
    // ----------------------------------------
    
	/*
	调用lua_pushnil(L)后栈中的数据是这样的：  1代表栈顶
	1.   nil
	2.   newtable1
	3.   newtable2
	4.   collsLua
	5.   objectsLua

	// 之前给 newtable1 赋值过了， newtable1[object1] = newtable3
	// 现就就是newtable1[object1][object2] = dist
	*/
    // check collision and fire
    lua_pushnil(L);                                                     /* L: objs colls evts dists nil */
    while (lua_next(L, -2))                                             /* L: objs colls evts dists obj1 dists[obj1] */
    {

		/*
		调用lua_next(L, -2)后栈中的数据是这样的：  1代表栈顶
		1.   newtable1[object1]
		2.   object1
		3.   newtable1
		4.   newtable2
		5.   collsLua
		6.   objectsLua
		*/
		// lua_insert(L, n)	移动栈顶元素到指定索引的位置，并将这个索引位置上面的元素全部上移至栈顶被移动留下的空隔
        lua_insert(L, -2);                                              /* L: objs colls evts dists dists[obj1] obj1 */
		/*
		调用lua_insert(L, -2)后栈中的数据是这样的：  1代表栈顶
		1.   object1
		2.   newtable1[object1]
		3.   newtable1
		4.   newtable2
		5.   collsLua
		6.   objectsLua
		*/
        
		GET_OBJ_PROP_BOOL(fireEnabled1, "fireEnabled_")
			GET_OBJ_PROP_INT(fireLock1, "fireLock_")
			GET_OBJ_PROP_FLOAT(fireRange1, "fireRange_")
			GET_OBJ_PROP_FLOAT(fireCooldown1, "fireCooldown_")
			GET_OBJ_PROP_FLOAT(fireVision1, "fireVision_")



		// change by Owen, 2015.5.29, 去掉fireCooldown1的判定，这样fire事件就是表示在object的近战范围内有目标
		bool checkFire1 = fireEnabled1 && fireLock1 <= 0 && fireRange1 > 0; // && fireCooldown1 <= 0;
		//CCLOG("bool checkFire1 = %d", checkFire1);

        GET_OBJ_PROP_FLOAT(radius1, "radius_")
        
        GET_OBJ_PROP_FLOAT(x1, "x_")
        GET_OBJ_PROP_FLOAT(y1, "y_")
        GET_OBJ_PROP_FLOAT(rx1, "radiusOffsetX_")
        GET_OBJ_PROP_FLOAT(ry1, "radiusOffsetY_")
        x1 += rx1;
        y1 += ry1;

		#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
        lua_pushstring(L, "id_");
        lua_rawget(L, -2);
        const string id1 = string(lua_tostring(L, -1));
        lua_pop(L, 1);
        
		//   CCLOG("check fire and collision for static object %s, fireEnabled: %d, fireLock: %d, fireRange: %0.2f, fireCooldown: %0.2f",
              id1.c_str(), fireEnabled1, fireLock1, fireRange1, fireCooldown1);
		#endif

        // add nil target
        float minTargetDist = 999999;
        lua_pushnil(L);                                                 /* L: objs colls evts dists dists[obj1] obj1 target */
		/*
		调用lua_pushnil(L)后栈中的数据是这样的：  1代表栈顶
		1.   nil
		2.   object1
		3.   newtable1[object1]
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

		// lua_pushvalue(L, n) 压入堆栈上指定索引的一个抟贝到栈顶
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists dists[obj1] obj1 target obj1 */
		/*
		调用lua_pushvalue(L, -2)后栈中的数据是这样的：  1代表栈顶
		1.   object1
		2.   nil
		3.   object1
		4.   newtable1[object1]
		5.   newtable1
		6.   newtable2
		7.   collsLua
		8.   objectsLua
		*/

		// lua_rawget根据索引 n 指定取到相应的表; 取栈顶元素为key, 并弹出栈; 获取表中key的值压入栈顶.
        lua_rawget(L, -7);                                              /* L: objs colls evts dists dists[obj1] obj1 target colls[obj1] */
		/*
		调用lua_rawget(L, -7)后栈中的数据是这样的：  1代表栈顶
		1.   collsLua[object1]
		2.   nil
		3.   object1
		4.   newtable1[object1]
		5.   newtable1
		6.   newtable2
		7.   collsLua
		8.   objectsLua
		*/
        
		// 如果collsLua[object1] == nil
        if (!lua_istable(L, -1))
        {
            lua_pop(L, 1);                                              /* L: objs colls evts dists dists[obj1] obj1 target  */
            lua_newtable(L);                                            /* L: objs colls evts dists dists[obj1] obj1 target t */
            lua_pushvalue(L, -3);                                       /* L: objs colls evts dists dists[obj1] obj1 target t obj1 */
            lua_pushvalue(L, -2);                                       /* L: objs colls evts dists dists[obj1] obj1 target t obj1 t */
            lua_rawset(L, -9);                         /* colls[obj1] = t, L: objs colls evts dists dists[obj1] obj1 target colls[obj1] */
        }
		/*
		调用完上面的if语句后，给collsLua[object1]赋值， collsLua[object1] = newtable4
		栈中的数据是这样的：  1代表栈顶
		1.   newtable4
		2.   nil
		3.   object1
		4.   newtable1[object1]
		5.   newtable1
		6.   newtable2
		7.   collsLua
		8.   objectsLua
		*/
        
        lua_newtable(L);                                    /* new tfires, L: objs colls evts dists dists[obj1] obj1 target colls[obj1] tfires */
		// lua_insert(L, n)	移动栈顶元素到指定索引的位置，并将这个索引位置上面的元素全部上移至栈顶被移动留下的空隔
		lua_insert(L, -6);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] */
        int fires_num = 0;
		/*调用完上面的语句后，给collsLua[object1]赋值， collsLua[object1] = newtable4
			栈中的数据是这样的：  1代表栈顶
			1.   newtable4
			2.   nil
			3.   object1
			4.   newtable1[object1]
			5.   newtable1
			6.   newtable5
			7.   newtable2
			8.   collsLua
			9.   objectsLua
		*/
        
		// 对newtable1[object1]进行遍历，newtable1[object1][object2] = dist
        lua_pushnil(L);                                                 /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] nil */
        while (lua_next(L, -5))                                         /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 dist1to2 */
        {
			/*调用完上lua_next(L, -5)后栈中的数据是这样的：  1代表栈顶
			1.   dist
			2.   object2
			3.   newtable4
			4.   nil
			5.   object1
			6.   newtable1[object1]
			7.   newtable1
			8.   newtable5
			9.   newtable2
			10.   collsLua
			11.   objectsLua
			*/

            float dist1to2 = lua_tonumber(L, -1);
            lua_pop(L, 1);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
			/*调用完上lua_pop(L, 1)，也就是弹出一个元素后，栈中的数据是这样的：  1代表栈顶
			1.   object2
			2.   newtable4
			3.   nil
			4.   object1
			5.   newtable1[object1]
			6.   newtable1
			7.   newtable5
			8.   newtable2
			9.   collsLua
			10.   objectsLua
			*/
            
            GET_OBJ_PROP_FLOAT(radius2, "radius_")
            GET_OBJ_PROP_FLOAT(x2, "x_")
            GET_OBJ_PROP_FLOAT(y2, "y_")
            GET_OBJ_PROP_FLOAT(rx2, "radiusOffsetX_")
            GET_OBJ_PROP_FLOAT(ry2, "radiusOffsetY_")
            GET_OBJ_PROP_INT(classIndex2, "classIndex_")
			//CCLOG("haha classIndex2 = %d \n", classIndex2);
            
            float frv = fireVision1;
            if (classIndex2 == kMapObjectClassIndexRange){
                frv = radius1;
            }

            
            x2 = x2 + rx2;
            y2 = y2 + ry2;

			// change by Owen, 2015.8.31，先做一个简单的判定，两者距离大于了frv + radius1 + radius2，那么就肯定没有碰撞了
			bool isCollision = false;
			
			if (dist1to2 > (frv + radius1 + radius2))
			{
				isCollision = false;
			}
			else
			{

				float dx = x2 - x1;
				float dy = y2 - y1;
				
				// dist3 这个变量根本没被用到
				//float dist3 = sqrtf(dx * dx + dy * dy);
				
				float fr = frv*frv;
				float dist2 = dist1to2*dist1to2;
				float frp = sqrtf(0.64*fr*dx*dx / dist2 + fr*dy*dy / dist2);
				float temp_fireVision = 0.8*fr / frp;

				//bool isCollision = dist1to2 - temp_fireVision - radius2 <= 0;
				isCollision = dist1to2 - temp_fireVision - radius2 <= 0;
			}
            
            int event = 0;
			// lua_pushvalue(L, n) 压入堆栈上指定索引的一个抟贝到栈顶
            lua_pushvalue(L, -1);                                       /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 obj2 */
			/*调用完lua_pushvalue(L, -1)栈中的数据是这样的：  1代表栈顶
			1.   object2
			2.   object2
			3.   newtable4
			4.   nil
			5.   object1
			6.   newtable1[object1]
			7.   newtable1
			8.   newtable5
			9.   newtable2
			10.   collsLua
			11.   objectsLua
			*/

            lua_rawget(L, -3);                                          /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 colls[obj1][obj2] */
			// 取newtable4中的值，并压入栈顶，因为collsLua[object1] = newtable4，也就是取collsLua[object1]
			// 取的值为newtable4[object2]，也就是collsLua[object1][object2]，并压入栈顶
			/*调用完lua_pushvalue(L, -1)栈中的数据是这样的：  1代表栈顶
			1.   collsLua[object1][object2]
			2.   object2
			3.   collsLua[object1]
			4.   nil
			5.   object1
			6.   newtable1[object1]
			7.   newtable1
			8.   newtable5
			9.   newtable2
			10.   collsLua
			11.   objectsLua
			*/


            //if (isCollision && lua_isnil(L, -1))
            if (isCollision )
            {
                if (classIndex2 == kMapObjectClassIndexRange){
                    event = kMapEventCollisionBegan;
                }else{
                    if(lua_isnil(L, -1)) {
                        event = kMapEventCollisionBegan;
                    }
                }
            }
            else if (!isCollision && !lua_isnil(L, -1))
            {
                event = kMapEventCollisionEnded;
            }
            
            if (event != 0)
            {
                // update collision flag
                lua_pop(L, 1);                                          /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
                lua_pushvalue(L, -1);                                   /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 obj2 */
                if (event == kMapEventCollisionBegan)
                {
                    lua_pushboolean(L, 1);
                }
                else
                {
                    lua_pushnil(L);
                }
                lua_rawset(L, -4);               /* colls[obj1][obj2] = v, L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
                
                // add event, evt = {event[kMapEventCollisionBegan | kMapEventCollisionEnded], object1, object2}
                ++eventIndex;
                lua_newtable(L);                                        /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t */
                lua_pushinteger(L, event);                              /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t event */
                lua_rawseti(L, -2, 1);                    /* t[1] = event, L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t */
                lua_pushvalue(L, -5);                                   /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t obj1 */
                lua_rawseti(L, -2, 2);                    /* t[2] = obj1,  L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t */
                lua_pushvalue(L, -2);                                   /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t obj2 */
                lua_rawseti(L, -2, 3);                    /* t[3] = obj2,  L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 t */
                lua_rawseti(L, -9, eventIndex);        /* evts[index] = t, L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
            }
            else
            {
                lua_pop(L, 1);                                          /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
            }
            
        //    GET_OBJ_PROP_INT(classIndex2, "classIndex_")
            if (checkFire1 && classIndex2 == kMapObjectClassIndexStatic)
            {
				// change by Owen, 2015.8.31，先做一个简单的判定，两者距离大于了fireRange1 + radius1 + radius2，那么就肯定没有碰撞了

				float targetDist = 1.0;
				if (dist1to2 > (fireRange1 + radius1 + radius2))
				{
				}
				else
				{

					float dx = x2 - x1;
					float dy = y2 - y1;
					float fr = fireRange1*fireRange1;
					float dist2 = dist1to2*dist1to2;
					float frp = sqrtf(0.64*fr*dx*dx / dist2 + fr*dy*dy / dist2);
					float temp_fireRange = 0.8*fr / frp;
					//float targetDist = dist1to2 - temp_fireRange - radius2;
					targetDist = dist1to2 - temp_fireRange - radius2;
				}


              //  if (targetDist <= 0 && targetDist < minTargetDist)
                if (targetDist <= 0)
                {
                    if (targetDist < minTargetDist ) {
                        minTargetDist = targetDist;
                        // found target in fire range
                        lua_insert(L, -3);                                  /* L: objs colls evts tfires dists dists[obj1] obj1 obj2 target colls[obj1] */
                        lua_pushvalue(L, -3);                               /* L: objs colls evts tfires dists dists[obj1] obj1 obj2 target colls[obj1] obj2 */
                        lua_remove(L, -3);                   /* target = obj2, L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 */
                    }
                    // add event, evt = {event[kMapEventCollisionFire], obj1, target}
//                    ++eventIndex;
//                    lua_newtable(L);                                            /* L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t */
//                    lua_pushinteger(L, kMapEventCollisionFire);                 /* L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t event */
//                    lua_rawseti(L, -2, 1);                        /* t[1] = event, L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t */
//                    lua_pushvalue(L, -5);                                       /* L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t obj1 */
//                    lua_rawseti(L, -2, 2);                        /* t[2] = obj1,  L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t */
//                    lua_pushvalue(L, -2);                                       /* L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t target */
//                    lua_rawseti(L, -2, 3);                      /* t[3] = target,  L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 t */
//                    lua_rawseti(L, -8, eventIndex);            /* evts[index] = t, L:  objs colls evts dists dists[obj1] obj1 target colls[obj1] obj2 */
                    ++fires_num;
                    
                    lua_pushvalue(L, -1);                                         /* L:  objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 target*/
                    lua_rawseti(L, -8, fires_num);
                    
                }
            }
            
			#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
            lua_pushstring(L, "id_");
            lua_rawget(L, -2);
            const string id2 = string(lua_tostring(L, -1));
            lua_pop(L, 1);
            
            CCLOG("    -> %s %s%s",
                  classIndex2 == kMapObjectClassIndexStatic ? "static object" : "range",
                  id2.c_str(),
                  event != 0 ? (event == kMapEventCollisionBegan ? ", collision began" : ",collision ended") : "");
			#endif
        }                                                               /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] */
        
        lua_pop(L, 1);                                                  /* L: objs colls evts tfires dists dists[obj1] obj1 target */
        
        if (!lua_isnil(L, -1))
        {
            lua_pop(L, 1);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 */
            
            // add event, evt = {event[kMapEventCollisionFire], obj1, tfires}
            lua_pushvalue(L, -4);                                       /* L: objs colls evts tfires dists dists[obj1] obj1 tfires */
            ++eventIndex;
            lua_newtable(L);                                            /* L: objs colls evts tfires dists dists[obj1] obj1 tfires t */
            lua_pushinteger(L, kMapEventCollisionFire);                 /* L: objs colls evts tfires dists dists[obj1] obj1 tfires t event */
            lua_rawseti(L, -2, 1);                        /* t[1] = event, L: objs colls evts tfires dists dists[obj1] obj1 tfires t */
            lua_pushvalue(L, -3);                                       /* L: objs colls evts tfires dists dists[obj1] obj1 tfires t obj1 */
            lua_rawseti(L, -2, 2);                        /* t[2] = obj1,  L: objs colls evts tfires dists dists[obj1] obj1 tfires t */
            lua_insert(L, -2);                                          /* L: objs colls evts tfires dists dists[obj1] obj1 t tfires */
            lua_rawseti(L, -2, 3);                      /* t[3] = target,  L: objs colls evts tfires dists dists[obj1] obj1 t */
            lua_rawseti(L, -6, eventIndex);            /* evts[index] = t, L: objs colls evts tfires dists dists[obj1] obj1 */
        }
        else if (checkFire1)
        {
            // add event evt = {event[kMapEventCollisionNoTarget], obj1}
            ++eventIndex;
            lua_newtable(L);                                            /* L: objs colls evts tfires dists dists[obj1] obj1 target t */
            lua_pushinteger(L, kMapEventCollisionNoTarget);             /* L: objs colls evts tfires dists dists[obj1] obj1 target t event */
            lua_rawseti(L, -2, 1);                        /* t[1] = event, L: objs colls evts tfires dists dists[obj1] obj1 target t */
            lua_pushvalue(L, -3);                                       /* L: objs colls evts tfires dists dists[obj1] obj1 target t obj1 */
            lua_rawseti(L, -2, 2);                        /* t[2] = obj1,  L: objs colls evts tfires dists dists[obj1] obj1 target t */
            lua_rawseti(L, -7, eventIndex);            /* evts[index] = t, L: objs colls evts tfires dists dists[obj1] obj1 target */
            lua_pop(L, 1);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 */
        }
        else
        {
            lua_pop(L, 1);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 */
        }
        
        lua_insert(L, -2);                                              /* L: objs colls evts tfires dists obj1 dists[obj1] */
        
        lua_pop(L, 1);                                                  /* L: objs colls evts tfires dists obj1 */
        
        lua_remove(L, -3);                                               /* L: objs colls evts dists obj1 */
        
    }                                                                   /* L: objs colls evts dists */
    
	finish2 = clock();
	elapsed_time1 = finish1 - start;
	elapsed_time2 = finish2 - finish1;
	CCLOG("test MapRuntimeC::tick 1 %f,    %f\n", elapsed_time1, elapsed_time2);

    
    lua_pop(L, 1);                                                      /* L: objs colls evts */
    return 1;
}


// checks = {evts, dists, colls}

LUA_TABLE MapRuntimeC::getFireTargets(LUA_TABLE objectLua,LUA_TABLE targetsLua, LUA_TABLE collsLua,int firerange)
{
    //CCLOG("  firerange   -> %d",firerange);
    unsigned int eventIndex = 0;                                        /* L: obj targets colls */
    lua_pop(L, 1);
    lua_pushvalue(L,-3);                                                /* L: obj targets colls obj */
  //  CCLOG("  firerange   -> %d",firerange);

    GET_OBJ_PROP_FLOAT(x1, "x_")
    GET_OBJ_PROP_FLOAT(y1, "y_")
    GET_OBJ_PROP_FLOAT(rx1, "radiusOffsetX_")
    GET_OBJ_PROP_FLOAT(ry1, "radiusOffsetY_")
  //  GET_OBJ_PROP_FLOAT(fireRange1,    "fireRange_")

    x1 += rx1;
    y1 += ry1;
    
    lua_pop(L,1);                                                       /* L: obj targets colls */
    
	// calc static objects dist
    lua_pushnil(L);                                                     /* L: obj targets colls nil */

    
    while (lua_next(L, -3))                                             /* L: obj targets colls id1 obj1 */
    {
        
        GET_OBJ_PROP_INT(classIndex2, "classIndex_")
        if (classIndex2 == kMapObjectClassIndexStatic)
        {
            GET_OBJ_PROP_FLOAT(x2, "x_")
            GET_OBJ_PROP_FLOAT(y2, "y_")
            GET_OBJ_PROP_FLOAT(rx2, "radiusOffsetX_")
            GET_OBJ_PROP_FLOAT(ry2, "radiusOffsetY_")
            GET_OBJ_PROP_FLOAT(radius2, "radius_")
            
            x2 += rx2;
            y2 += ry2;
            
            float dx = (x2 + rx2) - x1;
            float dy = (y2 + ry2) - y1;
            float dist1to2 = sqrtf(dx * dx + dy * dy);

            float fr = firerange*firerange;
            float dist2 = dist1to2*dist1to2;
            
            float frp = 0;
            if(dist2 > 0 ){
                frp = sqrtf(0.64*fr*dx*dx/dist2+fr*dy*dy/dist2);
            }
            float temp_fireRange = 0.8*fr/frp;
            float targetDist = dist1to2 - temp_fireRange - radius2;
            
            if (targetDist <= 0 ){
                ++eventIndex;
                lua_rawseti(L, -3, eventIndex);                             /* colls[index]=obj1 L: obj targets colls id1 */
            }else{ 
                lua_pop(L,1);                                            /* L: obj targets colls id1 */
            }
        }else{
            lua_pop(L,1);                                            /* L: obj targets colls id1 */
        }
    }
    lua_pop(L,1);
    
    return 1;
}


//NS_MAP_GAME_LUABINDING_END
