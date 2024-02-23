#include "global.h"
#include "unk_02025C44.h"

void sub_02025C44(NNSG2dRendererInstance *instance, fx32 spriteZoffsetStep) {
    NNS_G2dInitRenderer(instance);
    instance->spriteZoffsetStep = spriteZoffsetStep;
}

void sub_02025C54(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dOamRegisterFunction registerOamFunc, NNSG2dAffineRegisterFunction registerAffineFunc, NNSG2dRndCellCullingFunction cullVisibilityFunc, NNSG2dSurfaceType surfaceType, NNSG2dRendererInstance *instance) {
    NNS_G2dInitRenderSurface(surface);
    surface->viewRect = *rect;
    surface->pFuncOamRegister = registerOamFunc;
    surface->pFuncOamAffineRegister = registerAffineFunc;
    surface->pFuncVisibilityCulling = cullVisibilityFunc;
    surface->type = surfaceType;
    if (instance != NULL) {
        NNS_G2dAddRendererTargetSurface(instance, surface);
    }
}

void sub_02025C88(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect) {
    surface->viewRect = *rect;
}

BOOL sub_02025C98(const NNSG2dCellData* pCell, const MtxFx32* pMtx, const NNSG2dViewRect* pViewRec) {
    const NNSG2dCellBoundingRectS16 *boundingRect = NNS_G2dGetCellBoundingRect(pCell);
    fx32 r0 = NNS_G2dGetCellBoundingSphereR(pCell);
    fx32 sp18 = pMtx->m[2][0] - pViewRec->posTopLeft.x;
    fx32 sp14 = pMtx->m[2][1] - pViewRec->posTopLeft.y;
    fx32 r4;
    fx32 sp10;
    fx32 spC;
    fx32 sp8;

    if (NNS_G2dCellHasBR(pCell) == TRUE) {
        r4 = boundingRect->minY * FX32_ONE;
        sp10 = boundingRect->maxY * FX32_ONE;
        spC = boundingRect->minX * FX32_ONE;
        sp8 = boundingRect->maxX * FX32_ONE;
    } else {
        r4 = -r0 * FX32_ONE;
        sp10 = r0 * FX32_ONE;
        spC = -r0 * FX32_ONE;
        sp8 = r0 * FX32_ONE;
    }
    r4 = FX_Mul(r4, pMtx->m[0][1]) + FX_Mul(r4, pMtx->m[1][1]) + sp14;
    sp10 = FX_Mul(sp10, pMtx->m[0][1]) + FX_Mul(sp10, pMtx->m[1][1]) + sp14;
    spC = FX_Mul(spC, pMtx->m[0][0]) + FX_Mul(spC, pMtx->m[1][0]) + sp18;
    sp8 = FX_Mul(sp8, pMtx->m[0][0]) + FX_Mul(sp8, pMtx->m[1][0]) + sp18;
    if (sp10 < r4) {
        fx32 temp = sp10;
        sp10 = r4;
        r4 = temp;
    }
    if (sp8 < spC) {
        fx32 temp = sp8;
        sp8 = spC;
        spC = temp;
    }
    return (sp10 > 0 && r4 < pViewRec->sizeView.y && sp8 > 0 && spC < pViewRec->sizeView.x);
}
