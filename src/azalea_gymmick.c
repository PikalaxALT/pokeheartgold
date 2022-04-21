#include "overlay_01.h"
#include "unk_0203DE74.h"
#include "unk_02005D10.h"
#include "task.h"
#include "field_follow_poke.h"
#include "field_map_object.h"
#include "unk_02062108.h"
#include "unk_0205FD20.h"
#include "constants/sndseq.h"

struct Vec2U16 {
    u16 x;
    u16 z;
};

struct AzaleaGymWork {
    int unused_00;
    int modelIds[4]; // IDs of the spinarak
    u8 pathNodeCounter;
    u8 switchesState;
    u8 reqNewSegment;
    // param
    u8 spinarakNo;
    u8 startingPoint;
    u8 direction;
    u8 pathIdx;
    s8 playerZoff;
    BOOL reqStartDiagMovement;
    BOOL xzSigns[2];
    const struct Vec2U16 *targetXZ;
    VecFx32 vecPos;
    VecFx32 vecTranslBuf;
    // Effect of the spinarak crashing into the end
    int cameraShudderCount;
    int cameraShudderFrames;
    fx32 cameraShudderDirection;
    int delayCounter;
};

struct SpinarakRideWork {
    int state;
    FieldSystem *fsys;
};

struct SpinarakPathSpec {
    u16 length;
    u16 endpoint;
    const struct Vec2U16 *path;
};

BOOL ov04_0225463C(TaskManager *taskManager);
void ov04_02254724(SysTask *task, struct SpinarakRideWork *work);
BOOL ov04_02254CA4(TaskManager *taskManager);

#include "data/azalea_paths.h"

static const u16 ov04_022575D4[][2] = {
    {3, 31},
    {9, 31},
    {15, 31},
    {3, 24},
    {9, 24},
    {15, 24},
    {3, 16},
    {9, 16},
    {15, 16},
    {3, 9},
    {9, 9},
    {15, 9},
};

static inline u8 getSwitchState(union GymmickUnion *gymmickUnion, int color) {
    return (gymmickUnion->azalea.switches >> color) & 1;
}

void InitAzaleaGymPuzzleGimmick(FieldSystem *fsys) {
    struct AzaleaGymWork *work;
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    int i;

    fsys->unk4->unk_24 = AllocFromHeap(4, sizeof(struct AzaleaGymWork));
    MI_CpuClear8(fsys->unk4->unk_24, sizeof(struct AzaleaGymWork));
    work = fsys->unk4->unk_24;
    for (i = 0; i < 4; i++) {
        VecFx32 sp4 = {0, 0, 0};
        u16 x = ov04_022575D4[gymmickUnion->azalea.spiders[i]][0];
        u16 z = ov04_022575D4[gymmickUnion->azalea.spiders[i]][1];

        sp4.x = x * 16 * FX32_ONE;
        sp4.x += 8 * FX32_ONE;
        sp4.z = z * 16 * FX32_ONE;
        work->modelIds[i] = AddBgModelFromTemplate(fsys->bgModels, 118, &sp4, NULL, fsys->_3dAnimationMgr);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 1:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 2:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 3:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

void Fsys_FlipAzaleaGymSwitch(FieldSystem *fsys, u8 switchNo) {
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    u8 switchState;
    struct UnkStruct_ov01_02004004_sub *obj1, *obj2;

    PlaySE(SEQ_SE_DP_KI_GASYAN);

    if (switchNo == 0) {
        switchState = getSwitchState(gymmickUnion, 0);
        gymmickUnion->azalea.switches ^= 1;
        obj1 = ov01_022040D0(fsys->unkC0, 116);
        obj2 = ov01_022040D0(fsys->unkC0, 117);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 116, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 117, switchState);
        if (getSwitchState(gymmickUnion, 0)) {
            ov01_021E8970(116, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(116, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else if (switchNo == 1) {
        switchState = getSwitchState(gymmickUnion, 1);
        gymmickUnion->azalea.switches ^= 2;
        obj1 = ov01_022040D0(fsys->unkC0, 115);
        obj2 = ov01_022040D0(fsys->unkC0, 122);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 115, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 122, switchState);
        if (getSwitchState(gymmickUnion, 1)) {
            ov01_021E8970(115, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(115, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else {
        GF_ASSERT(0);
    }
    TaskManager_Call(fsys->taskman, ov04_02254CA4, NULL);
}

void Fsys_BeginAzaleaGymSpinarakRide(FieldSystem *fsys, u8 startingPoint) {
    struct AzaleaGymWork *gymWork = fsys->unk4->unk_24;
    struct SpinarakRideWork *rideWork = AllocFromHeapAtEnd(11, sizeof(struct SpinarakRideWork));
    int i;
    union GymmickUnion *gymmickUnion;
    const struct Vec2U16 *initPos;

    rideWork->state = 0;
    rideWork->fsys = fsys;
    gymWork->startingPoint = startingPoint;
    gymWork->vecPos.y = 0;
    gymWork->pathNodeCounter = 0;
    gymWork->reqNewSegment = 1;
    gymWork->reqStartDiagMovement = FALSE;
    gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    gymWork->switchesState = gymmickUnion->azalea.switches;
    for (i = 0; i < 4; i++) {
        if (gymmickUnion->azalea.spiders[i] == startingPoint) {
            gymWork->spinarakNo = i;
            break;
        }
    }
    if (i == 4) {
        GF_ASSERT(0);
        return;
    }
    switch (startingPoint) {
    case 3:
    case 4:
    case 5:
    case 9:
    case 10:
    case 11:
        gymWork->direction = 1;
        gymWork->pathIdx = sSpinarakPathSpecs[startingPoint][gymWork->switchesState].length - 1;
        gymWork->playerZoff = 1;
        break;
    case 0:
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
    default:
        gymWork->direction = 0;
        gymWork->pathIdx = 0;
        gymWork->playerZoff = 0;
        break;
    }
    initPos = &sSpinarakPathSpecs[startingPoint][gymWork->switchesState].path[gymWork->pathIdx];
    gymWork->vecPos.x = initPos->x * 16 * FX32_ONE;
    gymWork->vecPos.z = initPos->z * 16 * FX32_ONE;
    TaskManager_Call(fsys->taskman, ov04_0225463C, rideWork);
}

BOOL ov04_0225463C(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct SpinarakRideWork *rideWork = TaskManager_GetEnv(taskManager);
    switch (rideWork->state) {
    case 0:
        TaskManager_Call(fsys->taskman, Task_WaitFollowingPokeSituatedOnMovingPlatform, NULL);
        rideWork->state++;
        break;
    case 1:
        CreateSysTask((SysTaskFunc)ov04_02254724, rideWork, 0);
        rideWork->state++;
        break;
    case 10:
        FreeToHeap(rideWork);
        return TRUE;
    }

    return FALSE;
}

VecFx32 ov04_02254698(const struct Vec2U16 *a, const struct Vec2U16 *b) {
    VecFx32 sp0;
    sp0.x = (b->x - a->x) * FX32_ONE;
    sp0.z = (b->z - a->z) * FX32_ONE;
    sp0.y = 0;
    return sp0;
}

void ov04_022546C8(const VecFx32 *vec, BOOL signs[2]) {
    if (vec->x >= 0) {
        signs[0] = TRUE;
    } else {
        signs[0] = FALSE;
    }
    if (vec->z >= 0) {
        signs[1] = TRUE;
    } else {
        signs[1] = FALSE;
    }
}

int ov04_022546E8(BOOL a0, fx32 a1, fx32 a2, int a3) {
    fx32 r3 = a3 * 16 * FX32_ONE;
    int r4 = 0;
    a1 += a2;
    if (r3 == a1) {
        r4 = 1;
    } else if (a0) {
        if (a1 > r3) {
            r4 = 2;
        }
    } else if (a1 < r3) {
        r4 = 2;
    }
    return r4;
}

void DeleteAzaleaGymPuzzleGimmick(FieldSystem *fsys) {
    FreeToHeap(fsys->unk4->unk_24);
    fsys->unk4->unk_24 = NULL;
}

void ov04_02254724(SysTask *task, struct SpinarakRideWork *work) {
    FieldSystem *fsys = work->fsys;
    struct AzaleaGymWork *gymWork = fsys->unk4->unk_24;
    LocalMapObject *playerObj, *followPokeObj;
    BgModelEvent *spinarakMdlEvent;
    fx32 dotprod;
    void *r7;
    const struct Vec2U16 *posvec;
    int work_1A_new;
    BgModelEvent *model;

    switch (work->state) {
    case 2:
        if (FollowingPokemon_IsActive(fsys)) {
            playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
                MapObject_SetHeldMovement(followPokeObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
                MapObject_SetHeldMovement(followPokeObj, MV_step_down);
            }
        } else {
            playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
            }
        }
        work->state++;
        //fallthrough
    case 3:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) && MapObject_AreBitsSetForMovementScriptInit(followPokeObj)) {
                MapObject_SetHeldMovement(playerObj, 73);
                gymWork->delayCounter = 0;
                work->state++;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj)) {
                MapObject_SetHeldMovement(playerObj, 73);
                gymWork->delayCounter = 0;
                work->state++;
            }
        }
        break;
    case 4:
        if (gymWork->delayCounter++ < 4) {
            break;
        }
        spinarakMdlEvent = ov01_021F3B44(fsys->bgModels, gymWork->spinarakNo);
        r7 = ov01_021FB9E0(fsys->unk_34);
        ov01_021E8DE8(
            fsys->_3dAnimationMgr,
            fsys->unk_58,
            1,
            118,
            ov01_021F3B38(spinarakMdlEvent),
            ov01_021F3B3C(spinarakMdlEvent),
            r7,
            1,
            255,
            0
        );
        ov01_021E8E70(fsys->unk_58, 1, 0);
        PlaySE(SEQ_SE_GS_ITOMARU_ROBO);
        work->state++;
        break;
    case 5: {
        u8 startingPoint = gymWork->startingPoint;
        u8 work_16 = gymWork->reqNewSegment;
        u8 work_15 = gymWork->switchesState;
        if (work_16) {
            if (gymWork->direction) {
                posvec = &sSpinarakPathSpecs[startingPoint][work_15].path[gymWork->pathIdx];
                gymWork->targetXZ = &sSpinarakPathSpecs[startingPoint][work_15].path[gymWork->pathIdx - 1];
            }
            else {
                posvec = &sSpinarakPathSpecs[startingPoint][work_15].path[gymWork->pathIdx];
                gymWork->targetXZ = &sSpinarakPathSpecs[startingPoint][work_15].path[gymWork->pathIdx + 1];
            }
            gymWork->vecTranslBuf = ov04_02254698(posvec, gymWork->targetXZ);
            ov04_022546C8(&gymWork->vecTranslBuf, gymWork->xzSigns);
            VEC_Normalize(&gymWork->vecTranslBuf, &gymWork->vecTranslBuf);
            {
                const VecFx32 tmp = {FX32_ONE, 0, 0};
                dotprod = VEC_DotProduct(&gymWork->vecTranslBuf, &tmp);
            }
            {
                VecFx32 tmp = {0, 0, 0};
                VEC_MultAdd(2 * FX32_ONE, &gymWork->vecTranslBuf, &tmp, &gymWork->vecTranslBuf);
            }
            if (gymWork->reqStartDiagMovement == FALSE && dotprod != 0 && dotprod != FX32_ONE) {
                gymWork->reqStartDiagMovement = TRUE;
                ov01_021F6304(fsys->unk2C);
            }
            else if (gymWork->reqStartDiagMovement == TRUE) {
                gymWork->reqStartDiagMovement = FALSE;
                ov01_021F62E8(PlayerAvatar_GetPositionVecConst(fsys->playerAvatar), fsys->unk2C);
            }
            gymWork->reqNewSegment = 0;
        }
        {
            int dx = ov04_022546E8(gymWork->xzSigns[0], gymWork->vecPos.x, gymWork->vecTranslBuf.x, gymWork->targetXZ->x);
            int dz = ov04_022546E8(gymWork->xzSigns[1], gymWork->vecPos.z, gymWork->vecTranslBuf.z, gymWork->targetXZ->z);
            if (dx == 2) {
                gymWork->vecTranslBuf.x = 0;
            }
            if (dz == 2) {
                gymWork->vecTranslBuf.z = 0;
            }
            if (dx != 0 && dz != 0) {
                gymWork->vecPos.x = gymWork->targetXZ->x * 16 * FX32_ONE;
                gymWork->vecPos.z = gymWork->targetXZ->z * 16 * FX32_ONE;
                gymWork->pathNodeCounter++;
                if (gymWork->pathNodeCounter >= sSpinarakPathSpecs[startingPoint][work_15].length - 1) {
                    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(
                        Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
                    gymmickUnion->azalea.spiders[gymWork->spinarakNo] = sSpinarakPathSpecs[startingPoint][work_15].endpoint;
                    ov01_021E8ED0(fsys->_3dAnimationMgr, fsys->unk_58, 1);
                    StopSE(SEQ_SE_GS_ITOMARU_ROBO, 1);
                    work->state++;
                }
                else {
                    if (gymWork->direction) {
                        gymWork->pathIdx--;
                    }
                    else {
                        gymWork->pathIdx++;
                    }
                    gymWork->reqNewSegment = 1;
                }
            }
            else {
                VEC_Add(&gymWork->vecPos, &gymWork->vecTranslBuf, &gymWork->vecPos);
            }
        }
        model = ov01_021F3B44(fsys->bgModels, gymWork->modelIds[gymWork->spinarakNo]);
        {
            VecFx32 sp74 = gymWork->vecPos;
            sp74.x += 8 * FX32_ONE;
            BgModel_SetPosition(model, &sp74);
        }
        {
            VecFx32 sp68;
            const VecFx32 sp5C = {8 * FX32_ONE, 0, 8 * FX32_ONE};
            sp68 = gymWork->vecPos;
            VEC_Add(&sp68, &sp5C, &sp68);
            sp68.z += gymWork->playerZoff * 16 * FX32_ONE;
            MapObject_SetPositionVec(PlayerAvatar_GetMapObject(fsys->playerAvatar), &sp68);
            if (FollowingPokemon_IsActive(fsys)) {
                s8 posAdj = 1 - gymWork->playerZoff;
                VecFx32 sp50 = gymWork->vecPos;
                VEC_Add(&sp50, &sp5C, &sp50);
                sp50.z += posAdj * 16 * FX32_ONE;
                MapObject_SetPositionVec(FollowingPokemon_GetMapObject(fsys), &sp50);
            }
        }
        break;
    }
    case 6:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        MapObject_SetCurrentX(playerObj, gymWork->targetXZ->x);
        MapObject_SetCurrentHeight(playerObj, 0);
        MapObject_SetCurrentY(playerObj, gymWork->targetXZ->z + gymWork->playerZoff);
        sub_02060F78(playerObj);
        MapObject_SetHeldMovement(playerObj, 74);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            MapObject_SetCurrentX(followPokeObj, gymWork->targetXZ->x);
            MapObject_SetCurrentHeight(followPokeObj, 0);
            MapObject_SetCurrentY(followPokeObj, gymWork->targetXZ->z + (1 - gymWork->playerZoff));
            sub_02060F78(followPokeObj);
        }
        gymWork->cameraShudderCount = 0;
        gymWork->cameraShudderFrames = 0;
        if (PlayerAvatar_GetFacingDirection(fsys->playerAvatar) == DIR_SOUTH) {
            gymWork->cameraShudderDirection = FX32_ONE;
        } else {
            gymWork->cameraShudderDirection = -FX32_ONE;
        }
        work->state++;
        break;
    case 7: {
        VecFx32 cameraShudderVec = {0,0,gymWork->cameraShudderDirection};
        if (gymWork->cameraShudderFrames++ == 0) {
            GF_Camera_ShiftBy(&cameraShudderVec, fsys->camera);
            gymWork->cameraShudderCount++;
        } else if (gymWork->cameraShudderFrames > 1) {
            gymWork->cameraShudderFrames = 0;
            gymWork->cameraShudderDirection *= -1;
        }
        if (gymWork->cameraShudderCount >= 4) {
            gymWork->delayCounter = 0;
            work->state++;
        }
        break;
    }
    case 8:
        if (gymWork->delayCounter++ < 8) {
            break;
        }
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
                MapObject_SetHeldMovement(followPokeObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
                MapObject_SetHeldMovement(followPokeObj, MV_step_down);
            }
        } else {
            if (gymWork->direction) {
                MapObject_SetHeldMovement(playerObj, MV_step_up);
            } else {
                MapObject_SetHeldMovement(playerObj, MV_step_down);
            }
        }
        work->state++;
        break;
    case 9:
        playerObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (FollowingPokemon_IsActive(fsys)) {
            followPokeObj = FollowingPokemon_GetMapObject(fsys);
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj) && MapObject_AreBitsSetForMovementScriptInit(followPokeObj)) {
                MapObject_ClearHeldMovement(followPokeObj);
                DestroySysTask(task);
                work->state++;
            }
        } else {
            if (MapObject_AreBitsSetForMovementScriptInit(playerObj)) {
                DestroySysTask(task);
                work->state++;
            }
        }
        break;
    }
}
