#ifndef POKEHEARTGOLD_UNK_02025C44_H
#define POKEHEARTGOLD_UNK_02025C44_H

#include "global.h"

void sub_02025C44(NNSG2dRendererInstance *instance, fx32 a1);
void sub_02025C54(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dOamRegisterFunction registerOamFunc, NNSG2dAffineRegisterFunction registerAffineFunc, NNSG2dRndCellCullingFunction cullVisibilityFunc, NNSG2dSurfaceType surfaceType, NNSG2dRendererInstance *instance);
void sub_02025C88(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect);
BOOL sub_02025C98(const NNSG2dCellData* pCell, const MtxFx32* pMtx, const NNSG2dViewRect* pViewRec);

#endif //POKEHEARTGOLD_UNK_02025C44_H
