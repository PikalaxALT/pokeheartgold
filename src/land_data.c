#include "global.h"
#include "land_data.h"

void sub_0205455C(MAPMATRIX *matrix, LandData *landData, u8 a2);
u8 sub_0205460C(u16 modelNo, u16 *a1, u8 *a2);

void sub_02054514(FieldSystem *fieldSystem, u8 a1) {
    if (fieldSystem->landData == NULL) {
        fieldSystem->landData = AllocFromHeap(HEAP_ID_FIELD, sizeof(LandData));
        sub_0205455C(fieldSystem->mapMatrix, fieldSystem->landData, a1);
    }
}


void sub_0205453C(FieldSystem *fieldSystem) {
    if (fieldSystem->landData != NULL) {
        FreeToHeap(fieldSystem->landData);
        fieldSystem->landData = NULL;
    }
}

u16 *sub_02054550(int a0, LandData *a1) {
    return &a1->unk_00E2[a1->unk_0000[a0] * 0x400];
}

void sub_0205455C(MAPMATRIX *matrix, LandData *landData, u8 a2) {
    u8 sp18;
    u16 fileno;
    u8 listIndex;
    u32 index;
    int i, j;
    int height, width;
    u16 list[16];
    u16 *destPtr;
    NARC *narc;

    sp18 = 0;
    width = MapMatrix_GetWidth(matrix);
    height = MapMatrix_GetHeight(matrix);
    for (j = 0; j < height; ++j) {
        for (i = 0; i < width; ++i) {
            index = (u16)(j * width + i);  // cast needed to match
            fileno = MapMatrix_GetMapModelNo(index, matrix);
            listIndex = sub_0205460C(fileno, list, &sp18);
            landData->unk_0000[index] = listIndex;
        }
    }

    narc = NARC_New(NARC_fielddata_land_data_land_data, HEAP_ID_FIELD);
    for (i = 0; i < a2; ++i) {
        fileno = list[i];
        destPtr = &landData->unk_00E2[i * 0x400];
        NARC_ReadFromMember(narc, fileno, 0x14, 0x800, destPtr);
    }
    NARC_Delete(narc);
}

u8 sub_0205460C(u16 modelNo, u16 *a1, u8 *a2) {
    u8 i;

    for (i = 0; i < *a2; ++i) {
        if (a1[i] == modelNo) {
            return i;
        }
    }
    GF_ASSERT(i < 16);
    a1[i] = modelNo;
    ++(*a2);
    return i;
}
