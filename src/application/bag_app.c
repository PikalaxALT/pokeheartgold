#include "global.h"

#include "bag_types_def.h"
#include "bg_window.h"
#include "gf_gfx_planes.h"
#include "overlay_15.h"
#include "player_data.h"
#include "render_text.h"
#include "screen_fade.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "sprite_system.h"
#include "system.h"
#include "unk_020210A0.h"
#include "unk_0203A3B0.h"
#include "unk_0208805C.h"

typedef struct BagAppData {
    BgConfig *unk_000;
    u8 filler_004[0x230];
    BagView *unk_234;
    u8 filler_238[4];
    PlayerProfile *unk_23C;
    u8 filler_240[0xC];
    SpriteManager *unk_24C;
    u8 filler_250[0x3C5];
    u8 unk_615;
    u8 filler_616[0x2E];
    int unk_644;
    u8 filler_648[0x304];
} BagAppData; // size: 0x94C

void BagApp_GetSaveStructPtrs(BagAppData *appData);
void ov15_021F9DB4(BagAppData *appData);
void ov15_021F9CBC(BagAppData *appData);
void ov15_021FA008(BagAppData *appData);
void ov15_021F9D28(BagAppData *appData);
void ov15_021FA620(BagAppData *appData);
void ov15_021F9984();
void ov15_021F99A4(BgConfig *bgConfig);
void ov15_021F9AE4(BagAppData *appData);
void ov15_021FE020(BagAppData *appData);
void ov15_021FE4C8(BagAppData *appData);
void ov15_021FE528(BagAppData *appData);
void ov15_021FEA5C(BagAppData *appData);
void ov15_021FE874(BagAppData *appData);
void ov15_021F9F08(BagAppData *appData);
void ov15_021FF29C(BagAppData *appData, int a1);
void ov15_021FA044(s16 *a0, u16 *a1, u8 a2);
void ov15_021FA070(s16 *a0, u16 *a1, u8 a2, int a3);
void ov15_021FF850(BagAppData *appData);
int ov15_021FA074(BagAppData *appData);
void ov15_021FD574(BagAppData *appData, int a1, int a2, int a3);
void ov15_021FF364(BagAppData *appData, s16 a1, int a2, int a3);
void ov15_02200030(BagAppData *appData, u8 pocket);
void ov15_021FD404(BagAppData *appData, int a1, u8 pocket);
void ov15_021FF6BC(BagAppData *appData, u8 a1, s16 a2, int a3);
void ov15_02200140(BagAppData *appData, BagViewPocket *pocket, int a2, int a3);
void ov15_021FFECC(BagAppData *appData, int a1);
void ov15_021FA170(BagAppData *appData);
void ov15_021FF1E0(BagAppData *appData);
void ov15_021FD93C(BagAppData *appData);
void ov15_021F995C(void *cbArg);
int ov15_021FA1BC(BagAppData *appData);
BOOL ov15_021FA93C(BagAppData *appData);
int ov15_021FAE48(BagAppData *appData);
int ov15_021FB5AC(BagAppData *appData);
int ov15_021FBD50(BagAppData *appData);
int ov15_021FBF98(BagAppData *appData);
int ov15_021FBFC0(BagAppData *appData);
int ov15_021FBFF8(BagAppData *appData);
int ov15_021FC01C(BagAppData *appData);
int ov15_021FC140(BagAppData *appData);
int ov15_021FC164(BagAppData *appData);
int ov15_021FB700(BagAppData *appData);
int ov15_021FB820(BagAppData *appData);
int ov15_021FC41C(BagAppData *appData);
int ov15_021FC784(BagAppData *appData);
int ov15_021FC7EC(BagAppData *appData);
int ov15_021FCD80(BagAppData *appData);
int ov15_021FCDE4(BagAppData *appData);
int ov15_021FCFC8(BagAppData *appData);
int ov15_021FD058(BagAppData *appData);
int ov15_021FD0E8(BagAppData *appData);
int ov15_021FD10C(BagAppData *appData);
int ov15_021FD24C(BagAppData *appData);
int ov15_021FD2FC(BagAppData *appData);
int ov15_021FD3AC(BagAppData *appData);
int ov15_021FC2E0(BagAppData *appData);
int ov15_021FA4F8(BagAppData *appData);
int ov15_021FB604(BagAppData *appData);
int ov15_021FB654(BagAppData *appData);
int ov15_021FA578(BagAppData *appData, int a1);
int ov15_021FB060(BagAppData *appData);
int ov15_021FAFFC(BagAppData *appData);
int ov15_021FCB64(BagAppData *appData);
int ov15_021FD850(BagAppData *appData);
int ov15_021FF8D4(BagAppData *appData);
int ov15_021FDC88(BagAppData *appData);

BOOL Bag_Init(OverlayManager *man, int *state) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    G2_BlendNone();
    G2S_BlendNone();

    Heap_Create(HEAP_ID_3, HEAP_ID_6, 0x42000);
    BagAppData *appData = OverlayManager_CreateAndGetData(man, 0x94C, HEAP_ID_6);
    memset(appData, 0, sizeof(BagAppData));
    appData->unk_234 = OverlayManager_GetArgs(man);
    BagApp_GetSaveStructPtrs(appData);
    appData->unk_000 = BgConfig_Alloc(HEAP_ID_6);
    appData->unk_615 = PlayerProfile_GetTrainerGender(appData->unk_23C);

    BeginNormalPaletteFade(FADE_SUB_THEN_MAIN, FADE_TYPE_DOWNWARD_IN, FADE_TYPE_DOWNWARD_IN, RGB_BLACK, 6, 1, HEAP_ID_6);
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

    ov15_021FA044(&appData->unk_234->pockets[appData->unk_234->unk64].unk_6, &appData->unk_234->pockets[appData->unk_234->unk64].unk_4, appData->unk_234->pockets[appData->unk_234->unk64].unk_9);
    ov15_021FA070(&appData->unk_234->pockets[appData->unk_234->unk64].unk_6, &appData->unk_234->pockets[appData->unk_234->unk64].unk_4, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, 6);
    ov15_021FF850(appData);
    ov15_021FD574(appData, 0, ov15_021FA074(appData), 0);
    ov15_021FF364(appData, appData->unk_234->pockets[appData->unk_234->unk64].unk_6, -1, 0);
    ov15_02200030(appData, appData->unk_234->unk64);
    ov15_021FD404(appData, 1, appData->unk_234->unk64);
    ov15_021FF6BC(appData, appData->unk_234->pockets[appData->unk_234->unk64].unk_9, appData->unk_234->pockets[appData->unk_234->unk64].unk_6, 0);
    ov15_02200140(appData, &appData->unk_234->pockets[appData->unk_234->unk64], ov15_021FA074(appData), 1);
    appData->unk_644 = appData->unk_234->pockets[appData->unk_234->unk64].unk_4 + 8;
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
    case 0:
        if (IsPaletteFadeFinished() == TRUE) {
            switch (appData->unk_234->unk65) {
            case 2:
                *state = 16;
                break;
            case 1:
                *state = 14;
                break;
            case 3:
                *state = 26;
                break;
            default:
                *state = 1;
                break;
            }
        }
        break;
    case 1:
        *state = ov15_021FA1BC(appData);
        break;
    case 2:
        if (ov15_021FA93C(appData) == TRUE) {
            if (appData->unk_234->unk65 == 2) {
                *state = 16;
            } else if (appData->unk_234->unk65 == 1) {
                *state = 14;
            } else if (appData->unk_234->unk65 == 3) {
                *state = 26;
            } else {
                *state = 1;
            }
        }
        break;
    case 3:
        *state = ov15_021FAE48(appData);
        break;
    case 4:
        *state = ov15_021FB5AC(appData);
        break;
    case 5:
        *state = ov15_021FBD50(appData);
        break;
    case 6:
        *state = ov15_021FBF98(appData);
        break;
    case 7:
        *state = ov15_021FBFC0(appData);
        break;
    case 8:
        *state = ov15_021FBFF8(appData);
        break;
    case 9:
        *state = ov15_021FC01C(appData);
        break;
    case 10:
        *state = ov15_021FC140(appData);
        break;
    case 11:
        *state = ov15_021FC164(appData);
        break;
    case 12:
        *state = ov15_021FB700(appData);
        break;
    case 13:
        *state = ov15_021FB820(appData);
        break;
    case 14:
        *state = ov15_021FC41C(appData);
        break;
    case 15:
        *state = ov15_021FC784(appData);
        break;
    case 16:
        *state = ov15_021FC7EC(appData);
        break;
    case 17:
        *state = ov15_021FCD80(appData);
        break;
    case 18:
        *state = ov15_021FCDE4(appData);
        break;
    case 19:
        *state = ov15_021FCFC8(appData);
        break;
    case 20:
        *state = ov15_021FD058(appData);
        break;
    case 21:
        *state = ov15_021FD0E8(appData);
        break;
    case 22:
        *state = ov15_021FD10C(appData);
        break;
    case 23:
        *state = ov15_021FD24C(appData);
        break;
    case 24:
        *state = ov15_021FD2FC(appData);
        break;
    case 26:
        *state = ov15_021FD3AC(appData);
        break;
    case 25:
        *state = ov15_021FC2E0(appData);
        break;
    case 27:
        *state = ov15_021FA4F8(appData);
        break;
    case 28:
        *state = ov15_021FB604(appData);
        break;
    case 29:
        *state = ov15_021FB654(appData);
        break;
    case 30:
        *state = ov15_021FA578(appData, 1);
        break;
    case 31:
        *state = ov15_021FA578(appData, -1);
        break;
    case 32:
        *state = ov15_021FB060(appData);
        break;
    case 33:
        *state = ov15_021FAFFC(appData);
        break;
    case 34:
        *state = ov15_021FCB64(appData);
        break;
    case 35:
        *state = ov15_021FD850(appData);
        break;
    case 36:
        sub_020880CC(1, HEAP_ID_6);
        *state = 37;
        break;
    case 37:
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

BOOL Bag_Exit(OverlayManager *man, int *state);
