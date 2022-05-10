#ifndef NITRO_SND_COMMON_SEQ_H_
#define NITRO_SND_COMMON_SEQ_H_

#define SND_PLAYER_NUM 16
#define SND_PLAYER_MIN  0
#define SND_PLAYER_MAX 15

#define SND_TRACK_NUM 32
#define SND_TRACK_MIN  0
#define SND_TRACK_MAX 31

#define SND_TRACK_NUM_PER_PLAYER 16

#define SND_TRACK_CALL_STACK_DEPTH 3

#define SND_PLAYER_VARIABLE_NUM 16
#define SND_GLOBAL_VARIABLE_NUM 16

#define SND_SEQ_VAL_U8           0
#define SND_SEQ_VAL_U16          1
#define SND_SEQ_VAL_VLV          2
#define SND_SEQ_VAL_RAN          3
#define SND_SEQ_VAL_VAR          4

typedef struct SNDPlayer {
    u8 active_flag:1;
    u8 prepared_flag:1;
    u8 pause_flag:1;
    u8 pad_:5;
    u8 myNo;
    u8 pad2_;
    u8 pad3_;
    u8 prio;
    u8 volume;
    s16 extFader;
    u8 tracks[SND_TRACK_NUM_PER_PLAYER];
    u16 tempo;
    u16 tempo_ratio;
    u16 tempo_counter;
    u16 pad__;
    struct SNDBankData *bank;
} SNDPlayer;

typedef struct SNDTrack {
    u8 active_flag:1;
    u8 note_wait:1;
    u8 mute_flag:1;
    u8 tie_flag:1;
    u8 note_finish_wait:1;
    u8 porta_flag:1;
    u8 cmp_flag:1;
    u8 channel_mask_flag:1;
    u8 pan_range;
    u16 prgNo;
    u8 volume;
    u8 volume2;
    s8 pitch_bend;
    u8 bend_range;
    s8 pan;
    s8 ext_pan;
    s16 extFader;
    s16 ext_pitch;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 prio;
    s8 transpose;
    u8 porta_key;
    u8 porta_time;
    s16 sweep_pitch;
    struct SNDLfoParam mod;
    u16 channel_mask;
    s32 wait;
    const u8 *base;
    const u8 *cur;
    const u8 *call_stack[SND_TRACK_CALL_STACK_DEPTH];
    u8 loop_count[SND_TRACK_CALL_STACK_DEPTH];
    u8 call_stack_depth;
    struct SNDExChannel *channel_list;
} SNDTrack;

void SND_SeqInit(void);
void SND_SeqMain(BOOL doPeriodicProc);

#endif //NITRO_SND_COMMON_SEQ_H_
