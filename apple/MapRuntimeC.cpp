
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

// ����kMapEventCollisionBegan��kMapEventCollisionEnd�¼�
// �ж�staticIndex�ǲ�������rangeIndexΪ���ģ�radiusΪ�뾶�İ�Բ��
void MapRuntimeC::dealCollision(LuaObject* obj, LuaObject* range, float checkRadius, bool needCheckFireRange)
{
	// ���������ʱ4ms

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();

	// �����5�д���ִ��619�Σ���ʱ6ms
	// ��ѯstatic�ǲ��������range��
	bool bBeforeInRange = false;

	std::string *objId = &obj->id_;    // static obj��id_
	int         rangeIndex_ = range->index_;
	std::string *rangeId = &range->id_;    // range obj��id_

	//std::string *objId = &checkObjects[staticIndex].id_;    // static obj��id_
	//std::string *rangeId = &checkObjects[rangeIndex].id_;    // range obj��id_

	vector<std::string> &inRangeObjs = objInRangeMap[rangeIndex_];
	testSize = testSize + inRangeObjs.size();

	if (inRangeObjs.size() > 0)
	{
		int size = inRangeObjs.size();
		int k = 0;
		for (; k < size; k++)
		{
			// �Ƚ�id�Ƿ���ȣ����� std::string ����ֱ���� ==
			if (inRangeObjs[k] == *objId)
			{
				bBeforeInRange = true;
				break;
			}

		}
	}


	// ��һ�������ǲ�����range��
	bool bNowInRange = false;
	float x1 = obj->x_ + obj->radiusOffsetX_;
	float y1 = obj->y_ + obj->radiusOffsetY_;
	float x2 = range->x_ + range->radiusOffsetX_;
	float y2 = range->y_ + range->radiusOffsetY_;
	
	if ((fabs(x2 - x1) > checkRadius + obj->radius_)
		|| (fabs(y2 - y1) > checkRadius + obj->radius_))
	{
		// ֮ǰ��range�У����ڲ�����
		if (bBeforeInRange)
		{
			int size = inRangeObjs.size();
			int k = 0;
			for (; k < inRangeObjs.size(); k++)
			{
				// �Ƚ�id�Ƿ���ȣ����� std::string ����ֱ���� ==
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
			// ֮ǰ����range�У���������
			if (!bBeforeInRange)
			{
				inRangeObjs.push_back(*objId);
			}
		}
		else
		{
			// ֮ǰ��range�У����ڲ�����
			if (bBeforeInRange)
			{
				int size = inRangeObjs.size();
				int k = 0;
				for (; k < inRangeObjs.size(); k++)
				{
					// �Ƚ�id�Ƿ���ȣ����� std::string ����ֱ���� ==
					if (inRangeObjs[k] == *objId)
					{
						inRangeObjs.erase(inRangeObjs.begin() + k);
						break;
					}

				}
			}
		}
	}

	// ���֮ǰ��range�У�������range���棬����¼�kMapEventCollisionEnded����ѹ��key����ѹ��value��Ȼ�����rawset
	// ��һ��ѹ������¼����ڶ�����static���ڶ�����range
	/*
		eventTable
		eventIndex
		eventsTable
	*/
	if ((!bBeforeInRange && bNowInRange) || (bBeforeInRange && !bNowInRange))
	{
		// ѹ��event��key
		lua_pushnumber(L, eventIndex);
		// ѹ��event table
		lua_newtable(L);
		lua_pushnumber(L, 1);

		// ֮ǰ����range�У���������
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
		// ѹ��event��Ҫ���ظ�lua�����events����
		lua_rawset(L, -3);
		
		// �¼�����Ҫ+1
		eventIndex++;
	}
}


// �ж�target�ǲ�����object��fireRange��
void MapRuntimeC::dealFire(LuaObject* target, LuaObject* object, float fireRange)
{
	// ���������ʱ3ms

	// �ж�range�ǲ�����object��fireRange��
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
		// ��ʱ4ms
		inFire->push_back(target->id_);

		/*
		// ѹ��event��key
		lua_pushnumber(L, eventIndex);
		// ѹ��event table
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
		// ѹ��event��Ҫ���ظ�lua�����events����
		lua_rawset(L, -3);

		// �¼�����Ҫ+1
		eventIndex++;
		*/
	}
}


LUA_TABLE MapRuntimeC::newTick(LUA_TABLE objectsLua, LUA_TABLE collsLua, LUA_TABLE addObjs, LUA_TABLE removeObjs, float dt)
{
	// ���ظ�lua��events���������
	eventIndex  = 1;
	testSize	= 0;

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();
	//CCLOG("test MapRuntimeC::tick 1 start = %ld\n", start);

	// �Ƴ�����Ҫ��������
	lua_pushnil(L);
	while (lua_next(L, -3))
	{
		// ��������id_����
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

	// ����µ���Ҫ��������
	lua_pushnil(L);
	while (lua_next(L, -4))
	{
		// ��õ�һ�����������

		GET_OBJ_PROP_STRING(id_, "id_")
		GET_OBJ_PROP_INT(index_, "index_");	// �����id��������֣��ǲ����ظ��ģ�������Ϊmap��idʹ��

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

	// ����vector�еĶ����x��y����
	// ����µ���Ҫ��������

	int size = checkObjects.size();
	lua_pushnil(L);
	LuaObject *updateXYObj;
	while (lua_next(L, -6))
	{
		GET_OBJ_PROP_INT(secondIndex_, "index_")
		GET_OBJ_PROP_FLOAT(secondX_, "x_")
		GET_OBJ_PROP_FLOAT(secondY_, "y_")
		GET_OBJ_PROP_INT(secondCurState, "curState");

		// ���map�в��������Ԫ�صĻ����ṹ��һ���µ�LuaObject������id_ = ""
		updateXYObj = &mapCheckObjects[secondIndex_];
		if (secondIndex_ == updateXYObj->index_)
		{
			updateXYObj->x_ = secondX_;
			updateXYObj->y_ = secondY_;
			updateXYObj->curState = secondCurState;
			
			// �����Ӣ�ۻ��߹������Ҫ��ȡ��ս����Ŀ��
			if (updateXYObj->campId_ == HERO_CAMP || updateXYObj->campId_ == MONSTER_CAMP)
			{
				GET_OBJ_PROP_INT(second_WillNearAttackIndex, "_willNearAttackIndex");
				updateXYObj->_willNearAttackIndex = second_WillNearAttackIndex;
			}
		}
		/*
		// �����������Ҫ����4-5����
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

	// ����lua��events�¼�
	lua_newtable(L);

	finish1 = clock();
	//CCLOG("test MapRuntimeC::tick 1-0 size = %d finish1 = %ld cast_time 1 = %ld\n", size, finish1, finish1 - start);

	start = finish1;

	// ������������ľ��벢��ã� size Ϊ257��ʱ��PC�ϼ���Ҫ8����
	float x1, y1, x2, y2;
	float dx, dy, dist;
	int campId_i, campId_j, maskId_i, maskId_j;
	int i, j;
	LuaObject * i_obj;
	LuaObject * j_obj;
	LuaObject * range;		// ����dealCollision ��range��fireVision���ж�
	LuaObject * obj;		// ����dealCollision ��range��fireVision���ж�
	bool        bMapData = false;
	//map <std::string, LuaObject>::iterator i_Iter = mapCheckObjects.begin();
	//map <std::string, LuaObject>::iterator j_Iter;

	// �ȸ���vector�е�����
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
		// ��map��ȡ���������壬��Ϊֻ��map�е�����x��y��ʵʱ�޸�
		//i_obj = &mapCheckObjects[checkObjects[i].id_];

		// �������ٻ��߲�����ײ���������һ���ж�
		if (i_obj->destroyed_ || (!i_obj->collisionEnabled_))
		{
			continue;
		}

		//x1 = i_obj->x_ + i_obj->radiusOffsetX_;
		//y1 = i_obj->y_ + i_obj->radiusOffsetY_;

		for (j = i + 1; j < size; j++)
		{
			j_obj = &checkObjects[j];
			// ��map��ȡ���������壬��Ϊֻ��map�е�����x��y��ʵʱ�޸�
			//j_obj = &mapCheckObjects[checkObjects[j].id_];
		
			// �������ٻ��߲�����ײ���������һ���ж�
			if (j_obj->destroyed_ || (!j_obj->collisionEnabled_))
			{
				continue;
			}
			// �����������range���ͣ�����Ҫ�ж�
			if (i_obj->classIndex_ == kMapObjectClassIndexRange && j_obj->classIndex_ == kMapObjectClassIndexRange)
			{
				continue;
			}

			bMapData = false;
			// ���һ����static��һ����range
			if (i_obj->classIndex_ != j_obj->classIndex_)
			{

				// �����һ����range���ڶ�����static
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
			// ��������static
			if (i_obj->classIndex_ == kMapObjectClassIndexStatic && j_obj->classIndex_ == kMapObjectClassIndexStatic)
			{

				// �ж���Ӫ�Ĳ���Ҫ��ײ���

				campId_i = i_obj->campId_;
				maskId_i = i_obj->maskId_;

				campId_j = j_obj->campId_;
				maskId_j = j_obj->maskId_;
				//bool flag = campId2 & maskId1;
				// ��ʾ j_obj ���� i_obj ���Թ�����Ŀ��
				if (campId_i && (maskId_i & campId_j ))
				{
					// ����fireVision_����kMapEventCollisionBegan�¼�

					int i_FireVision = i_obj->fireVision_;
					int j_FireVision = j_obj->fireVision_;
					// ����Ⱦͱ�ʾ��Զ�̵�
					if (i_FireVision > 80) //i_obj->fireRange_)
					{
						// �ж� j �ǲ��ǽ����� i ��fireVision
						dealCollision(j_obj, i_obj, i_obj->fireVision_, false);	// , x2, y2, x1, y1);
					}
					if (i_obj->fireRange_ > 0)
					{
						if (i_obj->campId_ == MONSTER_CAMP)
						{
							// ����ֻ����IDLE״̬����Ҫ�ж�
							if (i_obj->curState == ObjectState_IDLE && i_obj->_willNearAttackIndex != 0)
							{
								// �ж� j �ǲ��� i Ҫ��ս������Ŀ��
								if (j_obj->index_ == i_obj->_willNearAttackIndex)
								{
									// �ж� j �ǲ��ǽ����� i ��fireRange
									dealFire(j_obj, i_obj, i_obj->fireRange_);
								}
							}
						}
						else if(i_obj->campId_ == HERO_CAMP)
						{
							// Ӣ���н�ս����Ŀ���ʱ�����Ҫ�ж�
							if (i_obj->_willNearAttackIndex != 0)
							{
								// �ж� j �ǲ��� i Ҫ��ս������Ŀ��
								if (j_obj->index_ == i_obj->_willNearAttackIndex)
								{
									// �ж� j �ǲ��ǽ����� i ��fireRange
									dealFire(j_obj, i_obj, i_obj->fireRange_);	// , x2, y2, x1, y1);
								}
							}
						}
						else
						{
							// �ж� j �ǲ��ǽ����� i ��fireRange
							dealFire(j_obj, i_obj, i_obj->fireRange_);	// , x2, y2, x1, y1);
						}
					}
				}

				// ��ʾ i_obj ���� j_obj ���Թ�����Ŀ��
				if (campId_j && (maskId_j & campId_i))
				{
					int i_FireVision = i_obj->fireVision_;
					int j_FireVision = j_obj->fireVision_;

					if (j_FireVision > 80)
					{
						// �ж� i �ǲ��ǽ����� i ��fireVision
						dealCollision(i_obj, j_obj, j_obj->fireVision_, false);	// , x1, y1, x2, y2);
					}
					if (j_obj->fireRange_ > 0)
					{
						if (j_obj->campId_ == MONSTER_CAMP)
						{
							// ����ֻ����IDLE״̬����Ҫ�ж�
							if (j_obj->curState == ObjectState_IDLE && j_obj->_willNearAttackIndex != 0)
							{
								// �ж� i �ǲ��� j Ҫ��ս������Ŀ��
								if (i_obj->index_ == j_obj->_willNearAttackIndex)
								{
									// �ж� i �ǲ��ǽ����� j ��fireRange
									dealFire(i_obj, j_obj, j_obj->fireRange_);
								}
							}
						}
						else if (j_obj->campId_ == HERO_CAMP)
						{
							// Ӣ���н�ս����Ŀ���ʱ�����Ҫ�ж�
							if (j_obj->_willNearAttackIndex != 0)
							{
								// �ж� i �ǲ��� j Ҫ��ս������Ŀ��
								if (i_obj->index_ == j_obj->_willNearAttackIndex)
								{
									// �ж� i �ǲ��ǽ����� j ��fireRange
									dealFire(i_obj, j_obj, j_obj->fireRange_);	// , x1, y1, x2, y2);
								}
							}
						}
						else
						{
							// �ж� i �ǲ��ǽ����� j ��fireRange
							dealFire(i_obj, j_obj, j_obj->fireRange_);	// , x1, y1, x2, y2);
						}
					}
				}
			}
		}
	}

	// ���������Ժ���װFire�¼�
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
				// ����noTarget�¼�

				// ѹ��event��key
				lua_pushnumber(L, eventIndex);
				// ѹ��event table
				lua_newtable(L);
				lua_pushnumber(L, 1);
				lua_pushnumber(L, kMapEventCollisionNoTarget);
				lua_rawset(L, -3);
				lua_pushnumber(L, 2);
				lua_pushstring(L, objId.c_str());
				lua_rawset(L, -3);

				// ѹ��event��Ҫ���ظ�lua�����events����
				lua_rawset(L, -3);

				// �¼�����Ҫ+1
				eventIndex++;
			}
			else
			{
				// ����Fire�¼�

				// ѹ��event��key
				lua_pushnumber(L, eventIndex);
				// ѹ��event table
				lua_newtable(L);
				lua_pushnumber(L, 1);
				lua_pushnumber(L, kMapEventCollisionFire);
				lua_rawset(L, -3);
				lua_pushnumber(L, 2);
				lua_pushstring(L, objId.c_str());
				lua_rawset(L, -3);
				// ѹ��targets����һ��table
				lua_pushnumber(L, 3);
				lua_newtable(L);
				for (j = 0; j < inFireVector->size(); j++)
				{
					tarId = (*inFireVector)[j]; //->at[j];
					lua_pushnumber(L, j + 1);
					lua_pushstring(L, tarId.c_str());
					lua_rawset(L, -3);
				}
				// ѹ��targets����һ��table
				lua_rawset(L, -3);
				// ѹ��Fire event
				lua_rawset(L, -3);
				eventIndex++;
				// ���vector��map
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
// �ű���������table�Ƿ���ջ���ģ���ջ��-1λ��
// ջ����-1��ջ����1��Ҳ���ǵ� 1 ����ջ����ջ�ף�Ҳ������ô˵��������ʾ�����ջ�׵�λ�ã�λ�ƣ���������ʾ�����ջ����λ�ã�λ�ƣ���
// ��һ����ջ��Ϊ1�����һ����ջ��Ϊ-1

/*
�õ���lua api��
	lua_pop(L,n)        �Ӷ�ջ�е��� n ��Ԫ��
	lua_pushvalue(L, n) ѹ���ջ��ָ��������һ���ұ���ջ��
	lua_insert(L, n)	�ƶ�ջ��Ԫ�ص�ָ��������λ�ã������������λ�������Ԫ��ȫ��������ջ�����ƶ����µĿո�
	lua_remove(L, n)    �Ƴ�ָ������λ�õ�Ԫ�أ��������������е�Ԫ������������λ�õĿհ�

�Ա�Ĳ�����
	lua_newtable(L)		����һ���µĿ� table Ȼ������ջ
	lua_settable(L, n)  �õ����� n ָ���table��Ȼ���ջ������һ��value���ٵ���һ��key����������ֵ�޸� table��������һ����ֵ��
	lua_rawset(L, n)    ��lua_settable��һ���ģ�����lua_settable������ __newindex Ԫ��������lua_rawset���ᴥ��metatable��__newindex
	lua_rawseti(L, index, key)  ȡ��indexָ�������table����ջ����ֵ��������ֵ��ȡ���� table ���� key�����������Ӻ��޸�
	lua_gettable(L,n)   �������� n ָ��ȡ����Ӧ�ı�; ȡջ��Ԫ��Ϊkey, ������ջ; ��ȡ����key��ֵѹ��ջ��.
	lua_rawget(L, n)    ��lua_gettableһ����ֻ�ǲ��ᴥ��metatable��__index
	
*/

LUA_TABLE MapRuntimeC::tick(LUA_TABLE objectsLua, LUA_TABLE collsLua, float dt)
{

	clock_t       start, finish1, finish2;
	long        elapsed_time1, elapsed_time2;
	start = clock();
	CCLOG("test MapRuntimeC::tick 1 start = %ld\n", start);


	// ��dt��ջ������������ջ����collsLua
    lua_pop(L, 1);                                                      /* L: objs colls */
	// ����һ��table������ջ��
	// table��ջ��Ϊ-1��ѹ��һ��ֵ��ԭ����ջ�����-2
    lua_newtable(L);                                                    /* L: objs colls evts */
    lua_newtable(L);                                                    /* L: objs colls evts dists */
    
    unsigned int eventIndex = 0;
    
	// calc static objects dist
    lua_pushnil(L);                                                     /* L: objs colls evts dists nil */
	
	/*
		����ջ�е������������ģ�  1����ջ��
		1��  nil
		2.   newtable1
		3.   newtable2
		4.   collsLua
		5.   objectsLua
		����Ҫ����objec��ʱ���Ҫ��-5�������
	*/

#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
    CCLOG("----------------------------------------");
#endif
	// ���λ�ȡһ��object��ֻ��static object��������ײ���
	// static object����Range��������static object�����
	// ������lua_next��������Ժ�ջ����ֵ�ͱ����objectsLua table�е�һ����ֵ�Ե�ֵvalue
	// �ڴ��������value���������while (lua_next(L, -5))��������һ��valueʱ������Ҫ��ջ��pop��lua_pop(L, 1);
    while (lua_next(L, -5))                                             /* L: objs colls evts dists id1 obj1 */
    {
		/* 
			����ջ����-1���� value��-2 λ���Ƕ�Ӧ�� key 
			����ջ�е������������ģ�  1����ջ��
			1.   objectsLua�д����Ҫ����objects�е�һ��value��object1
			2.	 object1��������Ҳ����object1.id_
			3.   newtable1
			4.   newtable2
			5.   collsLua
			6.   objectsLua
		*/

		/*
			lua_pushnil( pLua );  // nil ��ջ��Ϊ��ʼ key 
			while( 0 != lua_next( pLua, nIndex ) ) 
			{ 
				// ����ջ����-1���� value��-2 λ���Ƕ�Ӧ�� key 
				// ��������ж� key ��ʲô���Ҷ� value ���и��ִ��� 
				lua_pop( pLua, 1 );  // ���� value���� key ����ջ�� 
			} 
			lua_next() ��������Ĺ��������ǣ�
			1) �ȴ�ջ������һ�� key
			2) ��ջָ��λ�õ� table ��ȡ��һ�� key-value���Ƚ� key ��ջ�ٽ� value ��ջ
			3) ����� 2 ���ɹ��򷵻ط� 0 ֵ�����򷵻� 0�����Ҳ���ջ��ѹ���κ�ֵ
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
        
		// �������static���������ٵȣ�����Ҫ�������������ж���
        if (skip)
        {
            lua_pop(L, 1);                                              /* L: objs colls evts dists id1 */
            continue;
        }
        
		// ��õ�һ�����������
        GET_OBJ_PROP_FLOAT(x1, "x_")
        GET_OBJ_PROP_FLOAT(y1, "y_")
        GET_OBJ_PROP_FLOAT(rx1, "radiusOffsetX_")
        GET_OBJ_PROP_FLOAT(ry1, "radiusOffsetY_")
        x1 += rx1;
        y1 += ry1;
        
        GET_OBJ_PROP_INT(campId1, "campId_")
        GET_OBJ_PROP_INT(maskId1, "maskId_")
        // dists[obj1] = {}
		// �½�һ��table��ѹջ
        lua_newtable(L);                                                /* L: objs colls evts dists id1 obj1 t */

		/* ����lua_newtable��ջ�е������������ģ�  1����ջ��

		1.   newtable3
		2.   objectsLua�д����Ҫ����object1
		3.	 object1��������Ҳ����object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

		// lua_pushvalue(L, n) ѹ���ջ��ָ��������һ���ұ���ջ��, ����-2λ�õ�ֵ��Ȼ������ŵ�ջ��
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists id1 obj1 t obj1 */
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists id1 obj1 t obj1 t */

		/* ��������lua_pushvalue��ջ�е������������ģ�  1����ջ��
		1.   newtable3
		2.	 objectsLua�д����Ҫ����object1
		3.   newtable3
		4.   objectsLua�д����Ҫ����object1
		5.	 object1��������Ҳ����object1.id_
		6.   newtable1
		7.   newtable2
		8.   collsLua
		9.   objectsLua
		*/

		// �õ�-6ָ���table��Ȼ���ջ������һ��value���ٵ���һ��key����������ֵ�޸� table��������һ����ֵ��
		// ��newtable1 ��ֵ   newtable1[object1] = newtable3
        lua_rawset(L, -6);                             /* dists[obj1] = t, L: objs colls evts dists id1 obj1 t */

		/* ����lua_rawset(L, -6)��ջ�е������������ģ�  1����ջ��
		1.   newtable3
		2.   objectsLua�д����Ҫ����object1
		3.	 object1��������Ҳ����object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

        // lua_remove �Ƴ�ָ������λ�õ�Ԫ�أ��������������е�Ԫ������������λ�õĿհ�
		lua_remove(L, -2);                                              /* L: objs colls evts dists id1 dists[obj1] */

		/* ����lua_remove(L, -2)��ջ�е������������ģ�  1����ջ��
		1.   newtable3
		2.	 object1��������Ҳ����object1.id_
		3.   newtable1
		4.   newtable2
		5.   collsLua
		6.   objectsLua
		*/

        
		// ȡ����table����ĵ�һ��static�����Ժ󣬱����������е����壬�ֱ����Ƚϣ�ֻ��static��range������ܱȽ�
		// ͨ�� campId��maskId �޳�������������������ײ��������
		// ����λ����-6�������ֲ�����һ��nil�����Ա��-7
        // calc dists to other static objects and range objects
        lua_pushnil(L);                                                 /* L: objs colls evts dists id1 dists[obj1] nil */
        while (lua_next(L, -7))                                         /* L: objs colls evts dists id1 dists[obj1] id2 obj2 */
        {

			/*
			����ջ����-1���� value��-2 λ���Ƕ�Ӧ�� key
			����ջ�е������������ģ�  1����ջ��
			1.   objectsLua�д����Ҫ����object2
			2.	 object2��������Ҳ����object2.id_
			3.   newtable3
			4.	 object1��������Ҳ����object1.id_
			5.   newtable1
			6.   newtable2
			7.   collsLua
			8.   objectsLua
			*/

            bool skip = true;
            
            do
            {
				// ��� -2 �� -4 λ���ϵ�object.id_��ͬ����ô��ʾ��ͬһ�����壬����Ҫ������ļ����
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
				// ��ջ��ѹ��һ��number dist
                lua_pushnumber(L, dist);                                /* L: objs colls evts dists id1 dists[obj1] id2 obj2 dist1to2 */
				/*
				����ջ�е������������ģ�  1����ջ��
				1.   dist
				2.   objectsLua�д����Ҫ����object2
				3.	 object2��������Ҳ����object2.id_
				4.   newtable3
				5.	 object1��������Ҳ����object1.id_
				6.   newtable1
				7.   newtable2
				8.   collsLua
				9.   objectsLua
				*/

				// �õ�-4ָ���table��Ȼ���ջ������һ��value���ٵ���һ��key����������ֵ�޸� table��������һ����ֵ��
				// ��newtable1 ��ֵ   newtable3[object2] = dist
				// ֮ǰ�� newtable1 ��ֵ���ˣ� newtable1[object1] = newtable3
				// �־;���newtable1[object1][object2] = dist
				lua_rawset(L, -4);        /* dists[obj1][obj2] = dist1to2, L: objs colls evts dists id1 dists[obj1] id2 */
				/*
				����ջ�е������������ģ�  1����ջ��
				1.	 object2��������Ҳ����object2.id_
				2.   newtable3
				3.	 object1��������Ҳ����object1.id_
				4.   newtable1
				5.   newtable2
				6.   collsLua
				7.   objectsLua
				*/
				// ��Ϊ����skip = false�ˣ����в����ٽ���һ��lua_pop(L, 1),������֤objectsLua������������-7

                skip = false;
            } while (false);
            
            if (skip)
            {
                lua_pop(L, 1);                                          /* L: objs colls evts dists id1 dists[obj1] id2 */
            }
        }                                                               /* L: objs colls evts dists id1 dists[obj1] */
		/*
		��table����������ʱ���lua_pop(L, 1)һ�Σ�Ȼ�������ֵ�����һ��lua_pop(L, 1), ����ǰ�������ͱ�pop���ˣ�objectsLua������������-5
		1.	 object2��������Ҳ����object2.id_
		2.   newtable3

		3.	 object1��������Ҳ����object1.id_
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/
        lua_pop(L, 1);                                                  /* L: objs colls evts dists id1 */
    }                                                                   /* L: objs colls evts dists */
    // complete calc dists

	// ��������֮��ľ������


    
#if COCOS2D_DEBUG > 0 && kMapRuntimeDebug > 0
    CCLOG(" - - - - ");
#endif

	finish1 = clock();
	std::cout << std::setprecision(15) << finish1 << '\n';
	CCLOG("test MapRuntimeC::tick 2 finish1 = %ld, cal dist cast time = %ld\n", finish1, finish1 - start);
    
    // ----------------------------------------
    
	/*
	����lua_pushnil(L)��ջ�е������������ģ�  1����ջ��
	1.   nil
	2.   newtable1
	3.   newtable2
	4.   collsLua
	5.   objectsLua

	// ֮ǰ�� newtable1 ��ֵ���ˣ� newtable1[object1] = newtable3
	// �־;���newtable1[object1][object2] = dist
	*/
    // check collision and fire
    lua_pushnil(L);                                                     /* L: objs colls evts dists nil */
    while (lua_next(L, -2))                                             /* L: objs colls evts dists obj1 dists[obj1] */
    {

		/*
		����lua_next(L, -2)��ջ�е������������ģ�  1����ջ��
		1.   newtable1[object1]
		2.   object1
		3.   newtable1
		4.   newtable2
		5.   collsLua
		6.   objectsLua
		*/
		// lua_insert(L, n)	�ƶ�ջ��Ԫ�ص�ָ��������λ�ã������������λ�������Ԫ��ȫ��������ջ�����ƶ����µĿո�
        lua_insert(L, -2);                                              /* L: objs colls evts dists dists[obj1] obj1 */
		/*
		����lua_insert(L, -2)��ջ�е������������ģ�  1����ջ��
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



		// change by Owen, 2015.5.29, ȥ��fireCooldown1���ж�������fire�¼����Ǳ�ʾ��object�Ľ�ս��Χ����Ŀ��
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
		����lua_pushnil(L)��ջ�е������������ģ�  1����ջ��
		1.   nil
		2.   object1
		3.   newtable1[object1]
		4.   newtable1
		5.   newtable2
		6.   collsLua
		7.   objectsLua
		*/

		// lua_pushvalue(L, n) ѹ���ջ��ָ��������һ���ұ���ջ��
        lua_pushvalue(L, -2);                                           /* L: objs colls evts dists dists[obj1] obj1 target obj1 */
		/*
		����lua_pushvalue(L, -2)��ջ�е������������ģ�  1����ջ��
		1.   object1
		2.   nil
		3.   object1
		4.   newtable1[object1]
		5.   newtable1
		6.   newtable2
		7.   collsLua
		8.   objectsLua
		*/

		// lua_rawget�������� n ָ��ȡ����Ӧ�ı�; ȡջ��Ԫ��Ϊkey, ������ջ; ��ȡ����key��ֵѹ��ջ��.
        lua_rawget(L, -7);                                              /* L: objs colls evts dists dists[obj1] obj1 target colls[obj1] */
		/*
		����lua_rawget(L, -7)��ջ�е������������ģ�  1����ջ��
		1.   collsLua[object1]
		2.   nil
		3.   object1
		4.   newtable1[object1]
		5.   newtable1
		6.   newtable2
		7.   collsLua
		8.   objectsLua
		*/
        
		// ���collsLua[object1] == nil
        if (!lua_istable(L, -1))
        {
            lua_pop(L, 1);                                              /* L: objs colls evts dists dists[obj1] obj1 target  */
            lua_newtable(L);                                            /* L: objs colls evts dists dists[obj1] obj1 target t */
            lua_pushvalue(L, -3);                                       /* L: objs colls evts dists dists[obj1] obj1 target t obj1 */
            lua_pushvalue(L, -2);                                       /* L: objs colls evts dists dists[obj1] obj1 target t obj1 t */
            lua_rawset(L, -9);                         /* colls[obj1] = t, L: objs colls evts dists dists[obj1] obj1 target colls[obj1] */
        }
		/*
		�����������if���󣬸�collsLua[object1]��ֵ�� collsLua[object1] = newtable4
		ջ�е������������ģ�  1����ջ��
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
		// lua_insert(L, n)	�ƶ�ջ��Ԫ�ص�ָ��������λ�ã������������λ�������Ԫ��ȫ��������ջ�����ƶ����µĿո�
		lua_insert(L, -6);                                              /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] */
        int fires_num = 0;
		/*��������������󣬸�collsLua[object1]��ֵ�� collsLua[object1] = newtable4
			ջ�е������������ģ�  1����ջ��
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
        
		// ��newtable1[object1]���б�����newtable1[object1][object2] = dist
        lua_pushnil(L);                                                 /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] nil */
        while (lua_next(L, -5))                                         /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 dist1to2 */
        {
			/*��������lua_next(L, -5)��ջ�е������������ģ�  1����ջ��
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
			/*��������lua_pop(L, 1)��Ҳ���ǵ���һ��Ԫ�غ�ջ�е������������ģ�  1����ջ��
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

			// change by Owen, 2015.8.31������һ���򵥵��ж������߾��������frv + radius1 + radius2����ô�Ϳ϶�û����ײ��
			bool isCollision = false;
			
			if (dist1to2 > (frv + radius1 + radius2))
			{
				isCollision = false;
			}
			else
			{

				float dx = x2 - x1;
				float dy = y2 - y1;
				
				// dist3 �����������û���õ�
				//float dist3 = sqrtf(dx * dx + dy * dy);
				
				float fr = frv*frv;
				float dist2 = dist1to2*dist1to2;
				float frp = sqrtf(0.64*fr*dx*dx / dist2 + fr*dy*dy / dist2);
				float temp_fireVision = 0.8*fr / frp;

				//bool isCollision = dist1to2 - temp_fireVision - radius2 <= 0;
				isCollision = dist1to2 - temp_fireVision - radius2 <= 0;
			}
            
            int event = 0;
			// lua_pushvalue(L, n) ѹ���ջ��ָ��������һ���ұ���ջ��
            lua_pushvalue(L, -1);                                       /* L: objs colls evts tfires dists dists[obj1] obj1 target colls[obj1] obj2 obj2 */
			/*������lua_pushvalue(L, -1)ջ�е������������ģ�  1����ջ��
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
			// ȡnewtable4�е�ֵ����ѹ��ջ������ΪcollsLua[object1] = newtable4��Ҳ����ȡcollsLua[object1]
			// ȡ��ֵΪnewtable4[object2]��Ҳ����collsLua[object1][object2]����ѹ��ջ��
			/*������lua_pushvalue(L, -1)ջ�е������������ģ�  1����ջ��
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
				// change by Owen, 2015.8.31������һ���򵥵��ж������߾��������fireRange1 + radius1 + radius2����ô�Ϳ϶�û����ײ��

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
