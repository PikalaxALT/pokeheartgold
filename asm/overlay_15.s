#include "constants/sndseq.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0010.h"
	.include "macros.inc"
	.include "overlay_15.inc"
	.include "global.inc"

	.text

	.extern ov15_021FE17C
	.extern ov15_021FE1D0
	.extern ov15_021FE204
	.extern ov15_021FE914
	.extern ov15_021FE9F0
	.extern ov15_021FF320
	.extern ov15_021FF8F0

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
	.word 0x00000027
	.word 0x00020000
	.word 0x00004000
	.word 0x00000010
	.word 0x00000010
	.size ov15_022009A8,.-ov15_022009A8

	.global ov15_022009BC
ov15_022009BC: ; 0x022009BC
	.word 0x0000000C
	.word 0x0000000A
	.word 0x00000006
	.word 0x00000007
	.word 0x00000000
	.word 0x00000000
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
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
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
	.short 0x00B1, 0x000E, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000001
	.word 0x0000C0F9, 0x0000C0F9, 0x0000C0F9, 0x0000C0FA, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0016, 0x003B, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C0FC, 0x0000C0FB, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0098, 0x003B, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C0FD, 0x0000C0FC, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0016, 0x0064, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C0FE, 0x0000C0FD, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0098, 0x0064, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C0FF, 0x0000C0FE, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0016, 0x008B, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C100, 0x0000C0FF, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0098, 0x008B, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000002
	.word 0x0000C101, 0x0000C100, 0x0000C0FC, 0x0000C0FD, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0030, 0x0070, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000001
	.word 0x0000C103, 0x0000C102, 0x0000C0FE, 0x0000C0FF, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0090, 0x0070, 0x0000, 0x0000
	.word 0x00000000, 0x00000000, 0x00000001
	.word 0x0000C104, 0x0000C102, 0x0000C0FE, 0x0000C0FF, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0010, 0x0010, 0x0000, 0x0000
	.word 0x00000001, 0x00000000, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0030, 0x0010, 0x0000, 0x0001
	.word 0x00000001, 0x00000001, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0050, 0x0010, 0x0000, 0x0002
	.word 0x00000001, 0x00000002, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0070, 0x0010, 0x0000, 0x0003
	.word 0x00000001, 0x00000003, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0090, 0x0010, 0x0000, 0x0004
	.word 0x00000001, 0x00000004, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00B0, 0x0010, 0x0000, 0x0005
	.word 0x00000001, 0x00000005, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00D0, 0x0010, 0x0000, 0x0006
	.word 0x00000001, 0x00000006, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00F0, 0x0010, 0x0000, 0x0007
	.word 0x00000001, 0x00000007, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0018, 0x00B0, 0x0000, 0x000C
	.word 0x00000001, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0040, 0x00B0, 0x0000, 0x000D
	.word 0x00000001, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00E0, 0x00B0, 0x0000, 0x0010
	.word 0x00000001, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0010, 0x0010, 0x0000, 0x0008
	.word 0x00000000, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0010, 0x0030, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0090, 0x0030, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0010, 0x0058, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0090, 0x0058, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0010, 0x0080, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0090, 0x0080, 0x0000, 0x0013
	.word 0x00000001, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000001, 0x00000000

	.short 0x0010, 0x0030, 0x0000, 0x0014
	.word 0x00000000, 0x00000009, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0030, 0x0090, 0x0000, 0x0016
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0090, 0x0090, 0x0000, 0x0016
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0030, 0x00B0, 0x0000, 0x0016
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0090, 0x00B0, 0x0000, 0x0016
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0088, 0x0068, 0x0000, 0x0019
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00A8, 0x0068, 0x0000, 0x0019
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00C8, 0x0068, 0x0000, 0x0019
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0088, 0x0098, 0x0000, 0x001B
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00A8, 0x0098, 0x0000, 0x001B
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x00C8, 0x0098, 0x0000, 0x001B
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000

	.short 0x0088, 0x00B0, 0x0000, 0x001F
	.word 0x00000000, 0x00000008, 0x00000002
	.word 0x0000C0FB, 0x0000C0FA, 0x0000C0FB, 0x0000C0FC, 0x00000000, 0x00000000
	.word 0x00000000, 0x00000000
	.size ov15_02200B0C,.-ov15_02200B0C
