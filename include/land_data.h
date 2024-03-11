#ifndef POKEHEARTGOLD_LAND_DATA_H
#define POKEHEARTGOLD_LAND_DATA_H

#include "script.h"

struct LandData {
    u8 modelIdToDataNum[225];
    u16 modelData[0x4000];
};

void FieldSystem_CreateLandData(FieldSystem *fieldSystem, u8 numModels);
void FieldSystem_DeleteLandData(FieldSystem *fieldSystem);
u16 *LandData_GetDataOfModel(int modelNo, LandData *landData);

#endif //POKEHEARTGOLD_LAND_DATA_H
