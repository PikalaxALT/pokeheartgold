#include "global.h"
#include "oam_manager.h"

typedef struct OamManager {} OamManager;

OamManager *_021D0EB0 = NULL;

void sub_0200B194(int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, HeapID heapID);

void OamManager_Create(int a0, int a1, int a2, int a3, int a4, int a5, int a6, int a7, HeapID heapID) {
    int a0_2, a1_2, a2_2, a3_2;
    if (a0 < 4) {
        a0_2 = 4;
        if (a1 > 124) {
            a1_2 = a1 - (4 - a0);
        } else {
            a1_2 = a1;
        }
    } else {
        a0_2 = a0;
        a1_2 = a1;
    }
    if (a2 < 1) {
        a2_2 = 1;
        if (a3 > 30) {
            a3_2 = a3 - (1 - a2);
        } else {
            a3_2 = a3;
        }
    } else {
        a2_2 = a2;
        a3_2 = a3;
    }
    sub_0200B194(a0_2, a1_2, a2_2, a3_2, a4, a5, a6, a7, heapID);
}
