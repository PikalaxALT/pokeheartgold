	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public OSi_SetTimerReserved
	.public OS_IsTickAvailable
	.public FifoCtrlInit
	.public FifoRecvCallbackTable
	.public PADi_XYButtonAvailable
	.public MI_StopDma
	.public PXI_IsCallbackReady
	.public PXIi_SetToFifo
	.public SND_Enable
	.public SND_SetMasterVolume
	.public SND_SetOutputSelector
	.public SND_SetupChannelPcm
	.public SND_SetupChannelPsg
	.public SND_SetupChannelNoise
	.public SND_StopChannel
	.public SND_SetChannelVolume
	.public SND_SetChannelTimer
	.public SND_SetChannelPan
	.public SND_IsChannelActive
	.public SND_SetMasterPan
	.public SND_GetChannelControl
	.public SNDi_SetSurroundDecay
	.public CalcSurroundDecay
	.public SND_CalcTimer
	.public SND_CalcChannelVolume
	.public SND_SinIdx
	.public SND_CalcRandom
	.public SND_StartIntervalTimer
	.public SND_StopIntervalTimer
	.public SND_SendWakeupMessage
	.public SNDi_LockMutex
	.public SNDi_UnlockMutex
	.public SndAlarmCallback
	.public SND_SetupCapture
	.public SND_IsCaptureActive
	.public SND_UpdateExChannel
	.public SND_StartExChannelPcm
	.public SND_StartExChannelPsg
	.public SND_StartExChannelNoise
	.public SND_SetExChannelAttack
	.public SND_SetExChannelDecay
	.public SND_SetExChannelSustain
	.public SND_SetExChannelRelease
	.public SND_ReleaseExChannel
	.public SND_IsExChannelActive
	.public SND_AllocExChannel
	.public SND_FreeExChannel
	.public SND_StopUnlockedChannel
	.public sWeakLockChannel
	.public PADi_XYButtonAlarm
	.public sSurroundDecay
	.public sOrgPan
	.public sOrgVolume
	.public SND_Init__sinit__initialized
	.public sndMesgBuffer
	.public sndMesgQueue
	.public sndAlarm
	.public sndThread
	.public sndStack
	.public sWeakLockChannel
	.public sLockChannel
	.public sMmlPrintEnable
	.public seqCache
	.public SNDi_SharedWork
	.public SNDi_Work
	.public sCommandMesgQueue
	.public sCommandMesgBuffer
	.public CARDi_EnableFlag
	.public SND_LockChannel
    .public SND_UnlockChannel
    .public SND_GetLockedChannel
    .public SND_InvalidateWave
    .public SND_InitLfoParam
    .public SND_UpdateLfo
    .public SND_GetLfoValue
    .public CalcRelease
    .public StartExChannel
    .public SND_PrepareSeq
    .public ReadByte

	arm_func_start SND_StartPreparedSeq
SND_StartPreparedSeq: ; 0x037FD288
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _037FD2A4 ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_037FD2A4: .word SNDi_Work + 0x540
	arm_func_end SND_StartPreparedSeq

	arm_func_start SND_StartSeq
SND_StartSeq: ; 0x037FD2A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl SND_PrepareSeq
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD2D4 ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD2D4: .word SNDi_Work + 0x540
	arm_func_end SND_StartSeq

	arm_func_start SND_StopSeq
SND_StopSeq: ; 0x037FD2D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD32C ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD324
	add r0, r2, r1
	bl FinishPlayer
	ldr r0, _037FD330 ; =SNDi_SharedWork
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_037FD324:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD32C: .word SNDi_Work + 0x540
_037FD330: .word SNDi_SharedWork
	arm_func_end SND_StopSeq

	arm_func_start SND_PauseSeq
SND_PauseSeq: ; 0x037FD334
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _037FD3A8 ; =SNDi_Work + 0x540
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	mov r0, r0, lsl #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _037FD3A0
	mov r8, #0
	mov r6, #0x7f
_037FD36C:
	mov r1, r8
	add r0, r5, r4
	bl GetPlayerTrack
	movs r7, r0
	beq _037FD394
	mov r2, r6
	add r1, r5, r4
	bl ReleaseTrackChannelAll
	mov r0, r7
	bl FreeTrackChannelAll
_037FD394:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FD36C
_037FD3A0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD3A8: .word SNDi_Work + 0x540
	arm_func_end SND_PauseSeq

	arm_func_start SND_SkipSeq
SND_SkipSeq: ; 0x037FD3AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _037FD470 ; =SNDi_Work + 0x540
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_037FD3C8:
	mov r0, r6
	mov r1, r7
	bl GetPlayerTrack
	movs r5, r0
	beq _037FD3F0
	mov r1, r6
	mov r2, r4
	bl ReleaseTrackChannelAll
	mov r0, r5
	bl FreeTrackChannelAll
_037FD3F0:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD3C8
	bl SND_StopIntervalTimer
	mov r4, #0
	mov r5, r4
	b _037FD430
_037FD40C:
	mov r0, r6
	mov r1, r5
	bl PlayerSeqMain
	cmp r0, #0
	beq _037FD42C
	mov r0, r6
	bl FinishPlayer
	b _037FD438
_037FD42C:
	add r4, r4, #1
_037FD430:
	cmp r4, r8
	blo _037FD40C
_037FD438:
	bl SND_StartIntervalTimer
	ldr r0, _037FD474 ; =SNDi_SharedWork
	ldr r3, [r0]
	cmp r3, #0
	beq _037FD468
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_037FD468:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD470: .word SNDi_Work + 0x540
_037FD474: .word SNDi_SharedWork
	arm_func_end SND_SkipSeq

	arm_func_start SND_SetTrackMute
SND_SetTrackMute: ; 0x037FD478
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _037FD4E0 ; =SNDi_Work + 0x540
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _037FD4C8
_037FD498:
	tst r8, #1
	beq _037FD4C0
	mov r1, r6
	add r0, r5, r4
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD4C0
	mov r2, r7
	add r1, r5, r4
	bl SetTrackMute
_037FD4C0:
	add r6, r6, #1
	mov r8, r8, lsr #1
_037FD4C8:
	cmp r6, #0x10
	bge _037FD4D8
	cmp r8, #0
	bne _037FD498
_037FD4D8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD4E0: .word SNDi_Work + 0x540
	arm_func_end SND_SetTrackMute

	arm_func_start SND_SetTrackAllocatableChannel
SND_SetTrackAllocatableChannel: ; 0x037FD4E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	mov r0, r2, lsl #0x10
	ldr r5, _037FD550 ; =SNDi_Work + 0x540
	mov r7, r1
	mov r6, #0
	mov r8, r0, lsr #0x10
	b _037FD538
_037FD508:
	tst r7, #1
	beq _037FD530
	mov r1, r6
	add r0, r5, r4
	bl GetPlayerTrack
	cmp r0, #0
	strneh r8, [r0, #0x1e]
	ldrneb r1, [r0]
	orrne r1, r1, #0x80
	strneb r1, [r0]
_037FD530:
	add r6, r6, #1
	mov r7, r7, lsr #1
_037FD538:
	cmp r6, #0x10
	bge _037FD548
	cmp r7, #0
	bne _037FD508
_037FD548:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD550: .word SNDi_Work + 0x540
	arm_func_end SND_SetTrackAllocatableChannel

	arm_func_start SND_InvalidateSeq
SND_InvalidateSeq: ; 0x037FD554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _037FD5DC ; =SNDi_Work + 0x540
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_037FD570:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD5C8
	mov r8, fp
	b _037FD5C0
_037FD58C:
	mov r1, r8
	add r0, r6, r5
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD5BC
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _037FD5BC
	add r0, r6, r5
	bl FinishPlayer
	b _037FD5C8
_037FD5BC:
	add r8, r8, #1
_037FD5C0:
	cmp r8, #0x10
	blt _037FD58C
_037FD5C8:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD570
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD5DC: .word SNDi_Work + 0x540
	arm_func_end SND_InvalidateSeq

	arm_func_start SND_InvalidateBank
SND_InvalidateBank: ; 0x037FD5E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FD638 ; =SNDi_Work + 0x540
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_037FD5F8:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _037FD624
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _037FD624
	bl FinishPlayer
_037FD624:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FD5F8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD638: .word SNDi_Work + 0x540
	arm_func_end SND_InvalidateBank

	arm_func_start SNDi_SetPlayerParam
SNDi_SetPlayerParam: ; 0x037FD63C
	stmdb sp!, {r3, lr}
	ldr lr, _037FD67C ; =SNDi_Work + 0x540
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _037FD668
	cmp r3, #2
	beq _037FD670
	cmp r3, #4
	streq r2, [ip, r1]
	b _037FD674
_037FD668:
	strb r2, [ip, r1]
	b _037FD674
_037FD670:
	strh r2, [ip, r1]
_037FD674:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD67C: .word SNDi_Work + 0x540
	arm_func_end SNDi_SetPlayerParam

	arm_func_start SNDi_SetTrackParam
SNDi_SetTrackParam: ; 0x037FD680
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	mul r5, r0, r4
	mov r8, r3
	mov r0, r8, lsl #0x10
	ldr r7, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov r6, #0
	mov fp, r0, lsr #0x10
	and r4, r8, #0xff
	b _037FD700
_037FD6B0:
	tst sl, #1
	beq _037FD6F8
	ldr r0, _037FD718 ; =SNDi_Work + 0x540
	mov r1, r6
	add r0, r0, r5
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD6F8
	cmp r7, #1
	beq _037FD6EC
	cmp r7, #2
	beq _037FD6F4
	cmp r7, #4
	streq r8, [r0, sb]
	b _037FD6F8
_037FD6EC:
	strb r4, [r0, sb]
	b _037FD6F8
_037FD6F4:
	strh fp, [r0, sb]
_037FD6F8:
	add r6, r6, #1
	mov sl, sl, lsr #1
_037FD700:
	cmp r6, #0x10
	bge _037FD710
	cmp sl, #0
	bne _037FD6B0
_037FD710:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD718: .word SNDi_Work + 0x540
	arm_func_end SNDi_SetTrackParam

	arm_func_start InitCache
InitCache: ; 0x037FD71C
	ldr r1, _037FD754 ; =sMmlPrintEnable
	bic r2, r0, #3
	str r2, [r1, #4]
	add r0, r2, #0x10
	str r0, [r1, #8]
	ldr r0, [r2]
	str r0, [r1, #0xc]
	ldr r0, [r2, #4]
	str r0, [r1, #0x10]
	ldr r0, [r2, #8]
	str r0, [r1, #0x14]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_037FD754: .word sMmlPrintEnable
	arm_func_end InitCache

	arm_func_start Read24
Read24: ; 0x037FD758
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ReadByte
	mov r4, r0
	mov r0, r5
	bl ReadByte
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl ReadByte
	orr r0, r4, r0, lsl #16
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end Read24

	arm_func_start ReadArg
ReadArg: ; 0x037FD788
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _037FD87C
_037FD7A0: ; jump table
	b _037FD7B4 ; case 0
	b _037FD7C0 ; case 1
	b _037FD7E0 ; case 2
	b _037FD81C ; case 3
	b _037FD800 ; case 4
_037FD7B4:
	bl ReadByte
	mov r5, r0
	b _037FD87C
_037FD7C0:
	bl ReadByte
	mov r5, r0
	mov r0, r4
	bl ReadByte
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	b _037FD87C
_037FD7E0:
	mov r5, #0
_037FD7E4:
	mov r0, r4
	bl ReadByte
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _037FD7E4
	b _037FD87C
_037FD800:
	bl ReadByte
	mov r1, r0
	mov r0, r6
	bl GetVariablePtr
	cmp r0, #0
	ldrnesh r5, [r0]
	b _037FD87C
_037FD81C:
	bl ReadByte
	mov r5, r0
	mov r0, r4
	bl ReadByte
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4
	mov r5, r1, lsl #0x10
	bl ReadByte
	mov r6, r0
	mov r0, r4
	bl ReadByte
	orr r0, r6, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl SND_CalcRandom
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	add r5, r0, r5, asr #16
_037FD87C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end ReadArg

	arm_func_start InitTrack
InitTrack: ; 0x037FD888
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	ldrb r1, [r4]
	mov r2, #0xff
	orr r1, r1, #2
	bic ip, r1, #4
	strb r1, [r4]
	and r1, ip, #0xff
	bic r3, r1, #8
	strb ip, [r4]
	and r1, r3, #0xff
	bic ip, r1, #0x10
	strb r3, [r4]
	and r1, ip, #0xff
	bic r3, r1, #0x20
	and r1, r3, #0xff
	orr r1, r1, #0x40
	strb ip, [r4]
	bic r1, r1, #0x80
	strb r1, [r4]
	strb r0, [r4, #0x3b]
	strh r0, [r4, #2]
	mov r1, #0x40
	strb r1, [r4, #0x12]
	mov r1, #0x7f
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strh r0, [r4, #0xa]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #6]
	strh r0, [r4, #0xc]
	strb r2, [r4, #0xe]
	strb r2, [r4, #0xf]
	strb r2, [r4, #0x10]
	strb r2, [r4, #0x11]
	strb r1, [r4, #1]
	mov r1, #2
	strb r1, [r4, #7]
	mov r1, #0x3c
	strb r1, [r4, #0x14]
	strb r0, [r4, #0x15]
	strh r0, [r4, #0x16]
	strb r0, [r4, #0x13]
	add r0, r2, #0xff00
	strh r0, [r4, #0x1e]
	add r0, r4, #0x18
	bl SND_InitLfoParam
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end InitTrack

	arm_func_start StartTrack
StartTrack: ; 0x037FD968
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end StartTrack

	arm_func_start ReleaseTrackChannelAll
ReleaseTrackChannelAll: ; 0x037FD978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl UpdateTrackChannel
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _037FD9D0
_037FD99C:
	mov r0, r5
	bl SND_IsExChannelActive
	cmp r0, #0
	beq _037FD9CC
	cmp r7, #0
	blt _037FD9C0
	mov r0, r5
	mov r1, r6
	bl SND_SetExChannelRelease
_037FD9C0:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl SND_ReleaseExChannel
_037FD9CC:
	ldr r5, [r5, #0x50]
_037FD9D0:
	cmp r5, #0
	bne _037FD99C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end ReleaseTrackChannelAll

	arm_func_start FreeTrackChannelAll
FreeTrackChannelAll: ; 0x037FD9E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _037FD9FC
_037FD9F0:
	mov r0, r4
	bl SND_FreeExChannel
	ldr r4, [r4, #0x50]
_037FD9FC:
	cmp r4, #0
	bne _037FD9F0
	mov r0, #0
	str r0, [r5, #0x3c]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end FreeTrackChannelAll

	arm_func_start GetPlayerTrack
GetPlayerTrack: ; 0x037FDA14
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _037FDA3C ; =SNDi_Work + 0x780
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_037FDA3C: .word SNDi_Work + 0x780
	arm_func_end GetPlayerTrack

	arm_func_start ClosePlayerTrack
ClosePlayerTrack: ; 0x037FDA40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl GetPlayerTrack
	movs r5, r0
	beq _037FDA8C
	mov r1, r6
	mvn r2, #0
	bl ReleaseTrackChannelAll
	mov r0, r5
	bl FreeTrackChannelAll
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _037FDA94 ; =SNDi_Work + 0x780
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_037FDA8C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FDA94: .word SNDi_Work + 0x780
	arm_func_end ClosePlayerTrack

	arm_func_start FinishPlayer
FinishPlayer: ; 0x037FDA98
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_037FDAA4:
	mov r0, r5
	mov r1, r4
	bl ClosePlayerTrack
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FDAA4
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end FinishPlayer

	arm_func_start ChannelCallback
ChannelCallback: ; 0x037FDAD0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _037FDAF0
	mov r1, #0
	strb r1, [r5, #0x22]
	bl SND_FreeExChannel
_037FDAF0:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _037FDB28
	b _037FDB1C
_037FDB08:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _037FDB28
	mov r1, r0
_037FDB1C:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _037FDB08
_037FDB28:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end ChannelCallback

	arm_func_start UpdateTrackChannel
UpdateTrackChannel: ; 0x037FDB30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #7]
	ldrb r6, [sl, #4]
	ldrb r3, [sl, #5]
	ldrb fp, [r1, #5]
	mov r5, r0, lsl #6
	mov r8, r3, lsl #1
	ldrb r4, [sl, #1]
	ldrsb r7, [sl, #6]
	mov sb, r6, lsl #1
	ldr r0, _037FDC84 ; =SNDi_DecibelTable
	mul r6, r7, r5
	mov r3, fp, lsl #1
	ldrsh sb, [r0, sb]
	ldrsh r7, [r0, r8]
	ldrsh r0, [r0, r3]
	add r8, sb, r7
	ldrsb r3, [sl, #8]
	cmp r4, #0x7f
	mulne r4, r3, r4
	addne r3, r4, #0x40
	mov r4, #0x8000
	ldrsh r5, [sl, #0xc]
	mov sb, r2
	add r2, r5, r6, asr #7
	ldrsh r7, [sl, #0xa]
	ldrsh r1, [r1, #6]
	ldrsb r5, [sl, #9]
	movne r3, r3, asr #7
	add r0, r0, r8
	rsb r4, r4, #0
	cmp r0, r4
	movlt r0, r4
	mov r4, #0x8000
	add r1, r7, r1
	rsb r4, r4, #0
	cmp r1, r4
	movlt r1, r4
	add r3, r3, r5
	mvn r4, #0x7f
	cmp r3, r4
	movlt r3, r4
	blt _037FDBE8
	cmp r3, #0x7f
	movgt r3, #0x7f
_037FDBE8:
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x18
	mov r1, r1, lsl #0x10
	ldr r8, [sl, #0x3c]
	mov r6, r0, asr #0x10
	mov r5, r2, asr #0x10
	mov r4, r3, asr #0x18
	mov r7, r1, asr #0x10
	mov fp, #1
	b _037FDC74
_037FDC14:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _037FDC70
	strh r6, [r8, #0xc]
	strh r5, [r8, #0xe]
	strb r4, [r8, #0xb]
	ldrb r0, [sl, #1]
	strb r0, [r8, #4]
	ldrh r0, [sl, #0x18]
	strh r0, [r8, #0x28]
	ldrh r0, [sl, #0x1a]
	strh r0, [r8, #0x2a]
	ldrh r0, [sl, #0x1c]
	strh r0, [r8, #0x2c]
	ldr r0, [r8, #0x34]
	cmp r0, #0
	bne _037FDC70
	cmp sb, #0
	beq _037FDC70
	mov r0, r8
	strb fp, [r8, #0x22]
	bl SND_ReleaseExChannel
_037FDC70:
	ldr r8, [r8, #0x50]
_037FDC74:
	cmp r8, #0
	bne _037FDC14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FDC84: .word SNDi_DecibelTable
	arm_func_end UpdateTrackChannel

	arm_func_start PlayerSeqMain
PlayerSeqMain: ; 0x037FDC88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_037FDCA4:
	mov r0, r7
	mov r1, sl
	bl GetPlayerTrack
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _037FE7A4
	ldr r0, [r8, #0x3c]
	b _037FDD00
_037FDCC8:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	bne _037FDCFC
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_037FDCFC:
	ldr r0, [r0, #0x50]
_037FDD00:
	cmp r0, #0
	bne _037FDCC8
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _037FDD30
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _037FE788
	bic r0, r1, #0x10
	strb r0, [r8]
_037FDD30:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _037FE788
	ldr r0, [r8, #0x28]
	bl InitCache
	ldr r0, _037FE7CC ; =0x0000FFFF
	sub fp, r0, #0x10000
	b _037FE768
_037FDD60:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl ReadByte
	mov r6, r0
	cmp r6, #0xa2
	bne _037FDD94
	mov r0, r8
	bl ReadByte
	mov r6, r0
	ldrb r0, [r8]
	mov r0, r0, lsl #0x19
	mov r4, r0, lsr #0x1f
_037FDD94:
	cmp r6, #0xa0
	bne _037FDDB0
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r5, #3
	mov sb, #1
_037FDDB0:
	cmp r6, #0xa1
	bne _037FDDCC
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r5, #4
	mov sb, #1
_037FDDCC:
	tst r6, #0x80
	bne _037FE050
	mov r0, r8
	bl ReadByte
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _037FE768
	cmp sb, #0
	movlt sb, #0
	blt _037FDE20
	cmp sb, #0x7f
	movgt sb, #0x7f
_037FDE20:
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _037FE024
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _037FE024
	mov r0, r1, lsl #0x1c
	mov r6, #0
	movs r0, r0, lsr #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strneb sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strneb r0, [r6, #9]
	cmp r6, #0
	bne _037FDF54
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl SND_ReadInstData
	cmp r0, #0
	beq _037FE024
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FE024
_037FDE90: ; jump table
	b _037FE024 ; case 0
	b _037FDEA4 ; case 1
	b _037FDEAC ; case 2
	b _037FDEB4 ; case 3
	b _037FDEA4 ; case 4
_037FDEA4:
	ldr r1, _037FE7CC ; =0x0000FFFF
	b _037FDEB8
_037FDEAC:
	mov r1, #0x3f00
	b _037FDEB8
_037FDEB4:
	mov r1, #0xc000
_037FDEB8:
	ldrh r0, [r8, #0x1e]
	ldr r3, _037FE7D0 ; =ChannelCallback
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	mov r2, r2, lsl #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	mov r2, r2, lsr #0x1f
	add r1, r6, r1
	bl SND_AllocExChannel
	movs r6, r0
	beq _037FE024
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	movne r3, fp
	bne _037FDF0C
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_037FDF0C:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl SND_NoteOn
	cmp r0, #0
	bne _037FDF48
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl SND_FreeExChannel
	b _037FE024
_037FDF48:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_037FDF54:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _037FDF68
	mov r0, r6
	bl SND_SetExChannelAttack
_037FDF68:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _037FDF7C
	mov r0, r6
	bl SND_SetExChannelDecay
_037FDF7C:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _037FDF90
	mov r0, r6
	bl SND_SetExChannelSustain
_037FDF90:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _037FDFA4
	mov r0, r6
	bl SND_SetExChannelRelease
_037FDFA4:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _037FDFD4
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	mov r0, r0, lsl #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_037FDFD4:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _037FE000
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _037FE01C
_037FE000:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xb
	str r0, [r6, #0x18]
_037FE01C:
	mov r0, #0
	str r0, [r6, #0x14]
_037FE024:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FE768
	str r4, [r8, #0x20]
	cmp r4, #0
	ldreqb r0, [r8]
	orreq r0, r0, #0x10
	streqb r0, [r8]
	b _037FE768
_037FE050:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _037FE084
	bge _037FE1CC
	cmp r0, #0x90
	bgt _037FE078
	bge _037FE0F0
	cmp r0, #0x80
	beq _037FE0A8
	b _037FE768
_037FE078:
	cmp r0, #0xb0
	beq _037FE47C
	b _037FE768
_037FE084:
	cmp r0, #0xe0
	bgt _037FE09C
	bge _037FE428
	cmp r0, #0xd0
	beq _037FE1CC
	b _037FE768
_037FE09C:
	cmp r0, #0xf0
	beq _037FE6C4
	b _037FE768
_037FE0A8:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	beq _037FE768
	cmp r6, #0x80
	beq _037FE0DC
	cmp r6, #0x81
	beq _037FE0E4
	b _037FE768
_037FE0DC:
	str r0, [r8, #0x20]
	b _037FE768
_037FE0E4:
	cmp r0, #0x10000
	strlth r0, [r8, #2]
	b _037FE768
_037FE0F0:
	cmp r6, #0x93
	beq _037FE10C
	cmp r6, #0x94
	beq _037FE16C
	cmp r6, #0x95
	beq _037FE188
	b _037FE768
_037FE10C:
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r0, r8
	bl Read24
	cmp r4, #0
	mov sb, r0
	beq _037FE768
	mov r1, r6
	mov r0, r7
	bl GetPlayerTrack
	movs r4, r0
	cmpne r4, r8
	beq _037FE768
	mov r1, r7
	mov r2, fp
	bl ReleaseTrackChannelAll
	mov r0, r4
	bl FreeTrackChannelAll
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl StartTrack
	b _037FE768
_037FE16C:
	mov r0, r8
	bl Read24
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _037FE768
_037FE188:
	mov r0, r8
	bl Read24
	cmp r4, #0
	beq _037FE768
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _037FE768
_037FE1CC:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _037FE768
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _037FE768
_037FE200: ; jump table
	b _037FE3F8 ; case 0
	b _037FE260 ; case 1
	b _037FE278 ; case 2
	b _037FE3E0 ; case 3
	b _037FE3EC ; case 4
	b _037FE284 ; case 5
	b _037FE290 ; case 6
	b _037FE29C ; case 7
	b _037FE35C ; case 8
	b _037FE3A4 ; case 9
	b _037FE2C4 ; case 10
	b _037FE2D0 ; case 11
	b _037FE2DC ; case 12
	b _037FE2E8 ; case 13
	b _037FE3C4 ; case 14
	b _037FE2B8 ; case 15
	b _037FE2F4 ; case 16
	b _037FE300 ; case 17
	b _037FE30C ; case 18
	b _037FE318 ; case 19
	b _037FE324 ; case 20
	b _037FE26C ; case 21
	b _037FE408 ; case 22
	b _037FE390 ; case 23
_037FE260:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _037FE768
_037FE26C:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _037FE768
_037FE278:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _037FE768
_037FE284:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _037FE768
_037FE290:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _037FE768
_037FE29C:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _037FE768
_037FE2B8:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _037FE768
_037FE2C4:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _037FE768
_037FE2D0:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _037FE768
_037FE2DC:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _037FE768
_037FE2E8:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _037FE768
_037FE2F4:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _037FE768
_037FE300:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _037FE768
_037FE30C:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _037FE768
_037FE318:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _037FE768
_037FE324:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
	add r2, r8, r1, lsl #2
	and r1, r0, #0xff
	ldr r0, [r8, #0x28]
	str r0, [r2, #0x2c]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0
	strb r1, [r0, #0x38]
	ldrb r0, [r8, #0x3b]
	add r0, r0, #1
	strb r0, [r8, #0x3b]
	b _037FE768
_037FE35C:
	and r0, r0, #0xff
	mov r1, r0, lsl #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl ReleaseTrackChannelAll
	mov r0, r8
	bl FreeTrackChannelAll
	b _037FE768
_037FE390:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl SetTrackMute
	b _037FE768
_037FE3A4:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _037FE768
_037FE3C4:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _037FE768
_037FE3E0:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _037FE768
_037FE3EC:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _037FE768
_037FE3F8:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _037FE768
_037FE408:
	ldr r1, _037FE7D4 ; =sMmlPrintEnable
	ldr r1, [r1]
	cmp r1, #0
	beq _037FE768
	and r1, r0, #0xff
	mov r0, r7
	bl GetVariablePtr
	b _037FE768
_037FE428:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl ReadArg
	mov r0, r0, lsl #0x10
	cmp r4, #0
	mov r0, r0, asr #0x10
	beq _037FE768
	cmp r6, #0xe0
	beq _037FE474
	cmp r6, #0xe1
	beq _037FE46C
	cmp r6, #0xe3
	streqh r0, [r8, #0x16]
	b _037FE768
_037FE46C:
	strh r0, [r7, #0x18]
	b _037FE768
_037FE474:
	strh r0, [r8, #0x1c]
	b _037FE768
_037FE47C:
	mov r0, r8
	bl ReadByte
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl ReadArg
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov sb, r0, asr #0x10
	mov r0, r7
	bl GetVariablePtr
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _037FE768
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE4D4: ; jump table
	b _037FE50C ; case 0
	b _037FE514 ; case 1
	b _037FE524 ; case 2
	b _037FE534 ; case 3
	b _037FE544 ; case 4
	b _037FE560 ; case 5
	b _037FE584 ; case 6
	b _037FE768 ; case 7
	b _037FE5BC ; case 8
	b _037FE5E8 ; case 9
	b _037FE614 ; case 10
	b _037FE640 ; case 11
	b _037FE66C ; case 12
	b _037FE698 ; case 13
_037FE50C:
	strh sb, [r4]
	b _037FE768
_037FE514:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE524:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE534:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _037FE768
_037FE544:
	cmp sb, #0
	beq _037FE768
	mov r1, sb
	ldrsh r0, [r4]
	bl _s32_div_f
	strh r0, [r4]
	b _037FE768
_037FE560:
	cmp sb, #0
	ldrgesh r0, [r4]
	movge r0, r0, lsl sb
	strgeh r0, [r4]
	ldrltsh r1, [r4]
	rsblt r0, sb, #0
	movlt r0, r1, asr r0
	strlth r0, [r4]
	b _037FE768
_037FE584:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	mov r6, #0
	movlt sb, r0, asr #0x10
	movlt r6, #1
	bl SND_CalcRandom
	add r1, sb, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _037FE768
_037FE5BC:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE5E8:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE614:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE640:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE66C:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE698:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE6C4:
	cmp r4, #0
	beq _037FE768
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE6DC: ; jump table
	b _037FE714 ; case 0
	b _037FE6EC ; case 1
	b _037FE768 ; case 2
	b _037FE760 ; case 3
_037FE6EC:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _037FE768
_037FE714:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _037FE748
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldreqb r0, [r8, #0x3b]
	subeq r0, r0, #1
	streqb r0, [r8, #0x3b]
	beq _037FE768
_037FE748:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _037FE768
_037FE760:
	mvn r0, #0
	b _037FE788
_037FE768:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _037FE784
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _037FDD60
_037FE784:
	mov r0, #0
_037FE788:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _037FE7A4
	mov r0, r7
	mov r1, sl
	bl ClosePlayerTrack
_037FE7A4:
	add sl, sl, #1
	cmp sl, #0x10
	blt _037FDCA4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FE7CC: .word 0x0000FFFF
_037FE7D0: .word ChannelCallback
_037FE7D4: .word sMmlPrintEnable
	arm_func_end PlayerSeqMain

	arm_func_start GetVariablePtr
GetVariablePtr: ; 0x037FE7D8
	ldr r2, _037FE818 ; =SNDi_SharedWork
	ldr r3, [r2]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r1, #0x10
	addge r2, r3, #0x260
	subge r0, r1, #0x10
	addge r0, r2, r0, lsl #1
	bxge lr
	ldrb r2, [r0, #1]
	add r3, r3, #0x20
	mov r0, #0x24
	mla r0, r2, r0, r3
	add r0, r0, r1, lsl #1
	bx lr
	.align 2, 0
_037FE818: .word SNDi_SharedWork
	arm_func_end GetVariablePtr

	arm_func_start AllocTrack
AllocTrack: ; 0x037FE81C
	ldr ip, _037FE85C ; =SNDi_Work + 0x780
	mov r0, #0
	b _037FE84C
_037FE828:
	ldrb r1, [ip, r0, lsl #6]
	mov r3, r0, lsl #6
	mov r2, r1, lsl #0x1f
	movs r2, r2, lsr #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	streqb r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_037FE84C:
	cmp r0, #0x20
	blt _037FE828
	mvn r0, #0
	bx lr
	.align 2, 0
_037FE85C: .word SNDi_Work + 0x780
	arm_func_end AllocTrack

	arm_func_start SetTrackMute
SetTrackMute: ; 0x037FE860
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _037FE8D8
_037FE874: ; jump table
	b _037FE884 ; case 0
	b _037FE894 ; case 1
	b _037FE8A4 ; case 2
	b _037FE8BC ; case 3
_037FE884:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE894:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE8A4:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl ReleaseTrackChannelAll
	b _037FE8D8
_037FE8BC:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl ReleaseTrackChannelAll
	mov r0, r4
	bl FreeTrackChannelAll
_037FE8D8:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SetTrackMute

	arm_func_start SND_ReadInstData
SND_ReadInstData: ; 0x037FE8E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _037FEA58
	bl SNDi_LockMutex
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _037FE918
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FE918:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	mov r1, r1, lsr #8
	addls pc, pc, r0, lsl #2
	b _037FEA44
_037FE938: ; jump table
	b _037FEA44 ; case 0
	b _037FE980 ; case 1
	b _037FE980 ; case 2
	b _037FE980 ; case 3
	b _037FE980 ; case 4
	b _037FE980 ; case 5
	b _037FEA44 ; case 6
	b _037FEA44 ; case 7
	b _037FEA44 ; case 8
	b _037FEA44 ; case 9
	b _037FEA44 ; case 10
	b _037FEA44 ; case 11
	b _037FEA44 ; case 12
	b _037FEA44 ; case 13
	b _037FEA44 ; case 14
	b _037FEA44 ; case 15
	b _037FE9A0 ; case 16
	b _037FE9F0 ; case 17
_037FE980:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_037FE98C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _037FE98C
	b _037FEA50
_037FE9A0:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _037FE9BC
	cmp r5, r1
	ble _037FE9C8
_037FE9BC:
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FE9C8:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_037FE9DC:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FE9DC
	b _037FEA50
_037FE9F0:
	add r2, r6, r1
	mov r1, #0
	b _037FEA14
_037FE9FC:
	add r1, r1, #1
	cmp r1, #8
	blt _037FEA14
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FEA14:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _037FE9FC
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_037FEA30:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FEA30
	b _037FEA50
_037FEA44:
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FEA50:
	bl SNDi_UnlockMutex
	mov r0, #1
_037FEA58:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end SND_ReadInstData

	arm_func_start SND_GetWaveDataAddress
SND_GetWaveDataAddress: ; 0x037FEA60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl SNDi_LockMutex
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _037FEA8C
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _037FEA90
_037FEA8C:
	mov r4, #0
_037FEA90:
	bl SNDi_UnlockMutex
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end SND_GetWaveDataAddress

	arm_func_start SND_NoteOn
SND_NoteOn: ; 0x037FEAA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, [sp, #0x24]
	mov sb, r0
	ldrb r4, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, #0xff
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mvneq r6, #0
	moveq r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FEB80
_037FEAD8: ; jump table
	b _037FEB80 ; case 0
	b _037FEAEC ; case 1
	b _037FEB5C ; case 2
	b _037FEB70 ; case 3
	b _037FEAEC ; case 4
_037FEAEC:
	cmp r0, #1
	bne _037FEB30
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _037FEB3C
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _037FEB3C
	bl SND_GetWaveDataAddress
	mov r1, r0
	b _037FEB3C
_037FEB30:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_037FEB3C:
	cmp r1, #0
	moveq r0, #0
	beq _037FEB84
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl SND_StartExChannelPcm
	b _037FEB84
_037FEB5C:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl SND_StartExChannelPsg
	b _037FEB84
_037FEB70:
	mov r0, sb
	mov r1, r6
	bl SND_StartExChannelNoise
	b _037FEB84
_037FEB80:
	mov r0, #0
_037FEB84:
	cmp r0, #0
	moveq r0, #0
	beq _037FEBE0
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl SND_SetExChannelAttack
	ldrb r1, [r5, #8]
	mov r0, sb
	bl SND_SetExChannelDecay
	ldrb r1, [r5, #9]
	mov r0, sb
	bl SND_SetExChannelSustain
	mov r0, sb
	mov r1, r4
	bl SND_SetExChannelRelease
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_037FEBE0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end SND_NoteOn

	arm_func_start SND_SetPlayerLocalVariable
SND_SetPlayerLocalVariable: ; 0x037FEBE8
	ldr ip, _037FEC04 ; =SNDi_SharedWork
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_037FEC04: .word SNDi_SharedWork
	arm_func_end SND_SetPlayerLocalVariable

	arm_func_start SND_SetPlayerGlobalVariable
SND_SetPlayerGlobalVariable: ; 0x037FEC08
	ldr r2, _037FEC20 ; =SNDi_SharedWork
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_037FEC20: .word SNDi_SharedWork
	arm_func_end SND_SetPlayerGlobalVariable

	arm_func_start SND_UpdateSharedWork
SND_UpdateSharedWork: ; 0x037FEC24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _037FECB8 ; =SNDi_SharedWork
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _037FECB0
	mov r7, r4
	mov r6, #1
_037FEC48:
	mov r0, r7
	bl SND_IsChannelActive
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	movne r0, r0, lsl #0x10
	add r7, r7, #1
	movne r4, r0, lsr #0x10
	cmp r7, #0x10
	blt _037FEC48
	mov r0, #0
	bl SND_IsCaptureActive
	cmp r0, #0
	orrne r0, r5, #1
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	mov r0, #1
	bl SND_IsCaptureActive
	cmp r0, #0
	orrne r0, r5, #2
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	ldr r0, _037FECB8 ; =SNDi_SharedWork
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_037FECB0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FECB8: .word SNDi_SharedWork
	arm_func_end SND_UpdateSharedWork

	arm_func_start SND_AlarmInit
SND_AlarmInit: ; 0x037FECBC
	ldr r1, _037FECE4 ; =SNDi_Work
	mov r3, #0
	mov r2, r3
_037FECC8:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _037FECC8
	bx lr
	.align 2, 0
_037FECE4: .word SNDi_Work
	arm_func_end SND_AlarmInit

	arm_func_start SND_SetupAlarm
SND_SetupAlarm: ; 0x037FECE8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr lr, _037FED40 ; =SNDi_Work + 0xF80
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _037FED20
	add r0, r8, #0x14
	bl OS_CancelAlarm
	mov r0, #0
	strb r0, [r8]
_037FED20:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FED40: .word SNDi_Work + 0xF80
	arm_func_end SND_SetupAlarm

	arm_func_start SND_StartAlarm
SND_StartAlarm: ; 0x037FED44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _037FEDF8 ; =SNDi_Work + 0xF80
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _037FED74
	add r0, r8, #0x14
	bl OS_CancelAlarm
	mov r0, #0
	strb r0, [r8]
_037FED74:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl OS_CreateAlarm
	cmp r6, #0
	cmpeq r7, #0
	bne _037FEDBC
	ldr r3, _037FEDFC ; =AlarmHandler
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl OS_SetAlarm
	b _037FEDE4
_037FEDBC:
	bl OS_GetTick
	ldr r2, _037FEDFC ; =AlarmHandler
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl OS_SetPeriodicAlarm
_037FEDE4:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FEDF8: .word SNDi_Work + 0xF80
_037FEDFC: .word AlarmHandler
	arm_func_end SND_StartAlarm

	arm_func_start SND_StopAlarm
SND_StopAlarm: ; 0x037FEE00
	stmdb sp!, {r4, lr}
	ldr r2, _037FEE3C ; =SNDi_Work + 0xF80
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _037FEE34
	add r0, r4, #0x14
	bl OS_CancelAlarm
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_037FEE34:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEE3C: .word SNDi_Work + 0xF80
	arm_func_end SND_StopAlarm

	arm_func_start AlarmHandler
AlarmHandler: ; 0x037FEE40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_037FEE50:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _037FEE50
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end AlarmHandler

	arm_func_start SND_CommandInit
SND_CommandInit: ; 0x037FEE70
	stmdb sp!, {r3, lr}
	ldr r0, _037FEEA4 ; =sCommandMesgQueue
	ldr r1, _037FEEA8 ; =sCommandMesgBuffer
	mov r2, #8
	bl OS_InitMessageQueue
	ldr r1, _037FEEAC ; =PxiFifoCallback
	mov r0, #7
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FEEB0 ; =SNDi_SharedWork
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FEEA4: .word sCommandMesgQueue
_037FEEA8: .word sCommandMesgBuffer
_037FEEAC: .word PxiFifoCallback
_037FEEB0: .word SNDi_SharedWork
	arm_func_end SND_CommandInit

	arm_func_start SND_CommandProc
SND_CommandProc: ; 0x037FEEB4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _037FF52C
_037FEEC0:
	ldr sl, _037FF550 ; =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _037FF510
_037FEED0:
	add r5, sp, #0x1c
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _037FF50C
_037FEEF4: ; jump table
	b _037FEF7C ; case 0
	b _037FEF94 ; case 1
	b _037FEFA0 ; case 2
	b _037FEFB8 ; case 3
	b _037FEFC4 ; case 4
	b _037FEFD4 ; case 5
	b _037FEFE4 ; case 6
	b _037FEFFC ; case 7
	b _037FF024 ; case 8
	b _037FF038 ; case 9
	b _037FF04C ; case 10
	b _037FF068 ; case 11
	b _037FF080 ; case 12
	b _037FF148 ; case 13
	b _037FF324 ; case 14
	b _037FF3A4 ; case 15
	b _037FF3DC ; case 16
	b _037FF1EC ; case 17
	b _037FF234 ; case 18
	b _037FF25C ; case 19
	b _037FF29C ; case 20
	b _037FF2E4 ; case 21
	b _037FF40C ; case 22
	b _037FF418 ; case 23
	b _037FF424 ; case 24
	b _037FF430 ; case 25
	b _037FF448 ; case 26
	b _037FF458 ; case 27
	b _037FF468 ; case 28
	b _037FF4A8 ; case 29
	b _037FF478 ; case 30
	b _037FF488 ; case 31
	b _037FF498 ; case 32
	b _037FF4B8 ; case 33
_037FEF7C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_StartSeq
	b _037FF50C
_037FEF94:
	ldr r0, [sp, #0x24]
	bl SND_StopSeq
	b _037FF50C
_037FEFA0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_PrepareSeq
	b _037FF50C
_037FEFB8:
	ldr r0, [sp, #0x24]
	bl SND_StartPreparedSeq
	b _037FF50C
_037FEFC4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_PauseSeq
	b _037FF50C
_037FEFD4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_SkipSeq
	b _037FF50C
_037FEFE4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SNDi_SetPlayerParam
	b _037FF50C
_037FEFFC:
	ldr r1, [sp, #0x24]
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SNDi_SetTrackParam
	b _037FF50C
_037FF024:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl SND_SetTrackMute
	b _037FF50C
_037FF038:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl SND_SetTrackAllocatableChannel
	b _037FF50C
_037FF04C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl SND_SetPlayerLocalVariable
	b _037FF50C
_037FF068:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl SND_SetPlayerGlobalVariable
	b _037FF50C
_037FF080:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov r8, r0
	mov r2, #0
	b _037FF0BC
_037FF09C:
	tst r5, #1
	movne r0, r2, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strneb r1, [r0, #0x403]
	mov r5, r5, lsr #1
_037FF0BC:
	cmp r2, #0x10
	bge _037FF0CC
	cmp r5, #0
	bne _037FF09C
_037FF0CC:
	tst r6, #1
	beq _037FF0F8
	tst r6, #2
	ldrneh r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strneh r0, [r4]
	ldreqb r0, [r4]
	orreq r0, r0, #0x80
	streqb r0, [r4]
	b _037FF108
_037FF0F8:
	tst r6, #2
	ldrneb r0, [sl]
	orrne r0, r0, #0x80
	strneb r0, [sl]
_037FF108:
	mov r5, #0
	b _037FF128
_037FF110:
	tst r7, #1
	beq _037FF120
	mov r0, r5
	bl SND_StartAlarm
_037FF120:
	add r5, r5, #1
	mov r7, r7, lsr #1
_037FF128:
	cmp r5, #8
	bge _037FF138
	cmp r7, #0
	bne _037FF110
_037FF138:
	mov r0, r8
	bl OS_RestoreInterrupts
	bl SND_UpdateSharedWork
	b _037FF50C
_037FF148:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov fp, r0
	mov r8, #0
	b _037FF180
_037FF168:
	tst r7, #1
	beq _037FF178
	mov r0, r8
	bl SND_StopAlarm
_037FF178:
	add r8, r8, #1
	mov r7, r7, lsr #1
_037FF180:
	cmp r8, #8
	bge _037FF190
	cmp r7, #0
	bne _037FF168
_037FF190:
	mov r7, #0
	b _037FF1B4
_037FF198:
	tst r5, #1
	beq _037FF1AC
	mov r0, r7
	mov r1, sb
	bl SND_StopChannel
_037FF1AC:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF1B4:
	cmp r7, #0x10
	bge _037FF1C4
	cmp r5, #0
	bne _037FF198
_037FF1C4:
	tst r6, #1
	movne r0, #0
	strneb r0, [r4]
	tst r6, #2
	movne r0, #0
	strneb r0, [sl]
	mov r0, fp
	bl OS_RestoreInterrupts
	bl SND_UpdateSharedWork
	b _037FF50C
_037FF1EC:
	ldr r1, [sp, #0x2c]
	mov r0, r1, lsr #0x1d
	and r0, r0, #1
	str r0, [sp]
	mov r0, r1, lsr #0x1c
	and r0, r0, #1
	str r0, [sp, #4]
	mov r0, r1, lsr #0x1b
	and r0, r0, #1
	str r0, [sp, #8]
	mov r0, r1, lsr #0x1f
	and r0, r0, #1
	mov r1, r1, lsr #0x1e
	and r1, r1, #1
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl SND_SetupCapture
	b _037FF50C
_037FF234:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_SetupAlarm
	b _037FF50C
_037FF25C:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF288
_037FF26C:
	tst r5, #1
	beq _037FF280
	mov r0, r7
	mov r1, r6
	bl SND_SetChannelTimer
_037FF280:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF288:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF26C
	b _037FF50C
_037FF29C:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _037FF2D0
_037FF2B0:
	tst r5, #1
	beq _037FF2C8
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl SND_SetChannelVolume
_037FF2C8:
	add r8, r8, #1
	mov r5, r5, lsr #1
_037FF2D0:
	cmp r8, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2B0
	b _037FF50C
_037FF2E4:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF310
_037FF2F4:
	tst r5, #1
	beq _037FF308
	mov r0, r7
	mov r1, r6
	bl SND_SetChannelPan
_037FF308:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF310:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2F4
	b _037FF50C
_037FF324:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	mov r1, r3, lsl #0x10
	ldr r2, [sp, #0x2c]
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldr r1, _037FF554 ; =0x003FFFFF
	and r1, r2, r1
	str r1, [sp, #4]
	mov r1, r2, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #8]
	mov r1, r2, lsr #0x16
	and r1, r1, #3
	str r1, [sp, #0xc]
	mov r1, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #0x10]
	mov r1, r3, lsr #0x10
	mov r2, r3, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x28]
	mov r0, r0, lsl #0x10
	mov r3, r3, lsr #0x1a
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf8000000
	and r2, r2, #3
	and r3, r3, #3
	bl SND_SetupChannelPcm
	b _037FF50C
_037FF3A4:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	str r0, [sp]
	and r0, r1, #0x7f
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	and r2, r3, #0x7f
	mov r3, r3, lsr #8
	and r3, r3, #3
	bl SND_SetupChannelPsg
	b _037FF50C
_037FF3DC:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	and r0, r1, #0x7f
	str r0, [sp]
	mov r0, r1, lsl #8
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0x24]
	and r1, r2, #0x7f
	mov r2, r2, lsr #8
	and r2, r2, #3
	bl SND_SetupChannelNoise
	b _037FF50C
_037FF40C:
	ldr r0, [sp, #0x24]
	bl SNDi_SetSurroundDecay
	b _037FF50C
_037FF418:
	ldr r0, [sp, #0x24]
	bl SND_SetMasterVolume
	b _037FF50C
_037FF424:
	ldr r0, [sp, #0x24]
	bl SND_SetMasterPan
	b _037FF50C
_037FF430:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_SetOutputSelector
	b _037FF50C
_037FF448:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_LockChannel
	b _037FF50C
_037FF458:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_UnlockChannel
	b _037FF50C
_037FF468:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_StopUnlockedChannel
	b _037FF50C
_037FF478:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateSeq
	b _037FF50C
_037FF488:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateBank
	b _037FF50C
_037FF498:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateWave
	b _037FF50C
_037FF4A8:
	ldr r1, [sp, #0x24]
	ldr r0, _037FF558 ; =SNDi_SharedWork
	str r1, [r0]
	b _037FF50C
_037FF4B8:
	ldr r5, [sp, #0x24]
	ldr r0, _037FF55C ; =SNDi_Work
	mov r1, r5
	mov r2, #0x1180
	bl MIi_CpuCopy32
	ldr r0, _037FF55C ; =SNDi_Work
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_037FF4DC:
	mov r0, r6
	bl SND_GetChannelControl
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FF4DC
	mov r0, #0
	bl SND_GetLockedChannel
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_037FF50C:
	ldr r6, [sp, #0x1c]
_037FF510:
	cmp r6, #0
	bne _037FEED0
	ldr r0, _037FF558 ; =SNDi_SharedWork
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_037FF52C:
	ldr r0, _037FF560 ; =sCommandMesgQueue
	add r1, sp, #0x18
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _037FEEC0
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF550: .word 0x04000509
_037FF554: .word 0x003FFFFF
_037FF558: .word SNDi_SharedWork
_037FF55C: .word SNDi_Work
_037FF560: .word sCommandMesgQueue
	arm_func_end SND_CommandProc

	arm_func_start PxiFifoCallback
PxiFifoCallback: ; 0x037FF564
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl OS_DisableInterrupts
	mov r4, r0
	cmp r5, #0x2000000
	blo _037FF590
	ldr r0, _037FF5AC ; =sCommandMesgQueue
	mov r1, r5
	mov r2, #0
	bl OS_SendMessage
	b _037FF59C
_037FF590:
	cmp r5, #0
	bne _037FF59C
	bl SND_SendWakeupMessage
_037FF59C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FF5AC: .word sCommandMesgQueue
	arm_func_end PxiFifoCallback

	arm_func_start FS_Init
FS_Init: ; 0x037FF5B0
	ldr ip, _037FF5B8 ; =CARD_Init
	bx ip
	.align 2, 0
_037FF5B8: .word CARD_Init
	arm_func_end FS_Init

	arm_func_start CARDi_InitCommon
CARDi_InitCommon: ; 0x037FF5BC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _037FF660 ; =cardi_common
	mov r2, #0
	mvn r1, #2
	str r1, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0xf0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x1c]
	str r2, [r4]
	str r2, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x14]
	str r2, [r4, #0xf8]
	str r2, [r4, #0xf4]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0xf0]
	ldr r1, _037FF664 ; =CARDi_TaskThread
	ldr r3, _037FF668 ; =status_checked$3825
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
	ldr r1, _037FF66C ; =CARDi_OnFifoRecv
	mov r0, #0xb
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FF670 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF674 ; =CARDi_EnableFlag
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FF660: .word cardi_common
_037FF664: .word CARDi_TaskThread
_037FF668: .word status_checked$3825
_037FF66C: .word CARDi_OnFifoRecv
_037FF670: .word 0x027FFC40
_037FF674: .word CARDi_EnableFlag
	arm_func_end CARDi_InitCommon

	arm_func_start CARD_SetThreadPriority
CARD_SetThreadPriority: ; 0x037FF678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _037FF6B4 ; =cardi_common
	mov r7, r0
	bl OS_DisableInterrupts
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl OS_SetThreadPriority
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FF6B4: .word cardi_common
	arm_func_end CARD_SetThreadPriority

	arm_func_start CARD_GetRomHeader
CARD_GetRomHeader: ; 0x037FF6B8
	ldr r0, _037FF6C0 ; =0x027FFA80
	bx lr
	.align 2, 0
_037FF6C0: .word 0x027FFA80
	arm_func_end CARD_GetRomHeader

	arm_func_start CARDi_CommandEnd
CARDi_CommandEnd: ; 0x037FF6C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _037FF75C
	cmp r5, #0
	beq _037FF6E4
	bl OS_Sleep
_037FF6E4:
	cmp r4, #0
	beq _037FF738
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _037FF718
_037FF700:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl OS_Sleep
	sub r7, r7, r8
_037FF718:
	bl CARDi_CommandReadStatus
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _037FF738
	cmp r7, #0
	bgt _037FF700
_037FF738:
	bl CARDi_CommandReadStatus
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF764 ; =cardi_common
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_037FF75C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FF764: .word cardi_common
	arm_func_end CARDi_CommandEnd

	arm_func_start CARDi_CommandReadStatus
CARDi_CommandReadStatus: ; 0x037FF768
	stmdb sp!, {r3, lr}
	ldr ip, _037FF7AC ; =status_checked$3825
	mov lr, #2
	ldr r0, _037FF7B0 ; =arg$3983
	ldr r3, _037FF7B4 ; =CARDi_CommWriteCore
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl CARDi_CommArray
	ldr r3, _037FF7B8 ; =CARDi_CommReadCore
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl CARDi_CommArray
	ldrb r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7AC: .word status_checked$3825
_037FF7B0: .word arg$3983
_037FF7B4: .word CARDi_CommWriteCore
_037FF7B8: .word CARDi_CommReadCore
	arm_func_end CARDi_CommandReadStatus

	arm_func_start CARDi_WaitPrevCommand
CARDi_WaitPrevCommand: ; 0x037FF7BC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl CARDi_CommandEnd
	ldr r0, _037FF7F4 ; =cardi_common
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	moveq r0, #6
	streq r0, [r1]
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7F4: .word cardi_common
	arm_func_end CARDi_WaitPrevCommand

	arm_func_start CARDi_CommArray
CARDi_CommArray: ; 0x037FF7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FF9B0 ; =cardi_param
	ldr r6, _037FF9B4 ; =0x0000A040
	ldr r5, _037FF9B8 ; =0x040001A0
	stmib r4, {r0, r1}
	mov r8, r2
	mov r7, r3
	strh r6, [r5]
	b _037FF98C
_037FF81C:
	ldr r0, _037FF9BC ; =_03806AF4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FF92C
	ldr r0, _037FF9C0 ; =cardi_common
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r0, r0, asr #0x10
	and r0, r0, #0xff
	cmp r0, #0xff
	bne _037FF92C
	bl OS_GetTick
	ldr fp, _037FF9BC ; =_03806AF4
	mov r5, r0
	mov r6, r1
	mov sb, #0xfa00
_037FF85C:
	bl OS_GetTick
	mov r3, #0
	subs sl, r0, r5
	sbc lr, r1, r6
	mov ip, r3
	umull r0, r1, sl, sb
	mla r1, sl, ip, r1
	mla r1, lr, sb, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl _ll_udiv
	ldrb r2, [fp]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF85C
	ldr r0, _037FF9C8 ; =0x0000A042
	ldr r1, _037FF9B8 ; =0x040001A0
	strh r0, [r1]
_037FF8A0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8A0
	ldr r0, _037FF9CC ; =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_037FF8BC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8BC
	ldr r1, _037FF9CC ; =0x040001A2
	ldr r0, _037FF9BC ; =_03806AF4
	ldrh r2, [r1]
	mov r1, #0
	strh r2, [sp]
	str r1, [r0, #4]
	bl OS_GetTick
	mov r6, r0
	mov sb, r1
	mov r5, #0xfa00
_037FF8F0:
	bl OS_GetTick
	mov r3, #0
	subs ip, r0, r6
	sbc fp, r1, sb
	mov sl, r3
	umull r0, r1, ip, r5
	mla r1, ip, sl, r1
	mla r1, fp, r5, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl _ll_udiv
	ldr r2, _037FF9BC ; =_03806AF4
	ldrb r2, [r2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF8F0
_037FF92C:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	ldrne r1, _037FF9B4 ; =0x0000A040
	ldrne r0, _037FF9B8 ; =0x040001A0
	strneh r1, [r0]
	bne _037FF960
	ldr r1, _037FF9B8 ; =0x040001A0
	mov r2, #0xa000
	strh r2, [r1]
	ldr r0, _037FF9BC ; =_03806AF4
	mov r1, #1
	str r1, [r0, #4]
_037FF960:
	ldr r1, _037FF9B8 ; =0x040001A0
_037FF964:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF964
	mov r0, r4
	mov lr, pc
	bx r7
	ldr r0, [r4]
	cmp r0, #0
	beq _037FF994
	sub r8, r8, #1
_037FF98C:
	cmp r8, #0
	bne _037FF81C
_037FF994:
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FF9B8 ; =0x040001A0
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF9B0: .word cardi_param
_037FF9B4: .word 0x0000A040
_037FF9B8: .word 0x040001A0
_037FF9BC: .word _03806AF4
_037FF9C0: .word cardi_common
_037FF9C4: .word 0x000082EA
_037FF9C8: .word 0x0000A042
_037FF9CC: .word 0x040001A2
	arm_func_end CARDi_CommArray

	arm_func_start CARDi_CommReadCore
CARDi_CommReadCore: ; 0x037FF9D0
	ldr r1, _037FFA0C ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FF9E0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FF9E0
	ldr r2, _037FFA0C ; =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_037FFA0C: .word 0x040001A2
	arm_func_end CARDi_CommReadCore

	arm_func_start CARDi_CommWriteCore
CARDi_CommWriteCore: ; 0x037FFA10
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _037FFA5C ; =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_037FFA38:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FFA38
	ldr r0, _037FFA5C ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.align 2, 0
_037FFA5C: .word 0x040001A2
	arm_func_end CARDi_CommWriteCore

	arm_func_start CARDi_CommVerifyCore
CARDi_CommVerifyCore: ; 0x037FFA60
	ldr r1, _037FFAC0 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FFA70:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FFA70
	ldr r2, _037FFAC0 ; =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _037FFAB0
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_037FFAB0:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_037FFAC0: .word 0x040001A2
	arm_func_end CARDi_CommVerifyCore

	arm_func_start CARDi_WriteEnable
CARDi_WriteEnable: ; 0x037FFAC4
	stmdb sp!, {r3, lr}
	ldr ip, _037FFAEC ; =status_checked$3825
	mov r2, #1
	ldr r0, _037FFAF0 ; =buf$3759
	ldr r3, _037FFAF4 ; =CARDi_CommWriteCore
	mov r1, #0
	str r2, [ip, #4]
	bl CARDi_CommArray
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFAEC: .word status_checked$3825
_037FFAF0: .word buf$3759
_037FFAF4: .word CARDi_CommWriteCore
	arm_func_end CARDi_WriteEnable

	arm_func_start CARDi_SendSpiAddressingCommand
CARDi_SendSpiAddressingCommand: ; 0x037FFAF8
	stmdb sp!, {r3, lr}
	ldr r2, _037FFB90 ; =cardi_common
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _037FFB24
	cmp r2, #2
	beq _037FFB40
	cmp r2, #3
	beq _037FFB58
	b _037FFB74
_037FFB24:
	mov r3, r0, lsr #5
	and r3, r3, #8
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _037FFB74
_037FFB40:
	and r3, r0, #0xff00
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _037FFB74
_037FFB58:
	mov r3, r0, lsr #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_037FFB74:
	ldr r3, _037FFB94 ; =CARDi_CommWriteCore
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl CARDi_CommArray
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFB90: .word cardi_common
_037FFB94: .word CARDi_CommWriteCore
	arm_func_end CARDi_SendSpiAddressingCommand

	arm_func_start CARDi_InitStatusRegister
CARDi_InitStatusRegister: ; 0x037FFB98
	stmdb sp!, {r4, lr}
	ldr r0, _037FFBE8 ; =cardi_common
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _037FFBE0
	ldr r0, _037FFBEC ; =status_checked$3825
	ldr r0, [r0]
	cmp r0, #0
	bne _037FFBE0
	bl CARDi_CommandReadStatus
	cmp r4, r0
	beq _037FFBD4
	mov r0, r4
	bl CARDi_SetWriteProtectCore
_037FFBD4:
	ldr r0, _037FFBEC ; =status_checked$3825
	mov r1, #1
	str r1, [r0]
_037FFBE0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFBE8: .word cardi_common
_037FFBEC: .word status_checked$3825
	arm_func_end CARDi_InitStatusRegister

	arm_func_start CARDi_ReadBackupCore
CARDi_ReadBackupCore: ; 0x037FFBF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFC48
	ldr r0, _037FFC50 ; =cardi_common
	ldr r2, _037FFC54 ; =status_checked$3825
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFC58 ; =CARDi_CommReadCore
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl CARDi_CommArray
_037FFC48:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FFC50: .word cardi_common
_037FFC54: .word status_checked$3825
_037FFC58: .word CARDi_CommReadCore
	arm_func_end CARDi_ReadBackupCore

	arm_func_start CARDi_ProgramBackupCore
CARDi_ProgramBackupCore: ; 0x037FFC5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFD00
	ldr r0, _037FFD08 ; =cardi_common
	ldr fp, _037FFD0C ; =status_checked$3825
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFCF8
_037FFC90:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl CARDi_WriteEnable
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFD10 ; =CARDi_CommWriteCore
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl CARDi_CommArray
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl CARDi_CommandEnd
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFD00
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFCF8:
	cmp r8, #0
	bne _037FFC90
_037FFD00:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFD08: .word cardi_common
_037FFD0C: .word status_checked$3825
_037FFD10: .word CARDi_CommWriteCore
	arm_func_end CARDi_ProgramBackupCore

	arm_func_start CARDi_WriteBackupCore
CARDi_WriteBackupCore: ; 0x037FFD14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFDB8
	ldr r0, _037FFDC0 ; =cardi_common
	ldr fp, _037FFDC4 ; =status_checked$3825
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFDB0
_037FFD48:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl CARDi_WriteEnable
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFDC8 ; =CARDi_CommWriteCore
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl CARDi_CommArray
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl CARDi_CommandEnd
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFDB8
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFDB0:
	cmp r8, #0
	bne _037FFD48
_037FFDB8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFDC0: .word cardi_common
_037FFDC4: .word status_checked$3825
_037FFDC8: .word CARDi_CommWriteCore
	arm_func_end CARDi_WriteBackupCore

	arm_func_start CARDi_VerifyBackupCore
CARDi_VerifyBackupCore: ; 0x037FFDCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFE48
	ldr r0, _037FFE50 ; =cardi_common
	ldr r2, _037FFE54 ; =status_checked$3825
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFE58 ; =CARDi_CommVerifyCore
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl CARDi_CommArray
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FFE54 ; =status_checked$3825
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_037FFE48:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FFE50: .word cardi_common
_037FFE54: .word status_checked$3825
_037FFE58: .word CARDi_CommVerifyCore
	arm_func_end CARDi_VerifyBackupCore

	arm_func_start CARDi_EraseBackupSectorCore
CARDi_EraseBackupSectorCore: ; 0x037FFE5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFEF0 ; =cardi_common
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFEE8
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFEE8
	ldr r8, _037FFEF4 ; =status_checked$3825
	mov sb, #0xd8
	b _037FFEE0
_037FFEA4:
	bl CARDi_WriteEnable
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl CARDi_SendSpiAddressingCommand
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl CARDi_CommandEnd
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFEE8
	add r7, r7, r5
	sub r6, r6, r5
_037FFEE0:
	cmp r6, #0
	bne _037FFEA4
_037FFEE8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFEF0: .word cardi_common
_037FFEF4: .word status_checked$3825
	arm_func_end CARDi_EraseBackupSectorCore

	arm_func_start CARDi_EraseBackupSubSectorCore
CARDi_EraseBackupSubSectorCore: ; 0x037FFEF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFF8C ; =cardi_common
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFF84
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFF84
	ldr r8, _037FFF90 ; =status_checked$3825
	mov sb, #0x20
	b _037FFF7C
_037FFF40:
	bl CARDi_WriteEnable
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl CARDi_SendSpiAddressingCommand
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl CARDi_CommandEnd
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFF84
	add r7, r7, r5
	sub r6, r6, r5
_037FFF7C:
	cmp r6, #0
	bne _037FFF40
_037FFF84:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFF8C: .word cardi_common
_037FFF90: .word status_checked$3825
	arm_func_end CARDi_EraseBackupSubSectorCore

	arm_func_start CARDi_EraseChipCore
CARDi_EraseChipCore: ; 0x037FFF94
	stmdb sp!, {r4, lr}
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFFD8
	ldr r0, _037FFFE0 ; =cardi_common
	ldr r4, [r0]
	bl CARDi_WriteEnable
	ldr r1, _037FFFE4 ; =status_checked$3825
	mov r2, #1
	ldr r0, _037FFFE8 ; =arg$3806
	ldr r3, _037FFFEC ; =CARDi_CommWriteCore
	str r2, [r1, #4]
	mov r1, #0
	bl CARDi_CommArray
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl CARDi_CommandEnd
_037FFFD8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFFE0: .word cardi_common
_037FFFE4: .word status_checked$3825
_037FFFE8: .word arg$3806
_037FFFEC: .word CARDi_CommWriteCore
	arm_func_end CARDi_EraseChipCore

	arm_func_start CARDi_SetWriteProtectCore
CARDi_SetWriteProtectCore: ; 0x037FFFF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _03800074
	ldr r0, _0380007C ; =cardi_common
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _03800080 ; =CARDi_CommWriteCore
	ldr r4, _03800084 ; =status_checked$3825
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_03800034:
	bl CARDi_WriteEnable
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl CARDi_CommArray
	mov r0, fp
	mov r1, #0
	bl CARDi_CommandEnd
	ldr r0, [sb]
	cmp r0, #4
	bne _03800074
	sub sl, sl, #1
	cmp sl, #0
	bgt _03800034
_03800074:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0380007C: .word cardi_common
_03800080: .word CARDi_CommWriteCore
_03800084: .word status_checked$3825
	arm_func_end CARDi_SetWriteProtectCore

	arm_func_start CARDi_SetRomOp
CARDi_SetRomOp: ; 0x03800088
	ldr r3, _038000E0 ; =0x040001A4
_0380008C:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _0380008C
	ldr r3, _038000E4 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_038000E0: .word 0x040001A4
_038000E4: .word 0x040001A1
	arm_func_end CARDi_SetRomOp

	arm_func_start CARDi_ReadEnd
CARDi_ReadEnd: ; 0x038000E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _03800158 ; =cardi_common
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800134
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_03800134:
	mov r0, r5
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _03800150
	mov r0, r6
	mov lr, pc
	bx r7
_03800150:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800158: .word cardi_common
	arm_func_end CARDi_ReadEnd

	arm_func_start CARDi_GetRomFlag
CARDi_GetRomFlag: ; 0x0380015C
	ldr r1, _03800178 ; =cardi_rom_header_addr
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_03800178: .word cardi_rom_header_addr
	arm_func_end CARDi_GetRomFlag

	arm_func_start CARDi_ReadCard
CARDi_ReadCard: ; 0x0380017C
	bx lr
	arm_func_end CARDi_ReadCard

	arm_func_start CARDi_ReadRomIDCore
CARDi_ReadRomIDCore: ; 0x03800180
	stmdb sp!, {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl CARDi_SetRomOp
	mov r0, #0x7000000
	bl CARDi_GetRomFlag
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038001C8 ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038001AC:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038001AC
	ldr r0, _038001CC ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038001C8: .word 0x040001A4
_038001CC: .word 0x04100010
	arm_func_end CARDi_ReadRomIDCore

	arm_func_start CARDi_ReadRomID
CARDi_ReadRomID: ; 0x038001D0
	stmdb sp!, {r4, lr}
	ldr r0, _038001FC ; =cardi_common
	mov r1, #0
	mov r2, r1
	bl CARDi_WaitTask
	bl CARDi_ReadRomIDCore
	mov r4, r0
	bl CARDi_ReadEnd
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038001FC: .word cardi_common
	arm_func_end CARDi_ReadRomID

	arm_func_start CARDi_WaitTask
CARDi_WaitTask: ; 0x03800200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	mov r4, r0
	b _03800224
_0380021C:
	add r0, r7, #0xf4
	bl OS_SleepThread
_03800224:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _0380021C
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CARDi_WaitTask

	arm_func_start CARD_Init
CARD_Init: ; 0x03800254
	stmdb sp!, {r3, lr}
	ldr ip, _038002B4 ; =cardi_common
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038002AC
	ldr r0, _038002B8 ; =cardi_rom_base
	mov r2, #0
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0xfc]
	str r2, [ip, #0x28]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r1, [ip, #0x2c]
	str r2, [ip, #0x3c]
	str r2, [ip, #0x40]
	str r2, [r0]
	bl CARDi_InitCommon
	ldr r1, _038002BC ; =CARDi_ReadCard
	ldr r0, _038002C0 ; =rom_stat
	str r1, [r0]
	bl CARD_InitPulledOutCallback
_038002AC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038002B4: .word cardi_common
_038002B8: .word cardi_rom_base
_038002BC: .word CARDi_ReadCard
_038002C0: .word rom_stat
	arm_func_end CARD_Init

	arm_func_start CARDi_OnFifoRecv
CARDi_OnFifoRecv: ; 0x038002C4
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _0380039C
	cmp r2, #0
	beq _0380039C
	ldr r0, _038003A4 ; =cardi_common
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800368
_038002F8: ; jump table
	b _03800338 ; case 0
	b _03800368 ; case 1
	b _0380035C ; case 2
	b _0380035C ; case 3
	b _0380035C ; case 4
	b _0380035C ; case 5
	b _0380035C ; case 6
	b _0380035C ; case 7
	b _0380035C ; case 8
	b _0380035C ; case 9
	b _0380035C ; case 10
	b _0380035C ; case 11
	b _0380035C ; case 12
	b _0380035C ; case 13
	b _0380035C ; case 14
	b _0380035C ; case 15
_03800338:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _03800368
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _03800368
_0380035C:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_03800368:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _0380039C
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl OS_WakeupThreadDirect
_0380039C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038003A4: .word cardi_common
	arm_func_end CARDi_OnFifoRecv

	arm_func_start CARDi_TaskThread
CARDi_TaskThread: ; 0x038003A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038005D8 ; =cardi_common
_038003B0:
	mov r5, #0
	bl OS_DisableInterrupts
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_038003C4:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _038003FC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800408
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _03800418
_038003FC:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _03800418
_03800408:
	mov r0, r7
	str r8, [r4, #0xec]
	bl OS_SleepThread
	b _038003C4
_03800418:
	mov r0, r6
	bl OS_RestoreInterrupts
	cmp r5, #0
	beq _038005C4
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x58]
	mov r0, #1
	tst r1, r0, lsl r2
	moveq r0, #3
	streq r0, [r3]
	beq _03800568
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800560
_03800460: ; jump table
	b _03800568 ; case 0
	b _03800568 ; case 1
	b _038004A0 ; case 2
	b _038004A8 ; case 3
	b _038004B8 ; case 4
	b _03800560 ; case 5
	b _038004C4 ; case 6
	b _038004D8 ; case 7
	b _038004EC ; case 8
	b _03800500 ; case 9
	b _03800560 ; case 10
	b _03800514 ; case 11
	b _03800534 ; case 12
	b _0380053C ; case 13
	b _03800550 ; case 14
	b _03800524 ; case 15
_038004A0:
	bl CARDi_InitStatusRegister
	b _03800568
_038004A8:
	bl CARDi_ReadRomIDCore
	ldr r1, [r4]
	str r0, [r1, #8]
	b _03800568
_038004B8:
	mov r0, #3
	str r0, [r3]
	b _03800568
_038004C4:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl CARDi_ReadBackupCore
	b _03800568
_038004D8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_WriteBackupCore
	b _03800568
_038004EC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_ProgramBackupCore
	b _03800568
_03800500:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_VerifyBackupCore
	b _03800568
_03800514:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSectorCore
	b _03800568
_03800524:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSubSectorCore
	b _03800568
_03800534:
	bl CARDi_EraseChipCore
	b _03800568
_0380053C:
	bl CARDi_CommandReadStatus
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03800568
_03800550:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl CARDi_SetWriteProtectCore
	b _03800568
_03800560:
	mov r0, #3
	str r0, [r3]
_03800568:
	mov r6, #0xb
	mov r5, #1
_03800570:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03800570
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038005B8
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_038005B8:
	mov r0, r5
	bl OS_RestoreInterrupts
	b _038003B0
_038005C4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	b _038003B0
	.align 2, 0
_038005D8: .word cardi_common
	arm_func_end CARDi_TaskThread

	arm_func_start CARD_InitPulledOutCallback
CARD_InitPulledOutCallback: ; 0x038005DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380062C ; =skipCheck$3668
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03800624
	mov r1, #1
	str r1, [r0, #8]
	bl PXI_Init
	mov r5, #0xe
	mov r4, #0
_03800604:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _03800604
	ldr r1, _03800630 ; =CARDi_CallbackForPulledOut
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
_03800624:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380062C: .word skipCheck$3668
_03800630: .word CARDi_CallbackForPulledOut
	arm_func_end CARD_InitPulledOutCallback

	arm_func_start CARDi_CallbackForPulledOut
CARDi_CallbackForPulledOut: ; 0x03800634
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380068C
	mov r0, #0
	bl MI_StopDma
	mov r0, #1
	bl MI_StopDma
	mov r0, #2
	bl MI_StopDma
	mov r0, #3
	bl MI_StopDma
	mov r0, #0
	bl CTRDG_VibPulseEdgeUpdate
	bl OS_DisableInterrupts
	mov r4, r0
	bl SND_BeginSleep
	bl WVR_Shutdown
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_Terminate
	b _03800690
_0380068C:
	bl OS_Terminate
_03800690:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end CARDi_CallbackForPulledOut

	arm_func_start CARD_IsPulledOut
CARD_IsPulledOut: ; 0x03800698
	stmdb sp!, {r3, lr}
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038006C8
	ldr r0, _038006DC ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038006C4
	bl CARD_CompareCardID
	b _038006C8
_038006C4:
	bl CARD_IsCardIreqLo
_038006C8:
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038006D8: .word skipCheck$3668
_038006DC: .word 0x027FFE1F
	arm_func_end CARD_IsPulledOut

	arm_func_start CARD_CompareCardID
CARD_CompareCardID: ; 0x038006E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl OS_GetLockID
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03800758
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_TryLockCard
	cmp r0, #0
	bne _0380074C
	ldr r1, _03800778 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl CARDi_ReadRomID
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl OS_UnlockCard
_0380074C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockID
_03800758:
	ldr r1, _0380077C ; =skipCheck$3668
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03800778: .word 0x027FFC10
_0380077C: .word skipCheck$3668
	arm_func_end CARD_CompareCardID

	arm_func_start CARD_IsCardIreqLo
CARD_IsCardIreqLo: ; 0x03800780
	ldr r0, _038007A4 ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038007A8 ; =skipCheck$3668
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038007A4: .word 0x04000214
_038007A8: .word skipCheck$3668
	arm_func_end CARD_IsCardIreqLo

	arm_func_start CARD_CheckPullOut_Polling
CARD_CheckPullOut_Polling: ; 0x038007AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
	ldr r2, _0380089C ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _03800890
	ldr r1, _038008A0 ; =nextCount$3668
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _03800890
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _03800890
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl CARD_IsPulledOut
	cmp r0, #0
	beq _03800840
	ldr r0, _03800898 ; =skipCheck$3668
	mov r1, #1
	str r1, [r0, #4]
	bl CARD_GetRomHeader
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03800840
	ldr r0, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
_03800840:
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r1, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _03800890
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _03800878
_03800870:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_03800878:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03800870
_03800890:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800898: .word skipCheck$3668
_0380089C: .word 0x027FFC40
_038008A0: .word nextCount$3668
	arm_func_end CARD_CheckPullOut_Polling

	.rodata

	.balign 4, 0

	.type SNDi_DecibelTable,@object
	.public SNDi_DecibelTable
SNDi_DecibelTable: ; 0x03806670
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE
	.byte 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE
	.byte 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE
	.byte 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF
	.byte 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF
	.byte 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF
	.byte 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF
	.byte 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF
	.byte 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF
	.byte 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF
	.byte 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF
	.byte 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF
	.byte 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF
	.byte 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF
	.byte 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.size SNDi_DecibelTable,.-SNDi_DecibelTable

	.type SND_AllocExChannel__sinit__shift,@object
	.public SND_AllocExChannel__sinit__shift
SND_AllocExChannel__sinit__shift: ; 0x03806770
	.byte 0x00, 0x01, 0x02, 0x04
	.size SND_AllocExChannel__sinit__shift,.-SND_AllocExChannel__sinit__shift

	.type SND_AllocExChannel__sinit__channel_order,@object
	.public SND_AllocExChannel__sinit__channel_order
SND_AllocExChannel__sinit__channel_order: ; 0x03806774
	.byte 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0E, 0x0C, 0x0F, 0x0D
	.size SND_AllocExChannel__sinit__channel_order,.-SND_AllocExChannel__sinit__channel_order

	.type SND_SetExChannelAttack__sinit__attack_table,@object
	.public SND_SetExChannelAttack__sinit__attack_table
SND_SetExChannelAttack__sinit__attack_table: ; 0x03806784
	.byte 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F, 0x49, 0x54, 0x5C, 0x64
	.byte 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F
	.size SND_SetExChannelAttack__sinit__attack_table,.-SND_SetExChannelAttack__sinit__attack_table

	.balign 4, 0
	.type arg$3806,@object
	.public arg$3806
arg$3806: ; 0x03806798
	.byte 0xC7
	.size arg$3806,.-arg$3806

	.balign 4, 0
	.type arg$3983,@object
	.public arg$3983
arg$3983: ; 0x0380679C
	.byte 0x05
	.size arg$3983,.-arg$3983

	.balign 4, 0
	.type buf$3759,@object
	.public buf$3759
buf$3759: ; 0x038067A0
	.byte 0x06
	.size buf$3759,.-buf$3759

	.section .data,4,1,1

	.type sMasterPan,@object
	.public sMasterPan
sMasterPan: ; 0x03806AEC
	.word 0xFFFFFFFF
	.size sMasterPan,.-sMasterPan

	.type SND_CalcRandom__sinit__u,@object
	.public SND_CalcRandom__sinit__u
SND_CalcRandom__sinit__u: ; 0x03806AF0
	.word 0x12345678
	.size SND_CalcRandom__sinit__u,.-SND_CalcRandom__sinit__u

	.type _03806AF4,@object
	.public _03806AF4
_03806AF4:
	.byte 50
	.size _03806AF4,.-_03806AF4

	.balign 4, 0
	.type _03806AF8,@object
	.public _03806AF8
_03806AF8:
	.word 1
	.size _03806AF8,.-_03806AF8

	.type cardi_rom_header_addr,@object
	.public cardi_rom_header_addr
cardi_rom_header_addr: ; 0x03806AFC
	.word 0x027FFE00
	.size cardi_rom_header_addr,.-cardi_rom_header_addr

	.type nextCount$3668,@object
	.public nextCount$3668
nextCount$3668: ; 0x03806B00
	.word 0xFFFFFFFF
	.size nextCount$3668,.-nextCount$3668

	.type isFirstCheck$3676,@object
	.public isFirstCheck$3676
isFirstCheck$3676: ; 0x03806B04
	.word 1
	.size isFirstCheck$3676,.-isFirstCheck$3676

	.bss

	.balign 32, 0
	.type cardi_common,@object
	.public cardi_common
cardi_common: ; 0x038085E0
	.space 0x200
	.size cardi_common,.-cardi_common

	.type cardi_thread_stack,@object
	.public cardi_thread_stack
cardi_thread_stack: ; 0x038087E0
	.space 0x400
	.size cardi_thread_stack,.-cardi_thread_stack

	.type status_checked$3825,@object
	.public status_checked$3825
status_checked$3825: ; 0x03808BE0
	.space 0x4
	.size status_checked$3825,.-status_checked$3825

	.type cardi_param,@object
	.public cardi_param
cardi_param: ; 0x03808BE4
	.space 0x10
	.size cardi_param,.-cardi_param

	.type cardi_rom_base,@object
	.public cardi_rom_base
cardi_rom_base: ; 0x03808BF4
	.space 0x4
	.size cardi_rom_base,.-cardi_rom_base

	.balign 32, 0
	.type rom_stat,@object
	.public rom_stat
rom_stat: ; 0x03808C00
	.space 0x220
	.size rom_stat,.-rom_stat

	.type skipCheck$3668,@object
	.public skipCheck$3668
skipCheck$3668: ; 0x03808E20
	.space 0x4
	.size skipCheck$3668,.-skipCheck$3668

	.type isCardPullOut,@object
	.public isCardPullOut
isCardPullOut: ; 0x03808E24
	.space 0x4
	.size isCardPullOut,.-isCardPullOut

	.type isInitialized$3621,@object
	.public isInitialized$3621
isInitialized$3621: ; 0x03808E28
	.space 0x4
	.size isInitialized$3621,.-isInitialized$3621

	.type detectPullOut,@object
	.public detectPullOut
detectPullOut: ; 0x03808E2C
	.space 0x4
	.size detectPullOut,.-detectPullOut
