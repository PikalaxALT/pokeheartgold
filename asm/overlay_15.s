#include "constants/sndseq.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0010.h"
	.include "asm/macros.inc"
	.include "overlay_15.inc"
	.include "global.inc"

	.text

	.extern BagApp_GetSaveRoamers
	.extern BagApp_SetRepelStepCount
	.extern BagApp_SetFlute
	.extern ov15_021F9C78
	.extern ov15_021F9D60
	.extern ov15_021F9F08
	.extern ov15_021FA044
	.extern ov15_021FA070
	.extern ov15_021FA074
	.extern ov15_021FA098
	.extern ov15_021FA0E4
	.extern ov15_021FA104
	.extern ov15_021FA170
	.extern ov15_021FA650
	.extern ov15_021FA68C
	.extern ov15_021FA6C0
	.extern ov15_021FA73C
	.extern ov15_021FAC2C
	.extern ov15_021FAC48
	.extern ov15_021FB518
	.extern ov15_021FB680
	.extern ov15_021FBC6C
	.extern ov15_021FBC8C
	.extern ov15_021FBCAC
	.extern ov15_021FBD28
	.extern ov15_021FC224
	.extern ov15_021FC37C
	.extern ov15_021FC3E0
	.extern ov15_021FC3EC

	thumb_func_start ov15_021FC7EC
ov15_021FC7EC: ; 0x021FC7EC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FCAB0 ; =gSystem
	mov r2, #0x40
	ldr r3, [r1, #0x4c]
	add r5, r0, #0
	mov r4, #0
	tst r2, r3
	beq _021FC80E
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FCAB8 ; =ov15_02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC80E:
	mov r2, #0x80
	tst r2, r3
	beq _021FC824
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FCABC ; =ov15_02200640 + 1
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC824:
	mov r2, #0x20
	add r6, r3, #0
	tst r6, r2
	beq _021FC87C
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r3, _021FCAC0 ; =ov15_02200640 + 2
	ldr r1, [r5, r1]
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FC854
	mov r1, #4
	str r1, [sp]
	mov r1, #0xe
	add r2, sp, #0xc
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	bne _021FC8A6
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC854:
	cmp r1, #0x10
	beq _021FC8B2
	cmp r1, #0
	blt _021FC874
	cmp r1, #8
	bge _021FC874
	sub r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC8B2
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC9CA
_021FC874:
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	str r3, [r5, r0]
	b _021FC9CA
_021FC87C:
	mov r2, #0x10
	tst r3, r2
	beq _021FC8D8
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, _021FCAC4 ; =ov15_02200640 + 3
	ldr r1, [r5, r1]
	lsl r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FC8AE
	mov r1, #4
	str r1, [sp]
	add r2, sp, #8
	mov r1, #0xf
	add r2, #3
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC8A8
_021FC8A6:
	b _021FCB5A
_021FC8A8:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC8AE:
	cmp r1, #0x10
	bne _021FC8B4
_021FC8B2:
	b _021FC9CA
_021FC8B4:
	cmp r1, #0
	blt _021FC8D0
	cmp r1, #8
	bge _021FC8D0
	mov r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC9CA
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC9CA
_021FC8D0:
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	str r2, [r5, r0]
	b _021FC9CA
_021FC8D8:
	ldr r3, [r1, #0x48]
	lsl r1, r2, #5
	tst r1, r3
	beq _021FC952
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC922
	cmp r1, #8
	bge _021FC922
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	sub r2, #0x11
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
	b _021FC94C
_021FC922:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #0
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r5, #0
	mvn r2, r2
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
_021FC94C:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC952:
	add r2, #0xf0
	add r1, r3, #0
	tst r1, r2
	beq _021FC9CA
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC99C
	cmp r1, #8
	bge _021FC99C
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #1
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
	b _021FC9C4
_021FC99C:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	mov r2, #1
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
_021FC9C4:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC9CA:
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FC9DE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FC9DE:
	cmp r4, #0
	beq _021FCA02
	ldr r0, _021FCAC8 ; =0x000005DC
	bl PlaySE
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	add r0, r5, #0
	bl ov15_021FA170
_021FCA02:
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	add r0, r5, #0
	bl ov15_021FAC2C
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021FCA8A
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FCA64
	cmp r4, #8
	bhs _021FCA46
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA68C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021FCA64
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FCA64
_021FCA46:
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCA64
	cmp r1, #0xd
	bgt _021FCA64
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCA64:
	mov r0, #4
	str r0, [sp]
	mov r3, #1
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FCB40
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #5
	add r1, #0x68
	strh r2, [r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCA8A:
	ldr r0, _021FCAB0 ; =gSystem
	mov r3, #1
	ldr r1, [r0, #0x48]
	add r0, r1, #0
	tst r0, r3
	beq _021FCAF2
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, sp, #8
	bl ov15_021FA73C
	add r4, r0, #0
	ldr r0, _021FCAB4 ; =0x00000644
	b _021FCACC
	.balign 4, 0
_021FCAB0: .word gSystem
_021FCAB4: .word 0x00000644
_021FCAB8: .word ov15_02200640
_021FCABC: .word ov15_02200640 + 1
_021FCAC0: .word ov15_02200640 + 2
_021FCAC4: .word ov15_02200640 + 3
_021FCAC8: .word 0x000005DC
_021FCACC:
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCADC
	cmp r1, #0xd
	bgt _021FCADC
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCADC:
	cmp r4, #1
	beq _021FCB40
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	add r0, #0x68
	strh r1, [r0]
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FCAF2:
	mov r0, #2
	tst r0, r1
	beq _021FCB40
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	mov r1, #0
	add r2, #0x66
	strh r1, [r2]
	ldr r0, [r5, r0]
	mov r2, #5
	add r0, #0x68
	strh r2, [r0]
	add r0, r5, #0
	bl ov15_021FD774
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021FCB60 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCB2C
	cmp r1, #0xd
	bgt _021FCB2C
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCB2C:
	mov r0, #0x24
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB40:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FCB58
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x29
	mov r3, #0x22
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB58:
	mov r0, #0x10
_021FCB5A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FCB60: .word 0x00000644
	thumb_func_end ov15_021FC7EC

	thumb_func_start ov15_021FCB64
ov15_021FCB64: ; 0x021FCB64
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x8d
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r3, r1, #4
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r5, r3, r1
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl ov15_021FD574
	mov r0, #0x1a
	mov r1, #1
	lsl r0, r0, #6
	strh r1, [r4, r0]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl GetItemAttr
	asr r1, r0, #1
	ldr r0, _021FCD70 ; =0x00000684
	mov r2, #0
	str r1, [r4, r0]
	ldr r0, [r4]
	mov r1, #5
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	add r0, r4, #0
	mov r1, #0
	bl ov15_02200458
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	ldr r2, _021FCD74 ; =0x00000644
	mov r1, #6
	ldr r2, [r4, r2]
	ldrsh r1, [r5, r1]
	add r0, r4, #0
	sub r2, #8
	bl ov15_021FF4EC
	ldr r1, _021FCD74 ; =0x00000644
	add r0, r4, #0
	ldr r1, [r4, r1]
	sub r1, #8
	bl ov15_022002B4
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x66
	ldrh r2, [r2]
	add r1, r4, #4
	bl ov15_021FECA0
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl GetItemAttr
	cmp r0, #0
	bne _021FCC32
	ldr r0, _021FCD70 ; =0x00000684
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021FCC7C
_021FCC32:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	mov r2, #0xbd
	lsl r2, r2, #2
	add r5, r0, #0
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	add r0, r4, #0
	mov r1, #0
	bl BagApp_PrintMessage
	ldr r1, _021FCD7C ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_021FCC7C:
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF0FC
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r3, #6
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r2, r0
	add r2, #0x66
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	bl Pocket_GetQuantity
	cmp r0, #1
	bne _021FCD0C
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4e
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	mov r2, #0x1a
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	lsl r2, r2, #6
	mov r0, #0xbd
	ldrsh r3, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	add r0, r4, #0
	mov r1, #1
	bl BagApp_PrintMessage
	ldr r1, _021FCD7C ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x15
	pop {r3, r4, r5, pc}
_021FCD0C:
	mov r1, #6
	ldrsh r3, [r5, r1]
	ldr r1, _021FCD74 ; =0x00000644
	ldr r0, [r5]
	ldr r2, [r4, r1]
	add r1, #0x3e
	add r2, r3, r2
	sub r2, #8
	lsl r2, r2, #2
	add r0, r0, r2
	ldrh r0, [r0, #2]
	strh r0, [r4, r1]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4d
	bl NewString_ReadMsgData
	mov r2, #0xbd
	lsl r2, r2, #2
	add r5, r0, #0
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	add r0, r4, #0
	mov r1, #1
	bl BagApp_PrintMessage
	ldr r1, _021FCD7C ; =0x00000616
	strb r0, [r4, r1]
	mov r0, #0x11
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FCD70: .word 0x00000684
_021FCD74: .word 0x00000644
_021FCD78: .word 0x000005E4
_021FCD7C: .word 0x00000616
	thumb_func_end ov15_021FCB64

	thumb_func_start ov15_021FCD80
ov15_021FCD80: ; 0x021FCD80
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FCDDC ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FCDD6
	ldr r0, _021FCDE0 ; =0x00000682
	ldrh r1, [r4, r0]
	cmp r1, #0x63
	bls _021FCD9C
	mov r1, #0x63
	strh r1, [r4, r0]
_021FCD9C:
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	add r3, r2, #0
	bl ov15_021FD574
	ldr r2, _021FCDE0 ; =0x00000682
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #2
	bl ov15_02200300
	add r0, r4, #0
	bl ov15_021FF7FC
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FF29C
	add r0, r4, #0
	mov r1, #1
	bl ov15_022004DC
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FFFDC
	mov r0, #0x12
	pop {r4, pc}
_021FCDD6:
	mov r0, #0x11
	pop {r4, pc}
	nop
_021FCDDC: .word 0x00000616
_021FCDE0: .word 0x00000682
	thumb_func_end ov15_021FCD80

	thumb_func_start ov15_021FCDE4
ov15_021FCDE4: ; 0x021FCDE4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r5, #0
	mov r1, #4
	add r4, r0, #0
	bl ov15_021FAC2C
	add r6, r0, #0
	sub r0, r5, #1
	cmp r6, r0
	bne _021FCDFC
	b _021FCF06
_021FCDFC:
	ldr r0, _021FCFB8 ; =0x00000682
	ldrh r0, [r4, r0]
	bl ov15_022002EC
	cmp r0, #2
	bne _021FCE14
	cmp r6, #0
	beq _021FCE10
	cmp r6, #2
	bne _021FCE14
_021FCE10:
	mov r6, #0
	mvn r6, r6
_021FCE14:
	cmp r6, #5
	bls _021FCE1A
	b _021FCF2E
_021FCE1A:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FCE26: ; jump table
	.short _021FCE32 - _021FCE26 - 2 ; case 0
	.short _021FCE64 - _021FCE26 - 2 ; case 1
	.short _021FCE96 - _021FCE26 - 2 ; case 2
	.short _021FCECA - _021FCE26 - 2 ; case 3
	.short _021FCEFE - _021FCE26 - 2 ; case 4
	.short _021FCF02 - _021FCE26 - 2 ; case 5
_021FCE32:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #0xa
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl ManagedSprite_SetAnim
	mov r5, #1
	b _021FCF2E
_021FCE64:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #1
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl ManagedSprite_SetAnim
	mov r5, #1
	b _021FCF2E
_021FCE96:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #9
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl ManagedSprite_SetAnim
	mov r5, #2
	b _021FCF2E
_021FCECA:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #0
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl ManagedSprite_SetAnim
	mov r5, #2
	b _021FCF2E
_021FCEFE:
	mov r5, #3
	b _021FCF2E
_021FCF02:
	mov r5, #4
	b _021FCF2E
_021FCF06:
	mov r1, #0x1a
	lsl r1, r1, #6
	add r0, r4, r1
	add r1, r1, #2
	ldrh r1, [r4, r1]
	bl sub_020881C0
	add r5, r0, #0
	bne _021FCF2E
	ldr r0, _021FCFBC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FCF26
	mov r5, #3
	b _021FCF2E
_021FCF26:
	mov r0, #2
	tst r0, r1
	beq _021FCF2E
	mov r5, #4
_021FCF2E:
	cmp r5, #4
	bhi _021FCFB2
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FCF3E: ; jump table
	.short _021FCFB2 - _021FCF3E - 2 ; case 0
	.short _021FCF48 - _021FCF3E - 2 ; case 1
	.short _021FCF62 - _021FCF3E - 2 ; case 2
	.short _021FCF7C - _021FCF3E - 2 ; case 3
	.short _021FCF96 - _021FCF3E - 2 ; case 4
_021FCF48:
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 ; =0x00000637
	bl PlaySE
	add sp, #4
	mov r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF62:
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 ; =0x00000637
	bl PlaySE
	add sp, #4
	mov r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF7C:
	ldr r0, _021FCFC4 ; =0x000005DC
	bl PlaySE
	mov r0, #0x13
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCF96:
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x14
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCFB2:
	mov r0, #0x12
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FCFB8: .word 0x00000682
_021FCFBC: .word gSystem
_021FCFC0: .word 0x00000637
_021FCFC4: .word 0x000005DC
	thumb_func_end ov15_021FCDE4

	thumb_func_start ov15_021FCFC8
ov15_021FCFC8: ; 0x021FCFC8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl ov15_021FF834
	add r0, r5, #0
	add r0, #0x34
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x4e
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	mov r2, #0x1a
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	lsl r2, r2, #6
	mov r0, #0xbd
	ldrsh r3, [r5, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FD050 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	add r0, r5, #0
	mov r1, #1
	bl BagApp_PrintMessage
	ldr r1, _021FD054 ; =0x00000616
	strb r0, [r5, r1]
	add r0, r5, #0
	bl ov15_02200428
	add r0, r5, #0
	bl ov15_021FFF24
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FD788
	mov r0, #0x15
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FD050: .word 0x000005E4
_021FD054: .word 0x00000616
	thumb_func_end ov15_021FCFC8

	thumb_func_start ov15_021FD058
ov15_021FD058: ; 0x021FD058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FD0E4 ; =0x00000684
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl ov15_02200428
	add r0, r5, #0
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FD0E4: .word 0x00000684
	thumb_func_end ov15_021FD058

	thumb_func_start ov15_021FD0E8
ov15_021FD0E8: ; 0x021FD0E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FD108 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FD102
	add r0, r4, #0
	bl BagApp_CreateYesNoPrompt
	mov r0, #0x16
	pop {r4, pc}
_021FD102:
	mov r0, #0x15
	pop {r4, pc}
	nop
_021FD108: .word 0x00000616
	thumb_func_end ov15_021FD0E8

	thumb_func_start ov15_021FD10C
ov15_021FD10C: ; 0x021FD10C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021FD23C ; =0x00000804
	ldr r0, [r4, r0]
	bl YesNoPrompt_HandleInput
	cmp r0, #1
	beq _021FD12A
	cmp r0, #2
	beq _021FD1BA
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	b _021FD234
_021FD12A:
	add r0, r4, #0
	bl BagApp_DestroyYesNoPrompt
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4f
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	ble _021FD15E
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemNamePlural
	b _021FD172
_021FD15E:
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
_021FD172:
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r2, #0x1a
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r2, r2, #6
	ldrsh r3, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FD240 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	add r0, r4, #0
	mov r1, #0
	bl BagApp_PrintMessage
	ldr r1, _021FD244 ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x17
	pop {r3, r4, r5, pc}
_021FD1BA:
	add r0, r4, #0
	bl BagApp_DestroyYesNoPrompt
	ldr r0, _021FD248 ; =0x00000684
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	add r0, r4, #0
	bl ov15_021FA074
	add r1, r5, #4
	add r5, #0x64
	add r2, r0, #0
	ldrb r5, [r5]
	mov r3, #0xc
	add r0, r4, #0
	mul r3, r5
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r4, #0
	bl ov15_021FE868
	add r0, r4, #0
	bl ov15_021FED3C
	add r0, r4, #0
	bl ov15_021FB518
	add r0, r4, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FD788
	add sp, #8
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021FD234:
	mov r0, #0x16
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FD23C: .word 0x00000804
_021FD240: .word 0x000005E4
_021FD244: .word 0x00000616
_021FD248: .word 0x00000684
	thumb_func_end ov15_021FD10C

	thumb_func_start ov15_021FD24C
ov15_021FD24C: ; 0x021FD24C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021FD2F4 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021FD264
	add sp, #4
	mov r0, #0x17
	pop {r3, r4, pc}
_021FD264:
	ldr r0, _021FD2F8 ; =0x00000643
	bl PlaySE
	mov r1, #0x1a
	lsl r1, r1, #6
	mov r0, #0x8f
	ldrsh r2, [r4, r1]
	add r1, r1, #4
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	mul r1, r2
	bl PlayerProfile_AddMoney
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	bne _021FD2A8
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _021FD2B4
	add r0, r1, #0
	add r0, #0x75
	ldrb r0, [r0]
	add r1, #0x75
	add r0, r0, #1
	strb r0, [r1]
	b _021FD2B4
_021FD2A8:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	add r0, #0x75
	strb r1, [r0]
_021FD2B4:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	add r1, r2, r3
	mov r0, #6
	mov r3, #0x1a
	str r0, [sp]
	add r2, #0x66
	lsl r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r4, r3]
	bl Pocket_TakeItem
	add r0, r4, #0
	bl ov15_021F9F08
	add r4, #0x34
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #0x18
	add sp, #4
	pop {r3, r4, pc}
	nop
_021FD2F4: .word 0x00000616
_021FD2F8: .word 0x00000643
	thumb_func_end ov15_021FD24C

	thumb_func_start ov15_021FD2FC
ov15_021FD2FC: ; 0x021FD2FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FD39C ; =0x00000616
	ldrb r0, [r5, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FD396
	ldr r0, _021FD3A0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FD31E
	ldr r0, _021FD3A4 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FD396
_021FD31E:
	ldr r0, _021FD3A8 ; =0x00000684
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #1
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	bl ov15_021FA170
	add r0, r5, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021FD396:
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_021FD39C: .word 0x00000616
_021FD3A0: .word gSystem
_021FD3A4: .word gSystem + 0x40
_021FD3A8: .word 0x00000684
	thumb_func_end ov15_021FD2FC

	thumb_func_start ov15_021FD3AC
ov15_021FD3AC: ; 0x021FD3AC
	push {r3, lr}
	bl ov15_021FA650
	cmp r0, #1
	bne _021FD3BA
	mov r0, #2
	pop {r3, pc}
_021FD3BA:
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD3AC

	thumb_func_start ov15_021FD3C0
ov15_021FD3C0: ; 0x021FD3C0
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD3C0

	thumb_func_start ov15_021FD3F0
ov15_021FD3F0: ; 0x021FD3F0
	cmp r0, #4
	beq _021FD3FC
	cmp r1, #0x5f
	blo _021FD400
	cmp r1, #0x63
	bhs _021FD400
_021FD3FC:
	mov r0, #1
	bx lr
_021FD400:
	mov r0, #0
	bx lr
	thumb_func_end ov15_021FD3F0

	thumb_func_start ov15_021FD404
ov15_021FD404: ; 0x021FD404
	push {r3, r4, r5, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _021FD438 ; =0x00000694
	cmp r2, #7
	ldr r0, [r1, r0]
	ldr r5, [r0, #0xc]
	bgt _021FD434
	lsl r4, r2, #5
	add r0, r5, r4
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
	add r0, r5, r4
	mov r1, #0x20
	mov r2, #0x40
	bl GXS_LoadBGPltt
	add r0, r5, r4
	mov r1, #0x60
	mov r2, #0x20
	bl GXS_LoadBGPltt
_021FD434:
	pop {r3, r4, r5, pc}
	nop
_021FD438: .word 0x00000694
	thumb_func_end ov15_021FD404

	thumb_func_start ov15_021FD43C
ov15_021FD43C: ; 0x021FD43C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r6, r0, #0
	add r4, r2, #0
	bl GetBgTilemapBuffer
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _021FD4B6
	ldr r1, _021FD4BC ; =ov15_022013A8
	lsl r0, r4, #5
	add r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r7, #0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021FD462:
	ldrb r0, [r5]
	cmp r0, #1
	bne _021FD48E
	ldrb r0, [r5, #4]
	add r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	add r0, r6, #0
	lsl r3, r3, #5
	add r2, r2, r3
	lsl r3, r2, #1
	ldr r2, [sp, #0x14]
	add r2, r2, r3
	ldrb r3, [r5, #3]
	bl LoadRectToBgTilemapRect
	b _021FD4AE
_021FD48E:
	cmp r0, #2
	bne _021FD4AE
	ldrb r0, [r5, #4]
	add r1, r4, #0
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl FillBgTilemapRect
_021FD4AE:
	add r7, r7, #1
	add r5, #8
	cmp r7, #4
	blt _021FD462
_021FD4B6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FD4BC: .word ov15_022013A8
	thumb_func_end ov15_021FD43C

	thumb_func_start ov15_021FD4C0
ov15_021FD4C0: ; 0x021FD4C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0x10]
	lsl r1, r1, #0x18
	add r5, r2, #0
	lsr r1, r1, #0x18
	add r6, r0, #0
	str r3, [sp, #0x14]
	bl GetBgTilemapBuffer
	str r0, [sp, #0x18]
	sub r0, r5, #1
	ldr r1, _021FD56C ; =ov15_02201340
	lsl r0, r0, #3
	add r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_021FD4E6:
	ldrb r0, [r5, #1]
	add r1, r7, #0
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5]
	add r0, r6, #0
	bl FillBgTilemapRect
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021FD4E6
	mov r1, #0
	ldr r0, [sp, #0x14]
	mvn r1, r1
	cmp r0, r1
	beq _021FD566
	ldr r1, _021FD570 ; =ov15_02201328
	lsl r0, r0, #2
	add r3, r1, r0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ldrb r0, [r3, #1]
	bhi _021FD546
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	mov r4, #6
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsl r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsl r4, r4, #8
	ldrb r3, [r3]
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r2, r4
	bl LoadRectToBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021FD546:
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	mov r4, #0x1b
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsl r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsl r4, r4, #6
	ldrb r3, [r3]
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r2, r4
	bl LoadRectToBgTilemapRect
_021FD566:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FD56C: .word ov15_02201340
_021FD570: .word ov15_02201328
	thumb_func_end ov15_021FD4C0

	thumb_func_start ov15_021FD574
ov15_021FD574: ; 0x021FD574
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #4
	bls _021FD588
	bl GF_AssertFail
_021FD588:
	cmp r5, #4
	bls _021FD58E
	b _021FD770
_021FD58E:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FD59A: ; jump table
	.short _021FD5A4 - _021FD59A - 2 ; case 0
	.short _021FD62E - _021FD59A - 2 ; case 1
	.short _021FD6C6 - _021FD59A - 2 ; case 2
	.short _021FD70C - _021FD59A - 2 ; case 3
	.short _021FD740 - _021FD59A - 2 ; case 4
_021FD5A4:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2b
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #5
	bl GetBgTilemapBuffer
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x27
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD62E:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2c
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #5
	bl GetBgTilemapBuffer
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	add r3, r7, #0
	bl ov15_021FD4C0
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2a
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	add r0, r4, #0
	bl ov15_02200294
	add r0, r4, #0
	bl ov15_021FA098
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD6C6:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2d
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD70C:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x34
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD740:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x35
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl Heap_Free
_021FD770:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FD574

	thumb_func_start ov15_021FD774
ov15_021FD774: ; 0x021FD774
	push {r3, lr}
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x78]
	cmp r0, #0
	beq _021FD786
	bl MenuInputStateMgr_SetState
_021FD786:
	pop {r3, pc}
	thumb_func_end ov15_021FD774

	thumb_func_start ov15_021FD788
ov15_021FD788: ; 0x021FD788
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _021FD7C0
	mov r1, #1
	bl ov15_022004DC
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF29C
	add r0, r4, #0
	add r0, #0x74
	bl ScheduleWindowCopyToVram
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x10
	bl ManagedSprite_SetAnim
	pop {r4, pc}
_021FD7C0:
	mov r1, #0
	bl ov15_022004DC
	add r0, r4, #0
	bl ov15_021FF844
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD788

	thumb_func_start ov15_021FD7D0
ov15_021FD7D0: ; 0x021FD7D0
	push {r4, r5}
	mov r4, #0x25
	lsl r4, r4, #6
	add r0, r0, r4
	mov r4, #0
	strb r4, [r0, #2]
	strb r1, [r0]
	ldrb r5, [r0, #1]
	mov r4, #0xf
	mov r1, #0xf
	and r1, r2
	bic r5, r4
	orr r1, r5
	strb r1, [r0, #1]
	lsl r2, r3, #0x1c
	ldrb r5, [r0, #1]
	mov r1, #0xf0
	lsr r2, r2, #0x18
	bic r5, r1
	orr r2, r5
	strb r2, [r0, #1]
	ldr r2, [sp, #8]
	str r2, [r0, #4]
	ldrb r2, [r0, #3]
	bic r2, r4
	strb r2, [r0, #3]
	ldrb r2, [r0, #3]
	bic r2, r1
	strb r2, [r0, #3]
	mov r0, #0x23
	pop {r4, r5}
	bx lr
	thumb_func_end ov15_021FD7D0

	thumb_func_start ov15_021FD810
ov15_021FD810: ; 0x021FD810
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x25
	add r4, r0, #0
	lsl r2, r2, #6
	add r0, r4, r2
	mov r5, #1
	strb r5, [r0, #2]
	strb r1, [r0]
	str r3, [r0, #4]
	ldrb r5, [r0, #3]
	mov r3, #0xf
	bic r5, r3
	strb r5, [r0, #3]
	ldrb r5, [r0, #3]
	mov r3, #0xf0
	bic r5, r3
	strb r5, [r0, #3]
	lsr r0, r2, #2
	add r5, r4, r0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl ManagedSprite_SetAnim
	mov r0, #0x23
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD810

	thumb_func_start ov15_021FD850
ov15_021FD850: ; 0x021FD850
	push {r3, r4, r5, lr}
	mov r5, #0x25
	lsl r5, r5, #6
	add r4, r0, r5
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _021FD874
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	bl ManagedSprite_IsAnimated
	cmp r0, #0
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD874:
	ldrb r2, [r4, #3]
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	beq _021FD886
	cmp r1, #1
	beq _021FD8B6
	cmp r1, #2
	beq _021FD910
	b _021FD936
_021FD886:
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl ManagedSprite_SetPaletteOverride
	ldrb r2, [r4, #3]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD8B6:
	add r1, r2, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf0
	lsl r2, r2, #0x1c
	bic r1, r3
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #4
	bne _021FD936
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ManagedSprite_SetPaletteOverride
	ldrb r1, [r4, #3]
	mov r0, #0xf0
	bic r1, r0
	strb r1, [r4, #3]
	ldrb r2, [r4, #3]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD910:
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD936:
	mov r0, #0x23
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD850

	thumb_func_start ov15_021FD93C
ov15_021FD93C: ; 0x021FD93C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	bl GF3dRender_InitSimpleManager
	ldr r2, _021FDA94 ; =0x04000060
	ldr r0, _021FDA98 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021FDA9C ; =0x00007FFF
	add r1, r0, #0
	add r3, r0, #0
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r0, _021FDAA0 ; =0x00003DEF
	ldr r1, _021FDAA4 ; =0x0000294A
	mov r2, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021FDAA0 ; =0x00003DEF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	mov r0, #0x1f
	mov r1, #0
	str r0, [sp]
	mov r0, #0xf
	mov r2, #3
	add r3, r1, #0
	str r1, [sp, #4]
	bl NNS_G3dGlbPolygonAttr
	ldr r2, _021FDA94 ; =0x04000060
	ldr r0, _021FDA98 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r2]
	ldr r0, _021FDAA8 ; =ov15_02201304
	bl G3X_SetEdgeColorTable
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #6
	bl Camera_New
	ldr r2, _021FDAAC ; =0x00000818
	ldr r4, _021FDAB0 ; =ov15_02200500
	str r0, [r5, r2]
	add r0, r2, #0
	add r0, #0xec
	add r3, r5, r0
	ldmia r4!, {r0, r1}
	add r6, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _021FDAB4 ; =ov15_0220053C
	str r0, [r3]
	add r0, r2, #0
	add r0, #0xf8
	add r3, r5, r0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r3, _021FDAB8 ; =0x0000091C
	ldrb r0, [r5, r3]
	add r1, r3, #0
	sub r1, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r2, r3, #0
	str r0, [sp, #8]
	add r3, r3, #2
	sub r2, #8
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r2, r5, r2
	bl Camera_Init_FromTargetDistanceAndAngle
	ldr r0, _021FDABC ; =0x00000934
	ldr r3, _021FDAC0 ; =ov15_0220050C
	add r2, r5, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _021FDAC4 ; =0x00000808
	add r0, r5, r0
	bl ov15_021FDAD0
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r0, _021FDAC4 ; =0x00000808
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r5, r0
	mov r2, #7
	add r1, r1, #1
	bl ov15_021FDAF4
	ldr r2, _021FDAAC ; =0x00000818
	mov r0, #0x7b
	ldr r1, _021FDAC8 ; =0x006A4000
	ldr r2, [r5, r2]
	lsl r0, r0, #0xc
	bl Camera_SetPerspectiveClippingPlane
	ldr r0, _021FDAAC ; =0x00000818
	ldr r0, [r5, r0]
	bl Camera_SetStaticPtr
	mov r6, #1
	ldr r7, _021FDA9C ; =0x00007FFF
	mov r4, #0
	lsl r6, r6, #0xc
_021FDA58:
	mov r2, #0
	add r0, r4, #0
	add r1, r6, #0
	add r3, r2, #0
	bl NNS_G3dGlbLightVector
	add r0, r4, #0
	add r1, r7, #0
	bl NNS_G3dGlbLightColor
	add r4, r4, #1
	cmp r4, #4
	blo _021FDA58
	add r0, r5, #0
	bl ov15_021FDD70
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineATogglePlanes
	ldr r1, _021FDACC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021FDA94: .word 0x04000060
_021FDA98: .word 0xFFFFCFFF
_021FDA9C: .word 0x00007FFF
_021FDAA0: .word 0x00003DEF
_021FDAA4: .word 0x0000294A
_021FDAA8: .word ov15_02201304
_021FDAAC: .word 0x00000818
_021FDAB0: .word ov15_02200500
_021FDAB4: .word ov15_0220053C
_021FDAB8: .word 0x0000091C
_021FDABC: .word 0x00000934
_021FDAC0: .word ov15_0220050C
_021FDAC4: .word 0x00000808
_021FDAC8: .word 0x006A4000
_021FDACC: .word 0x04000008
	thumb_func_end ov15_021FD93C

	thumb_func_start ov15_021FDAD0
ov15_021FDAD0: ; 0x021FDAD0
	mov r2, #0x47
	lsl r2, r2, #2
	mov r3, #0
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r1, r2, #0
	sub r3, r3, #1
	add r1, #8
	str r3, [r0, r1]
	add r1, r2, #0
	mov r3, #7
	add r1, #0xc
	strh r3, [r0, r1]
	add r2, #0xe
	strh r3, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FDAD0

	thumb_func_start ov15_021FDAF4
ov15_021FDAF4: ; 0x021FDAF4
	push {r4, r5}
	mov r4, #0x4a
	lsl r4, r4, #2
	add r3, r4, #2
	ldrh r5, [r0, r4]
	ldrh r3, [r0, r3]
	cmp r5, r3
	bne _021FDB22
	add r3, r4, #0
	sub r3, #8
	ldr r5, [r0, r3]
	add r3, r4, #0
	sub r3, #0xc
	str r5, [r0, r3]
	add r3, r4, #0
	sub r3, #8
	str r1, [r0, r3]
	mov r1, #0
	strh r1, [r0, r4]
	add r1, r4, #2
	strh r2, [r0, r1]
	pop {r4, r5}
	bx lr
_021FDB22:
	sub r2, r4, #4
	str r1, [r0, r2]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FDAF4

	thumb_func_start ov15_021FDB2C
ov15_021FDB2C: ; 0x021FDB2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x90
	add r2, r1, #0
	add r1, r0, #0
	ldr r3, _021FDC64 ; =ov15_02200790
	mul r2, r0
	add r1, #0x98
	add r4, r3, r2
	ldrh r2, [r5, r1]
	add r1, r0, #0
	add r1, #0x9a
	ldrh r1, [r5, r1]
	cmp r2, r1
	beq _021FDC28
	add r1, r0, #0
	add r1, #0x98
	ldrh r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0x98
	strh r2, [r5, r1]
	add r1, r0, #0
	add r1, #0x8c
	add r0, #0x90
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [sp, #8]
	ldrh r7, [r4, r1]
	ldrh r1, [r4, r0]
	str r0, [sp, #4]
	sub r0, r1, r7
	bpl _021FDB76
	neg r0, r0
_021FDB76:
	cmp r1, r7
	bhs _021FDB80
	mov r1, #0
	mvn r1, r1
	b _021FDB82
_021FDB80:
	mov r1, #1
_021FDB82:
	mov r2, #2
	lsl r2, r2, #0xe
	cmp r0, r2
	ble _021FDB94
	lsl r2, r2, #1
	sub r0, r2, r0
	mov r2, #0
	mvn r2, r2
	mul r1, r2
_021FDB94:
	cmp r1, #0
	ldr r2, _021FDC68 ; =0x0000012A
	ble _021FDBB0
	ldrh r1, [r5, r2]
	str r1, [sp]
	sub r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0x14]
	b _021FDBC4
_021FDBB0:
	ldrh r1, [r5, r2]
	str r1, [sp]
	sub r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	bl _s32_div_f
	mul r0, r6
	sub r0, r7, r0
	str r0, [sp, #0x14]
_021FDBC4:
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldrh r7, [r0, #2]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldrh r0, [r0, #2]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldr r7, [r0, #8]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldr r0, [r0, #8]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldr r7, [r0, #0xc]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldr r0, [r0, #0xc]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r1, r7, r0
	mov r0, #0x43
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	add r3, r0, #2
	strh r2, [r5, r0]
	ldr r2, [sp, #0x10]
	strh r2, [r5, r3]
	sub r3, r0, #4
	ldr r2, [sp, #0xc]
	add r0, #0x24
	str r2, [r5, r3]
	str r1, [r5, r0]
_021FDC28:
	mov r1, #0x4a
	lsl r1, r1, #2
	add r0, r1, #2
	ldrh r2, [r5, r1]
	ldrh r0, [r5, r0]
	cmp r2, r0
	bne _021FDC60
	sub r0, r1, #4
	mov r2, #0
	ldr r0, [r5, r0]
	mvn r2, r2
	cmp r0, r2
	beq _021FDC60
	add r0, r1, #0
	sub r0, #8
	ldr r3, [r5, r0]
	add r0, r1, #0
	sub r0, #0xc
	str r3, [r5, r0]
	sub r0, r1, #4
	ldr r3, [r5, r0]
	add r0, r1, #0
	sub r0, #8
	str r3, [r5, r0]
	sub r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0
	strh r0, [r5, r1]
_021FDC60:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FDC64: .word ov15_02200790
_021FDC68: .word 0x0000012A
	thumb_func_end ov15_021FDB2C

	thumb_func_start ov15_021FDC6C
ov15_021FDC6C: ; 0x021FDC6C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FDF20
	ldr r0, _021FDC84 ; =0x00000818
	ldr r0, [r4, r0]
	bl Camera_Delete
	bl GF3dRender_DeleteSimpleManager
	pop {r4, pc}
	nop
_021FDC84: .word 0x00000818
	thumb_func_end ov15_021FDC6C

	thumb_func_start ov15_021FDC88
ov15_021FDC88: ; 0x021FDC88
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r4, _021FDD34 ; =ov15_022005CC
	add r5, r0, #0
	add r3, sp, #0x18
	mov r2, #4
_021FDC94:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FDC94
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021FDD38 ; =ov15_022004F4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021FDD3C ; =0x00000615
	str r0, [r2]
	ldr r0, _021FDD40 ; =0x00000808
	ldrb r1, [r5, r1]
	add r0, r5, r0
	bl ov15_021FDB2C
	ldr r3, _021FDD44 ; =0x0000091C
	ldr r2, _021FDD48 ; =0x00000818
	ldrb r0, [r5, r3]
	add r1, r2, #0
	add r3, r3, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r1, #0xf8
	str r0, [sp, #8]
	add r0, r2, #0
	add r0, #0xec
	add r2, #0xfc
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r2, r5, r2
	bl Camera_Init_FromTargetDistanceAndAngle
	bl Thunk_G3X_Reset
	bl Camera_PushLookAtToNNSGlb
	ldr r0, _021FDD4C ; =0x0000081C
	add r4, r5, r0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xa0
	ldr r0, [r0]
	bl ov15_021FDD54
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xc0
	ldr r0, [r0]
	bl ov15_021FDD54
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl ov15_021FDD54
	ldr r1, _021FDD50 ; =0x00000934
	add r0, r4, #0
	add r1, r5, r1
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl GF3dRender_DrawModel
	mov r0, #0
	add r1, r0, #0
	bl RequestSwap3DBuffers
	add sp, #0x3c
	pop {r4, r5, pc}
	.balign 4, 0
_021FDD34: .word ov15_022005CC
_021FDD38: .word ov15_022004F4
_021FDD3C: .word 0x00000615
_021FDD40: .word 0x00000808
_021FDD44: .word 0x0000091C
_021FDD48: .word 0x00000818
_021FDD4C: .word 0x0000081C
_021FDD50: .word 0x00000934
	thumb_func_end ov15_021FDC88

	thumb_func_start ov15_021FDD54
ov15_021FDD54: ; 0x021FDD54
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #0xc
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldrh r1, [r1, #4]
	lsl r1, r1, #0xc
	cmp r2, r1
	bge _021FDD6A
	str r2, [r0]
	bx lr
_021FDD6A:
	mov r1, #0
	str r1, [r0]
	bx lr
	thumb_func_end ov15_021FDD54

	thumb_func_start ov15_021FDD70
ov15_021FDD70: ; 0x021FDD70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	mov r0, #0xf
	mov r1, #6
	bl NARC_New
	str r0, [sp, #0x10]
	ldr r0, _021FDF14 ; =0x00000808
	mov r1, #6
	add r0, r7, r0
	mov r2, #4
	bl HeapExp_FndInitAllocator
	ldr r0, _021FDF18 ; =0x0000081C
	add r4, r7, r0
	ldr r0, _021FDF1C ; =0x00000615
	ldrb r0, [r7, r0]
	cmp r0, #0
	bne _021FDDA8
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x41
	str r0, [sp, #4]
	mov r0, #0x49
	mov r1, #0x37
	str r0, [sp]
	b _021FDDB6
_021FDDA8:
	mov r0, #0x4c
	str r0, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #4]
	mov r0, #0x5c
	mov r1, #0x4a
	str r0, [sp]
_021FDDB6:
	ldr r0, [sp, #0x10]
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r2, r4, #0
	str r0, [r4, #0x58]
	add r0, r4, #0
	add r1, #0x54
	add r2, #0x58
	bl GF3dRender_InitObjFromHeader
	ldr r0, [r4, #0x58]
	bl NNS_G3dGetTex
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r1, #1
	ldr r0, [r4, #0x54]
	lsl r2, r1, #9
	bl NNSi_G3dModifyMatFlag
	mov r1, #1
	ldr r0, [r4, #0x54]
	lsl r2, r1, #0xa
	bl NNSi_G3dModifyMatFlag
	mov r2, #0x3f
	ldr r0, [r4, #0x54]
	mov r1, #1
	lsl r2, r2, #0x18
	bl NNSi_G3dModifyPolygonAttrMask
	mov r6, #0
	add r5, r4, #0
_021FDE0E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	add r1, r1, r6
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	mov r1, #0
	str r0, [r5, #0x5c]
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x14]
	ldr r0, _021FDF14 ; =0x00000808
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	bl NNS_G3dAllocAnmObj
	add r1, r5, #0
	add r1, #0xa0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	bl NNS_G3dAnmObjInit
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x10]
	add r1, r1, r6
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	mov r1, #0
	str r0, [r5, #0x7c]
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x18]
	ldr r0, _021FDF14 ; =0x00000808
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	bl NNS_G3dAllocAnmObj
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	bl NNS_G3dAnmObjInit
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #8
	blo _021FDE0E
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r5, r0, #0
	ldr r0, _021FDF14 ; =0x00000808
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	add r1, r5, #0
	bl NNS_G3dAllocAnmObj
	add r1, r4, #0
	add r1, #0xe0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	add r1, r5, #0
	bl NNS_G3dAnmObjInit
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r0, #0x64
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r0, r4, #0
	add r4, #0xe0
	ldr r1, [r4]
	bl NNS_G3dRenderObjAddAnmObj
	ldr r0, [sp, #0x10]
	bl NARC_Delete
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FDF14: .word 0x00000808
_021FDF18: .word 0x0000081C
_021FDF1C: .word 0x00000615
	thumb_func_end ov15_021FDD70

	thumb_func_start ov15_021FDF20
ov15_021FDF20: ; 0x021FDF20
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021FDF80 ; =0x0000081C
	ldr r7, _021FDF84 ; =0x00000808
	add r0, r5, r0
	str r0, [sp]
	mov r6, #0
	add r4, r0, #0
_021FDF30:
	add r1, r4, #0
	add r1, #0xa0
	ldr r1, [r1]
	add r0, r5, r7
	bl NNS_G3dFreeAnmObj
	add r1, r4, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r0, r5, r7
	bl NNS_G3dFreeAnmObj
	ldr r0, [r4, #0x5c]
	bl Heap_Free
	ldr r0, [r4, #0x7c]
	bl Heap_Free
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #8
	blo _021FDF30
	ldr r1, [sp]
	ldr r0, _021FDF84 ; =0x00000808
	add r1, #0xe0
	ldr r1, [r1]
	add r0, r5, r0
	bl NNS_G3dFreeAnmObj
	ldr r0, [sp]
	add r0, #0x9c
	ldr r0, [r0]
	bl Heap_Free
	ldr r0, [sp]
	ldr r0, [r0, #0x58]
	bl Heap_Free
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FDF80: .word 0x0000081C
_021FDF84: .word 0x00000808
	thumb_func_end ov15_021FDF20

	thumb_func_start ov15_021FDF88
ov15_021FDF88: ; 0x021FDF88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FE01C ; =0x0000081C
	add r4, r5, r0
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjRemoveAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjRemoveAnmObj
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	mov r0, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FE01C: .word 0x0000081C
	thumb_func_end ov15_021FDF88

	; file boundary

	thumb_func_start ov15_021FE020
ov15_021FE020: ; 0x021FE020
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #0
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xc1
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	mov r2, #1
	mov r3, #0
	bl AddWindowParameterized
	mov r1, #1
	str r1, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x24
	mov r2, #4
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x53
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x34
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xdb
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x44
	mov r2, #1
	mov r3, #0x13
	bl AddWindowParameterized
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE150 ; =0x0000012B
	add r1, r4, #0
	str r0, [sp, #0x10]
	mov r2, #1
	ldr r0, [r4]
	add r1, #0x54
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x37
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x64
	mov r2, #4
	mov r3, #0xa
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x45
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x74
	mov r2, #4
	mov r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0
	add r1, r2, #0
_021FE13E:
	add r0, r4, #0
	add r0, #0xb4
	add r2, r2, #1
	add r4, #0x10
	str r1, [r0]
	cmp r2, #0x18
	blt _021FE13E
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021FE150: .word 0x0000012B
	thumb_func_end ov15_021FE020

	thumb_func_start ov15_021FE154
ov15_021FE154: ; 0x021FE154
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	add r4, r6, #4
_021FE15C:
	lsl r0, r5, #4
	add r0, r4, r0
	bl RemoveWindow
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #8
	blo _021FE15C
	add r0, r6, #0
	bl ov15_021FE3E0
	add r0, r6, #0
	bl ov15_021FE1D0
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FE154

	thumb_func_start ov15_021FE17C
ov15_021FE17C: ; 0x021FE17C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _021FE1C8
	add r5, r7, #0
	ldr r4, _021FE1CC ; =ov15_02200908
	mov r6, #0
	add r5, #0xb4
_021FE192:
	ldr r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r2, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r6, r6, #1
	add r4, #0xc
	add r5, #0x10
	cmp r6, #0xc
	blt _021FE192
_021FE1C8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE1CC: .word ov15_02200908
	thumb_func_end ov15_021FE17C

	thumb_func_start ov15_021FE1D0
ov15_021FE1D0: ; 0x021FE1D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _021FE200
	mov r6, #0
	add r4, r5, #0
	add r4, #0xb4
	add r7, r6, #0
_021FE1E4:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xb4
	add r6, r6, #1
	str r7, [r0]
	add r4, #0x10
	add r5, #0x10
	cmp r6, #0xc
	blt _021FE1E4
_021FE200:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE1D0

	thumb_func_start ov15_021FE204
ov15_021FE204: ; 0x021FE204
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r3, #0x5d
	lsl r3, r3, #2
	str r0, [sp, #0x14]
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _021FE216
	b _021FE3BC
_021FE216:
	mov r0, #7
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE3C0 ; =0x000002CF
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r1, r3
	ldr r0, [r0]
	mov r3, #0xc
	bl AddWindowParameterized
	mov r1, #0x5d
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3C4 ; =0x0000031B
	str r0, [sp, #0x18]
	add r0, #0xb4
	ldr r5, _021FE3C8 ; =ov15_022008E8
	mov r6, #0
	str r0, [sp, #0x18]
_021FE252:
	add r0, r6, #0
	add r0, #0xd
	lsl r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsl r3, r3, #0x18
	add r1, r1, r7
	mov r2, #4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x14
	add r5, #8
	cmp r6, #4
	blt _021FE252
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3CC ; =0x000002FB
	str r0, [sp, #0x1c]
	add r0, #0xb4
	ldr r5, _021FE3D0 ; =ov15_022008D0
	mov r6, #0
	str r0, [sp, #0x1c]
_021FE2A8:
	add r0, r6, #0
	add r0, #0x11
	lsl r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsl r3, r3, #0x18
	add r1, r1, r7
	mov r2, #4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x1c]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, r4, #6
	add r5, #8
	cmp r6, #3
	blt _021FE2A8
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D4 ; =0x0000030D
	mov r2, #0x7d
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0]
	mov r2, #4
	mov r3, #0xe
	bl AddWindowParameterized
	mov r1, #0x7d
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r2, #4
	mov r4, #0x81
	str r2, [sp, #8]
	mov r3, #0xb
	ldr r0, _021FE3C4 ; =0x0000031B
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r4, r4, #2
	ldr r0, [r0]
	add r1, r1, r4
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D8 ; =0x00000363
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r4, #0x10
	ldr r0, [r0]
	add r1, r1, r4
	bl AddWindowParameterized
	mov r1, #0x85
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3DC ; =0x00000387
	mov r2, #0x89
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0]
	mov r2, #4
	mov r3, #0x18
	bl AddWindowParameterized
	mov r1, #0x89
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
_021FE3BC:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE3C0: .word 0x000002CF
_021FE3C4: .word 0x0000031B
_021FE3C8: .word ov15_022008E8
_021FE3CC: .word 0x000002FB
_021FE3D0: .word ov15_022008D0
_021FE3D4: .word 0x0000030D
_021FE3D8: .word 0x00000363
_021FE3DC: .word 0x00000387
	thumb_func_end ov15_021FE204

	thumb_func_start ov15_021FE3E0
ov15_021FE3E0: ; 0x021FE3E0
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021FE4C6
	ldr r5, [sp]
	mov r4, #0
	add r6, r5, #0
	add r6, #0xb4
_021FE3F6:
	add r0, r4, #0
	add r0, #0x11
	lsl r7, r0, #4
	add r0, r6, r7
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, r7
	bl RemoveWindow
	mov r0, #0x71
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021FE3F6
	add r1, r0, #0
	ldr r0, [sp]
	add r1, #0x60
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x89
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x89
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x85
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x81
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x7d
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	ldr r0, [sp]
	mov r1, #0x7d
	add r6, r0, #0
	mov r5, #0
	lsl r1, r1, #2
	str r5, [r0, r1]
	add r4, r0, #0
	add r6, #0xb4
_021FE482:
	add r0, r5, #0
	add r0, #0xd
	lsl r7, r0, #4
	add r0, r6, r7
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, r7
	bl RemoveWindow
	mov r0, #0x61
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #4
	blt _021FE482
	add r1, r0, #0
	ldr r0, [sp]
	sub r1, #0x10
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x5d
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x5d
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
_021FE4C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE3E0

	thumb_func_start ov15_021FE4C8
ov15_021FE4C8: ; 0x021FE4C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe1
	mov r3, #6
	bl NewMsgDataFromNarc
	ldr r7, _021FE500 ; =0x000005F4
	add r6, r0, #0
	mov r4, #0
_021FE4DE:
	add r0, r6, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _021FE4DE
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FE500: .word 0x000005F4
	thumb_func_end ov15_021FE4C8

	thumb_func_start ov15_021FE504
ov15_021FE504: ; 0x021FE504
	push {r4, r5, r6, lr}
	ldr r6, _021FE524 ; =0x000005F4
	add r5, r0, #0
	mov r4, #0
_021FE50C:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl String_Delete
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _021FE50C
	pop {r4, r5, r6, pc}
	nop
_021FE524: .word 0x000005F4
	thumb_func_end ov15_021FE504

	thumb_func_start ov15_021FE528
ov15_021FE528: ; 0x021FE528
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xd
	mov r7, #1
_021FE534:
	str r6, [sp]
	str r7, [sp, #4]
	add r2, r4, #0
	add r2, #0xcd
	lsl r2, r2, #0x10
	lsl r3, r4, #0x18
	str r7, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r0, #0xe
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, #0xf1
	str r0, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r4, #0x18
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xc
	blo _021FE534
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE528

	thumb_func_start ov15_021FE584
ov15_021FE584: ; 0x021FE584
	push {r3, r4, r5, lr}
	lsl r1, r1, #0x10
	add r4, r2, #0
	lsr r1, r1, #0x10
	mov r2, #0
	add r5, r0, #0
	bl ov15_021F9D60
	add r2, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferItemName
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE584

	thumb_func_start ov15_021FE5A4
ov15_021FE5A4: ; 0x021FE5A4
	push {r3, r4, r5, lr}
	lsl r1, r1, #0x10
	add r4, r2, #0
	lsr r1, r1, #0x10
	mov r2, #0
	add r5, r0, #0
	bl ov15_021F9D60
	add r2, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferItemNamePlural
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE5A4

	thumb_func_start ov15_021FE5C4
ov15_021FE5C4: ; 0x021FE5C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021FE618 ; =0x0000FFFF
	add r6, r1, #0
	cmp r6, r0
	beq _021FE5E6
	mov r0, #0x82
	mov r1, #6
	bl String_New
	add r1, r6, #0
	mov r2, #6
	add r4, r0, #0
	bl GetItemDescIntoString
	b _021FE5F4
_021FE5E6:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x61
	bl NewString_ReadMsgData
	add r4, r0, #0
_021FE5F4:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE61C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #4
	mov r3, #0x14
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FE618: .word 0x0000FFFF
_021FE61C: .word 0x000F0E00
	thumb_func_end ov15_021FE5C4

	thumb_func_start ov15_021FE620
ov15_021FE620: ; 0x021FE620
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r5, #0
	add r0, r1, #0
	add r4, #0x14
	bl TMHMGetMove
	str r0, [sp, #0x10]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x65
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x59
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5c
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r3, #0x48
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5a
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r3, #0xa8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5b
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0xa8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetMoveMaxPP
	add r7, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5d
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r7, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0x30
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x10]
	mov r1, #2
	bl GetMoveAttr
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #1
	bhi _021FE790
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl NewString_ReadMsgData
	b _021FE79C
_021FE790:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5e
	bl NewString_ReadMsgData
_021FE79C:
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_Delete
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	ldr r2, _021FE864 ; =0x000005E4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0xe8
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x10]
	mov r1, #4
	bl GetMoveAttr
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	bne _021FE800
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl NewString_ReadMsgData
	b _021FE80C
_021FE800:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5e
	bl NewString_ReadMsgData
_021FE80C:
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0xe8
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE860: .word 0x000F0E00
_021FE864: .word 0x000005E4
	thumb_func_end ov15_021FE620

	thumb_func_start ov15_021FE868
ov15_021FE868: ; 0x021FE868
	ldr r3, _021FE870 ; =ClearWindowTilemapAndScheduleTransfer
	add r0, #0x14
	bx r3
	nop
_021FE870: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FE868

	thumb_func_start ov15_021FE874
ov15_021FE874: ; 0x021FE874
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl NewString_ReadMsgData
	ldr r1, _021FE89C ; =0x000005E8
	str r0, [r4, r1]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x26
	bl NewString_ReadMsgData
	ldr r1, _021FE8A0 ; =0x000005EC
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_021FE89C: .word 0x000005E8
_021FE8A0: .word 0x000005EC
	thumb_func_end ov15_021FE874

	thumb_func_start ov15_021FE8A4
ov15_021FE8A4: ; 0x021FE8A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FE8BC ; =0x000005E8
	ldr r0, [r4, r0]
	bl String_Delete
	ldr r0, _021FE8C0 ; =0x000005EC
	ldr r0, [r4, r0]
	bl String_Delete
	pop {r4, pc}
	nop
_021FE8BC: .word 0x000005E8
_021FE8C0: .word 0x000005EC
	thumb_func_end ov15_021FE8A4

	thumb_func_start ov15_021FE8C4
ov15_021FE8C4: ; 0x021FE8C4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xa
	mov r1, #6
	bl String_New
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r2, _021FE910 ; =0x000005EC
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FE910: .word 0x000005EC
	thumb_func_end ov15_021FE8C4

	thumb_func_start ov15_021FE914
ov15_021FE914: ; 0x021FE914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r2, #0
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0x69
	ldrh r1, [r7]
	lsl r0, r0, #2
	add r4, r3, #0
	cmp r1, r0
	bhs _021FE95E
	sub r0, #0x5d
	sub r0, r1, r0
	mov r1, #2
	lsl r0, r0, #0x10
	str r1, [sp]
	lsr r2, r0, #0x10
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #5
	str r0, [sp, #0xc]
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl sub_0200CE7C
	lsl r2, r4, #0x10
	ldrh r1, [r7, #2]
	ldr r3, _021FE98C ; =0x00010200
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl ov15_021FE8C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FE95E:
	sub r0, r0, #1
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	str r6, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #5
	str r0, [sp, #8]
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #2
	mov r3, #1
	bl PrintUIntOnWindow
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	bl ov15_021FE9B0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE98C: .word 0x00010200
	thumb_func_end ov15_021FE914

	thumb_func_start ov15_021FE990
ov15_021FE990: ; 0x021FE990
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x25
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r5, r0, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE990

	thumb_func_start ov15_021FE9B0
ov15_021FE9B0: ; 0x021FE9B0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r1, sp, #0x18
	add r4, r2, #0
	bl ov15_021FE990
	add r6, r0, #0
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	mov r2, #0
	str r0, [sp, #4]
	lsl r1, r4, #0x10
	str r2, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	mov r0, #6
	add r1, r6, #0
	bl Heap_FreeExplicit
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov15_021FE9B0

	thumb_func_start ov15_021FE9F0
ov15_021FE9F0: ; 0x021FE9F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r1, sp, #0x18
	add r4, r2, #0
	add r6, r3, #0
	bl ov15_021FE990
	add r7, r0, #0
	cmp r6, #0
	bne _021FEA2C
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	lsl r1, r4, #0x10
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	mov r2, #0x18
	bl BlitBitmapRectToWindow
	b _021FEA50
_021FEA2C:
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	lsl r1, r4, #0x10
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	mov r2, #0x40
	bl BlitBitmapRectToWindow
_021FEA50:
	mov r0, #6
	add r1, r7, #0
	bl Heap_FreeExplicit
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE9F0

	thumb_func_start ov15_021FEA5C
ov15_021FEA5C: ; 0x021FEA5C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl NewString_ReadMsgData
	mov r1, #3
	lsl r1, r1, #8
	str r0, [r4, r1]
	sub r1, #0x10
	ldr r0, [r4, r1]
	mov r1, #6
	bl NewString_ReadMsgData
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x14
	ldr r0, [r4, r1]
	mov r1, #0x10
	bl NewString_ReadMsgData
	mov r1, #0xc2
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x18
	ldr r0, [r4, r1]
	mov r1, #0x62
	bl NewString_ReadMsgData
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x1c
	ldr r0, [r4, r1]
	mov r1, #0x63
	bl NewString_ReadMsgData
	mov r1, #0x31
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x20
	ldr r0, [r4, r1]
	mov r1, #1
	bl NewString_ReadMsgData
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x24
	ldr r0, [r4, r1]
	mov r1, #2
	bl NewString_ReadMsgData
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x28
	ldr r0, [r4, r1]
	mov r1, #0x12
	bl NewString_ReadMsgData
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x2c
	ldr r0, [r4, r1]
	mov r1, #3
	bl NewString_ReadMsgData
	mov r1, #0x32
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x30
	ldr r0, [r4, r1]
	mov r1, #4
	bl NewString_ReadMsgData
	mov r1, #0xc9
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x34
	ldr r0, [r4, r1]
	mov r1, #5
	bl NewString_ReadMsgData
	mov r1, #0xca
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x38
	ldr r0, [r4, r1]
	mov r1, #8
	bl NewString_ReadMsgData
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x3c
	ldr r0, [r4, r1]
	mov r1, #0x4b
	bl NewString_ReadMsgData
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x40
	ldr r0, [r4, r1]
	mov r1, #0x56
	bl NewString_ReadMsgData
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x44
	ldr r0, [r4, r1]
	mov r1, #0
	bl NewString_ReadMsgData
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x48
	ldr r0, [r4, r1]
	mov r1, #0x80
	bl NewString_ReadMsgData
	mov r1, #0xcf
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov15_021FEA5C

	thumb_func_start ov15_021FEB64
ov15_021FEB64: ; 0x021FEB64
	push {r4, r5, r6, lr}
	mov r6, #3
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #8
_021FEB6E:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl String_Delete
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x10
	blo _021FEB6E
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FEB64

	thumb_func_start ov15_021FEB84
ov15_021FEB84: ; 0x021FEB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #3
	bne _021FEBDC
	add r0, r5, #0
	add r0, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x66
	ldrh r1, [r1]
	bl ov15_021FE620
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x66
	ldrh r1, [r1]
	mov r2, #1
	bl ov15_021FF97C
	add r0, r5, #0
	mov r1, #0
	bl ov15_021F9C78
_021FEBDC:
	add r0, r5, #0
	ldr r2, _021FEC98 ; =0x000003E2
	add r0, #0x24
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x24
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x64
	ldrb r2, [r0]
	mov r0, #0xc
	add r3, r1, #4
	mul r0, r2
	add r4, r3, r0
	add r0, r1, #0
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #6
	bne _021FEC30
	add r1, #0x66
	ldrb r0, [r4, #8]
	ldrh r1, [r1]
	bl ov15_021FD3F0
	cmp r0, #0
	bne _021FEC30
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x6a
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _021FEC3E
_021FEC30:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2b
	bl NewString_ReadMsgData
	add r7, r0, #0
_021FEC3E:
	mov r0, #0x6c
	mov r1, #6
	bl String_New
	mov r1, #6
	ldrsh r2, [r4, r1]
	ldr r1, _021FEC9C ; =0x00000644
	add r6, r0, #0
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE584
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x24
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl String_Delete
	add r5, #0x24
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FEC98: .word 0x000003E2
_021FEC9C: .word 0x00000644
	thumb_func_end ov15_021FEB84

	thumb_func_start ov15_021FECA0
ov15_021FECA0: ; 0x021FECA0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl ov15_021FE5C4
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FECA0

	thumb_func_start ov15_021FECC4
ov15_021FECC4: ; 0x021FECC4
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	thumb_func_end ov15_021FECC4

	thumb_func_start ov15_021FECD8
ov15_021FECD8: ; 0x021FECD8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	add r2, #0x78
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FED20 ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r3, #0x14
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021FED20: .word 0x000F0E00
	thumb_func_end ov15_021FECD8

	thumb_func_start ov15_021FED24
ov15_021FED24: ; 0x021FED24
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x24
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x24
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FED24

	thumb_func_start ov15_021FED3C
ov15_021FED3C: ; 0x021FED3C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED24
	add r0, r4, #0
	bl ov15_021FE3E0
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov15_021FF97C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FED3C

	thumb_func_start ov15_021FED58
ov15_021FED58: ; 0x021FED58
	ldr r3, _021FED5C ; =ov15_021FE3E0
	bx r3
	.balign 4, 0
_021FED5C: .word ov15_021FE3E0
	thumb_func_end ov15_021FED58

	thumb_func_start ov15_021FED60
ov15_021FED60: ; 0x021FED60
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x24
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2e
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x82
	mov r1, #6
	bl String_New
	ldr r1, _021FEDE0 ; =0x00000672
	add r4, r0, #0
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0
	bl ov15_021FE584
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	ldr r2, _021FEDE4 ; =0x000003E2
	add r0, #0x24
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEDE8 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x24
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r5, #0x24
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FEDE0: .word 0x00000672
_021FEDE4: .word 0x000003E2
_021FEDE8: .word 0x00010200
	thumb_func_end ov15_021FED60

	thumb_func_start ov15_021FEDEC
ov15_021FEDEC: ; 0x021FEDEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #6
	str r1, [sp, #0x10]
	ldrsh r1, [r5, r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	cmp r1, r0
	blt _021FEE06
	bl GF_AssertFail
_021FEE06:
	mov r0, #2
	mov r1, #6
	bl String_New
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bne _021FEE1A
	mov r4, #0xa
	b _021FEE1C
_021FEE1A:
	mov r4, #0x64
_021FEE1C:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r7, [r5, r0]
	ldr r0, [sp, #0x10]
	mov r6, #0
	cmp r0, #0
	bls _021FEE96
	add r5, #0xb4
_021FEE2C:
	add r0, r7, #0
	add r1, r4, #0
	bl _u32_div_f
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, #1
	mov r3, #0
	bl String16_FormatInteger
	ldr r0, [sp, #0x18]
	add r1, r0, #0
	mul r1, r4
	sub r7, r7, r1
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x11
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEEA0 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x1c]
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	cmp r6, r0
	blo _021FEE2C
_021FEE96:
	ldr r0, [sp, #0x14]
	bl String_Delete
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FEEA0: .word 0x00010200
	thumb_func_end ov15_021FEDEC

	thumb_func_start ov15_021FEEA4
ov15_021FEEA4: ; 0x021FEEA4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x37
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0x1a
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	lsl r3, r3, #6
	mul r0, r1
	add r1, r2, r0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	ble _021FEEEA
	mov r2, #6
	ldrsh r2, [r1, r2]
	sub r3, #0x3c
	ldr r1, [r5, r3]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE5A4
	b _021FEEFE
_021FEEEA:
	mov r2, #6
	ldrsh r2, [r1, r2]
	sub r3, #0x3c
	ldr r1, [r5, r3]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE584
_021FEEFE:
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r2, #0x1a
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r2, r2, #6
	lsl r0, r0, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FEF40 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	add r0, r5, #0
	mov r1, #0
	bl BagApp_PrintMessage
	ldr r1, _021FEF44 ; =0x00000616
	strb r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FEF40: .word 0x000005E4
_021FEF44: .word 0x00000616
	thumb_func_end ov15_021FEEA4

	thumb_func_start BagApp_PrintMessage
BagApp_PrintMessage: ; 0x021FEF48
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	cmp r1, #0
	bne _021FEF58
	add r4, r5, #0
	add r4, #0x34
	b _021FEF6C
_021FEF58:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021FEF66
	bl GF_AssertFail
_021FEF66:
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r5, r0
_021FEF6C:
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021FEFB8 ; =0x000003E2
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl TextFlags_SetAutoScrollParam
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021FEFBC ; =BagApp_PrintMessageCallback
	ldr r2, _021FEFC0 ; =0x000005E4
	str r0, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021FEFB8: .word 0x000003E2
_021FEFBC: .word BagApp_PrintMessageCallback
_021FEFC0: .word 0x000005E4
	thumb_func_end BagApp_PrintMessage

	thumb_func_start BagApp_PrintMessageCallback
BagApp_PrintMessageCallback: ; 0x021FEFC4
	push {r3, lr}
	cmp r1, #4
	bhi _021FEFFC
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FEFD6: ; jump table
	.short _021FEFFC - _021FEFD6 - 2 ; case 0
	.short _021FEFE0 - _021FEFD6 - 2 ; case 1
	.short _021FEFE6 - _021FEFD6 - 2 ; case 2
	.short _021FEFEC - _021FEFD6 - 2 ; case 3
	.short _021FEFF4 - _021FEFD6 - 2 ; case 4
_021FEFE0:
	bl GF_IsAnySEPlaying
	pop {r3, pc}
_021FEFE6:
	bl IsFanfarePlaying
	pop {r3, pc}
_021FEFEC:
	ldr r0, _021FF000 ; =SEQ_SE_DP_PC_LOGIN
	bl PlaySE
	b _021FEFFC
_021FEFF4:
	ldr r0, _021FF000 ; =SEQ_SE_DP_PC_LOGIN
	bl IsSEPlaying
	pop {r3, pc}
_021FEFFC:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021FF000: .word SEQ_SE_DP_PC_LOGIN
	thumb_func_end BagApp_PrintMessageCallback

	thumb_func_start BagApp_CreateYesNoPrompt
BagApp_CreateYesNoPrompt: ; 0x021FF004
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x81
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #0x19
	strb r0, [r2, #0x10]
	mov r0, #6
	strb r0, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	bic r3, r1
	strb r3, [r2, #0x12]
	mov r1, #0
	strb r1, [r2, #0x13]
	bl YesNoPrompt_Create
	ldr r1, _021FF054 ; =0x00000804
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0
	bl YesNoPrompt_InitFromTemplate
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021FF054: .word 0x00000804
	thumb_func_end BagApp_CreateYesNoPrompt

	thumb_func_start BagApp_DestroyYesNoPrompt
BagApp_DestroyYesNoPrompt: ; 0x021FF058
	ldr r1, _021FF060 ; =0x00000804
	ldr r3, _021FF064 ; =YesNoPrompt_Destroy
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021FF060: .word 0x00000804
_021FF064: .word YesNoPrompt_Destroy
	thumb_func_end BagApp_DestroyYesNoPrompt

	thumb_func_start ov15_021FF068
ov15_021FF068: ; 0x021FF068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r6, #0x89
	add r5, r0, #0
	lsl r6, r6, #2
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0x53
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, _021FF0F0 ; =0x00000684
	add r0, r6, #0
	ldr r3, [r5, r2]
	sub r2, r2, #4
	ldrsh r2, [r5, r2]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mul r2, r3
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	add r0, r6, #0
	ldr r1, _021FF0F4 ; =0x000005E4
	add r0, #0xd0
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r1, _021FF0F4 ; =0x000005E4
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF0F8 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FF0F4 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r6
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF0F0: .word 0x00000684
_021FF0F4: .word 0x000005E4
_021FF0F8: .word 0x00010200
	thumb_func_end ov15_021FF068

	thumb_func_start ov15_021FF0FC
ov15_021FF0FC: ; 0x021FF0FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #1
	add r7, r1, #0
	lsl r0, r0, #8
	mov r1, #6
	bl String_New
	mov r6, #0x85
	add r4, r0, #0
	lsl r6, r6, #2
	cmp r7, #0
	bne _021FF14E
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0xdc
	ldr r0, [r5, r0]
	mov r1, #0x50
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r5, r6
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r7, #0
	bl String_Delete
	b _021FF160
_021FF14E:
	mov r0, #0x48
	mov r1, #0
	str r0, [sp]
	mov r3, #0x10
	add r0, r5, r6
	add r2, r1, #0
	str r3, [sp, #4]
	bl FillWindowPixelRect
_021FF160:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x51
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl PlayerProfile_GetMoney
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC ; =0x00010200
	add r7, #8
	mov r3, #0x44
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r6
	add r2, r4, #0
	sub r3, r3, r7
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	bl String_Delete
	add r0, r4, #0
	bl String_Delete
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF1DC: .word 0x00010200
	thumb_func_end ov15_021FF0FC

	thumb_func_start ov15_021FF1E0
ov15_021FF1E0: ; 0x021FF1E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x54
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021FF294 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x73
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_Delete
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x74
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FF298 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_Delete
	ldr r1, _021FF298 ; =0x000005E4
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	ldr r2, _021FF298 ; =0x000005E4
	str r1, [sp, #8]
	ldr r2, [r5, r2]
	mov r5, #0x58
	add r0, r4, #0
	sub r3, r5, r3
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021FF294: .word 0x000003F7
_021FF298: .word 0x000005E4
	thumb_func_end ov15_021FF1E0

	thumb_func_start ov15_021FF29C
ov15_021FF29C: ; 0x021FF29C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	add r6, r1, #0
	ldr r0, [r5, r0]
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _021FF2EE
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r6, #0x30
	sub r3, r6, r3
	lsr r3, r3, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x74
	add r3, #8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	b _021FF308
_021FF2EE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x74
	mov r3, #5
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
_021FF308:
	add r5, #0x74
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF31C: .word 0x000F0E00
	thumb_func_end ov15_021FF29C

	thumb_func_start ov15_021FF320
ov15_021FF320: ; 0x021FF320
	push {r4, r5, r6, r7}
	add r3, r1, #0
	add r1, r2, #0
	ldr r2, _021FF360 ; =ov15_022008C8
	mov r5, #0
	ldrb r6, [r2, r3]
	add r4, r5, #0
	cmp r6, #0
	ble _021FF35A
	ldr r7, [r0]
	ldrb r2, [r2, r3]
	add r0, r7, #0
	add r6, r5, #0
	add r1, r1, #1
_021FF33C:
	ldrh r3, [r0]
	cmp r3, #0
	beq _021FF350
	add r3, r7, r6
	ldrh r3, [r3, #2]
	cmp r3, #0
	beq _021FF350
	add r5, r5, #1
	cmp r5, r1
	beq _021FF35A
_021FF350:
	add r4, r4, #1
	add r0, r0, #4
	add r6, r6, #4
	cmp r4, r2
	blt _021FF33C
_021FF35A:
	add r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021FF360: .word ov15_022008C8
	thumb_func_end ov15_021FF320

	thumb_func_start ov15_021FF364
ov15_021FF364: ; 0x021FF364
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r1, [sp, #0x10]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	str r3, [sp, #0x14]
	mul r0, r1
	add r0, r2, r0
	mov r1, #6
	str r0, [sp, #0x24]
	ldrb r2, [r0, #9]
	ldrsh r0, [r0, r1]
	sub r0, r2, r0
	str r0, [sp, #0x20]
	cmp r0, #6
	ble _021FF392
	str r1, [sp, #0x20]
_021FF392:
	ldr r0, _021FF4DC ; =0x0000068A
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021FF3A2
	mov r0, #0
	str r0, [sp, #0x18]
	mov r4, #6
	b _021FF3A8
_021FF3A2:
	mov r0, #6
	str r0, [sp, #0x18]
	mov r4, #0
_021FF3A8:
	ldr r1, _021FF4DC ; =0x0000068A
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	bl ov15_021FE17C
	mov r0, #0
	add r7, r5, #0
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x2c]
	add r7, #0xb4
_021FF3C2:
	lsl r0, r6, #4
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r0, r4, #4
	add r0, r7, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, [sp, #0x2c]
	add r6, r6, #1
	add r0, r0, #1
	add r4, r4, #1
	str r0, [sp, #0x2c]
	cmp r0, #6
	blt _021FF3C2
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #0
	add r1, #0x64
	ldrb r1, [r1]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x10]
	bl ov15_021FF320
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 ; =ov15_022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	bge _021FF4BE
	lsl r0, r4, #2
	str r0, [sp, #0x1c]
	add r7, r5, r0
	add r0, r5, #0
	str r0, [sp, #0x30]
	add r0, #0xb4
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x30]
_021FF41C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	add r1, r0, r1
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _021FF4A2
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021FF4A2
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021FF450
	ldr r1, [sp, #0x30]
	lsl r2, r6, #4
	add r1, r1, r2
	mov r2, #0x35
	str r4, [sp]
	lsl r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF450:
	ldr r0, _021FF4E4 ; =0x00000672
	ldrb r0, [r5, r0]
	cmp r4, r0
	bne _021FF470
	ldr r1, [sp, #0x30]
	lsl r2, r6, #4
	add r1, r1, r2
	mov r2, #0x35
	str r4, [sp]
	lsl r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF470:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF4E8 ; =0x00010200
	mov r2, #0x35
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r2, r2, #4
	ldr r0, [sp, #0x30]
	lsl r1, r6, #4
	add r0, r0, r1
	mov r1, #0
	ldr r2, [r7, r2]
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
_021FF494:
	ldr r0, [sp, #0x28]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x28]
	cmp r1, r0
	bge _021FF4BE
_021FF4A2:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp, #0x1c]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r7, r7, #4
	add r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 ; =ov15_022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	blt _021FF41C
_021FF4BE:
	mov r4, #0
	add r5, #0xb4
_021FF4C2:
	ldr r0, [sp, #0x18]
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r4, #6
	blt _021FF4C2
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF4DC: .word 0x0000068A
_021FF4E0: .word ov15_022008C8
_021FF4E4: .word 0x00000672
_021FF4E8: .word 0x00010200
	thumb_func_end ov15_021FF364

	thumb_func_start ov15_021FF4EC
ov15_021FF4EC: ; 0x021FF4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #0x8d
	add r7, r2, #0
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	add r5, r6, #0
	add r0, r2, #4
	add r2, #0x64
	str r0, [sp, #4]
	ldrb r2, [r2]
	mov r0, #0xc
	add r7, r7, r1
	mul r0, r2
	str r0, [sp, #8]
	mov r4, #0
	add r5, #0xb4
_021FF510:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _021FF510
	add r0, r6, #0
	bl ov15_021FE1D0
	add r0, r6, #0
	add r0, #0x64
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, #0
	bl ov15_021FE204
	lsl r2, r7, #2
	add r3, r6, r2
	mov r2, #0x35
	mov r1, #0x5d
	lsl r1, r1, #2
	str r7, [sp]
	lsl r2, r2, #4
	ldr r2, [r3, r2]
	ldr r4, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r6, r1
	add r3, r4, r3
	bl ov15_021FF570
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF4EC

	thumb_func_start ov15_021FF560
ov15_021FF560: ; 0x021FF560
	mov r1, #0x5d
	lsl r1, r1, #2
	ldr r3, _021FF56C ; =ClearWindowTilemapAndScheduleTransfer
	add r0, r0, r1
	bx r3
	nop
_021FF56C: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF560

	thumb_func_start ov15_021FF570
ov15_021FF570: ; 0x021FF570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r3, #0
	add r5, r0, #0
	ldrb r0, [r4, #8]
	add r6, r1, #0
	cmp r0, #3
	beq _021FF586
	cmp r0, #7
	beq _021FF5D8
	b _021FF632
_021FF586:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	lsl r7, r0, #2
	add r0, r5, #0
	add r1, r6, #0
	add r2, r2, r7
	mov r3, #0x10
	bl ov15_021FE914
	ldr r3, [r4]
	mov r0, #0x52
	ldrh r1, [r3, r7]
	lsl r0, r0, #2
	cmp r1, r0
	blo _021FF662
	add r0, #0x5b
	cmp r1, r0
	bhi _021FF662
	mov r1, #0xbd
	lsl r1, r1, #2
	add r3, r3, r7
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov15_021FF66C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF5D8:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x28]
	lsl r7, r0, #2
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Bag_GetRegisteredItem1
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF610
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	mov r3, #0
	bl ov15_021FE9F0
_021FF610:
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Bag_GetRegisteredItem2
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF662
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	mov r3, #1
	bl ov15_021FE9F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF632:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	ldr r3, [sp, #0x28]
	mov r1, #0xbd
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r4, [r4]
	lsl r3, r3, #2
	add r3, r4, r3
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov15_021FF66C
_021FF662:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FF668: .word 0x00010200
	thumb_func_end ov15_021FF570

	thumb_func_start ov15_021FF66C
ov15_021FF66C: ; 0x021FF66C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r6, r2, #0
	str r1, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r2, r3, #0
	add r5, r0, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x57
	mov r3, #6
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF6B8 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x30
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF6B8: .word 0x00010200
	thumb_func_end ov15_021FF66C

	thumb_func_start ov15_021FF6BC
ov15_021FF6BC: ; 0x021FF6BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r0, r2, r3
	mov r1, #6
	bl _s32_div_f
	add r6, r0, #0
	cmp r5, #0
	bne _021FF6D6
	mov r5, #1
	b _021FF6E0
_021FF6D6:
	add r0, r5, #5
	mov r1, #6
	bl _s32_div_f
	add r5, r0, #0
_021FF6E0:
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r6, #1
	mov r3, #3
	bl BufferIntegerAsString
	mov r1, #1
	str r1, [sp]
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r5, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r1, #0xbd
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x16
	mov r3, #6
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF754 ; =0x000F0100
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x64
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r4, #0x64
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF754: .word 0x000F0100
	thumb_func_end ov15_021FF6BC

	thumb_func_start ov15_021FF758
ov15_021FF758: ; 0x021FF758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r6, r0, #0
	add r5, r2, #0
	bl FillWindowPixelBuffer
	cmp r5, #0xff
	beq _021FF79E
	lsl r5, r5, #2
	add r0, r6, #0
	bl GetWindowWidth
	add r7, r0, #0
	mov r0, #0
	ldr r1, [r4, r5]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF7A8 ; =0x000F0E00
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r5]
	lsl r4, r7, #3
	sub r3, r4, r3
	add r0, r6, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterizedWithColor
_021FF79E:
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF7A8: .word 0x000F0E00
	thumb_func_end ov15_021FF758

	thumb_func_start ov15_021FF7AC
ov15_021FF7AC: ; 0x021FF7AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021FF7B2:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021FF7B2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF7AC

	thumb_func_start ov15_021FF7C4
ov15_021FF7C4: ; 0x021FF7C4
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF7F8 ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r4, r2
	mov r2, #0xc5
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	mov r3, #5
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF7F8: .word 0x000F0E00
	thumb_func_end ov15_021FF7C4

	thumb_func_start ov15_021FF7FC
ov15_021FF7FC: ; 0x021FF7FC
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF830 ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r4, r2
	mov r2, #0xcd
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	mov r3, #5
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF830: .word 0x000F0E00
	thumb_func_end ov15_021FF7FC

	thumb_func_start ov15_021FF834
ov15_021FF834: ; 0x021FF834
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r3, _021FF840 ; =ClearWindowTilemapAndScheduleTransfer
	add r0, r0, r1
	bx r3
	nop
_021FF840: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF834

	thumb_func_start ov15_021FF844
ov15_021FF844: ; 0x021FF844
	ldr r3, _021FF84C ; =ClearWindowTilemapAndScheduleTransfer
	add r0, #0x74
	bx r3
	nop
_021FF84C: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF844

	; file boundary

	thumb_func_start ov15_021FF850
ov15_021FF850: ; 0x021FF850
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r0, #0x20
	mov r1, #6
	bl GF_CreateVramTransferManager
	add r0, r4, #0
	bl ov15_021FFA40
	add r0, r4, #0
	bl ov15_021FFAD0
	add r0, r4, #0
	bl ov15_021FFDD8
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl SpriteSystem_GetRenderer
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	pop {r4, pc}
	thumb_func_end ov15_021FF850

	thumb_func_start ov15_021FF894
ov15_021FF894: ; 0x021FF894
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x25
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_021FF8A0:
	ldr r0, [r5, r7]
	bl Sprite_DeleteAndFreeResources
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blo _021FF8A0
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r6, r1]
	add r1, r1, #4
	ldr r1, [r6, r1]
	bl SpriteSystem_FreeResourcesAndManager
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl SpriteSystem_Free
	ldr r0, _021FF8D0 ; =0x0000069C
	ldr r0, [r6, r0]
	bl Heap_Free
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF8D0: .word 0x0000069C
	thumb_func_end ov15_021FF894

	thumb_func_start ov15_021FF8D4
ov15_021FF8D4: ; 0x021FF8D4
	push {r4, r5, r6, lr}
	mov r6, #0x25
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021FF8DE:
	ldr r0, [r5, r6]
	bl ManagedSprite_TickFrame
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blo _021FF8DE
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF8D4

	thumb_func_start ov15_021FF8F0
ov15_021FF8F0: ; 0x021FF8F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FF948 ; =0x0000C0FC
	mov r1, #0x92
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_ReplaceCharResObj
	add r0, r6, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FF94C ; =0x0000C0FB
	mov r1, #0x92
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_ReplacePlttResObj
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021FF948: .word 0x0000C0FC
_021FF94C: .word 0x0000C0FB
	thumb_func_end ov15_021FF8F0

	thumb_func_start ov15_021FF950
ov15_021FF950: ; 0x021FF950
	ldr r1, _021FF960 ; =0x0000064B
	mov r2, #0
	strb r2, [r0, r1]
	mov r2, #1
	sub r1, r1, #3
	strb r2, [r0, r1]
	bx lr
	nop
_021FF960: .word 0x0000064B
	thumb_func_end ov15_021FF950

	thumb_func_start ov15_021FF964
ov15_021FF964: ; 0x021FF964
	push {r3, lr}
	ldr r1, _021FF978 ; =0x00000648
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _021FF976
	cmp r1, #1
	bne _021FF976
	bl ov15_021FFEC0
_021FF976:
	pop {r3, pc}
	.balign 4, 0
_021FF978: .word 0x00000648
	thumb_func_end ov15_021FF964

	thumb_func_start ov15_021FF97C
ov15_021FF97C: ; 0x021FF97C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x9b
	lsl r0, r0, #2
	add r4, r2, #0
	add r6, r1, #0
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ManagedSprite_SetDrawFlag
	cmp r4, #0
	beq _021FFA34
	add r0, r6, #0
	bl TMHMGetMove
	mov r1, #3
	add r4, r0, #0
	bl GetMoveAttr
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #0
	mov r1, #1
	bl GetMoveAttr
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bl sub_020776B4
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021FFA38 ; =0x0000C103
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl SpriteSystem_ReplaceCharResObj
	add r0, r6, #0
	bl sub_0207769C
	add r1, r0, #0
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl ManagedSprite_SetPaletteOverride
	bl sub_02077830
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021FFA3C ; =0x0000C104
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl SpriteSystem_ReplaceCharResObj
	add r0, r4, #0
	bl sub_02077818
	add r1, r0, #0
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl ManagedSprite_SetPaletteOverride
_021FFA34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FFA38: .word 0x0000C103
_021FFA3C: .word 0x0000C104
	thumb_func_end ov15_021FF97C

	thumb_func_start ov15_021FFA40
ov15_021FFA40: ; 0x021FFA40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021FFAC4 ; =ov15_022009BC
	add r2, sp, #0x34
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #6
	bl SpriteSystem_Alloc
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl SpriteManager_New
	mov r7, #0x93
	lsl r7, r7, #2
	add r2, sp, #0x14
	ldr r3, _021FFAC8 ; =ov15_022009F4
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021FFACC ; =ov15_022009A8
	stmia r2!, {r0, r1}
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl SpriteSystem_Init
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x27
	bl SpriteSystem_InitSprites
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl SpriteSystem_InitManagerWithCapacities
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021FFAC4: .word ov15_022009BC
_021FFAC8: .word ov15_022009F4
_021FFACC: .word ov15_022009A8
	thumb_func_end ov15_021FFA40

	thumb_func_start ov15_021FFAD0
ov15_021FFAD0: ; 0x021FFAD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x1a
	bl SpriteSystem_LoadCharResObj
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #6
	bl SpriteSystem_LoadCharResObj
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x33
	bl SpriteSystem_LoadCharResObj
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB8 ; =0x0000C102
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #4
	bl SpriteSystem_LoadCharResObj
	mov r4, #0
	add r6, r4, #0
	mov r7, #2
_021FFB54:
	mov r0, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	ldr r0, _021FFDBC ; =0x0000C0FC
	str r6, [sp]
	mov r1, #0x93
	str r7, [sp, #4]
	add r0, r4, r0
	str r0, [sp, #8]
	mov r0, #0x92
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_LoadCharResObj
	add r4, r4, #1
	cmp r4, #6
	blt _021FFB54
	ldr r0, _021FFDC0 ; =0x0000C103
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #0
	bl sub_020776B8
	ldr r0, _021FFDC4 ; =0x0000C104
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #0
	bl sub_02077834
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	mov r2, #0xf
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r3, r2, #0
	bl SpriteSystem_LoadPlttResObj
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDC8 ; =0x0000C101
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #0xa
	bl SpriteSystem_LoadPlttResObj
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021FFDB8 ; =0x0000C102
	mov r2, #1
	bl sub_020776EC
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x2f
	bl SpriteSystem_LoadPlttResObj
	mov r4, #0
	add r6, r4, #0
	mov r7, #1
_021FFC2A:
	mov r0, #0
	mov r1, #2
	bl GetItemIndexMapping
	str r6, [sp]
	add r3, r0, #0
	mov r1, #0x93
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	lsl r1, r1, #2
	add r0, r4, r0
	str r0, [sp, #0xc]
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_LoadPlttResObj
	add r4, r4, #1
	cmp r4, #6
	blt _021FFC2A
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x19
	bl SpriteSystem_LoadCellResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #5
	bl SpriteSystem_LoadCellResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x31
	bl SpriteSystem_LoadCellResObj
	bl GetItemIconCell
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC ; =0x0000C0FC
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_LoadCellResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC ; =0x0000C0FD
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #5
	bl SpriteSystem_LoadCellResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x15
	bl SpriteSystem_LoadAnimResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x18
	bl SpriteSystem_LoadAnimResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #4
	bl SpriteSystem_LoadAnimResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC ; =0x0000C0FC
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x32
	bl SpriteSystem_LoadAnimResObj
	bl GetItemIconAnim
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC ; =0x0000C0FD
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl SpriteSystem_LoadAnimResObj
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDD0 ; =0x0000C0FE
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #6
	bl SpriteSystem_LoadAnimResObj
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r2, _021FFDD0 ; =0x0000C0FE
	ldr r1, [r5, r1]
	add r3, r2, #1
	bl sub_0207775C
	mov r2, #0x6a
	lsl r2, r2, #4
	mov r0, #0xf
	mov r1, #0x30
	add r2, r5, r2
	mov r3, #6
	bl GfGfxLoader_GetPlttData
	ldr r1, _021FFDD4 ; =0x0000069C
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFDAC: .word 0x0000C0F9
_021FFDB0: .word 0x0000C0FA
_021FFDB4: .word 0x0000C0FB
_021FFDB8: .word 0x0000C102
_021FFDBC: .word 0x0000C0FC
_021FFDC0: .word 0x0000C103
_021FFDC4: .word 0x0000C104
_021FFDC8: .word 0x0000C101
_021FFDCC: .word 0x0000C0FD
_021FFDD0: .word 0x0000C0FE
_021FFDD4: .word 0x0000069C
	thumb_func_end ov15_021FFAD0

	thumb_func_start ov15_021FFDD8
ov15_021FFDD8: ; 0x021FFDD8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021FFEBC ; =ov15_02200B0C
	mov r7, #0
	add r5, r6, #0
_021FFDE2:
	mov r0, #0x92
	mov r1, #0x93
	lsl r0, r0, #2
	lsl r1, r1, #2
	mov r3, #1
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	add r2, r4, #0
	lsl r3, r3, #0x14
	bl SpriteSystem_NewSpriteWithYOffset
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r7, r7, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r7, #0x27
	blo _021FFDE2
	add r0, r1, #0
	add r0, #0x4c
	ldr r0, [r6, r0]
	mov r1, #1
	bl ManagedSprite_SetPriority
	mov r7, #0xb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #6
_021FFE1C:
	ldr r0, [r4, r7]
	mov r1, #1
	bl ManagedSprite_SetPriority
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blo _021FFE1C
	mov r7, #0x9d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021FFE34:
	ldr r0, [r4, r7]
	mov r1, #1
	bl ManagedSprite_SetPriority
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blo _021FFE34
	add r0, r6, #0
	mov r1, #1
	bl ov15_02200458
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r7, #0xb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #6
_021FFE78:
	ldr r0, [r4, r7]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blo _021FFE78
	mov r7, #0x2d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_021FFE90:
	ldr r0, [r4, r7]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blo _021FFE90
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl ManagedSprite_SetPriority
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFEBC: .word ov15_02200B0C
	thumb_func_end ov15_021FFDD8

	thumb_func_start ov15_021FFEC0
ov15_021FFEC0: ; 0x021FFEC0
	ldr r1, _021FFEC8 ; =0x00000648
	mov r2, #0
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_021FFEC8: .word 0x00000648
	thumb_func_end ov15_021FFEC0

	thumb_func_start ov15_021FFECC
ov15_021FFECC: ; 0x021FFECC
	push {r3, r4, r5, lr}
	lsl r4, r1, #2
	ldr r1, _021FFF14 ; =ov15_02200AB8
	ldr r2, _021FFF18 ; =ov15_02200AB8 + 1
	add r5, r0, #0
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
	ldr r1, _021FFF1C ; =ov15_02200AB8 + 2
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetAnim
	ldr r1, _021FFF20 ; =ov15_02200AB8 + 3
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetPaletteOverride
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	pop {r3, r4, r5, pc}
	nop
_021FFF14: .word ov15_02200AB8
_021FFF18: .word ov15_02200AB8 + 1
_021FFF1C: .word ov15_02200AB8 + 2
_021FFF20: .word ov15_02200AB8 + 3
	thumb_func_end ov15_021FFECC

	thumb_func_start ov15_021FFF24
ov15_021FFF24: ; 0x021FFF24
	mov r1, #0x2a
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r3, _021FFF30 ; =ManagedSprite_SetDrawFlag
	mov r1, #0
	bx r3
	.balign 4, 0
_021FFF30: .word ManagedSprite_SetDrawFlag
	thumb_func_end ov15_021FFF24

	thumb_func_start ov15_021FFF34
ov15_021FFF34: ; 0x021FFF34
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #9
	blt _021FFF42
	bl GF_AssertFail
_021FFF42:
	cmp r4, #8
	bne _021FFF58
	ldr r1, _021FFFC8 ; =ov15_02200A34 + 2
	mov r0, #0x2a
	lsl r2, r4, #2
	lsl r0, r0, #4
	ldrb r1, [r1, r2]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetAnim
	b _021FFFA0
_021FFF58:
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r3, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r3, r0
	mov r0, #6
	ldr r3, _021FFFCC ; =0x00000672
	ldrsh r0, [r1, r0]
	ldrb r3, [r5, r3]
	add r0, r0, r4
	cmp r0, r3
	bne _021FFF84
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0xa
	bl ManagedSprite_SetAnim
	b _021FFFA0
_021FFF84:
	ldrb r1, [r1, #9]
	cmp r0, r1
	blt _021FFF96
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0x28
	bl ManagedSprite_SetAnim
	b _021FFFA0
_021FFF96:
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0x14
	bl ManagedSprite_SetAnim
_021FFFA0:
	ldr r1, _021FFFD0 ; =ov15_02200A34
	lsl r4, r4, #2
	ldr r2, _021FFFD4 ; =ov15_02200A34 + 1
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
	ldr r1, _021FFFD8 ; =ov15_02200A34 + 3
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetPaletteOverride
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FFFC8: .word ov15_02200A34 + 2
_021FFFCC: .word 0x00000672
_021FFFD0: .word ov15_02200A34
_021FFFD4: .word ov15_02200A34 + 1
_021FFFD8: .word ov15_02200A34 + 3
	thumb_func_end ov15_021FFF34

	thumb_func_start ov15_021FFFDC
ov15_021FFFDC: ; 0x021FFFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _021FFFEA
	bl GF_AssertFail
_021FFFEA:
	ldr r1, _02200020 ; =ov15_022009D4
	lsl r4, r4, #2
	ldr r2, _02200024 ; =ov15_022009D4 + 1
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
	ldr r1, _02200028 ; =ov15_022009D4 + 2
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetAnim
	ldr r1, _0220002C ; =ov15_022009D4 + 3
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl ManagedSprite_SetPaletteOverride
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02200020: .word ov15_022009D4
_02200024: .word ov15_022009D4 + 1
_02200028: .word ov15_022009D4 + 2
_0220002C: .word ov15_022009D4 + 3
	thumb_func_end ov15_021FFFDC

	thumb_func_start ov15_02200030
ov15_02200030: ; 0x02200030
	push {r3, r4, r5, lr}
	add r5, r1, #0
	cmp r5, #7
	bgt _02200058
	mov r1, #0x6a
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r2, #1
	ldr r4, [r0, #0xc]
	lsl r2, r2, #8
	add r0, r4, r2
	mov r1, #0
	bl GXS_LoadOBJPltt
	lsl r0, r5, #5
	add r0, r4, r0
	lsl r1, r5, #5
	mov r2, #0x20
	bl GXS_LoadOBJPltt
_02200058:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_02200030

	thumb_func_start ov15_0220005C
ov15_0220005C: ; 0x0220005C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bne _02200096
	mov r4, #0
	mov r6, #0xa9
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_02200074:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl ManagedSprite_SetDrawFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02200074
	mov r1, #0xaf
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02200096:
	mov r7, #0xa9
	mov r5, #0
	add r4, r0, #0
	lsl r7, r7, #2
_0220009E:
	cmp r5, r6
	bge _022000AC
	ldr r0, [r4, r7]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	b _022000B8
_022000AC:
	mov r0, #0xa9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_022000B8:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0220009E
	ldr r0, [sp, #4]
	cmp r0, #0
	blt _022000DC
	add r0, #0x15
	str r0, [sp, #4]
	lsl r1, r0, #2
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_022000DC:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022000F0
	mov r1, #0xaf
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_022000F0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220005C

	thumb_func_start ov15_022000F4
ov15_022000F4: ; 0x022000F4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r1, r3, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0xd]
	cmp r1, #6
	bhi _02200128
	add r0, #0x60
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	pop {r4, pc}
_02200128:
	add r0, #0x60
	ldr r0, [r4, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	pop {r4, pc}
	thumb_func_end ov15_022000F4

	thumb_func_start ov15_02200140
ov15_02200140: ; 0x02200140
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r6, _022001BC ; =ov15_02200B0C
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	add r5, r7, #0
_02200152:
	mov r0, #0x95
	mov r1, #0x34
	mov r2, #0x36
	lsl r0, r0, #2
	mov r3, #1
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
	ldr r0, [sp, #4]
	cmp r4, r0
	bge _0220019A
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0220018C
	ldr r3, [sp]
	mov r2, #6
	ldrsh r2, [r3, r2]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r2, r4
	lsl r2, r2, #1
	add r3, r7, r2
	ldr r2, _022001C0 ; =0x000006A4
	ldrh r2, [r3, r2]
	bl ov15_021FF8F0
_0220018C:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	b _022001A6
_0220019A:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_022001A6:
	add r4, r4, #1
	add r6, #0x34
	add r5, r5, #4
	cmp r4, #6
	blt _02200152
	add r0, r7, #0
	bl ov15_022000F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022001BC: .word ov15_02200B0C
_022001C0: .word 0x000006A4
	thumb_func_end ov15_02200140

	thumb_func_start ov15_022001C4
ov15_022001C4: ; 0x022001C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	str r0, [sp]
	add r4, r1, #0
	mov r7, #0
	add r0, r5, #0
	mov r1, #6
	mvn r7, r7
	bl _s32_div_f
	mov r1, #6
	add r2, r0, #0
	ldrsh r3, [r4, r1]
	mul r2, r1
	cmp r3, r2
	bne _022001EC
	add r0, r5, #0
	bl _s32_div_f
	add r7, r1, #0
_022001EC:
	ldr r4, _02200238 ; =ov15_02200B0C
	ldr r5, [sp]
	mov r6, #0
_022001F2:
	mov r0, #0x95
	mov r1, #0x34
	mov r2, #0x36
	lsl r0, r0, #2
	mov r3, #1
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
	cmp r6, r7
	bne _0220021A
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	b _02200226
_0220021A:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_02200226:
	add r6, r6, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r6, #6
	blt _022001F2
	ldr r0, [sp]
	bl ov15_022000F4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02200238: .word ov15_02200B0C
	thumb_func_end ov15_022001C4

	thumb_func_start ov15_0220023C
ov15_0220023C: ; 0x0220023C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x2a
	lsl r0, r0, #4
	add r6, r1, #0
	ldr r0, [r7, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	mov r4, #0
	add r5, r7, #0
_02200252:
	ldrb r0, [r6, r4]
	cmp r0, #0xff
	beq _02200266
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	b _02200272
_02200266:
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_02200272:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02200252
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220023C

	thumb_func_start ov15_02200294
ov15_02200294: ; 0x02200294
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0xb
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #6
_022002A0:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl ManagedSprite_SetDrawFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022002A0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_02200294

	thumb_func_start ov15_022002B4
ov15_022002B4: ; 0x022002B4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x95
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_022002C0:
	cmp r6, r4
	beq _022002CE
	ldr r0, [r5, r7]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	b _022002E0
_022002CE:
	mov r0, #0x95
	lsl r0, r0, #2
	mov r3, #1
	ldr r0, [r5, r0]
	mov r1, #0x56
	mov r2, #0x4c
	lsl r3, r3, #0x14
	bl ManagedSprite_SetPositionXYWithSubscreenOffset
_022002E0:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _022002C0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_022002B4

	thumb_func_start ov15_022002EC
ov15_022002EC: ; 0x022002EC
	mov r1, #0
	cmp r0, #0x64
	bge _022002F4
	mov r1, #1
_022002F4:
	cmp r0, #0xa
	bge _022002FA
	mov r1, #2
_022002FA:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov15_022002EC

	thumb_func_start ov15_02200300
ov15_02200300: ; 0x02200300
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r0, #2
	bne _0220031A
	add r0, r2, #0
	cmp r0, #0x63
	ble _0220031A
	mov r0, #0x63
	str r0, [sp, #4]
_0220031A:
	ldr r0, [sp]
	ldr r2, _02200414 ; =ov15_02200998
	sub r0, r0, #2
	lsl r1, r0, #2
	str r1, [sp, #8]
	ldr r1, [r2, r1]
	mov r7, #0
	cmp r1, #0
	ble _0220036C
	mov r1, #0x18
	mul r1, r0
	ldr r0, _02200418 ; =ov15_02200A58
	add r4, r0, r1
	ldr r0, _0220041C ; =ov15_02200A88
	add r6, r0, r1
_02200338:
	ldr r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	ldr r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [r6]
	bl ManagedSprite_SetAnim
	ldr r1, _02200414 ; =ov15_02200998
	ldr r0, [sp, #8]
	add r7, r7, #1
	ldr r0, [r1, r0]
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, r0
	blt _02200338
_0220036C:
	ldr r0, [sp, #4]
	bl ov15_022002EC
	cmp r0, #0
	beq _022003D4
	ldr r1, [sp]
	sub r1, r1, #2
	bne _0220039A
	cmp r0, #2
	bne _0220039A
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	b _022003D4
_0220039A:
	ldr r1, [sp]
	sub r1, r1, #2
	cmp r1, #1
	bne _022003D4
	sub r2, r0, #1
	ldr r0, _02200420 ; =ov15_022009A0
	lsl r7, r2, #2
	ldr r0, [r0, r7]
	mov r4, #0
	cmp r0, #0
	ble _022003D4
	ldr r1, _02200424 ; =ov15_02200A14
	lsl r0, r2, #4
	add r6, r1, r0
_022003B6:
	ldr r0, [r6]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	ldr r0, _02200420 ; =ov15_022009A0
	add r4, r4, #1
	ldr r0, [r0, r7]
	add r6, r6, #4
	cmp r4, r0
	blt _022003B6
_022003D4:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x25
	bl ManagedSprite_SetAnim
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl ManagedSprite_SetAnim
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02200414: .word ov15_02200998
_02200418: .word ov15_02200A58
_0220041C: .word ov15_02200A88
_02200420: .word ov15_022009A0
_02200424: .word ov15_02200A14
	thumb_func_end ov15_02200300

	thumb_func_start ov15_02200428
ov15_02200428: ; 0x02200428
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x2d
	str r0, [sp]
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #4
_02200436:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl ManagedSprite_SetDrawFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02200436
	mov r1, #0xba
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_02200428

	thumb_func_start ov15_02200458
ov15_02200458: ; 0x02200458
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r0, #0
	cmp r7, #1
	beq _0220046C
	cmp r7, #0
	beq _0220046C
	bl GF_AssertFail
_0220046C:
	add r0, sp, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	mov r6, #0
	add r4, r6, #0
_0220047A:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #8
	blo _0220048C
	bl GF_AssertFail
_0220048C:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r0, r4
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022004A2
	ldrb r2, [r1, #0xc]
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, r2]
_022004A2:
	add r6, r6, #1
	add r4, #0xc
	cmp r6, #8
	blt _0220047A
	mov r6, #0
	add r4, sp, #0
_022004AE:
	ldrb r0, [r4]
	cmp r0, #0
	beq _022004C2
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl ManagedSprite_SetDrawFlag
	b _022004CE
_022004C2:
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
_022004CE:
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #4
	cmp r6, #8
	blt _022004AE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_02200458

	thumb_func_start ov15_022004DC
ov15_022004DC: ; 0x022004DC
	mov r2, #0xa7
	lsl r2, r2, #2
	ldr r3, _022004E8 ; =ManagedSprite_SetDrawFlag
	ldr r0, [r0, r2]
	bx r3
	nop
_022004E8: .word ManagedSprite_SetDrawFlag
	thumb_func_end ov15_022004DC

	.rodata

	.global ov15_022004F4
ov15_022004F4: ; 0x022004F4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.size ov15_022004F4,.-ov15_022004F4

	.global ov15_02200500
ov15_02200500: ; 0x02200500
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size ov15_02200500,.-ov15_02200500

	.global ov15_0220050C
ov15_0220050C: ; 0x0220050C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x30, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00
	.size ov15_0220050C,.-ov15_0220050C

	.global ov15_02200518
ov15_02200518: ; 0x02200518
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.size ov15_02200518,.-ov15_02200518

	.global ov15_02200528
ov15_02200528: ; 0x02200528
	.byte 0x02, 0x02, 0x01, 0x01
	.byte 0x03, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x03
	.byte 0x01, 0x01, 0x02, 0x04
	.byte 0x04, 0x04, 0x03, 0x02
	.size ov15_02200528,.-ov15_02200528

	.global ov15_0220053C
ov15_0220053C: ; 0x0220053C
	.byte 0x51, 0x3B, 0x15, 0x00
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x00, 0x00, 0x00, 0x00
	.size ov15_0220053C,.-ov15_0220053C

	.global ov15_02200550
ov15_02200550:
	.byte 0x80, 0x9F, 0x00, 0x5D
	.byte 0x80, 0x9F, 0x60, 0xBF
	.byte 0xA0, 0xBF, 0x00, 0x5D
	.byte 0xA0, 0xBF, 0x60, 0xBF
	.byte 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov15_02200550,.-ov15_02200550

	.global ov15_02200568
ov15_02200568:
	.byte 0x58, 0x6F, 0x78, 0x97
	.byte 0x58, 0x6F, 0x98, 0xB7
	.byte 0x88, 0x9F, 0x78, 0x97
	.byte 0x88, 0x9F, 0x98, 0xB7
	.byte 0xA8, 0xBF, 0x60, 0xAD
	.byte 0xA8, 0xBF, 0xB2, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov15_02200568,.-ov15_02200568

	.global ov15_02200584
ov15_02200584: ; 0x02200584
	.byte 0x0C, 0x0A, 0x0E, 0x09
	.byte 0x10, 0x0B, 0x08, 0x0F
	.byte 0x08, 0x0C, 0x0E, 0x0B
	.byte 0x09, 0x0D, 0x0A, 0x0F
	.byte 0x0A, 0x08, 0x0E, 0x0D
	.byte 0x0B, 0x10, 0x0C, 0x0F
	.byte 0x0C, 0x08, 0x10, 0x10
	.byte 0x0C, 0x08, 0x10, 0x10
	.byte 0x0D, 0x09, 0x10, 0x10
	.size ov15_02200584,.-ov15_02200584

	.global ov15_022005A8
ov15_022005A8:
	.byte 0x58, 0x6F, 0x78, 0x97
	.byte 0x58, 0x6F, 0x98, 0xB7
	.byte 0x58, 0x6F, 0xB8, 0xD7
	.byte 0x88, 0x9F, 0x78, 0x97
	.byte 0x88, 0x9F, 0x98, 0xB7,
	.byte 0x88, 0x9F, 0xB8, 0xD7
	.byte 0xA8, 0xBF, 0x60, 0xAD
	.byte 0xA8, 0xBF, 0xB2, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov15_022005A8,.-ov15_022005A8

	.global ov15_022005CC
ov15_022005CC: ; 0x022005CC
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.size ov15_022005CC,.-ov15_022005CC

	.global ov15_022005F0
ov15_022005F0:
	.byte 0x20, 0x49, 0x00, 0x7F
	.byte 0x20, 0x49, 0x80, 0xFF
	.byte 0x4A, 0x75, 0x00, 0x7F
	.byte 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F
	.byte 0x76, 0x99, 0x80, 0xFF
	.byte 0xA8, 0xBF, 0x00, 0x27
	.byte 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov15_022005F0,.-ov15_022005F0

	.global ov15_02200618
ov15_02200618: ; 0x02200618
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.size ov15_02200618,.-ov15_02200618

	.global ov15_02200640
ov15_02200640: ; 0x02200640
	.byte 0x0C, 0x08, 0x07, 0x01
	.byte 0x0C, 0x08, 0x00, 0x02
	.byte 0x0C, 0x08, 0x01, 0x03
	.byte 0x0C, 0x08, 0x02, 0x04
	.byte 0x10, 0x09, 0x03, 0x05
	.byte 0x10, 0x09, 0x04, 0x06
	.byte 0x10, 0x09, 0x05, 0x07
	.byte 0x10, 0x09, 0x06, 0x00
	.byte 0x11, 0x0A, 0x0E, 0x09
	.byte 0x11, 0x0B, 0x08, 0x0F
	.byte 0x08, 0x0C, 0x0E, 0x0B
	.byte 0x09, 0x0D, 0x0A, 0x0F
	.byte 0x0A, 0x11, 0x0E, 0x0D
	.byte 0x0B, 0x10, 0x0C, 0x0F
	.byte 0x0C, 0x11, 0x10, 0x10
	.byte 0x0C, 0x11, 0x10, 0x10
	.byte 0x0D, 0x11, 0x10, 0x10
	.size ov15_02200640,.-ov15_02200640

	.global ov15_02200684
ov15_02200684:
	.byte 0x00, 0x1F, 0x00, 0x1F
	.byte 0x00, 0x1F, 0x20, 0x3F
	.byte 0x00, 0x1F, 0x40, 0x5F
	.byte 0x00, 0x1F, 0x60, 0x7F
	.byte 0x00, 0x1F, 0x80, 0x9F
	.byte 0x00, 0x1F, 0xA0, 0xBF
	.byte 0x00, 0x1F, 0xC0, 0xDF
	.byte 0x00, 0x1F, 0xE0, 0xFF
	.byte 0x20, 0x49, 0x00, 0x7F
	.byte 0x20, 0x49, 0x80, 0xFF
	.byte 0x4A, 0x75, 0x00, 0x7F
	.byte 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F
	.byte 0x76, 0x99, 0x80, 0xFF
	.byte 0xA8, 0xBF, 0x00, 0x27
	.byte 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov15_02200684,.-ov15_02200684

	.global ov15_022006CC
ov15_022006CC: ; 0x022006CC
	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000

	.word 0x00000000, 0x00000000, 0x00000800, 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000
	.size ov15_022006CC,.-ov15_022006CC

	.global ov15_02200790
ov15_02200790: ; 0x02200790
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEE, 0x19, 0x67, 0x00, 0x00, 0x00, 0x00, 0x55, 0x3B, 0x15, 0x00, 0x00, 0xB0, 0xFD, 0xFF
	.byte 0x87, 0xE0, 0x28, 0x48, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x0E, 0x00, 0x00, 0x20, 0xFD, 0xFF
	.byte 0x7F, 0xF0, 0x16, 0x78, 0x00, 0x00, 0x00, 0x00, 0x53, 0xEB, 0x14, 0x00, 0x02, 0x00, 0xFD, 0xFF
	.byte 0x75, 0x03, 0x22, 0x56, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x5B, 0x0B, 0x00, 0x01, 0xB0, 0xFB, 0xFF
	.byte 0x81, 0xE7, 0x27, 0x75, 0x00, 0x00, 0x00, 0x00, 0x58, 0xAB, 0x0C, 0x00, 0x06, 0x40, 0xFC, 0xFF
	.byte 0x7E, 0xE8, 0x1A, 0x74, 0x00, 0x00, 0x00, 0x00, 0x4F, 0x8B, 0x12, 0x00, 0xFE, 0x9F, 0xFC, 0xFF
	.byte 0x80, 0xEB, 0x1B, 0x92, 0x00, 0x00, 0x00, 0x00, 0x52, 0x1B, 0x0D, 0x00, 0x00, 0xA0, 0xFB, 0xFF
	.byte 0x87, 0x05, 0x1F, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0xFF, 0xFF, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEC, 0x20, 0x38, 0x00, 0x00, 0x00, 0x00, 0x53, 0x5B, 0x12, 0x00, 0x00, 0x30, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x51, 0xBB, 0x10, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x18, 0x5E, 0x00, 0x00, 0x00, 0x00, 0x53, 0x3B, 0x0D, 0x00, 0x01, 0x00, 0xFD, 0xFF
	.byte 0x7C, 0xF1, 0x1E, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x80, 0x01, 0x22, 0x32, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0C, 0x00, 0x00, 0xD0, 0xFC, 0xFF
	.byte 0x7B, 0xEC, 0x16, 0x81, 0x00, 0x00, 0x00, 0x00, 0x49, 0x7B, 0x0C, 0x00, 0x01, 0x30, 0xFC, 0xFF
	.byte 0x7D, 0xF1, 0x1F, 0x72, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0D, 0x00, 0x00, 0x60, 0xFD, 0xFF
	.byte 0x87, 0x05, 0x1D, 0x50, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.size ov15_02200790,.-ov15_02200790

	.global ov15_022008B0
ov15_022008B0: ; 0x022008B0
	.byte NUM_BAG_ITEMS
	.byte NUM_BAG_MEDICINE
	.byte NUM_BAG_BALLS
	.byte NUM_BAG_TMS_HMS
	.byte NUM_BAG_BERRIES
	.byte NUM_BAG_MAIL
	.byte NUM_BAG_BATTLE_ITEMS
	.byte NUM_BAG_KEY_ITEMS
	.size ov15_022008B0,.-ov15_022008B0

	.global ov15_022008B8
ov15_022008B8:
	.word Bag_Init, Bag_Main, Bag_Exit, 0xFFFFFFFF
	.size ov15_022008B8,.-ov15_022008B8

	; file boundary

	.global ov15_022008C8
ov15_022008C8: ; 0x022008C8
	.byte NUM_BAG_ITEMS
	.byte NUM_BAG_MEDICINE
	.byte NUM_BAG_BALLS
	.byte NUM_BAG_TMS_HMS
	.byte NUM_BAG_BERRIES
	.byte NUM_BAG_MAIL
	.byte NUM_BAG_BATTLE_ITEMS
	.byte NUM_BAG_KEY_ITEMS
	.size ov15_022008C8,.-ov15_022008C8

	.global ov15_022008D0
ov15_022008D0: ; 0x022008D0
	.byte 0x10, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.size ov15_022008D0,.-ov15_022008D0

	.global ov15_022008E8
ov15_022008E8: ; 0x022008E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.size ov15_022008E8,.-ov15_022008E8

	.global ov15_02200908
ov15_02200908: ; 0x02200908
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xBF, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x6F, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x9B, 0x01, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xC7, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xF3, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x1F, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x4B, 0x02, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x77, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xA3, 0x02, 0x00, 0x00
	.size ov15_02200908,.-ov15_02200908

	; file boundary

	.global ov15_02200998
ov15_02200998: ; 0x02200998
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.size ov15_02200998,.-ov15_02200998

	.global ov15_022009A0
ov15_022009A0: ; 0x022009A0
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.size ov15_022009A0,.-ov15_022009A0

	.global ov15_022009A8
ov15_022009A8: ; 0x022009A8
	.byte 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.size ov15_022009A8,.-ov15_022009A8

	.global ov15_022009BC
ov15_022009BC: ; 0x022009BC
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.size ov15_022009BC,.-ov15_022009BC

	.global ov15_022009D4
ov15_022009D4: ; 0x022009D4
	.byte 0x88, 0x68, 0x1D, 0x09
	.byte 0xA8, 0x68, 0x1D, 0x09
	.byte 0xC8, 0x68, 0x1D, 0x09
	.byte 0x88, 0xA0, 0x1D, 0x09
	.byte 0xA8, 0xA0, 0x1D, 0x09
	.byte 0xC8, 0xA0, 0x1D, 0x09
	.byte 0xA0, 0xB0, 0x11, 0x09
	.byte 0xE0, 0xB0, 0x11, 0x09
	.size ov15_022009D4,.-ov15_022009D4

	.global ov15_022009F4
ov15_022009F4: ; 0x022009F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00
	.size ov15_022009F4,.-ov15_022009F4

	.global ov15_02200A14
ov15_02200A14: ; 0x02200A14
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
	.size ov15_02200A14,.-ov15_02200A14

	.global ov15_02200A34
ov15_02200A34: ; 0x02200A34
	.byte 0x30, 0x38, 0x14, 0x09
	.byte 0xB0, 0x38, 0x14, 0x09
	.byte 0x30, 0x60, 0x14, 0x09
	.byte 0xB0, 0x60, 0x14, 0x09
	.byte 0x30, 0x88, 0x14, 0x09
	.byte 0xB0, 0x88, 0x14, 0x09
	.byte 0x18, 0xB0, 0x0E, 0x09
	.byte 0x40, 0xB0, 0x0E, 0x09
	.byte 0xE0, 0xB0, 0x11, 0x09
	.size ov15_02200A34,.-ov15_02200A34

	.global ov15_02200A58
ov15_02200A58: ; 0x02200A58
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.size ov15_02200A58,.-ov15_02200A58

	.global ov15_02200A88
ov15_02200A88: ; 0x02200A88
	.byte 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.size ov15_02200A88,.-ov15_02200A88

	.global ov15_02200AB8
ov15_02200AB8: ; 0x02200AB8
	.byte 0x10, 0x10, 0x08, 0x09
	.byte 0x30, 0x10, 0x08, 0x09
	.byte 0x50, 0x10, 0x08, 0x09
	.byte 0x70, 0x10, 0x08, 0x09
	.byte 0x90, 0x10, 0x08, 0x09
	.byte 0xB0, 0x10, 0x08, 0x09
	.byte 0xD0, 0x10, 0x08, 0x09
	.byte 0xF0, 0x10, 0x08, 0x09
	.byte 0x30, 0x38, 0x0A, 0x09
	.byte 0xB0, 0x38, 0x0A, 0x09
	.byte 0x30, 0x60, 0x0A, 0x09
	.byte 0xB0, 0x60, 0x0A, 0x09
	.byte 0x30, 0x88, 0x0A, 0x09
	.byte 0xB0, 0x88, 0x0A, 0x09
	.byte 0x18, 0xB0, 0x0E, 0x09
	.byte 0x40, 0xB0, 0x0E, 0x09
	.byte 0xE0, 0xB0, 0x11, 0x09
	.byte 0x30, 0x90, 0x17, 0x09
	.byte 0x90, 0x90, 0x17, 0x09
	.byte 0x30, 0xB0, 0x17, 0x09
	.byte 0x90, 0xB0, 0x17, 0x09
	.size ov15_02200AB8,.-ov15_02200AB8

	.global ov15_02200B0C
ov15_02200B0C: ; 0x02200B0C
	.byte 0xB1, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0xC1, 0x00, 0x00
	.byte 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0xC1, 0x00, 0x00, 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x58, 0x00, 0x00, 0x00, 0x13, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x14, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x90, 0x00
	.byte 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size ov15_02200B0C,.-ov15_02200B0C

	.data

	// passed to G3X_SetEdgeColorTable
	.global ov15_02201304
ov15_02201304: ; 0x02201304
	.short 0x294A, 0x112F, 0x5294, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
	.size ov15_02201304,.-ov15_02201304

	.global ov15_02201314
ov15_02201314: ; 0x02201314
	.word ov15_02200684
	.word ov15_02200550
	.word ov15_022005F0
	.word ov15_022005A8
	.word ov15_02200568
	.size ov15_02201314,.-ov15_02201314

	.global ov15_02201328
ov15_02201328: ; 0x02201328
	;        x     y     w     h
	.byte 0x00, 0x04, 0x10, 0x06
	.byte 0x10, 0x04, 0x10, 0x06
	.byte 0x00, 0x09, 0x10, 0x06
	.byte 0x10, 0x09, 0x10, 0x06
	.byte 0x00, 0x0E, 0x10, 0x06
	.byte 0x10, 0x0E, 0x10, 0x06
	.size ov15_02201328,.-ov15_02201328

	.global ov15_02201340
ov15_02201340: ; 0x02201340
	;        x     y     w     h
	.byte 0x00, 0x0B, 0x10, 0x09
	.byte 0x10, 0x06, 0x10, 0x10

	.byte 0x00, 0x0B, 0x20, 0x09
	.byte 0x00, 0x00, 0x00, 0x00

	.byte 0x00, 0x10, 0x10, 0x04
	.byte 0x10, 0x0B, 0x10, 0x09

	.byte 0x00, 0x10, 0x20, 0x04
	.byte 0x00, 0x00, 0x00, 0x00

	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x10, 0x10, 0x04
	.size ov15_02201340,.-ov15_02201340

	.global ov15_02201368
ov15_02201368: ; 0x02201368
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FBCAC
	.word ov15_021FC224
	.word ov15_021FC37C
	.word ov15_021FC3EC
	.word ov15_021FBC6C
	.word ov15_021FBC8C
	.word 0
	.word ov15_021FC3E0
	.word 0
	.word ov15_021FD3C0
	.word ov15_021FB680
	.size ov15_02201368,.-ov15_02201368

	.global ov15_022013A8
ov15_022013A8: ; 0x022013A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x20, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0A, 0x10, 0x0A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x0A, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x05, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x10, 0x0A, 0x10, 0x0A, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0F, 0x20, 0x05, 0x00

	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x10, 0x0F, 0x10, 0x05, 0x00
	.size ov15_022013A8,.-ov15_022013A8

	.global ov15_02201468
ov15_02201468: ; 0x02201468
	.byte 0x11, 0x12, 0x13, 0x14, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.size ov15_02201468,.-ov15_02201468
