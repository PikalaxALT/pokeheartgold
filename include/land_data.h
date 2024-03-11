#ifndef POKEHEARTGOLD_LAND_DATA_H
#define POKEHEARTGOLD_LAND_DATA_H

#include "script.h"

struct LandData {
    u8 unk_0000[225];
    u16 unk_00E2[0x4000];
};

void sub_02054514(FieldSystem *fieldSystem, u8 a1);
void sub_0205453C(FieldSystem *fieldSystem);
u16 *sub_02054550(int a0, LandData *a1);

#endif //POKEHEARTGOLD_LAND_DATA_H
