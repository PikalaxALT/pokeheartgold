#include "global.h"
#include "render_oam.h"

void GF_InitRendererInstanceWithZoffsetStep(NNSG2dRendererInstance *instance, fx32 spriteZoffsetStep) {
    NNS_G2dInitRenderer(instance);
    instance->spriteZoffsetStep = spriteZoffsetStep;
}

void GF_SetRenderSurfaceRectFuncsTypeRenderer(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dOamRegisterFunction registerOamFunc, NNSG2dAffineRegisterFunction registerAffineFunc, NNSG2dRndCellCullingFunction cullVisibilityFunc, NNSG2dSurfaceType surfaceType, NNSG2dRendererInstance *instance) {
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

void GF_SetRenderSurfaceViewRect(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect) {
    surface->viewRect = *rect;
}

BOOL GF_DefaultRndCellCullingFunction(const NNSG2dCellData* pCell, const MtxFx32* pMtx, const NNSG2dViewRect* pViewRec) {
    const NNSG2dCellBoundingRectS16 *boundingRect = NNS_G2dGetCellBoundingRect(pCell);
    fx32 R = NNS_G2dGetCellBoundingSphereR(pCell);
    fx32 xOffset = pMtx->m[2][0] - pViewRec->posTopLeft.x;
    fx32 yOffset = pMtx->m[2][1] - pViewRec->posTopLeft.y;
    fx32 top;
    fx32 bottom;
    fx32 left;
    fx32 right;

    if (NNS_G2dCellHasBR(pCell) == TRUE) {
        top = boundingRect->minY * FX32_ONE;
        bottom = boundingRect->maxY * FX32_ONE;
        left = boundingRect->minX * FX32_ONE;
        right = boundingRect->maxX * FX32_ONE;
    } else {
        top = -R * FX32_ONE;
        bottom = R * FX32_ONE;
        left = -R * FX32_ONE;
        right = R * FX32_ONE;
    }
    top = FX_Mul(top, pMtx->m[0][1]) + FX_Mul(top, pMtx->m[1][1]) + yOffset;
    bottom = FX_Mul(bottom, pMtx->m[0][1]) + FX_Mul(bottom, pMtx->m[1][1]) + yOffset;
    left = FX_Mul(left, pMtx->m[0][0]) + FX_Mul(left, pMtx->m[1][0]) + xOffset;
    right = FX_Mul(right, pMtx->m[0][0]) + FX_Mul(right, pMtx->m[1][0]) + xOffset;
    if (bottom < top) {
        fx32 temp = bottom;
        bottom = top;
        top = temp;
    }
    if (right < left) {
        fx32 temp = right;
        right = left;
        left = temp;
    }
    return (bottom > 0 && top < pViewRec->sizeView.y && right > 0 && left < pViewRec->sizeView.x);
}
