#ifndef POKEHEARTGOLD_LAND_DATA_H
#define POKEHEARTGOLD_LAND_DATA_H

#include "script.h"

struct LandData {
    u8 filler_0000[0x80E2];
};

void sub_02054514(FieldSystem *fieldSystem, u8 a1);
void sub_0205453C(FieldSystem *fieldSystem);

#endif //POKEHEARTGOLD_LAND_DATA_H
