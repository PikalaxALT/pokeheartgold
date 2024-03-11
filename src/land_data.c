#include "global.h"
#include "land_data.h"

void LandData_LoadFromNarc(MAPMATRIX *matrix, LandData *landData, u8 numModels);
u8 LoadLandData_AppendModelList(u16 modelNo, u16 *modelList, u8 *pListCount);

void FieldSystem_CreateLandData(FieldSystem *fieldSystem, u8 numModels) {
    if (fieldSystem->landData == NULL) {
        fieldSystem->landData = AllocFromHeap(HEAP_ID_FIELD, sizeof(LandData));
        LandData_LoadFromNarc(fieldSystem->mapMatrix, fieldSystem->landData, numModels);
    }
}


void FieldSystem_DeleteLandData(FieldSystem *fieldSystem) {
    if (fieldSystem->landData != NULL) {
        FreeToHeap(fieldSystem->landData);
        fieldSystem->landData = NULL;
    }
}

u16 *LandData_GetDataOfModel(int modelNo, LandData *landData) {
    return &landData->modelData[landData->modelIdToDataNum[modelNo] * 0x400];
}

void LandData_LoadFromNarc(MAPMATRIX *matrix, LandData *landData, u8 numModels) {
    u8 listCount;
    u16 fileno;
    u8 listIndex;
    u32 index;
    int i, j;
    int height, width;
    u16 list[16];
    u16 *destPtr;
    NARC *narc;

    listCount = 0;
    width = MapMatrix_GetWidth(matrix);
    height = MapMatrix_GetHeight(matrix);
    for (j = 0; j < height; ++j) {
        for (i = 0; i < width; ++i) {
            index = (u16)(j * width + i);  // cast needed to match
            fileno = MapMatrix_GetMapModelNo(index, matrix);
            listIndex = LoadLandData_AppendModelList(fileno, list, &listCount);
            landData->modelIdToDataNum[index] = listIndex;
        }
    }

    narc = NARC_New(NARC_fielddata_land_data_land_data, HEAP_ID_FIELD);
    for (i = 0; i < numModels; ++i) {
        fileno = list[i];
        destPtr = &landData->modelData[i * 0x400];
        NARC_ReadFromMember(narc, fileno, 0x14, 0x800, destPtr);
    }
    NARC_Delete(narc);
}

u8 LoadLandData_AppendModelList(u16 modelNo, u16 *modelList, u8 *pListCount) {
    u8 i;

    for (i = 0; i < *pListCount; ++i) {
        if (modelList[i] == modelNo) {
            return i;
        }
    }
    GF_ASSERT(i < 16);
    modelList[i] = modelNo;
    ++(*pListCount);
    return i;
}
