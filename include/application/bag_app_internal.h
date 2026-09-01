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

typedef struct BagAppData {
    BgConfig *unk_000;
    Window unk_004[35];
    BagView *unk_234;
    Bag *unk_238;
    PlayerProfile *unk_23C;
    Options *unk_240;
    NARC *unk_244;
    u8 filler_248[4];
    SpriteManager *unk_24C;
    u8 filler_250[0x9C];
    MessagePrinter *unk_2EC;
    MsgData *unk_2F0;
    MessageFormat *unk_2F4;
    MsgData *unk_2F8;
    MsgData *unk_2FC;
    u8 filler_300[0x48];
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
    u8 unk_619;
    u8 unk_61A;
    u8 unk_61B;
    u8 filler_61C[0x28];
    int unk_644;
    u8 filler_648[0x24];
    int unk_66C;
    u8 unk_670;
    u8 unk_671;
    u8 unk_672;
    u8 filler_673[0xF];
    u16 unk_682;
    u8 filler_684[8];
    void *unk_68C;
    void *unk_690;
    NNSG2dPaletteData *unk_694;
    NNSG2dPaletteData *unk_698;
    u8 filler_69C[8];
    u16 unk_6A4[165];
    u8 filler_7EE[0x1A];
    u8 unk_808[0x144];
} BagAppData; // size: 0x94C

void ov15_021FE020(BagAppData *appData);
void ov15_021FE154(BagAppData *appData);
void ov15_021FE4C8(BagAppData *appData);
void ov15_021FE504(BagAppData *appData);
void ov15_021FE528(BagAppData *appData);
void ov15_021FE874(BagAppData *appData);
void ov15_021FE8A4(BagAppData *appData);
void ov15_021FEA5C(BagAppData *appData);
void ov15_021FEB64(BagAppData *appData);
void ov15_021FF1E0(BagAppData *appData);
void ov15_021FF29C(BagAppData *appData, int a1);
void ov15_021FF364(BagAppData *appData, s16 a1, int a2, int a3);
void ov15_021FF4EC(BagAppData *appData, int a1, int a2);
void ov15_021FF6BC(BagAppData *appData, u8 a1, s16 a2, int a3);
void ov15_021FF850(BagAppData *appData);
void ov15_021FF894(BagAppData *appData);
int ov15_021FF8D4(BagAppData *appData);
void ov15_021FFECC(BagAppData *appData, int a1);
void ov15_021FFF34(BagAppData *appData, int a1);
void ov15_02200030(BagAppData *appData, u8 pocket);
void ov15_02200140(BagAppData *appData, BagViewPocket *pocket, int a2, int a3);
void ov15_022002B4(BagAppData *appData, int a1);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
