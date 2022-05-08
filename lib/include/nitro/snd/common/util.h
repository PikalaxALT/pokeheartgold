#ifndef NITRO_SND_COMMON_UTIL_H_
#define NITRO_SND_COMMON_UTIL_H_

#define SND_PITCH_DIVISION_BIT     6
#define SND_PITCH_DIVISION_RANGE ( 1 << SND_PITCH_DIVISION_BIT )

#define SND_PITCH_TABLE_SIZE     ( 12 * SND_PITCH_DIVISION_RANGE )
#define SND_PITCH_TABLE_BIAS       0x10000
#define SND_PITCH_TABLE_SHIFT     16

#define SND_VOLUME_DB_MIN        (-723)
#define SND_VOLUME_DB_MAX         0
#define SND_VOLUME_TABLE_SIZE ( SND_VOLUME_DB_MAX - SND_VOLUME_DB_MIN + 1 )

#define SND_CALC_DECIBEL_SCALE_MAX    127

#define SND_DECIBEL_TABLE_SIZE        128
#define SND_DECIBEL_SQUARE_TABLE_SIZE 128

#define SND_SIN_TABLE_SIZE 32
#define SND_SIN_PERIOD ( SND_SIN_TABLE_SIZE * 4 )

#endif
