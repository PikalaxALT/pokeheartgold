#include "application/bag_app_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0225.h"

#include "font.h"
#include "move.h"
#include "text.h"
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
void ov15_021FE914(BagAppData *appData, Window *window, ItemSlot *a2, u32 a3);
void *ov15_021FE990(BagAppData *appData, NNSG2dCharacterData **ppCharData);
void ov15_021FE9B0(BagAppData *appData, Window *window, int a2);
void ov15_021FE9F0(BagAppData *appData, Window *window, int a2, BOOL a3);

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

void ov15_021FE914(BagAppData *appData, Window *window, ItemSlot *a2, u32 a3) {
    u16 itemId = a2->id;
    if (itemId < ITEM_HM01) {
        itemId = itemId - ITEM_TM01 + 1;
        sub_0200CE7C(appData->msgPrinter, 2, itemId, 2, PRINTING_MODE_LEADING_ZEROS, window, 0, a3 + 5);
        ov15_021FE8C4(appData, a2->quantity, a3, MAKE_TEXT_COLOR(1, 2, 0));
    } else {
        itemId = itemId - ITEM_HM01 + 1;
        PrintUIntOnWindow(appData->msgPrinter, itemId, 2, PRINTING_MODE_RIGHT_ALIGN, window, 16, a3 + 5);
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

void ov15_021FE9F0(BagAppData *appData, Window *window, int a2, BOOL a3) {
    NNSG2dCharacterData *pCharData;
    void *pNcgrFile = ov15_021FE990(appData, &pCharData);
    if (!a3) {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 24, 0, 104, 16, 0, a2, 40, 16);
    } else {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 64, 0, 104, 16, 0, a2, 40, 16);
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
