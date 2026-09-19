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
void ov15_022000F4(BagAppData *appData);

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

extern const ManagedSpriteTemplate ov15_02200B0C[39];

void ov15_021FFDD8(BagAppData *appData) {
    u32 i;

    for (i = 0; i < 39; ++i) {
        appData->sprites[i] = SpriteSystem_NewSpriteWithYOffset(appData->spriteSystem, appData->spriteManager, &ov15_02200B0C[i], FX32_CONST(256));
    }
    ManagedSprite_SetPriority(appData->sprites[19], 1);
    for (i = 0; i < 4; ++i) {
        ManagedSprite_SetPriority(appData->sprites[28 + i], 1);
    }
    for (i = 0; i < 8; ++i) {
        ManagedSprite_SetPriority(appData->sprites[9 + i], 1);
    }
    ov15_02200458(appData, 1);
    ManagedSprite_SetDrawFlag(appData->sprites[0], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[7], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[8], FALSE);
    for (i = 0; i < 4; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[28 + i], FALSE);
    }
    for (i = 0; i < 6; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[32 + i], FALSE);
    }
    ManagedSprite_SetDrawFlag(appData->sprites[38], FALSE);
    ManagedSprite_SetPriority(appData->sprites[38], 1);
}

void ov15_021FFEC0(BagAppData *appData) {
    appData->unk_648 = 0;
}

extern const u8 ov15_02200AB8[][4];

void ov15_021FFECC(BagAppData *appData, int a1) {
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[20], ov15_02200AB8[a1][0], ov15_02200AB8[a1][1], FX32_CONST(256));
    ManagedSprite_SetAnim(appData->sprites[20], ov15_02200AB8[a1][2]);
    ManagedSprite_SetPaletteOverride(appData->sprites[20], ov15_02200AB8[a1][3]);
    ManagedSprite_SetDrawFlag(appData->sprites[20], TRUE);
}

void ov15_021FFF24(BagAppData *appData) {
    ManagedSprite_SetDrawFlag(appData->sprites[20], FALSE);
}

extern const u8 ov15_02200A34[][4];

void ov15_021FFF34(BagAppData *appData, int a1) {
    GF_ASSERT(a1 < 9);
    if (a1 == 8) {
        ManagedSprite_SetAnim(appData->sprites[20], ov15_02200A34[a1][2]);
    } else {
        BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
        int itemSlot = pocket->scroll + a1;
        if (itemSlot == appData->unk_672) {
            ManagedSprite_SetAnim(appData->sprites[20], 10);
        } else if (itemSlot >= pocket->count) {
            ManagedSprite_SetAnim(appData->sprites[20], 40);
        } else {
            ManagedSprite_SetAnim(appData->sprites[20], 20);
        }
    }
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[20], ov15_02200A34[a1][0], ov15_02200A34[a1][1], FX32_CONST(256));
    ManagedSprite_SetPaletteOverride(appData->sprites[20], ov15_02200A34[a1][3]);
}

extern const u8 ov15_022009D4[][4];

void ov15_021FFFDC(BagAppData *appData, int a1) {
    GF_ASSERT(a1 < 8);
    ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[20], ov15_022009D4[a1][0], ov15_022009D4[a1][1], FX32_CONST(256));
    ManagedSprite_SetAnim(appData->sprites[20], ov15_022009D4[a1][2]);
    ManagedSprite_SetPaletteOverride(appData->sprites[20], ov15_022009D4[a1][3]);
}

void ov15_02200030(BagAppData *appData, int pocket) {
    if (pocket <= 7) {
        u16 *pRawData = appData->unk_6A0->pRawData;
        GXS_LoadOBJPltt(pRawData + 128, 0, 128 * 2);
        GXS_LoadOBJPltt(pRawData + 16 * pocket, 16 * pocket * 2, 16 * 2);
    }
}

void ov15_0220005C(BagAppData *appData, int a1, int a2, int a3) {
    int i;

    if (a1 == 0) {
        for (i = 0; i < 6; ++i) {
            ManagedSprite_SetDrawFlag(appData->sprites[21 + i], FALSE);
        }
        ManagedSprite_SetDrawFlag(appData->sprites[27], FALSE);
    } else {
        for (i = 0; i < 6; ++i) {
            if (i < a1) {
                ManagedSprite_SetDrawFlag(appData->sprites[21 + i], TRUE);
            } else {
                ManagedSprite_SetDrawFlag(appData->sprites[21 + i], FALSE);
            }
        }
        if (a2 >= 0) {
            ManagedSprite_SetDrawFlag(appData->sprites[21 + a2], FALSE);
        }
        if (a3) {
            ManagedSprite_SetDrawFlag(appData->sprites[27], FALSE);
        }
    }
}

void ov15_022000F4(BagAppData *appData) {
    if (appData->bagView->pockets[appData->bagView->curPocket].count <= 6) {
        ManagedSprite_SetDrawFlag(appData->sprites[17], FALSE);
        ManagedSprite_SetDrawFlag(appData->sprites[18], FALSE);
    } else {
        ManagedSprite_SetDrawFlag(appData->sprites[17], TRUE);
        ManagedSprite_SetDrawFlag(appData->sprites[18], TRUE);
    }
}

void ov15_02200140(BagAppData *appData, BagViewPocket *pocket, int a2, int a3) {
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[1 + i], ov15_02200B0C[1 + i].x, ov15_02200B0C[1 + i].y, FX32_CONST(256));
        if (i < a2) {
            if (a3) {
                ov15_021FF8F0(appData, i, appData->unk_6A4[pocket->scroll + i]);
            }
            ManagedSprite_SetDrawFlag(appData->sprites[i + 1], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[i + 1], FALSE);
        }
    }
    ov15_022000F4(appData);
}

void ov15_022001C4(BagAppData *appData, BagViewPocket *pocket, int a2) {
    int r7 = -1;
    int r2 = (a2 / 6) * 6;
    if (pocket->scroll == r2) {
        r7 = a2 % 6;
    }
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[1 + i], ov15_02200B0C[1 + i].x, ov15_02200B0C[1 + i].y, FX32_CONST(256));
        if (i == r7) {
            ManagedSprite_SetDrawFlag(appData->sprites[1 + i], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[1 + i], FALSE);
        }
    }
    ov15_022000F4(appData);
}

void ov15_0220023C(BagAppData *appData, u8 *a1) {
    ManagedSprite_SetDrawFlag(appData->sprites[20], TRUE);
    for (int i = 0; i < 4; ++i) {
        if (a1[i] != 0xFF) {
            ManagedSprite_SetDrawFlag(appData->sprites[28 + i], TRUE);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[28 + i], FALSE);
        }
    }
    ManagedSprite_SetDrawFlag(appData->sprites[17], FALSE);
    ManagedSprite_SetDrawFlag(appData->sprites[18], FALSE);
}

void ov15_02200294(BagAppData *appData) {
    for (int i = 0; i < 4; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[28 + i], FALSE);
    }
}

void ov15_022002B4(BagAppData *appData, int a1) {
    for (int i = 0; i < 6; ++i) {
        if (a1 != i) {
            ManagedSprite_SetDrawFlag(appData->sprites[1 + i], FALSE);
        } else {
            ManagedSprite_SetPositionXYWithSubscreenOffset(appData->sprites[1 + i], 86, 76, FX32_CONST(256));
        }
    }
}

int ov15_022002EC(int a0) {
    int result = 0;
    if (a0 < 100) {
        result = 1;
    }
    if (a0 < 10) {
        result = 2;
    }
    return result;
}

extern const int ov15_02200998[2];
extern const int ov15_02200A58[2][6];
extern const int ov15_02200A88[2][6];
extern const int ov15_022009A0[];
extern const int ov15_02200A14[][4];

void ov15_02200300(BagAppData *appData, int a1, int a2) {
    int i;
    if (a1 == 2 && a2 > 99) {
        a2 = 99;
    }
    for (i = 0; i < ov15_02200998[a1 - 2]; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[32 + ov15_02200A58[a1 - 2][i]], TRUE);
        ManagedSprite_SetAnim(appData->sprites[32 + ov15_02200A58[a1 - 2][i]], ov15_02200A88[a1 - 2][i]);
    }
    int r0 = ov15_022002EC(a2);
    if (r0 != 0) {
        if (a1 - 2 == 0 && r0 == 2) {
            ManagedSprite_SetDrawFlag(appData->sprites[32], FALSE);
            ManagedSprite_SetDrawFlag(appData->sprites[35], FALSE);
        } else if (a1 - 2 == 1) {
            for (i = 0; i < ov15_022009A0[r0 - 1]; ++i) {
                ManagedSprite_SetDrawFlag(appData->sprites[32 + ov15_02200A14[r0 - 1][i]], FALSE);
            }
        }
    }
    ManagedSprite_SetDrawFlag(appData->sprites[38], TRUE);
    ManagedSprite_SetAnimationFrame(appData->sprites[38], 0);
    ManagedSprite_SetAnim(appData->sprites[38], 37);
    ManagedSprite_SetAnimationFrame(appData->sprites[19], 0);
    ManagedSprite_SetAnim(appData->sprites[19], 39);
}

void ov15_02200428(BagAppData *appData) {
    for (int i = 0; i < 6; ++i) {
        ManagedSprite_SetDrawFlag(appData->sprites[32 + i], FALSE);
    }
    ManagedSprite_SetDrawFlag(appData->sprites[38], FALSE);
}

void ov15_02200458(BagAppData *appData, int a1) {
    int i;
    u8 sp0[POCKETS_COUNT];

    GF_ASSERT(a1 == 1 || a1 == 0);

    MI_CpuClear8(sp0, POCKETS_COUNT);
    for (i = 0; i < POCKETS_COUNT; ++i) {
        GF_ASSERT(appData->bagView->pockets[i].pocketId < POCKETS_COUNT);
        if (appData->bagView->pockets[i].slots != NULL) {
            sp0[appData->bagView->pockets[i].pocketId] = 1;
        }
    }
    for (i = 0; i < POCKETS_COUNT; ++i) {
        if (sp0[i]) {
            ManagedSprite_SetDrawFlag(appData->sprites[9 + i], a1);
        } else {
            ManagedSprite_SetDrawFlag(appData->sprites[9 + i], FALSE);
        }
    }
}

void ov15_022004DC(BagAppData *appData, int a1) {
    ManagedSprite_SetDrawFlag(appData->sprites[19], a1);
}
