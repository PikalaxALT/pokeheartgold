#ifndef NNSYS_G2D_G2D_OAM_H_
#define NNSYS_G2D_G2D_OAM_H_

#include <nitro.h>

typedef enum NNSG2dOamType {
    NNS_G2D_OAMTYPE_MAIN = 0,
    NNS_G2D_OAMTYPE_SUB,
    NNS_G2D_OAMTYPE_SOFTWAREEMULATION,
    NNS_G2D_OAMTYPE_INVALID,
    NNS_G2D_OAMTYPE_MAX

} NNSG2dOamType;

typedef struct NNSG2dOAMManageArea {
    u16 fromIdx;
    u16 toIdx;
    u16 currentIdx;
} NNSG2dOAMManageArea;


typedef struct NNSG2dOamManagerInstance {
    NNSG2dOamType type;
    NNSG2dOAMManageArea managedAttrArea;
    NNSG2dOAMManageArea managedAffineArea;
    u16 GUID;
    u16 pad16_;
    BOOL bFastTransferEnable;
    fx32 spriteZoffsetStep;

} NNSG2dOamManagerInstance;

void NNS_G2dInitOamManagerModule();

BOOL NNS_G2dGetNewOamManagerInstance(NNSG2dOamManagerInstance* pMan, u16 fromOBJ, u16 numOBJ, u16 fromAffine, u16 numAffine, NNSG2dOamType type);
void NNS_G2dApplyAndResetOamManagerBuffer(NNSG2dOamManagerInstance* pMan);
BOOL NNS_G2dEntryOamManagerOamWithAffineIdx(NNSG2dOamManagerInstance* pMan, const GXOamAttr* pOam, u16 affineIdx);
u16 NNS_G2dEntryOamManagerAffine(NNSG2dOamManagerInstance* pMan, const MtxFx22* mtx);

#endif //NNSYS_G2D_G2D_OAM_H_
