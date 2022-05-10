#ifndef NITRO_SND_COMMON_MAIN_H_
#define NITRO_SND_COMMON_MAIN_H_

void SND_Init(u32 threadPrio);
void SND_CreateThread(u32 threadPrio);
void SND_InitIntervalTimer(void);
void SND_StartIntervalTimer(void);
void SND_StopIntervalTimer(void);
void SND_SendWakeupMessage(void);
u32 SND_WaitForIntervalTimer(void);
void SNDi_LockMutex(void);
void SNDi_UnlockMutex(void);

#endif //NITRO_SND_COMMON_MAIN_H_
