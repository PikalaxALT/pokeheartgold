#include "global.h"
#include "sprite.h"
#include "math_util.h"
#include "system.h"

BOOL sub_02024544(SpriteList *spriteList);
void sub_020245D4(SpriteList *spriteList);
void sub_020245FC(Sprite *sprite);
BOOL sub_02024CD0(SpriteList *spriteList, const SpriteResourcesHeader *header, Sprite *sprite, HeapID heapID);
u8 sub_02024E84(NNSG2dImagePaletteProxy *plttProxy, NNS_G2D_VRAM_TYPE vram);
void sub_02024EB4(SpriteList *spriteList, Sprite *sprite);
void sub_02025010(SpriteList *spriteList, Sprite *sprite);
void sub_02025014(Sprite *sprite);
void sub_02025020(Sprite *sprite);
void sub_02025024(SpriteList *spriteList, Sprite *sprite);
void sub_020250BC(Sprite *sprite, Sprite *prev);
void sub_020250D8(SpriteList *spriteList);
Sprite *sub_02025110(SpriteList *spriteList);
void sub_0202512C(SpriteList *spriteList, Sprite *sprite);

void (*const _020F6314[])(SpriteList *spriteList, Sprite *sprite) = {
    sub_02025010,
    sub_02024EB4,
};

void (*const _020F631C[])(Sprite *sprite) = {
    sub_02025020,
    sub_02025014,
};

SpriteList *SpriteList_Create(struct SpriteListParam *param) {
    GF_ASSERT(param != NULL);
    GF_ASSERT(param->rendererInstance != NULL);

    SpriteList *ret = AllocFromHeap(param->heapId, sizeof(SpriteList));
    GF_ASSERT(ret != NULL);

    sub_020245D4(ret);
    ret->spriteListInternal = AllocFromHeap(param->heapId, param->maxSprites * sizeof(Sprite));
    GF_ASSERT(ret->spriteListInternal != NULL);
    ret->maxSprites = param->maxSprites;
    ret->spriteHeap = AllocFromHeap(param->heapId, param->maxSprites * sizeof(Sprite *));
    GF_ASSERT(ret->spriteHeap != NULL);
    sub_020250D8(ret);
    sub_020245FC(&ret->head);
    ret->head.prev = &ret->head;
    ret->head.next = &ret->head;
    ret->renderer = param->rendererInstance;
    ret->clactDefaultNanrRaw = Sys_AllocAndReadFile(param->heapId, "data/clact_default.NANR");
    NNS_G2dGetUnpackedAnimBank(ret->clactDefaultNanrRaw, &ret->clactDefaultNanr);
    ret->unk_120 = TRUE;
    return ret;
}

BOOL SpriteList_Delete(SpriteList *spriteList) {
    if (spriteList == NULL) {
        return FALSE;
    }
    if (spriteList->spriteListInternal == NULL) {
        return TRUE;
    }
    sub_02024544(spriteList);
    FreeToHeap(spriteList->clactDefaultNanrRaw);
    FreeToHeap(spriteList->spriteHeap);
    FreeToHeap(spriteList->spriteListInternal);
    sub_020245D4(spriteList);
    FreeToHeap(spriteList);
    return TRUE;
}

BOOL sub_02024544(SpriteList *spriteList) {
    if (spriteList == NULL) {
        return FALSE;
    }
    if (spriteList->spriteListInternal == NULL) {
        return TRUE;
    }
    Sprite *curr = spriteList->head.next;
    while (curr != &spriteList->head) {
        Sprite *next = curr->next;
        Sprite_Delete(curr);
        curr = next;
    }
    return TRUE;
}

void sub_0202457C(SpriteList *spriteList) {
    GF_ASSERT(spriteList != NULL);
    if (spriteList->unk_120) {
        Sprite *curr = spriteList->head.next;
        while (curr != &spriteList->head) {
            _020F6314[curr->drawFlag](spriteList, curr);
            _020F631C[curr->animationFrame](curr);
            curr = curr->next;
        }
    }
}

void sub_020245D4(SpriteList *spriteList) {
    spriteList->spriteListInternal = NULL;
    spriteList->maxSprites = 0;
    spriteList->spriteHeap = NULL;
    spriteList->unk_00C = 0;
    spriteList->renderer = NULL;
    sub_020245FC(&spriteList->head);
    spriteList->unk_120 = FALSE;
}

void sub_020245FC(Sprite *sprite) {
    sprite->spriteList = NULL;
    memset(sprite, 0, sizeof(Sprite));
    NNS_G2dInitImageProxy(&sprite->imageProxy);
    NNS_G2dInitImagePaletteProxy(&sprite->paletteProxy);
    sprite->mode = GX_OAM_MODE_NORMAL;
}

Sprite *CreateSprite(const SpriteTemplate *template) {
    Sprite *ret = sub_02025110(template->spriteList);
    if (ret == NULL) {
        return NULL;
    }
    ret->spriteList = template->spriteList;
    ret->animationNo = 0;
    ret->matrix = template->position;
    ret->scale = template->scale;
    ret->rotation = template->rotation;
    ret->type = template->whichScreen;
    ret->drawPriority = template->priority;
    ret->affine = 0;
    ret->flip = 0;
    ret->mosaic = FALSE;
    ret->mode = GX_OAM_MODE_NORMAL;
    ret->overwrite = 0x11;
    NNS_G2dSetRndCoreAffineOverwriteMode(&template->spriteList->renderer->rendererCore, (NNSG2dRendererAffineTypeOverwiteMode)ret->affine);
    NNS_G2dSetRndCoreFlipMode(&template->spriteList->renderer->rendererCore, ret->flip & 1, ret->flip & 2);
    ret->drawFlag = 1;
    ret->animationFrame = 0;
    ret->frame = 2 * FX32_ONE;
    if (!sub_02024CD0(template->spriteList, template->header, ret, template->heapId)) {
        Sprite_Delete(ret);
        return NULL;
    }
    ret->palOffset = sub_02024E84(&ret->paletteProxy, ret->type);
    ret->palIndex = ret->palOffset;
    sub_02025024(template->spriteList, ret);
    return ret;
}

Sprite *sub_02024714(const SpriteTemplateNoScaleRotation *template) {
    SpriteTemplate newTemplate;

    newTemplate.spriteList = template->spriteList;
    newTemplate.header = template->header;
    newTemplate.position = template->position;
    SetVec(newTemplate.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    newTemplate.rotation = 0;
    newTemplate.priority = template->priority;
    newTemplate.whichScreen = template->whichScreen;
    newTemplate.heapId = template->heapId;
    return CreateSprite(&newTemplate);
}

void Sprite_Delete(Sprite *sprite) {
    if (sprite->flag) {
        if (sprite->prev != NULL) {
            sub_020250BC(sprite, sprite->prev);
        }
        if (sprite->flag == 3) {
            SpriteVramAnimationData *animData = (SpriteVramAnimationData *)sprite->animationData;
            if (NNS_G2dGetImageLocation(&sprite->imageProxy, sprite->type) != -1) {
                NNS_G2dFreeCellTransferStateHandle(animData->cellTransferHandle);
            }
        }
        if (sprite->flag == 2) {
            SpriteMulticellAnimation *animData = (SpriteMulticellAnimation *)sprite->animationData;
            if (animData->node != NULL) {
                FreeToHeap((animData->node));
            }
            if (animData->cellAnim) {
                FreeToHeap(animData->cellAnim);
            }
        }
        sprite->flag = 0;
        sub_0202512C(sprite->spriteList, sprite);
    }
}

void Sprite_SetMatrix(Sprite *sprite, VecFx32 *position) {
    sprite->matrix = *position;
}

void sub_020247E4(Sprite *sprite, VecFx32 *affine) {
    sprite->affineMatrix = *affine;
}

void sub_020247F4(Sprite *sprite, VecFx32 *scale) {
    sprite->scale = *scale;
}

void sub_02024804(Sprite *sprite, VecFx32 *scale, u8 affine) {
    sub_020247F4(sprite, scale);
    sub_0202487C(sprite, affine);
}

void sub_02024818(Sprite *sprite, u32 rotation) {
    sprite->rotation = rotation;
}

void sub_0202481C(Sprite *sprite, u32 rotation, u8 affine) {
    sub_02024818(sprite, rotation);
    sub_0202487C(sprite, affine);
}

void Set2dSpriteVisibleFlag(Sprite *sprite, int a1) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(a1 < 2);
    sprite->drawFlag = a1;
}

void Set2dSpriteAnimActiveFlag(Sprite *sprite, int active) {
    GF_ASSERT(sprite != NULL);
    GF_ASSERT(active < 2);
    sprite->animationFrame = active;
}

void sub_02024868(Sprite *sprite, fx32 frame) {
    GF_ASSERT(sprite != NULL);
    sprite->frame = frame;
}

void sub_0202487C(Sprite *sprite, u8 affine) {
    GF_ASSERT(sprite != NULL);
    sprite->affine = affine;
}

void sub_02024890(Sprite *sprite, u8 a1) {
    GF_ASSERT(sprite != NULL);
    sprite->flip = a1;
    sprite->affine = 0;
}

VecFx32 *Sprite_GetMatrixPtr(Sprite *sprite) {
    return &sprite->matrix;
}

VecFx32 *sub_020248B0(Sprite *sprite) {
    return &sprite->scale;
}

u16 sub_020248B4(Sprite *sprite) {
    return sprite->rotation;
}

BOOL Get2dSpriteVisibleFlag(Sprite *sprite) {
    return sprite->drawFlag;
}

BOOL sub_020248C0(Sprite *sprite) {
    return sprite->animationFrame;
}

u32 Get2dSpriteAnimSeqNo(Sprite *sprite) {
    GF_ASSERT(sprite != NULL);
    switch (sprite->flag) {
    case 1:
    case 3:
    {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;
        return animData->animBankData->numSequences;
    }
    default: {
        SpriteMulticellAnimation *animData = (SpriteMulticellAnimation *)sprite->animationData;
        return animData->multiAnimBankData->numSequences;
    }
    }
}

void Set2dSpriteAnimSeqNo(Sprite *sprite, int seqNo) {
    GF_ASSERT(Get2dSpriteAnimSeqNo(sprite) > seqNo);
    sprite->animationNo = seqNo;
    switch (sprite->flag) {
    case 1:
    case 3:
    {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;

        NNS_G2dSetCellAnimationSequence(&animData->animation, NNS_G2dGetAnimSequenceByIdx(animData->animBankData, seqNo));
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        break;
    }
    default: {
        SpriteMulticellAnimation *animData = (SpriteMulticellAnimation *)sprite->animationData;
        NNS_G2dSetAnimSequenceToMCAnimation(&animData->animation, NNS_G2dGetAnimSequenceByIdx(animData->multiAnimBankData, seqNo));
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        break;
    }
    }
}

void TryChange2dSpriteAnimSeqNo(Sprite *sprite, int seqNo) {
    if (sprite->animationNo != seqNo) {
        Set2dSpriteAnimSeqNo(sprite, seqNo);
    }
}

void Sprite_ResetAnimCtrlState(Sprite *sprite) {
    switch (sprite->flag) {
    case 1:
    case 3:
    {
        SpriteAnimationData *animData = (SpriteAnimationData *)sprite->animationData;

        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimCtrlCurrentFrame(sprite, 0);
        break;
    }
    default: {
        SpriteMulticellAnimation *animData = (SpriteMulticellAnimation *)sprite->animationData;

        NNS_G2dResetAnimCtrlState(&animData->animation.animCtrl);
        NNS_G2dStartAnimCtrl(&animData->animation.animCtrl);
        Sprite_SetAnimCtrlCurrentFrame(sprite, 0);
        break;
    }
    }
}
