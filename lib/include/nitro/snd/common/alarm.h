#ifndef NITRO_SND_COMMON_ALARM_H_
#define NITRO_SND_COMMON_ALARM_H_

#define SND_ALARM_NUM 8
#define SND_ALARM_MIN 0
#define SND_ALARM_MAX ( SND_ALARM_NUM - 1 )

typedef struct SNDAlarm {
    u8 enable;
    u8 id;
    u16 padding;

    struct {
        OSTick tick;
        OSTick period;
    } setting;

    OSAlarm alarm;
} SNDAlarm;

void SND_AlarmInit(void);
void SND_SetupAlarm(int alarmNo, OSTick tick, OSTick period, int id);
void SND_StartAlarm(int alarmNo);
void SND_StopAlarm(int alarmNo);

#endif //NITRO_SND_COMMON_ALARM_H_
