#ifndef GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H

#include "application/bag_app.h"

#include "bag_types_def.h"
#include "bg_window.h"
#include "message_format.h"
#include "message_printer.h"
#include "msgdata.h"
#include "player_data.h"
#include "sprite_system.h"

typedef enum BagAppState {
    BAG_APP_STATE_0,
    BAG_APP_STATE_1,
    BAG_APP_STATE_2,
    BAG_APP_STATE_3,
    BAG_APP_STATE_4,
    BAG_APP_STATE_5,
    BAG_APP_STATE_6,
    BAG_APP_STATE_7,
    BAG_APP_STATE_8,
    BAG_APP_STATE_9,
    BAG_APP_STATE_10,
    BAG_APP_STATE_11,
    BAG_APP_STATE_12,
    BAG_APP_STATE_13,
    BAG_APP_STATE_14,
    BAG_APP_STATE_15,
    BAG_APP_STATE_16,
    BAG_APP_STATE_17,
    BAG_APP_STATE_18,
    BAG_APP_STATE_19,
    BAG_APP_STATE_20,
    BAG_APP_STATE_21,
    BAG_APP_STATE_22,
    BAG_APP_STATE_23,
    BAG_APP_STATE_24,
    BAG_APP_STATE_25,
    BAG_APP_STATE_26,
    BAG_APP_STATE_27,
    BAG_APP_STATE_28,
    BAG_APP_STATE_29,
    BAG_APP_STATE_30,
    BAG_APP_STATE_31,
    BAG_APP_STATE_32,
    BAG_APP_STATE_33,
    BAG_APP_STATE_34,
    BAG_APP_STATE_35,
    BAG_APP_STATE_36,
    BAG_APP_STATE_37,
} BagAppState;

typedef struct BagAppData_Sub619 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
    u8 unk_4;
    u8 unk_5;
    u8 unk_6;
    u8 unk_7_0 : 4;
    u8 unk_7_4 : 3;
    u8 unk_7_7 : 1;
} BagAppData_Sub619;

typedef struct BagAppData BagAppData;

typedef BagAppState (*BagAppDataUnkFunc7F0)(BagAppData *);

struct BagAppData {
    BgConfig *unk_000;
    Window unk_004[35];
    BagView *unk_234;
    Bag *unk_238;
    PlayerProfile *unk_23C;
    Options *unk_240;
    NARC *unk_244;
    u8 filler_248[4];
    SpriteManager *unk_24C;
    ManagedSprite *unk_250;
    u8 filler_254[0x98];
    MessagePrinter *unk_2EC;
    MsgData *unk_2F0;
    MessageFormat *unk_2F4;
    MsgData *unk_2F8;
    MsgData *unk_2FC;
    u8 unk_300[0x48];
    int unk_348;
    u8 filler_34C[4];
    String *unk_350[165];
    String *unk_5E4;
    u8 filler_5E8[0x2C];
    u8 unk_614;
    u8 unk_615;
    u8 unk_616;
    u8 unk_617;
    u8 unk_618;
    BagAppData_Sub619 unk_619;
    u8 filler_624[0x20];
    int unk_644;
    u8 filler_648[0x24];
    int unk_66C;
    u8 unk_670;
    u8 unk_671;
    u8 unk_672;
    int unk_674;
    u8 filler_678[10];
    u16 unk_682;
    u8 filler_684[8];
    void *unk_68C;
    void *unk_690;
    NNSG2dPaletteData *unk_694;
    NNSG2dPaletteData *unk_698;
    u8 filler_69C[8];
    u16 unk_6A4[165];
    BagAppDataUnkFunc7F0 unk_7F0[5];
    u8 filler_804[4];
    u8 unk_808[0x140];
    int unk_948;
}; // size: 0x94C

void ov15_021FE020(BagAppData *appData);
void ov15_021FE154(BagAppData *appData);
void ov15_021FE4C8(BagAppData *appData);
void ov15_021FE504(BagAppData *appData);
void ov15_021FE528(BagAppData *appData);
void ov15_021FE868(BagAppData *appData);
void ov15_021FE874(BagAppData *appData);
void ov15_021FE8A4(BagAppData *appData);
void ov15_021FEA5C(BagAppData *appData);
void ov15_021FEB64(BagAppData *appData);
void ov15_021FEB84(BagAppData *appData, u8 *a1, int a2);
void ov15_021FECA0(BagAppData *appData, Window *window, u16 itemId);
void ov15_021FECC4(BagAppData *appData, Window *window);
void ov15_021FECD8(BagAppData *appData, Window *window, int a2);
void ov15_021FED24(BagAppData *appData);
void ov15_021FED3C(BagAppData *appData);
void ov15_021FED58(BagAppData *appData);
void ov15_021FED60(BagAppData *appData);
void ov15_021FF1E0(BagAppData *appData);
void ov15_021FF29C(BagAppData *appData, int a1);
void ov15_021FF364(BagAppData *appData, s16 a1, int a2, int a3);
void ov15_021FF4EC(BagAppData *appData, int a1, int a2);
void ov15_021FF560(BagAppData *appData);
void ov15_021FF6BC(BagAppData *appData, u8 a1, s16 a2, int a3);
void ov15_021FF758(Window *window, void *a2, u8 a3);
void ov15_021FF7AC(Window *window);
void ov15_021FF850(BagAppData *appData);
void ov15_021FF894(BagAppData *appData);
int ov15_021FF8D4(BagAppData *appData);
void ov15_021FF950(BagAppData *appData);
void ov15_021FF964(BagAppData *appData);
void ov15_021FFECC(BagAppData *appData, int a1);
void ov15_021FFF34(BagAppData *appData, int a1);
void ov15_02200030(BagAppData *appData, u8 pocket);
void ov15_0220023C(BagAppData *appdata, u8 *a1);
void ov15_02200140(BagAppData *appData, BagViewPocket *pocket, int a2, int a3);
void ov15_022001C4(BagAppData *appData, BagViewPocket *pocket, int a2);
void ov15_02200294(BagAppData *appData);
void ov15_022002B4(BagAppData *appData, int a1);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
