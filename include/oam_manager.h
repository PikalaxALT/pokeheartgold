#ifndef POKEHEARTGOLD_OAM_MANAGER_H
#define POKEHEARTGOLD_OAM_MANAGER_H

#include "heap.h"

void OamManager_Create(int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, HeapID heapID);
void sub_0200B27C(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, int a2, NNSG2dRendererInstance *instance);
void OamManager_ApplyAndResetBuffers(void);
void OamManager_Free(void);
void sub_0200B2E0(HeapID heapId);
void sub_0200B2E8(HeapID heapId);

#endif //POKEHEARTGOLD_OAM_MANAGER_H
