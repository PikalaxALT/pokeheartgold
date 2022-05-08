#ifndef NITRO_SND_CHANNEL_H_
#define NITRO_SND_CHANNEL_H_

#define SND_CHANNEL_NUM 16

typedef enum {
    SND_CHANNEL_0,
    SND_CHANNEL_1,
    SND_CHANNEL_2,
    SND_CHANNEL_3,
    SND_CHANNEL_4,
    SND_CHANNEL_5,
    SND_CHANNEL_6,
    SND_CHANNEL_7,
    SND_CHANNEL_8,
    SND_CHANNEL_9,
    SND_CHANNEL_10,
    SND_CHANNEL_11,
    SND_CHANNEL_12,
    SND_CHANNEL_13,
    SND_CHANNEL_14,
    SND_CHANNEL_15
} SNDChannelId;

typedef enum {
    SND_WAVE_FORMAT_PCM8,
    SND_WAVE_FORMAT_PCM16,
    SND_WAVE_FORMAT_ADPCM,
    SND_WAVE_FORMAT_PSG,
    SND_WAVE_FORMAT_NOISE = SND_WAVE_FORMAT_PSG
} SNDWaveFormat;

typedef enum {
    SND_CHANNEL_LOOP_MANUAL,
    SND_CHANNEL_LOOP_REPEAT,
    SND_CHANNEL_LOOP_1SHOT
} SNDChannelLoop;

typedef enum {
    SND_DUTY_1_8,
    SND_DUTY_2_8,
    SND_DUTY_3_8,
    SND_DUTY_4_8,
    SND_DUTY_5_8,
    SND_DUTY_6_8,
    SND_DUTY_7_8
} SNDDuty;

typedef enum {
    SND_CHANNEL_DATASHIFT_NONE,
    SND_CHANNEL_DATASHIFT_1BIT,
    SND_CHANNEL_DATASHIFT_2BIT,
    SND_CHANNEL_DATASHIFT_4BIT
} SNDChannelDataShift;

#ifdef SDK_ARM7
void SND_StopChannel(int chNo, s32 flags);
#endif //SDK_ARM7

#endif //NITRO_SND_CHANNEL_H_
