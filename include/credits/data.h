#ifndef POKEHEARTGOLD_CREDITS_DATA_H
#define POKEHEARTGOLD_CREDITS_DATA_H

#include "global.h"
#include "gf_gfx_planes.h"
#include "unk_020215A0.h"
#include "bg_window.h"
#include "credits/credits.h"

typedef struct {
    int plttFileId;
    int charFileId;
    int cellBankFileId;
    int animBankFileId;
} GfGfxFileIds;

typedef struct {
    int ids[6];
} ScrnFileIds;

typedef struct {
    u16 startTime;
    u16 duration;
} PageTiming;

typedef struct {
    u16 page;
    u8 x;
    u8 y;
    int msgno;
} CreditMsgLine;

typedef struct {
    u16 unk0;
    u8 spriteIdx; // Index of sprite in `spriteIds`
    u8 animSeqNo;
    s16 xPos;
    s16 yPos;
    u32 activateTime;
} CutsceneSpriteParam;

typedef struct {
    u8 uniqueSprites;
    u8 totalSprites;
    u8 spriteIds[UNIQUE_SPRITES_PER_CUTSCENE];
    CutsceneSpriteParam spriteParam[SPRITES_PER_CUTSCENE];
} Cutscene;

static const WindowTemplate ov76_021E6E98 = {
    .bgId      = 0x05,
    .left      = 0x03,
    .top       = 0x00,
    .width     = 0x18,
    .height    = 0x18,
    .palette   = 0x0F,
    .baseTile  = 0x0001,
};

static const ObjCharTransferTemplate ov76_021E6EA0 = { 0x28, 0, 0, HEAP_ID_CREDITS };

static const GraphicsModes ov76_021E6EB0 = {
    .dispMode    = GX_DISPMODE_GRAPHICS,
    .bgMode      = GX_BGMODE_0,
    .subMode     = GX_BGMODE_0,
    ._2d3dMode   = GX_BG0_AS_2D,
};

static const int sSceneTransitionTimings[5] = { 890, 1780, 2615, 3030, 4295 };

static const int sScreenFlipTimings[5] = { 890, 1780, 2615, 3030, 4295 };

static const ScrnFileIds ov76_021E6F00 = {
    { 0x08, 0x12, 0x0A, 0x10, 0x0E, 0x0C },
};

static const ScrnFileIds ov76_021E6EE8 = {
    { 0x07, 0x11, 0x09, 0x0F, 0x0D, 0x0B },
};

static const BgTemplate ov76_021E6F50 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xd800,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 1,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const BgTemplate ov76_021E6F6C = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe800,
    .charBase   = GX_BG_CHARBASE_0x08000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 2,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const BgTemplate ov76_021E6F88 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe000,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 1,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const BgTemplate ov76_021E6FA4 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xd800,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 3,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const BgTemplate ov76_021E6F18 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe800,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 2,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const BgTemplate ov76_021E6F34 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = 0x0800,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0xe000,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 3,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .dummy      = 0,
    .mosaic     = FALSE,
};

static const GraphicsBanks sCreditsGraphicsBanks = {
    .bg            = GX_VRAM_BG_128_B,
    .bgextpltt     = GX_VRAM_BGEXTPLTT_NONE,
    .subbg         = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt  = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj           = GX_VRAM_OBJ_128_A,
    .objextpltt    = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj        = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex           = GX_VRAM_TEX_NONE,
    .texpltt       = GX_VRAM_TEXPLTT_NONE,
};

static const PageTiming sPageTimings[NUM_CREDIT_PAGES] = {
    {    0, 105 },
    {  110, 105 },
    {  220, 105 },
    {  330, 105 },
    {  440, 105 },
    {  550, 105 },
    {  660, 115 },
    {  779, 109 },
    {  894, 115 },
    { 1012, 109 },
    { 1125, 102 },
    { 1232, 102 },
    { 1339, 110 },
    { 1454, 105 },
    { 1565, 105 },
    { 1676, 100 },
    { 1787, 105 },
    { 1898, 105 },
    { 2009, 105 },
    { 2120, 120 },
    { 2245, 120 },
    { 2370, 120 },
    { 2495, 110 },
    { 2620, 125 },
    { 2750, 110 },
    { 2865, 160 },
    { 3035, 100 },
    { 3140, 100 },
    { 3245, 125 },
    { 3375, 100 },
    { 3480, 115 },
    { 3598, 115 },
    { 3716, 115 },
    { 3834, 115 },
    { 3952, 115 },
    { 4070, 115 },
    { 4188, 105 },
    { 4300, 110 },
    { 4415, 110 },
    { 4530, 127 },
    { 4660, 107 },
    { 4770, 107 },
    { 4880, 107 },
};

static const GfGfxFileIds sCutsceneSpriteGfxFileIds[42] = {
    { 0x96, 0x17, 0x18, 0x19 },
    { 0x97, 0x1A, 0x1B, 0x1C },
    { 0x98, 0x1D, 0x1E, 0x1F },
    { 0x99, 0x20, 0x21, 0x22 },
    { 0x9A, 0x23, 0x24, 0x25 },
    { 0x9B, 0x26, 0x27, 0x28 },
    { 0x9C, 0x29, 0x2A, 0x2B },
    { 0x9D, 0x2C, 0x2D, 0x2E },
    { 0x9E, 0x2F, 0x30, 0x31 },
    { 0x9F, 0x32, 0x33, 0x34 },
    { 0xA0, 0x35, 0x36, 0x37 },
    { 0xA1, 0x38, 0x39, 0x3A },
    { 0xA2, 0x3B, 0x3C, 0x3D },
    { 0xA3, 0x3E, 0x3F, 0x40 },
    { 0xA4, 0x41, 0x42, 0x43 },
    { 0xA5, 0x44, 0x45, 0x46 },
    { 0xA6, 0x47, 0x48, 0x49 },
    { 0xA7, 0x4A, 0x4B, 0x4C },
    { 0xA8, 0x4D, 0x4E, 0x4F },
    { 0xA9, 0x50, 0x51, 0x52 },
    { 0xAA, 0x53, 0x54, 0x55 },
    { 0xAB, 0x56, 0x57, 0x58 },
    { 0xAC, 0x59, 0x5A, 0x5B },
    { 0xAD, 0x5C, 0x5D, 0x5E },
    { 0xAE, 0x5F, 0x60, 0x61 },
    { 0xAF, 0x62, 0x63, 0x64 },
    { 0xB0, 0x65, 0x66, 0x67 },
    { 0xB1, 0x68, 0x69, 0x6A },
    { 0xB2, 0x6B, 0x6C, 0x6D },
    { 0xB3, 0x6E, 0x6F, 0x70 },
    { 0xB4, 0x71, 0x72, 0x73 },
    { 0xB5, 0x74, 0x75, 0x76 },
    { 0xB6, 0x77, 0x78, 0x79 },
    { 0xB7, 0x7A, 0x7B, 0x7C },
    { 0xB8, 0x7D, 0x7E, 0x7F },
    { 0xB9, 0x80, 0x81, 0x82 },
    { 0xBA, 0x83, 0x84, 0x85 },
    { 0xBB, 0x86, 0x87, 0x88 },
    { 0xBC, 0x89, 0x8A, 0x8B },
    { 0xBD, 0x8C, 0x8D, 0x8E },
    { 0xBE, 0x8F, 0x90, 0x91 },
    { 0xBF, 0x92, 0x93, 0x94 },
};

static const CreditMsgLine sCreditMsgLines[251] = {
    { 0x0000, 0x00, 0x46, 0x00 },
    { 0x0001, 0x14, 0x50, 0x03 },
    { 0x0001, 0x28, 0x60, 0x04 },
    { 0x0002, 0x14, 0x14, 0x05 },
    { 0x0002, 0x28, 0x24, 0x06 },
    { 0x0002, 0x14, 0x3C, 0x07 },
    { 0x0002, 0x28, 0x4C, 0x08 },
    { 0x0002, 0x14, 0x64, 0x09 },
    { 0x0002, 0x28, 0x74, 0x0A },
    { 0x0002, 0x14, 0x8C, 0x0B },
    { 0x0002, 0x28, 0x9C, 0x0C },
    { 0x0003, 0x14, 0x28, 0x0D },
    { 0x0003, 0x28, 0x38, 0x0E },
    { 0x0003, 0x28, 0x48, 0x0F },
    { 0x0003, 0x28, 0x58, 0x10 },
    { 0x0003, 0x28, 0x68, 0x11 },
    { 0x0003, 0x28, 0x78, 0x12 },
    { 0x0003, 0x28, 0x88, 0x13 },
    { 0x0004, 0x14, 0x20, 0x14 },
    { 0x0004, 0x14, 0x30, 0x15 },
    { 0x0004, 0x14, 0x40, 0x16 },
    { 0x0004, 0x28, 0x50, 0x17 },
    { 0x0004, 0x28, 0x60, 0x18 },
    { 0x0004, 0x28, 0x70, 0x19 },
    { 0x0004, 0x28, 0x80, 0x1A },
    { 0x0004, 0x28, 0x90, 0x1B },
    { 0x0005, 0x28, 0x20, 0x1C },
    { 0x0005, 0x28, 0x30, 0x1D },
    { 0x0005, 0x28, 0x40, 0x1E },
    { 0x0005, 0x28, 0x50, 0x1F },
    { 0x0005, 0x28, 0x60, 0x20 },
    { 0x0005, 0x28, 0x70, 0x21 },
    { 0x0005, 0x28, 0x80, 0x22 },
    { 0x0005, 0x28, 0x90, 0x23 },
    { 0x0006, 0x14, 0x18, 0x24 },
    { 0x0006, 0x28, 0x28, 0x25 },
    { 0x0006, 0x28, 0x38, 0x26 },
    { 0x0006, 0x28, 0x48, 0x27 },
    { 0x0006, 0x28, 0x58, 0x28 },
    { 0x0006, 0x28, 0x68, 0x29 },
    { 0x0006, 0x28, 0x78, 0x2A },
    { 0x0006, 0x28, 0x88, 0x2B },
    { 0x0006, 0x28, 0x98, 0x2C },
    { 0x0007, 0x14, 0x08, 0x2D },
    { 0x0007, 0x28, 0x18, 0x2E },
    { 0x0007, 0x28, 0x28, 0x2F },
    { 0x0007, 0x28, 0x38, 0x30 },
    { 0x0007, 0x28, 0x48, 0x31 },
    { 0x0007, 0x14, 0x60, 0x32 },
    { 0x0007, 0x28, 0x70, 0x33 },
    { 0x0007, 0x28, 0x80, 0x34 },
    { 0x0007, 0x14, 0x98, 0x35 },
    { 0x0007, 0x28, 0xA8, 0x36 },
    { 0x0008, 0x14, 0x30, 0x37 },
    { 0x0008, 0x28, 0x40, 0x38 },
    { 0x0008, 0x28, 0x50, 0x39 },
    { 0x0008, 0x28, 0x60, 0x3A },
    { 0x0008, 0x28, 0x70, 0x3B },
    { 0x0008, 0x28, 0x80, 0x3C },
    { 0x0009, 0x28, 0x28, 0x3D },
    { 0x0009, 0x28, 0x38, 0x3E },
    { 0x0009, 0x28, 0x48, 0x3F },
    { 0x0009, 0x28, 0x58, 0x40 },
    { 0x0009, 0x28, 0x68, 0x41 },
    { 0x0009, 0x28, 0x78, 0x42 },
    { 0x0009, 0x28, 0x88, 0x43 },
    { 0x000A, 0x14, 0x40, 0x44 },
    { 0x000A, 0x28, 0x50, 0x45 },
    { 0x000A, 0x28, 0x60, 0x46 },
    { 0x000A, 0x28, 0x70, 0x47 },
    { 0x000B, 0x14, 0x40, 0x48 },
    { 0x000B, 0x28, 0x50, 0x49 },
    { 0x000B, 0x28, 0x60, 0x4A },
    { 0x000B, 0x28, 0x70, 0x4B },
    { 0x000C, 0x14, 0x48, 0x4C },
    { 0x000C, 0x28, 0x58, 0x4D },
    { 0x000C, 0x28, 0x68, 0x4E },
    { 0x000D, 0x14, 0x30, 0x4F },
    { 0x000D, 0x28, 0x40, 0x50 },
    { 0x000D, 0x28, 0x50, 0x51 },
    { 0x000D, 0x28, 0x60, 0x52 },
    { 0x000D, 0x28, 0x70, 0x53 },
    { 0x000D, 0x28, 0x80, 0x54 },
    { 0x000E, 0x14, 0x38, 0x55 },
    { 0x000E, 0x28, 0x48, 0x56 },
    { 0x000E, 0x28, 0x58, 0x57 },
    { 0x000E, 0x28, 0x68, 0x58 },
    { 0x000E, 0x28, 0x78, 0x59 },
    { 0x000F, 0x14, 0x28, 0x5A },
    { 0x000F, 0x28, 0x38, 0x5B },
    { 0x000F, 0x28, 0x48, 0x5C },
    { 0x000F, 0x28, 0x58, 0x5D },
    { 0x000F, 0x28, 0x68, 0x5E },
    { 0x000F, 0x28, 0x78, 0x5F },
    { 0x000F, 0x28, 0x88, 0x60 },
    { 0x0010, 0x28, 0x28, 0x61 },
    { 0x0010, 0x28, 0x38, 0x62 },
    { 0x0010, 0x28, 0x48, 0x63 },
    { 0x0010, 0x28, 0x58, 0x64 },
    { 0x0010, 0x28, 0x68, 0x65 },
    { 0x0010, 0x28, 0x78, 0x66 },
    { 0x0010, 0x28, 0x88, 0x67 },
    { 0x0011, 0x28, 0x28, 0x68 },
    { 0x0011, 0x28, 0x38, 0x69 },
    { 0x0011, 0x28, 0x48, 0x6A },
    { 0x0011, 0x28, 0x58, 0x6B },
    { 0x0011, 0x28, 0x68, 0x6C },
    { 0x0011, 0x28, 0x78, 0x6D },
    { 0x0011, 0x28, 0x88, 0x6E },
    { 0x0012, 0x14, 0x50, 0x6F },
    { 0x0012, 0x28, 0x60, 0x70 },
    { 0x0013, 0x14, 0x48, 0x71 },
    { 0x0013, 0x28, 0x58, 0x72 },
    { 0x0013, 0x28, 0x68, 0x73 },
    { 0x0014, 0x14, 0x24, 0x74 },
    { 0x0014, 0x28, 0x34, 0x75 },
    { 0x0014, 0x28, 0x44, 0x76 },
    { 0x0014, 0x14, 0x5C, 0x77 },
    { 0x0014, 0x28, 0x6C, 0x78 },
    { 0x0014, 0x28, 0x7C, 0x79 },
    { 0x0014, 0x28, 0x8C, 0x7A },
    { 0x0015, 0x14, 0x40, 0x7B },
    { 0x0015, 0x28, 0x50, 0x7C },
    { 0x0015, 0x28, 0x60, 0x7D },
    { 0x0015, 0x28, 0x70, 0x7E },
    { 0x0016, 0x14, 0x40, 0x7F },
    { 0x0016, 0x28, 0x50, 0x80 },
    { 0x0016, 0x28, 0x60, 0x81 },
    { 0x0016, 0x28, 0x70, 0x82 },
    { 0x0017, 0x14, 0x30, 0x83 },
    { 0x0017, 0x28, 0x40, 0x84 },
    { 0x0017, 0x28, 0x50, 0x85 },
    { 0x0017, 0x28, 0x60, 0x86 },
    { 0x0017, 0x28, 0x70, 0x87 },
    { 0x0017, 0x28, 0x80, 0x88 },
    { 0x0018, 0x28, 0x30, 0x89 },
    { 0x0018, 0x28, 0x40, 0x8A },
    { 0x0018, 0x28, 0x50, 0x8B },
    { 0x0018, 0x28, 0x60, 0x8C },
    { 0x0018, 0x28, 0x70, 0x8D },
    { 0x0018, 0x28, 0x80, 0x8E },
    { 0x0019, 0x14, 0x40, 0x8F },
    { 0x0019, 0x28, 0x50, 0x90 },
    { 0x0019, 0x28, 0x60, 0x91 },
    { 0x0019, 0x28, 0x70, 0x92 },
    { 0x001A, 0x14, 0x10, 0x93 },
    { 0x001A, 0x28, 0x20, 0x94 },
    { 0x001A, 0x28, 0x30, 0x95 },
    { 0x001A, 0x28, 0x40, 0x96 },
    { 0x001A, 0x28, 0x50, 0x97 },
    { 0x001A, 0x28, 0x60, 0x98 },
    { 0x001A, 0x28, 0x70, 0x99 },
    { 0x001A, 0x28, 0x80, 0x9A },
    { 0x001A, 0x28, 0x90, 0x9B },
    { 0x001A, 0x28, 0xA0, 0x9C },
    { 0x001B, 0x14, 0x3C, 0x9D },
    { 0x001B, 0x14, 0x54, 0x9E },
    { 0x001B, 0x28, 0x64, 0x9F },
    { 0x001B, 0x28, 0x74, 0xA0 },
    { 0x001C, 0x14, 0x50, 0xA1 },
    { 0x001C, 0x28, 0x60, 0xA2 },
    { 0x001D, 0x14, 0x18, 0xA3 },
    { 0x001D, 0x28, 0x28, 0xA4 },
    { 0x001D, 0x28, 0x38, 0xA5 },
    { 0x001D, 0x28, 0x48, 0xA6 },
    { 0x001D, 0x28, 0x58, 0xA7 },
    { 0x001D, 0x28, 0x68, 0xA8 },
    { 0x001D, 0x28, 0x78, 0xA9 },
    { 0x001D, 0x28, 0x88, 0xAA },
    { 0x001D, 0x28, 0x98, 0xAB },
    { 0x001E, 0x14, 0x14, 0xAC },
    { 0x001E, 0x28, 0x24, 0xAD },
    { 0x001E, 0x14, 0x3C, 0xAE },
    { 0x001E, 0x28, 0x4C, 0xAF },
    { 0x001E, 0x14, 0x64, 0xB0 },
    { 0x001E, 0x28, 0x74, 0xB1 },
    { 0x001E, 0x14, 0x8C, 0xB2 },
    { 0x001E, 0x28, 0x9C, 0xB3 },
    { 0x001F, 0x14, 0x0C, 0xB4 },
    { 0x001F, 0x28, 0x1C, 0xB5 },
    { 0x001F, 0x28, 0x2C, 0xB6 },
    { 0x001F, 0x28, 0x3C, 0xB7 },
    { 0x001F, 0x28, 0x4C, 0xB8 },
    { 0x001F, 0x28, 0x5C, 0xB9 },
    { 0x001F, 0x28, 0x6C, 0xBA },
    { 0x001F, 0x28, 0x7C, 0xBB },
    { 0x001F, 0x14, 0x94, 0xBC },
    { 0x001F, 0x28, 0xA4, 0xBD },
    { 0x0020, 0x14, 0x10, 0xBE },
    { 0x0020, 0x28, 0x20, 0xBF },
    { 0x0020, 0x28, 0x30, 0xC0 },
    { 0x0020, 0x28, 0x40, 0xC1 },
    { 0x0020, 0x28, 0x50, 0xC2 },
    { 0x0020, 0x28, 0x60, 0xC3 },
    { 0x0020, 0x28, 0x70, 0xC4 },
    { 0x0020, 0x28, 0x80, 0xC5 },
    { 0x0020, 0x28, 0x90, 0xC6 },
    { 0x0020, 0x28, 0xA0, 0xC7 },
    { 0x0021, 0x28, 0x10, 0xC8 },
    { 0x0021, 0x28, 0x20, 0xC9 },
    { 0x0021, 0x28, 0x30, 0xCA },
    { 0x0021, 0x28, 0x40, 0xCB },
    { 0x0021, 0x28, 0x50, 0xCC },
    { 0x0021, 0x28, 0x60, 0xCD },
    { 0x0021, 0x28, 0x70, 0xCE },
    { 0x0021, 0x28, 0x80, 0xCF },
    { 0x0021, 0x28, 0x90, 0xD0 },
    { 0x0021, 0x28, 0xA0, 0xD1 },
    { 0x0022, 0x28, 0x10, 0xD2 },
    { 0x0022, 0x28, 0x20, 0xD3 },
    { 0x0022, 0x28, 0x30, 0xD4 },
    { 0x0022, 0x28, 0x40, 0xD5 },
    { 0x0022, 0x28, 0x50, 0xD6 },
    { 0x0022, 0x28, 0x60, 0xD7 },
    { 0x0022, 0x28, 0x70, 0xD8 },
    { 0x0022, 0x28, 0x80, 0xD9 },
    { 0x0022, 0x28, 0x90, 0xDA },
    { 0x0022, 0x28, 0xA0, 0xDB },
    { 0x0023, 0x28, 0x28, 0xDC },
    { 0x0023, 0x28, 0x38, 0xDD },
    { 0x0023, 0x28, 0x48, 0xDE },
    { 0x0023, 0x28, 0x58, 0xDF },
    { 0x0023, 0x28, 0x68, 0xE0 },
    { 0x0023, 0x28, 0x78, 0xE1 },
    { 0x0023, 0x28, 0x88, 0xE2 },
    { 0x0024, 0x14, 0x38, 0xE3 },
    { 0x0024, 0x28, 0x48, 0xE4 },
    { 0x0024, 0x28, 0x58, 0xE5 },
    { 0x0024, 0x28, 0x68, 0xE6 },
    { 0x0024, 0x28, 0x78, 0xE7 },
    { 0x0025, 0x14, 0x38, 0xE8 },
    { 0x0025, 0x28, 0x48, 0xE9 },
    { 0x0025, 0x28, 0x58, 0xEA },
    { 0x0025, 0x28, 0x68, 0xEB },
    { 0x0025, 0x28, 0x78, 0xEC },
    { 0x0026, 0x14, 0x38, 0xED },
    { 0x0026, 0x28, 0x48, 0xEE },
    { 0x0026, 0x28, 0x58, 0xEF },
    { 0x0026, 0x28, 0x68, 0xF0 },
    { 0x0026, 0x28, 0x78, 0xF1 },
    { 0x0027, 0x14, 0x38, 0xF2 },
    { 0x0027, 0x28, 0x48, 0xF3 },
    { 0x0027, 0x28, 0x58, 0xF4 },
    { 0x0027, 0x28, 0x68, 0xF5 },
    { 0x0027, 0x28, 0x78, 0xF6 },
    { 0x0028, 0x14, 0x50, 0xF7 },
    { 0x0028, 0x28, 0x60, 0xF8 },
    { 0x0029, 0x14, 0x50, 0xF9 },
    { 0x0029, 0x28, 0x60, 0xFA },
    { 0x002A, 0x14, 0x50, 0xFB },
    { 0x002A, 0x28, 0x60, 0xFC },
};

static const Cutscene sCutscenes[NUM_CUTSCENES] = {
    {
        0x04, 0x04,
        { 0x00, 0x01, 0x02, 0x03, 0xFF, 0xFF },
        {
            { 0x0000, 0x00, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0001, 0x01, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0002, 0x02, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0003, 0x03, 0x02, 0x0080, 0x0060, 0x0032 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x02, 0x02,
        { 0x03, 0x04, 0xFF, 0xFF, 0xFF, 0xFF },
        {
            { 0x0003, 0x00, 0x03, 0x0080, 0x0060, 0x014D },
            { 0x0004, 0x01, 0x02, 0x0080, 0x0060, 0x014D },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x05, 0x06, 0x07, 0x08, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0006, 0x01, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0007, 0x02, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0008, 0x03, 0x02, 0x0080, 0x0060, 0x02BC },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x06, 0x06,
        { 0x00, 0x01, 0x02, 0x03, 0x05, 0x06 },
        {
            { 0x0000, 0x00, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0001, 0x01, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0002, 0x02, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0003, 0x03, 0x04, 0x0080, 0x0060, 0x037A },
            { 0x0005, 0x04, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0006, 0x05, 0x03, 0x0080, 0x0060, 0x037A },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x03, 0x03,
        { 0x05, 0x07, 0x09, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x04, 0x0080, 0x0060, 0x0384 },
            { 0x0007, 0x01, 0x03, 0x0080, 0x0060, 0x0384 },
            { 0x0009, 0x02, 0x02, 0x0080, 0x0060, 0x0384 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x05, 0x0E,
        { 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x00 },
        {
            { 0x000A, 0x00, 0x02, 0x0080, 0x0060, 0x04CE },
            { 0x000B, 0x01, 0x02, 0x0080, 0x0060, 0x04CE },
            { 0x000C, 0x02, 0x04, 0x005A, 0x000A, 0x04EC },
            { 0x000D, 0x02, 0x03, 0x003C, 0x000F, 0x04EC },
            { 0x000E, 0x02, 0x04, 0x0050, 0x0014, 0x04EC },
            { 0x000F, 0x02, 0x04, 0x004B, 0x0019, 0x04EC },
            { 0x0010, 0x02, 0x04, 0x005F, 0x001E, 0x0500 },
            { 0x0011, 0x02, 0x02, 0x0046, 0x0023, 0x04EC },
            { 0x0012, 0x02, 0x03, 0x0064, 0x0028, 0x0500 },
            { 0x0013, 0x02, 0x03, 0x0041, 0x002D, 0x0500 },
            { 0x0014, 0x02, 0x05, 0x005A, 0x0032, 0x0546 },
            { 0x0015, 0x02, 0x04, 0x0055, 0x0037, 0x0500 },
            { 0x0016, 0x03, 0x02, 0x0080, 0x0060, 0x04D8 },
            { 0x0017, 0x04, 0x02, 0x0080, 0x0060, 0x04D8 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x03, 0x10, 0x04, 0x0F, 0xFF, 0xFF },
        {
            { 0x0003, 0x00, 0x05, 0x0080, 0x0060, 0x060E },
            { 0x0019, 0x01, 0x02, 0x0080, 0x0060, 0x060E },
            { 0x0004, 0x02, 0x03, 0x0080, 0x0060, 0x060E },
            { 0x0018, 0x03, 0x02, 0x0080, 0x0060, 0x060E },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x0F, 0x11, 0x12, 0x13, 0xFF, 0xFF },
        {
            { 0x0018, 0x00, 0x03, 0x0080, 0x0060, 0x0708 },
            { 0x001A, 0x01, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x001B, 0x02, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x001C, 0x03, 0x02, 0x0080, 0x0060, 0x0708 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x0D,
        { 0x18, 0x19, 0x1A, 0x1B, 0xFF, 0xFF },
        {
            { 0x002A, 0x00, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x002B, 0x01, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x002C, 0x02, 0x02, 0x0074, 0x0050, 0x0898 },
            { 0x002D, 0x02, 0x02, 0x008E, 0x0055, 0x089B },
            { 0x002E, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x002F, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0030, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0031, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0032, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0033, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0034, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0035, 0x02, 0x01, 0x0080, 0x0060, 0x0898 },
            { 0x0036, 0x03, 0x02, 0x0080, 0x0060, 0x0898 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x0C,
        { 0x14, 0x15, 0x16, 0x17, 0xFF, 0xFF },
        {
            { 0x001D, 0x00, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x001E, 0x01, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x001F, 0x02, 0x03, 0x0078, 0x0050, 0x0A5B },
            { 0x0020, 0x02, 0x02, 0x007E, 0x005A, 0x0A5C },
            { 0x0021, 0x02, 0x03, 0x0082, 0x0048, 0x0A5D },
            { 0x0022, 0x02, 0x02, 0x006E, 0x005A, 0x0A5E },
            { 0x0023, 0x02, 0x03, 0x008C, 0x0064, 0x0A5F },
            { 0x0024, 0x02, 0x02, 0x007D, 0x006E, 0x0A60 },
            { 0x0025, 0x02, 0x03, 0x0087, 0x0048, 0x0A61 },
            { 0x0026, 0x02, 0x02, 0x0072, 0x003C, 0x0A62 },
            { 0x0027, 0x02, 0x03, 0x006E, 0x0050, 0x0A63 },
            { 0x0029, 0x03, 0x02, 0x0080, 0x0060, 0x0A5A },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x1C, 0x1E, 0x1D, 0x21, 0xFF, 0xFF },
        {
            { 0x0037, 0x00, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0039, 0x01, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0038, 0x02, 0x02, 0x007E, 0x0060, 0x0BF4 },
            { 0x0040, 0x03, 0x02, 0x0080, 0x0060, 0x0BF4 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x05, 0x09,
        { 0x22, 0x23, 0x24, 0x25, 0x20, 0x00 },
        {
            { 0x0045, 0x00, 0x02, 0x0080, 0x006E, 0x0D1F },
            { 0x0046, 0x01, 0x02, 0x0080, 0x006E, 0x0D0C },
            { 0x0047, 0x02, 0x02, 0x0080, 0x006E, 0x0D32 },
            { 0x0048, 0x03, 0x02, 0x0080, 0x006E, 0x0D45 },
            { 0x003B, 0x04, 0x02, 0x0080, 0x006E, 0x0D58 },
            { 0x003C, 0x04, 0x03, 0x0080, 0x006E, 0x0D6B },
            { 0x003D, 0x04, 0x02, 0x0080, 0x006E, 0x0D7E },
            { 0x003E, 0x04, 0x03, 0x0080, 0x006E, 0x0D91 },
            { 0x003F, 0x04, 0x04, 0x0080, 0x006E, 0x0E42 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x06, 0x06,
        { 0x25, 0x24, 0x05, 0x1D, 0x23, 0x22 },
        {
            { 0x0048, 0x00, 0x03, 0x0080, 0x007D, 0x0EB0 },
            { 0x0047, 0x01, 0x03, 0x0080, 0x0064, 0x0E9C },
            { 0x0005, 0x02, 0x05, 0x0080, 0x0060, 0x0EE2 },
            { 0x0038, 0x03, 0x03, 0x0080, 0x0060, 0x0ED8 },
            { 0x0046, 0x04, 0x03, 0x0080, 0x0046, 0x0E92 },
            { 0x0045, 0x05, 0x03, 0x0080, 0x002D, 0x0EA6 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x04, 0x04,
        { 0x26, 0x27, 0x28, 0x29, 0xFF, 0xFF },
        {
            { 0x0049, 0x00, 0x02, 0x0080, 0x0060, 0x0F5F },
            { 0x004A, 0x01, 0x02, 0x0080, 0x0060, 0x0F87 },
            { 0x004B, 0x02, 0x02, 0x0080, 0x0060, 0x0FAF },
            { 0x004C, 0x03, 0x02, 0x0080, 0x0060, 0x0FD7 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x03, 0x03,
        { 0x05, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x06, 0x0080, 0x0060, 0x10CC },
            { 0x0038, 0x01, 0x04, 0x0080, 0x0060, 0x10CC },
            { 0x0039, 0x02, 0x04, 0x0080, 0x0060, 0x10CC },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
    {
        0x02, 0x02,
        { 0x05, 0x06, 0xFF, 0xFF, 0xFF, 0xFF },
        {
            { 0x0005, 0x00, 0x07, 0x0080, 0x0060, 0x11DA },
            { 0x0006, 0x01, 0x04, 0x0080, 0x0060, 0x11DA },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
            { 0x0000, 0x00, 0x00, 0x0000, 0x0000, 0x0000 },
        },
    },
};

#endif //POKEHEARTGOLD_CREDITS_DATA_H
