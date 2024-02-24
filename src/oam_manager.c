#include "global.h"
#include "oam_manager.h"
#include "sprite.h"
#include "render_oam.h"

typedef struct OamManager {
    NNSG2dOamManagerInstance oamManagerMain;
    NNSG2dOamManagerInstance oamManagerSub;
    HeapID heapID;
} OamManager;

static OamManager *sOamManager = NULL;

static void OamManager_Create_internal(int fromObjMain, int numObjMain, int fromAffineMain, int numAffineMain, int fromObjSub, int numObjSub, int fromAffineSub, int numAffineSub, HeapID heapID);
static BOOL OamManager_RegisterOam_Main(const GXOamAttr *pOam, u16 affineIndex, BOOL bDoubleAffine);
static BOOL OamManager_RegisterOam_Sub(const GXOamAttr *pOam, u16 affineIndex, BOOL bDoubleAffine);
static u16 OamManager_RegisterAffine_Main(const MtxFx22 *mtx);
static u16 OamManager_RegisterAffine_Sub(const MtxFx22 *mtx);

void OamManager_Create(int fromObjMain, int numObjMain, int fromAffineMain, int numAffineMain, int fromObjSub, int numObjSub, int fromAffineSub, int numAffineSub, HeapID heapID) {
    int true_fromObjMain, true_numObjMain, true_fromAffineMain, true_numAffineMain;
    if (fromObjMain < 4) {
        true_fromObjMain = 4;
        if (numObjMain > 124) {
            true_numObjMain = numObjMain - (4 - fromObjMain);
        } else {
            true_numObjMain = numObjMain;
        }
    } else {
        true_fromObjMain = fromObjMain;
        true_numObjMain = numObjMain;
    }
    if (fromAffineMain < 1) {
        true_fromAffineMain = 1;
        if (numAffineMain > 30) {
            true_numAffineMain = numAffineMain - (1 - fromAffineMain);
        } else {
            true_numAffineMain = numAffineMain;
        }
    } else {
        true_fromAffineMain = fromAffineMain;
        true_numAffineMain = numAffineMain;
    }
    OamManager_Create_internal(true_fromObjMain, true_numObjMain, true_fromAffineMain, true_numAffineMain, fromObjSub, numObjSub, fromAffineSub, numAffineSub, heapID);
}

static void OamManager_Create_internal(int fromObjMain, int numObjMain, int fromAffineMain, int numAffineMain, int fromObjSub, int numObjSub, int fromAffineSub, int numAffineSub, HeapID heapID) {
    GF_ASSERT(sOamManager == NULL);
    sOamManager = AllocFromHeap(heapID, sizeof(OamManager));
    GF_ASSERT(sOamManager != NULL);
    sOamManager->heapID = heapID;
    GF_ASSERT(NNS_G2dGetNewOamManagerInstance(&sOamManager->oamManagerMain, fromObjMain, numObjMain, fromAffineMain, numAffineMain, NNS_G2D_OAMTYPE_MAIN));
    GF_ASSERT(NNS_G2dGetNewOamManagerInstance(&sOamManager->oamManagerSub, fromObjSub, numObjSub, fromAffineSub, numAffineSub, NNS_G2D_OAMTYPE_SUB));
}

void OamManager_ApplyAndResetBuffers(void) {
    if (sOamManager != NULL) {
        NNS_G2dApplyAndResetOamManagerBuffer(&sOamManager->oamManagerMain);
        NNS_G2dApplyAndResetOamManagerBuffer(&sOamManager->oamManagerSub);
    }
}

void OamManager_Free(void) {
    GF_ASSERT(sOamManager != NULL);
    sub_0200B2E0(sOamManager->heapID);
    sub_0200B2E8(sOamManager->heapID);
    FreeToHeap(sOamManager);
    sOamManager = NULL;
}

void sub_0200B27C(NNSG2dRenderSurface *surface, NNSG2dViewRect *rect, NNSG2dSurfaceType surfaceType, NNSG2dRendererInstance *instance) {
    GF_ASSERT(sOamManager != NULL);
    if (surfaceType == NNS_G2D_SURFACETYPE_MAIN2D) {
        GF_SetRenderSurfaceRectFuncsTypeRenderer(surface, rect, OamManager_RegisterOam_Main, OamManager_RegisterAffine_Main, GF_DefaultRndCellCullingFunction, surfaceType, instance);
    } else {
        GF_SetRenderSurfaceRectFuncsTypeRenderer(surface, rect, OamManager_RegisterOam_Sub, OamManager_RegisterAffine_Sub, GF_DefaultRndCellCullingFunction, surfaceType, instance);
    }
}

void sub_0200B2E0(HeapID heapId) {
    sub_02024BBC(heapId);
}

void sub_0200B2E8(HeapID heapId) {
    sub_02024BF4(heapId);
}

static BOOL OamManager_RegisterOam_Main(const GXOamAttr *pOam, u16 affineIndex, BOOL bDoubleAffine) {
    BOOL ret = NNS_G2dEntryOamManagerOamWithAffineIdx(&sOamManager->oamManagerMain, pOam, affineIndex);
    GF_ASSERT(ret);
    return ret;
}

static BOOL OamManager_RegisterOam_Sub(const GXOamAttr *pOam, u16 affineIndex, BOOL bDoubleAffine) {
    BOOL ret = NNS_G2dEntryOamManagerOamWithAffineIdx(&sOamManager->oamManagerSub, pOam, affineIndex);
    GF_ASSERT(ret);
    return ret;
}

static u16 OamManager_RegisterAffine_Main(const MtxFx22 *mtx) {
    u16 ret = NNS_G2dEntryOamManagerAffine(&sOamManager->oamManagerMain, mtx);
    GF_ASSERT(ret != NNS_G2D_OAM_AFFINE_IDX_NONE);
    return ret;
}

static u16 OamManager_RegisterAffine_Sub(const MtxFx22 *mtx) {
    u16 ret = NNS_G2dEntryOamManagerAffine(&sOamManager->oamManagerSub, mtx);
    GF_ASSERT(ret != NNS_G2D_OAM_AFFINE_IDX_NONE);
    return ret;
}
