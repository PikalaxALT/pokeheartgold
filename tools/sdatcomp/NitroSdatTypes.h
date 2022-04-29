#ifndef SDATCOMP_NITROSDATTYPES_H
#define SDATCOMP_NITROSDATTYPES_H

// <nitro/types.h>
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef unsigned long long u64;
typedef signed char s8;
typedef signed short s16;
typedef signed long s32;
typedef signed long long s64;
typedef s32 BOOL;

// <nnsys/snd/sndarc.h>
struct SNDBinaryFileHeader {
    char    signature[4];
    u16     byteOrder;
    u16     version;
    u32     fileSize;
    u16     headerSize;
    u16     dataBlocks;
};

struct SNDBinaryBlockHeader {
    u32     kind;
    u32     size;
};

struct NNSSndSeqParam
{
    u16 bankNo;
    u8 volume;
    u8 channelPrio;
    u8 playerPrio;
    u8 playerNo;
    u16 reserved;
};

struct NNSSndSeqArcSeqInfo
{
    u32 offset;
    struct NNSSndSeqParam param;
};

struct NNSSndSeqArc {
    struct SNDBinaryFileHeader fileHeader;
    struct SNDBinaryBlockHeader blockHeader;
    u32 baseOffset;
    u32 count;
    NNSSndSeqArcSeqInfo info[0];
};

struct NNSSndArcFileInfo {
    u32 offset;
    u32 size;
    void* mem;
    u32 reserved;
};

struct NNSSndArcFat {
    struct SNDBinaryBlockHeader blockHeader;

    u32 count;
    NNSSndArcFileInfo files[0];
};

struct NNSSndArcInfo {
    struct SNDBinaryBlockHeader blockHeader;

    u32 seqOffset;
    u32 seqArcOffset;
    u32 bankOffset;
    u32 waveArcOffset;
    u32 playerInfoOffset;
    u32 groupInfoOffset;
    u32 strmPlayerInfoOffset;
    u32 strmOffset;
};

struct NNSSndArcSymbol {
    struct SNDBinaryBlockHeader blockHeader;

    u32 seqOffset;
    u32 seqArcOffset;
    u32 bankOffset;
    u32 waveArcOffset;
    u32 playerOffset;
    u32 groupOffset;
    u32 strmPlayerOffset;
    u32 strmOffset;
};

struct NNSSndArcHeader {
    struct SNDBinaryFileHeader fileHeader;
    u32 symbolDataOffset;
    u32 symbolDataSize;
    u32 infoOffset;
    u32 infoSize;
    u32 fatOffset;
    u32 fatSize;
    u32 fileImageOffset;
    u32 fileImageSize;
};

#endif //SDATCOMP_NITROSDATTYPES_H
