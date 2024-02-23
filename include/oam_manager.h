#ifndef POKEHEARTGOLD_OAM_MANAGER_H
#define POKEHEARTGOLD_OAM_MANAGER_H

#include "heap.h"

void OamManager_Create(int fromObjMain, int numObjMain, int fromAffineMain, int numAffineMain, int fromObjSub, int numObjSub, int fromAffineSub, int numAffineSub, HeapID heapID);
void OamManager_ApplyAndResetBuffers(void);
void OamManager_Free(void);
void sub_0200B27C(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dSurfaceType vram, NNSG2dRendererInstance *instance);
void sub_0200B2E0(HeapID heapId);
void sub_0200B2E8(HeapID heapId);

#endif //POKEHEARTGOLD_OAM_MANAGER_H
