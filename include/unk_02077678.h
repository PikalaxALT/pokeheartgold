#ifndef POKEHEARTGOLD_UNK_02077678_H
#define POKEHEARTGOLD_UNK_02077678_H

#include "sprite_system.h"

int sub_02077678(int moveType);
int sub_0207769C(u16 moveType);
NarcId sub_020776B4(void);
void sub_02077720(PaletteData *paletteData, int a1, SpriteSystem *spriteSystem, SpriteManager *spriteManager, int a4, int a5);
void sub_0207775C(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int a2, int a3);
void sub_020776B8(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NNS_G2D_VRAM_TYPE vramType, int type, int resId); // load type icon graphics?
void sub_020776EC(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int vram, int resId);
void sub_02077834(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NNS_G2D_VRAM_TYPE vramType, int type, int resId); // load type icon graphics?
void sub_020777A4(SpriteManager *spriteManager, int a1);
void sub_020777AC(SpriteManager *spriteManager, int a1);
void sub_020777B4(SpriteManager *spriteManager, int a1, int a2);
ManagedSprite *sub_020777C8(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int type, ManagedSpriteTemplate *spriteTemplate);
void thunk_ManagedSprite_DeleteAndFreeResources(ManagedSprite *managedSprite);
NarcId sub_02077830(void);
int sub_02077800(u16 moveCategory);
int sub_02077818(u16 moveCategory);
void sub_02077870(ManagedSprite *managedSprite);
void sub_02077868(SpriteManager *spriteManager, int a1);

#endif // POKEHEARTGOLD_UNK_02077678_H
