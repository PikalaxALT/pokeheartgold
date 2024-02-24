#ifndef POKEHEARTGOLD_RENDER_OAM_H
#define POKEHEARTGOLD_RENDER_OAM_H

#include "global.h"

void GF_InitRendererInstanceWithZoffsetStep(NNSG2dRendererInstance *instance, fx32 a1);
void GF_SetRenderSurfaceRectFuncsTypeRenderer(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dOamRegisterFunction registerOamFunc, NNSG2dAffineRegisterFunction registerAffineFunc, NNSG2dRndCellCullingFunction cullVisibilityFunc, NNSG2dSurfaceType surfaceType, NNSG2dRendererInstance *instance);
void GF_SetRenderSurfaceViewRect(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect);
BOOL GF_DefaultRndCellCullingFunction(const NNSG2dCellData* pCell, const MtxFx32* pMtx, const NNSG2dViewRect* pViewRec);

#endif //POKEHEARTGOLD_RENDER_OAM_H
