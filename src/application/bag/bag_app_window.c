#include "application/bag_app_internal.h"

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
        appData->windows[11 + i].bgConfig = NULL;
    }
}
