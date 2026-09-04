#include "global.h"

#include "application/bag_app_internal.h"
#include "msgdata/msg.naix"

#include "bag.h"
#include "bag_types_def.h"
#include "bg_window.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "list_menu_items.h"
#include "message_format.h"
#include "message_printer.h"
#include "msgdata.h"
#include "player_data.h"
#include "render_text.h"
#include "render_window.h"
#include "roamer.h"
#include "screen_fade.h"
#include "sound_02004A44.h"
#include "sprite_system.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_020210A0.h"
#include "unk_0203A3B0.h"
#include "unk_0208805C.h"
#include "vram_transfer_manager.h"

void BagApp_GetSaveStructPtrs(BagAppData *appData);
RoamerSaveData *BagApp_GetSaveRoamers(BagAppData *appData);
void BagApp_SetRepelStepCount(BagAppData *appData, u8 repelSteps);
void BagApp_SetFlute(BagAppData *appData, u8 flute);
void ov15_021F995C(void *cbArg);
void ov15_021F9984(void);
void ov15_021F99A4(BgConfig *bgConfig);
void ov15_021F9A8C(BgConfig *bgConfig);
void ov15_021F9AE4(BagAppData *appData);
void ov15_021F9C78(BagAppData *appData, BOOL a1);
void ov15_021F9CBC(BagAppData *appData);
void ov15_021F9D28(BagAppData *appData);
u16 ov15_021F9D60(BagAppData *appData, int a1, BOOL a2);
void ov15_021F9D8C(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID);
void ov15_021F9D9C(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID);
void ov15_021F9DB4(BagAppData *appData);
void ov15_021F9EA8(BagAppData *appData);
void ov15_021F9F08(BagAppData *appData);
void ov15_021FA008(BagAppData *appData);
void ov15_021FA028(BagAppData *appData);
void ov15_021FA044(s16 *a0, u16 *a1, u8 a2);
void ov15_021FA070(s16 *a0, u16 *a1, u8 a2, int a3);
int ov15_021FA074(BagAppData *appData);
int ov15_021FA098(BagAppData *appData);
void ov15_021FA0D8(BagAppData *appData);
void ov15_021FA0E4(BagAppData *appData, int a1);
BOOL ov15_021FA104(BagAppData *appData, int a1);
u16 ov15_021FA12C(BagAppData *appData);
void ov15_021FA170(BagAppData *appData);
BagAppState ov15_021FA1BC(BagAppData *appData);
BagAppState ov15_021FA4F8(BagAppData *appData);
BagAppState ov15_021FA578(BagAppData *appData, int a1);
void ov15_021FA620(BagAppData *appData);
BOOL ov15_021FA650(BagAppData *appData);
int ov15_021FA68C(BagAppData *appData, u32 a1);
int ov15_021FA6C0(BagAppData *appData, int a1, int a2);
void ov15_021FA6F4(BagAppData *appData, BagViewPocket *pocket);
BagAppState ov15_021FA73C(BagAppData *appData, int a1, u8 *a2, int a3, int a4, int a5);
BOOL ov15_021FA93C(BagAppData *appData);
BOOL ov15_021FAA18(BagAppData *appData);
BOOL ov15_021FAB34(BagAppData *appData);
u32 ov15_021FAC2C(BagAppData *appData, int a1);
int ov15_021FAC40(BagAppData *appData);
void ov15_021FAC48(BagAppData *appData);
int ov15_021FAD28(int a0);
void ov15_021FAD80(BagAppData *appData, BagViewPocket *pocket);
int ov15_021FADE8(BagAppData *appData, int a1);
BagAppState ov15_021FAE48(BagAppData *appData);
BagAppState ov15_021FAFFC(BagAppData *appData);
BagAppState ov15_021FB060(BagAppData *appData);
void ov15_021FB114(BagAppData *appData);
void ov15_021FB14C(BagAppData *appData);
BagAppState ov15_021FB5AC(BagAppData *appData);
BagAppState ov15_021FB604(BagAppData *appData);
BagAppState ov15_021FB654(BagAppData *appData);
BagAppState ov15_021FB700(BagAppData *appData);
BagAppState ov15_021FB820(BagAppData *appData);
BagAppState ov15_021FBD50(BagAppData *appData);
BagAppState ov15_021FBF98(BagAppData *appData);
BagAppState ov15_021FBFC0(BagAppData *appData);
BagAppState ov15_021FBFF8(BagAppData *appData);
BagAppState ov15_021FC01C(BagAppData *appData);
BagAppState ov15_021FC140(BagAppData *appData);
BagAppState ov15_021FC164(BagAppData *appData);
BagAppState ov15_021FC2E0(BagAppData *appData);
BagAppState ov15_021FC41C(BagAppData *appData);
BagAppState ov15_021FC784(BagAppData *appData);
BagAppState ov15_021FC7EC(BagAppData *appData);
BagAppState ov15_021FCB64(BagAppData *appData);
BagAppState ov15_021FCD80(BagAppData *appData);
BagAppState ov15_021FCDE4(BagAppData *appData);
BagAppState ov15_021FCFC8(BagAppData *appData);
BagAppState ov15_021FD058(BagAppData *appData);
BagAppState ov15_021FD0E8(BagAppData *appData);
BagAppState ov15_021FD10C(BagAppData *appData);
BagAppState ov15_021FD24C(BagAppData *appData);
BagAppState ov15_021FD2FC(BagAppData *appData);
BagAppState ov15_021FD3AC(BagAppData *appData);
void ov15_021FD404(BagAppData *appData, int a1, u8 pocket);
void ov15_021FD574(BagAppData *appData, int a1, int a2, int a3);
void ov15_021FD774(BagAppData *appData, int a1);
BagAppState ov15_021FD7D0(BagAppData *appData, int a1, int a2, int a3, int a4);
BagAppState ov15_021FD810(BagAppData *appData, int a1, int a2, int a3);
BagAppState ov15_021FD850(BagAppData *appData);
void ov15_021FD93C(BagAppData *appData);
void ov15_021FDAF4(void *a0, int a1, int a2);
void ov15_021FDC6C(BagAppData *appData);
int ov15_021FDC88(BagAppData *appData);
void ov15_021FDF88(BagAppData *appData);
void ov15_021FECA0(BagAppData *appData, Window *window, u16 itemId);
void ov15_021FECC4(BagAppData *appData, Window *window);
void ov15_021FECD8(BagAppData *appData, Window *window, int a2);

extern const u8 ov15_022008B0[8];

BOOL Bag_Init(OverlayManager *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    G2_BlendNone();
    G2S_BlendNone();

    Heap_Create(HEAP_ID_3, HEAP_ID_BAG, 0x42000);
    BagAppData *appData = OverlayManager_CreateAndGetData(man, sizeof(BagAppData), HEAP_ID_BAG);
    memset(appData, 0, sizeof(BagAppData));
    appData->unk_234 = OverlayManager_GetArgs(man);
    BagApp_GetSaveStructPtrs(appData);
    appData->unk_000 = BgConfig_Alloc(HEAP_ID_BAG);
    appData->unk_615 = PlayerProfile_GetTrainerGender(appData->unk_23C);

    BeginNormalPaletteFade(FADE_SUB_THEN_MAIN, FADE_TYPE_DOWNWARD_IN, FADE_TYPE_DOWNWARD_IN, RGB_BLACK, 6, 1, HEAP_ID_BAG);
    SetKeyRepeatTimers(3, 8);
    ov15_021F9DB4(appData);
    ov15_021F9CBC(appData);
    ov15_021FA008(appData);
    ov15_021F9D28(appData);
    ov15_021FA620(appData);
    ov15_021F9984();
    ov15_021F99A4(appData->unk_000);
    ov15_021F9AE4(appData);
    sub_020210BC();
    sub_02021148(4);
    ov15_021FE020(appData);
    TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    ov15_021FE4C8(appData);
    ov15_021FE528(appData);
    ov15_021FEA5C(appData);
    ov15_021FE874(appData);
    ov15_021F9F08(appData);
    ov15_021FF29C(appData, 0);

    ov15_021FA044(&appData->unk_234->pockets[appData->unk_234->unk64].scroll, &appData->unk_234->pockets[appData->unk_234->unk64].position, appData->unk_234->pockets[appData->unk_234->unk64].unk_9);
    ov15_021FA070(&appData->unk_234->pockets[appData->unk_234->unk64].scroll, &appData->unk_234->pockets[appData->unk_234->unk64].position, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, 6);
    ov15_021FF850(appData);
    ov15_021FD574(appData, 0, ov15_021FA074(appData), 0);
    ov15_021FF364(appData, appData->unk_234->pockets[appData->unk_234->unk64].scroll, -1, 0);
    ov15_02200030(appData, appData->unk_234->unk64);
    ov15_021FD404(appData, 1, appData->unk_234->unk64);
    ov15_021FF6BC(appData, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, appData->unk_234->pockets[appData->unk_234->unk64].scroll, 0);
    ov15_02200140(appData, &appData->unk_234->pockets[appData->unk_234->unk64], ov15_021FA074(appData), 1);
    appData->unk_644 = appData->unk_234->pockets[appData->unk_234->unk64].position + 8;
    ov15_021FFECC(appData, appData->unk_644);
    ov15_021FA170(appData);
    if (appData->unk_234->unk65 == 4 || appData->unk_234->unk65 == 5) {
        ov15_021FF1E0(appData);
    }
    ov15_021FD93C(appData);
    Main_SetVBlankIntrCB(ov15_021F995C, appData);
    Sound_SetSceneAndPlayBGM(51, 0, 0);
    sub_0203A964();
    GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
    return TRUE;
}

BOOL Bag_Main(OverlayManager *man, int *state) {
    BagAppData *appData = OverlayManager_GetData(man);

    switch (*state) {
    case BAG_APP_STATE_0:
        if (IsPaletteFadeFinished() == TRUE) {
            switch (appData->unk_234->unk65) {
            case 2:
                *state = BAG_APP_STATE_16;
                break;
            case 1:
                *state = BAG_APP_STATE_14;
                break;
            case 3:
                *state = BAG_APP_STATE_26;
                break;
            default:
                *state = BAG_APP_STATE_1;
                break;
            }
        }
        break;
    case BAG_APP_STATE_1:
        *state = ov15_021FA1BC(appData);
        break;
    case BAG_APP_STATE_2:
        if (ov15_021FA93C(appData) == TRUE) {
            if (appData->unk_234->unk65 == 2) {
                *state = BAG_APP_STATE_16;
            } else if (appData->unk_234->unk65 == 1) {
                *state = BAG_APP_STATE_14;
            } else if (appData->unk_234->unk65 == 3) {
                *state = BAG_APP_STATE_26;
            } else {
                *state = BAG_APP_STATE_1;
            }
        }
        break;
    case BAG_APP_STATE_3:
        *state = ov15_021FAE48(appData);
        break;
    case BAG_APP_STATE_4:
        *state = ov15_021FB5AC(appData);
        break;
    case BAG_APP_STATE_5:
        *state = ov15_021FBD50(appData);
        break;
    case BAG_APP_STATE_6:
        *state = ov15_021FBF98(appData);
        break;
    case BAG_APP_STATE_7:
        *state = ov15_021FBFC0(appData);
        break;
    case BAG_APP_STATE_8:
        *state = ov15_021FBFF8(appData);
        break;
    case BAG_APP_STATE_9:
        *state = ov15_021FC01C(appData);
        break;
    case BAG_APP_STATE_10:
        *state = ov15_021FC140(appData);
        break;
    case BAG_APP_STATE_11:
        *state = ov15_021FC164(appData);
        break;
    case BAG_APP_STATE_12:
        *state = ov15_021FB700(appData);
        break;
    case BAG_APP_STATE_13:
        *state = ov15_021FB820(appData);
        break;
    case BAG_APP_STATE_14:
        *state = ov15_021FC41C(appData);
        break;
    case BAG_APP_STATE_15:
        *state = ov15_021FC784(appData);
        break;
    case BAG_APP_STATE_16:
        *state = ov15_021FC7EC(appData);
        break;
    case BAG_APP_STATE_17:
        *state = ov15_021FCD80(appData);
        break;
    case BAG_APP_STATE_18:
        *state = ov15_021FCDE4(appData);
        break;
    case BAG_APP_STATE_19:
        *state = ov15_021FCFC8(appData);
        break;
    case BAG_APP_STATE_20:
        *state = ov15_021FD058(appData);
        break;
    case BAG_APP_STATE_21:
        *state = ov15_021FD0E8(appData);
        break;
    case BAG_APP_STATE_22:
        *state = ov15_021FD10C(appData);
        break;
    case BAG_APP_STATE_23:
        *state = ov15_021FD24C(appData);
        break;
    case BAG_APP_STATE_24:
        *state = ov15_021FD2FC(appData);
        break;
    case BAG_APP_STATE_26:
        *state = ov15_021FD3AC(appData);
        break;
    case BAG_APP_STATE_25:
        *state = ov15_021FC2E0(appData);
        break;
    case BAG_APP_STATE_27:
        *state = ov15_021FA4F8(appData);
        break;
    case BAG_APP_STATE_28:
        *state = ov15_021FB604(appData);
        break;
    case BAG_APP_STATE_29:
        *state = ov15_021FB654(appData);
        break;
    case BAG_APP_STATE_30:
        *state = ov15_021FA578(appData, 1);
        break;
    case BAG_APP_STATE_31:
        *state = ov15_021FA578(appData, -1);
        break;
    case BAG_APP_STATE_32:
        *state = ov15_021FB060(appData);
        break;
    case BAG_APP_STATE_33:
        *state = ov15_021FAFFC(appData);
        break;
    case BAG_APP_STATE_34:
        *state = ov15_021FCB64(appData);
        break;
    case BAG_APP_STATE_35:
        *state = ov15_021FD850(appData);
        break;
    case BAG_APP_STATE_36:
        sub_020880CC(1, HEAP_ID_BAG);
        *state = BAG_APP_STATE_37;
        break;
    case BAG_APP_STATE_37:
        if (IsPaletteFadeFinished() == TRUE) {
            return TRUE;
        }
        break;
    }

    ov15_021FF8D4(appData);
    SpriteSystem_DrawSprites(appData->unk_24C);
    ov15_021FDC88(appData);
    return FALSE;
}

BOOL Bag_Exit(OverlayManager *man, int *state) {
    { // scope guard here to prevent use after free
        BagAppData *appData = OverlayManager_GetData(man);

        ov15_021FDC6C(appData);
        ov15_021FF894(appData);
        Heap_Free(appData->unk_68C);
        Heap_Free(appData->unk_690);
        ov15_021FA0D8(appData);
        ov15_021F9EA8(appData);
        ov15_021FE154(appData);
        ov15_021F9A8C(appData->unk_000);
        sub_02021238();
        GF_DestroyVramTransferManager();
        ov15_021FEB64(appData);
        ov15_021FE504(appData);
        ov15_021FE8A4(appData);
        ov15_021FA028(appData);
        String_Delete(appData->unk_5E4);
        DestroyMsgData(appData->unk_2FC);
        DestroyMsgData(appData->unk_2F8);
        DestroyMsgData(appData->unk_2F0);
        MessagePrinter_Delete(appData->unk_2EC);
        MessageFormat_Delete(appData->unk_2F4);
        NARC_Delete(appData->unk_244);
    }
    OverlayManager_FreeData(man);
    // possible UB: a vblank intr here results in use after free
    sub_02004B10();
    Main_SetVBlankIntrCB(NULL, NULL);
    Heap_Destroy(HEAP_ID_BAG);
    return TRUE;
}

void BagApp_GetSaveStructPtrs(BagAppData *appData) {
    appData->unk_238 = Save_Bag_Get(appData->unk_234->saveData);
    appData->unk_23C = Save_PlayerData_GetProfile(appData->unk_234->saveData);
    appData->unk_240 = Save_PlayerData_GetOptionsAddr(appData->unk_234->saveData);
}

RoamerSaveData *BagApp_GetSaveRoamers(BagAppData *appData) {
    return Save_Roamers_Get(appData->unk_234->saveData);
}

void BagApp_SetRepelStepCount(BagAppData *appData, u8 repelSteps) {
    *RoamerSave_GetRepelAddr(BagApp_GetSaveRoamers(appData)) = repelSteps;
}

void BagApp_SetFlute(BagAppData *appData, u8 flute) {
    RoamerSave_SetFlute(BagApp_GetSaveRoamers(appData), flute);
}

void ov15_021F995C(void *cbArg) {
    BagAppData *appData = cbArg;

    DoScheduledBgGpuUpdates(appData->unk_000);
    GF_RunVramTransferTasks();
    SpriteSystem_TransferOam();
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
}

void ov15_021F9984(void) {
    extern const GraphicsBanks ov15_02200618;
    GraphicsBanks sp0 = ov15_02200618;

    GfGfx_SetBanks(&sp0);
}

void ov15_021F99A4(BgConfig *bgConfig) {
    extern const GraphicsModes ov15_02200518;
    GraphicsModes sp4 = ov15_02200518;
    SetBothScreensModesAndDisable(&sp4);

    extern const BgTemplate ov15_022006CC;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &ov15_022006CC, GF_BG_TYPE_TEXT);
    extern const BgTemplate ov15_022006E8;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &ov15_022006E8, GF_BG_TYPE_TEXT);
    extern const BgTemplate ov15_02200704;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &ov15_02200704, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_1, 0x20, 0x000, HEAP_ID_BAG);

    extern const BgTemplate ov15_02200720;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &ov15_02200720, GF_BG_TYPE_TEXT);
    extern const BgTemplate ov15_0220073C;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &ov15_0220073C, GF_BG_TYPE_TEXT);
    extern const BgTemplate ov15_02200758;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &ov15_02200758, GF_BG_TYPE_TEXT);
    extern const BgTemplate ov15_02200774;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &ov15_02200774, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0x000, HEAP_ID_BAG);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_3, 0x20, 0x000, HEAP_ID_BAG);

    G2_SetBlendAlpha(GX_PLANEMASK_NONE, GX_PLANEMASK_BG3, 0, 0);
}

void ov15_021F9A8C(BgConfig *bgConfig) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_ALL, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_ALL & ~GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
    Heap_FreeExplicit(HEAP_ID_BAG, bgConfig);
}

void ov15_021F9AE4(BagAppData *appData) {
    appData->unk_244 = NARC_New(NARC_a_0_1_5, HEAP_ID_BAG);
    GfGfxLoader_LoadCharData(NARC_a_0_1_5, 7, appData->unk_000, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    GfGfxLoader_LoadScrnData(NARC_a_0_1_5, 54, appData->unk_000, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    if (appData->unk_615 == PLAYER_GENDER_MALE) {
        GfGfxLoader_LoadScrnData(NARC_a_0_1_5, 94, appData->unk_000, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_BAG);
    } else {
        GfGfxLoader_LoadScrnData(NARC_a_0_1_5, 93, appData->unk_000, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_BAG);
    }
    GfGfxLoader_GXLoadPal(NARC_a_0_1_5, 8, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_5, 17, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_13_OFFSET, 0x20, HEAP_ID_BAG);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_11_OFFSET, HEAP_ID_BAG);
    LoadUserFrameGfx1(appData->unk_000, GF_BG_LYR_MAIN_1, 0x3F7, 14, 0, HEAP_ID_BAG);
    LoadUserFrameGfx2(appData->unk_000, GF_BG_LYR_MAIN_1, 0x3D9, 12, Options_GetFrame(appData->unk_240), HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_5, 38, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_BAG);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_11_OFFSET, HEAP_ID_BAG);
    GfGfxLoader_LoadCharData(NARC_a_0_1_5, 46, appData->unk_000, GF_BG_LYR_SUB_2, 0, 0, FALSE, HEAP_ID_BAG);
    appData->unk_68C = GfGfxLoader_GetPlttData(NARC_a_0_1_5, 40, &appData->unk_694, HEAP_ID_BAG);
    appData->unk_690 = GfGfxLoader_GetPlttData(NARC_a_0_1_5, 41, &appData->unk_698, HEAP_ID_BAG);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_5, 8, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_8_OFFSET, 0x80, HEAP_ID_BAG);
    LoadUserFrameGfx2(appData->unk_000, GF_BG_LYR_SUB_0, 0x3E2, 12, Options_GetFrame(appData->unk_240), HEAP_ID_BAG);
}

void ov15_021F9C78(BagAppData *appData, BOOL a1) {
    if (a1 == TRUE) {
        GfGfxLoader_LoadScrnData(NARC_a_0_1_5, 54, appData->unk_000, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    } else {
        GfGfxLoader_LoadScrnData(NARC_a_0_1_5, 9, appData->unk_000, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_BAG);
    }
}

void ov15_021F9CBC(BagAppData *appData) {
    appData->unk_2F0 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0010_bin, HEAP_ID_BAG);
    appData->unk_2EC = MessagePrinter_New(1, 2, 0, HEAP_ID_BAG);
    appData->unk_2F4 = MessageFormat_New(HEAP_ID_BAG);
    appData->unk_2F8 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0222_bin, HEAP_ID_BAG);
    appData->unk_2FC = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0750_bin, HEAP_ID_BAG);
    appData->unk_5E4 = String_New(256, HEAP_ID_BAG);
}

void ov15_021F9D28(BagAppData *appData) {
    appData->unk_614 = 0;
    for (u8 i = 0; i < POCKETS_COUNT; ++i) {
        if (appData->unk_234->pockets[i].slots != NULL) {
            ++appData->unk_614;
        }
    }
}

u16 ov15_021F9D60(BagAppData *appData, int a1, BOOL a2) {
    BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];
    if (a2 == FALSE) {
        return pocket->slots[a1].id;
    } else {
        return pocket->slots[a1].quantity;
    }
}

void ov15_021F9D8C(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID) {
    ReadMsgDataIntoString(msgData, itemId, dest);
}

void ov15_021F9D9C(MsgData *msgData, String *dest, u16 itemId, enum HeapID heapID) {
    ReadMsgDataIntoString(msgData, TMHMGetMove(itemId), dest);
}

void ov15_021F9DB4(BagAppData *appData) {
    appData->unk_234->unk64 = 0;
    BagViewPocket *pockets = appData->unk_234->pockets;
    if (appData->unk_234->cursor == NULL) {
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                pockets[i].position = 0;
                pockets[i].scroll = 0;
            }
        }
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                appData->unk_234->unk64 = i;
                break;
            }
        }
    } else {
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                u8 position;
                u8 scroll;
                BagCursor_Field_PocketGetPosition(appData->unk_234->cursor, pockets[i].pocketId, &position, &scroll);
                pockets[i].position = position;
                pockets[i].scroll = scroll;
            }
        }
        u16 pocket = BagCursor_Field_GetPocket(appData->unk_234->cursor);
        if (pockets[pocket].slots == NULL) {
            for (u16 i = 0; i < POCKETS_COUNT; ++i) {
                if (pockets[i].slots != NULL) {
                    pocket = i;
                    break;
                }
            }
        }
        for (u16 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL && pocket == pockets[i].pocketId) {
                appData->unk_234->unk64 = i;
                break;
            }
        }
    }
}

void ov15_021F9EA8(BagAppData *appData) {
    if (appData->unk_234->cursor != NULL) {
        BagViewPocket *pockets = appData->unk_234->pockets;
        for (u32 i = 0; i < POCKETS_COUNT; ++i) {
            if (pockets[i].slots != NULL) {
                BagCursor_Field_PocketSetPosition(appData->unk_234->cursor, pockets[i].pocketId, pockets[i].position, pockets[i].scroll);
            }
        }
        BagCursor_Field_SetPocket(appData->unk_234->cursor, pockets[appData->unk_234->unk64].pocketId);
    }
}

void ov15_021F9F08(BagAppData *appData) {
    u32 i;
    BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];

    if (pocket->pocketId == POCKET_TMHMS) {
        for (i = 0; i < ov15_022008B0[pocket->pocketId]; ++i) {
            if (pocket->slots[i].id == ITEM_NONE || pocket->slots[i].quantity == 0) {
                break;
            }
            ov15_021F9D9C(appData->unk_2FC, appData->unk_350[i], pocket->slots[i].id, HEAP_ID_BAG);
            appData->unk_6A4[i] = pocket->slots[i].id;
        }
        pocket->unk_9 = i;
    } else {
        for (i = 0; i < ov15_022008B0[pocket->pocketId]; ++i) {
            if (pocket->slots[i].id == ITEM_NONE || pocket->slots[i].quantity == 0) {
                break;
            }
            ov15_021F9D8C(appData->unk_2F8, appData->unk_350[i], pocket->slots[i].id, HEAP_ID_BAG);
            appData->unk_6A4[i] = pocket->slots[i].id;
        }
        pocket->unk_9 = i;
    }
    int r1;
    if (pocket->unk_9 == 0) {
        r1 = 0;
    } else {
        r1 = ((pocket->unk_9 - 1) / 6) * 6;
    }
    if (pocket->scroll > r1) {
        pocket->scroll = r1;
    }
}

void ov15_021FA008(BagAppData *appData) {
    for (u32 i = 0; i < 165; ++i) {
        appData->unk_350[i] = String_New(18, HEAP_ID_BAG);
    }
}

void ov15_021FA028(BagAppData *appData) {
    for (u32 i = 0; i < 165; ++i) {
        String_Delete(appData->unk_350[i]);
    }
}

void ov15_021FA044(s16 *a0, u16 *a1, u8 a2) {
    if (*a0 + *a1 > a2) {
        *a0 = ((a2 - 1) / 6) * 6;
    }
    if (*a0 < 0) {
        *a0 = 0;
    }
}

void ov15_021FA070(s16 *a0, u16 *a1, u8 a2, int a3) {
}

int ov15_021FA074(BagAppData *appData) {
    int ret = appData->unk_234->pockets[appData->unk_234->unk64].unk_9 - appData->unk_234->pockets[appData->unk_234->unk64].scroll;
    if (ret > 6) {
        ret = 6;
    }
    return ret;
}

int ov15_021FA098(BagAppData *appData) {
    int r3 = appData->unk_234->pockets[appData->unk_234->unk64].scroll;
    int r4 = appData->unk_672;
    if ((r4 / 6) * 6 == r3) {
        return r4 % 6;
    } else {
        return -1;
    }
}

void ov15_021FA0D8(BagAppData *appData) {
    appData->unk_348 = 0;
}

void ov15_021FA0E4(BagAppData *appData, int a1) {
    if (a1 >= 8 && a1 < 14) {
        appData->unk_234->pockets[appData->unk_234->unk64].position = a1 - 8;
    }
}

BOOL ov15_021FA104(BagAppData *appData, int a1) {
    if (a1 == 14 || a1 == 15) {
        return FALSE;
    }
    if (a1 <= 7 && appData->unk_644 >= 8 && appData->unk_644 <= 13) {
        return FALSE;
    }
    return TRUE;
}

u16 ov15_021FA12C(BagAppData *appData) {
    BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];
    u32 r3 = pocket->scroll + appData->unk_644 - 8;
    if (ov15_022008B0[appData->unk_234->unk64] <= r3) {
        return ITEM_NONE;
    }
    return pocket->slots[r3].id;
}

void ov15_021FA170(BagAppData *appData) {
    if (appData->unk_644 >= 8 && appData->unk_644 <= 13) {
        u16 itemId = ov15_021FA12C(appData);
        if (itemId != ITEM_NONE) {
            ov15_021FECA0(appData, &appData->unk_004[0], itemId);
        } else {
            ov15_021FECC4(appData, &appData->unk_004[0]);
        }
    } else if (appData->unk_644 >= 0 && appData->unk_644 <= 7) {
        ov15_021FECD8(appData, &appData->unk_004[0], appData->unk_644);
    } else {
        ov15_021FECC4(appData, &appData->unk_004[0]);
    }
}

extern const u8 ov15_02200640[][4];

BagAppState ov15_021FA1BC(BagAppData *appData) {
    BOOL moved = FALSE;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        ++moved;
        appData->unk_644 = ov15_02200640[appData->unk_644][0];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        ++moved;
        appData->unk_644 = ov15_02200640[appData->unk_644][1];
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        int movement = ov15_02200640[appData->unk_644][2];
        if (movement == 14) {
            u8 spC;
            return ov15_021FA73C(appData, 14, &spC, 1, 2, 0);
        } else if (appData->unk_644 == 16) {
        } else if (appData->unk_644 >= 0 && appData->unk_644 < 8) {
            int new_dest = ov15_021FA6C0(appData, appData->unk_644, -1);
            if (appData->unk_644 != new_dest) {
                appData->unk_644 = new_dest;
                ++moved;
            }
        } else {
            appData->unk_644 = movement;
            ++moved;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        int movement = ov15_02200640[appData->unk_644][3];
        if (movement == 15) {
            u8 spB;
            return ov15_021FA73C(appData, 15, &spB, 1, 2, 0);
        } else if (appData->unk_644 == 16) {
        } else if (appData->unk_644 >= 0 && appData->unk_644 < 8) {
            int new_dest = ov15_021FA6C0(appData, appData->unk_644, 1);
            if (appData->unk_644 != new_dest) {
                appData->unk_644 = new_dest;
                ++moved;
            }
        } else {
            appData->unk_644 = movement;
            ++moved;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_L) {
        u8 spA;
        if (appData->unk_644 >= 0 && appData->unk_644 < 8) {
            appData->unk_644 = ov15_021FA6C0(appData, appData->unk_234->unk64, -1);
            ov15_021FFECC(appData, appData->unk_644);
            return ov15_021FA73C(appData, appData->unk_644, &spA, 1, 2, 0);
        } else {
            return ov15_021FA73C(appData, ov15_021FA6C0(appData, appData->unk_234->unk64, -1), &spA, 1, 2, 0);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_R) {
        u8 sp9;
        if (appData->unk_644 >= 0 && appData->unk_644 < 8) {
            appData->unk_644 = ov15_021FA6C0(appData, appData->unk_234->unk64, 1);
            ov15_021FFECC(appData, appData->unk_644);
            return ov15_021FA73C(appData, appData->unk_644, &sp9, 1, 2, 0);
        } else {
            return ov15_021FA73C(appData, ov15_021FA6C0(appData, appData->unk_234->unk64, 1), &sp9, 1, 2, 0);
        }
    }

    if (appData->unk_644 == 17) {
        appData->unk_644 = appData->unk_234->unk64;
    }

    if (moved) {
        PlaySE(SEQ_SE_DP_SELECT);
        ov15_021FFECC(appData, appData->unk_644);
        ov15_021FA0E4(appData, appData->unk_644);
        ov15_021FA170(appData);
    }

    u8 sp8 = 0;
    u32 r4 = ov15_021FAC2C(appData, 0);
    if (r4 != TOUCH_MENU_NO_INPUT) {
        if (ov15_021FA104(appData, r4)) {
            if (r4 < 8) {
                if (ov15_021FA68C(appData, r4) != -1) {
                    appData->unk_644 = r4;
                    ov15_021FFECC(appData, appData->unk_644);
                }
            } else {
                appData->unk_644 = r4;
                ov15_021FFECC(appData, appData->unk_644);
                if (appData->unk_644 >= 8 && appData->unk_644 <= 13) {
                    ov15_021FA0E4(appData, appData->unk_644);
                }
            }
        }
        BagAppState r0 = ov15_021FA73C(appData, r4, &sp8, 1, 2, 1);
        if (r0 != BAG_APP_STATE_1) {
            return r0;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        BagAppState r4 = ov15_021FA73C(appData, appData->unk_644, &sp8, 1, 2, 0);
        if (appData->unk_644 >= 8 && appData->unk_644 <= 13) {
            ov15_021FA0E4(appData, appData->unk_644);
        }
        if (r4 != BAG_APP_STATE_1) {
            return r4;
        }
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        BagAppState r4 = ov15_021FA73C(appData, 16, &sp8, 1, 2, 0);
        ov15_021FD774(appData, 0);
        if (appData->unk_644 >= 8 && appData->unk_644 <= 13) {
            ov15_021FA0E4(appData, appData->unk_644);
        }
        if (r4 != BAG_APP_STATE_1) {
            return r4;
        }
    }

    if (sp8 == 1) {
        return ov15_021FD810(appData, 20, 41, 27);
    }

    return BAG_APP_STATE_1;
}

BagAppState ov15_021FA4F8(BagAppData *appData) {
    BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];

    ov15_021FD574(appData, 2, 0, 0);
    ov15_021FF4EC(appData, pocket->scroll, appData->unk_644 - 8);
    ov15_022002B4(appData, appData->unk_644 - 8);
    ov15_021FB14C(appData);
    appData->unk_234->itemId = pocket->slots[pocket->scroll + appData->unk_644 - 8].id;
    appData->unk_682 = pocket->slots[pocket->scroll + appData->unk_644 - 8].quantity;
    return BAG_APP_STATE_4;
}

BagAppState ov15_021FA578(BagAppData *appData, int a1) {
    BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];

    if (a1 > 0) {
        if (pocket->scroll + 6 < pocket->unk_9) {
            pocket->scroll += 6;
        } else {
            pocket->scroll = 0;
        }
    } else {
        if (pocket->scroll - 6 >= 0) {
            pocket->scroll -= 6;
        } else {
            pocket->scroll = ((pocket->unk_9 - 1) / 6) * 6;
        }
    }

    if (appData->unk_671 == 1) {
        ov15_021FAD80(appData, pocket);
        ov15_021FFF34(appData, appData->unk_66C);
        return BAG_APP_STATE_3;
    }

    ov15_021FA6F4(appData, pocket);
    ov15_021FA170(appData);
    switch (appData->unk_234->unk65) {
    case 2:
        return BAG_APP_STATE_16;
    case 1:
        return BAG_APP_STATE_14;
    case 3:
        return BAG_APP_STATE_26;
    default:
        return BAG_APP_STATE_1;
    }
}

void ov15_021FA620(BagAppData *appData) {
    appData->unk_617 = (90 - (appData->unk_614 * 10)) / (appData->unk_614 + 1) + 6;
    appData->unk_618 = appData->unk_617 + 4;
}

BOOL ov15_021FA650(BagAppData *appData) {
    static int ov15_02201480 = 0;
    static int ov15_02201300 = 1;

    if (gSystem.newKeys & PAD_BUTTON_DEBUG) {
        ++ov15_02201480;
        if (ov15_02201480 >= ov15_02201300) {
            ov15_02201480 = 0;
        }
        ov15_021FD574(appData, 1, ov15_02201300, ov15_02201480);
    }
    return FALSE;
}

int ov15_021FA68C(BagAppData *appData, u32 a1) {
    for (int i = 0; i < 8; ++i) {
        if (appData->unk_234->pockets[i].pocketId == a1 && appData->unk_234->pockets[i].slots != NULL) {
            return i;
        }
    }

    return -1;
}

int ov15_021FA6C0(BagAppData *appData, int a1, int a2) {
    for (int i = 0; i < 8; ++i) {
        a1 += a2;
        if (a1 < 0) {
            a1 = 7;
        } else if (a1 == 8) {
            a1 = 0;
        }
        if (ov15_021FA68C(appData, a1) != -1) {
            break;
        }
    }

    return a1;
}

void ov15_021FA6F4(BagAppData *appData, BagViewPocket *pocket) {
    ov15_021FD574(appData, 0, ov15_021FA074(appData), 0);
    ov15_021FF364(appData, pocket->scroll, -1, 0);
    ov15_021FF6BC(appData, pocket->unk_9, pocket->scroll, 0);
    ov15_02200140(appData, pocket, ov15_021FA074(appData), 1);
}

BagAppState ov15_021FA73C(BagAppData *appData, int a1, u8 *a2, int a3, int a4, int a5) {
    BagAppState r6 = BAG_APP_STATE_1;
    switch (a1) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7: {
        int r0 = ov15_021FA68C(appData, a1);
        if (r0 == -1) {
            return BAG_APP_STATE_1;
        }
        if (r0 == appData->unk_234->unk64 && a5 == 0) {
            return BAG_APP_STATE_1;
        }
        appData->unk_234->unk64 = r0;
        ov15_021F9F08(appData);
        BagViewPocket *r5 = &appData->unk_234->pockets[appData->unk_234->unk64];
        ov15_021FD574(appData, 0, ov15_021FA074(appData), 0);
        ov15_021FF364(appData, r5->scroll, -1, 0);
        ov15_02200030(appData, appData->unk_234->unk64);
        ov15_021FF6BC(appData, r5->unk_9, r5->scroll, 0);
        ov15_02200140(appData, r5, ov15_021FA074(appData), 1);
        ov15_021FD404(appData, 1, appData->unk_234->unk64);
        PlaySE(SEQ_SE_DP_SELECT);
        ov15_021FA170(appData);
        if (appData->unk_644 >= 8) {
            ov15_021FA0E4(appData, appData->unk_644);
        }
        ov15_021FDF88(appData);
        ov15_021FDAF4(&appData->unk_808, appData->unk_234->unk64 + 1, 7);
        break;
    }

    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13: {
        int slot = a1 - 8;
        BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];
        int r0 = pocket->scroll + slot;
        if (r0 < pocket->unk_9) {
            appData->unk_234->itemId = pocket->slots[r0].id;
            *a2 = 1;
            PlaySE(SEQ_SE_DP_SELECT);
        }
        ov15_021FA170(appData);
        break;
    }

    case 15:
        if (appData->unk_234->pockets[appData->unk_234->unk64].unk_9 > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            r6 = ov15_021FD7D0(appData, 18, 9, 8, 30);
        }
        break;
    case 14:
        if (appData->unk_234->pockets[appData->unk_234->unk64].unk_9 > 6) {
            PlaySE(SEQ_SE_DP_SELECT);
            r6 = ov15_021FD7D0(appData, 17, 9, 8, 31);
        }
        break;
    case 16:
        appData->unk_234->itemId = ITEM_NONE;
        appData->unk_234->unk68 = 5;
        ov15_021FD774(appData, a5);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        r6 = ov15_021FD7D0(appData, 19, 9, 8, 36);
        break;
    }

    return r6;
}

BOOL ov15_021FA93C(BagAppData *appData) {
    BagAppData_Sub619 *r4 = &appData->unk_619;

    if (!System_GetTouchHeld()) {
        r4->unk_7_4 = 1;
    }
    // this function always returns -1
    int negative_one = ov15_021FAC40(appData);
    if (negative_one == -1 || negative_one != r4->unk_0) {
        r4->unk_7_0 = 1;
    }
    if (!ov15_021FAA18(appData) && r4->unk_7_4 == 1 && negative_one != -1) {
        appData->unk_234->unk64 = r4->unk_0;
        if (r4->unk_0 > (u8)negative_one) {
            r4->unk_1 = 0;
            r4->unk_2 = 0;
        } else if (r4->unk_0 < (u8)negative_one) {
            r4->unk_1 = 1;
            r4->unk_2 = 0;
        } else {
            r4->unk_1 = 2;
        }
        r4->unk_0 = (u8)negative_one;
        r4->unk_7_0 = 0;
        r4->unk_7_4 = 0;
        r4->unk_4 = 0;
        appData->unk_670 = negative_one;
        ov15_021FF950(appData);
        ov15_021FDAF4(&appData->unk_808, appData->unk_670 + 1, 7);
    }
    ov15_021FAB34(appData);
    ov15_021FF964(appData);
    return FALSE;
}

BOOL ov15_021FAA18(BagAppData *appData) {
    BagAppData_Sub619 *r4 = &appData->unk_619;

    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (appData->unk_614 == 1) {
            return TRUE;
        }
        PlaySE(SEQ_SE_DP_SELECT);
        appData->unk_234->unk64 = r4->unk_0;
        if (r4->unk_0 != 0) {
            --r4->unk_0;
            --appData->unk_670;
        } else {
            r4->unk_0 = appData->unk_614 - 1;
            appData->unk_670 = appData->unk_614 - 1;
        }
        r4->unk_2 = 0;
        r4->unk_1 = 0;
        r4->unk_7_4 = 1;
        r4->unk_7_0 = 1;
        r4->unk_7_7 = 0;
        if (r4->unk_4 != 3) {
            r4->unk_4 = 4;
        }
        ov15_021FF950(appData);
        return TRUE;
    }

    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (appData->unk_614 == 1) {
            return TRUE;
        }
        PlaySE(SEQ_SE_DP_SELECT);
        appData->unk_234->unk64 = r4->unk_0;
        if (r4->unk_0 + 1 < appData->unk_614) {
            ++r4->unk_0;
            ++appData->unk_670;
        } else {
            r4->unk_0 = 0;
            appData->unk_670 = 0;
        }
        r4->unk_2 = 0;
        r4->unk_1 = 1;
        r4->unk_7_4 = 1;
        r4->unk_7_0 = 1;
        r4->unk_7_7 = 0;
        if (r4->unk_4 != 3) {
            r4->unk_4 = 4;
        }
        ov15_021FF950(appData);
        return TRUE;
    }

    return FALSE;
}

BOOL ov15_021FAB34(BagAppData *appData) {
    BagAppData_Sub619 *r4 = &appData->unk_619;

    switch (r4->unk_2) {
    case 0:
        r4->unk_3 = 0;
        ++r4->unk_2;
        break;
    case 1:
        if (r4->unk_3 < 8) {
            ++r4->unk_3;
        } else {
            appData->unk_234->unk64 = r4->unk_0;
            ov15_021F9F08(appData);
            ov15_021FF364(appData, appData->unk_234->pockets[appData->unk_234->unk64].scroll, -1, 0);
            ov15_021FD574(appData, 0, ov15_021FA074(appData), 0);
            ov15_02200030(appData, appData->unk_234->unk64);
            ov15_021FD404(appData, 1, appData->unk_234->unk64);
            ov15_021FA044(&appData->unk_234->pockets[appData->unk_234->unk64].scroll, &appData->unk_234->pockets[appData->unk_234->unk64].position, appData->unk_234->pockets[appData->unk_234->unk64].unk_9);
            ov15_021FA070(&appData->unk_234->pockets[appData->unk_234->unk64].scroll, &appData->unk_234->pockets[appData->unk_234->unk64].position, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, 6);
            ++r4->unk_2;
            return TRUE;
        }
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

u32 ov15_021FAC2C(BagAppData *appData, int a1) {
    extern const TouchscreenHitbox *ov15_02201314[];

    return TouchscreenHitbox_FindRectAtTouchNew(ov15_02201314[a1]);
}

int ov15_021FAC40(BagAppData *appData) {
    // This might have been a debug function
    return -1;
}

void ov15_021FAC48(BagAppData *appData) {
    {
        BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];
        appData->unk_671 = 1;
        appData->unk_672 = pocket->scroll + appData->unk_644 - 8;
    }
    ov15_021FED60(appData);
    ov15_021FB114(appData);
    ov15_02200294(appData);
    ov15_021FF560(appData);
    ov15_021FF7AC(&appData->unk_004[24]);
    ov15_021FED58(appData);

    {
        BagViewPocket *pocket = &appData->unk_234->pockets[appData->unk_234->unk64];
        ov15_021FD574(appData, 1, ov15_021FA074(appData), appData->unk_644 - 8);
        ov15_021FF364(appData, pocket->scroll, appData->unk_644 - 8, 1);
        ov15_021FF6BC(appData, pocket->unk_9, pocket->scroll, 0);
        ov15_02200140(appData, pocket, ov15_021FA074(appData), 0);
        ov15_022001C4(appData, pocket, pocket->scroll + appData->unk_644 - 8);
        ov15_021FFECC(appData, appData->unk_644);
        appData->unk_66C = appData->unk_644 - 8;
    }
}

extern const u8 ov15_02200584[][4];

int ov15_021FAD28(int a0) {
    if (gSystem.newKeys & PAD_KEY_UP) {
        return ov15_02200584[a0][0] - 8;
    }
    if (gSystem.newKeys & PAD_KEY_DOWN) {
        return ov15_02200584[a0][1] - 8;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        return ov15_02200584[a0][2] - 8;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return ov15_02200584[a0][3] - 8;
    }

    return a0;
}

void ov15_021FAD80(BagAppData *appData, BagViewPocket *pocket) {
    ov15_021FD574(appData, 1, ov15_021FA074(appData), ov15_021FA098(appData));
    ov15_021FF364(appData, pocket->scroll, ov15_021FA098(appData), 1);
    ov15_022001C4(appData, pocket, appData->unk_672);
    ov15_021FF6BC(appData, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, appData->unk_234->pockets[appData->unk_234->unk64].scroll, 0);
}

int ov15_021FADE8(BagAppData *appData, int a1) {
    int ret = LIST_NOTHING_CHOSEN;

    switch (a1) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        if (ov15_021FA074(appData) > a1) {
            ret = appData->unk_66C;
            PlaySE(SEQ_SE_DP_SELECT);
        } else {
            PlaySE(SEQ_SE_DP_BOX03);
        }
        break;
    case 6:
        ret = 14;
        break;
    case 7:
        ret = 15;
        break;
    case 8:
        ret = LIST_CANCEL;
        break;
    }

    return ret;
}
