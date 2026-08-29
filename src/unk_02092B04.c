#include "unk_02092B04.h"

#include "field/fieldmap.h"

#include "bag_view.h"
#include "overlay_03.h"
#include "screen_fade.h"

u8 sub_02092B40(FieldSystem *fieldSystem, MartData *martData);
void sub_02092B7C(TaskManager *taskman);

BOOL Task_Bag_SellMenu(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    MartData *martData = TaskManager_GetEnvironment(taskman);

    switch (martData->state) {
    case TASK_MART_24:
        martData->state = sub_02092B40(fieldSystem, martData);
        break;
    case TASK_MART_25:
        sub_02092B7C(taskman);
        break;
    }

    return FALSE;
}

u8 sub_02092B40(FieldSystem *fieldSystem, MartData *martData) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return TASK_MART_24;
    }

    if (martData->unk2A0 != NULL) {
        martData->unk2A0[1] = sub_0207791C(martData->bagView);
    }
    Heap_Free(martData->bagView);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    return TASK_MART_25;
}

void sub_02092B7C(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    MartData *martData = TaskManager_GetEnvironment(taskman);

    if (sub_020505C8(fieldSystem)) {
        FieldMap_FadeScreen(FADE_TYPE_BRIGHTNESS_IN);
        TaskManager_Jump(taskman, Task_Mart, martData);
        martData->state = TASK_MART_26;
    }
}
