#include "application/bag_app_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0225.h"

#include "bag.h"
#include "font.h"
#include "move.h"
#include "render_text.h"
#include "render_window.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200CE7C.h"

void ov15_021FE17C(BagAppData *appData);
void ov15_021FE1D0(BagAppData *appData);
void ov15_021FE3E0(BagAppData *appData);
void ov15_021FE204(BagAppData *appData);
void ov15_021FE584(BagAppData *appData, int itemSlot, u16 fieldno);
void ov15_021FE5A4(BagAppData *appData, int itemSlot, u16 fieldno);
void ov15_021FE5C4(BagAppData *appData, u16 itemId);
void ov15_021FE620(BagAppData *appData, u16 itemId);
void ov15_021FE8C4(BagAppData *appData, u16 a1, u16 a2, u32 textColor);
void ov15_021FE914(BagAppData *appData, Window *window, ItemSlot *slot, u32 y);
void *ov15_021FE990(BagAppData *appData, NNSG2dCharacterData **ppCharData);
void ov15_021FE9B0(BagAppData *appData, Window *window, int a2);
void ov15_021FE9F0(BagAppData *appData, Window *window, int y, BOOL a3);
int BagApp_PrintMessageCallback(TextPrinterTemplate *printer, u16 cmd);
int ov15_021FF320(BagViewPocket *pocket, int pocketId, int a2);
void ov15_021FF570(BagAppData *appData, Window *window, String *string, BagViewPocket *pocket, int slotId);
void ov15_021FF66C(MessageFormat *msgFormat, MsgData *msgData, Window *window, u16 quantity);

extern const u8 ov15_022008C8[];

void ov15_021FE020(BagAppData *appData) {
    AddWindowParameterized(appData->bgConfig, &appData->windows[0], GF_BG_LYR_MAIN_1, 0, 18, 32, 6, 4, 0x001);
    AddWindowParameterized(appData->bgConfig, &appData->windows[1], GF_BG_LYR_MAIN_1, 0, 13, 32, 4, 4, 0x0C1);
    AddWindowParameterized(appData->bgConfig, &appData->windows[2], GF_BG_LYR_SUB_0, 2, 1, 27, 2, 11, 0x001);
    AddWindowParameterized(appData->bgConfig, &appData->windows[3], GF_BG_LYR_SUB_0, 2, 1, 27, 4, 11, 0x053);
    AddWindowParameterized(appData->bgConfig, &appData->windows[4], GF_BG_LYR_MAIN_1, 19, 13, 12, 4, 4, 0x0DB);
    AddWindowParameterized(appData->bgConfig, &appData->windows[5], GF_BG_LYR_MAIN_1, 1, 12, 11, 4, 4, 0x12B);
    AddWindowParameterized(appData->bgConfig, &appData->windows[6], GF_BG_LYR_SUB_0, 10, 21, 7, 2, 11, 0x037);
    FillWindowPixelBuffer(&appData->windows[6], 0);
    AddWindowParameterized(appData->bgConfig, &appData->windows[7], GF_BG_LYR_SUB_0, 24, 21, 7, 2, 11, 0x045);
    FillWindowPixelBuffer(&appData->windows[7], 0);
    for (int i = 0; i < 24; ++i) {
        appData->windows3[i].bgConfig = NULL;
    }
}

void ov15_021FE154(BagAppData *appData) {
    for (u16 i = 0; i < 8; ++i) {
        RemoveWindow(&appData->windows[i]);
    }
    ov15_021FE3E0(appData);
    ov15_021FE1D0(appData);
}

extern const int ov15_02200908[12][3];

void ov15_021FE17C(BagAppData *appData) {
    if (appData->windows3[0].bgConfig == NULL) {
        for (int i = 0; i < 12; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows3[i], GF_BG_LYR_SUB_0, ov15_02200908[i][0], ov15_02200908[i][1], 11, 4, 11, ov15_02200908[i][2]);
        }
    }
}

void ov15_021FE1D0(BagAppData *appData) {
    if (appData->windows3[0].bgConfig != NULL) {
        for (int i = 0; i < 12; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows3[i]);
            RemoveWindow(&appData->windows3[i]);
            appData->windows3[i].bgConfig = NULL;
        }
    }
}

extern const int ov15_022008E8[4][2];
extern const int ov15_022008D0[3][2];

void ov15_021FE204(BagAppData *appData) {
    if (appData->windows3[12].bgConfig == NULL) {
        AddWindowParameterized(appData->bgConfig, &appData->windows3[12], GF_BG_LYR_SUB_0, 12, 7, 11, 4, 11, 0x2CF);
        FillWindowPixelBuffer(&appData->windows3[12], 0);
        for (int i = 0; i < 4; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows3[13 + i], GF_BG_LYR_SUB_0, ov15_022008E8[i][0], ov15_022008E8[i][1], 10, 2, 11, 0x31B + 20 * i);
            FillWindowPixelBuffer(&appData->windows3[13 + i], 0);
        }
        for (int i = 0; i < 3; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows3[17 + i], GF_BG_LYR_SUB_0, ov15_022008D0[i][0], ov15_022008D0[i][1], 2, 3, 11, 0x2FB + 6 * i);
            FillWindowPixelBuffer(&appData->windows3[17 + i], 0);
        }
        AddWindowParameterized(appData->bgConfig, &appData->windows3[20], GF_BG_LYR_SUB_0, 14, 21, 7, 2, 11, 0x30D);
        FillWindowPixelBuffer(&appData->windows3[20], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows3[21], GF_BG_LYR_SUB_0, 11, 1, 18, 4, 11, 0x31B);
        FillWindowPixelBuffer(&appData->windows3[21], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows3[22], GF_BG_LYR_SUB_0, 0, 0, 9, 4, 11, 0x363);
        FillWindowPixelBuffer(&appData->windows3[22], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows3[23], GF_BG_LYR_SUB_0, 24, 14, 8, 3, 11, 0x387);
        FillWindowPixelBuffer(&appData->windows3[23], 0);
    }
}

void ov15_021FE3E0(BagAppData *appData) {
    int i; // forward decl is required to match

    if (appData->windows3[12].bgConfig != NULL) {
        for (i = 0; i < 3; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows3[17 + i]);
            RemoveWindow(&appData->windows3[17 + i]);
            appData->windows3[17 + i].bgConfig = NULL;
        }
        ClearWindowTilemapAndScheduleTransfer(&appData->windows3[23]);
        RemoveWindow(&appData->windows3[23]);
        appData->windows3[23].bgConfig = NULL;

        RemoveWindow(&appData->windows3[22]);
        appData->windows3[22].bgConfig = NULL;

        RemoveWindow(&appData->windows3[21]);
        appData->windows3[21].bgConfig = NULL;

        ClearWindowTilemapAndScheduleTransfer(&appData->windows3[20]);
        RemoveWindow(&appData->windows3[20]);
        appData->windows3[20].bgConfig = NULL;

        for (i = 0; i < 4; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows3[13 + i]);
            RemoveWindow(&appData->windows3[13 + i]);
            appData->windows3[13 + i].bgConfig = NULL;
        }
        ClearWindowTilemapAndScheduleTransfer(&appData->windows3[12]);
        RemoveWindow(&appData->windows3[12]);
        appData->windows3[12].bgConfig = NULL;
    }
}

void ov15_021FE4C8(BagAppData *appData) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0225_bin, HEAP_ID_BAG);
    for (u16 i = 0; i < 8; ++i) {
        appData->unk_5F4[i] = NewString_ReadMsgData(msgData, msg_0225_00000 + i);
    }
    DestroyMsgData(msgData);
}

void ov15_021FE504(BagAppData *appData) {
    for (u16 i = 0; i < 8; ++i) {
        String_Delete(appData->unk_5F4[i]);
    }
}

void ov15_021FE528(BagAppData *appData) {
    for (u16 i = 0; i < 12; ++i) {
        FillBgTilemapRect(appData->bgConfig, GF_BG_LYR_MAIN_3, 205 + i, i, 13, 1, 1, 4);
        FillBgTilemapRect(appData->bgConfig, GF_BG_LYR_MAIN_3, 241 + i, i, 14, 1, 1, 4);
    }
}

void ov15_021FE584(BagAppData *appData, int itemSlot, u16 fieldno) {
    BufferItemName(appData->msgFormat, fieldno, ov15_021F9D60(appData, itemSlot, FALSE));
}

void ov15_021FE5A4(BagAppData *appData, int itemSlot, u16 fieldno) {
    BufferItemNamePlural(appData->msgFormat, fieldno, ov15_021F9D60(appData, itemSlot, FALSE));
}

void ov15_021FE5C4(BagAppData *appData, u16 itemId) {
    String *string;
    if (itemId != 0xFFFF) {
        string = String_New(130, HEAP_ID_BAG);
        GetItemDescIntoString(string, itemId, HEAP_ID_BAG);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00097);
    }
    AddTextPrinterParameterizedWithColor(&appData->windows[0], 0, string, 20, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
}

void ov15_021FE620(BagAppData *appData, u16 itemId) {
    Window *window = &appData->windows[1];
    u16 moveId = TMHMGetMove(itemId);
    String *string;
    u16 attr;

    // TYPE
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00101);
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // PP
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00089);
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // CATEGORY
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00092);
    AddTextPrinterParameterizedWithColor(window, 0, string, 72, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // POWER
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00090);
    AddTextPrinterParameterizedWithColor(window, 0, string, 168, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // ACCURACY
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00091);
    AddTextPrinterParameterizedWithColor(window, 0, string, 168, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    attr = GetMoveMaxPP(moveId, 0);
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00093);
    BufferIntegerAsString(appData->msgFormat, 0, attr, 2, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 48, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    attr = GetMoveAttr(moveId, MOVEATTR_POWER);
    if (attr <= 1) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00025);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00094);
    }
    BufferIntegerAsString(appData->msgFormat, 0, attr, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 232, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    attr = GetMoveAttr(moveId, MOVEATTR_ACCURACY);
    if (attr == 0) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00025);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00094);
    }
    BufferIntegerAsString(appData->msgFormat, 0, attr, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 232, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    ScheduleWindowCopyToVram(window);
}

void ov15_021FE868(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows[1]);
}

void ov15_021FE874(BagAppData *appData) {
    appData->unk_5E8 = NewString_ReadMsgData(appData->msgData, msg_0010_00039);
    appData->unk_5EC = NewString_ReadMsgData(appData->msgData, msg_0010_00038);
}

void ov15_021FE8A4(BagAppData *appData) {
    String_Delete(appData->unk_5E8);
    String_Delete(appData->unk_5EC);
}

void ov15_021FE8C4(BagAppData *appData, u16 a1, u16 a2, u32 textColor) {
    String *string = String_New(10, HEAP_ID_BAG);
    BufferIntegerAsString(appData->msgFormat, 0, a1, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, string, appData->unk_5EC);
    u32 result = FontID_String_GetWidth(0, string, 0);
    String_Delete(string);
}

void ov15_021FE914(BagAppData *appData, Window *window, ItemSlot *slot, u32 y) {
    u16 itemId = slot->id;
    if (itemId < ITEM_HM01) {
        itemId = itemId - ITEM_TM01 + 1;
        sub_0200CE7C(appData->msgPrinter, 2, itemId, 2, PRINTING_MODE_LEADING_ZEROS, window, 0, y + 5);
        ov15_021FE8C4(appData, slot->quantity, y, MAKE_TEXT_COLOR(1, 2, 0));
    } else {
        itemId = itemId - ITEM_HM01 + 1;
        PrintUIntOnWindow(appData->msgPrinter, itemId, 2, PRINTING_MODE_RIGHT_ALIGN, window, 16, y + 5);
        ov15_021FE9B0(appData, window, 16);
    }
}

void *ov15_021FE990(BagAppData *appData, NNSG2dCharacterData **ppCharData) {
    void *pNcgrFile = NARC_AllocAndReadWholeMember(appData->unk_244, 37, HEAP_ID_BAG);
    NNS_G2dGetUnpackedBGCharacterData(pNcgrFile, ppCharData);
    return pNcgrFile;
}

void ov15_021FE9B0(BagAppData *appData, Window *window, int a2) {
    NNSG2dCharacterData *pCharData;
    void *pNcgrFile = ov15_021FE990(appData, &pCharData);
    BlitBitmapRectToWindow(window, pCharData->pRawData, 0, 0, 104, 16, 0, a2, 24, 16);
    Heap_FreeExplicit(HEAP_ID_BAG, pNcgrFile);
}

void ov15_021FE9F0(BagAppData *appData, Window *window, int y, int a3) {
    NNSG2dCharacterData *pCharData;
    void *pNcgrFile = ov15_021FE990(appData, &pCharData);
    if (a3 == 0) {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 24, 0, 104, 16, 0, y, 40, 16);
    } else {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 64, 0, 104, 16, 0, y, 40, 16);
    }
    Heap_FreeExplicit(HEAP_ID_BAG, pNcgrFile);
}

void ov15_021FEA5C(BagAppData *appData) {
    appData->unk_300[0] = NewString_ReadMsgData(appData->msgData, msg_0010_00000);
    appData->unk_300[1] = NewString_ReadMsgData(appData->msgData, msg_0010_00006);
    appData->unk_300[2] = NewString_ReadMsgData(appData->msgData, msg_0010_00016);
    appData->unk_300[3] = NewString_ReadMsgData(appData->msgData, msg_0010_00098);
    appData->unk_300[4] = NewString_ReadMsgData(appData->msgData, msg_0010_00099);
    appData->unk_300[5] = NewString_ReadMsgData(appData->msgData, msg_0010_00001);
    appData->unk_300[6] = NewString_ReadMsgData(appData->msgData, msg_0010_00002);
    appData->unk_300[7] = NewString_ReadMsgData(appData->msgData, msg_0010_00018);
    appData->unk_300[8] = NewString_ReadMsgData(appData->msgData, msg_0010_00003);
    appData->unk_300[9] = NewString_ReadMsgData(appData->msgData, msg_0010_00004);
    appData->unk_300[10] = NewString_ReadMsgData(appData->msgData, msg_0010_00005);
    appData->unk_300[11] = NewString_ReadMsgData(appData->msgData, msg_0010_00008);
    appData->unk_300[12] = NewString_ReadMsgData(appData->msgData, msg_0010_00075);
    appData->unk_300[13] = NewString_ReadMsgData(appData->msgData, msg_0010_00086);
    appData->unk_300[14] = NewString_ReadMsgData(appData->msgData, msg_0010_00000);
    appData->unk_300[15] = NewString_ReadMsgData(appData->msgData, msg_0010_00128);
}

void ov15_021FEB64(BagAppData *appData) {
    for (u16 i = 0; i < 16; ++i) {
        String_Delete(appData->unk_300[i]);
    }
}

void ov15_021FEB84(BagAppData *appData, u8 *a1, int a2) {
    if (appData->bagView->pockets[appData->bagView->curPocket].pocketId == POCKET_TMHMS) {
        FillWindowPixelBuffer(&appData->windows[1], 0);
        ov15_021FE620(appData, appData->bagView->itemId);
        ScheduleWindowCopyToVram(&appData->windows[0]);
        ov15_021FF97C(appData, appData->bagView->itemId, 1);
        ov15_021F9C78(appData, FALSE);
    }
    DrawFrameAndWindow2(&appData->windows[2], TRUE, 0x3E2, 12);
    FillWindowPixelBuffer(&appData->windows[2], 15);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    String *r7;
    if (appData->bagView->context == BAG_VIEW_CONTEXT_6 && !ov15_021FD3F0(pocket->pocketId, appData->bagView->itemId)) {
        r7 = NewString_ReadMsgData(appData->msgData, msg_0010_00106);
    } else {
        r7 = NewString_ReadMsgData(appData->msgData, msg_0010_00043);
    }
    String *r6 = String_New(108, HEAP_ID_BAG);
    ov15_021FE584(appData, pocket->scroll + appData->cursorPos - 8, 0);
    StringExpandPlaceholders(appData->msgFormat, r6, r7);
    AddTextPrinterParameterized(&appData->windows[2], 1, r6, 0, 0, TEXT_SPEED_NOTRANSFER, NULL);
    String_Delete(r6);
    String_Delete(r7);
    ScheduleWindowCopyToVram(&appData->windows[2]);
}

void ov15_021FECA0(BagAppData *appData, Window *window, int itemId) {
    FillWindowPixelBuffer(window, 0);
    ov15_021FE5C4(appData, itemId);
    ScheduleWindowCopyToVram(window);
}

void ov15_021FECC4(BagAppData *appData, Window *window) {
    FillWindowPixelBuffer(window, 0);
    ScheduleWindowCopyToVram(window);
}

void ov15_021FECD8(BagAppData *appData, Window *window, int pocket) {
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00120 + pocket);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 0, string, 20, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

void ov15_021FED24(BagAppData *appData) {
    ClearFrameAndWindow2(&appData->windows[2], TRUE);
    ClearWindowTilemapAndScheduleTransfer(&appData->windows[2]);
}

void ov15_021FED3C(BagAppData *appData) {
    ov15_021FED24(appData);
    ov15_021FE3E0(appData);
    ov15_021FF97C(appData, ITEM_NONE, 0);
}

void ov15_021FED58(BagAppData *appData) {
    ov15_021FE3E0(appData);
}

void ov15_021FED60(BagAppData *appData) {
    FillWindowPixelBuffer(&appData->windows[2], 0xFF);
    String *r6 = NewString_ReadMsgData(appData->msgData, msg_0010_00046);
    String *r4 = String_New(130, HEAP_ID_BAG);
    ov15_021FE584(appData, appData->unk_672, 0);
    StringExpandPlaceholders(appData->msgFormat, r4, r6);
    DrawFrameAndWindow2(&appData->windows[2], TRUE, 0x3E2, 12);
    AddTextPrinterParameterizedWithColor(&appData->windows[2], 1, r4, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(&appData->windows[2]);
    String_Delete(r4);
    String_Delete(r6);
}

void ov15_021FEDEC(BagAppData *appData, u32 a1) {
    GF_ASSERT(appData->quantity < 1000);
    String *sp14 = String_New(2, HEAP_ID_BAG);
    u32 r4;
    if (a1 == 2) {
        r4 = 10;
    } else {
        r4 = 100;
    }
    u32 quantity = appData->quantity;
    for (int i = 0; i < a1; ++i) {
        u32 sp18 = quantity / r4;
        String16_FormatInteger(sp14, sp18, 1, PRINTING_MODE_LEFT_ALIGN, TRUE);
        quantity -= sp18 * r4;
        r4 /= 10;
        FillWindowPixelBuffer(&appData->windows3[17 + i], 0);
        AddTextPrinterParameterizedWithColor(&appData->windows3[17 + i], 0, sp14, 0, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleWindowCopyToVram(&appData->windows3[17 + i]);
    }
    String_Delete(sp14);
}

void ov15_021FEEA4(BagAppData *appData) {
    String *r4 = NewString_ReadMsgData(appData->msgData, msg_0010_00055);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    if (appData->quantity > 1) {
        ov15_021FE5A4(appData, pocket->scroll + appData->cursorPos - 8, 0);
    } else {
        ov15_021FE584(appData, pocket->scroll + appData->cursorPos - 8, 0);
    }
    BufferIntegerAsString(appData->msgFormat, 1, appData->quantity, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, r4);
    String_Delete(r4);
    appData->textPrinterId = BagApp_PrintMessage(appData, 0);
}

u8 BagApp_PrintMessage(BagAppData *appData, int a1) {
    Window *window;
    if (a1 == 0) {
        window = &appData->windows[3];
    } else {
        GF_ASSERT(appData->windows3[21].bgConfig != NULL);
        window = &appData->windows3[21];
    }
    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow2(window, TRUE, 0x3E2, 12);
    ScheduleWindowCopyToVram(window);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    TextFlags_SetAutoScrollParam(0);
    return AddTextPrinterParameterized(window, 1, appData->formattedStrbuf, 0, 0, Options_GetTextFrameDelay(appData->options), BagApp_PrintMessageCallback);
}

int BagApp_PrintMessageCallback(TextPrinterTemplate *printer, u16 cmd) {
    switch (cmd) {
    case 0:
        break;
    case 1:
        return GF_IsAnySEPlaying();
    case 2:
        return IsFanfarePlaying();
    case 3:
        PlaySE(SEQ_SE_DP_PC_LOGIN);
        break;
    case 4:
        return IsSEPlaying(SEQ_SE_DP_PC_LOGIN);
    }

    return FALSE;
}

void BagApp_CreateYesNoPrompt(BagAppData *appData) {
    YesNoPromptTemplate yesnoTemplate;

    yesnoTemplate.bgConfig = appData->bgConfig;
    yesnoTemplate.bgId = GF_BG_LYR_SUB_1;
    yesnoTemplate.tileStart = 0x81;
    yesnoTemplate.plttSlot = 9;
    yesnoTemplate.x = 25;
    yesnoTemplate.y = 6;
    yesnoTemplate.ignoreTouchFlag = FALSE;
    yesnoTemplate.initialCursorPos = 0;
    yesnoTemplate.initialCursorPos = 0;
    yesnoTemplate.shapeParam = 0;
    appData->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_BAG);
    YesNoPrompt_InitFromTemplate(appData->yesNoPrompt, &yesnoTemplate);
}

void BagApp_DestroyYesNoPrompt(BagAppData *appData) {
    YesNoPrompt_Destroy(appData->yesNoPrompt);
}

void ov15_021FF068(BagAppData *appData) {
    Window *window = &appData->windows3[23];
    FillWindowPixelBuffer(window, 0);
    String *r4 = NewString_ReadMsgData(appData->msgData, msg_0010_00083);
    BufferIntegerAsString(appData->msgFormat, 0, appData->unitSellPrice * appData->quantity, 6, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, r4);
    u32 width = FontID_String_GetWidth(0, appData->formattedStrbuf, 0);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 0, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(r4);
}

void ov15_021FF0FC(BagAppData *appData, int a1) {
    String *r4 = String_New(256, HEAP_ID_BAG);
    Window *window = &appData->windows3[22];
    if (a1 == 0) {
        FillWindowPixelBuffer(window, 0);
        String *r7 = NewString_ReadMsgData(appData->msgData, msg_0010_00080);
        AddTextPrinterParameterizedWithColor(window, 0, r7, 4, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        String_Delete(r7);
    } else {
        FillWindowPixelRect(window, 0, 0, 16, 72, 16);
    }
    String *sp10 = NewString_ReadMsgData(appData->msgData, msg_0010_00081);
    BufferIntegerAsString(appData->msgFormat, 0, PlayerProfile_GetMoney(appData->playerProfile), 6, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, r4, sp10);
    u32 width = FontID_String_GetWidth(0, r4, 0);
    AddTextPrinterParameterizedWithColor(window, 0, r4, 68 - (width + 8), 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(sp10);
    String_Delete(r4);
}

void ov15_021FF1E0(BagAppData *appData) {
    Window *window = &appData->windows[5];
    String *r6;

    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow1(window, TRUE, 0x3F7, 14);

    r6 = NewString_ReadMsgData(appData->msgData, msg_0010_00115);
    AddTextPrinterParameterized(window, 0, r6, 0, 0, TEXT_SPEED_NOTRANSFER, NULL);
    String_Delete(r6);

    r6 = NewString_ReadMsgData(appData->msgData, msg_0010_00116);
    BufferIntegerAsString(appData->msgFormat, 0, 0, 3, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, r6);
    String_Delete(r6);
    u32 width = FontID_String_GetWidth(0, appData->formattedStrbuf, 0);
    AddTextPrinterParameterized(window, 0, appData->formattedStrbuf, 88 - width, 16, TEXT_SPEED_NOTRANSFER, NULL);

    ScheduleWindowCopyToVram(window);
}

void ov15_021FF29C(BagAppData *appData, int a1) {
    String *r4 = NewString_ReadMsgData(appData->msgData, msg_0010_00008);
    FillWindowPixelBuffer(&appData->windows[7], 0);
    if (a1 == 0) {
        u32 width = FontID_String_GetWidth(0, r4, 0);
        AddTextPrinterParameterizedWithColor(&appData->windows[7], 0, r4, (48 - width) / 2 + 8, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    } else {
        AddTextPrinterParameterizedWithColor(&appData->windows[7], 0, r4, 5, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    }
    ScheduleWindowCopyToVram(&appData->windows[7]);
    String_Delete(r4);
}

int ov15_021FF320(BagViewPocket *pocket, int pocketId, int a2) {
    int i;
    int r5 = 0;
    for (i = 0; i < ov15_022008C8[pocketId]; ++i) {
        if (pocket->slots[i].id != ITEM_NONE && pocket->slots[i].quantity != 0) {
            ++r5;
            if (r5 == a2 + 1) {
                break;
            }
        }
    }
    return i;
}

void ov15_021FF364(BagAppData *appData, int a1, int a2, int a3) {
    int i;
    int sp28;
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    int sp20 = pocket->count - pocket->scroll;
    u16 sp18;
    u16 r4;
    if (sp20 > 6) {
        sp20 = 6;
    }
    if (appData->unk_68A == 0) {
        sp18 = 0;
        r4 = 6;
    } else {
        sp18 = 6;
        r4 = 0;
    }
    appData->unk_68A ^= 1;
    ov15_021FE17C(appData);
    for (i = 0; i < 6; ++i) {
        FillWindowPixelBuffer(&appData->windows3[sp18 + i], 0);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows3[r4 + i]);
    }
    sp28 = 0;
    for (i = ov15_021FF320(pocket, appData->bagView->curPocket, a1); i < ov15_022008C8[appData->bagView->curPocket]; ++i) {
        if (pocket->slots[i].id != ITEM_NONE && pocket->slots[i].quantity != 0) {
            if (a3 == 0) {
                ov15_021FF570(appData, &appData->windows3[sp18 + sp28], appData->itemNameStrings[i], pocket, i);
            } else if (i == appData->unk_672) {
                ov15_021FF570(appData, &appData->windows3[sp18 + sp28], appData->itemNameStrings[i], pocket, i);
            } else {
                AddTextPrinterParameterizedWithColor(&appData->windows3[sp18 + sp28], 0, appData->itemNameStrings[i], 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            }
            if (++sp28 >= sp20) {
                break;
            }
        }
    }
    for (i = 0; i < 6; ++i) {
        ScheduleWindowCopyToVram(&appData->windows3[sp18 + i]);
    }
}

void ov15_021FF4EC(BagAppData *appData, int scroll, int offset) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    offset = scroll + offset;
    for (int i = 0; i < 6; ++i) {
        ClearWindowTilemapAndScheduleTransfer(&appData->windows3[i]);
    }
    ov15_021FE1D0(appData);
    ClearWindowTilemapAndScheduleTransfer(&appData->windows[6]);
    ov15_021FE204(appData);
    ov15_021FF570(appData, &appData->windows3[12], appData->itemNameStrings[offset], pocket, offset);
    ScheduleWindowCopyToVram(&appData->windows3[12]);
}

void ov15_021FF560(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows3[12]);
}

void ov15_021FF570(BagAppData *appData, Window *window, String *string, BagViewPocket *pocket, int slotId) {
    switch (pocket->pocketId) {
    case POCKET_TMHMS:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ov15_021FE914(appData, window, &pocket->slots[slotId], 16);
        if (pocket->slots[slotId].id >= ITEM_TM01 && pocket->slots[slotId].id <= ITEM_TM92) {
            ov15_021FF66C(appData->msgFormat, appData->msgData, window, pocket->slots[slotId].quantity);
        }
        break;
    case POCKET_KEY_ITEMS:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        if (Bag_GetRegisteredItem1(appData->bag) == pocket->slots[slotId].id) {
            ov15_021FE9F0(appData, window, 16, 0);
        }
        if (Bag_GetRegisteredItem2(appData->bag) == pocket->slots[slotId].id) {
            ov15_021FE9F0(appData, window, 16, 1);
        }
        break;
    default:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ov15_021FF66C(appData->msgFormat, appData->msgData, window, pocket->slots[slotId].quantity);
    }
}
