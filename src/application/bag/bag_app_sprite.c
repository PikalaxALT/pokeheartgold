#include "application/bag_app_internal.h"

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
