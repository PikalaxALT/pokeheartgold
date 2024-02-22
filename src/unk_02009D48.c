#include "global.h"
#include "unk_02009D48.h"
#include "unk_0200ACF0.h"
#include "unk_02023694.h"
#include "unk_02025C44.h"
#include "oam_manager.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

void CreateSpriteResourcesHeader(struct SpriteResourcesHeader *hdr, int charId, int plttId, int cellId, int cellAnmId, int multiCellId, int multiCellAnmId, int transfer, int priority, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *cellAnmMan, struct _2DGfxResMan *multiCellMan, struct _2DGfxResMan *multiCellAnmMan) {
    struct _2DGfxResObj *charObj;
    struct _2DGfxResObj *plttObj;
    struct _2DGfxResObj *cellObj;
    struct _2DGfxResObj *cellAnmObj = NULL;
    struct _2DGfxResObj *multiCellObj = NULL;
    struct _2DGfxResObj *multiCellAnmObj = NULL;
    NNSG2dImageProxy *proxy;

    GF_ASSERT(charMan != NULL);
    GF_ASSERT(plttMan != NULL);
    GF_ASSERT(cellAnmMan != NULL);
    GF_ASSERT(cellMan != NULL);
    GF_ASSERT(hdr != NULL);

    charObj = Get2DGfxResObjById(charMan, charId);
    GF_ASSERT(charObj != NULL);
    plttObj = Get2DGfxResObjById(plttMan, plttId);
    GF_ASSERT(plttObj != NULL);
    cellObj = Get2DGfxResObjById(cellMan, cellId);
    GF_ASSERT(cellObj != NULL);

    if (cellAnmMan != NULL) {
        if (cellAnmId != -1) {
            cellAnmObj = Get2DGfxResObjById(cellAnmMan, cellAnmId);
            GF_ASSERT(cellAnmObj != NULL);
        }
    }
    if (multiCellMan != NULL) {
        if (multiCellId != -1) {
            multiCellObj = Get2DGfxResObjById(multiCellMan, multiCellId);
        }
        if (multiCellAnmId != -1) {
            multiCellAnmObj = Get2DGfxResObjById(multiCellAnmMan, multiCellAnmId);
        }
    }
    if (transfer) {
        proxy = sub_0200AF24(charObj, cellObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = _2DGfxResObj_GetCharDataPtr(charObj);
    } else {
        proxy = sub_0200AF00(charObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = NULL;
    }
    hdr->plttProxy = sub_0200B0F8(plttObj, proxy);
    hdr->imageProxy = proxy;
    hdr->cellData = _2DGfxResObj_GetCellDataPtr(cellObj);
    if (cellAnmObj != NULL) {
        hdr->cellAnim = _2DGfxResObj_GetAnimDataPtr(cellAnmObj);
    } else {
        hdr->cellAnim = NULL;
    }
    if (multiCellObj != NULL) {
        hdr->multiCellData = _2DGfxResObj_GetMultiCellDataPtr(multiCellObj);
        hdr->multiCellAnim = _2DGfxResObj_GetMultiAnimDataPtr(multiCellAnmObj);
    } else {
        hdr->multiCellData = NULL;
        hdr->multiCellAnim = NULL;
    }
    hdr->flag = transfer;
    hdr->priority = priority;
}

SpriteResourceHeaderList *SpriteResourceHeaderList_Create(const struct ResdatNarcEntry *resdatNarcEntry, HeapID heapId, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *animMan, struct _2DGfxResMan *mcelMan, struct _2DGfxResMan *manmMan) {
    int i;
    int num = 0;
    SpriteResourceHeaderList *ret;

    while (resdatNarcEntry[num].charId != -2) {
        num++;
    }
    ret = AllocFromHeap(heapId, sizeof(SpriteResourceHeaderList));
    ret->headers = AllocFromHeap(heapId, sizeof(SpriteResourcesHeader) * num);
    ret->num = num;
    for (i = 0; i < ret->num; i++) {
        CreateSpriteResourcesHeader(&ret->headers[i], resdatNarcEntry[i].charId, resdatNarcEntry[i].plttId, resdatNarcEntry[i].cellId, resdatNarcEntry[i].animId,
                                    resdatNarcEntry[i].mcelId, resdatNarcEntry[i].manmId, resdatNarcEntry[i].xferFlag, resdatNarcEntry[i].priority, charMan, plttMan,
                                    cellMan, animMan, mcelMan, manmMan);
    }
    return ret;
}

void SpriteResourceHeaderList_Destroy(SpriteResourceHeaderList *list) {
    GF_ASSERT(list != NULL);
    if (list->headers != NULL) {
        FreeToHeap(list->headers);
    }
    FreeToHeap(list);
}

SpriteList *G2dRenderer_Init(int a0, GF_G2dRenderer *renderer, HeapID heapId) {
    struct SpriteListParam param;
    NNSG2dViewRect rect;

    sub_02025C44(&renderer->rendererInstance, -FX32_ONE);
    rect.posTopLeft.x = 0;
    rect.posTopLeft.y = 0;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&renderer->renderSurface[0], &rect, 1, &renderer->rendererInstance);
    rect.posTopLeft.x = 0;
    rect.posTopLeft.y = 192 * FX32_ONE;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&renderer->renderSurface[1], &rect, 2, &renderer->rendererInstance);
    param.unk_0 = a0;
    param.rendererInstance = &renderer->rendererInstance;
    param.heapId = heapId;
    return SpriteList_Create(&param);
}

void G2dRenderer_SetMainSurfaceCoords(struct GF_G2dRenderer *a0, fx32 x, fx32 y) {
    struct NNSG2dViewRect rect;

    rect.posTopLeft.x = x;
    rect.posTopLeft.y = y;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_02025C88(&a0->renderSurface[0], &rect);
}

void G2dRenderer_SetSubSurfaceCoords(struct GF_G2dRenderer *a0, fx32 x, fx32 y) {
    struct NNSG2dViewRect rect;

    rect.posTopLeft.x = x;
    rect.posTopLeft.y = y;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_02025C88(&a0->renderSurface[1], &rect);
}

void sub_02009FE8(NNS_G2D_VRAM_TYPE vram, GXOBJVRamModeChar mode) {
    switch (mode) {
    case GX_OBJVRAMMODE_CHAR_1D_32K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_16_G || GX_GetBankForOBJ() == GX_VRAM_OBJ_16_F) {
            sub_020216F4(0x3E00, 0x200, vram);
        } else {
            sub_020216F4(0x7E00, 0x200, vram);
        }
        break;
    case GX_OBJVRAMMODE_CHAR_1D_64K:
        sub_020216F4(0xFE00, 0x200, vram);
        break;
    case GX_OBJVRAMMODE_CHAR_1D_128K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EF || GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EG) {
            sub_020216F4(0x13E00, 0x200, vram);
        } else {
            sub_020216F4(0x1FE00, 0x200, vram);
        }
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

void sub_0200A080(u32 a0) {
    sub_020225E4(0xC000, a0);
}
