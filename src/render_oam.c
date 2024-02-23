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
