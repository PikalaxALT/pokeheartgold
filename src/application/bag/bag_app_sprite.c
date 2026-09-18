#include "application/bag_app_internal.h"

#include "gf_gfx_loader.h"
#include "move.h"
#include "unk_02077678.h"
#include "vram_transfer_manager.h"

void ov15_021FF8F0(BagAppData *appData, int idx, u16 itemId);
void ov15_021FFA40(BagAppData *appData);
void ov15_021FFAD0(BagAppData *appData);
void ov15_021FFDD8(BagAppData *appData);
void ov15_021FFEC0(BagAppData *appData);

void ov15_021FF850(BagAppData *appData) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(32, HEAP_ID_BAG);
    ov15_021FFA40(appData);
    ov15_021FFAD0(appData);
    ov15_021FFDD8(appData);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(appData->spriteSystem), 0, FX32_CONST(256));
}

void ov15_021FF894(BagAppData *appData) {
    for (u32 i = 0; i < 39; ++i) {
        Sprite_DeleteAndFreeResources(appData->sprites[i]);
    }
    SpriteSystem_FreeResourcesAndManager(appData->spriteSystem, appData->spriteManager);
    SpriteSystem_Free(appData->spriteSystem);
    Heap_Free(appData->unk_69C);
}

void ov15_021FF8D4(BagAppData *appData) {
    for (u32 i = 0; i < 39; ++i) {
        ManagedSprite_TickFrame(appData->sprites[i]);
    }
}

void ov15_021FF8F0(BagAppData *appData, int idx, u16 itemId) {
    SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemId, ITEMNARC_NCGR), FALSE, 0xC0FC + idx);
    SpriteSystem_ReplacePlttResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemId, ITEMNARC_NCLR), FALSE, 0xC0FB + idx);
}

void ov15_021FF950(BagAppData *appData) {
    appData->unk_64B = 0;
    appData->unk_648 = 1;
}

void ov15_021FF964(BagAppData *appData) {
    switch (appData->unk_648) {
    case 0:
        break;
    case 1:
        ov15_021FFEC0(appData);
        break;
    }
}

void ov15_021FF97C(BagAppData *appData, u16 itemId, int drawFlag) {
    ManagedSprite_SetDrawFlag(appData->sprites[7], drawFlag);
    ManagedSprite_SetDrawFlag(appData->sprites[8], drawFlag);
    if (drawFlag) {
        u16 move = TMHMGetMove(itemId);
        u16 type = GetMoveAttr(move, MOVEATTR_TYPE);
        u16 category = GetMoveAttr(move, MOVEATTR_CLASS);
        SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, sub_020776B4(), sub_02077678(type), TRUE, 49411);
        ManagedSprite_SetPaletteOverride(appData->sprites[7], sub_0207769C(type) + 4);
        SpriteSystem_ReplaceCharResObj(appData->spriteSystem, appData->spriteManager, sub_02077830(), sub_02077800(category), TRUE, 49412);
        ManagedSprite_SetPaletteOverride(appData->sprites[8], sub_02077818(category) + 4);
    }
}

void ov15_021FFA40(BagAppData *appData) {
    // SpriteResourceCountsListUnion sp34 = {
    //     .numChar = 12,
    //     .numPltt = 10,
    //     .numCell = 6,
    //     .numAnim = 7,
    // };
    extern const SpriteResourceCountsListUnion ov15_022009BC;
    SpriteResourceCountsListUnion sp34 = ov15_022009BC;
    appData->spriteSystem = SpriteSystem_Alloc(HEAP_ID_BAG);
    appData->spriteManager = SpriteManager_New(appData->spriteSystem);
    // OamManagerParam sp14 = {
    //     .fromOBJmain = 0,
    //     .numOBJmain = 128,
    //     .fromAffineMain = 0,
    //     .numAffineMain = 32,
    //     .fromOBJsub = 0,
    //     .numOBJsub = 128,
    //     .fromAffineSub = 0,
    //     .numAffineSub = 32,
    // };
    extern const OamManagerParam ov15_022009F4;
    OamManagerParam sp14 = ov15_022009F4;
    // OamCharTransferParam sp0 = {
    //     .maxTasks = 39,
    //     .sizeMain = 0x20000,
    //     .sizeSub = 0x4000,
    //     .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
    //     .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
    // };
    extern const OamCharTransferParam ov15_022009A8;
    OamCharTransferParam sp0 = ov15_022009A8;
    SpriteSystem_Init(appData->spriteSystem, &sp14, &sp0, 32);
    SpriteSystem_InitSprites(appData->spriteSystem, appData->spriteManager, 39);
    SpriteSystem_InitManagerWithCapacities(appData->spriteSystem, appData->spriteManager, &sp34);
}

void ov15_021FFAD0(BagAppData *appData) {
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 26, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 49401);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 6, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 49402);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 51, FALSE, NNS_G2D_VRAM_TYPE_2DSUB, 49403);
    SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_6_0, 4, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, 49410);
    for (int i = 0; i < 6; ++i) {
        SpriteSystem_LoadCharResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(ITEM_NONE, ITEMNARC_NCGR), FALSE, NNS_G2D_VRAM_TYPE_2DSUB, 49404 + i);
    }
    sub_020776B8(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, 0, 49411);
    sub_02077834(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, 0, 49412);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 15, FALSE, 2, NNS_G2D_VRAM_TYPE_2DMAIN, 49401);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_6_0, 10, FALSE, 2, NNS_G2D_VRAM_TYPE_2DMAIN, 49409);
    sub_020776EC(appData->spriteSystem, appData->spriteManager, NNS_G2D_VRAM_TYPE_2DMAIN, 49410);
    SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 47, FALSE, 10, NNS_G2D_VRAM_TYPE_2DSUB, 49402);
    for (int i = 0; i < 6; ++i) {
        SpriteSystem_LoadPlttResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(ITEM_NONE, ITEMNARC_NCLR), 0, TRUE, NNS_G2D_VRAM_TYPE_2DSUB, 49403 + i);
    }
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 25, FALSE, 49401);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 5, FALSE, 49402);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 49, FALSE, 49403);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIconCell(), FALSE, 49404);
    SpriteSystem_LoadCellResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_6_0, 5, FALSE, 49405);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 21, FALSE, 49401);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 24, FALSE, 49402);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 4, FALSE, 49403);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_1_5, 50, FALSE, 49404);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_itemtool_itemdata_item_icon, GetItemIconAnim(), FALSE, 49405);
    SpriteSystem_LoadAnimResObj(appData->spriteSystem, appData->spriteManager, NARC_a_0_6_0, 6, FALSE, 49406);
    sub_0207775C(appData->spriteSystem, appData->spriteManager, 49406, 49407);
    appData->unk_69C = GfGfxLoader_GetPlttData(NARC_a_0_1_5, 48, &appData->unk_6A0, HEAP_ID_BAG);
}
