#ifndef POKEHEARTGOLD_OVERLAY_02_H
#define POKEHEARTGOLD_OVERLAY_02_H

#include "script.h"
#include "unk_0201F79C.h"
#include "unk_0203BC10.h"

struct FieldLongWarpTaskData;

UNK_0201F79C_Sub *ov02_0224B418(FieldSystem *fsys, int gender);
BOOL ov02_0224B43C(UNK_0201F79C_Sub *unk);
void ov02_0224B448(UNK_0201F79C_Sub *unk);
struct FieldLongWarpTaskData *CreateFieldEscapeRopeTaskEnv(FieldSystem *fsys, HeapID heapId);
struct FieldLongWarpTaskData *CreateFieldTeleportTaskEnv(FieldSystem *fsys, POKEMON *pokemon, u8 slotno, HeapID heapId);
struct FieldLongWarpTaskData *CreateFieldDigTaskEnv(FieldSystem *fsys, POKEMON *pokemon, u8 slotno, HeapID heapId);
BOOL Task_FieldEscapeRope(TaskManager *taskManager);
BOOL Task_FieldTeleport(TaskManager *taskManager);
BOOL Task_FieldDig(TaskManager *taskManager);
BOOL ov02_0224C1F8(TaskManager *taskManager);
void *ov02_0224C1D8(FieldSystem *fsys, int a1, int a2);

#endif //POKEHEARTGOLD_OVERLAY_02_H
