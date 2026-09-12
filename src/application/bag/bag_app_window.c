#include "application/bag_app_internal.h"

void ov15_021FE17C(BagAppData *appData);
void ov15_021FE1D0(BagAppData *appData);
void ov15_021FE3E0(BagAppData *appData);
void ov15_021FE204(BagAppData *appData);

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
