#ifndef POKEHEARTGOLD_UNK_020290B4_H
#define POKEHEARTGOLD_UNK_020290B4_H

#include "battle_regulation.h"
#include "pm_string.h"

BOOL sub_020291A4(SaveData *saveData, int a1);
u32 sub_02029264(void *a0);
u32 LinkBattleRuleset_GetRuleValue(LinkBattleRuleset *ruleset, int a1);
void sub_020291D4(SaveData *saveData, u16 *a1);
String *sub_020290E4(u16 *a0, HeapID heapId);

#endif // POKEHEARTGOLD_UNK_020290B4_H
