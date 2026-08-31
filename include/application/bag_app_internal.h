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

typedef struct BagAppData {
    BgConfig *unk_000;
    u8 filler_004[0x230];
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
    u8 filler_616[0x2E];
    int unk_644;
    u8 filler_648[0x2A];
    u8 unk_672;
    u8 filler_673[0x19];
    void *unk_68C;
    void *unk_690;
    NNSG2dPaletteData *unk_694;
    NNSG2dPaletteData *unk_698;
    u8 filler_69C[8];
    u16 unk_6A4[165];
    u8 filler_7EE[0x15E];
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
void ov15_021FF6BC(BagAppData *appData, u8 a1, s16 a2, int a3);
void ov15_021FF850(BagAppData *appData);
void ov15_021FF894(BagAppData *appData);
int ov15_021FF8D4(BagAppData *appData);
void ov15_021FFECC(BagAppData *appData, int a1);
void ov15_02200030(BagAppData *appData, u8 pocket);
void ov15_02200140(BagAppData *appData, BagViewPocket *pocket, int a2, int a3);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_BAG_APP_INTERNAL_H
