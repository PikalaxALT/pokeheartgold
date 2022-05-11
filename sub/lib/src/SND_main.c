#include <nitro.h>

#define SND_MESSAGE_MAX            8

OSThread sndThread;
u8 sndStack[0x400];
OSMessage sndMesgBuffer[SND_MESSAGE_MAX];
OSMessageQueue sndMesgQueue;
OSAlarm sndAlarm;

void SndThread(void *);
void SndAlarmCallback(void *);
void SND_CreateThread(u32 threadPrio);

void SND_Init(u32 threadPrio) {
    static BOOL initialized;
    if (!initialized) {
        initialized = TRUE;
        SND_CommandInit();
        SND_CreateThread(threadPrio);
    }
}

void SND_CreateThread(u32 threadPrio) {
    OS_CreateThread(&sndThread, SndThread, NULL, sndStack + sizeof(sndStack), sizeof(sndStack), threadPrio);
    OS_WakeupThreadDirect(&sndThread);
}

void SND_InitIntervalTimer(void) {
    OS_InitMessageQueue(&sndMesgQueue, sndMesgBuffer, SND_MESSAGE_MAX);
    OS_CreateAlarm(&sndAlarm);
}

void SND_StartIntervalTimer(void) {
    OSTick tick = OS_GetTick();
    OS_SetPeriodicAlarm(&sndAlarm, tick + 0x10000, SND_PROC_INTERVAL, SndAlarmCallback, NULL);
}

void SND_StopIntervalTimer(void) {
    OS_CancelAlarm(&sndAlarm);
}

void SND_SendWakeupMessage(void) {
    OS_SendMessage(&sndMesgQueue, (OSMessage)SND_MESSAGE_WAKEUP_THREAD, 0);
}

u32 SND_WaitForIntervalTimer(void) {
    OSMessage result;
    OS_ReceiveMessage(&sndMesgQueue, &result, 1);
    return (u32)result;
}

void SNDi_LockMutex(void) {
    // no effect
}

void SNDi_UnlockMutex(void) {
    // no effect
}

void SndAlarmCallback(void *arg) {
    OS_SendMessage(&sndMesgQueue, (OSMessage)SND_MESSAGE_PERIODIC, 0);
}

void SndThread(void *arg) {
    SND_InitIntervalTimer();
    SND_ExChannelInit();
    SND_SeqInit();
    SND_AlarmInit();
    SND_Enable();
    SND_SetOutputSelector(0, 0, 0, 0);
    SND_SetMasterVolume(REG_SND_SOUND0CNT_VOLUME_MASK);
    SND_StartIntervalTimer();

    while (1) {
        BOOL update = FALSE;

        u32 result = SND_WaitForIntervalTimer();

        switch (result) {
        case SND_MESSAGE_WAKEUP_THREAD:
            break;
        case SND_MESSAGE_PERIODIC:
            update = TRUE;
            break;
        }

        SND_UpdateExChannel();
        SND_CommandProc();

        SND_SeqMain(update);
        SND_ExChannelMain(update);

        SND_UpdateSharedWork();
        SND_CalcRandom();
    }
}
