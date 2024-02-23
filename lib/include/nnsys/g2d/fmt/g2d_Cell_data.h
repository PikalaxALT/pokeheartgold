#ifndef NNSYS_G2D_FMT_G2D_CELL_DATA_H_
#define NNSYS_G2D_FMT_G2D_CELL_DATA_H_

#include <nitro.h>
#include <nnsys/g2d/fmt/g2d_Character_data.h>

#define NNS_G2D_CELL_FLIP_H_SHIFT           (0 + 8)
#define NNS_G2D_CELL_FLIP_V_SHIFT           (1 + 8)
#define NNS_G2D_CELL_FLIP_HV_SHIFT          (2 + 8)

#define NNS_G2D_CELL_HAS_BR_SHIFT           (3 + 8)

#define NNS_G2D_CELL_BS_R_MASK              0x3F        // 6 bit
#define NNS_G2D_CELL_BS_R_OFFSET            (2)
#define NNS_G2D_CELL_BS_R_SHIFT             (0)

typedef struct NNSG2dCellOAMAttrData {
    u16 attr0;
    u16 attr1;
    u16 attr2;

} NNSG2dCellOAMAttrData;

typedef struct NNSG2dCellData {
    u16 numOAMAttrs;
    u16 cellAttr;
    NNSG2dCellOAMAttrData* pOamAttrArray;
} NNSG2dCellData;

typedef struct NNSG2dCellVramTransferData {
    u32 srcDataOffset;
    u32 szByte;

} NNSG2dCellVramTransferData;

typedef struct NNSG2dVramTransferData {
    u32 szByteMax;
    NNSG2dCellVramTransferData* pCellTransferDataArray;

} NNSG2dVramTransferData;

typedef struct NNSG2dCellDataBank {
    u16 numCells;
    u16 cellBankAttr;
    NNSG2dCellData* pCellDataArrayHead;
    NNSG2dCharacterDataMapingType mappingMode;
    NNSG2dVramTransferData* pVramTransferData;
    void* pStringBank;
    void* pExtendedData;
} NNSG2dCellDataBank;
typedef struct NNSG2dCellBoundingRectS16 {
    s16 maxX;
    s16 maxY;
    s16 minX;
    s16 minY;
} NNSG2dCellBoundingRectS16;

typedef struct NNSG2dCellDataWithBR {
    NNSG2dCellData cellData;
    NNSG2dCellBoundingRectS16 boundingRect;
} NNSG2dCellDataWithBR;

static inline const NNSG2dCellBoundingRectS16* NNS_G2dGetCellBoundingRect(const NNSG2dCellData* pCell) {
    const NNSG2dCellDataWithBR* pBR = (const NNSG2dCellDataWithBR*)pCell;
    return &pBR->boundingRect;
}

static inline u8 NNS_G2dGetCellBoundingSphereR(const NNSG2dCellData* pCell) {
    u8 R = (u8)((pCell->cellAttr >> NNS_G2D_CELL_BS_R_SHIFT) & NNS_G2D_CELL_BS_R_MASK);
    return (u8)(R << NNS_G2D_CELL_BS_R_OFFSET);
}

static inline BOOL NNS_G2dCellHasBR( const NNSG2dCellData* pCell) {
    return (BOOL)((pCell->cellAttr >> NNS_G2D_CELL_HAS_BR_SHIFT) & 0x1);
}


#endif //NNSYS_G2D_FMT_G2D_CELL_DATA_H_
