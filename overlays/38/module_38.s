
	thumb_func_start ov38_0221BA00
ov38_0221BA00: @ 0x0221BA00
	lsls r1, r0, #0x10
	orrs r1, r0
	ldr r0, _0221BA0C @ =0x02226020
	str r1, [r0]
	bx lr
	nop
_0221BA0C: .4byte 0x02226020
	thumb_func_end ov38_0221BA00

	thumb_func_start ov38_0221BA10
ov38_0221BA10: @ 0x0221BA10
	ldr r1, _0221BA2C @ =0x02226020
	movs r0, #0x45
	ldr r2, [r1]
	adds r3, r2, #0
	muls r3, r0, r3
	ldr r0, _0221BA30 @ =0x00001111
	adds r2, r3, r0
	ldr r0, _0221BA34 @ =0x7FFFFFFF
	ands r0, r2
	str r0, [r1]
	asrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0221BA2C: .4byte 0x02226020
_0221BA30: .4byte 0x00001111
_0221BA34: .4byte 0x7FFFFFFF
	thumb_func_end ov38_0221BA10

	thumb_func_start ov38_0221BA38
ov38_0221BA38: @ 0x0221BA38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0
	adds r5, r2, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	str r0, [sp, #0x10]
	adds r0, #8
	adds r7, r1, #0
	str r3, [sp]
	str r0, [sp, #0x10]
	bl ov38_0221BB44
	ldr r1, [sp, #0x30]
	adds r0, r0, #1
	cmp r1, r0
	bge _0221BA62
	add sp, #0x18
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221BA62:
	ldr r1, [sp, #0x10]
	movs r0, #0xa
	blx FUN_021EC2A8
	adds r6, r0, #0
	bne _0221BA74
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221BA74:
	lsrs r0, r4, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	lsrs r1, r4, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r0, r1
	lsrs r1, r4, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r0, r1
	lsls r1, r4, #0x18
	lsrs r4, r1, #0x18
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r0, r1
	str r0, [sp, #0x14]
	movs r0, #0
	cmp r5, #0
	ble _0221BAC0
_0221BAB2:
	ldrb r2, [r7, r0]
	ldr r1, [sp, #0x14]
	adds r0, r0, #1
	adds r1, r1, r2
	str r1, [sp, #0x14]
	cmp r0, r5
	blt _0221BAB2
_0221BAC0:
	ldr r0, [sp, #0x14]
	bl ov38_0221BA00
	bl ov38_0221BA10
	eors r0, r4
	strb r0, [r6, #4]
	bl ov38_0221BA10
	ldr r1, [sp, #0xc]
	eors r0, r1
	strb r0, [r6, #5]
	bl ov38_0221BA10
	ldr r1, [sp, #8]
	eors r0, r1
	strb r0, [r6, #6]
	bl ov38_0221BA10
	ldr r1, [sp, #4]
	movs r4, #0
	eors r0, r1
	strb r0, [r6, #7]
	cmp r5, #0
	ble _0221BB04
_0221BAF2:
	bl ov38_0221BA10
	ldrb r1, [r7, r4]
	eors r1, r0
	adds r0, r6, r4
	adds r4, r4, #1
	strb r1, [r0, #8]
	cmp r4, r5
	blt _0221BAF2
_0221BB04:
	ldr r1, _0221BB40 @ =0x4A3B2C1D
	ldr r0, [sp, #0x14]
	adds r5, #8
	eors r1, r0
	lsrs r0, r1, #0x18
	strb r0, [r6]
	lsrs r0, r1, #0x10
	strb r0, [r6, #1]
	lsrs r0, r1, #8
	strb r0, [r6, #2]
	strb r1, [r6, #3]
	ldr r1, [sp]
	adds r0, r6, #0
	adds r2, r5, #0
	movs r3, #2
	blx FUN_021FFC18
	ldr r0, [sp, #0x10]
	bl ov38_0221BB44
	ldr r1, [sp]
	movs r2, #0
	strb r2, [r1, r0]
	movs r0, #0xa
	adds r1, r6, #0
	blx FUN_021EC2EC
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221BB40: .4byte 0x4A3B2C1D
	thumb_func_end ov38_0221BA38

	thumb_func_start ov38_0221BB44
ov38_0221BB44: @ 0x0221BB44
	push {r3, r4, r5, lr}
	movs r1, #3
	adds r5, r0, #0
	blx FUN_020F2BA4
	cmp r1, #0
	beq _0221BB56
	movs r4, #1
	b _0221BB58
_0221BB56:
	movs r4, #0
_0221BB58:
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r0, r0, r4
	lsls r0, r0, #2
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov38_0221BB44

	thumb_func_start ov38_0221BB68
ov38_0221BB68: @ 0x0221BB68
	adds r0, #8
	cmp r0, #7
	bhi _0221BBC2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221BB7A: @ jump table
	.2byte _0221BB8A - _0221BB7A - 2 @ case 0
	.2byte _0221BBC2 - _0221BB7A - 2 @ case 1
	.2byte _0221BB92 - _0221BB7A - 2 @ case 2
	.2byte _0221BB9A - _0221BB7A - 2 @ case 3
	.2byte _0221BBA2 - _0221BB7A - 2 @ case 4
	.2byte _0221BBAA - _0221BB7A - 2 @ case 5
	.2byte _0221BBB2 - _0221BB7A - 2 @ case 6
	.2byte _0221BBBA - _0221BB7A - 2 @ case 7
_0221BB8A:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #0
	str r1, [r0, #8]
	bx lr
_0221BB92:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #1
	str r1, [r0, #8]
	bx lr
_0221BB9A:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #2
	str r1, [r0, #8]
	bx lr
_0221BBA2:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #3
	str r1, [r0, #8]
	bx lr
_0221BBAA:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #4
	str r1, [r0, #8]
	bx lr
_0221BBB2:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #5
	str r1, [r0, #8]
	bx lr
_0221BBBA:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #6
	str r1, [r0, #8]
	bx lr
_0221BBC2:
	ldr r0, _0221BBCC @ =0x02225040
	movs r1, #0
	str r1, [r0, #8]
	bx lr
	nop
_0221BBCC: .4byte 0x02225040
	thumb_func_end ov38_0221BB68

	thumb_func_start ov38_0221BBD0
ov38_0221BBD0: @ 0x0221BBD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r4, r1, #0
	movs r3, #0
	ldr r1, _0221BE58 @ =0x02225040
	mvns r3, r3
	str r3, [r1, #4]
	ldr r3, [r1]
	adds r6, r0, #0
	cmp r3, #1
	bne _0221BBE8
	b _0221BE52
_0221BBE8:
	cmp r2, #0
	beq _0221BBEE
	b _0221BDA2
_0221BBEE:
	cmp r3, #4
	beq _0221BBFA
	cmp r3, #6
	beq _0221BCC6
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BBFA:
	cmp r4, #0x20
	bne _0221BCBE
	ldr r5, [r1, #0x28]
	ldr r3, _0221BE5C @ =_02224E4C
	adds r5, #0x14
	add r2, sp, #4
	movs r1, #0x11
_0221BC08:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0221BC08
	add r3, sp, #0x14
	ldr r2, _0221BE60 @ =0x02225074
	adds r3, #1
	movs r1, #0x15
_0221BC1C:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r3]
	adds r3, r3, #1
	subs r1, r1, #1
	bne _0221BC1C
	add r0, sp, #0x14
	adds r0, #1
	adds r1, r6, #0
	adds r2, r4, #0
	blx FUN_020E96E4
	add r0, sp, #0x14
	adds r0, #1
	blx FUN_020E9580
	add r1, sp, #0x14
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, #1
	blx FUN_020E3798
	ldr r0, _0221BE58 @ =0x02225040
	ldr r1, _0221BE64 @ =0x0222508C
	ldr r0, [r0, #0x24]
	blx FUN_020E96B4
	movs r2, #0
	ldr r4, _0221BE58 @ =0x02225040
	adds r3, r2, #0
	add r1, sp, #4
	movs r7, #0xf
_0221BC5C:
	ldrb r0, [r5, r2]
	asrs r0, r0, #4
	ldrsb r6, [r1, r0]
	ldr r0, [r4, #0x28]
	strb r6, [r0, r3]
	ldrb r0, [r5, r2]
	ldr r6, [r4, #0x28]
	adds r2, r2, #1
	ands r0, r7
	ldrsb r0, [r1, r0]
	adds r6, r6, r3
	adds r3, r3, #2
	strb r0, [r6, #1]
	cmp r2, #0x14
	blt _0221BC5C
	ldr r0, _0221BE58 @ =0x02225040
	movs r2, #0
	ldr r1, [r0, #0x28]
	adds r1, #0x28
	strb r2, [r1]
	ldr r0, [r0, #0x24]
	ldr r1, _0221BE68 @ =0x02225094
	blx FUN_020E96B4
	ldr r3, _0221BE58 @ =0x02225040
	ldr r0, [r3, #0x30]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	ldr r2, [r3, #0x18]
	ldr r3, [r3, #0x2c]
	bl ov38_0221BA38
	cmp r0, #0
	beq _0221BCB4
	cmp r0, #1
	beq _0221BCAA
	cmp r0, #2
	bne _0221BCB4
_0221BCAA:
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCB4:
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #5
	str r1, [r0]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCBE:
	movs r0, #1
	str r0, [r1]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCC6:
	cmp r4, #0x16
	bne _0221BD70
	ldr r1, _0221BE6C @ =0x0222509C
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BCE4
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1a
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BCE4:
	ldr r1, _0221BE70 @ =0x022250B4
	adds r0, r6, #0
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BD00
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1b
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD00:
	ldr r1, _0221BE74 @ =0x022250CC
	adds r0, r6, #0
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BD1C
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1c
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD1C:
	ldr r1, _0221BE78 @ =0x022250E4
	adds r0, r6, #0
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BD38
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1d
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD38:
	ldr r1, _0221BE7C @ =0x022250FC
	adds r0, r6, #0
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BD54
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1e
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD54:
	ldr r1, _0221BE80 @ =0x02225114
	adds r0, r6, #0
	movs r2, #0x16
	blx FUN_020E9848
	cmp r0, #0
	bne _0221BD70
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x1f
	str r1, [r0, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BD70:
	ldr r0, _0221BE58 @ =0x02225040
	ldr r2, [r0, #0x20]
	cmp r4, r2
	ldr r0, [r0, #0x1c]
	bgt _0221BD8A
	adds r1, r6, #0
	adds r2, r4, #0
	blx FUN_020E5AD8
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #7
	str r1, [r0]
	b _0221BD9A
_0221BD8A:
	adds r1, r6, #0
	blx FUN_020E5AD8
	ldr r0, _0221BE58 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	movs r1, #0x20
	str r1, [r0, #8]
_0221BD9A:
	ldr r0, _0221BE58 @ =0x02225040
	add sp, #0x4c
	str r4, [r0, #0xc]
	pop {r4, r5, r6, r7, pc}
_0221BDA2:
	movs r0, #1
	str r0, [r1]
	cmp r2, #0x13
	bhi _0221BE52
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221BDB6: @ jump table
	.2byte _0221BE52 - _0221BDB6 - 2 @ case 0
	.2byte _0221BDDE - _0221BDB6 - 2 @ case 1
	.2byte _0221BDE6 - _0221BDB6 - 2 @ case 2
	.2byte _0221BDEE - _0221BDB6 - 2 @ case 3
	.2byte _0221BDF6 - _0221BDB6 - 2 @ case 4
	.2byte _0221BDFE - _0221BDB6 - 2 @ case 5
	.2byte _0221BE06 - _0221BDB6 - 2 @ case 6
	.2byte _0221BE0E - _0221BDB6 - 2 @ case 7
	.2byte _0221BE16 - _0221BDB6 - 2 @ case 8
	.2byte _0221BE1E - _0221BDB6 - 2 @ case 9
	.2byte _0221BE26 - _0221BDB6 - 2 @ case 10
	.2byte _0221BE2E - _0221BDB6 - 2 @ case 11
	.2byte _0221BE36 - _0221BDB6 - 2 @ case 12
	.2byte _0221BE52 - _0221BDB6 - 2 @ case 13
	.2byte _0221BE52 - _0221BDB6 - 2 @ case 14
	.2byte _0221BE3E - _0221BDB6 - 2 @ case 15
	.2byte _0221BE46 - _0221BDB6 - 2 @ case 16
	.2byte _0221BE52 - _0221BDB6 - 2 @ case 17
	.2byte _0221BE52 - _0221BDB6 - 2 @ case 18
	.2byte _0221BE4E - _0221BDB6 - 2 @ case 19
_0221BDDE:
	movs r0, #8
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDE6:
	movs r0, #9
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDEE:
	movs r0, #0xa
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDF6:
	movs r0, #0xb
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BDFE:
	movs r0, #0xc
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE06:
	movs r0, #0xd
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE0E:
	movs r0, #0xe
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE16:
	movs r0, #0xf
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE1E:
	movs r0, #0x10
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE26:
	movs r0, #0x11
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE2E:
	movs r0, #0x12
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE36:
	movs r0, #0x13
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE3E:
	movs r0, #0x16
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE46:
	movs r0, #0x17
	str r0, [r1, #8]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
_0221BE4E:
	movs r0, #0x19
	str r0, [r1, #8]
_0221BE52:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_0221BE58: .4byte 0x02225040
_0221BE5C: .4byte _02224E4C
_0221BE60: .4byte 0x02225074
_0221BE64: .4byte 0x0222508C
_0221BE68: .4byte 0x02225094
_0221BE6C: .4byte 0x0222509C
_0221BE70: .4byte 0x022250B4
_0221BE74: .4byte 0x022250CC
_0221BE78: .4byte 0x022250E4
_0221BE7C: .4byte 0x022250FC
_0221BE80: .4byte 0x02225114
	thumb_func_end ov38_0221BBD0

	thumb_func_start ov38_0221BE84
ov38_0221BE84: @ 0x0221BE84
	push {r3, lr}
	ldr r0, _0221BEA4 @ =0x02225040
	movs r1, #2
	str r1, [r0]
	subs r1, r1, #3
	str r1, [r0, #4]
	movs r0, #0
	blx FUN_021FA0B4
	cmp r0, #0
	bne _0221BEA0
	ldr r0, _0221BEA4 @ =0x02225040
	movs r1, #1
	str r1, [r0]
_0221BEA0:
	pop {r3, pc}
	nop
_0221BEA4: .4byte 0x02225040
	thumb_func_end ov38_0221BE84

	thumb_func_start ov38_0221BEA8
ov38_0221BEA8: @ 0x0221BEA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	ldr r1, _0221BF38 @ =0x02225040
	adds r4, r3, #0
	ldr r3, [r1]
	adds r7, r0, #0
	cmp r3, #2
	beq _0221BEBC
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221BEBC:
	str r5, [r1, #0x10]
	str r2, [r1, #0x14]
	str r4, [r1, #0x18]
	ldr r2, [sp, #0x18]
	adds r4, #8
	str r2, [r1, #0x1c]
	ldr r2, [sp, #0x1c]
	str r2, [r1, #0x20]
	blx FUN_020E9580
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov38_0221BB44
	adds r1, r0, #0
	adds r6, #0x45
	movs r0, #0xa
	adds r1, r6, r1
	blx FUN_021EC2A8
	ldr r1, _0221BF38 @ =0x02225040
	cmp r0, #0
	str r0, [r1, #0x24]
	bne _0221BEF0
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221BEF0:
	ldr r1, _0221BF3C @ =0x0222512C
	adds r2, r7, #0
	adds r3, r5, #0
	blx FUN_020E7F30
	ldr r0, _0221BF38 @ =0x02225040
	ldr r6, [r0, #0x24]
	adds r0, r6, #0
	blx FUN_020E9580
	adds r5, r0, #0
	ldr r0, _0221BF40 @ =0x0222508C
	blx FUN_020E9580
	adds r1, r6, r5
	adds r1, r1, r0
	ldr r0, _0221BF38 @ =0x02225040
	str r1, [r0, #0x28]
	ldr r0, _0221BF44 @ =0x02225094
	blx FUN_020E9580
	ldr r1, _0221BF38 @ =0x02225040
	ldr r2, [r1, #0x28]
	adds r2, #0x28
	adds r0, r2, r0
	str r0, [r1, #0x2c]
	adds r0, r4, #0
	bl ov38_0221BB44
	adds r1, r0, #1
	ldr r0, _0221BF38 @ =0x02225040
	str r1, [r0, #0x30]
	movs r1, #3
	str r1, [r0]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221BF38: .4byte 0x02225040
_0221BF3C: .4byte 0x0222512C
_0221BF40: .4byte 0x0222508C
_0221BF44: .4byte 0x02225094
	thumb_func_end ov38_0221BEA8

	thumb_func_start ov38_0221BF48
ov38_0221BF48: @ 0x0221BF48
	push {r3, lr}
	ldr r1, _0221BFE0 @ =0x02225040
	ldr r0, [r1]
	cmp r0, #7
	bhi _0221BFD8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221BF5E: @ jump table
	.2byte _0221BFD8 - _0221BF5E - 2 @ case 0
	.2byte _0221BFD8 - _0221BF5E - 2 @ case 1
	.2byte _0221BFD8 - _0221BF5E - 2 @ case 2
	.2byte _0221BF6E - _0221BF5E - 2 @ case 3
	.2byte _0221BF94 - _0221BF5E - 2 @ case 4
	.2byte _0221BFA4 - _0221BF5E - 2 @ case 5
	.2byte _0221BFCA - _0221BF5E - 2 @ case 6
	.2byte _0221BFD8 - _0221BF5E - 2 @ case 7
_0221BF6E:
	ldr r0, [r1, #0x24]
	ldr r1, _0221BFE4 @ =ov38_0221BBD0
	ldr r2, _0221BFE8 @ =0x02225040
	blx FUN_021FA21C
	ldr r1, _0221BFE0 @ =0x02225040
	str r0, [r1, #4]
	bl ov38_0221BB68
	ldr r0, _0221BFE0 @ =0x02225040
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _0221BF8E
	movs r1, #4
	str r1, [r0]
	b _0221BFD8
_0221BF8E:
	movs r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BF94:
	blx FUN_021FA118
	cmp r0, #0
	bne _0221BFD8
	ldr r0, _0221BFE0 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BFA4:
	ldr r0, [r1, #0x24]
	ldr r1, _0221BFE4 @ =ov38_0221BBD0
	ldr r2, _0221BFE8 @ =0x02225040
	blx FUN_021FA21C
	ldr r1, _0221BFE0 @ =0x02225040
	str r0, [r1, #4]
	bl ov38_0221BB68
	ldr r0, _0221BFE0 @ =0x02225040
	ldr r1, [r0, #4]
	cmp r1, #0
	blt _0221BFC4
	movs r1, #6
	str r1, [r0]
	b _0221BFD8
_0221BFC4:
	movs r1, #1
	str r1, [r0]
	b _0221BFD8
_0221BFCA:
	blx FUN_021FA118
	cmp r0, #0
	bne _0221BFD8
	ldr r0, _0221BFE0 @ =0x02225040
	movs r1, #1
	str r1, [r0]
_0221BFD8:
	ldr r0, _0221BFE0 @ =0x02225040
	ldr r0, [r0]
	pop {r3, pc}
	nop
_0221BFE0: .4byte 0x02225040
_0221BFE4: .4byte ov38_0221BBD0
_0221BFE8: .4byte 0x02225040
	thumb_func_end ov38_0221BF48

	thumb_func_start ov38_0221BFEC
ov38_0221BFEC: @ 0x0221BFEC
	push {r3, lr}
	ldr r0, _0221C010 @ =0x02225040
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _0221C004
	movs r0, #0xa
	movs r2, #0
	blx FUN_021EC2EC
	ldr r0, _0221C010 @ =0x02225040
	movs r1, #0
	str r1, [r0, #0x24]
_0221C004:
	blx FUN_021FA0D8
	ldr r0, _0221C010 @ =0x02225040
	movs r1, #1
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0221C010: .4byte 0x02225040
	thumb_func_end ov38_0221BFEC

	thumb_func_start ov38_0221C014
ov38_0221C014: @ 0x0221C014
	ldr r0, _0221C01C @ =0x02225040
	ldr r0, [r0, #8]
	bx lr
	nop
_0221C01C: .4byte 0x02225040
	thumb_func_end ov38_0221C014

	thumb_func_start ov38_0221C020
ov38_0221C020: @ 0x0221C020
	ldr r0, _0221C028 @ =0x02225040
	ldr r0, [r0, #0xc]
	bx lr
	nop
_0221C028: .4byte 0x02225040
	thumb_func_end ov38_0221C020

	arm_func_start FUN_0221C02C
FUN_0221C02C: @ 0x0221C02C
	push {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0221C050
	ldr r0, _0221C0A8 @ =0x022251D4
	ldr r1, _0221C0AC @ =0x022251DC
	ldr r2, _0221C0B0 @ =0x02225168
	mov r3, #0x20
	bl FUN_020E4A9C
_0221C050:
	cmp r4, #0
	bgt _0221C06C
	ldr r0, _0221C0B4 @ =0x022251EC
	ldr r1, _0221C0AC @ =0x022251DC
	ldr r2, _0221C0B0 @ =0x02225168
	mov r3, #0x21
	bl FUN_020E4A9C
_0221C06C:
	cmp r5, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	cmp r4, #0
	movle r0, #0
	pople {r3, r4, r5, pc}
	ldmib r5, {r0, r1}
	add r4, r1, r4
	mov r1, r4
	bl FUN_021EC3BC
	cmp r0, #0
	moveq r0, #0
	stmibne r5, {r0, r4}
	movne r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C0A8: .4byte 0x022251D4
_0221C0AC: .4byte 0x022251DC
_0221C0B0: .4byte 0x02225168
_0221C0B4: .4byte 0x022251EC
	arm_func_end FUN_0221C02C

	arm_func_start FUN_0221C0B8
FUN_0221C0B8: @ 0x0221C0B8
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _0221C0E4
	ldr r0, _0221C1BC @ =0x02225200
	ldr r1, _0221C1C0 @ =0x022251DC
	ldr r2, _0221C1C4 @ =0x02225148
	mov r3, #0x43
	bl FUN_020E4A9C
_0221C0E4:
	cmp r6, #0
	bne _0221C100
	ldr r0, _0221C1C8 @ =0x022251D4
	ldr r1, _0221C1C0 @ =0x022251DC
	ldr r2, _0221C1C4 @ =0x02225148
	mov r3, #0x44
	bl FUN_020E4A9C
_0221C100:
	cmp r5, #0
	bgt _0221C11C
	ldr r0, _0221C1CC @ =0x0222520C
	ldr r1, _0221C1C0 @ =0x022251DC
	ldr r2, _0221C1C4 @ =0x02225148
	mov r3, #0x45
	bl FUN_020E4A9C
_0221C11C:
	cmp r4, #0
	bgt _0221C138
	ldr r0, _0221C1D0 @ =0x022251EC
	ldr r1, _0221C1C0 @ =0x022251DC
	ldr r2, _0221C1C4 @ =0x02225148
	mov r3, #0x46
	bl FUN_020E4A9C
_0221C138:
	cmp r7, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	movle r0, #0
	pople {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	movle r0, #0
	pople {r3, r4, r5, r6, r7, pc}
	str r7, [r6]
	mov r2, #0
	str r2, [r6, #4]
	str r2, [r6, #8]
	str r2, [r6, #0xc]
	str r2, [r6, #0x10]
	str r4, [r6, #0x14]
	str r2, [r6, #0x18]
	str r2, [r6, #0x1c]
	mov r0, r6
	mov r1, r5
	str r2, [r6, #0x20]
	bl FUN_0221C02C
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #4]
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221C1BC: .4byte 0x02225200
_0221C1C0: .4byte 0x022251DC
_0221C1C4: .4byte 0x02225148
_0221C1C8: .4byte 0x022251D4
_0221C1CC: .4byte 0x0222520C
_0221C1D0: .4byte 0x022251EC
	arm_func_end FUN_0221C0B8

	arm_func_start FUN_0221C1D4
FUN_0221C1D4: @ 0x0221C1D4
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _0221C200
	ldr r0, _0221C2B8 @ =0x02225200
	ldr r1, _0221C2BC @ =0x022251DC
	ldr r2, _0221C2C0 @ =0x02225178
	mov r3, #0x74
	bl FUN_020E4A9C
_0221C200:
	cmp r6, #0
	bne _0221C21C
	ldr r0, _0221C2C4 @ =0x022251D4
	ldr r1, _0221C2BC @ =0x022251DC
	ldr r2, _0221C2C0 @ =0x02225178
	mov r3, #0x75
	bl FUN_020E4A9C
_0221C21C:
	cmp r5, #0
	bne _0221C238
	ldr r0, _0221C2C8 @ =0x0222521C
	ldr r1, _0221C2BC @ =0x022251DC
	ldr r2, _0221C2C0 @ =0x02225178
	mov r3, #0x76
	bl FUN_020E4A9C
_0221C238:
	cmp r4, #0
	bgt _0221C254
	ldr r0, _0221C2CC @ =0x02225228
	ldr r1, _0221C2BC @ =0x022251DC
	ldr r2, _0221C2C0 @ =0x02225178
	mov r3, #0x77
	bl FUN_020E4A9C
_0221C254:
	cmp r7, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	movle r0, #0
	pople {r3, r4, r5, r6, r7, pc}
	str r7, [r6]
	str r5, [r6, #4]
	str r4, [r6, #8]
	mov r2, #0
	str r2, [r6, #0xc]
	str r2, [r6, #0x14]
	mov r0, #1
	str r0, [r6, #0x18]
	str r0, [r6, #0x1c]
	str r2, [r6, #0x20]
	ldr r1, [r6, #4]
	strb r2, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221C2B8: .4byte 0x02225200
_0221C2BC: .4byte 0x022251DC
_0221C2C0: .4byte 0x02225178
_0221C2C4: .4byte 0x022251D4
_0221C2C8: .4byte 0x0222521C
_0221C2CC: .4byte 0x02225228
	arm_func_end FUN_0221C1D4

	arm_func_start FUN_0221C2D0
FUN_0221C2D0: @ 0x0221C2D0
	push {r4, lr}
	movs r4, r0
	bne _0221C2F0
	ldr r0, _0221C324 @ =0x022251D4
	ldr r1, _0221C328 @ =0x022251DC
	ldr r2, _0221C32C @ =0x02225138
	mov r3, #0x9b
	bl FUN_020E4A9C
_0221C2F0:
	cmp r4, #0
	ldrne r0, [r4, #4]
	cmpne r0, #0
	popeq {r4, pc}
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _0221C310
	bl FUN_021EC3D8
_0221C310:
	mov r0, r4
	mov r1, #0
	mov r2, #0x24
	bl FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
_0221C324: .4byte 0x022251D4
_0221C328: .4byte 0x022251DC
_0221C32C: .4byte 0x02225138
	arm_func_end FUN_0221C2D0

	arm_func_start FUN_0221C330
FUN_0221C330: @ 0x0221C330
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	movs sb, r0
	mov r8, r1
	ldr r6, [sb]
	bne _0221C360
	ldr r0, _0221C5D4 @ =0x022251D4
	ldr r1, _0221C5D8 @ =0x022251DC
	ldr r2, _0221C5DC @ =0x022251A4
	mov r3, #0xb7
	bl FUN_020E4A9C
_0221C360:
	cmp r8, #0
	bne _0221C37C
	ldr r0, _0221C5E0 @ =0x02225234
	ldr r1, _0221C5D8 @ =0x022251DC
	ldr r2, _0221C5DC @ =0x022251A4
	mov r3, #0xb8
	bl FUN_020E4A9C
_0221C37C:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bge _0221C39C
	ldr r0, _0221C5E4 @ =0x0222523C
	ldr r1, _0221C5D8 @ =0x022251DC
	ldr r2, _0221C5DC @ =0x022251A4
	mov r3, #0xb9
	bl FUN_020E4A9C
_0221C39C:
	cmp sb, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r8, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, sb, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x30]
	cmp r0, #0
	addlt sp, sp, #0xc
	movlt r0, #0
	poplt {r4, r5, r6, r7, r8, sb, lr}
	addlt sp, sp, #0x10
	bxlt lr
	bne _0221C3F8
	mov r0, r8
	bl FUN_020E9580
	str r0, [sp, #0x30]
_0221C3F8:
	ldr r0, [sb, #0x20]
	cmp r0, #1
	bne _0221C500
	ldr r0, [r6, #0x168]
	cmp r0, #0
	bne _0221C424
	ldr r0, _0221C5E8 @ =0x0222524C
	ldr r1, _0221C5D8 @ =0x022251DC
	ldr r2, _0221C5DC @ =0x022251A4
	mov r3, #0xce
	bl FUN_020E4A9C
_0221C424:
	add r5, sp, #8
	add r4, sp, #0x30
_0221C42C:
	ldr r2, [sb, #8]
	ldr r1, [sb, #0xc]
	mov r0, r6
	sub r1, r2, r1
	str r1, [sp, #8]
	ldr r3, [sb, #4]
	ldr r1, [sb, #0xc]
	mov r2, r8
	add r1, r3, r1
	stm sp, {r1, r5}
	ldr r7, [r6, #0x17c]
	mov r3, r4
	add r1, r6, #0x164
	blx r7
	mov r7, r0
	cmp r7, #2
	bne _0221C4E4
	ldr r0, [sb, #0x18]
	cmp r0, #0
	beq _0221C4A8
	ldr r0, [sb]
	mov r1, #1
	str r1, [r0, #0xfc]
	ldr r0, [sb]
	mov r1, #2
	str r1, [r0, #0x38]
	add sp, sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
_0221C4A8:
	ldr r1, [sb, #0x14]
	mov r0, sb
	bl FUN_0221C02C
	cmp r0, #0
	beq _0221C4F4
	ldr r0, [sb]
	mov r2, #1
	str r2, [r0, #0xfc]
	ldr r1, [sb]
	add sp, sp, #0xc
	str r2, [r1, #0x38]
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
_0221C4E4:
	ldr r1, [sb, #0xc]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [sb, #0xc]
_0221C4F4:
	cmp r7, #2
	beq _0221C42C
	b _0221C5C0
_0221C500:
	ldr r2, [sb, #0xc]
	ldr r1, [sp, #0x30]
	ldr r0, [sb, #8]
	add r4, r2, r1
	cmp r4, r0
	blt _0221C598
_0221C518:
	ldr r0, [sb, #0x18]
	cmp r0, #0
	beq _0221C550
	ldr r0, [sb]
	mov r1, #1
	str r1, [r0, #0xfc]
	ldr r0, [sb]
	mov r1, #2
	str r1, [r0, #0x38]
	add sp, sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
_0221C550:
	ldr r1, [sb, #0x14]
	mov r0, sb
	bl FUN_0221C02C
	cmp r0, #0
	bne _0221C58C
	ldr r0, [sb]
	mov r2, #1
	str r2, [r0, #0xfc]
	ldr r1, [sb]
	add sp, sp, #0xc
	str r2, [r1, #0x38]
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
_0221C58C:
	ldr r0, [sb, #8]
	cmp r4, r0
	bge _0221C518
_0221C598:
	ldr r3, [sb, #4]
	ldr r0, [sb, #0xc]
	ldr r2, [sp, #0x30]
	mov r1, r8
	add r0, r3, r0
	bl FUN_020E5AD8
	str r4, [sb, #0xc]
	ldr r0, [sb, #4]
	mov r1, #0
	strb r1, [r0, r4]
_0221C5C0:
	mov r0, #1
	add sp, sp, #0xc
	pop {r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0221C5D4: .4byte 0x022251D4
_0221C5D8: .4byte 0x022251DC
_0221C5DC: .4byte 0x022251A4
_0221C5E0: .4byte 0x02225234
_0221C5E4: .4byte 0x0222523C
_0221C5E8: .4byte 0x0222524C
	arm_func_end FUN_0221C330

	arm_func_start FUN_0221C5EC
FUN_0221C5EC: @ 0x0221C5EC
	push {r3, r4, r5, lr}
	mov r4, r2
	mov r2, #0
	mov r5, r0
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _0221C664 @ =0x02225288
	mov r0, r5
	mov r2, #2
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r1, _0221C668 @ =0x0222528C
	mov r0, r5
	mov r2, #2
	bl FUN_0221C330
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C664: .4byte 0x02225288
_0221C668: .4byte 0x0222528C
	arm_func_end FUN_0221C5EC

	arm_func_start FUN_0221C66C
FUN_0221C66C: @ 0x0221C66C
	push {r3, r4, lr}
	sub sp, sp, #4
	movs r4, r0
	strb r1, [sp]
	bne _0221C694
	ldr r0, _0221C6BC @ =0x022251D4
	ldr r1, _0221C6C0 @ =0x022251DC
	ldr r2, _0221C6C4 @ =0x0222518C
	ldr r3, _0221C6C8 @ =0x00000131
	bl FUN_020E4A9C
_0221C694:
	cmp r4, #0
	addeq sp, sp, #4
	moveq r0, #0
	popeq {r3, r4, pc}
	add r1, sp, #0
	mov r0, r4
	mov r2, #1
	bl FUN_0221C330
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221C6BC: .4byte 0x022251D4
_0221C6C0: .4byte 0x022251DC
_0221C6C4: .4byte 0x0222518C
_0221C6C8: .4byte 0x00000131
	arm_func_end FUN_0221C66C

	arm_func_start FUN_0221C6CC
FUN_0221C6CC: @ 0x0221C6CC
	push {r4, lr}
	sub sp, sp, #0x10
	mov r2, r1
	mov r4, r0
	ldr r1, _0221C700 @ =0x02225290
	add r0, sp, #0
	bl FUN_020E7F30
	add r1, sp, #0
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
	add sp, sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221C700: .4byte 0x02225290
	arm_func_end FUN_0221C6CC

	arm_func_start FUN_0221C704
FUN_0221C704: @ 0x0221C704
	push {r4, lr}
	movs r4, r0
	bne _0221C724
	ldr r0, _0221C73C @ =0x022251D4
	ldr r1, _0221C740 @ =0x022251DC
	ldr r2, _0221C744 @ =0x02225158
	mov r3, #0x16c
	bl FUN_020E4A9C
_0221C724:
	mov r1, #0
	str r1, [r4, #0xc]
	str r1, [r4, #0x10]
	ldr r0, [r4, #4]
	strb r1, [r0]
	pop {r4, pc}
	.align 2, 0
_0221C73C: .4byte 0x022251D4
_0221C740: .4byte 0x022251DC
_0221C744: .4byte 0x02225158
	arm_func_end FUN_0221C704

	arm_func_start FUN_0221C748
FUN_0221C748: @ 0x0221C748
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, #0
	add r5, sp, #4
	add r4, sp, #0
	mvn r8, #0
_0221C764:
	ldr r0, [r7, #0x48]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_021FF59C
	cmp r0, r8
	beq _0221C78C
	ldr r0, [sp]
	cmp r0, #0
	beq _0221C7B4
_0221C78C:
	mov r0, #1
	str r0, [r7, #0xfc]
	mov r0, #5
	str r0, [r7, #0x38]
	ldr r0, [r7, #0x48]
	bl FUN_021FFA60
	str r0, [r7, #0x4c]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221C7B4:
	ldr r0, [sp, #4]
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #1
	popeq {r4, r5, r6, r7, r8, pc}
	ldr r3, [r7, #0x60]
	ldr r1, [r7, #0x54]
	ldr r2, [r7, #0x5c]
	mov r0, r7
	add r1, r1, r3
	sub r2, r2, r3
	bl FUN_0221CD90
	cmp r0, r8
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	ldr r1, [r7, #0x60]
	add r1, r1, r0
	str r1, [r7, #0x60]
	ldr r0, [r7, #0x5c]
	cmp r1, r0
	blt _0221C764
	mov r0, #1
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end FUN_0221C748

	arm_func_start FUN_0221C818
FUN_0221C818: @ 0x0221C818
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	bne _0221C840
	ldr r0, _0221C8C0 @ =0x02225294
	ldr r1, _0221C8C4 @ =0x022251DC
	ldr r2, _0221C8C8 @ =0x022251BC
	ldr r3, _0221C8CC @ =0x000001B7
	bl FUN_020E4A9C
_0221C840:
	cmp r5, #0
	bne _0221C85C
	ldr r0, _0221C8D0 @ =0x022252A8
	ldr r1, _0221C8C4 @ =0x022251DC
	ldr r2, _0221C8C8 @ =0x022251BC
	mov r3, #0x1b8
	bl FUN_020E4A9C
_0221C85C:
	ldr r4, [r5]
	cmp r4, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0xc]
	sub r0, r0, r3
	cmp r0, #0
	movle r0, #0
	pople {r3, r4, r5, r6, r7, pc}
	ldr r1, [r7, #4]
	cmp r4, r0
	movge r4, r0
	mov r0, r6
	mov r2, r4
	add r1, r1, r3
	bl FUN_020E5AD8
	mov r0, #0
	strb r0, [r6, r4]
	str r4, [r5]
	ldr r1, [r7, #0x10]
	mov r0, #1
	add r1, r1, r4
	str r1, [r7, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221C8C0: .4byte 0x02225294
_0221C8C4: .4byte 0x022251DC
_0221C8C8: .4byte 0x022251BC
_0221C8CC: .4byte 0x000001B7
_0221C8D0: .4byte 0x022252A8
	arm_func_end FUN_0221C818

	arm_func_start FUN_0221C8D4
FUN_0221C8D4: @ 0x0221C8D4
	push {r3, r4, r5, lr}
	movs r5, r0
	bne _0221C8F4
	ldr r0, _0221C948 @ =0x022252FC
	ldr r1, _0221C94C @ =0x02225308
	ldr r2, _0221C950 @ =0x022252E0
	mov r3, #0x1b
	bl FUN_020E4A9C
_0221C8F4:
	ldr ip, [r5, #0x40]
	cmp ip, #0
	popeq {r3, r4, r5, pc}
	ldr r0, [r5, #0xc]
	cmp r0, #0
	movne r4, #0
	movne r3, r4
	ldreq r4, [r5, #0xc0]
	ldreq r3, [r5, #0x100]
	ldr r0, [r5, #0x44]
	mov r2, r4
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x38]
	blx ip
	cmp r4, #0
	popeq {r3, r4, r5, pc}
	cmp r0, #0
	moveq r0, #1
	streq r0, [r5, #0xd8]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C948: .4byte 0x022252FC
_0221C94C: .4byte 0x02225308
_0221C950: .4byte 0x022252E0
	arm_func_end FUN_0221C8D4

	arm_func_start FUN_0221C954
FUN_0221C954: @ 0x0221C954
	push {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _0221C980
	ldr r0, _0221C9C4 @ =0x022252FC
	ldr r1, _0221C9C8 @ =0x02225308
	ldr r2, _0221C9CC @ =0x022252C8
	mov r3, #0x45
	bl FUN_020E4A9C
_0221C980:
	ldr ip, [r6, #0x3c]
	cmp ip, #0
	addeq sp, sp, #0xc
	popeq {r3, r4, r5, r6, pc}
	ldr r0, [r6, #0x100]
	mov r2, r5
	str r0, [sp]
	ldr r0, [r6, #0x104]
	mov r3, r4
	str r0, [sp, #4]
	ldr r0, [r6, #0x44]
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [r6, #0x10]
	blx ip
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0221C9C4: .4byte 0x022252FC
_0221C9C8: .4byte 0x02225308
_0221C9CC: .4byte 0x022252C8
	arm_func_end FUN_0221C954

	arm_func_start FUN_0221C9D0
FUN_0221C9D0: @ 0x0221C9D0
	push {r4, lr}
	sub sp, sp, #8
	movs r4, r0
	bne _0221C9F4
	ldr r0, _0221CA38 @ =0x022252FC
	ldr r1, _0221CA3C @ =0x02225308
	ldr r2, _0221CA40 @ =0x022252B4
	mov r3, #0x5e
	bl FUN_020E4A9C
_0221C9F4:
	ldr r0, [r4, #0x150]
	cmp r0, #0
	addeq sp, sp, #8
	popeq {r4, pc}
	ldr r0, [r4, #0x140]
	bl FUN_021FE6E4
	str r0, [sp]
	ldr r0, [r4, #0x44]
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x148]
	ldr r2, [r4, #0x14c]
	ldr r3, [r4, #0x144]
	ldr ip, [r4, #0x150]
	blx ip
	add sp, sp, #8
	pop {r4, pc}
	.align 2, 0
_0221CA38: .4byte 0x022252FC
_0221CA3C: .4byte 0x02225308
_0221CA40: .4byte 0x022252B4
	arm_func_end FUN_0221C9D0

	arm_func_start FUN_0221CA44
FUN_0221CA44: @ 0x0221CA44
	bx lr
	arm_func_end FUN_0221CA44

	arm_func_start FUN_0221CA48
FUN_0221CA48: @ 0x0221CA48
	bx lr
	arm_func_end FUN_0221CA48

	arm_func_start FUN_0221CA4C
FUN_0221CA4C: @ 0x0221CA4C
	bx lr
	arm_func_end FUN_0221CA4C

	arm_func_start FUN_0221CA50
FUN_0221CA50: @ 0x0221CA50
	bx lr
	arm_func_end FUN_0221CA50

	arm_func_start FUN_0221CA54
FUN_0221CA54: @ 0x0221CA54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r1, #0
	mov r7, r0
	str r1, [sp, #0xc]
	str r1, [sp, #8]
	add r5, sp, #8
	add r4, sp, #0xc
_0221CA74:
	ldr ip, [r7, #0xa8]
	ldr r0, [r7, #0xa4]
	ldr r2, [r7, #0x9c]
	sub r0, r0, ip
	str r0, [sp, #0xc]
	ldr r3, [r7, #0x80]
	ldr r0, [r7, #0x7c]
	ldr r1, [r7, #0x78]
	sub r0, r0, r3
	str r0, [sp, #8]
	add r0, r1, r3
	stm sp, {r0, r5}
	ldr r6, [r7, #0x180]
	mov r0, r7
	mov r3, r4
	add r1, r7, #0x164
	add r2, r2, ip
	blx r6
	mov r6, r0
	cmp r6, #2
	bne _0221CAE4
	ldr r1, [r7, #0x88]
	add r0, r7, #0x74
	bl FUN_0221C02C
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
_0221CAE4:
	cmp r6, #2
	ldreq r0, [sp, #8]
	cmpeq r0, #0
	beq _0221CA74
	ldr r1, [r7, #0xa8]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	str r0, [r7, #0xa8]
	ldr r1, [r7, #0x80]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r7, #0x80]
	ldr r1, [r7, #0xa8]
	cmp r1, #0xff
	ble _0221CB54
	ldr r0, [r7, #0xa4]
	subs r4, r0, r1
	bne _0221CB38
	add r0, r7, #0x98
	bl FUN_0221C704
	b _0221CB54
_0221CB38:
	ldr r0, [r7, #0x9c]
	mov r2, r4
	add r1, r0, r1
	bl FUN_020E5AF8
	mov r0, #0
	str r0, [r7, #0xa8]
	str r4, [r7, #0xa4]
_0221CB54:
	cmp r6, #3
	addne sp, sp, #0x10
	mov r0, #1
	popne {r3, r4, r5, r6, r7, pc}
	str r0, [r7, #0xfc]
	mov r0, #0x11
	str r0, [r7, #0x38]
	mov r0, #0
	add sp, sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end FUN_0221CA54

	arm_func_start FUN_0221CB7C
FUN_0221CB7C: @ 0x0221CB7C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r2
	ldr r2, [r5]
	ldr r0, [r7, #0x134]
	mov r6, r1
	cmp r0, #0
	sub r4, r2, #1
	beq _0221CBD0
	bl FUN_021FF368
	ldr r1, _0221CD8C @ =0x0222531C
	ldr r3, [r7, #0x138]
	ldr r2, [r1]
	add r2, r3, r2
	cmp r0, r2
	movlo r0, #1
	poplo {r3, r4, r5, r6, r7, pc}
	str r0, [r7, #0x138]
	ldr r0, [r1, #4]
	cmp r4, r0
	movge r4, r0
_0221CBD0:
	ldr r1, [r7, #0x84]
	ldr r0, [r7, #0x80]
	cmp r1, r0
	bge _0221CC18
	mov r1, r6
	mov r2, r5
	add r0, r7, #0x74
	bl FUN_0221C818
	ldr r1, [r7, #0x84]
	ldr r0, [r7, #0x80]
	cmp r1, r0
	bne _0221CC10
	ldr r0, [r7, #0xf8]
	str r0, [r7, #0x80]
	ldr r0, [r7, #0xf8]
	str r0, [r7, #0x84]
_0221CC10:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221CC18:
	ldr r0, [r7, #0x48]
	mov r1, r6
	mov r2, r4
	mov r3, #0
	bl FUN_021FF92C
	mov r2, r0
	mvn r0, #0
	str r2, [sp]
	cmp r2, r0
	bne _0221CC88
	ldr r0, [r7, #0x48]
	bl FUN_021FFA60
	mvn r2, #5
	cmp r0, r2
	subne r1, r2, #0x14
	cmpne r0, r1
	subne r1, r2, #0x46
	cmpne r0, r1
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, pc}
	mov r2, #1
	str r2, [r7, #0xfc]
	mov r1, #5
	str r1, [r7, #0x38]
	str r0, [r7, #0x4c]
	str r2, [r7, #0x130]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0221CC88:
	cmp r2, #0
	bne _0221CCA0
	mov r0, #1
	str r0, [r7, #0x130]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221CCA0:
	ldr r0, [r7, #0x168]
	cmp r0, #0
	beq _0221CD6C
	mov r1, r6
	add r0, r7, #0x98
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #3
	popeq {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl FUN_0221CA54
	cmp r0, #0
	bne _0221CCEC
	mov r0, #1
	str r0, [r7, #0xfc]
	mov r0, #0x11
	str r0, [r7, #0x38]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0221CCEC:
	ldr r1, [r7, #0x80]
	ldr r0, [r7, #0x84]
	sub r0, r1, r0
	cmp r0, #0
	bgt _0221CD14
	mov r0, #0
	strb r0, [r6]
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221CD14:
	ldr r0, [r5]
	add r2, sp, #0
	sub r3, r0, #1
	mov r1, r6
	add r0, r7, #0x74
	str r3, [sp]
	bl FUN_0221C818
	cmp r0, #0
	moveq r0, #3
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r1, [r7, #0x84]
	ldr r0, [r7, #0x80]
	cmp r1, r0
	bne _0221CD5C
	ldr r0, [r7, #0xf8]
	str r0, [r7, #0x80]
	ldr r0, [r7, #0xf8]
	str r0, [r7, #0x84]
_0221CD5C:
	ldr r2, [sp]
	cmp r2, #0
	movle r0, #1
	pople {r3, r4, r5, r6, r7, pc}
_0221CD6C:
	mov r0, #0
	strb r0, [r6, r2]
	ldr r1, [sp]
	str r1, [r5]
	ldr r1, [sp]
	cmp r1, #0
	movle r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221CD8C: .4byte 0x0222531C
	arm_func_end FUN_0221CB7C

	arm_func_start FUN_0221CD90
FUN_0221CD90: @ 0x0221CD90
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x48]
	mov r3, #0
	bl FUN_021FF970
	mvn r1, #0
	cmp r0, r1
	bne _0221CDF4
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	mvn r2, #5
	cmp r0, r2
	subne r1, r2, #0x14
	cmpne r0, r1
	subne r1, r2, #0x46
	cmpne r0, r1
	moveq r0, #0
	popeq {r4, pc}
	mov r1, #1
	str r1, [r4, #0xfc]
	mov r1, #5
	str r1, [r4, #0x38]
	str r0, [r4, #0x4c]
	sub r0, r1, #6
	pop {r4, pc}
_0221CDF4:
	ldr r1, [r4, #0x10]
	cmp r1, #4
	ldreq r1, [r4, #0x148]
	addeq r1, r1, r0
	streq r1, [r4, #0x148]
	pop {r4, pc}
	arm_func_end FUN_0221CD90

	arm_func_start FUN_0221CE0C
FUN_0221CE0C: @ 0x0221CE0C
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r3, [r6, #0x5c]
	mov r5, r1
	mov r4, r2
	cmp r3, #0
	mov r3, #0
	bne _0221CE50
	bl FUN_0221CD90
	mov r3, r0
	mvn r0, #0
	cmp r3, r0
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	cmp r3, r4
	moveq r0, #1
	popeq {r4, r5, r6, pc}
_0221CE50:
	add r0, r6, #0x50
	add r1, r5, r3
	sub r2, r4, r3
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #0
	movne r0, #2
	pop {r4, r5, r6, pc}
	arm_func_end FUN_0221CE0C

	arm_func_start FUN_0221CE70
FUN_0221CE70: @ 0x0221CE70
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _0221CF7C @ =0x0222602C
	mov r0, #0
	ldr r3, [r1, #0xc]
	cmp r3, #0
	ble _0221CEA8
	ldr r2, [r1, #4]
_0221CE8C:
	ldr r1, [r2, r0, lsl #2]
	ldr r1, [r1]
	cmp r1, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r0, #1
	cmp r0, r3
	blt _0221CE8C
_0221CEA8:
	ldr r0, _0221CF7C @ =0x0222602C
	ldr r0, [r0]
	cmp r0, r3
	beq _0221CECC
	ldr r0, _0221CF80 @ =0x02225378
	ldr r1, _0221CF84 @ =0x022253A0
	ldr r2, _0221CF88 @ =0x02225324
	mov r3, #0x33
	bl FUN_020E4A9C
_0221CECC:
	ldr r0, _0221CF7C @ =0x0222602C
	ldr r6, [r0, #0xc]
	ldr r0, [r0, #4]
	add r5, r6, #4
	lsl r1, r5, #2
	bl FUN_021EC3BC
	cmp r0, #0
	mvneq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r8, _0221CF7C @ =0x0222602C
	mov r7, r6
	str r0, [r8, #4]
	cmp r6, r5
	bge _0221CF6C
	mov sb, #0
	mov r4, #0x184
_0221CF0C:
	mov r0, r4
	bl FUN_021EC3A8
	ldr r1, [r8, #4]
	str r0, [r1, r7, lsl #2]
	ldr r0, [r8, #4]
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	bne _0221CF5C
	sub r7, r7, #1
	cmp r7, r6
	blt _0221CF54
	ldr r4, _0221CF7C @ =0x0222602C
_0221CF3C:
	ldr r0, [r4, #4]
	ldr r0, [r0, r7, lsl #2]
	bl FUN_021EC3D8
	sub r7, r7, #1
	cmp r7, r6
	bge _0221CF3C
_0221CF54:
	mvn r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0221CF5C:
	add r7, r7, #1
	str sb, [r0]
	cmp r7, r5
	blt _0221CF0C
_0221CF6C:
	ldr r1, _0221CF7C @ =0x0222602C
	mov r0, r6
	str r5, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0221CF7C: .4byte 0x0222602C
_0221CF80: .4byte 0x02225378
_0221CF84: .4byte 0x022253A0
_0221CF88: .4byte 0x02225324
	arm_func_end FUN_0221CE70

	arm_func_start FUN_0221CF8C
FUN_0221CF8C: @ 0x0221CF8C
	push {r3, r4, r5, lr}
	bl FUN_0221CA4C
	bl FUN_0221CE70
	mov r5, r0
	mvn r0, #0
	cmp r5, r0
	bne _0221CFB4
	bl FUN_0221CA50
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221CFB4:
	ldr r0, _0221D120 @ =0x0222602C
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, #0x184
	ldr r4, [r0, r5, lsl #2]
	mov r0, r4
	bl FUN_020E5B44
	mov r0, #1
	str r0, [r4]
	ldr r0, _0221D120 @ =0x0222602C
	str r5, [r4, #4]
	ldr r2, [r0, #8]
	mov ip, #0
	add r1, r2, #1
	str r1, [r0, #8]
	str r2, [r4, #8]
	str ip, [r4, #0xc]
	str ip, [r4, #0x10]
	str ip, [r4, #0x14]
	str ip, [r4, #0x18]
	str ip, [r4, #0x1c]
	strh ip, [r4, #0x20]
	str ip, [r4, #0x24]
	str ip, [r4, #0x28]
	str ip, [r4, #0x2c]
	str ip, [r4, #0x30]
	str ip, [r4, #0x34]
	str ip, [r4, #0x38]
	str ip, [r4, #0x3c]
	str ip, [r4, #0x40]
	str ip, [r4, #0x44]
	sub r0, ip, #1
	str r0, [r4, #0x48]
	str ip, [r4, #0x4c]
	str ip, [r4, #0xe0]
	str ip, [r4, #0xe4]
	str ip, [r4, #0xe8]
	str ip, [r4, #0xec]
	str ip, [r4, #0xf0]
	str ip, [r4, #0xf4]
	str ip, [r4, #0xf8]
	str ip, [r4, #0xfc]
	str ip, [r4, #0x100]
	str r0, [r4, #0x104]
	str ip, [r4, #0x108]
	str ip, [r4, #0x10c]
	str ip, [r4, #0x110]
	str ip, [r4, #0x12c]
	str ip, [r4, #0x134]
	str ip, [r4, #0x138]
	str ip, [r4, #0x13c]
	mov r0, #0x1f4
	str r0, [r4, #0x158]
	add r0, r4, #0x100
	mov r1, #0x50
	strh r1, [r0, #0x60]
	str ip, [r4, #0x15c]
	mov r0, r4
	add r1, r4, #0x50
	mov r2, #0x800
	mov r3, #0x1000
	str ip, [r4, #0x164]
	bl FUN_0221C0B8
	cmp r0, #0
	beq _0221D0CC
	mov r2, #0x800
	mov r0, r4
	mov r3, r2
	add r1, r4, #0x74
	bl FUN_0221C0B8
_0221D0CC:
	cmp r0, #0
	beq _0221D0E8
	mov r0, r4
	add r1, r4, #0x98
	mov r2, #0x800
	mov r3, #0x400
	bl FUN_0221C0B8
_0221D0E8:
	cmp r0, #0
	bne _0221D104
	mov r0, r4
	bl FUN_0221D124
	bl FUN_0221CA50
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221D104:
	ldr r0, _0221D120 @ =0x0222602C
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bl FUN_0221CA50
	mov r0, r4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D120: .4byte 0x0222602C
	arm_func_end FUN_0221CF8C

	arm_func_start FUN_0221D124
FUN_0221D124: @ 0x0221D124
	push {r4, lr}
	movs r4, r0
	bne _0221D144
	ldr r0, _0221D2EC @ =0x022253B4
	ldr r1, _0221D2F0 @ =0x022253A0
	ldr r2, _0221D2F4 @ =0x02225334
	mov r3, #0xb3
	bl FUN_020E4A9C
_0221D144:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _0221D164
	ldr r0, _0221D2F8 @ =0x022253C0
	ldr r1, _0221D2F0 @ =0x022253A0
	ldr r2, _0221D2F4 @ =0x02225334
	mov r3, #0xb4
	bl FUN_020E4A9C
_0221D164:
	ldr r0, _0221D2FC @ =0x0222602C
	ldr r1, [r4, #4]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	blt _0221D18C
	ldr r0, _0221D300 @ =0x022253DC
	ldr r1, _0221D2F0 @ =0x022253A0
	ldr r2, _0221D2F4 @ =0x02225334
	mov r3, #0xb5
	bl FUN_020E4A9C
_0221D18C:
	ldr r0, [r4]
	cmp r0, #0
	bne _0221D1AC
	ldr r0, _0221D304 @ =0x02225404
	ldr r1, _0221D2F0 @ =0x022253A0
	ldr r2, _0221D2F4 @ =0x02225334
	mov r3, #0xb6
	bl FUN_020E4A9C
_0221D1AC:
	cmp r4, #0
	moveq r0, #0
	popeq {r4, pc}
	ldr r0, [r4]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	ldr r1, [r4, #4]
	cmp r1, #0
	movlt r0, #0
	poplt {r4, pc}
	ldr r0, _0221D2FC @ =0x0222602C
	ldr r0, [r0, #0xc]
	cmp r1, r0
	movge r0, #0
	popge {r4, pc}
	bl FUN_0221CA4C
	ldr r0, [r4, #0x14]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x18]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x24]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x28]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x108]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x15c]
	bl FUN_021EC3D8
	ldr r0, [r4, #0x48]
	mvn r1, #0
	cmp r0, r1
	beq _0221D240
	mov r1, #2
	bl FUN_021FF82C
	ldr r0, [r4, #0x48]
	bl FUN_021FF818
_0221D240:
	add r0, r4, #0x50
	bl FUN_0221C2D0
	add r0, r4, #0x74
	bl FUN_0221C2D0
	add r0, r4, #0x98
	bl FUN_0221C2D0
	add r0, r4, #0xbc
	bl FUN_0221C2D0
	ldr r0, [r4, #0x140]
	cmp r0, #0
	beq _0221D274
	mov r0, r4
	bl FUN_0221E0DC
_0221D274:
	ldr r0, [r4, #0x13c]
	cmp r0, #0
	beq _0221D29C
	bl FUN_0221DB00
	cmp r0, #0
	beq _0221D29C
	ldr r0, [r4, #0x13c]
	bl FUN_0221DB08
	mov r0, #0
	str r0, [r4, #0x13c]
_0221D29C:
	ldr r0, [r4, #0x16c]
	cmp r0, #0
	beq _0221D2C8
	ldr r2, [r4, #0x178]
	cmp r2, #0
	beq _0221D2C0
	mov r0, r4
	add r1, r4, #0x164
	blx r2
_0221D2C0:
	mov r0, #0
	str r0, [r4, #0x16c]
_0221D2C8:
	mov r1, #0
	ldr r0, _0221D2FC @ =0x0222602C
	str r1, [r4]
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
	bl FUN_0221CA50
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_0221D2EC: .4byte 0x022253B4
_0221D2F0: .4byte 0x022253A0
_0221D2F4: .4byte 0x02225334
_0221D2F8: .4byte 0x022253C0
_0221D2FC: .4byte 0x0222602C
_0221D300: .4byte 0x022253DC
_0221D304: .4byte 0x02225404
	arm_func_end FUN_0221D124

	arm_func_start FUN_0221D308
FUN_0221D308: @ 0x0221D308
	push {r4, lr}
	movs r4, r0
	bpl _0221D328
	ldr r0, _0221D394 @ =0x02225418
	ldr r1, _0221D398 @ =0x022253A0
	ldr r2, _0221D39C @ =0x02225360
	ldr r3, _0221D3A0 @ =0x00000101
	bl FUN_020E4A9C
_0221D328:
	ldr r0, _0221D3A4 @ =0x0222602C
	ldr r0, [r0, #0xc]
	cmp r4, r0
	blt _0221D34C
	ldr r0, _0221D3A8 @ =0x02225428
	ldr r1, _0221D398 @ =0x022253A0
	ldr r2, _0221D39C @ =0x02225360
	ldr r3, _0221D3AC @ =0x00000102
	bl FUN_020E4A9C
_0221D34C:
	bl FUN_0221CA4C
	cmp r4, #0
	blt _0221D368
	ldr r0, _0221D3A4 @ =0x0222602C
	ldr r1, [r0, #0xc]
	cmp r4, r1
	blt _0221D374
_0221D368:
	bl FUN_0221CA50
	mov r0, #0
	pop {r4, pc}
_0221D374:
	ldr r0, [r0, #4]
	ldr r4, [r0, r4, lsl #2]
	ldr r0, [r4]
	cmp r0, #0
	moveq r4, #0
	bl FUN_0221CA50
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_0221D394: .4byte 0x02225418
_0221D398: .4byte 0x022253A0
_0221D39C: .4byte 0x02225360
_0221D3A0: .4byte 0x00000101
_0221D3A4: .4byte 0x0222602C
_0221D3A8: .4byte 0x02225428
_0221D3AC: .4byte 0x00000102
	arm_func_end FUN_0221D308

	arm_func_start FUN_0221D3B0
FUN_0221D3B0: @ 0x0221D3B0
	push {r4, r5, r6, lr}
	ldr r1, _0221D410 @ =0x0222602C
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	pople {r4, r5, r6, pc}
	bl FUN_0221CA4C
	ldr r5, _0221D410 @ =0x0222602C
	mov r6, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	ble _0221D408
_0221D3E0:
	ldr r0, [r5, #4]
	ldr r0, [r0, r6, lsl #2]
	ldr r1, [r0]
	cmp r1, #0
	beq _0221D3F8
	blx r4
_0221D3F8:
	ldr r0, [r5, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _0221D3E0
_0221D408:
	bl FUN_0221CA50
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221D410: .4byte 0x0222602C
	arm_func_end FUN_0221D3B0

	arm_func_start FUN_0221D414
FUN_0221D414: @ 0x0221D414
	push {r4, lr}
	movs r4, r0
	bne _0221D434
	ldr r0, _0221D500 @ =0x022253B4
	ldr r1, _0221D504 @ =0x022253A0
	ldr r2, _0221D508 @ =0x02225348
	ldr r3, _0221D50C @ =0x00000132
	bl FUN_020E4A9C
_0221D434:
	ldr r0, [r4, #0x108]
	cmp r0, #0
	bne _0221D454
	ldr r0, _0221D510 @ =0x02225444
	ldr r1, _0221D504 @ =0x022253A0
	ldr r2, _0221D508 @ =0x02225348
	ldr r3, _0221D514 @ =0x00000133
	bl FUN_020E4A9C
_0221D454:
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x14]
	bl FUN_021EC3D8
	ldr r1, [r4, #0x108]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x108]
	ldr r0, [r4, #0x18]
	bl FUN_021EC3D8
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x24]
	bl FUN_021EC3D8
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x48]
	mov r1, #2
	bl FUN_021FF82C
	ldr r0, [r4, #0x48]
	bl FUN_021FF818
	mvn r1, #0
	add r0, r4, #0x50
	str r1, [r4, #0x48]
	bl FUN_0221C704
	add r0, r4, #0x74
	bl FUN_0221C704
	add r0, r4, #0x98
	bl FUN_0221C704
	mov r0, #0
	str r0, [r4, #0xe4]
	str r0, [r4, #0xe8]
	str r0, [r4, #0xec]
	str r0, [r4, #0xf0]
	str r0, [r4, #0xf4]
	str r0, [r4, #0xf8]
	str r0, [r4, #0x130]
	ldr r0, [r4, #0x10c]
	add r0, r0, #1
	str r0, [r4, #0x10c]
	pop {r4, pc}
	.align 2, 0
_0221D500: .4byte 0x022253B4
_0221D504: .4byte 0x022253A0
_0221D508: .4byte 0x02225348
_0221D50C: .4byte 0x00000132
_0221D510: .4byte 0x02225444
_0221D514: .4byte 0x00000133
	arm_func_end FUN_0221D414

	arm_func_start FUN_0221D518
FUN_0221D518: @ 0x0221D518
	push {r3, r4, r5, lr}
	ldr r0, _0221D588 @ =0x0222602C
	ldr r0, [r0, #4]
	cmp r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _0221D58C @ =FUN_0221D124
	bl FUN_0221D3B0
	ldr r4, _0221D588 @ =0x0222602C
	mov r5, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ble _0221D564
_0221D548:
	ldr r0, [r4, #4]
	ldr r0, [r0, r5, lsl #2]
	bl FUN_021EC3D8
	ldr r0, [r4, #0xc]
	add r5, r5, #1
	cmp r5, r0
	blt _0221D548
_0221D564:
	ldr r0, _0221D588 @ =0x0222602C
	ldr r0, [r0, #4]
	bl FUN_021EC3D8
	ldr r0, _0221D588 @ =0x0222602C
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0xc]
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D588: .4byte 0x0222602C
_0221D58C: .4byte FUN_0221D124
	arm_func_end FUN_0221D518

	arm_func_start FUN_0221D590
FUN_0221D590: @ 0x0221D590
	push {r3, lr}
	ldr lr, [r0, #0xec]
	ldr r3, _0221D648 @ =0x51EB851F
	lsr r1, lr, #0x1f
	smull r2, ip, r3, lr
	add ip, r1, ip, asr #5
	cmp ip, #5
	addls pc, pc, ip, lsl #2
	pop {r3, pc}
_0221D5B4: @ jump table
	pop {r3, pc} @ case 0
	b _0221D5CC @ case 1
	b _0221D5CC @ case 2
	b _0221D5CC @ case 3
	b _0221D5D0 @ case 4
	b _0221D63C @ case 5
_0221D5CC:
	pop {r3, pc}
_0221D5D0:
	sub r1, lr, #0x91
	sub r1, r1, #0x100
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _0221D630
_0221D5E4: @ jump table
	b _0221D60C @ case 0
	b _0221D630 @ case 1
	b _0221D618 @ case 2
	b _0221D624 @ case 3
	b _0221D630 @ case 4
	b _0221D630 @ case 5
	b _0221D630 @ case 6
	b _0221D630 @ case 7
	b _0221D630 @ case 8
	b _0221D624 @ case 9
_0221D60C:
	mov r1, #9
	str r1, [r0, #0x38]
	pop {r3, pc}
_0221D618:
	mov r1, #0xa
	str r1, [r0, #0x38]
	pop {r3, pc}
_0221D624:
	mov r1, #0xb
	str r1, [r0, #0x38]
	pop {r3, pc}
_0221D630:
	mov r1, #8
	str r1, [r0, #0x38]
	pop {r3, pc}
_0221D63C:
	mov r1, #0xc
	str r1, [r0, #0x38]
	pop {r3, pc}
	.align 2, 0
_0221D648: .4byte 0x51EB851F
	arm_func_end FUN_0221D590

	arm_func_start FUN_0221D64C
FUN_0221D64C: @ 0x0221D64C
	push {r3, r4, r5, lr}
	movs r4, r0
	bne _0221D66C
	ldr r0, _0221D7A4 @ =0x02225480
	ldr r1, _0221D7A8 @ =0x0222548C
	ldr r2, _0221D7AC @ =0x02225468
	mov r3, #0x5b
	bl FUN_020E4A9C
_0221D66C:
	ldr r0, [r4, #4]
	bl FUN_0221D308
	cmp r0, r4
	beq _0221D690
	ldr r0, _0221D7B0 @ =0x02225498
	ldr r1, _0221D7A8 @ =0x0222548C
	ldr r2, _0221D7AC @ =0x02225468
	mov r3, #0x5c
	bl FUN_020E4A9C
_0221D690:
	ldr r0, [r4, #0x12c]
	cmp r0, #0
	movne r0, #0
	popne {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r4, #0x12c]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0221D6BC
	mov r0, r4
	bl FUN_0221EBB0
_0221D6BC:
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _0221D6D0
	mov r0, r4
	bl FUN_0221EC74
_0221D6D0:
	ldr r0, [r4, #0x10]
	cmp r0, #2
	bne _0221D6E4
	mov r0, r4
	bl FUN_0221EEC4
_0221D6E4:
	ldr r0, [r4, #0x10]
	cmp r0, #3
	bne _0221D6F8
	mov r0, r4
	bl FUN_0221F024
_0221D6F8:
	ldr r0, [r4, #0x10]
	cmp r0, #4
	bne _0221D70C
	mov r0, r4
	bl FUN_0221F298
_0221D70C:
	ldr r0, [r4, #0x10]
	cmp r0, #5
	bne _0221D720
	mov r0, r4
	bl FUN_0221F330
_0221D720:
	ldr r0, [r4, #0x10]
	cmp r0, #6
	bne _0221D734
	mov r0, r4
	bl FUN_0221F4FC
_0221D734:
	ldr r0, [r4, #0x10]
	cmp r0, #7
	bne _0221D748
	mov r0, r4
	bl FUN_0221FA38
_0221D748:
	ldr r0, [r4, #0x10]
	cmp r0, #8
	bne _0221D75C
	mov r0, r4
	bl FUN_0221FEA8
_0221D75C:
	ldr r0, [r4, #0x108]
	cmp r0, #0
	beq _0221D770
	mov r0, r4
	bl FUN_0221D414
_0221D770:
	ldr r5, [r4, #0xfc]
	cmp r5, #0
	moveq r0, #0
	streq r0, [r4, #0x12c]
	beq _0221D79C
	mov r0, r4
	bl FUN_0221D590
	mov r0, r4
	bl FUN_0221C8D4
	mov r0, r4
	bl FUN_0221D124
_0221D79C:
	mov r0, r5
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D7A4: .4byte 0x02225480
_0221D7A8: .4byte 0x0222548C
_0221D7AC: .4byte 0x02225468
_0221D7B0: .4byte 0x02225498
	arm_func_end FUN_0221D64C

	arm_func_start FUN_0221D7B4
FUN_0221D7B4: @ 0x0221D7B4
	push {r3, lr}
	bl FUN_0221CA4C
	ldr r0, _0221D7FC @ =0x0222603C
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #1
	bne _0221D7F4
	bl FUN_0221CA44
	ldr r0, _0221D800 @ =0x0222531C
	mov r2, #0xfa
	ldr r1, _0221D804 @ =0x02225320
	mov r3, #0x7d
	str r2, [r0]
	str r3, [r1]
	pop {r3, pc}
_0221D7F4:
	bl FUN_0221CA50
	pop {r3, pc}
	.align 2, 0
_0221D7FC: .4byte 0x0222603C
_0221D800: .4byte 0x0222531C
_0221D804: .4byte 0x02225320
	arm_func_end FUN_0221D7B4

	arm_func_start FUN_0221D808
FUN_0221D808: @ 0x0221D808
	push {r3, lr}
	bl FUN_0221CA4C
	ldr r0, _0221D85C @ =0x0222603C
	ldr r1, [r0]
	subs r1, r1, #1
	str r1, [r0]
	bne _0221D854
	bl FUN_0221D518
	ldr r0, _0221D860 @ =0x02226028
	ldr r0, [r0]
	cmp r0, #0
	beq _0221D848
	bl FUN_021EC3D8
	ldr r0, _0221D860 @ =0x02226028
	mov r1, #0
	str r1, [r0]
_0221D848:
	bl FUN_0221CA50
	bl FUN_0221CA48
	pop {r3, pc}
_0221D854:
	bl FUN_0221CA50
	pop {r3, pc}
	.align 2, 0
_0221D85C: .4byte 0x0222603C
_0221D860: .4byte 0x02226028
	arm_func_end FUN_0221D808

	arm_func_start FUN_0221D864
FUN_0221D864: @ 0x0221D864
	push {r3, lr}
	sub sp, sp, #0x18
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	str r1, [sp, #8]
	str ip, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r1, ip
	mov r2, ip
	mov r3, ip
	bl FUN_0221D8A0
	add sp, sp, #0x18
	pop {r3, pc}
	arm_func_end FUN_0221D864

	arm_func_start FUN_0221D8A0
FUN_0221D8A0: @ 0x0221D8A0
	push {r4, r5, r6, r7, r8, lr}
	movs r8, r0
	ldrsbne r0, [r8]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmpne r0, #0
	bne _0221D8D4
	ldr r0, _0221DACC @ =0x022254D4
	ldr r1, _0221DAD0 @ =0x0222548C
	ldr r2, _0221DAD4 @ =0x0222545C
	mov r3, #0x128
	bl FUN_020E4A9C
_0221D8D4:
	cmp r5, #0
	bge _0221D8F0
	ldr r0, _0221DAD8 @ =0x022254E4
	ldr r1, _0221DAD0 @ =0x0222548C
	ldr r2, _0221DAD4 @ =0x0222545C
	ldr r3, _0221DADC @ =0x00000129
	bl FUN_020E4A9C
_0221D8F0:
	cmp r6, #0
	beq _0221D914
	cmp r5, #0
	bne _0221D914
	ldr r0, _0221DAE0 @ =0x022254F4
	ldr r1, _0221DAD0 @ =0x0222548C
	ldr r2, _0221DAD4 @ =0x0222545C
	ldr r3, _0221DAE4 @ =0x0000012A
	bl FUN_020E4A9C
_0221D914:
	cmp r8, #0
	ldrsbne r0, [r8]
	cmpne r0, #0
	mvneq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	cmp r5, #0
	mvnlt r0, #0
	poplt {r4, r5, r6, r7, r8, pc}
	cmp r6, #0
	beq _0221D948
	cmp r5, #0
	mvneq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
_0221D948:
	ldr r0, _0221DAE8 @ =0x0222603C
	ldr r0, [r0]
	cmp r0, #0
	bne _0221D95C
	bl FUN_0221D7B4
_0221D95C:
	bl FUN_0221CF8C
	movs r4, r0
	mvneq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	mov r1, #0
	mov r0, r8
	str r1, [r4, #0xc]
	bl FUN_021FF3D4
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _0221D998
	mov r0, r4
	bl FUN_0221D124
	mvn r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221D998:
	cmp r7, #0
	ldrsbne r0, [r7]
	cmpne r0, #0
	beq _0221D9CC
	mov r0, r7
	bl FUN_021FF3D4
	str r0, [r4, #0x28]
	cmp r0, #0
	bne _0221D9CC
	mov r0, r4
	bl FUN_0221D124
	mvn r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221D9CC:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r1, [r4, #0x13c]
	str r0, [r4, #0x30]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	str r1, [r4, #0x3c]
	str r0, [r4, #0x40]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #0x44]
	str r0, [r4, #0x134]
	cmp r6, #0
	movne r0, #1
	moveq r0, #0
	str r0, [r4, #0xe0]
	cmp r0, #0
	beq _0221DA2C
	mov r0, r4
	mov r2, r6
	mov r3, r5
	add r1, r4, #0xbc
	bl FUN_0221C1D4
	b _0221DA40
_0221DA2C:
	mov r2, #0x800
	mov r0, r4
	mov r3, r2
	add r1, r4, #0xbc
	bl FUN_0221C0B8
_0221DA40:
	cmp r0, #0
	bne _0221DA58
	mov r0, r4
	bl FUN_0221D124
	mvn r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221DA58:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0221DA84
	mov r0, r4
	bl FUN_0221DF4C
	cmp r0, #0
	bne _0221DA84
	mov r0, r4
	bl FUN_0221D124
	mvn r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221DA84:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0221DAC4
	mov r0, r4
	bl FUN_0221D64C
	cmp r0, #0
	bne _0221DABC
	mov r5, #0xa
_0221DAA4:
	mov r0, r5
	bl FUN_021FF3C0
	mov r0, r4
	bl FUN_0221D64C
	cmp r0, #0
	beq _0221DAA4
_0221DABC:
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221DAC4:
	ldr r0, [r4, #4]
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0221DACC: .4byte 0x022254D4
_0221DAD0: .4byte 0x0222548C
_0221DAD4: .4byte 0x0222545C
_0221DAD8: .4byte 0x022254E4
_0221DADC: .4byte 0x00000129
_0221DAE0: .4byte 0x022254F4
_0221DAE4: .4byte 0x0000012A
_0221DAE8: .4byte 0x0222603C
	arm_func_end FUN_0221D8A0

	arm_func_start FUN_0221DAEC
FUN_0221DAEC: @ 0x0221DAEC
	ldr ip, _0221DAF8 @ =FUN_0221D3B0
	ldr r0, _0221DAFC @ =FUN_0221D64C
	bx ip
	.align 2, 0
_0221DAF8: .4byte FUN_0221D3B0
_0221DAFC: .4byte FUN_0221D64C
	arm_func_end FUN_0221DAEC

	arm_func_start FUN_0221DB00
FUN_0221DB00: @ 0x0221DB00
	ldr r0, [r0, #0x10]
	bx lr
	arm_func_end FUN_0221DB00

	arm_func_start FUN_0221DB08
FUN_0221DB08: @ 0x0221DB08
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	bl FUN_021FE678
	mov r0, r4
	bl FUN_021EC3D8
	pop {r4, pc}
	arm_func_end FUN_0221DB08

	arm_func_start FUN_0221DB24
FUN_0221DB24: @ 0x0221DB24
	push {r4, lr}
	ldr r4, [r0, #0x13c]
	cmp r4, #0
	bne _0221DB48
	ldr r0, _0221DB68 @ =0x02225694
	ldr r1, _0221DB6C @ =0x02225644
	ldr r2, _0221DB70 @ =0x02225574
	ldr r3, _0221DB74 @ =0x00000192
	bl FUN_020E4A9C
_0221DB48:
	cmp r4, #0
	ldreq r0, _0221DB78 @ =0x0222569C
	popeq {r4, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ldrne r0, _0221DB7C @ =0x022256A0
	ldreq r0, _0221DB80 @ =0x022256E4
	pop {r4, pc}
	.align 2, 0
_0221DB68: .4byte 0x02225694
_0221DB6C: .4byte 0x02225644
_0221DB70: .4byte 0x02225574
_0221DB74: .4byte 0x00000192
_0221DB78: .4byte 0x0222569C
_0221DB7C: .4byte 0x022256A0
_0221DB80: .4byte 0x022256E4
	arm_func_end FUN_0221DB24

	arm_func_start FUN_0221DB84
FUN_0221DB84: @ 0x0221DB84
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, [r0, #0x13c]
	mov sl, #0
	ldr r0, [r6]
	bl FUN_021FE6E4
	movs sb, r0
	moveq r0, sl
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #0
	mov r8, sl
	ble _0221DC18
	ldr r5, _0221DC24 @ =0x02225708
	ldr r4, _0221DC28 @ =0x02225644
	ldr fp, _0221DC2C @ =0x022255E0
_0221DBBC:
	ldr r0, [r6]
	mov r1, r8
	bl FUN_021FE6EC
	mov r7, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _0221DBEC
	mov r0, r5
	mov r1, r4
	mov r2, fp
	mov r3, #0x1b0
	bl FUN_020E4A9C
_0221DBEC:
	ldr r0, [r7, #4]
	bl FUN_020E9580
	add r8, r8, #1
	ldr r1, [r7, #0xc]
	add r2, sl, r0
	ldr r0, [r7, #0x14]
	add r1, r2, r1
	add r0, r1, r0, lsl #1
	cmp r8, sb
	add sl, r0, #1
	blt _0221DBBC
_0221DC18:
	sub r0, sb, #1
	add r0, sl, r0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221DC24: .4byte 0x02225708
_0221DC28: .4byte 0x02225644
_0221DC2C: .4byte 0x022255E0
	arm_func_end FUN_0221DB84

	arm_func_start FUN_0221DC30
FUN_0221DC30: @ 0x0221DC30
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _0221DDB4 @ =0x02226040
	mov r4, r0
	ldr r0, [r1, #8]
	ldr r7, [r4, #0x13c]
	cmp r0, #0
	mov sl, #0
	bne _0221DC78
	ldr r0, _0221DDB8 @ =0x02225720
	bl FUN_020E9580
	ldr r1, _0221DDB4 @ =0x02226040
	add r2, r0, #0x2f
	str r0, [r1, #8]
	str r2, [r1, #4]
	add r2, r0, #0x4c
	str r2, [r1, #0xc]
	add r0, r0, #4
	str r0, [r1]
_0221DC78:
	ldr r0, [r7]
	bl FUN_021FE6E4
	mov sb, r0
	cmp sb, #0
	mov r8, #0
	ble _0221DDA4
	ldr fp, _0221DDBC @ =0x02225748
	ldr r5, _0221DDB4 @ =0x02226040
_0221DC98:
	ldr r0, [r7]
	mov r1, r8
	bl FUN_021FE6EC
	mov r6, r0
	ldr r0, [r6]
	cmp r0, #0
	bne _0221DCD4
	ldr r1, [r5, #4]
	ldr r0, [r6, #4]
	add sl, sl, r1
	bl FUN_020E9580
	ldr r1, [r6, #0xc]
	add r0, sl, r0
	add sl, r0, r1
	b _0221DD98
_0221DCD4:
	cmp r0, #1
	bne _0221DD3C
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #4]
	add sl, sl, r1
	bl FUN_020E9580
	add sl, sl, r0
	ldr r0, [r6, #0xc]
	bl FUN_020E9580
	add sl, sl, r0
	ldr r0, [r6, #0x10]
	bl FUN_020E9580
	add sl, sl, r0
	ldr r0, [r4, #0x140]
	mov r1, r8
	bl FUN_021FE6EC
	movs r6, r0
	bne _0221DD30
	ldr r1, _0221DDC0 @ =0x02225644
	ldr r2, _0221DDC4 @ =0x02225620
	mov r0, fp
	mov r3, #0x1ec
	bl FUN_020E4A9C
_0221DD30:
	ldr r0, [r6, #0xc]
	add sl, sl, r0
	b _0221DD98
_0221DD3C:
	cmp r0, #2
	bne _0221DD7C
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #4]
	add sl, sl, r1
	bl FUN_020E9580
	add sl, sl, r0
	ldr r0, [r6, #0x10]
	bl FUN_020E9580
	add sl, sl, r0
	ldr r0, [r6, #0x14]
	bl FUN_020E9580
	add r1, sl, r0
	ldr r0, [r6, #0xc]
	add sl, r1, r0
	b _0221DD98
_0221DD7C:
	ldr r0, _0221DDC8 @ =0x02225640
	ldr r1, _0221DDC0 @ =0x02225644
	ldr r2, _0221DDC4 @ =0x02225620
	ldr r3, _0221DDCC @ =0x000001F9
	bl FUN_020E4A9C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221DD98:
	add r8, r8, #1
	cmp r8, sb
	blt _0221DC98
_0221DDA4:
	ldr r0, _0221DDB4 @ =0x02226040
	ldr r0, [r0]
	add r0, sl, r0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221DDB4: .4byte 0x02226040
_0221DDB8: .4byte 0x02225720
_0221DDBC: .4byte 0x02225748
_0221DDC0: .4byte 0x02225644
_0221DDC4: .4byte 0x02225620
_0221DDC8: .4byte 0x02225640
_0221DDCC: .4byte 0x000001F9
	arm_func_end FUN_0221DC30

	arm_func_start FUN_0221DDD0
FUN_0221DDD0: @ 0x0221DDD0
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x13c]
	cmp r4, #0
	bne _0221DDF8
	ldr r0, _0221DE24 @ =0x02225694
	ldr r1, _0221DE28 @ =0x02225644
	ldr r2, _0221DE2C @ =0x0222558C
	mov r3, #0x20c
	bl FUN_020E4A9C
_0221DDF8:
	cmp r4, #0
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	mov r0, r5
	beq _0221DE1C
	bl FUN_0221DC30
	pop {r3, r4, r5, pc}
_0221DE1C:
	bl FUN_0221DB84
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221DE24: .4byte 0x02225694
_0221DE28: .4byte 0x02225644
_0221DE2C: .4byte 0x0222558C
	arm_func_end FUN_0221DDD0

	arm_func_start FUN_0221DE30
FUN_0221DE30: @ 0x0221DE30
	push {r4, lr}
	mov r4, r0
	ldr r1, [r4]
	mvn r0, #0
	ldr r1, [r1]
	str r0, [r4, #4]
	cmp r1, #0
	beq _0221DECC
	cmp r1, #1
	bne _0221DEA8
	ldr r0, [r4, #8]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	mov r1, #0
	mov r2, #2
	bl FUN_020E5804
	cmp r0, #0
	movne r0, #0
	popne {r4, pc}
	ldr r0, [r4, #8]
	bl FUN_020E5500
	mvn r1, #0
	str r0, [r4, #0xc]
	cmp r0, r1
	moveq r0, #0
	popeq {r4, pc}
	ldr r0, [r4, #8]
	bl FUN_020E5930
	b _0221DECC
_0221DEA8:
	cmp r1, #2
	beq _0221DECC
	ldr r0, _0221DED4 @ =0x02225640
	ldr r1, _0221DED8 @ =0x02225644
	ldr r2, _0221DEDC @ =0x02225534
	mov r3, #0x244
	bl FUN_020E4A9C
	mov r0, #0
	pop {r4, pc}
_0221DECC:
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_0221DED4: .4byte 0x02225640
_0221DED8: .4byte 0x02225644
_0221DEDC: .4byte 0x02225534
	arm_func_end FUN_0221DE30

	arm_func_start FUN_0221DEE0
FUN_0221DEE0: @ 0x0221DEE0
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	popeq {r4, pc}
	cmp r0, #1
	bne _0221DF1C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0221DF10
	bl FUN_020E5328
_0221DF10:
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
_0221DF1C:
	cmp r0, #2
	popeq {r4, pc}
	ldr r0, _0221DF3C @ =0x02225640
	ldr r1, _0221DF40 @ =0x02225644
	ldr r2, _0221DF44 @ =0x02225548
	ldr r3, _0221DF48 @ =0x00000269
	bl FUN_020E4A9C
	pop {r4, pc}
	.align 2, 0
_0221DF3C: .4byte 0x02225640
_0221DF40: .4byte 0x02225644
_0221DF44: .4byte 0x02225548
_0221DF48: .4byte 0x00000269
	arm_func_end FUN_0221DEE0

	arm_func_start FUN_0221DF4C
FUN_0221DF4C: @ 0x0221DF4C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r0, [r4, #0x13c]
	cmp r0, #0
	bne _0221DF78
	ldr r0, _0221E0C8 @ =0x02225750
	ldr r1, _0221E0CC @ =0x02225644
	ldr r2, _0221E0D0 @ =0x0222550C
	mov r3, #0x278
	bl FUN_020E4A9C
_0221DF78:
	ldr r0, [r4, #0x13c]
	cmp r0, #0
	addeq sp, sp, #0x10
	mov r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	str r0, [r4, #0x144]
	str r0, [r4, #0x148]
	str r0, [r4, #0x14c]
	ldr r0, [r4, #0x13c]
	ldr r0, [r0, #4]
	str r0, [r4, #0x150]
	ldr r0, [r4, #0x13c]
	ldr r0, [r0, #8]
	str r0, [r4, #0x154]
	ldr r0, [r4, #0x13c]
	ldr r0, [r0]
	bl FUN_021FE6E4
	mov r8, r0
	mov r1, r8
	mov r0, #0x10
	mov r2, #0
	bl FUN_021FE5B4
	cmp r0, #0
	str r0, [r4, #0x140]
	addeq sp, sp, #0x10
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	mov r7, #0
	ble _0221E07C
	add r6, sp, #0
	mov r5, r7
_0221DFF8:
	ldr r0, [r4, #0x13c]
	mov r1, r7
	ldr r0, [r0]
	bl FUN_021FE6EC
	str r5, [r6]
	str r0, [sp]
	mov r0, r6
	str r5, [r6, #4]
	str r5, [r6, #8]
	str r5, [r6, #0xc]
	bl FUN_0221DE30
	cmp r0, #0
	bne _0221E064
	subs r7, r7, #1
	bmi _0221E04C
_0221E034:
	ldr r0, [r4, #0x140]
	mov r1, r7
	bl FUN_021FE6EC
	bl FUN_0221DEE0
	subs r7, r7, #1
	bpl _0221E034
_0221E04C:
	ldr r0, [r4, #0x140]
	bl FUN_021FE678
	mov r0, #0
	add sp, sp, #0x10
	str r0, [r4, #0x140]
	pop {r4, r5, r6, r7, r8, pc}
_0221E064:
	ldr r0, [r4, #0x140]
	mov r1, r6
	bl FUN_021FE754
	add r7, r7, #1
	cmp r7, r8
	blt _0221DFF8
_0221E07C:
	ldr r0, [r4, #0x13c]
	ldr r0, [r0]
	bl FUN_021FE6E4
	mov r5, r0
	ldr r0, [r4, #0x140]
	bl FUN_021FE6E4
	cmp r5, r0
	beq _0221E0B0
	ldr r0, _0221E0D4 @ =0x02225764
	ldr r1, _0221E0CC @ =0x02225644
	ldr r2, _0221E0D0 @ =0x0222550C
	ldr r3, _0221E0D8 @ =0x000002B1
	bl FUN_020E4A9C
_0221E0B0:
	mov r0, r4
	bl FUN_0221DDD0
	str r0, [r4, #0x14c]
	mov r0, #1
	add sp, sp, #0x10
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0221E0C8: .4byte 0x02225750
_0221E0CC: .4byte 0x02225644
_0221E0D0: .4byte 0x0222550C
_0221E0D4: .4byte 0x02225764
_0221E0D8: .4byte 0x000002B1
	arm_func_end FUN_0221DF4C

	arm_func_start FUN_0221E0DC
FUN_0221E0DC: @ 0x0221E0DC
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #0x140]
	cmp r0, #0
	beq _0221E130
	bl FUN_021FE6E4
	mov r5, r0
	cmp r5, #0
	mov r4, #0
	ble _0221E120
_0221E104:
	ldr r0, [r6, #0x140]
	mov r1, r4
	bl FUN_021FE6EC
	bl FUN_0221DEE0
	add r4, r4, #1
	cmp r4, r5
	blt _0221E104
_0221E120:
	ldr r0, [r6, #0x140]
	bl FUN_021FE678
	mov r0, #0
	str r0, [r6, #0x140]
_0221E130:
	ldr r0, [r6, #0x13c]
	cmp r0, #0
	ldrne r1, [r0, #0x10]
	cmpne r1, #0
	popeq {r4, r5, r6, pc}
	bl FUN_0221DB08
	mov r0, #0
	str r0, [r6, #0x13c]
	pop {r4, r5, r6, pc}
	arm_func_end FUN_0221E0DC

	arm_func_start FUN_0221E154
FUN_0221E154: @ 0x0221E154
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	ldr r0, [r4, #4]
	mov sl, r1
	cmp r0, #0
	bge _0221E180
	ldr r0, _0221E30C @ =0x022257B8
	ldr r1, _0221E310 @ =0x02225644
	ldr r2, _0221E314 @ =0x022255A4
	ldr r3, _0221E318 @ =0x000002E7
	bl FUN_020E4A9C
_0221E180:
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #4]
	cmp r0, r1
	blt _0221E1B4
	ldr r0, _0221E31C @ =0x022257C8
	ldr r1, _0221E310 @ =0x02225644
	ldr r2, _0221E314 @ =0x022255A4
	ldr r3, _0221E320 @ =0x000002EE
	bl FUN_020E4A9C
_0221E1B4:
	ldr r0, [sl, #0x13c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0221E2C0
	ldr r1, [r4]
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0221E2C0
	ldr r0, _0221E324 @ =0x02224E60
	ldr r8, [r1, #8]
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	add r5, sp, #0
	strb r2, [sp]
	strb r1, [sp, #1]
	ldrb r1, [r0, #2]
	ldrb r0, [r0, #3]
	mov r6, #0
	strb r1, [sp, #2]
	strb r0, [sp, #3]
	ldrsb r7, [r8]
	cmp r7, #0
	beq _0221E2B8
	ldr r4, _0221E328 @ =0x02225804
	ldr fp, _0221E32C @ =0x02225650
_0221E218:
	mov r0, fp
	mov r1, r7
	bl FUN_020E987C
	cmp r0, #0
	beq _0221E23C
	mov r1, r7
	add r0, sl, #0x50
	bl FUN_0221C66C
	b _0221E2A8
_0221E23C:
	cmp r7, #0x20
	bne _0221E254
	mov r1, #0x2b
	add r0, sl, #0x50
	bl FUN_0221C66C
	b _0221E2A8
_0221E254:
	asr r0, r7, #3
	add r0, r7, r0, lsr #28
	asr sb, r0, #4
	cmp sb, #0x10
	blt _0221E27C
	ldr r0, _0221E330 @ =0x022257F4
	ldr r1, _0221E310 @ =0x02225644
	ldr r2, _0221E314 @ =0x022255A4
	ldr r3, _0221E334 @ =0x0000030D
	bl FUN_020E4A9C
_0221E27C:
	ldrsb r2, [r4, sb]
	lsr r1, r7, #0x1f
	rsb r0, r1, r7, lsl #28
	add r0, r1, r0, ror #28
	strb r2, [sp, #1]
	ldrsb r2, [r4, r0]
	mov r1, r5
	add r0, sl, #0x50
	strb r2, [sp, #2]
	mov r2, #3
	bl FUN_0221C330
_0221E2A8:
	add r6, r6, #1
	ldrsb r7, [r8, r6]
	cmp r7, #0
	bne _0221E218
_0221E2B8:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221E2C0:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	ldr r2, [r1, #0xc]
	ldr r1, [r1, #8]
	sub r5, r2, r0
	mov r0, sl
	mov r2, r5
	bl FUN_0221CD90
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #4]
	cmp r0, r5
	add r0, r1, r0
	str r0, [r4, #4]
	moveq r0, #1
	movne r0, #2
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221E30C: .4byte 0x022257B8
_0221E310: .4byte 0x02225644
_0221E314: .4byte 0x022255A4
_0221E318: .4byte 0x000002E7
_0221E31C: .4byte 0x022257C8
_0221E320: .4byte 0x000002EE
_0221E324: .4byte 0x02224E60
_0221E328: .4byte 0x02225804
_0221E32C: .4byte 0x02225650
_0221E330: .4byte 0x022257F4
_0221E334: .4byte 0x0000030D
	arm_func_end FUN_0221E154

	arm_func_start FUN_0221E338
FUN_0221E338: @ 0x0221E338
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1000
	mov r8, r0
	ldr r0, [r8, #4]
	mov r7, r1
	cmp r0, #0
	bge _0221E368
	ldr r0, _0221E478 @ =0x022257B8
	ldr r1, _0221E47C @ =0x02225644
	ldr r2, _0221E480 @ =0x022255C0
	ldr r3, _0221E484 @ =0x00000336
	bl FUN_020E4A9C
_0221E368:
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	cmp r1, r0
	blt _0221E38C
	ldr r0, _0221E488 @ =0x02225818
	ldr r1, _0221E47C @ =0x02225644
	ldr r2, _0221E480 @ =0x022255C0
	ldr r3, _0221E48C @ =0x00000337
	bl FUN_020E4A9C
_0221E38C:
	ldr r0, [r8, #8]
	bl FUN_020E5500
	ldr r1, [r8, #4]
	cmp r1, r0
	beq _0221E3B4
	ldr r0, _0221E490 @ =0x02225840
	ldr r1, _0221E47C @ =0x02225644
	ldr r2, _0221E480 @ =0x022255C0
	mov r3, #0x338
	bl FUN_020E4A9C
_0221E3B4:
	add r6, sp, #0
	mov r5, #1
	mov r4, #0x1000
_0221E3C0:
	ldr r3, [r8, #8]
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_020E4C24
	mov r2, r0
	cmp r2, #0
	bgt _0221E3FC
	mov r0, #1
	str r0, [r7, #0xfc]
	mov r0, #0xe
	str r0, [r7, #0x38]
	add sp, sp, #0x1000
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221E3FC:
	ldr r0, [r8, #4]
	add r1, r0, r2
	str r1, [r8, #4]
	ldr r0, [r8, #0xc]
	cmp r1, r0
	ble _0221E430
	mov r0, #1
	str r0, [r7, #0xfc]
	mov r0, #0xe
	str r0, [r7, #0x38]
	add sp, sp, #0x1000
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221E430:
	mov r0, r7
	mov r1, r6
	bl FUN_0221CE0C
	cmp r0, #0
	addeq sp, sp, #0x1000
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	ldr r2, [r8, #4]
	ldr r1, [r8, #0xc]
	cmp r2, r1
	addeq sp, sp, #0x1000
	moveq r0, #1
	popeq {r4, r5, r6, r7, r8, pc}
	cmp r0, #1
	beq _0221E3C0
	mov r0, #2
	add sp, sp, #0x1000
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0221E478: .4byte 0x022257B8
_0221E47C: .4byte 0x02225644
_0221E480: .4byte 0x022255C0
_0221E484: .4byte 0x00000336
_0221E488: .4byte 0x02225818
_0221E48C: .4byte 0x00000337
_0221E490: .4byte 0x02225840
	arm_func_end FUN_0221E338

	arm_func_start FUN_0221E494
FUN_0221E494: @ 0x0221E494
	push {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, [r6, #4]
	mov r5, r1
	cmp r0, #0
	bge _0221E4C0
	ldr r0, _0221E55C @ =0x022257B8
	ldr r1, _0221E560 @ =0x02225644
	ldr r2, _0221E564 @ =0x02225600
	ldr r3, _0221E568 @ =0x0000036E
	bl FUN_020E4A9C
_0221E4C0:
	ldr r0, [r6]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #4]
	cmp r0, r1
	blt _0221E4F4
	ldr r0, _0221E56C @ =0x02225878
	ldr r1, _0221E560 @ =0x02225644
	ldr r2, _0221E564 @ =0x02225600
	ldr r3, _0221E570 @ =0x00000375
	bl FUN_020E4A9C
_0221E4F4:
	mov r4, #0x8000
	mvn r7, #0
_0221E4FC:
	ldm r6, {r1, r3}
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	sub r2, r0, r3
	cmp r2, #0x8000
	movge r2, r4
	mov r0, r5
	add r1, r1, r3
	bl FUN_0221CD90
	cmp r0, r7
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r1, [r6, #4]
	add r2, r1, r0
	str r2, [r6, #4]
	ldr r1, [r6]
	ldr r1, [r1, #0xc]
	cmp r1, r2
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, pc}
	cmp r0, #0
	bne _0221E4FC
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E55C: .4byte 0x022257B8
_0221E560: .4byte 0x02225644
_0221E564: .4byte 0x02225600
_0221E568: .4byte 0x0000036E
_0221E56C: .4byte 0x02225878
_0221E570: .4byte 0x00000375
	arm_func_end FUN_0221E494

	arm_func_start FUN_0221E574
FUN_0221E574: @ 0x0221E574
	push {r4, r5, r6, lr}
	sub sp, sp, #8
	sub sp, sp, #0x800
	mov r6, r0
	ldr r0, [r6, #4]
	mvn r3, #0
	mov r5, r1
	mov r4, r2
	cmp r0, r3
	bne _0221E6CC
	mov r0, #0
	str r0, [r6, #4]
	ldr r0, [r5, #0x13c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0221E604
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	beq _0221E5D8
	ldr r0, _0221E748 @ =0x022258A8
	ldr r1, _0221E74C @ =0x02225644
	ldr r2, _0221E750 @ =0x0222555C
	rsb r3, r3, #0x3a8
	bl FUN_020E4A9C
_0221E5D8:
	ldr r1, [r6]
	cmp r4, #0
	add r0, sp, #8
	ldr r2, [r1, #4]
	beq _0221E5F8
	ldr r1, _0221E754 @ =0x022258C8
	bl FUN_020E7F30
	b _0221E68C
_0221E5F8:
	ldr r1, _0221E758 @ =0x022258CC
	bl FUN_020E7F30
	b _0221E68C
_0221E604:
	ldr r3, [r6]
	ldr r1, [r3]
	cmp r1, #0
	bne _0221E634
	cmp r4, #0
	ldrne r2, _0221E75C @ =0x022258D4
	ldr r3, [r3, #4]
	ldreq r2, _0221E760 @ =0x022258FC
	ldr r1, _0221E764 @ =0x02225928
	add r0, sp, #8
	bl FUN_020E7F30
	b _0221E68C
_0221E634:
	sub r0, r1, #1
	cmp r0, #1
	bhi _0221E678
	cmp r1, #1
	ldreq r0, [r3, #0xc]
	ldreq r1, [r3, #0x10]
	ldrne r0, [r3, #0x10]
	ldrne r1, [r3, #0x14]
	cmp r4, #0
	stm sp, {r0, r1}
	ldrne r2, _0221E75C @ =0x022258D4
	ldr r3, [r3, #4]
	ldreq r2, _0221E760 @ =0x022258FC
	ldr r1, _0221E768 @ =0x02225958
	add r0, sp, #8
	bl FUN_020E7F30
	b _0221E68C
_0221E678:
	ldr r0, _0221E76C @ =0x02225640
	ldr r1, _0221E74C @ =0x02225644
	ldr r2, _0221E750 @ =0x0222555C
	mov r3, #0x3dc
	bl FUN_020E4A9C
_0221E68C:
	add r0, sp, #8
	bl FUN_020E9580
	mov r2, r0
	add r1, sp, #8
	mov r0, r5
	bl FUN_0221CE0C
	cmp r0, #0
	addeq sp, sp, #8
	addeq sp, sp, #0x800
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	cmp r0, #2
	addeq sp, sp, #8
	addeq sp, sp, #0x800
	moveq r0, #2
	popeq {r4, r5, r6, pc}
_0221E6CC:
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _0221E6F4
	mov r0, r6
	mov r1, r5
	bl FUN_0221E154
	add sp, sp, #8
	add sp, sp, #0x800
	pop {r4, r5, r6, pc}
_0221E6F4:
	cmp r0, #1
	bne _0221E714
	mov r0, r6
	mov r1, r5
	bl FUN_0221E338
	add sp, sp, #8
	add sp, sp, #0x800
	pop {r4, r5, r6, pc}
_0221E714:
	cmp r0, #2
	beq _0221E730
	ldr r0, _0221E770 @ =0x022259AC
	ldr r1, _0221E74C @ =0x02225644
	ldr r2, _0221E750 @ =0x0222555C
	ldr r3, _0221E774 @ =0x000003F5
	bl FUN_020E4A9C
_0221E730:
	mov r0, r6
	mov r1, r5
	bl FUN_0221E494
	add sp, sp, #8
	add sp, sp, #0x800
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221E748: .4byte 0x022258A8
_0221E74C: .4byte 0x02225644
_0221E750: .4byte 0x0222555C
_0221E754: .4byte 0x022258C8
_0221E758: .4byte 0x022258CC
_0221E75C: .4byte 0x022258D4
_0221E760: .4byte 0x022258FC
_0221E764: .4byte 0x02225928
_0221E768: .4byte 0x02225958
_0221E76C: .4byte 0x02225640
_0221E770: .4byte 0x022259AC
_0221E774: .4byte 0x000003F5
	arm_func_end FUN_0221E574

	arm_func_start FUN_0221E778
FUN_0221E778: @ 0x0221E778
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	bne _0221E798
	ldr r0, _0221E9AC @ =0x022259D0
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9B8 @ =0x00000404
	bl FUN_020E4A9C
_0221E798:
	ldr r0, [sl, #0x13c]
	cmp r0, #0
	bne _0221E7B8
	ldr r0, _0221E9BC @ =0x02225750
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9C0 @ =0x00000405
	bl FUN_020E4A9C
_0221E7B8:
	ldr r0, [sl, #0x140]
	cmp r0, #0
	bne _0221E7D8
	ldr r0, _0221E9C4 @ =0x022259DC
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9C8 @ =0x00000406
	bl FUN_020E4A9C
_0221E7D8:
	ldr r0, [sl, #0x13c]
	ldr r0, [r0]
	bl FUN_021FE6E4
	mov r4, r0
	ldr r0, [sl, #0x140]
	bl FUN_021FE6E4
	cmp r4, r0
	beq _0221E80C
	ldr r0, _0221E9CC @ =0x02225764
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9D0 @ =0x00000407
	bl FUN_020E4A9C
_0221E80C:
	ldr r0, [sl, #0x144]
	cmp r0, #0
	bge _0221E82C
	ldr r0, _0221E9D4 @ =0x022259FC
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9D8 @ =0x00000408
	bl FUN_020E4A9C
_0221E82C:
	ldr r0, [sl, #0x140]
	bl FUN_021FE6E4
	ldr r1, [sl, #0x144]
	cmp r1, r0
	ble _0221E854
	ldr r0, _0221E9DC @ =0x02225A20
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9E0 @ =0x00000409
	bl FUN_020E4A9C
_0221E854:
	ldr r0, [sl, #0x140]
	bl FUN_021FE6E4
	ldr r1, [sl, #0x5c]
	mov sb, r0
	cmp r1, #0
	beq _0221E8AC
	mov r0, sl
	bl FUN_0221C748
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sl, #0x60]
	ldr r0, [sl, #0x5c]
	cmp r1, r0
	movlt r0, #2
	poplt {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sl, #0x50
	bl FUN_0221C704
	ldr r0, [sl, #0x144]
	cmp r0, sb
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221E8AC:
	ldr r1, [sl, #0x144]
	cmp r1, sb
	bge _0221E964
	ldr r7, _0221E9E4 @ =0x02225A70
	ldr r6, _0221E9B0 @ =0x02225644
	ldr r5, _0221E9B4 @ =0x02225520
	ldr r4, _0221E9E8 @ =0x0000042F
	mov fp, #1
_0221E8CC:
	ldr r0, [sl, #0x140]
	bl FUN_021FE6EC
	movs r8, r0
	bne _0221E8F0
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_020E4A9C
_0221E8F0:
	ldr r0, [sl, #0x144]
	mov r1, sl
	cmp r0, #0
	moveq r2, fp
	movne r2, #0
	mov r0, r8
	bl FUN_0221E574
	cmp r0, #0
	bne _0221E944
	ldr r0, [sl, #0xfc]
	cmp r0, #0
	ldrne r0, [sl, #0x38]
	cmpne r0, #0
	bne _0221E93C
	ldr r0, _0221E9EC @ =0x02225A7C
	ldr r1, _0221E9B0 @ =0x02225644
	ldr r2, _0221E9B4 @ =0x02225520
	ldr r3, _0221E9F0 @ =0x0000043B
	bl FUN_020E4A9C
_0221E93C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221E944:
	cmp r0, #2
	moveq r0, #2
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x144]
	add r1, r0, #1
	str r1, [sl, #0x144]
	cmp r1, sb
	blt _0221E8CC
_0221E964:
	ldr r0, [sl, #0x13c]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0221E998
	ldr r0, _0221E9F4 @ =0x02225AA8
	bl FUN_020E9580
	mov r2, r0
	ldr r1, _0221E9F4 @ =0x02225AA8
	mov r0, sl
	bl FUN_0221CE0C
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221E998:
	ldr r0, [sl, #0x5c]
	cmp r0, #0
	movne r0, #2
	moveq r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221E9AC: .4byte 0x022259D0
_0221E9B0: .4byte 0x02225644
_0221E9B4: .4byte 0x02225520
_0221E9B8: .4byte 0x00000404
_0221E9BC: .4byte 0x02225750
_0221E9C0: .4byte 0x00000405
_0221E9C4: .4byte 0x022259DC
_0221E9C8: .4byte 0x00000406
_0221E9CC: .4byte 0x02225764
_0221E9D0: .4byte 0x00000407
_0221E9D4: .4byte 0x022259FC
_0221E9D8: .4byte 0x00000408
_0221E9DC: .4byte 0x02225A20
_0221E9E0: .4byte 0x00000409
_0221E9E4: .4byte 0x02225A70
_0221E9E8: .4byte 0x0000042F
_0221E9EC: .4byte 0x02225A7C
_0221E9F0: .4byte 0x0000043B
_0221E9F4: .4byte 0x02225AA8
	arm_func_end FUN_0221E778

	arm_func_start FUN_0221E9F8
FUN_0221E9F8: @ 0x0221E9F8
	push {r4, r5, r6, r7, r8, lr}
	movs r5, r0
	bne _0221EA18
	ldr r0, _0221EB8C @ =0x02225B68
	ldr r1, _0221EB90 @ =0x02225B74
	ldr r2, _0221EB94 @ =0x02225AD4
	mov r3, #0x25
	bl FUN_020E4A9C
_0221EA18:
	cmp r5, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0221EA44
	ldr r0, _0221EB98 @ =0x02225B84
	ldr r1, _0221EB90 @ =0x02225B74
	ldr r2, _0221EB94 @ =0x02225AD4
	mov r3, #0x2b
	bl FUN_020E4A9C
_0221EA44:
	ldr r4, [r5, #0x14]
	cmp r4, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	ldr r1, _0221EB9C @ =0x02225B94
	mov r0, r4
	mov r2, #7
	bl FUN_020E9848
	cmp r0, #0
	addeq r4, r4, #7
	moveq r8, #0
	beq _0221EA9C
	ldr r1, _0221EBA0 @ =0x02225B9C
	mov r0, r4
	mov r2, #8
	bl FUN_020E9848
	cmp r0, #0
	addeq r4, r4, #8
	moveq r8, #1
	beq _0221EA9C
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_0221EA9C:
	ldr r1, _0221EBA4 @ =0x02225BA8
	mov r0, r4
	bl FUN_020E98B8
	mov r6, r0
	ldrsb r7, [r4, r6]
	mov r1, #0
	mov r0, r4
	strb r1, [r4, r6]
	bl FUN_021FF3D4
	str r0, [r5, #0x18]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
	strb r7, [r4, r6]
	ldrsb r0, [r4, r6]!
	cmp r0, #0x3a
	bne _0221EB18
	add r4, r4, #1
	mov r0, r4
	bl FUN_020EB82C
	strh r0, [r5, #0x20]
	ldrh r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
_0221EB00:
	ldrsb r0, [r4, #1]!
	cmp r0, #0
	beq _0221EB2C
	cmp r0, #0x2f
	bne _0221EB00
	b _0221EB2C
_0221EB18:
	cmp r8, #0
	ldrne r0, _0221EBA8 @ =0x000001BB
	strhne r0, [r5, #0x20]
	moveq r0, #0x50
	strheq r0, [r5, #0x20]
_0221EB2C:
	ldrsb r0, [r4]
	cmp r0, #0
	ldreq r4, _0221EBAC @ =0x02225BAC
	mov r0, r4
	bl FUN_021FF3D4
	mov r1, #0x20
	mov r7, r0
	str r0, [r5, #0x24]
	bl FUN_020E987C
	cmp r0, #0
	beq _0221EB7C
	mov r6, #0x2b
	mov r4, #0x20
_0221EB60:
	strb r6, [r0]
	ldr r7, [r5, #0x24]
	mov r1, r4
	mov r0, r7
	bl FUN_020E987C
	cmp r0, #0
	bne _0221EB60
_0221EB7C:
	cmp r7, #0
	moveq r0, #0
	movne r0, #1
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0221EB8C: .4byte 0x02225B68
_0221EB90: .4byte 0x02225B74
_0221EB94: .4byte 0x02225AD4
_0221EB98: .4byte 0x02225B84
_0221EB9C: .4byte 0x02225B94
_0221EBA0: .4byte 0x02225B9C
_0221EBA4: .4byte 0x02225BA8
_0221EBA8: .4byte 0x000001BB
_0221EBAC: .4byte 0x02225BAC
	arm_func_end FUN_0221E9F8

	arm_func_start FUN_0221EBB0
FUN_0221EBB0: @ 0x0221EBB0
	push {r3, r4, r5, lr}
	mov r1, #0
	mov r4, r0
	mov r2, r1
	bl FUN_0221C954
	bl FUN_021FF3CC
	mov r0, r4
	bl FUN_0221E9F8
	cmp r0, #0
	bne _0221EBEC
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #3
	str r0, [r4, #0x38]
	pop {r3, r4, r5, pc}
_0221EBEC:
	ldr r5, [r4, #0x15c]
	cmp r5, #0
	bne _0221EC08
	ldr r0, _0221EC70 @ =0x02226028
	ldr r5, [r0]
	cmp r5, #0
	ldreq r5, [r4, #0x18]
_0221EC08:
	mov r0, r5
	bl FUN_021FFA44
	mvn r1, #0
	str r0, [r4, #0x1c]
	cmp r0, r1
	bne _0221EC54
	mov r0, r5
	bl FUN_020A30D4
	cmp r0, #0
	bne _0221EC44
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #4
	str r0, [r4, #0x38]
	pop {r3, r4, r5, pc}
_0221EC44:
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [r4, #0x1c]
_0221EC54:
	mov r1, #0
	mov r3, #1
	mov r0, r4
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221EC70: .4byte 0x02226028
	arm_func_end FUN_0221EBB0

	arm_func_start FUN_0221EC74
FUN_0221EC74: @ 0x0221EC74
	push {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	ldr r1, [r4, #0x48]
	mvn r0, #0
	cmp r1, r0
	bne _0221EE20
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl FUN_021FF804
	mvn r1, #0
	str r0, [r4, #0x48]
	cmp r0, r1
	bne _0221ECD4
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #5
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	add sp, sp, #0x10
	str r0, [r4, #0x4c]
	pop {r4, pc}
_0221ECD4:
	mov r1, #0
	bl FUN_021FF44C
	cmp r0, #0
	bne _0221ED08
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #5
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	add sp, sp, #0x10
	str r0, [r4, #0x4c]
	pop {r4, pc}
_0221ED08:
	ldr r0, [r4, #0x134]
	cmp r0, #0
	beq _0221ED24
	ldr r1, _0221EEB8 @ =0x02225320
	ldr r0, [r4, #0x48]
	ldr r1, [r1]
	bl FUN_021FF48C
_0221ED24:
	add r2, sp, #8
	mov r1, #0
	str r1, [r2]
	mov r0, #2
	str r1, [r2, #4]
	strb r0, [sp, #9]
	ldr r0, [r4, #0x15c]
	cmp r0, #0
	beq _0221ED6C
	add r0, r4, #0x100
	ldrh r0, [r0, #0x60]
	asr r1, r0, #8
	lsl r0, r0, #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sp, #0xa]
	b _0221EDBC
_0221ED6C:
	ldr r0, _0221EEBC @ =0x02226028
	ldr r0, [r0]
	cmp r0, #0
	beq _0221EDA0
	ldr r0, _0221EEC0 @ =0x02226024
	ldrh r0, [r0]
	asr r1, r0, #8
	lsl r0, r0, #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sp, #0xa]
	b _0221EDBC
_0221EDA0:
	ldrh r0, [r4, #0x20]
	asr r1, r0, #8
	lsl r0, r0, #8
	and r1, r1, #0xff
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [sp, #0xa]
_0221EDBC:
	ldr r0, [r4, #0x1c]
	add r1, sp, #8
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x48]
	mov r2, #8
	bl FUN_021FF8A0
	mvn r1, #0
	cmp r0, r1
	bne _0221EE20
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	mvn r2, #5
	cmp r0, r2
	subne r1, r2, #0x14
	cmpne r0, r1
	subne r1, r2, #0x46
	cmpne r0, r1
	beq _0221EE20
	mov r1, #1
	str r1, [r4, #0xfc]
	mov r1, #6
	str r1, [r4, #0x38]
	add sp, sp, #0x10
	str r0, [r4, #0x4c]
	pop {r4, pc}
_0221EE20:
	ldr r0, [r4, #0x48]
	add r2, sp, #4
	add r3, sp, #0
	mov r1, #0
	bl FUN_021FF59C
	cmp r0, #0
	movgt r1, #1
	movle r1, #0
	mvn r0, #0
	cmp r1, r0
	beq _0221EE58
	ldr r0, [sp]
	cmp r0, #0
	beq _0221EE88
_0221EE58:
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #6
	cmp r1, #0
	addne sp, sp, #0x10
	str r0, [r4, #0x38]
	popne {r4, pc}
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	add sp, sp, #0x10
	str r0, [r4, #0x4c]
	pop {r4, pc}
_0221EE88:
	ldr r0, [sp, #4]
	cmp r0, #0
	addeq sp, sp, #0x10
	popeq {r4, pc}
	mov r1, #0
	mov r3, #2
	mov r0, r4
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	add sp, sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221EEB8: .4byte 0x02225320
_0221EEBC: .4byte 0x02226028
_0221EEC0: .4byte 0x02226024
	arm_func_end FUN_0221EC74

	arm_func_start FUN_0221EEC4
FUN_0221EEC4: @ 0x0221EEC4
	push {r3, r4, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov r4, r0
	ldr r1, [r4, #0x168]
	cmp r1, #0
	bne _0221EF38
	ldr r0, [r4, #0x14]
	ldr r1, _0221F010 @ =0x02225B9C
	mov r2, #8
	bl FUN_020E9848
	cmp r0, #0
	bne _0221EF14
	mov r0, #1
	add sp, sp, #4
	str r0, [r4, #0xfc]
	mov r0, #0x11
	add sp, sp, #0x400
	str r0, [r4, #0x38]
	pop {r3, r4, pc}
_0221EF14:
	mov r1, #0
	mov r3, #3
	mov r0, r4
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r3, r4, pc}
_0221EF38:
	ldr r1, [r4, #0x170]
	cmp r1, #0
	beq _0221EF64
	mov r1, #0
	mov r3, #3
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r3, r4, pc}
_0221EF64:
	ldr r1, [r4, #0x16c]
	cmp r1, #0
	bne _0221EFA4
	ldr r2, [r4, #0x174]
	add r1, r4, #0x164
	blx r2
	cmp r0, #3
	bne _0221EFA4
	ldr r0, _0221F014 @ =0x02225BB0
	ldr r1, _0221F018 @ =0x02225B74
	ldr r2, _0221F01C @ =0x02225B14
	ldr r3, _0221F020 @ =0x00000146
	bl FUN_020E4A9C
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r3, r4, pc}
_0221EFA4:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	bge _0221EFEC
	mov r0, r4
	bl FUN_0221C748
	cmp r0, #0
	addeq sp, sp, #4
	addeq sp, sp, #0x400
	popeq {r3, r4, pc}
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	cmp r1, r0
	addlt sp, sp, #4
	addlt sp, sp, #0x400
	poplt {r3, r4, pc}
	add r0, r4, #0x50
	bl FUN_0221C704
_0221EFEC:
	mov r3, #0x400
	add r1, sp, #4
	add r2, sp, #0
	mov r0, r4
	str r3, [sp]
	bl FUN_0221CB7C
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r3, r4, pc}
	.align 2, 0
_0221F010: .4byte 0x02225B9C
_0221F014: .4byte 0x02225BB0
_0221F018: .4byte 0x02225B74
_0221F01C: .4byte 0x02225B14
_0221F020: .4byte 0x00000146
	arm_func_end FUN_0221EEC4

	arm_func_start FUN_0221F024
FUN_0221F024: @ 0x0221F024
	push {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _0221F1FC
	ldr r0, [r5, #0x13c]
	add r4, r5, #0x50
	cmp r0, #0
	ldrne r1, _0221F258 @ =0x02225BB4
	bne _0221F060
	ldr r0, [r5, #0xc]
	cmp r0, #3
	ldreq r1, _0221F25C @ =0x02225BBC
	ldrne r1, _0221F260 @ =0x02225BC4
_0221F060:
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
	ldr r0, [r5, #0x15c]
	mov r2, #0
	cmp r0, #0
	ldreq r0, _0221F264 @ =0x02226028
	ldreq r0, [r0]
	cmpeq r0, #0
	beq _0221F098
	ldr r1, [r5, #0x14]
	mov r0, r4
	bl FUN_0221C330
	b _0221F0A4
_0221F098:
	ldr r1, [r5, #0x24]
	mov r0, r4
	bl FUN_0221C330
_0221F0A4:
	ldr r1, _0221F268 @ =0x02225BCC
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
	ldrh r0, [r5, #0x20]
	cmp r0, #0x50
	bne _0221F0D4
	ldr r2, [r5, #0x18]
	ldr r1, _0221F26C @ =0x02225BD8
	mov r0, r4
	bl FUN_0221C5EC
	b _0221F11C
_0221F0D4:
	ldr r1, _0221F270 @ =0x02225BE0
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
	ldr r1, [r5, #0x18]
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
	mov r0, r4
	mov r1, #0x3a
	bl FUN_0221C66C
	ldrh r1, [r5, #0x20]
	mov r0, r4
	bl FUN_0221C6CC
	mov r0, r4
	ldr r1, _0221F274 @ =0x02225BE8
	mov r2, #2
	bl FUN_0221C330
_0221F11C:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _0221F138
	ldr r1, _0221F278 @ =0x02225BEC
	bl FUN_020E9AD0
	cmp r0, #0
	bne _0221F148
_0221F138:
	ldr r1, _0221F278 @ =0x02225BEC
	ldr r2, _0221F27C @ =0x02225BF8
	mov r0, r4
	bl FUN_0221C5EC
_0221F148:
	ldr r0, [r5, #0x34]
	cmp r0, #0
	beq _0221F168
	ldr r1, _0221F280 @ =0x02225C08
	ldr r2, _0221F284 @ =0x02225C14
	mov r0, r4
	bl FUN_0221C5EC
	b _0221F178
_0221F168:
	ldr r1, _0221F280 @ =0x02225C08
	ldr r2, _0221F288 @ =0x02225C20
	mov r0, r4
	bl FUN_0221C5EC
_0221F178:
	ldr r0, [r5, #0x13c]
	cmp r0, #0
	beq _0221F1BC
	ldr r2, [r5, #0x14c]
	ldr r1, _0221F28C @ =0x02225C28
	add r0, sp, #0
	bl FUN_020E7F30
	ldr r1, _0221F290 @ =0x02225C2C
	add r2, sp, #0
	mov r0, r4
	bl FUN_0221C5EC
	mov r0, r5
	bl FUN_0221DB24
	mov r2, r0
	ldr r1, _0221F294 @ =0x02225C3C
	mov r0, r4
	bl FUN_0221C5EC
_0221F1BC:
	ldr r1, [r5, #0x28]
	cmp r1, #0
	beq _0221F1D4
	mov r0, r4
	mov r2, #0
	bl FUN_0221C330
_0221F1D4:
	ldr r1, _0221F274 @ =0x02225BE8
	mov r0, r4
	mov r2, #2
	bl FUN_0221C330
	add r0, r5, #0x50
	cmp r4, r0
	beq _0221F1FC
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	bl FUN_0221C330
_0221F1FC:
	mov r0, r5
	bl FUN_0221C748
	cmp r0, #0
	addeq sp, sp, #0x10
	popeq {r3, r4, r5, pc}
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	cmp r1, r0
	addlt sp, sp, #0x10
	poplt {r3, r4, r5, pc}
	add r0, r5, #0x50
	bl FUN_0221C704
	ldr r0, [r5, #0x13c]
	mov r1, #0
	cmp r0, #0
	movne r0, #4
	moveq r0, #5
	str r0, [r5, #0x10]
	mov r0, r5
	mov r2, r1
	bl FUN_0221C954
	add sp, sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F258: .4byte 0x02225BB4
_0221F25C: .4byte 0x02225BBC
_0221F260: .4byte 0x02225BC4
_0221F264: .4byte 0x02226028
_0221F268: .4byte 0x02225BCC
_0221F26C: .4byte 0x02225BD8
_0221F270: .4byte 0x02225BE0
_0221F274: .4byte 0x02225BE8
_0221F278: .4byte 0x02225BEC
_0221F27C: .4byte 0x02225BF8
_0221F280: .4byte 0x02225C08
_0221F284: .4byte 0x02225C14
_0221F288: .4byte 0x02225C20
_0221F28C: .4byte 0x02225C28
_0221F290: .4byte 0x02225C2C
_0221F294: .4byte 0x02225C3C
	arm_func_end FUN_0221F024

	arm_func_start FUN_0221F298
FUN_0221F298: @ 0x0221F298
	push {r4, r5, r6, lr}
	mov r6, r0
	ldr r5, [r6, #0x148]
	bl FUN_0221E778
	movs r4, r0
	bne _0221F2E4
	ldr r0, [r6, #0xfc]
	cmp r0, #0
	ldrne r0, [r6, #0x38]
	cmpne r0, #0
	bne _0221F2D8
	ldr r0, _0221F324 @ =0x02225C4C
	ldr r1, _0221F328 @ =0x02225B74
	ldr r2, _0221F32C @ =0x02225AE0
	mov r3, #0x200
	bl FUN_020E4A9C
_0221F2D8:
	mov r0, r6
	bl FUN_0221E0DC
	pop {r4, r5, r6, pc}
_0221F2E4:
	ldr r0, [r6, #0x148]
	cmp r5, r0
	beq _0221F2F8
	mov r0, r6
	bl FUN_0221C9D0
_0221F2F8:
	cmp r4, #1
	popne {r4, r5, r6, pc}
	mov r0, r6
	bl FUN_0221E0DC
	mov r1, #0
	mov r3, #5
	mov r0, r6
	mov r2, r1
	str r3, [r6, #0x10]
	bl FUN_0221C954
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F324: .4byte 0x02225C4C
_0221F328: .4byte 0x02225B74
_0221F32C: .4byte 0x02225AE0
	arm_func_end FUN_0221F298

	arm_func_start FUN_0221F330
FUN_0221F330: @ 0x0221F330
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r2, #0
	ldr r0, [r4, #0x48]
	add r1, sp, #0
	mov r3, r2
	bl FUN_021FF59C
	mvn r1, #0
	cmp r0, r1
	bne _0221F380
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #5
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	add sp, sp, #4
	str r0, [r4, #0x4c]
	pop {r3, r4, pc}
_0221F380:
	ldr r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	popeq {r3, r4, pc}
	mov r1, #0
	mov r3, #6
	mov r0, r4
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end FUN_0221F330

	arm_func_start FUN_0221F3B0
FUN_0221F3B0: @ 0x0221F3B0
	push {r4, r5, r6, lr}
	sub sp, sp, #0x18
	movs r4, r0
	bne _0221F3D4
	ldr r0, _0221F4DC @ =0x02225B68
	ldr r1, _0221F4E0 @ =0x02225B74
	ldr r2, _0221F4E4 @ =0x02225AF0
	ldr r3, _0221F4E8 @ =0x0000024E
	bl FUN_020E4A9C
_0221F3D4:
	ldr r0, [r4, #0x80]
	cmp r0, #0
	bgt _0221F3F4
	ldr r0, _0221F4EC @ =0x02225C78
	ldr r1, _0221F4E0 @ =0x02225B74
	ldr r2, _0221F4E4 @ =0x02225AF0
	ldr r3, _0221F4F0 @ =0x0000024F
	bl FUN_020E4A9C
_0221F3F4:
	add r1, sp, #0xc
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	ldr r1, _0221F4F4 @ =0x02225C98
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl FUN_020E9428
	mov ip, #0
	ldr r5, [sp, #8]
	mov lr, #1
	ldr r2, _0221F4F8 @ =0x0210E504
	mov r3, ip
	b _0221F438
_0221F430:
	add r5, r5, #1
	str r5, [sp, #8]
_0221F438:
	ldr r1, [r4, #0x78]
	ldrsb r1, [r1, r5]
	cmp r1, #0
	beq _0221F474
	mov r6, lr
	blt _0221F458
	cmp r1, #0x80
	movlt r6, ip
_0221F458:
	cmp r6, #0
	movne r1, r3
	lsleq r1, r1, #1
	ldrheq r1, [r2, r1]
	andeq r1, r1, #0x100
	cmp r1, #0
	bne _0221F430
_0221F474:
	cmp r0, #3
	bne _0221F498
	ldr r1, [sp, #0x14]
	cmp r1, #1
	ldrge r0, [sp, #0xc]
	cmpge r0, #0x64
	blt _0221F498
	cmp r0, #0x258
	blt _0221F4B4
_0221F498:
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #7
	str r0, [r4, #0x38]
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_0221F4B4:
	str r1, [r4, #0xe4]
	ldr r1, [sp, #0x10]
	mov r0, #1
	str r1, [r4, #0xe8]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0xec]
	ldr r1, [sp, #8]
	str r1, [r4, #0xf0]
	add sp, sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F4DC: .4byte 0x02225B68
_0221F4E0: .4byte 0x02225B74
_0221F4E4: .4byte 0x02225AF0
_0221F4E8: .4byte 0x0000024E
_0221F4EC: .4byte 0x02225C78
_0221F4F0: .4byte 0x0000024F
_0221F4F4: .4byte 0x02225C98
_0221F4F8: .4byte 0x0210E504
	arm_func_end FUN_0221F3B0

	arm_func_start FUN_0221F4FC
FUN_0221F4FC: @ 0x0221F4FC
	push {r4, r5, lr}
	sub sp, sp, #4
	sub sp, sp, #0x400
	mov r3, #0x400
	add r1, sp, #4
	add r2, sp, #0
	mov r4, r0
	str r3, [sp]
	bl FUN_0221CB7C
	mov r5, r0
	cmp r5, #3
	addeq sp, sp, #4
	addeq sp, sp, #0x400
	popeq {r4, r5, pc}
	cmp r5, #1
	ldreq r1, [r4, #0x84]
	ldreq r0, [r4, #0x80]
	cmpeq r1, r0
	addeq sp, sp, #4
	addeq sp, sp, #0x400
	popeq {r4, r5, pc}
	cmp r5, #0
	bne _0221F578
	ldr r2, [sp]
	add r1, sp, #4
	add r0, r4, #0x74
	bl FUN_0221C330
	cmp r0, #0
	addeq sp, sp, #4
	addeq sp, sp, #0x400
	popeq {r4, r5, pc}
_0221F578:
	ldr r0, [r4, #0x78]
	ldr r1, _0221F620 @ =0x02225BE8
	bl FUN_020E9AD0
	cmp r0, #0
	beq _0221F5E8
	mov r1, #0
	strb r1, [r0]
	ldr r1, [r4, #0x78]
	sub r5, r0, r1
	add r1, r5, #1
	mov r0, r4
	str r1, [r4, #0xf8]
	bl FUN_0221F3B0
	cmp r0, #0
	addeq sp, sp, #4
	addeq sp, sp, #0x400
	popeq {r4, r5, pc}
	add r3, r5, #2
	mov r1, #0
	str r3, [r4, #0x84]
	mov r3, #7
	mov r0, r4
	mov r2, r1
	str r3, [r4, #0x10]
	bl FUN_0221C954
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r4, r5, pc}
_0221F5E8:
	cmp r5, #2
	addne sp, sp, #4
	addne sp, sp, #0x400
	popne {r4, r5, pc}
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #7
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x48]
	bl FUN_021FFA60
	str r0, [r4, #0x4c]
	add sp, sp, #4
	add sp, sp, #0x400
	pop {r4, r5, pc}
	.align 2, 0
_0221F620: .4byte 0x02225BE8
	arm_func_end FUN_0221F4FC

	arm_func_start FUN_0221F624
FUN_0221F624: @ 0x0221F624
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x100]
	mov ip, #0
	add r3, r0, r2
	str r3, [r4, #0x100]
	ldr r0, [r4, #0x104]
	mov lr, ip
	cmp r3, r0
	beq _0221F658
	ldr r0, [r4, #0x130]
	cmp r0, #0
	beq _0221F660
_0221F658:
	mov r0, #1
	str r0, [r4, #0xfc]
_0221F660:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0221F68C
	add r0, r4, #0xbc
	bl FUN_0221C330
	cmp r0, #0
	moveq r0, #0
	popeq {r4, pc}
	ldr ip, [r4, #0xc0]
	ldr lr, [r4, #0xc8]
	b _0221F6CC
_0221F68C:
	cmp r0, #1
	bne _0221F6C0
	cmp r2, #0
	beq _0221F6B4
	mov r0, #1
	str r0, [r4, #0xfc]
	mov r0, #0xd
	str r0, [r4, #0x38]
	mov r0, #0
	pop {r4, pc}
_0221F6B4:
	mov ip, r1
	mov lr, r2
	b _0221F6CC
_0221F6C0:
	cmp r0, #2
	moveq ip, r1
	moveq lr, r2
_0221F6CC:
	mov r0, r4
	mov r1, ip
	mov r2, lr
	bl FUN_0221C954
	mov r0, #1
	pop {r4, pc}
	arm_func_end FUN_0221F624

	arm_func_start FUN_0221F6E4
FUN_0221F6E4: @ 0x0221F6E4
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4, #0x120]
	cmp r0, #0
	bne _0221F710
	ldr r0, _0221F734 @ =0x02225CA8
	ldr r1, _0221F738 @ =0x02225B74
	ldr r2, _0221F73C @ =0x02225B00
	ldr r3, _0221F740 @ =0x00000321
	bl FUN_020E4A9C
_0221F710:
	ldr r1, _0221F744 @ =0x02225CAC
	add r2, sp, #0
	add r0, r4, #0x114
	bl FUN_020E9428
	cmp r0, #1
	mvnne r0, #0
	ldreq r0, [sp]
	add sp, sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221F734: .4byte 0x02225CA8
_0221F738: .4byte 0x02225B74
_0221F73C: .4byte 0x02225B00
_0221F740: .4byte 0x00000321
_0221F744: .4byte 0x02225CAC
	arm_func_end FUN_0221F6E4

	arm_func_start FUN_0221F748
FUN_0221F748: @ 0x0221F748
	push {r3, r4, r5, r6, r7, lr}
	movs r4, r0
	mov r7, r1
	mov r6, r2
	bne _0221F770
	ldr r0, _0221F7F8 @ =0x02225B68
	ldr r1, _0221F7FC @ =0x02225B74
	ldr r2, _0221F800 @ =0x02225B48
	ldr r3, _0221F804 @ =0x00000333
	bl FUN_020E4A9C
_0221F770:
	cmp r7, #0
	bne _0221F78C
	ldr r0, _0221F808 @ =0x02225CB0
	ldr r1, _0221F7FC @ =0x02225B74
	ldr r2, _0221F800 @ =0x02225B48
	mov r3, #0x334
	bl FUN_020E4A9C
_0221F78C:
	cmp r6, #0
	bge _0221F7A8
	ldr r0, _0221F80C @ =0x02225CB8
	ldr r1, _0221F7FC @ =0x02225B74
	ldr r2, _0221F800 @ =0x02225B48
	ldr r3, _0221F810 @ =0x00000335
	bl FUN_020E4A9C
_0221F7A8:
	cmp r6, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r3, [r4, #0x120]
	cmp r3, #0xa
	popge {r3, r4, r5, r6, r7, pc}
	rsb r5, r3, #0xa
	cmp r5, r6
	movge r5, r6
	add r0, r4, #0x114
	mov r1, r7
	mov r2, r5
	add r0, r0, r3
	bl FUN_020E5AD8
	ldr r0, [r4, #0x120]
	mov r1, #0
	add r0, r0, r5
	str r0, [r4, #0x120]
	add r0, r4, r0
	strb r1, [r0, #0x114]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F7F8: .4byte 0x02225B68
_0221F7FC: .4byte 0x02225B74
_0221F800: .4byte 0x02225B48
_0221F804: .4byte 0x00000333
_0221F808: .4byte 0x02225CB0
_0221F80C: .4byte 0x02225CB8
_0221F810: .4byte 0x00000335
	arm_func_end FUN_0221F748

	arm_func_start FUN_0221F814
FUN_0221F814: @ 0x0221F814
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _0221F83C
	ldr r0, _0221FA10 @ =0x02225B68
	ldr r1, _0221FA14 @ =0x02225B74
	ldr r2, _0221FA18 @ =0x02225B2C
	ldr r3, _0221FA1C @ =0x0000035D
	bl FUN_020E4A9C
_0221F83C:
	cmp r5, #0
	bne _0221F858
	ldr r0, _0221FA20 @ =0x02225CB0
	ldr r1, _0221FA14 @ =0x02225B74
	ldr r2, _0221FA18 @ =0x02225B2C
	ldr r3, _0221FA24 @ =0x0000035E
	bl FUN_020E4A9C
_0221F858:
	cmp r4, #0
	bgt _0221F874
	ldr r0, _0221FA28 @ =0x02225CC4
	ldr r1, _0221FA14 @ =0x02225B74
	ldr r2, _0221FA18 @ =0x02225B2C
	ldr r3, _0221FA2C @ =0x0000035F
	bl FUN_020E4A9C
_0221F874:
	ldr r0, [r6, #0x110]
	cmp r0, #0
	beq _0221F9FC
	cmp r4, #0
	ble _0221F9F4
	mov r8, #0
	mov fp, #1
	mov sb, #3
	mvn r7, #0
_0221F898:
	ldr r0, [r6, #0x128]
	cmp r0, #0
	bne _0221F92C
	mov r0, r5
	mov r1, #0xa
	bl FUN_020E987C
	movs sl, r0
	beq _0221F914
	mov r0, r6
	mov r1, r5
	sub r2, sl, r5
	bl FUN_0221F748
	add r1, sl, #1
	sub r2, r1, r5
	mov r0, r6
	sub r4, r4, r2
	mov r5, r1
	bl FUN_0221F6E4
	str r0, [r6, #0x124]
	cmp r0, r7
	bne _0221F904
	mov r0, #1
	str r0, [r6, #0xfc]
	mov r0, #7
	str r0, [r6, #0x38]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F904:
	cmp r0, #0
	streq sb, [r6, #0x128]
	strne fp, [r6, #0x128]
	b _0221F9EC
_0221F914:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_0221F748
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F92C:
	cmp r0, #1
	bne _0221F97C
	ldr sl, [r6, #0x124]
	mov r0, r6
	cmp sl, r4
	movge sl, r4
	mov r1, r5
	mov r2, sl
	bl FUN_0221F624
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r6, #0x124]
	add r5, r5, sl
	subs r0, r0, sl
	str r0, [r6, #0x124]
	moveq r0, #2
	sub r4, r4, sl
	streq r0, [r6, #0x128]
	b _0221F9EC
_0221F97C:
	cmp r0, #2
	bne _0221F9C0
	mov r0, r5
	mov r1, #0xa
	bl FUN_020E987C
	cmp r0, #0
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	strb r8, [r6, #0x114]
	str r8, [r6, #0x120]
	add r0, r0, #1
	sub r1, r0, r5
	str r8, [r6, #0x124]
	mov r5, r0
	str r8, [r6, #0x128]
	sub r4, r4, r1
	b _0221F9EC
_0221F9C0:
	cmp r0, #3
	moveq r0, #1
	streq r0, [r6, #0xfc]
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0221FA30 @ =0x02225BB0
	ldr r1, _0221FA14 @ =0x02225B74
	ldr r2, _0221FA18 @ =0x02225B2C
	ldr r3, _0221FA34 @ =0x000003E3
	bl FUN_020E4A9C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F9EC:
	cmp r4, #0
	bgt _0221F898
_0221F9F4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F9FC:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl FUN_0221F624
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221FA10: .4byte 0x02225B68
_0221FA14: .4byte 0x02225B74
_0221FA18: .4byte 0x02225B2C
_0221FA1C: .4byte 0x0000035D
_0221FA20: .4byte 0x02225CB0
_0221FA24: .4byte 0x0000035E
_0221FA28: .4byte 0x02225CC4
_0221FA2C: .4byte 0x0000035F
_0221FA30: .4byte 0x02225BB0
_0221FA34: .4byte 0x000003E3
	arm_func_end FUN_0221F814

	arm_func_start FUN_0221FA38
FUN_0221FA38: @ 0x0221FA38
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	mov r0, #0x1000
	bl FUN_021EC3A8
	str r0, [sp, #4]
	cmp r0, #0
	bne _0221FA6C
	mov r0, #1
	str r0, [sl, #0xfc]
	add sp, sp, #0x18
	str r0, [sl, #0x38]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221FA6C:
	ldr r1, [sp, #4]
	mov r3, #0x1000
	add r2, sp, #8
	mov r0, sl
	str r3, [sp, #8]
	bl FUN_0221CB7C
	mov r6, r0
	cmp r6, #3
	beq _0221FE74
	cmp r6, #1
	ldreq r1, [sl, #0x84]
	ldreq r0, [sl, #0x80]
	cmpeq r1, r0
	beq _0221FE74
	cmp r6, #0
	bne _0221FAC4
	ldr r2, [sp, #8]
	ldr r1, [sp, #4]
	add r0, sl, #0x74
	bl FUN_0221C330
	cmp r0, #0
	beq _0221FE74
_0221FAC4:
	ldr r5, [sl, #0x84]
	ldr r4, [sl, #0x78]
	ldr r1, _0221FE84 @ =0x02225CCC
	add r0, r4, r5
	str r5, [sl, #0xf4]
	bl FUN_020E9AD0
	cmp r0, #0
	bne _0221FAF0
	ldr r1, _0221FE88 @ =0x02225CD4
	add r0, r4, r5
	bl FUN_020E9AD0
_0221FAF0:
	cmp r0, #0
	beq _0221FE50
	mov r1, #0
	strb r1, [r0, #2]
	ldr r2, [sl, #0x78]
	add r7, r0, #2
	ldr r1, [sl, #0x80]
	sub r3, r7, r2
	str r3, [sl, #0x80]
	add r6, r0, #4
	ldr r3, [sl, #0x78]
	sub r2, r6, r2
	sub r0, r7, r3
	str r0, [sl, #0xf8]
	str r0, [sl, #0x84]
	ldr r3, [sl, #0xec]
	ldr r7, _0221FE8C @ =0x51EB851F
	lsr r0, r3, #0x1f
	smull r3, r8, r7, r3
	add r8, r0, r8, asr #5
	cmp r8, #1
	sub r7, r1, r2
	bne _0221FB98
	cmp r7, #0
	beq _0221FB74
	ldr r0, [sl, #0x78]
	mov r1, r6
	add r2, r7, #1
	bl FUN_020E5AF8
	str r7, [sl, #0x80]
	mov r0, #0
	str r0, [sl, #0x84]
	b _0221FB7C
_0221FB74:
	add r0, sl, #0x74
	bl FUN_0221C704
_0221FB7C:
	mov r1, #0
	mov r3, #6
	mov r0, sl
	mov r2, r1
	str r3, [sl, #0x10]
	bl FUN_0221C954
	b _0221FE74
_0221FB98:
	cmp r8, #3
	bne _0221FCE8
	ldr r0, [sl, #0x10c]
	cmp r0, #0xa
	ble _0221FBC0
	mov r0, #1
	str r0, [sl, #0xfc]
	mov r0, #0xb
	str r0, [sl, #0x38]
	b _0221FE74
_0221FBC0:
	ldr r1, _0221FE90 @ =0x02225CD8
	add r0, r4, r5
	bl FUN_020E9AD0
	cmp r0, #0
	beq _0221FCE8
	add r4, r0, #9
	ldr r1, _0221FE94 @ =0x0210E504
	mov r2, #0
	b _0221FBE8
_0221FBE4:
	add r4, r4, #1
_0221FBE8:
	ldrsb r0, [r4]
	cmp r0, #0
	blt _0221FBFC
	cmp r0, #0x80
	blt _0221FC04
_0221FBFC:
	mov r0, r2
	b _0221FC10
_0221FC04:
	lsl r0, r0, #1
	ldrh r0, [r1, r0]
	and r0, r0, #0x100
_0221FC10:
	cmp r0, #0
	bne _0221FBE4
	mov r3, r4
	ldr r1, _0221FE94 @ =0x0210E504
	mov r2, #0
	b _0221FC2C
_0221FC28:
	add r3, r3, #1
_0221FC2C:
	ldrsb r0, [r3]
	cmp r0, #0
	beq _0221FC60
	blt _0221FC44
	cmp r0, #0x80
	blt _0221FC4C
_0221FC44:
	mov r0, r2
	b _0221FC58
_0221FC4C:
	lsl r0, r0, #1
	ldrh r0, [r1, r0]
	and r0, r0, #0x100
_0221FC58:
	cmp r0, #0
	beq _0221FC28
_0221FC60:
	mov r0, #0
	strb r0, [r3]
	ldrsb r0, [r4]
	cmp r0, #0x2f
	bne _0221FCC4
	ldr r0, [sl, #0x18]
	bl FUN_020E9580
	mov r5, r0
	mov r0, r4
	bl FUN_020E9580
	add r1, r5, #0xe
	add r0, r1, r0
	bl FUN_021EC3A8
	str r0, [sl, #0x108]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sl, #0xfc]
	streq r0, [sl, #0x38]
	str r4, [sp]
	ldrh r3, [sl, #0x20]
	ldr r0, [sl, #0x108]
	ldr r2, [sl, #0x18]
	ldr r1, _0221FE98 @ =0x02225CE4
	bl FUN_020E7F30
	b _0221FE74
_0221FCC4:
	mov r0, r4
	bl FUN_021FF3D4
	str r0, [sl, #0x108]
	cmp r0, #0
	bne _0221FE74
	mov r0, #1
	str r0, [sl, #0xfc]
	str r0, [sl, #0x38]
	b _0221FE74
_0221FCE8:
	ldr r1, _0221FE9C @ =0x02225CF4
	add r0, r4, r5
	bl FUN_020E9AD0
	movs fp, r0
	beq _0221FDC0
	ldr r8, _0221FEA0 @ =0x02224E6C
	add r1, sp, #0xc
	mov r3, #5
_0221FD08:
	ldrb r2, [r8]
	ldrb r0, [r8, #1]
	add r8, r8, #2
	strb r2, [r1]
	strb r0, [r1, #1]
	add r1, r1, #2
	subs r3, r3, #1
	bne _0221FD08
	ldrb r2, [r8]
	add r8, fp, #0x10
	add r0, sp, #0xc
	mov sb, r8
	strb r2, [r1]
	bl FUN_020E9580
	b _0221FD48
_0221FD44:
	add sb, sb, #1
_0221FD48:
	cmp sb, #0
	ldrsbne r1, [sb]
	cmpne r1, #0
	cmpne r1, #0xa
	cmpne r1, #0xd
	cmpne r1, #0x20
	bne _0221FD44
	sub r2, sb, r8
	cmp r2, r0
	ble _0221FD84
	mov r0, #1
	str r0, [sl, #0xfc]
	mov r0, #0x10
	str r0, [sl, #0x38]
	b _0221FE74
_0221FD84:
	cmp r0, r2
	bne _0221FDB4
	add r1, sp, #0xc
	mov r0, r8
	bl FUN_020E9848
	cmp r0, #0
	blt _0221FDB4
	mov r0, #1
	str r0, [sl, #0xfc]
	mov r0, #0x10
	str r0, [sl, #0x38]
	b _0221FE74
_0221FDB4:
	mov r0, r8
	bl FUN_020EB82C
	str r0, [sl, #0x104]
_0221FDC0:
	ldr r1, _0221FEA4 @ =0x02225D04
	add r0, r4, r5
	bl FUN_020E9AD0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r0, [sl, #0x110]
	cmp r0, #0
	beq _0221FDF8
	mov r0, #0
	strb r0, [sl, #0x114]
	str r0, [sl, #0x120]
	str r0, [sl, #0x124]
	str r0, [sl, #0x128]
_0221FDF8:
	ldr r0, [sl, #0xc]
	sub r0, r0, #3
	cmp r0, #1
	movls r0, #1
	strls r0, [sl, #0xfc]
	bls _0221FE74
	mov r0, #8
	str r0, [sl, #0x10]
	cmp fp, #0
	beq _0221FE34
	ldr r0, [sl, #0x104]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sl, #0xfc]
	beq _0221FE74
_0221FE34:
	cmp r7, #0
	ble _0221FE74
	mov r0, sl
	mov r1, r6
	mov r2, r7
	bl FUN_0221F814
	b _0221FE74
_0221FE50:
	cmp r6, #2
	bne _0221FE74
	mov r0, #1
	str r0, [sl, #0xfc]
	mov r0, #7
	str r0, [sl, #0x38]
	ldr r0, [sl, #0x48]
	bl FUN_021FFA60
	str r0, [sl, #0x4c]
_0221FE74:
	ldr r0, [sp, #4]
	bl FUN_021EC3D8
	add sp, sp, #0x18
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0221FE84: .4byte 0x02225CCC
_0221FE88: .4byte 0x02225CD4
_0221FE8C: .4byte 0x51EB851F
_0221FE90: .4byte 0x02225CD8
_0221FE94: .4byte 0x0210E504
_0221FE98: .4byte 0x02225CE4
_0221FE9C: .4byte 0x02225CF4
_0221FEA0: .4byte 0x02224E6C
_0221FEA4: .4byte 0x02225D04
	arm_func_end FUN_0221FA38

	arm_func_start FUN_0221FEA8
FUN_0221FEA8: @ 0x0221FEA8
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	bl FUN_021FF368
	mov r7, r0
	mov r0, #0x2000
	mov r8, #0
	bl FUN_021EC3A8
	movs r6, r0
	bne _0221FEDC
	mov r0, #1
	str r0, [sb, #0xfc]
	str r0, [sb, #0x38]
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_0221FEDC:
	mov r5, #0x2000
	add r4, sp, #0
	b _0221FF58
_0221FEE8:
	mov r0, sb
	mov r1, r6
	mov r2, r4
	str r5, [sp]
	bl FUN_0221CB7C
	cmp r0, #3
	cmpne r0, #1
	beq _0221FF70
	cmp r0, #2
	bne _0221FF38
	mov r0, #1
	str r0, [sb, #0xfc]
	ldr r1, [sb, #0x104]
	cmp r1, #0
	ble _0221FF70
	ldr r0, [sb, #0x100]
	cmp r0, r1
	movlt r0, #0xf
	strlt r0, [sb, #0x38]
	b _0221FF70
_0221FF38:
	ldr r2, [sp]
	mov r0, sb
	mov r1, r6
	bl FUN_0221F814
	cmp r0, #0
	beq _0221FF70
	bl FUN_021FF368
	sub r8, r0, r7
_0221FF58:
	ldr r0, [sb, #0xfc]
	cmp r0, #0
	bne _0221FF70
	ldr r0, [sb, #0x158]
	cmp r8, r0
	blo _0221FEE8
_0221FF70:
	mov r0, r6
	bl FUN_021EC3D8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FUN_0221FEA8

	arm_func_start FUN_0221FF7C
FUN_0221FF7C: @ 0x0221FF7C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r6, _0221FFB8 @ =0x02226078
	ldr r4, _0221FFBC @ =0x02226070
	mov r5, r7
_0221FF90:
	ldr r0, [r6, r7, lsl #2]
	cmp r0, #0
	beq _0221FFA8
	ldr r1, [r4]
	blx r1
	str r5, [r6, r7, lsl #2]
_0221FFA8:
	add r7, r7, #1
	cmp r7, #3
	blt _0221FF90
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221FFB8: .4byte 0x02226078
_0221FFBC: .4byte 0x02226070
	arm_func_end FUN_0221FF7C

	arm_func_start FUN_0221FFC0
FUN_0221FFC0: @ 0x0221FFC0
	push {r4, r5, r6, lr}
	mov r6, r1
	ldrsb r1, [r6]
	mov r4, r0
	cmp r1, #0
	beq _0222007C
	mov r0, r6
	bl FUN_02221870
	cmp r0, #0xa
	ble _0221FFFC
	ldr r0, _02220084 @ =0x0222606C
	mov r1, #7
	str r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_0221FFFC:
	mov r0, r6
	bl FUN_02221870
	mov r5, r0
	cmp r5, #0xa
	ble _02220024
	ldr r0, _02220084 @ =0x0222606C
	mov r1, #7
	str r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02220024:
	bl FUN_022201AC
	ldr r1, _02220088 @ =0x0222605C
	add r0, r0, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	ldr r1, _0222008C @ =0x02226078
	cmp r0, #0
	str r0, [r1, r4, lsl #2]
	bne _02220060
	ldr r0, _02220084 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02220060:
	mov r1, r6
	mov r2, r5
	bl FUN_022201C8
	ldr r1, _0222008C @ =0x02226078
	mov r2, #0
	ldr r1, [r1, r4, lsl #2]
	strb r2, [r1, r0]
_0222007C:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02220084: .4byte 0x0222606C
_02220088: .4byte 0x0222605C
_0222008C: .4byte 0x02226078
	arm_func_end FUN_0221FFC0

	arm_func_start FUN_02220090
FUN_02220090: @ 0x02220090
	push {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl FUN_02221734
	bl FUN_0221FF7C
	mov r1, r6
	mov r0, #0
	bl FUN_0221FFC0
	cmp r0, #0
	beq _022200F0
	mov r1, r5
	mov r0, #1
	bl FUN_0221FFC0
	cmp r0, #0
	beq _022200F0
	mov r1, r4
	mov r0, #2
	bl FUN_0221FFC0
	cmp r0, #0
	beq _022200F0
	bl FUN_02221748
	mov r0, #1
	pop {r4, r5, r6, pc}
_022200F0:
	bl FUN_0221FF7C
	bl FUN_02221748
	mov r0, #0
	pop {r4, r5, r6, pc}
	arm_func_end FUN_02220090

	arm_func_start FUN_02220100
FUN_02220100: @ 0x02220100
	push {r4, lr}
	mov r4, #0
	mov lr, r4
	cmp r2, #0
	ble _02220140
	mov r3, r4
_02220118:
	ldrsb ip, [r1]
	cmp ip, #0
	strbeq r3, [r0], #1
	beq _02220134
	add r4, r4, #1
	add r1, r1, #1
	strb ip, [r0], #1
_02220134:
	add lr, lr, #1
	cmp lr, r2
	blt _02220118
_02220140:
	mov r0, r4
	pop {r4, pc}
	arm_func_end FUN_02220100

	arm_func_start FUN_02220148
FUN_02220148: @ 0x02220148
	cmp r0, #0x41
	blo _0222015C
	cmp r0, #0x5a
	subls r0, r0, #0x41
	bxls lr
_0222015C:
	cmp r0, #0x61
	blo _02220170
	cmp r0, #0x7a
	subls r0, r0, #0x47
	bxls lr
_02220170:
	cmp r0, #0x30
	blo _02220184
	cmp r0, #0x39
	addls r0, r0, #4
	bxls lr
_02220184:
	cmp r0, #0x2e
	moveq r0, #0x3e
	bxeq lr
	cmp r0, #0x2d
	moveq r0, #0x3f
	mvnne r0, #0
	bx lr
	arm_func_end FUN_02220148

	arm_func_start FUN_022201A0
FUN_022201A0: @ 0x022201A0
	asr r0, r0, #2
	add r0, r0, r0, lsl #1
	bx lr
	arm_func_end FUN_022201A0

	arm_func_start FUN_022201AC
FUN_022201AC: @ 0x022201AC
	ldr r1, _022201C4 @ =0x55555556
	add r2, r0, #2
	smull r0, r3, r1, r2
	add r3, r3, r2, lsr #31
	lsl r0, r3, #2
	bx lr
	.align 2, 0
_022201C4: .4byte 0x55555556
	arm_func_end FUN_022201AC

	arm_func_start FUN_022201C8
FUN_022201C8: @ 0x022201C8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r2
	mov r8, r1
	mov sb, r0
	cmp r7, #3
	movgt r2, #3
	add r0, sp, #0
	mov r1, r8
	mov r6, #0
	bl FUN_02220100
	cmp r0, #0
	ble _022202AC
	mov r5, #0
	ldr sl, _022202BC @ =0x02224E78
	mov r4, r5
	mov fp, #0x2a
_02220208:
	cmp r7, #3
	strblt r5, [sp, #2]
	cmp r7, #2
	strblt r4, [sp, #1]
	ldrb r1, [sp, #2]
	ldrb r2, [sp]
	ldrb r3, [sp, #1]
	asr lr, r1, #6
	asr ip, r2, #2
	orr lr, lr, r3, lsl #2
	asr r3, r3, #4
	and ip, ip, #0xff
	orr r2, r3, r2, lsl #4
	ldrsb ip, [sl, ip]
	and r2, r2, #0x3f
	ldrsb r2, [sl, r2]
	strb ip, [sb]
	and ip, lr, #0x3f
	cmp r0, #1
	strb r2, [sb, #1]
	ldrsbgt r2, [sl, ip]
	and r1, r1, #0x3f
	add r8, r8, r0
	movle r2, fp
	cmp r0, #2
	ldrsbgt r1, [sl, r1]
	strb r2, [sb, #2]
	add r6, r6, #4
	movle r1, #0x2a
	strb r1, [sb, #3]
	add sb, sb, #4
	subs r7, r7, r0
	beq _022202AC
	cmp r7, #3
	movgt r2, #3
	movle r2, r7
	add r0, sp, #0
	mov r1, r8
	bl FUN_02220100
	cmp r0, #0
	bgt _02220208
_022202AC:
	mov r1, #0
	mov r0, r6
	strb r1, [sb]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022202BC: .4byte 0x02224E78
	arm_func_end FUN_022201C8

	arm_func_start FUN_022202C0
FUN_022202C0: @ 0x022202C0
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov sb, r0
	mov r7, r2
	add r0, sp, #3
	mov r2, #4
	mov r6, #0
	mov r8, r1
	bl FUN_02220100
	mov r5, r0
	mov r4, r6
	b _022203CC
_022202F0:
	ldrb r0, [sp, #3]
	mov r1, #0
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r1, [sp, #2]
	bl FUN_02220148
	movs r4, r0
	bmi _02220378
	ldrb r0, [sp, #4]
	lsl r1, r4, #2
	strb r1, [sp]
	bl FUN_02220148
	movs r4, r0
	bmi _02220378
	ldrsb r2, [sp]
	ldrb r0, [sp, #5]
	lsl r1, r4, #4
	orr r2, r2, r4, asr #4
	strb r2, [sp]
	strb r1, [sp, #1]
	bl FUN_02220148
	movs r4, r0
	bmi _02220378
	ldrsb r2, [sp, #1]
	ldrb r0, [sp, #6]
	lsl r1, r4, #6
	orr r2, r2, r4, asr #2
	strb r1, [sp, #2]
	strb r2, [sp, #1]
	bl FUN_02220148
	movs r4, r0
	ldrsbpl r0, [sp, #2]
	orrpl r0, r0, r4
	strbpl r0, [sp, #2]
_02220378:
	sub r1, r5, #1
	cmp r1, #0
	mov r2, #0
	ble _022203A0
	add r3, sp, #0
_0222038C:
	ldrsb r0, [r3], #1
	add r2, r2, #1
	cmp r2, r1
	strb r0, [sb], #1
	blt _0222038C
_022203A0:
	sub r0, r5, #1
	sub r7, r7, #4
	cmp r7, #0
	add r8, r8, r5
	add r6, r6, r0
	ble _022203DC
	add r0, sp, #3
	mov r1, r8
	mov r2, #4
	bl FUN_02220100
	mov r5, r0
_022203CC:
	cmp r5, #0
	ble _022203DC
	cmp r4, #0
	bge _022202F0
_022203DC:
	mov r0, r6
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FUN_022202C0

	arm_func_start FUN_022203E8
FUN_022203E8: @ 0x022203E8
	push {r4, r5, r6, lr}
	mov r6, r0
	bl FUN_02221870
	ldr r1, _02220430 @ =0x02226050
	mov r4, r0
	ldr r2, [r1, #0xc]
	add r0, r4, #1
	mov r1, #4
	blx r2
	movs r5, r0
	beq _02220428
	mov r1, r6
	mov r2, r4
	bl FUN_0222189C
	mov r0, #0
	strb r0, [r5, r4]
_02220428:
	mov r0, r5
	pop {r4, r5, r6, pc}
	.align 2, 0
_02220430: .4byte 0x02226050
	arm_func_end FUN_022203E8

	arm_func_start FUN_02220434
FUN_02220434: @ 0x02220434
	push {r3, r4, r5, r6, r7, lr}
	ldr ip, _022205C4 @ =0x02226050
	mov r5, r0
	mov r4, r1
	str r5, [ip, #0xc]
	mov r1, #0
	ldr r0, [sp, #0x20]
	str r4, [ip, #0x20]
	str r0, [ip, #0x18]
	str r1, [ip, #0x1c]
	str r1, [ip, #0x28]
	str r1, [ip, #0x2c]
	str r1, [ip, #0x30]
	str r1, [ip, #4]
	sub r0, r1, #1
	str r0, [ip, #0x24]
	str r1, [ip, #8]
	ldr r0, _022205C8 @ =0x02226090
	mov r7, r2
	mov r6, r3
	str r1, [ip, #0x10]
	bl FUN_02221810
	ldr r0, _022205CC @ =0x022260D8
	bl FUN_02220810
	mov r0, r7
	bl FUN_022203E8
	ldr r1, _022205C4 @ =0x02226050
	cmp r0, #0
	str r0, [r1, #0x10]
	beq _02220580
	mov r0, r6
	bl FUN_022203E8
	ldr r1, _022205C4 @ =0x02226050
	cmp r0, #0
	str r0, [r1, #8]
	beq _02220580
	ldr r1, [sp, #0x18]
	ldr r0, _022205D0 @ =0x02226084
	mov r2, #4
	bl FUN_022201C8
	ldr r1, _022205D0 @ =0x02226084
	mov r2, #0
	strb r2, [r1, r0]
	ldr r1, [sp, #0x1c]
	ldr r0, _022205D4 @ =0x022260BC
	mov r2, #0x10
	bl FUN_022201C8
	ldr r1, _022205D4 @ =0x022260BC
	mov r2, #0
	strb r2, [r1, r0]
	bl FUN_0222175C
	cmp r0, #0
	beq _0222054C
	bl FUN_02221718
	cmp r0, #0
	beq _0222054C
	mov r0, r5
	mov r1, r4
	mov r2, #0xa
	bl FUN_022219FC
	cmp r0, #0
	beq _02220548
	ldr r0, _022205D8 @ =0x022260A4
	bl FUN_02220684
	ldr r1, _022205C4 @ =0x02226050
	str r0, [r1, #4]
	mov r0, #1
	str r0, [r1, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
_02220548:
	bl FUN_02221730
_0222054C:
	ldr r1, _022205C4 @ =0x02226050
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x20]
	blx r1
	ldr r1, _022205C4 @ =0x02226050
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #0x20]
	blx r1
	ldr r0, _022205C4 @ =0x02226050
	mov r1, #8
	str r1, [r0, #0x1c]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02220580:
	ldr r1, _022205C4 @ =0x02226050
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02220598
	ldr r1, [r1, #0x20]
	blx r1
_02220598:
	ldr r1, _022205C4 @ =0x02226050
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _022205B0
	ldr r1, [r1, #0x20]
	blx r1
_022205B0:
	ldr r0, _022205C4 @ =0x02226050
	mov r1, #1
	str r1, [r0, #0x1c]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022205C4: .4byte 0x02226050
_022205C8: .4byte 0x02226090
_022205CC: .4byte 0x022260D8
_022205D0: .4byte 0x02226084
_022205D4: .4byte 0x022260BC
_022205D8: .4byte 0x022260A4
	arm_func_end FUN_02220434

	arm_func_start FUN_022205DC
FUN_022205DC: @ 0x022205DC
	push {r3, lr}
	bl FUN_0221FF7C
	bl FUN_02221730
	bl FUN_02221784
	ldr r1, _0222061C @ =0x02226050
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x20]
	blx r1
	ldr r1, _0222061C @ =0x02226050
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #0x20]
	blx r1
	ldr r0, _0222061C @ =0x02226050
	ldr r0, [r0]
	blx r0
	pop {r3, pc}
	.align 2, 0
_0222061C: .4byte 0x02226050
	arm_func_end FUN_022205DC

	arm_func_start FUN_02220620
FUN_02220620: @ 0x02220620
	ldr r1, _0222063C @ =0x02226050
	mov r2, #0
	str r2, [r1, #0x14]
	str r0, [r1]
	ldr ip, _02220640 @ =FUN_02221AC4
	ldr r0, _02220644 @ =FUN_022205DC
	bx ip
	.align 2, 0
_0222063C: .4byte 0x02226050
_02220640: .4byte FUN_02221AC4
_02220644: .4byte FUN_022205DC
	arm_func_end FUN_02220620

	arm_func_start FUN_02220648
FUN_02220648: @ 0x02220648
	push {r4, lr}
	bl FUN_02221788
	cmp r0, #0
	bne _02220674
	bl FUN_02221734
	ldr r0, _02220680 @ =0x02226074
	ldr r4, [r0]
	bl FUN_02221748
	mov r0, r4
	bl FUN_02222C9C
	pop {r4, pc}
_02220674:
	bl FUN_022217D0
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_02220680: .4byte 0x02226074
	arm_func_end FUN_02220648

	arm_func_start FUN_02220684
FUN_02220684: @ 0x02220684
	push {r4, lr}
	sub sp, sp, #0x10
	ldr ip, _02220774 @ =0x02224EBC
	add r3, sp, #0
	mov r4, r0
	mov r2, #6
_0222069C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _0222069C
	ldrb r1, [ip]
	ldr r0, _02220778 @ =0x022260FC
	strb r1, [r3]
	bl FUN_021EC9E0
	cmp r0, #0
	beq _02220768
	ldr r0, _0222077C @ =0x022260FC
	ldr r1, [r0]
	cmp r1, #0
	blt _022206F4
	cmp r1, #0xa
	addlt r0, r1, #0x30
	strblt r0, [sp, #1]
	blt _0222070C
_022206F4:
	cmp r1, #0xa
	blt _0222070C
	cmp r1, #0x64
	bge _0222070C
	add r0, sp, #0
	bl FUN_022218C0
_0222070C:
	ldr r0, _0222077C @ =0x022260FC
	ldr r0, [r0]
	cmp r0, #4
	cmpne r0, #8
	bne _0222074C
	ldr r0, _0222077C @ =0x022260FC
	ldr r0, [r0, #4]
	cmp r0, #0
	blt _0222073C
	cmp r0, #0xa
	addlt r0, r0, #0x30
	strblt r0, [sp, #3]
_0222073C:
	ldr r1, _02220780 @ =0x02226104
	add r0, sp, #4
	mov r2, #9
	bl FUN_0222189C
_0222074C:
	add r1, sp, #0
	mov r0, r4
	mov r2, #0xd
	bl FUN_022201C8
	add sp, sp, #0x10
	mov r0, #1
	pop {r4, pc}
_02220768:
	mov r0, #0
	add sp, sp, #0x10
	pop {r4, pc}
	.align 2, 0
_02220774: .4byte 0x02224EBC
_02220778: .4byte 0x022260FC
_0222077C: .4byte 0x022260FC
_02220780: .4byte 0x02226104
	arm_func_end FUN_02220684

	arm_func_start FUN_02220784
FUN_02220784: @ 0x02220784
	push {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r4, r1
	add r0, sp, #0x10
	mov r1, #0x14
	bl FUN_02221888
	add r0, sp, #0x10
	bl FUN_0209E430
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	mov r0, #0
	cmp r2, r0
	cmpeq r1, r0
	addeq sp, sp, #0x24
	popeq {r4, r5, pc}
	add r0, sp, #0
	mov r3, #0xd
	bl FUN_022218CC
	cmp r0, #0
	addlt sp, sp, #0x24
	movlt r0, #0
	poplt {r4, r5, pc}
	add r1, sp, #0
	mov r0, r4
	mov r2, #0xd
	bl FUN_022201C8
	ldr r1, _0222080C @ =0x027FFE0C
	mov r0, r5
	mov r2, #4
	bl FUN_022201C8
	mov r0, #1
	add sp, sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_0222080C: .4byte 0x027FFE0C
	arm_func_end FUN_02220784

	arm_func_start FUN_02220810
FUN_02220810: @ 0x02220810
	push {r3, lr}
	ldr r2, _0222082C @ =0x02225E08
	mov r3, #2
	mov r1, #0x21
	str r3, [sp]
	bl FUN_020D168C
	pop {r3, pc}
	.align 2, 0
_0222082C: .4byte 0x02225E08
	arm_func_end FUN_02220810

	arm_func_start FUN_02220830
FUN_02220830: @ 0x02220830
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sb, r2
	mov sl, r1
	ldr r1, [sb, #8]
	cmp r0, #0
	str r1, [sp, #8]
	ldr r1, [sb, #0xc]
	ldr r5, [sb, #4]
	str r1, [sp, #4]
	mvn r1, #0
	str r1, [sp]
	beq _02220878
	cmp r0, #6
	beq _02220A54
	cmp r0, #8
	beq _02220A4C
	b _02220A5C
_02220878:
	ldr r1, _02220B48 @ =0x02225E24
	add r2, sp, #0x14
	mov r0, sl
	bl FUN_02222F88
	cmp r0, #3
	movne r4, #3
	bne _02220A60
	ldr r0, [sp, #0x14]
	mov r1, #3
	bl FUN_022218B4
	ldr r1, _02220B4C @ =0x0000012E
	cmp r0, r1
	bne _022209C4
	add r1, sp, #0x10
	mov r0, sl
	mov r8, #0
	bl FUN_0222308C
	movs r6, r0
	movmi r4, #3
	bmi _02220A60
	cmp r6, #0
	mov r7, r8
	ble _022209B0
	ldr r4, _02220B50 @ =0x02225E34
	mov fp, #8
_022208DC:
	ldr r3, [sp, #0x10]
	mov r1, r7
	add r2, r3, r7
	b _022208F4
_022208EC:
	add r2, r2, #1
	add r7, r7, #1
_022208F4:
	ldrsb r0, [r2]
	cmp r0, #0x3d
	beq _02220908
	cmp r7, r6
	blt _022208EC
_02220908:
	sub r0, r7, r1
	cmp r0, #8
	add r7, r7, #1
	bne _02220934
	add r0, r3, r1
	mov r1, r4
	mov r2, fp
	bl FUN_0222187C
	cmp r0, #0
	moveq r8, #1
	movne r8, #0
_02220934:
	ldr r1, [sp, #0x10]
	mov r3, r7
	add r2, r1, r7
	b _0222094C
_02220944:
	add r2, r2, #1
	add r7, r7, #1
_0222094C:
	ldrsb r0, [r2]
	cmp r0, #0x26
	cmpne r0, #0xd
	cmpne r0, #0
	beq _02220968
	cmp r7, r6
	blt _02220944
_02220968:
	cmp r8, #0
	sub r2, r7, r3
	add r7, r7, #1
	beq _022209A8
	cmp r2, #4
	bne _022209B0
	add r0, sp, #0xc
	add r1, r1, r3
	bl FUN_022202C0
	mov r1, r0
	add r0, sp, #0xc
	mov r2, #0
	strb r2, [r0, r1]
	bl FUN_022218B4
	str r0, [sp]
	b _022209B0
_022209A8:
	cmp r7, r6
	blt _022208DC
_022209B0:
	ldr r0, [sp]
	cmp r0, #0
	movlt r4, #3
	movge r4, #5
	b _02220A60
_022209C4:
	cmp r0, #0
	ble _022209D4
	cmp r0, #0xc8
	beq _022209DC
_022209D4:
	mov r4, #3
	b _02220A60
_022209DC:
	cmp r5, #1
	beq _022209F8
	cmp r5, #2
	beq _02220A14
	cmp r5, #3
	beq _02220A30
	b _02220A60
_022209F8:
	mov r0, sl
	mov r1, sb
	bl FUN_02221414
	cmp r0, #0
	movne r4, #0
	moveq r4, #3
	b _02220A60
_02220A14:
	mov r0, sl
	mov r1, sb
	bl FUN_02221494
	cmp r0, #0
	movne r4, #0
	moveq r4, #3
	b _02220A60
_02220A30:
	mov r0, sl
	mov r1, sb
	bl FUN_02221468
	cmp r0, #0
	movne r4, #0
	moveq r4, #3
	b _02220A60
_02220A4C:
	mov r4, #6
	b _02220A60
_02220A54:
	mov r4, #4
	b _02220A60
_02220A5C:
	mov r4, #3
_02220A60:
	cmp r5, #1
	beq _02220AD0
	cmp r5, #2
	beq _02220A7C
	cmp r5, #3
	beq _02220AC0
	b _02220AD0
_02220A7C:
	ldr r0, [sb, #0x20]
	cmp r0, #0
	beq _02220A94
	ldr r1, _02220B54 @ =0x02226070
	ldr r1, [r1]
	blx r1
_02220A94:
	ldr r0, [sb, #0x1c]
	cmp r0, #0
	beq _02220AAC
	ldr r1, _02220B54 @ =0x02226070
	ldr r1, [r1]
	blx r1
_02220AAC:
	ldr r1, _02220B54 @ =0x02226070
	ldr r0, [sb, #0x18]
	ldr r1, [r1]
	blx r1
	b _02220AD0
_02220AC0:
	ldr r1, _02220B54 @ =0x02226070
	ldr r0, [sb, #0x10]
	ldr r1, [r1]
	blx r1
_02220AD0:
	bl FUN_02221734
	ldr r0, _02220B58 @ =0x02226074
	mvn r1, #0
	str r1, [r0]
	bl FUN_02221748
	mov r0, sl
	bl FUN_02222E04
	ldr r1, _02220B54 @ =0x02226070
	mov r0, sb
	ldr r1, [r1]
	blx r1
	bl FUN_022217D0
	cmp r4, #0
	ldrne r0, _02220B5C @ =0x0222606C
	strne r4, [r0]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02220B2C
	ldr r2, [sp]
	ldr r3, [sp, #8]
	mov r0, r5
	mov r1, r4
	blx r3
_02220B2C:
	ldr r0, [sp, #4]
	cmp r0, #0
	addeq sp, sp, #0x18
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl FUN_022217FC
	add sp, sp, #0x18
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02220B48: .4byte 0x02225E24
_02220B4C: .4byte 0x0000012E
_02220B50: .4byte 0x02225E34
_02220B54: .4byte 0x02226070
_02220B58: .4byte 0x02226074
_02220B5C: .4byte 0x0222606C
	arm_func_end FUN_02220830

	arm_func_start FUN_02220B60
FUN_02220B60: @ 0x02220B60
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	bl FUN_02222B1C
	bl FUN_022217D0
	ldr r1, _02220B88 @ =0x02226070
	mov r0, r4
	ldr r1, [r1]
	blx r1
	pop {r4, pc}
	.align 2, 0
_02220B88: .4byte 0x02226070
	arm_func_end FUN_02220B60

	arm_func_start FUN_02220B8C
FUN_02220B8C: @ 0x02220B8C
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	ldr r0, _02220E44 @ =0x02226138
	ldr r1, _02220E48 @ =0x02226144
	mov r6, r2
	mov r5, r3
	bl FUN_02220784
	cmp r0, #0
	bne _02220BD0
	ldr r0, _02220E4C @ =0x0222606C
	mov r1, #8
	str r1, [r0]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_02220BD0:
	ldr r1, _02220E50 @ =0x0222605C
	mov r0, #0x24
	ldr r2, [r1]
	mov r1, #4
	blx r2
	movs r4, r0
	bne _02220C04
	ldr r0, _02220E4C @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_02220C04:
	ldr r0, _02220E54 @ =0x02226068
	mov r1, #0
	ldr r0, [r0]
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	bl FUN_02221788
	cmp r0, #0
	bne _02220C4C
	ldr r1, _02220E58 @ =0x02226070
	mov r0, r4
	ldr r1, [r1]
	blx r1
	ldr r0, _02220E4C @ =0x0222606C
	mov r1, #2
	str r1, [r0]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_02220C4C:
	ldr r1, _02220E5C @ =FUN_02220830
	ldr r0, _02220E60 @ =0x02226060
	stm sp, {r1, r4}
	ldr r0, [r0]
	ldr r3, [sp, #0x20]
	mov r2, r5
	mov r1, #1
	bl FUN_022225B8
	movs r5, r0
	bne _02220CA0
	bl FUN_022217D0
	ldr r1, _02220E58 @ =0x02226070
	mov r0, r4
	ldr r1, [r1]
	blx r1
	ldr r0, _02220E4C @ =0x0222606C
	mov r1, #3
	str r1, [r0]
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, pc}
_02220CA0:
	ldr r1, _02220E64 @ =0x02225E20
	str r4, [r8]
	mov r2, #1
	str r5, [r7]
	bl FUN_02221E10
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E68 @ =0x02225E40
	ldr r2, _02220E6C @ =0x022260D8
	mov r0, r5
	bl FUN_02221D78
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E70 @ =0x02225E4C
	ldr r2, _02220E74 @ =0x02226084
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E78 @ =0x02225E54
	ldr r2, _02220E44 @ =0x02226138
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E7C @ =0x02225E60
	ldr r2, _02220E80 @ =0x022260BC
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r0, _02220E84 @ =0x02226058
	ldr r1, _02220E88 @ =0x02225E68
	ldr r2, [r0]
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E8C @ =0x02225E70
	ldr r2, _02220E48 @ =0x02226144
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E90 @ =0x02225E78
	ldr r2, _02220E94 @ =0x02226090
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r1, _02220E98 @ =0x02225E80
	mov r0, r5
	mov r2, r6
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
	ldr r0, _02220E9C @ =0x02226078
	ldr r2, [r0]
	cmp r2, #0
	beq _02220DA4
	ldr r1, _02220EA0 @ =0x02225E88
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
_02220DA4:
	ldr r0, _02220E9C @ =0x02226078
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _02220DC8
	ldr r1, _02220EA4 @ =0x02225E90
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
_02220DC8:
	ldr r0, _02220E9C @ =0x02226078
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02220DEC
	ldr r1, _02220EA8 @ =0x02225E98
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
_02220DEC:
	ldr r0, _02220EAC @ =0x02226054
	ldr r0, [r0]
	cmp r0, #0
	beq _02220E14
	ldr r1, _02220EB0 @ =0x02225EA0
	ldr r2, _02220EB4 @ =0x022260A4
	mov r0, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _02220E20
_02220E14:
	add sp, sp, #8
	mov r0, #1
	pop {r4, r5, r6, r7, r8, pc}
_02220E20:
	mov r0, r4
	mov r1, r5
	bl FUN_02220B60
	ldr r0, _02220E4C @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02220E44: .4byte 0x02226138
_02220E48: .4byte 0x02226144
_02220E4C: .4byte 0x0222606C
_02220E50: .4byte 0x0222605C
_02220E54: .4byte 0x02226068
_02220E58: .4byte 0x02226070
_02220E5C: .4byte FUN_02220830
_02220E60: .4byte 0x02226060
_02220E64: .4byte 0x02225E20
_02220E68: .4byte 0x02225E40
_02220E6C: .4byte 0x022260D8
_02220E70: .4byte 0x02225E4C
_02220E74: .4byte 0x02226084
_02220E78: .4byte 0x02225E54
_02220E7C: .4byte 0x02225E60
_02220E80: .4byte 0x022260BC
_02220E84: .4byte 0x02226058
_02220E88: .4byte 0x02225E68
_02220E8C: .4byte 0x02225E70
_02220E90: .4byte 0x02225E78
_02220E94: .4byte 0x02226090
_02220E98: .4byte 0x02225E80
_02220E9C: .4byte 0x02226078
_02220EA0: .4byte 0x02225E88
_02220EA4: .4byte 0x02225E90
_02220EA8: .4byte 0x02225E98
_02220EAC: .4byte 0x02226054
_02220EB0: .4byte 0x02225EA0
_02220EB4: .4byte 0x022260A4
	arm_func_end FUN_02220B8C

	arm_func_start FUN_02220EB8
FUN_02220EB8: @ 0x02220EB8
	push {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl FUN_02221734
	mov r0, r4
	bl FUN_02222C10
	ldr r1, _02220F10 @ =0x02226074
	str r0, [r5]
	str r0, [r1]
	bl FUN_02221748
	ldr r0, [r5]
	cmp r0, #0
	movge r0, #1
	popge {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl FUN_02220B60
	ldr r0, _02220F14 @ =0x0222606C
	mov r1, #3
	str r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02220F10: .4byte 0x02226074
_02220F14: .4byte 0x0222606C
	arm_func_end FUN_02220EB8

	arm_func_start FUN_02220F18
FUN_02220F18: @ 0x02220F18
	push {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r2, _02220F84 @ =0x02224ED8
	mov r4, r0
	mov ip, #0x80
	ldr r3, _02220F88 @ =0x0222615C
	add r0, sp, #8
	add r1, sp, #4
	str ip, [sp]
	bl FUN_02220B8C
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	popeq {r3, r4, pc}
	ldr r0, [sp, #8]
	mov r1, #1
	str r1, [r0, #4]
	ldr r0, [sp, #8]
	str r4, [r0, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl FUN_02220EB8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02220F84: .4byte 0x02224ED8
_02220F88: .4byte 0x0222615C
	arm_func_end FUN_02220F18

	arm_func_start FUN_02220F8C
FUN_02220F8C: @ 0x02220F8C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	mov r4, r2
	mov r6, r1
	ldr r1, _02221234 @ =0x0222605C
	lsl r7, r4, #8
	cmp r7, #0x80
	ldr r2, [r1]
	movlt r7, #0x80
	mov r5, r0
	mov r0, r7
	mov r1, #4
	blx r2
	movs r8, r0
	bne _02220FE0
	ldr r0, _02221238 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02220FE0:
	add r0, sp, #0xc
	mov r1, r6
	bl FUN_022218C0
	mov r6, r0
	bl FUN_022201AC
	ldr r1, _02221234 @ =0x0222605C
	add r0, r0, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	movs sb, r0
	bne _02221038
	ldr r1, _0222123C @ =0x02226070
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r0, _02221238 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02221038:
	add r1, sp, #0xc
	mov r2, r6
	bl FUN_022201C8
	mov r1, #0
	strb r1, [sb, r0]
	add r0, sp, #0xc
	mov r1, r4
	bl FUN_022218C0
	mov r6, r0
	bl FUN_022201AC
	ldr r1, _02221234 @ =0x0222605C
	add r0, r0, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	movs sl, r0
	bne _022210B4
	ldr r1, _0222123C @ =0x02226070
	mov r0, sb
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r0, _02221238 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_022210B4:
	add r1, sp, #0xc
	mov r2, r6
	bl FUN_022201C8
	mov r1, #0
	strb r1, [sl, r0]
	ldr r2, _02221240 @ =0x02224ECC
	add r0, sp, #8
	add r1, sp, #4
	mov r3, r8
	str r7, [sp]
	bl FUN_02220B8C
	cmp r0, #0
	bne _02221124
	ldr r1, _0222123C @ =0x02226070
	mov r0, sl
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, sb
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, r8
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02221124:
	ldr r0, [sp, #4]
	ldr r1, _02221244 @ =0x02225EA8
	mov r2, sb
	bl FUN_02221D9C
	cmp r0, #0
	beq _022211E0
	ldr r0, [sp, #4]
	ldr r1, _02221248 @ =0x02225EB0
	mov r2, sl
	bl FUN_02221D9C
	cmp r0, #0
	beq _022211E0
	ldr r0, [sp, #8]
	mov r1, #2
	str r1, [r0, #4]
	ldr r0, [sp, #8]
	str r5, [r0, #0x10]
	ldr r0, [sp, #8]
	str sb, [r0, #0x1c]
	ldr r0, [sp, #8]
	str sl, [r0, #0x20]
	ldr r0, [sp, #8]
	str r4, [r0, #0x14]
	ldr r0, [sp, #8]
	str r8, [r0, #0x18]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl FUN_02220EB8
	cmp r0, #0
	addne sp, sp, #0x18
	movne r0, #1
	popne {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0222123C @ =0x02226070
	mov r0, sl
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, sb
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, r8
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_022211E0:
	ldr r1, _0222123C @ =0x02226070
	mov r0, sl
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, sb
	ldr r1, [r1]
	blx r1
	ldr r1, _0222123C @ =0x02226070
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl FUN_02220B60
	ldr r0, _02221238 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	add sp, sp, #0x18
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02221234: .4byte 0x0222605C
_02221238: .4byte 0x0222606C
_0222123C: .4byte 0x02226070
_02221240: .4byte 0x02224ECC
_02221244: .4byte 0x02225EA8
_02221248: .4byte 0x02225EB0
	arm_func_end FUN_02220F8C

	arm_func_start FUN_0222124C
FUN_0222124C: @ 0x0222124C
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r0
	ldr r3, [r8, #0xac]
	mov r7, r1
	cmp r2, r3
	bhs _02221280
	ldr r0, _022213F4 @ =0x0222606C
	mov r1, #7
	str r1, [r0]
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_02221280:
	bl FUN_02221870
	mov r4, r0
	cmp r4, #0x20
	ble _022212A8
	ldr r0, _022213F4 @ =0x0222606C
	mov r1, #7
	str r1, [r0]
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_022212A8:
	cmp r4, #0
	movle r6, #0
	ble _022212BC
	bl FUN_022201AC
	mov r6, r0
_022212BC:
	ldr r1, _022213F8 @ =0x0222605C
	add r0, r6, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	movs r5, r0
	bne _022212F0
	ldr r0, _022213F4 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_022212F0:
	ldr ip, [r8, #0xac]
	ldr r2, _022213FC @ =0x02224EE4
	add r0, sp, #8
	add r1, sp, #4
	mov r3, r7
	str ip, [sp]
	bl FUN_02220B8C
	cmp r0, #0
	bne _02221330
	ldr r1, _02221400 @ =0x02226070
	mov r0, r5
	ldr r1, [r1]
	blx r1
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_02221330:
	cmp r6, #0
	ble _02221368
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl FUN_022201C8
	mov r1, #0
	strb r1, [r5, r0]
	ldr r0, [sp, #4]
	ldr r1, _02221404 @ =0x02225EB4
	mov r2, r5
	bl FUN_02221D9C
	cmp r0, #0
	beq _022213C0
_02221368:
	ldr r0, [sp, #8]
	mov r1, #3
	str r1, [r0, #4]
	ldr r0, [sp, #8]
	str r5, [r0, #0x10]
	ldr r1, [r8, #0xac]
	ldr r0, [sp, #8]
	str r1, [r0, #0x14]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl FUN_02220EB8
	cmp r0, #0
	addne sp, sp, #0xc
	movne r0, #1
	popne {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, _02221400 @ =0x02226070
	mov r0, r5
	ldr r1, [r1]
	blx r1
	add sp, sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, pc}
_022213C0:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl FUN_02220B60
	ldr r1, _02221400 @ =0x02226070
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldr r0, _022213F4 @ =0x0222606C
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	add sp, sp, #0xc
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022213F4: .4byte 0x0222606C
_022213F8: .4byte 0x0222605C
_022213FC: .4byte 0x02224EE4
_02221400: .4byte 0x02226070
_02221404: .4byte 0x02225EB4
	arm_func_end FUN_0222124C

	arm_func_start FUN_02221408
FUN_02221408: @ 0x02221408
	ldr ip, _02221410 @ =FUN_02223384
	bx ip
	.align 2, 0
_02221410: .4byte FUN_02223384
	arm_func_end FUN_02221408

	arm_func_start FUN_02221414
FUN_02221414: @ 0x02221414
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r1
	add r1, sp, #0
	bl FUN_0222308C
	movs r1, r0
	bmi _0222145C
	ldr r0, [sp]
	bl FUN_022218B4
	ldr r1, [r4, #0x10]
	add sp, sp, #4
	str r0, [r1]
	ldr r0, [r4, #0x10]
	ldr r0, [r0]
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	pop {r3, r4, pc}
_0222145C:
	mov r0, #0
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end FUN_02221414

	arm_func_start FUN_02221468
FUN_02221468: @ 0x02221468
	push {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r1
	add r1, sp, #0
	bl FUN_0222308C
	ldr r1, [r4, #0x14]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	add sp, sp, #4
	pop {r3, r4, pc}
	arm_func_end FUN_02221468

	arm_func_start FUN_02221494
FUN_02221494: @ 0x02221494
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r2, [r1, #0x14]
	str r1, [sp]
	mov r1, #0xb0
	mul r1, r2, r1
	mov r4, r0
	ldr r0, [sp]
	mov r2, #0
	ldr r0, [r0, #0x10]
	str r2, [sp, #4]
	bl FUN_02221888
	ldr r1, _02221714 @ =0x02225EC0
	add r2, sp, #0x10
	mov r0, r4
	bl FUN_02222F88
	cmp r0, #0
	ble _022214FC
	ldr r1, [sp, #0x10]
	ldrsb r0, [r1]
	cmp r0, #0x30
	ldrsbeq r0, [r1, #1]
	cmpeq r0, #0
	addeq sp, sp, #0x18
	moveq r0, #1
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022214FC:
	add r1, sp, #0x14
	mov r0, r4
	bl FUN_0222308C
	mov r4, r0
	cmp r4, #0
	ble _02221708
	ldr r0, [sp]
	mov r5, #0
	ldr r0, [r0, #0x14]
	str r5, [sp, #0xc]
	cmp r0, #0
	ble _02221708
	str r5, [sp, #8]
_02221530:
	cmp r5, r4
	movge r0, #1
	strge r0, [sp, #4]
	bge _02221708
	ldr r0, [sp]
	mov r6, #0
	ldr r1, [r0, #0x10]
	ldr r0, [sp, #8]
	mov r7, r5
	mov r2, r6
	str r6, [sp, #4]
	cmp r5, r4
	add r8, r1, r0
	bge _022216E0
	mov sl, r6
	mov fp, #1
_02221570:
	ldr r3, [sp, #0x14]
	ldrsb r0, [r3, r5]
	cmp r0, #0xd
	moveq r2, fp
	beq _022216D4
	cmp r2, #0
	beq _022215DC
	cmp r0, #0xa
	bne _022216D0
	cmp r6, #5
	bne _022215C0
	sub r0, r5, #1
	sub r1, r0, r7
	cmp r1, #8
	bgt _02221708
	add r0, r3, r7
	bl FUN_022218B4
	cmp r0, #0
	blt _02221708
	str r0, [r8, #0xac]
_022215C0:
	cmp r6, #5
	movge r0, #1
	strge r0, [sp, #4]
	movlt r0, #0
	add r5, r5, #1
	strlt r0, [sp, #4]
	b _022216E0
_022215DC:
	cmp r0, #9
	bne _022216D0
	cmp r6, #5
	addls pc, pc, r6, lsl #2
	b _022216C8
_022215F0: @ jump table
	b _02221608 @ case 0
	b _02221624 @ case 1
	b _02221654 @ case 2
	b _02221670 @ case 3
	b _0222168C @ case 4
	b _022216A8 @ case 5
_02221608:
	sub r2, r5, r7
	cmp r2, #0x20
	bhi _02221708
	add r1, r3, r7
	mov r0, r8
	bl FUN_0222189C
	b _022216C8
_02221624:
	sub sb, r5, r7
	mov r0, sb
	bl FUN_022201A0
	cmp r0, #0x66
	bhi _02221708
	ldr r0, [sp, #0x14]
	mov r2, sb
	add r1, r0, r7
	add r0, r8, #0x22
	bl FUN_022202C0
	strh sl, [r8, #0x86]
	b _022216C8
_02221654:
	sub r2, r5, r7
	cmp r2, #0xa
	bhi _02221708
	add r1, r3, r7
	add r0, r8, #0x88
	bl FUN_0222189C
	b _022216C8
_02221670:
	sub r2, r5, r7
	cmp r2, #0xa
	bhi _02221708
	add r1, r3, r7
	add r0, r8, #0x93
	bl FUN_0222189C
	b _022216C8
_0222168C:
	sub r2, r5, r7
	cmp r2, #0xa
	bhi _02221708
	add r1, r3, r7
	add r0, r8, #0x9e
	bl FUN_0222189C
	b _022216C8
_022216A8:
	sub r1, r5, r7
	cmp r1, #8
	bgt _02221708
	add r0, r3, r7
	bl FUN_022218B4
	cmp r0, #0
	blt _02221708
	str r0, [r8, #0xac]
_022216C8:
	add r6, r6, #1
	add r7, r5, #1
_022216D0:
	mov r2, #0
_022216D4:
	add r5, r5, #1
	cmp r5, r4
	blt _02221570
_022216E0:
	ldr r0, [sp]
	ldr r1, [r0, #0x14]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, r1
	ldr r0, [sp, #8]
	add r0, r0, #0xb0
	str r0, [sp, #8]
	blt _02221530
_02221708:
	ldr r0, [sp, #4]
	add sp, sp, #0x18
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02221714: .4byte 0x02225EC0
	arm_func_end FUN_02221494

	arm_func_start FUN_02221718
FUN_02221718: @ 0x02221718
	push {r3, lr}
	ldr r0, _0222172C @ =0x022261F8
	bl FUN_020D2600
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0222172C: .4byte 0x022261F8
	arm_func_end FUN_02221718

	arm_func_start FUN_02221730
FUN_02221730: @ 0x02221730
	bx lr
	arm_func_end FUN_02221730

	arm_func_start FUN_02221734
FUN_02221734: @ 0x02221734
	ldr ip, _02221740 @ =FUN_020D2618
	ldr r0, _02221744 @ =0x022261F8
	bx ip
	.align 2, 0
_02221740: .4byte FUN_020D2618
_02221744: .4byte 0x022261F8
	arm_func_end FUN_02221734

	arm_func_start FUN_02221748
FUN_02221748: @ 0x02221748
	ldr ip, _02221754 @ =FUN_020D269C
	ldr r0, _02221758 @ =0x022261F8
	bx ip
	.align 2, 0
_02221754: .4byte FUN_020D269C
_02221758: .4byte 0x022261F8
	arm_func_end FUN_02221748

	arm_func_start FUN_0222175C
FUN_0222175C: @ 0x0222175C
	push {r3, lr}
	ldr r0, _0222177C @ =0x022261E0
	bl FUN_020D2600
	ldr r0, _02221780 @ =0x022261DC
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_0222177C: .4byte 0x022261E0
_02221780: .4byte 0x022261DC
	arm_func_end FUN_0222175C

	arm_func_start FUN_02221784
FUN_02221784: @ 0x02221784
	bx lr
	arm_func_end FUN_02221784

	arm_func_start FUN_02221788
FUN_02221788: @ 0x02221788
	push {r4, lr}
	ldr r0, _022217C8 @ =0x022261E0
	bl FUN_020D2618
	ldr r0, _022217CC @ =0x022261DC
	ldr r0, [r0]
	cmp r0, #0
	moveq r4, #1
	movne r4, #0
	cmp r4, #0
	ldrne r0, _022217CC @ =0x022261DC
	movne r1, #1
	strne r1, [r0]
	ldr r0, _022217C8 @ =0x022261E0
	bl FUN_020D269C
	mov r0, r4
	pop {r4, pc}
	.align 2, 0
_022217C8: .4byte 0x022261E0
_022217CC: .4byte 0x022261DC
	arm_func_end FUN_02221788

	arm_func_start FUN_022217D0
FUN_022217D0: @ 0x022217D0
	push {r3, lr}
	ldr r0, _022217F4 @ =0x022261E0
	bl FUN_020D2618
	ldr r1, _022217F8 @ =0x022261DC
	mov r2, #0
	ldr r0, _022217F4 @ =0x022261E0
	str r2, [r1]
	bl FUN_020D269C
	pop {r3, pc}
	.align 2, 0
_022217F4: .4byte 0x022261E0
_022217F8: .4byte 0x022261DC
	arm_func_end FUN_022217D0

	arm_func_start FUN_022217FC
FUN_022217FC: @ 0x022217FC
	ldr ip, _0222180C @ =0x020D23B0
	mov r1, #0
	mov r2, r1
	bx ip
	.align 2, 0
_0222180C: .4byte 0x020D23B0
	arm_func_end FUN_022217FC

	arm_func_start FUN_02221810
FUN_02221810: @ 0x02221810
	push {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov sb, r0
	add r0, sp, #0
	bl FUN_020D3C40
	mov r6, #0
	add r7, sp, #0
	mov r8, r6
	add r5, sp, #6
	mov r4, #2
_02221838:
	ldrb r1, [r7], #1
	mov r2, r4
	add r0, r5, r8
	bl FUN_022219A4
	add r6, r6, #1
	cmp r6, #6
	add r8, r8, #2
	blt _02221838
	add r1, sp, #6
	mov r0, sb
	mov r2, #0xc
	bl FUN_022201C8
	add sp, sp, #0x14
	pop {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FUN_02221810

	arm_func_start FUN_02221870
FUN_02221870: @ 0x02221870
	ldr ip, _02221878 @ =FUN_020E3DD4
	bx ip
	.align 2, 0
_02221878: .4byte FUN_020E3DD4
	arm_func_end FUN_02221870

	arm_func_start FUN_0222187C
FUN_0222187C: @ 0x0222187C
	ldr ip, _02221884 @ =FUN_020E3E28
	bx ip
	.align 2, 0
_02221884: .4byte FUN_020E3E28
	arm_func_end FUN_0222187C

	arm_func_start FUN_02221888
FUN_02221888: @ 0x02221888
	ldr ip, _02221898 @ =0x020D4994
	mov r2, r1
	mov r1, #0
	bx ip
	.align 2, 0
_02221898: .4byte 0x020D4994
	arm_func_end FUN_02221888

	arm_func_start FUN_0222189C
FUN_0222189C: @ 0x0222189C
	ldr ip, _022218B0 @ =0x020D4A50
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_022218B0: .4byte 0x020D4A50
	arm_func_end FUN_0222189C

	arm_func_start FUN_022218B4
FUN_022218B4: @ 0x022218B4
	ldr ip, _022218BC @ =FUN_02224B80
	bx ip
	.align 2, 0
_022218BC: .4byte FUN_02224B80
	arm_func_end FUN_022218B4

	arm_func_start FUN_022218C0
FUN_022218C0: @ 0x022218C0
	ldr ip, _022218C8 @ =FUN_02224C18
	bx ip
	.align 2, 0
_022218C8: .4byte FUN_02224C18
	arm_func_end FUN_022218C0

	arm_func_start FUN_022218CC
FUN_022218CC: @ 0x022218CC
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r2
	ldr r4, _02221998 @ =0x01634578
	ldr r2, _0222199C @ =0x5D8A0000
	mov sb, r1
	cmp r8, r4
	mov sl, r0
	mov fp, r3
	mov r5, #0
	cmpeq sb, r2
	subhs r0, r5, #1
	pophs {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, r5
	mov r0, r5
_02221904:
	ldr r1, _022219A0 @ =0x02224EF4
	add r1, r1, r4, lsl #3
	ldr r6, [r1, #4]
	ldr r1, _022219A0 @ =0x02224EF4
	cmp r8, r6
	ldr r7, [r1, r4, lsl #3]
	cmpeq sb, r7
	blo _0222195C
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r6
	bl FUN_020F2900
	umull r3, r2, r0, r7
	mla r2, r0, r6, r2
	add r0, r0, #0x30
	strb r0, [sl, r5]
	subs sb, sb, r3
	sbc r8, r8, r2
	mov r0, #1
	add r5, r5, #1
	b _0222197C
_0222195C:
	cmp r0, #0
	bne _02221970
	rsb r1, r4, #0x11
	cmp r1, fp
	bgt _0222197C
_02221970:
	mov r1, #0x30
	strb r1, [sl, r5]
	add r5, r5, #1
_0222197C:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02221904
	adds r0, sb, #0x30
	strb r0, [sl, r5]
	add r0, r5, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02221998: .4byte 0x01634578
_0222199C: .4byte 0x5D8A0000
_022219A0: .4byte 0x02224EF4
	arm_func_end FUN_022218CC

	arm_func_start FUN_022219A4
FUN_022219A4: @ 0x022219A4
	push {r3, lr}
	mov lr, #0
	cmp r2, #8
	subgt r0, lr, #1
	popgt {r3, pc}
	cmp r2, #1
	mov ip, #1
	blt _022219F4
_022219C4:
	sub r3, r2, ip
	lsl r3, r3, #2
	lsr r3, r1, r3
	and r3, r3, #0xf
	cmp r3, #0xa
	addlo r3, r3, #0x30
	addhs r3, r3, #0x57
	add ip, ip, #1
	strb r3, [r0, lr]
	add lr, lr, #1
	cmp ip, r2
	ble _022219C4
_022219F4:
	mov r0, lr
	pop {r3, pc}
	arm_func_end FUN_022219A4

	arm_func_start FUN_022219FC
FUN_022219FC: @ 0x022219FC
	push {r4, lr}
	ldr r3, _02221AC0 @ =0x02226210
	mov ip, #0
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	str ip, [r3, #4]
	str ip, [r3, #0x1c]
	str ip, [r3, #0x20]
	str ip, [r3, #0x10]
	mov r4, r2
	str ip, [r3, #0x14]
	bl FUN_0222201C
	cmp r0, #0
	bne _02221A48
	ldr r0, _02221AC0 @ =0x02226210
	mov r1, #9
	str r1, [r0, #4]
	mov r0, #0
	pop {r4, pc}
_02221A48:
	ldr r1, _02221AC0 @ =0x02226210
	mov r0, #0x2000
	ldr r2, [r1, #8]
	mov r1, #8
	blx r2
	movs r1, r0
	ldr r0, _02221AC0 @ =0x02226210
	str r1, [r0, #0x18]
	bne _02221A80
	mov r1, #1
	str r1, [r0, #4]
	bl FUN_02222034
	mov r0, #0
	pop {r4, pc}
_02221A80:
	mov r0, r4
	bl FUN_02222060
	cmp r0, #0
	ldrne r1, _02221AC0 @ =0x02226210
	movne r0, #1
	strne r0, [r1]
	popne {r4, pc}
	ldr r1, _02221AC0 @ =0x02226210
	mov r0, #9
	str r0, [r1, #4]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0xc]
	blx r1
	bl FUN_02222034
	mov r0, #0
	pop {r4, pc}
	.align 2, 0
_02221AC0: .4byte 0x02226210
	arm_func_end FUN_022219FC

	arm_func_start FUN_02221AC4
FUN_02221AC4: @ 0x02221AC4
	push {r3, lr}
	sub sp, sp, #8
	mov r2, r0
	mov ip, #0x800
	ldr r0, _02221B00 @ =0x02226234
	ldr r1, _02221B04 @ =FUN_02221B0C
	ldr r3, _02221B08 @ =0x02226AF4
	str ip, [sp]
	mov ip, #0x10
	str ip, [sp, #4]
	bl FUN_020D1AD4
	ldr r0, _02221B00 @ =0x02226234
	bl FUN_020D1F34
	add sp, sp, #8
	pop {r3, pc}
	.align 2, 0
_02221B00: .4byte 0x02226234
_02221B04: .4byte FUN_02221B0C
_02221B08: .4byte 0x02226AF4
	arm_func_end FUN_02221AC4

	arm_func_start FUN_02221B0C
FUN_02221B0C: @ 0x02221B0C
	push {r4, lr}
	mov r4, r0
	bl FUN_02222D18
	bl FUN_022220D8
	ldr r1, _02221B44 @ =0x02226210
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0xc]
	blx r1
	bl FUN_02222034
	ldr r0, _02221B44 @ =0x02226210
	mov r1, #0
	str r1, [r0]
	blx r4
	pop {r4, pc}
	.align 2, 0
_02221B44: .4byte 0x02226210
	arm_func_end FUN_02221B0C

	arm_func_start FUN_02221B48
FUN_02221B48: @ 0x02221B48
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r0
	ldr sl, [sb]
	mov r8, r1
	mov r7, r2
	mov r6, r3
	cmp sl, #0
	mov r4, #0
	beq _02221BC4
	ldr r1, [sl, #8]
	mov r0, r8
	mov r5, sl
	bl FUN_02224CD4
	cmp r0, #0
	beq _02221BC0
	ldr r5, [sl, #4]
	ldr r0, [sb]
	cmp r5, r0
	beq _02221BC4
_02221B94:
	ldr r1, [r5, #8]
	mov r0, r8
	bl FUN_02224CD4
	cmp r0, #0
	moveq r4, #1
	beq _02221BC4
	ldr r5, [r5, #4]
	ldr r0, [sb]
	cmp r5, r0
	bne _02221B94
	b _02221BC4
_02221BC0:
	mov r4, #1
_02221BC4:
	cmp r4, #0
	strne r7, [r5, #0xc]
	bne _02221C50
	ldr r1, _02221C58 @ =0x02226218
	mov r0, r6
	ldr r2, [r1]
	mov r1, #4
	blx r2
	cmp r0, #0
	bne _02221C00
	ldr r0, _02221C5C @ =0x02226214
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02221C00:
	str r8, [r0, #8]
	str r7, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	ldr r1, [sb]
	cmp r1, #0
	streq r0, [r0, #4]
	streq r0, [r0]
	streq r0, [sb]
	beq _02221C50
	ldr r1, [r1]
	str r1, [r0]
	ldr r1, [sb]
	str r1, [r0, #4]
	ldr r1, [sb]
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r1, [sb]
	str r0, [r1]
_02221C50:
	mov r0, #1
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02221C58: .4byte 0x02226218
_02221C5C: .4byte 0x02226214
	arm_func_end FUN_02221B48

	arm_func_start FUN_02221C60
FUN_02221C60: @ 0x02221C60
	ldr r3, [r0]
	cmp r3, #0
	beq _02221C9C
	ldr r2, [r3]
	cmp r3, r2
	moveq r1, #0
	streq r1, [r0]
	beq _02221C9C
	ldr r1, [r3, #4]
	str r1, [r2, #4]
	ldr r2, [r3]
	ldr r1, [r3, #4]
	str r2, [r1]
	ldr r1, [r3, #4]
	str r1, [r0]
_02221C9C:
	mov r0, r3
	bx lr
	arm_func_end FUN_02221C60

	arm_func_start FUN_02221CA4
FUN_02221CA4: @ 0x02221CA4
	add r0, r0, #1
	and r0, r0, #0xff
	cmp r0, #0x7b
	moveq r0, #0x30
	beq _02221CCC
	cmp r0, #0x5b
	moveq r0, #0x61
	beq _02221CCC
	cmp r0, #0x3a
	moveq r0, #0x41
_02221CCC:
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	bx lr
	arm_func_end FUN_02221CA4

	arm_func_start FUN_02221CD8
FUN_02221CD8: @ 0x02221CD8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r0, sb
	mov r1, r8
	add r2, sl, #0x46
	mov r3, #0x12
	bl FUN_02224DC8
	cmp r0, #0
	movlt r0, #1
	poplt {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r6, _02221D74 @ =0x02224F87
	mov fp, #0x13
	mov r4, #0x12
_02221D14:
	add r7, sl, fp
	ldrsb r5, [r7, #0x44]
_02221D1C:
	and r0, r5, #0xff
	bl FUN_02221CA4
	mov r5, r0
	strb r5, [r7, #0x44]
	ldrsb r0, [r6]
	cmp r5, r0
	beq _02221D5C
	mov r0, sb
	mov r1, r8
	mov r3, r4
	add r2, sl, #0x46
	bl FUN_02224DC8
	cmp r0, #0
	bge _02221D1C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02221D5C:
	sub fp, fp, #1
	cmp fp, #2
	sub r6, r6, #1
	bge _02221D14
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02221D74: .4byte 0x02224F87
	arm_func_end FUN_02221CD8

	arm_func_start FUN_02221D78
FUN_02221D78: @ 0x02221D78
	push {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	movne r0, #0
	popne {r3, pc}
	add r0, r0, #0x34
	mov r3, #0x18
	bl FUN_02221B48
	pop {r3, pc}
	arm_func_end FUN_02221D78

	arm_func_start FUN_02221D9C
FUN_02221D9C: @ 0x02221D9C
	push {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8]
	mov r7, r1
	mov r6, r2
	mov r5, #0
	cmp r0, #0
	movne r0, r5
	popne {r4, r5, r6, r7, r8, pc}
	mov r0, r6
	bl FUN_0222334C
	mov r4, r0
	mov r0, r8
	mov r1, r6
	mov r2, r4
	bl FUN_02221CD8
	cmp r0, #0
	beq _02221E08
	mov r1, r7
	mov r2, r6
	add r0, r8, #0x38
	mov r3, #0x18
	bl FUN_02221B48
	movs r5, r0
	ldrne r0, [r8, #0x38]
	ldrne r0, [r0]
	strne r4, [r0, #0x10]
_02221E08:
	mov r0, r5
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end FUN_02221D9C

	arm_func_start FUN_02221E10
FUN_02221E10: @ 0x02221E10
	ldr r3, [r0]
	cmp r3, #0
	movne r0, #0
	streq r1, [r0, #0x1c]
	streq r2, [r0, #0x18]
	moveq r0, #1
	bx lr
	arm_func_end FUN_02221E10

	arm_func_start FUN_02221E2C
FUN_02221E2C: @ 0x02221E2C
	push {r3, r4, r5, lr}
	ldr r1, _02221ED4 @ =0x02226218
	mov r4, r0
	ldr r2, [r1]
	mov r0, #0x14
	mov r1, #4
	mvn r5, #0
	blx r2
	cmp r0, #0
	beq _02221ECC
	ldr r1, _02221ED8 @ =0x02226230
	ldr r2, [r1]
	cmp r2, #0
	streq r0, [r0]
	streq r0, [r0, #4]
	streq r0, [r1]
	beq _02221E94
	ldr r2, [r2]
	str r2, [r0]
	ldr r2, [r1]
	str r2, [r0, #4]
	ldr r2, [r1]
	ldr r2, [r2]
	str r0, [r2, #4]
	ldr r1, [r1]
	str r0, [r1]
_02221E94:
	ldr r1, _02221EDC @ =0x0222622C
	mvn r2, #0
	ldr ip, [r1]
	ldr r3, [r1]
	add r3, r3, #1
	str r3, [r1]
	str ip, [r0, #8]
	str r4, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r2, [r1]
	ldr r5, [r0, #8]
	cmp r2, #0
	movlt r0, #0
	strlt r0, [r1]
_02221ECC:
	mov r0, r5
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221ED4: .4byte 0x02226218
_02221ED8: .4byte 0x02226230
_02221EDC: .4byte 0x0222622C
	arm_func_end FUN_02221E2C

	arm_func_start FUN_02221EE0
FUN_02221EE0: @ 0x02221EE0
	ldr r1, _02221F34 @ =0x02226230
	mov r2, #0
	ldr r3, [r1]
	cmp r3, #0
	beq _02221F2C
	ldr r1, [r3, #8]
	cmp r1, r0
	moveq r2, r3
	beq _02221F2C
	ldr ip, [r3, #4]
	cmp ip, r3
	beq _02221F2C
_02221F10:
	ldr r1, [ip, #8]
	cmp r1, r0
	moveq r2, ip
	beq _02221F2C
	ldr ip, [ip, #4]
	cmp ip, r3
	bne _02221F10
_02221F2C:
	mov r0, r2
	bx lr
	.align 2, 0
_02221F34: .4byte 0x02226230
	arm_func_end FUN_02221EE0

	arm_func_start FUN_02221F38
FUN_02221F38: @ 0x02221F38
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	bl FUN_02221EE0
	movs r4, r0
	beq _02221FC8
	ldr r0, _02221FD0 @ =0x02226230
	ldr r2, [r0]
	ldr r1, [r2]
	cmp r2, r1
	beq _02221F88
	ldm r4, {r1, r2}
	str r2, [r1, #4]
	ldr r2, [r4]
	ldr r1, [r4, #4]
	str r2, [r1]
	ldr r1, [r0]
	cmp r1, r4
	ldreq r1, [r4, #4]
	streq r1, [r0]
	b _02221F90
_02221F88:
	mov r1, r5
	str r1, [r0]
_02221F90:
	ldr r0, [r4, #0xc]
	ldr r5, [r0, #0x3c]
	ldr r6, [r0, #0x30]
	ldr r7, [r0, #0x2c]
	bl FUN_02222B98
	ldr r1, _02221FD4 @ =0x0222621C
	mov r0, r4
	ldr r1, [r1]
	blx r1
	mov r1, r6
	mov r2, r7
	mov r0, #8
	blx r5
	mov r5, #1
_02221FC8:
	mov r0, r5
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221FD0: .4byte 0x02226230
_02221FD4: .4byte 0x0222621C
	arm_func_end FUN_02221F38

	arm_func_start FUN_02221FD8
FUN_02221FD8: @ 0x02221FD8
	push {r4, lr}
	ldr r4, _02222004 @ =0x02226230
	ldr r0, [r4]
	cmp r0, #0
	popeq {r4, pc}
_02221FEC:
	ldr r0, [r0, #8]
	bl FUN_02221F38
	ldr r0, [r4]
	cmp r0, #0
	bne _02221FEC
	pop {r4, pc}
	.align 2, 0
_02222004: .4byte 0x02226230
	arm_func_end FUN_02221FD8

	arm_func_start FUN_02222008
FUN_02222008: @ 0x02222008
	ldr ip, _02222014 @ =FUN_02221C60
	ldr r0, _02222018 @ =0x02226230
	bx ip
	.align 2, 0
_02222014: .4byte FUN_02221C60
_02222018: .4byte 0x02226230
	arm_func_end FUN_02222008

	arm_func_start FUN_0222201C
FUN_0222201C: @ 0x0222201C
	push {r3, lr}
	ldr r0, _02222030 @ =0x02226AF8
	bl FUN_020D2600
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
_02222030: .4byte 0x02226AF8
	arm_func_end FUN_0222201C

	arm_func_start FUN_02222034
FUN_02222034: @ 0x02222034
	bx lr
	arm_func_end FUN_02222034

	arm_func_start FUN_02222038
FUN_02222038: @ 0x02222038
	ldr ip, _02222044 @ =FUN_020D2618
	ldr r0, _02222048 @ =0x02226AF8
	bx ip
	.align 2, 0
_02222044: .4byte FUN_020D2618
_02222048: .4byte 0x02226AF8
	arm_func_end FUN_02222038

	arm_func_start FUN_0222204C
FUN_0222204C: @ 0x0222204C
	ldr ip, _02222058 @ =FUN_020D269C
	ldr r0, _0222205C @ =0x02226AF8
	bx ip
	.align 2, 0
_02222058: .4byte FUN_020D269C
_0222205C: .4byte 0x02226AF8
	arm_func_end FUN_0222204C

	arm_func_start FUN_02222060
FUN_02222060: @ 0x02222060
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl FUN_020D1AC4
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r3, r4, r5, pc}
	ldr r0, _022220C8 @ =0x02226B10
	ldr r1, _022220CC @ =0x02226AF4
	mov r2, #1
	bl FUN_020D2388
	mov r0, #0x2000
	str r0, [sp]
	ldr r0, _022220D0 @ =0x02226B30
	ldr r1, _022220D4 @ =FUN_022236A0
	add r3, r4, #0x2000
	mov r2, #0
	str r5, [sp, #4]
	bl FUN_020D1AD4
	ldr r0, _022220D0 @ =0x02226B30
	bl FUN_020D1F34
	mov r0, #1
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022220C8: .4byte 0x02226B10
_022220CC: .4byte 0x02226AF4
_022220D0: .4byte 0x02226B30
_022220D4: .4byte FUN_022236A0
	arm_func_end FUN_02222060

	arm_func_start FUN_022220D8
FUN_022220D8: @ 0x022220D8
	push {r3, lr}
	ldr r0, _022220F8 @ =0x02226224
	mov r1, #1
	str r1, [r0]
	bl FUN_0222211C
	ldr r0, _022220FC @ =0x02226B30
	bl FUN_020D1E38
	pop {r3, pc}
	.align 2, 0
_022220F8: .4byte 0x02226224
_022220FC: .4byte 0x02226B30
	arm_func_end FUN_022220D8

	arm_func_start FUN_02222100
FUN_02222100: @ 0x02222100
	push {r3, lr}
	ldr r0, _02222118 @ =0x02226B10
	add r1, sp, #0
	mov r2, #1
	bl FUN_020D2444
	pop {r3, pc}
	.align 2, 0
_02222118: .4byte 0x02226B10
	arm_func_end FUN_02222100

	arm_func_start FUN_0222211C
FUN_0222211C: @ 0x0222211C
	ldr ip, _02222130 @ =0x020D23B0
	mov r1, #0
	ldr r0, _02222134 @ =0x02226B10
	mov r2, r1
	bx ip
	.align 2, 0
_02222130: .4byte 0x020D23B0
_02222134: .4byte 0x02226B10
	arm_func_end FUN_0222211C

	arm_func_start FUN_02222138
FUN_02222138: @ 0x02222138
	push {r3, lr}
	cmp r1, #0x400
	bge _02222154
	mov r0, #0
	str r0, [r2]
	str r1, [r3]
	pop {r3, pc}
_02222154:
	sub ip, r1, #0x400
	asrs ip, ip, #9
	sub lr, ip, #1
	ldr ip, [r0, #0x1c]
	beq _02222178
_02222168:
	cmp lr, #0
	sub lr, lr, #1
	ldr ip, [ip]
	bne _02222168
_02222178:
	ldr r0, _02222190 @ =0x000001FF
	sub r1, r1, #0x400
	str ip, [r2]
	and r0, r1, r0
	str r0, [r3]
	pop {r3, pc}
	.align 2, 0
_02222190: .4byte 0x000001FF
	arm_func_end FUN_02222138

	arm_func_start FUN_02222194
FUN_02222194: @ 0x02222194
	ldr r3, [r1]
	cmp r3, #0
	bne _022221D4
	ldr r3, [r2]
	cmp r3, #0x400
	bge _022221C0
	add r1, r3, #1
	str r1, [r2]
	add r0, r0, r3
	ldrsb r0, [r0, #0x20]
	bx lr
_022221C0:
	mov r3, #0
	str r3, [r2]
	ldr r0, [r0, #0x1c]
	str r0, [r1]
	b _022221F4
_022221D4:
	ldr r0, [r2]
	cmp r0, #0x200
	bne _022221F4
	mov r0, #0
	str r0, [r2]
	ldr r0, [r1]
	ldr r0, [r0]
	str r0, [r1]
_022221F4:
	ldr r3, [r2]
	add r0, r3, #1
	str r0, [r2]
	ldr r0, [r1]
	add r0, r0, r3
	ldrsb r0, [r0, #4]
	bx lr
	arm_func_end FUN_02222194

	arm_func_start FUN_02222210
FUN_02222210: @ 0x02222210
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r6, #0
	movs r7, r3
	mov sl, r0
	subne r0, r6, #1
	mov sb, r1
	mov r8, r2
	strne r0, [r7]
	cmp sb, r8
	bge _022222D4
	add r2, sp, #4
	add r3, sp, #0
	mov r0, sl
	mov r1, sb
	bl FUN_02222138
	cmp sb, r8
	bge _022222D4
	mov fp, #1
	add r5, sp, #4
	add r4, sp, #0
_02222264:
	mov r0, sl
	mov r1, r5
	mov r2, r4
	bl FUN_02222194
	cmp r0, #0x3a
	bne _02222290
	cmp r7, #0
	beq _02222290
	ldr r1, [r7]
	cmp r1, #0
	strlt sb, [r7]
_02222290:
	cmp r6, #0
	bne _022222A4
	cmp r0, #0xd
	moveq r6, fp
	b _022222C8
_022222A4:
	cmp r0, #0xa
	bne _022222C4
	sub r0, r8, #1
	cmp sb, r0
	moveq r0, #0
	add sp, sp, #8
	addne r0, sb, #1
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022222C4:
	mov r6, #0
_022222C8:
	add sb, sb, #1
	cmp sb, r8
	blt _02222264
_022222D4:
	mvn r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end FUN_02222210

	arm_func_start FUN_022222E0
FUN_022222E0: @ 0x022222E0
	push {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r6, r2
	mov r8, r0
	cmp r7, r6
	bge _02222344
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_02222138
	cmp r7, r6
	bge _02222344
	add r5, sp, #4
	add r4, sp, #0
_02222318:
	mov r0, r8
	mov r1, r5
	mov r2, r4
	bl FUN_02222194
	cmp r0, #0x20
	addne sp, sp, #8
	movne r0, r7
	popne {r4, r5, r6, r7, r8, pc}
	add r7, r7, #1
	cmp r7, r6
	blt _02222318
_02222344:
	mvn r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end FUN_022222E0

	arm_func_start FUN_02222350
FUN_02222350: @ 0x02222350
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov r4, r2
	mov sl, r0
	mov r8, r3
	cmp sb, r4
	ldr r7, [sp, #0x30]
	bge _02222414
	add r2, sp, #4
	add r3, sp, #0
	bl FUN_02222138
	add r1, sp, #4
	add r2, sp, #0
	mov r0, sl
	bl FUN_02222194
	sub r6, r4, #1
	add r5, sp, #4
	add r4, sp, #0
	mov fp, #0
	b _022223D8
_022223A4:
	cmp r2, #0
	cmpne r2, #0x20
	cmpne r2, r7
	cmpne sb, r6
	addeq sp, sp, #8
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	mov r1, r5
	mov r2, r4
	bl FUN_02222194
	add sb, sb, #1
	add r8, r8, #1
_022223D8:
	ldrsb r2, [r8]
	mov r1, fp
	cmp r2, #0x41
	blt _022223F0
	cmp r2, #0x5a
	movle r1, #1
_022223F0:
	cmp r1, #0
	addne r1, r2, #0x20
	moveq r1, r2
	cmp r0, #0x41
	blt _0222240C
	cmp r0, #0x5a
	addle r0, r0, #0x20
_0222240C:
	cmp r0, r1
	beq _022223A4
_02222414:
	mvn r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end FUN_02222350

	arm_func_start FUN_02222420
FUN_02222420: @ 0x02222420
	push {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov r7, r2
	mov r6, r3
	ldr r0, [r4]
	add r2, r7, r6
	mov r8, r1
	cmp r2, r0
	bgt _02222500
	cmp r6, #0
	beq _022224F8
	cmp r7, #0x400
	bge _02222480
	rsb r5, r7, #0x400
	cmp r6, r5
	movle r5, r6
	add r1, r4, #0x20
	mov r0, r8
	mov r2, r5
	add r1, r1, r7
	bl FUN_0222336C
	add r7, r7, r5
	sub r6, r6, r5
	add r8, r8, r5
_02222480:
	cmp r6, #0
	beq _022224F8
	sub r2, r7, #0x400
	ldr r0, _02222508 @ =0x000001FF
	asrs r1, r2, #9
	and r7, r2, r0
	sub r0, r1, #1
	ldr r4, [r4, #0x1c]
	beq _022224B4
_022224A4:
	cmp r0, #0
	sub r0, r0, #1
	ldr r4, [r4]
	bne _022224A4
_022224B4:
	cmp r6, #0
	beq _022224F8
	ldr sb, _02222508 @ =0x000001FF
_022224C0:
	rsb r5, r7, #0x200
	cmp r6, r5
	movle r5, r6
	add r1, r4, #4
	mov r0, r8
	mov r2, r5
	add r1, r1, r7
	bl FUN_0222336C
	add r0, r7, r5
	and r7, r0, sb
	subs r6, r6, r5
	add r8, r8, r5
	ldr r4, [r4]
	bne _022224C0
_022224F8:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
_02222500:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_02222508: .4byte 0x000001FF
	arm_func_end FUN_02222420

	arm_func_start FUN_0222250C
FUN_0222250C: @ 0x0222250C
	ldr r0, [r0, #0xc]
	cmp r0, r1
	movls r0, #1
	movhi r0, #0
	bx lr
	arm_func_end FUN_0222250C

	arm_func_start FUN_02222520
FUN_02222520: @ 0x02222520
	push {r3, lr}
	ldr ip, [r0, #0x30]
	mov lr, r2
	str r3, [sp]
	ldr r2, [ip, #0x18]
	ldr r3, [ip, #0xc]
	add r2, r2, lr
	sub r3, r3, lr
	bl FUN_02223224
	pop {r3, pc}
	arm_func_end FUN_02222520

	arm_func_start FUN_02222548
FUN_02222548: @ 0x02222548
	push {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r4, [r8, #0x30]
	mov r6, r2
	mov r7, r1
	mov r0, r4
	mov r1, r6
	mov r5, r3
	bl FUN_0222250C
	cmp r0, #0
	addne sp, sp, #4
	ldrne r0, _022225B4 @ =0xFFFFFC15
	popne {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x20]
	sub r3, r0, r6
	str r1, [sp]
	ldr r2, [r4, #0x18]
	cmp r5, r3
	movle r3, r5
	mov r0, r8
	mov r1, r7
	add r2, r2, r6
	bl FUN_02223224
	add sp, sp, #4
	pop {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_022225B4: .4byte 0xFFFFFC15
	arm_func_end FUN_02222548

	arm_func_start FUN_022225B8
FUN_022225B8: @ 0x022225B8
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	movs r0, r1
	cmpne r0, #1
	str r1, [sp]
	mov r5, r2
	mov r4, r3
	mov r7, #0
	cmpne r0, #2
	beq _022225F0
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #0xb
	str r1, [r0]
	b _02222A7C
_022225F0:
	cmp r4, #0
	bne _02222608
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #0xb
	str r1, [r0]
	b _02222A7C
_02222608:
	ldr r1, _02222B04 @ =0x02226218
	mov r0, #0x58
	ldr r2, [r1]
	mov r1, #4
	blx r2
	movs r7, r0
	bne _02222634
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #1
	str r1, [r0]
	b _02222A7C
_02222634:
	mov r1, #0x58
	bl FUN_02223358
	ldr r1, _02222B04 @ =0x02226218
	mov r0, #0x420
	ldr r2, [r1]
	mov r1, #4
	blx r2
	str r0, [r7, #0x30]
	cmp r0, #0
	bne _0222266C
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #1
	str r1, [r0]
	b _02222A7C
_0222266C:
	mov r1, #0x420
	bl FUN_02223358
	ldr r1, [r7, #0x30]
	mov r0, fp
	str r5, [r1, #0x18]
	ldr r1, [r7, #0x30]
	str r4, [r1, #0xc]
	bl FUN_0222334C
	mov r4, r0
	cmp r4, #7
	bgt _022226A8
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_022226A8:
	mov r8, #7
	mov r3, #0x50
	ldr r1, _02222B08 @ =0x02225ED0
	mov r0, fp
	mov r2, r8
	str r3, [r7, #0x28]
	bl FUN_022232E4
	cmp r0, #0
	beq _02222708
	ldr r1, _02222B0C @ =0x02225ED8
	mov r0, fp
	mov r2, #8
	bl FUN_022232E4
	cmp r0, #0
	beq _022226F4
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_022226F4:
	mov r0, #1
	str r0, [r7, #8]
	rsb r0, r0, #0x1bc
	str r0, [r7, #0x28]
	mov r8, #8
_02222708:
	sub r4, r4, r8
	cmp r4, #0
	add r6, fp, r8
	bgt _02222728
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_02222728:
	mov r5, #0
	mov sb, r5
	mov sl, r5
	b _0222279C
_02222738:
	cmp sl, #2
	subeq sl, sl, #1
	beq _02222798
	cmp sl, #1
	bne _0222278C
	sub r0, r5, #1
	mov r1, #2
	add r0, r6, r0
	bl FUN_02224A98
	lsl r0, r0, #0x18
	asrs r0, r0, #0x18
	sub sl, sl, #1
	bpl _0222277C
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_0222277C:
	cmp r0, #0x2f
	bne _02222798
	sub sb, sb, #1
	b _022227B0
_0222278C:
	cmp r0, #0x25
	moveq sl, #2
	addeq sb, sb, #1
_02222798:
	add r5, r5, #1
_0222279C:
	cmp r5, r4
	bge _022227B0
	ldrsb r0, [r6, r5]
	cmp r0, #0x2f
	bne _02222738
_022227B0:
	cmp sl, #0
	beq _022227C8
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_022227C8:
	ldr r0, _02222B04 @ =0x02226218
	add r1, r8, r4
	sub r1, r1, sb, lsl #1
	ldr r2, [r0]
	add r0, r1, #1
	mov r1, #4
	blx r2
	str r0, [r7, #0x24]
	cmp r0, #0
	bne _02222800
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #1
	str r1, [r0]
	b _02222A7C
_02222800:
	mov r1, fp
	mov r2, r8
	bl FUN_0222336C
	mov sb, #0
	mov r5, sb
	mov sl, sb
	mov fp, sb
	cmp r4, #0
	ble _022228A4
_02222824:
	cmp sl, #2
	subeq sl, sl, #1
	beq _02222898
	cmp sl, #1
	bne _02222870
	sub r0, sb, #1
	add r0, r6, r0
	mov r1, #2
	bl FUN_02224A98
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	ldr r0, [r7, #0x24]
	cmp r1, #0x2f
	add r0, r8, r0
	add r0, r5, r0
	sub sl, sl, #1
	strb r1, [r0, #-1]
	moveq fp, #1
	b _02222898
_02222870:
	ldrsb r1, [r6, sb]
	cmp r1, #0x2f
	moveq fp, #1
	cmp fp, #0
	cmpeq r1, #0x25
	ldrne r0, [r7, #0x24]
	moveq sl, #2
	addne r0, r8, r0
	strbne r1, [r5, r0]
	add r5, r5, #1
_02222898:
	add sb, sb, #1
	cmp sb, r4
	blt _02222824
_022228A4:
	ldr r1, [r7, #0x24]
	add r0, r8, r5
	mov r2, #0
	strb r2, [r1, r0]
	ldr r0, [r7, #0x24]
	cmp r5, #0
	add r1, r0, r8
	ble _022228E8
_022228C4:
	ldrsb r0, [r1, r2]
	cmp r0, #0x2f
	cmpne r0, #0x3a
	addeq r0, r2, r8
	streq r0, [r7, #0xc]
	beq _022228E8
	add r2, r2, #1
	cmp r2, r5
	blt _022228C4
_022228E8:
	cmp r2, r5
	bne _02222900
	add r0, r2, r8
	str r0, [r7, #0xc]
	str r0, [r7, #0x10]
	b _022229A4
_02222900:
	ldrsb r0, [r1, r2]
	cmp r0, #0x2f
	ldreq r0, [r7, #0xc]
	streq r0, [r7, #0x10]
	beq _022229A4
	cmp r0, #0x3a
	bne _022229A4
	cmp r2, r5
	bge _02222944
_02222924:
	ldrsb r0, [r1, r2]
	cmp r0, #0x2f
	addeq r0, r2, r8
	streq r0, [r7, #0x10]
	beq _02222944
	add r2, r2, #1
	cmp r2, r5
	blt _02222924
_02222944:
	cmp r2, r5
	addeq r0, r2, r8
	streq r0, [r7, #0x10]
	beq _022229A4
	ldr r1, [r7, #0xc]
	ldr r0, [r7, #0x24]
	add r2, r1, #1
	ldr r1, [r7, #0x10]
	add r0, r0, r2
	sub r1, r1, r2
	bl FUN_02224D58
	cmp r0, #0
	ldrlt r0, [r7, #0x28]
	blt _02222998
	ldr r1, _02222B10 @ =0x0000FFFF
	cmp r0, r1
	ble _02222998
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #4
	str r1, [r0]
	b _02222A7C
_02222998:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r7, #0x28]
_022229A4:
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _02222A4C
	ldr r0, _02222B04 @ =0x02226218
	ldr r3, [r7, #0xc]
	ldr r2, [r0]
	mov r0, #0x830
	mov r1, #4
	sub r4, r3, r8
	blx r2
	str r0, [r7, #0x20]
	cmp r0, #0
	bne _022229E8
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #1
	str r1, [r0]
	b _02222A7C
_022229E8:
	mov r1, #0x830
	bl FUN_02223358
	ldr r1, _02222B04 @ =0x02226218
	add r0, r4, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	ldr r1, [r7, #0x20]
	str r0, [r1, #0x800]
	ldr r0, [r7, #0x20]
	ldr r0, [r0, #0x800]
	cmp r0, #0
	bne _02222A2C
	ldr r0, _02222B00 @ =0x02226214
	mov r1, #1
	str r1, [r0]
	b _02222A7C
_02222A2C:
	ldr r1, [r7, #0x24]
	mov r2, r4
	add r1, r1, r8
	bl FUN_0222336C
	ldr r0, [r7, #0x20]
	mov r1, #0
	ldr r0, [r0, #0x800]
	strb r1, [r0, r4]
_02222A4C:
	ldr r1, _02222B14 @ =0x02224F74
	add r0, r7, #0x44
	mov r2, #0x14
	bl FUN_0222336C
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [r7, #0x2c]
	ldr r0, [sp]
	str r0, [r7, #0x40]
	mov r0, r7
	str r1, [r7, #0x3c]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02222A7C:
	cmp r7, #0
	beq _02222AF8
	ldr r0, [r7, #0x20]
	cmp r0, #0
	beq _02222AB8
	ldr r0, [r0, #0x800]
	cmp r0, #0
	beq _02222AA8
	ldr r1, _02222B18 @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222AA8:
	ldr r1, _02222B18 @ =0x0222621C
	ldr r0, [r7, #0x20]
	ldr r1, [r1]
	blx r1
_02222AB8:
	ldr r0, [r7, #0x24]
	cmp r0, #0
	beq _02222AD0
	ldr r1, _02222B18 @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222AD0:
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _02222AE8
	ldr r1, _02222B18 @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222AE8:
	ldr r1, _02222B18 @ =0x0222621C
	mov r0, r7
	ldr r1, [r1]
	blx r1
_02222AF8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02222B00: .4byte 0x02226214
_02222B04: .4byte 0x02226218
_02222B08: .4byte 0x02225ED0
_02222B0C: .4byte 0x02225ED8
_02222B10: .4byte 0x0000FFFF
_02222B14: .4byte 0x02224F74
_02222B18: .4byte 0x0222621C
	arm_func_end FUN_022225B8

	arm_func_start FUN_02222B1C
FUN_02222B1C: @ 0x02222B1C
	push {r4, lr}
	ldr r1, _02222B40 @ =0x0222621C
	mov r4, r0
	ldr r0, [r4, #0x30]
	ldr r1, [r1]
	blx r1
	mov r0, r4
	bl FUN_02222B98
	pop {r4, pc}
	.align 2, 0
_02222B40: .4byte 0x0222621C
	arm_func_end FUN_02222B1C

	arm_func_start FUN_02222B44
FUN_02222B44: @ 0x02222B44
	push {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r4, _02222B94 @ =0x0222621C
	mov r5, #0
_02222B58:
	ldr r0, [r7]
	cmp r7, r0
	beq _02222B78
	ldr r6, [r0]
	ldr r1, [r4]
	blx r1
	str r6, [r7]
	b _02222B88
_02222B78:
	ldr r1, [r4]
	mov r0, r7
	blx r1
	mov r7, r5
_02222B88:
	cmp r7, #0
	bne _02222B58
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222B94: .4byte 0x0222621C
	arm_func_end FUN_02222B44

	arm_func_start FUN_02222B98
FUN_02222B98: @ 0x02222B98
	push {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x34]
	bl FUN_02222B44
	ldr r0, [r4, #0x38]
	bl FUN_02222B44
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02222BE4
	ldr r0, [r0, #0x800]
	cmp r0, #0
	beq _02222BD4
	ldr r1, _02222C0C @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222BD4:
	ldr r1, _02222C0C @ =0x0222621C
	ldr r0, [r4, #0x20]
	ldr r1, [r1]
	blx r1
_02222BE4:
	ldr r1, _02222C0C @ =0x0222621C
	ldr r0, [r4, #0x24]
	ldr r1, [r1]
	blx r1
	ldr r1, _02222C0C @ =0x0222621C
	mov r0, r4
	ldr r1, [r1]
	blx r1
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_02222C0C: .4byte 0x0222621C
	arm_func_end FUN_02222B98

	arm_func_start FUN_02222C10
FUN_02222C10: @ 0x02222C10
	push {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _02222C38
	ldr r0, _02222C98 @ =0x02226214
	mov r1, #0xb
	str r1, [r0]
	sub r0, r1, #0xc
	pop {r3, r4, r5, pc}
_02222C38:
	ldr r0, [r5, #0x40]
	cmp r0, #1
	ldreq r0, [r5, #0x38]
	cmpeq r0, #0
	bne _02222C60
	ldr r0, _02222C98 @ =0x02226214
	mov r1, #0xb
	str r1, [r0]
	sub r0, r1, #0xc
	pop {r3, r4, r5, pc}
_02222C60:
	bl FUN_02222038
	mov r0, r5
	bl FUN_02221E2C
	movs r4, r0
	ldrmi r0, _02222C98 @ =0x02226214
	movmi r1, #1
	strmi r1, [r0]
	bmi _02222C8C
	mov r0, #1
	str r0, [r5]
	bl FUN_0222211C
_02222C8C:
	bl FUN_0222204C
	mov r0, r4
	pop {r3, r4, r5, pc}
	.align 2, 0
_02222C98: .4byte 0x02226214
	arm_func_end FUN_02222C10

	arm_func_start FUN_02222C9C
FUN_02222C9C: @ 0x02222C9C
	push {r3, r4, r5, lr}
	mov r4, r0
	mov r5, #0
	bl FUN_02222038
	ldr r0, _02222D14 @ =0x02226220
	ldr r2, [r0]
	cmp r2, #0
	beq _02222CF4
	ldr r1, [r2, #8]
	cmp r1, r4
	ldreq r1, [r2, #0xc]
	ldreq r1, [r1, #4]
	cmpeq r1, #0
	bne _02222CF4
	ldr r1, [r2, #0xc]
	mov r2, #1
	str r2, [r1, #4]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #0x10]
	bl FUN_022232BC
	mov r5, #1
_02222CF4:
	cmp r5, #0
	bne _02222D08
	mov r0, r4
	bl FUN_02221F38
	mov r5, r0
_02222D08:
	bl FUN_0222204C
	mov r0, r5
	pop {r3, r4, r5, pc}
	.align 2, 0
_02222D14: .4byte 0x02226220
	arm_func_end FUN_02222C9C

	arm_func_start FUN_02222D18
FUN_02222D18: @ 0x02222D18
	push {r3, lr}
	bl FUN_02222038
	ldr r0, _02222D68 @ =0x02226220
	ldr r2, [r0]
	cmp r2, #0
	beq _02222D5C
	ldr r1, [r2, #0xc]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _02222D5C
	ldr r1, [r2, #0xc]
	mov r2, #1
	str r2, [r1, #4]
	ldr r1, [r0]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #0x10]
	bl FUN_022232BC
_02222D5C:
	bl FUN_02221FD8
	bl FUN_0222204C
	pop {r3, pc}
	.align 2, 0
_02222D68: .4byte 0x02226220
	arm_func_end FUN_02222D18

	arm_func_start FUN_02222D6C
FUN_02222D6C: @ 0x02222D6C
	push {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r2, [r5, #0x24]
	ldr r1, [r5, #0xc]
	mov r0, #0
	ldrsb r4, [r2, r1]
	strb r0, [r2, r1]
	ldr r0, [r5, #8]
	ldr r6, [r5, #0x24]
	cmp r0, #0
	movne r7, #8
	moveq r7, #7
	add r1, sp, #0
	add r0, r6, r7
	bl FUN_020A35AC
	cmp r0, #0
	ldrne r0, [sp]
	bne _02222DF4
	add r0, r6, r7
	bl FUN_020A2AE0
	cmp r0, #0
	moveq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	lsr r2, r0, #0x18
	lsr r1, r0, #8
	lsl r3, r0, #8
	lsl ip, r0, #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
_02222DF4:
	ldr r2, [r5, #0x24]
	ldr r1, [r5, #0xc]
	strb r4, [r2, r1]
	pop {r3, r4, r5, r6, r7, pc}
	arm_func_end FUN_02222D6C

	arm_func_start FUN_02222E04
FUN_02222E04: @ 0x02222E04
	push {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02222E34
	ldr r5, _02222E78 @ =0x0222621C
_02222E1C:
	ldr r6, [r0]
	ldr r1, [r5]
	blx r1
	movs r0, r6
	str r6, [r4, #0x1c]
	bne _02222E1C
_02222E34:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02222E4C
	ldr r1, _02222E78 @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222E4C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02222E64
	ldr r1, _02222E78 @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02222E64:
	ldr r1, _02222E78 @ =0x0222621C
	mov r0, r4
	ldr r1, [r1]
	blx r1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02222E78: .4byte 0x0222621C
	arm_func_end FUN_02222E04

	arm_func_start FUN_02222E7C
FUN_02222E7C: @ 0x02222E7C
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r2
	mov sl, r1
	ldr r2, [r5]
	add r3, sp, #4
	mov r1, #0xc
	bl FUN_02222210
	mov r8, r0
	cmp r8, #0
	ble _02222F7C
	mov r6, #0
	add r7, sp, #4
_02222EB4:
	ldr r2, [r5]
	mov r0, r5
	mov r1, r8
	mov r3, r7
	bl FUN_02222210
	ldr r2, [sp, #4]
	mov sb, r0
	cmp r2, #0
	ble _02222F70
	mov r0, r5
	mov r1, r8
	mov r3, sl
	str r6, [sp]
	bl FUN_02222350
	cmp r0, #0
	bne _02222F70
	ldr r1, [sp, #4]
	ldr r0, [r5]
	add r1, r1, #1
	cmp r1, r0
	bge _02222F64
	ldr r2, [r5]
	mov r0, r5
	mov r3, #0
	bl FUN_02222210
	cmp r0, #0
	ldrle r6, [r5]
	ble _02222F38
	cmp r0, #2
	addlt sp, sp, #8
	mvnlt r0, #0
	poplt {r4, r5, r6, r7, r8, sb, sl, pc}
	sub r6, r0, #2
_02222F38:
	ldr r1, [sp, #4]
	mov r0, r5
	mov r2, r6
	add r1, r1, #1
	bl FUN_022222E0
	cmp r0, #0
	movlt r0, r6
	str r0, [r4]
	add sp, sp, #8
	sub r0, r6, r0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02222F64:
	add sp, sp, #8
	mov r0, #0
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
_02222F70:
	mov r8, sb
	cmp sb, #0
	bgt _02222EB4
_02222F7C:
	mvn r0, #0
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end FUN_02222E7C

	arm_func_start FUN_02222F88
FUN_02222F88: @ 0x02222F88
	push {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #8]
	mov r6, r1
	cmp r0, #0
	mov r5, r2
	mvneq r0, #0
	popeq {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _02222FC8
	ldr r1, _02223080 @ =0x0222621C
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r7, #0x14]
_02222FC8:
	add r2, sp, #0
	mov r0, r7
	mov r1, r6
	bl FUN_02222E7C
	movs r4, r0
	bmi _02223024
	ldr r1, _02223084 @ =0x02226218
	add r0, r4, #1
	ldr r2, [r1]
	mov r1, #4
	blx r2
	str r0, [r7, #0x14]
	mov r1, #0
	strb r1, [r0, r4]
	ldr r1, [r7, #0x14]
	ldr r2, [sp]
	mov r0, r7
	mov r3, r4
	bl FUN_02222420
	ldr r1, [r7, #0x14]
	mov r0, r4
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02223024:
	ldr r0, _02223088 @ =0x02225EE4
	mov r1, r6
	bl FUN_022232D8
	cmp r0, #0
	mvnne r0, #0
	popne {r3, r4, r5, r6, r7, pc}
	ldr r1, _02223084 @ =0x02226218
	mov r0, #4
	ldr r2, [r1]
	mov r1, r0
	blx r2
	str r0, [r7, #0x14]
	mov r1, #0
	strb r1, [r0, #3]
	ldr r1, [r7, #0x14]
	mov r0, r7
	mov r2, #9
	mov r3, #3
	bl FUN_02222420
	ldr r1, [r7, #0x14]
	mov r0, #3
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223080: .4byte 0x0222621C
_02223084: .4byte 0x02226218
_02223088: .4byte 0x02225EE4
	arm_func_end FUN_02222F88

	arm_func_start FUN_0222308C
FUN_0222308C: @ 0x0222308C
	ldr r2, [r0, #8]
	cmp r2, #0
	ldrne r2, [r0, #4]
	cmpne r2, #0
	mvneq r0, #0
	ldrne r2, [r0, #0x18]
	strne r2, [r1]
	ldrne r0, [r0, #4]
	bx lr
	arm_func_end FUN_0222308C

	arm_func_start FUN_022230B0
FUN_022230B0: @ 0x022230B0
	tst r0, #0x8000
	bicne r0, r0, #0x8000
	bx lr
	arm_func_end FUN_022230B0

	arm_func_start FUN_022230BC
FUN_022230BC: @ 0x022230BC
	push {r3, lr}
	ldr r0, _022230D8 @ =0x02226BF0
	bl FUN_020D3E78
	ldr r0, _022230D8 @ =0x02226BF0
	mov r1, #0x20
	bl FUN_020AA9B0
	pop {r3, pc}
	.align 2, 0
_022230D8: .4byte 0x02226BF0
	arm_func_end FUN_022230BC

	arm_func_start FUN_022230DC
FUN_022230DC: @ 0x022230DC
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl FUN_020A2EAC
	movs r4, r0
	bmi _02223150
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02223150
	bl FUN_022230BC
	ldr r1, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	ldr r2, _02223158 @ =FUN_022230B0
	str r1, [r0, #0x814]
	ldr r3, [r5, #0x18]
	ldr r1, [r5, #0x20]
	mov r0, r4
	str r3, [r1, #0x818]
	ldr r1, [r5, #0x20]
	str r2, [r1, #0x810]
	ldr r1, [r5, #0x20]
	bl FUN_020A3754
	cmp r0, #0
	bge _02223150
	mov r0, r4
	bl FUN_020A30C8
	mvn r4, #0
_02223150:
	mov r0, r4
	pop {r3, r4, r5, pc}
	.align 2, 0
_02223158: .4byte FUN_022230B0
	arm_func_end FUN_022230DC

	arm_func_start FUN_0222315C
FUN_0222315C: @ 0x0222315C
	ldr ip, _02223168 @ =FUN_020A30C8
	mov r0, r1
	bx ip
	.align 2, 0
_02223168: .4byte FUN_020A30C8
	arm_func_end FUN_0222315C

	arm_func_start FUN_0222316C
FUN_0222316C: @ 0x0222316C
	push {r4, r5, r6, lr}
	mov r6, r1
	mov r0, r6
	bl FUN_020A30C8
	mvn r4, #0x19
	cmp r0, r4
	popne {r4, r5, r6, pc}
	mov r5, #0x1f4
_0222318C:
	mov r0, r5
	bl FUN_020D2108
	mov r0, r6
	bl FUN_020A30C8
	cmp r0, r4
	beq _0222318C
	pop {r4, r5, r6, pc}
	arm_func_end FUN_0222316C

	arm_func_start FUN_022231A8
FUN_022231A8: @ 0x022231A8
	push {r3, r4, r5, lr}
	sub sp, sp, #8
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	asr ip, r3, #8
	mov r4, r0
	mov r5, #8
	mov lr, #2
	lsl r3, r3, #8
	mov r0, r1
	and ip, ip, #0xff
	and r1, r3, #0xff00
	orr r3, ip, r1
	add r1, sp, #0
	strb r5, [sp]
	strb lr, [sp, #1]
	strh r3, [sp, #2]
	str r2, [sp, #4]
	bl FUN_020A2F04
	cmp r0, #0
	bge _02223214
	ldr r0, [r4, #4]
	add sp, sp, #8
	cmp r0, #0
	ldrne r0, _02223220 @ =0xFFFFFC16
	mvneq r0, #0x3e8
	pop {r3, r4, r5, pc}
_02223214:
	mov r0, #0
	add sp, sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02223220: .4byte 0xFFFFFC16
	arm_func_end FUN_022231A8

	arm_func_start FUN_02223224
FUN_02223224: @ 0x02223224
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	mov r2, r3
	ldr r3, [sp, #8]
	bl FUN_020A2F60
	cmp r0, #0
	popge {r4, pc}
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, _0222326C @ =0xFFFFFC16
	popne {r4, pc}
	mvn r1, #0x37
	cmp r0, r1
	moveq r0, #0
	mvnne r0, #0x3e8
	pop {r4, pc}
	.align 2, 0
_0222326C: .4byte 0xFFFFFC16
	arm_func_end FUN_02223224

	arm_func_start FUN_02223270
FUN_02223270: @ 0x02223270
	push {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	mov r2, r3
	ldr r3, [sp, #8]
	bl FUN_020A3014
	cmp r0, #0
	popge {r4, pc}
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, _022232B8 @ =0xFFFFFC16
	popne {r4, pc}
	mvn r1, #0x37
	cmp r0, r1
	moveq r0, #0
	mvnne r0, #0x3e8
	pop {r4, pc}
	.align 2, 0
_022232B8: .4byte 0xFFFFFC16
	arm_func_end FUN_02223270

	arm_func_start FUN_022232BC
FUN_022232BC: @ 0x022232BC
	push {r3, lr}
	cmp r1, #0
	poplt {r3, pc}
	mov r0, r1
	mov r1, #2
	bl FUN_020A30BC
	pop {r3, pc}
	arm_func_end FUN_022232BC

	arm_func_start FUN_022232D8
FUN_022232D8: @ 0x022232D8
	ldr ip, _022232E0 @ =FUN_020E3DFC
	bx ip
	.align 2, 0
_022232E0: .4byte FUN_020E3DFC
	arm_func_end FUN_022232D8

	arm_func_start FUN_022232E4
FUN_022232E4: @ 0x022232E4
	cmp r2, #0
	ble _02223344
_022232EC:
	ldrsb ip, [r0], #1
	ldrsb r3, [r1], #1
	cmp ip, #0
	cmpne r3, #0
	bne _02223310
	cmp ip, #0
	cmpeq r3, #0
	moveq r2, #0
	b _02223344
_02223310:
	cmp r3, #0x41
	blt _02223320
	cmp r3, #0x5a
	addle r3, r3, #0x20
_02223320:
	cmp ip, #0x41
	blt _02223330
	cmp ip, #0x5a
	addle ip, ip, #0x20
_02223330:
	cmp ip, r3
	bne _02223344
	sub r2, r2, #1
	cmp r2, #0
	bgt _022232EC
_02223344:
	mov r0, r2
	bx lr
	arm_func_end FUN_022232E4

	arm_func_start FUN_0222334C
FUN_0222334C: @ 0x0222334C
	ldr ip, _02223354 @ =FUN_020E3DD4
	bx ip
	.align 2, 0
_02223354: .4byte FUN_020E3DD4
	arm_func_end FUN_0222334C

	arm_func_start FUN_02223358
FUN_02223358: @ 0x02223358
	ldr ip, _02223368 @ =0x020D4994
	mov r2, r1
	mov r1, #0
	bx ip
	.align 2, 0
_02223368: .4byte 0x020D4994
	arm_func_end FUN_02223358

	arm_func_start FUN_0222336C
FUN_0222336C: @ 0x0222336C
	ldr ip, _02223380 @ =0x020D4A50
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_02223380: .4byte 0x020D4A50
	arm_func_end FUN_0222336C

	arm_func_start FUN_02223384
FUN_02223384: @ 0x02223384
	push {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0
	mov r4, r1
	str r0, [r5]
	str r0, [r4]
	bl FUN_02222038
	ldr r1, _0222341C @ =0x02226220
	ldr r2, [r1]
	cmp r2, #0
	beq _022233FC
	ldr r0, [r2, #0xc]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022233F4
	ldr r2, [r2, #0xc]
	mvn r0, #0
	ldr r2, [r2, #0x30]
	ldr r2, [r2, #4]
	str r2, [r5]
	ldr r2, [r1]
	ldr r1, [r2, #0xc]
	ldr r1, [r1, #0x14]
	cmp r1, r0
	moveq r0, #0
	ldrne r0, [r2, #0xc]
	ldrne r0, [r0, #0x14]
	str r0, [r4]
_022233F4:
	mov r4, #1
	b _02223410
_022233FC:
	ldr r0, _02223420 @ =0x02226230
	ldr r0, [r0]
	cmp r0, #0
	movne r4, #1
	moveq r4, #0
_02223410:
	bl FUN_0222204C
	mov r0, r4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222341C: .4byte 0x02226220
_02223420: .4byte 0x02226230
	arm_func_end FUN_02223384

	arm_func_start FUN_02223424
FUN_02223424: @ 0x02223424
	push {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, [sp, #0x28]
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	cmp r5, #0
	ble _022234CC
	ldr r4, _022234D4 @ =0x02226C58
	mov fp, #0
_0222344C:
	ldr r0, [sl, #4]
	cmp r0, #0
	mvnne r0, #0
	popne {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r8]
	mov r1, r7
	rsb r6, r0, #0x400
	cmp r5, r6
	movle r6, r5
	mov r2, r6
	add r0, r4, r0
	bl FUN_0222336C
	ldr r0, [r8]
	add r7, r7, r6
	add r0, r0, r6
	str r0, [r8]
	cmp r0, #0x400
	sub r5, r5, r6
	bne _022234C4
	mov r0, sl
	mov r1, sb
	mov r2, r4
	mov r3, #0x400
	str fp, [sp]
	bl FUN_02223270
	cmp r0, #0
	pople {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r8]
	sub r0, r1, r0
	str r0, [r8]
_022234C4:
	cmp r5, #0
	bgt _0222344C
_022234CC:
	ldr r0, [sp, #0x28]
	pop {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_022234D4: .4byte 0x02226C58
	arm_func_end FUN_02223424

	arm_func_start FUN_022234D8
FUN_022234D8: @ 0x022234D8
	push {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r8, #0
	mov sl, r0
	mov sb, r1
	mov r7, r8
	strb r8, [sp, #4]
	strb r8, [sp, #5]
	mov r6, r8
	mov r5, #1
	add r4, sp, #4
	b _02223534
_02223508:
	mov r0, sl
	mov r1, sb
	mov r3, r5
	add r2, r4, r2
	str r6, [sp]
	bl FUN_02223224
	cmp r0, #0
	addle sp, sp, #8
	pople {r4, r5, r6, r7, r8, sb, sl, pc}
	add r8, r8, r0
	add r7, r7, #1
_02223534:
	and r2, r7, #1
	ldrsb r0, [r4, r2]
	cmp r0, #0xd
	bne _02223508
	sub r0, r7, #1
	and r0, r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0xa
	bne _02223508
	mov r0, r8
	add sp, sp, #8
	pop {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end FUN_022234D8

	arm_func_start FUN_02223564
FUN_02223564: @ 0x02223564
	push {r4, lr}
	movs r4, r0
	popeq {r4, pc}
	ldr r0, [r4, #0x800]
	cmp r0, #0
	beq _02223588
	ldr r1, _0222359C @ =0x0222621C
	ldr r1, [r1]
	blx r1
_02223588:
	ldr r1, _0222359C @ =0x0222621C
	mov r0, r4
	ldr r1, [r1]
	blx r1
	pop {r4, pc}
	.align 2, 0
_0222359C: .4byte 0x0222621C
	arm_func_end FUN_02223564

	arm_func_start FUN_022235A0
FUN_022235A0: @ 0x022235A0
	push {r4, r5, r6, lr}
	ldr r2, _02223634 @ =0x02226C10
	mov r6, r0
	ldm r2, {r0, r2}
	add r0, r0, #1
	and r4, r0, #7
	mov r5, r1
	cmp r4, r2
	bne _022235FC
	ldr r1, _02223638 @ =0x02226C18
	mov r0, #0
	ldr r1, [r1, r2, lsl #3]
	bl FUN_0222316C
	ldr r0, _02223634 @ =0x02226C10
	ldr r1, _0222363C @ =0x02226C1C
	ldr r0, [r0, #4]
	ldr r0, [r1, r0, lsl #3]
	bl FUN_02223564
	ldr r0, _02223634 @ =0x02226C10
	ldr r1, [r0, #4]
	add r1, r1, #1
	and r1, r1, #7
	str r1, [r0, #4]
_022235FC:
	ldr r0, [r5]
	cmp r0, #0
	popeq {r4, r5, r6, pc}
	ldr r0, _02223634 @ =0x02226C10
	ldr r1, _02223638 @ =0x02226C18
	ldr ip, [r0]
	ldr r2, _0222363C @ =0x02226C1C
	str r6, [r1, ip, lsl #3]
	ldr r3, [r5]
	mov r1, #0
	str r3, [r2, ip, lsl #3]
	str r1, [r5]
	str r4, [r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02223634: .4byte 0x02226C10
_02223638: .4byte 0x02226C18
_0222363C: .4byte 0x02226C1C
	arm_func_end FUN_022235A0

	arm_func_start FUN_02223640
FUN_02223640: @ 0x02223640
	push {r4, r5, r6, lr}
	ldr r6, _02223698 @ =0x02226C10
	ldm r6, {r0, r1}
	cmp r0, r1
	popeq {r4, r5, r6, pc}
	ldr r4, _0222369C @ =0x02226C18
	mov r5, #0
_0222365C:
	ldr r1, [r4, r1, lsl #3]
	mov r0, r5
	bl FUN_0222316C
	ldr r0, [r6, #4]
	add r0, r4, r0, lsl #3
	ldr r0, [r0, #4]
	bl FUN_02223564
	ldr r0, [r6, #4]
	add r0, r0, #1
	and r1, r0, #7
	str r1, [r6, #4]
	ldr r0, [r6]
	cmp r0, r1
	bne _0222365C
	pop {r4, r5, r6, pc}
	.align 2, 0
_02223698: .4byte 0x02226C10
_0222369C: .4byte 0x02226C18
	arm_func_end FUN_02223640

	arm_func_start FUN_022236A0
FUN_022236A0: @ 0x022236A0
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r2, _022245C0 @ =0x02226C10
	mov r0, #0
	str r0, [sp, #0x3c]
	str r0, [r2]
	ldr r1, _022245C4 @ =0x02226224
	mvn r6, #0
	str r0, [r2, #4]
	ldr r1, [r1]
	str r0, [sp, #0x10]
	str r6, [sp, #0x18]
	str r6, [sp, #0x14]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	cmp r1, #0
	bne _02224970
_022236E4:
	bl FUN_02222038
	bl FUN_02222008
	cmp r0, #0
	mvneq r4, #0
	beq _02223708
	ldr r4, [r0, #8]
	ldr r8, [r0, #0xc]
	ldr r1, _022245C8 @ =0x02226220
	str r0, [r1]
_02223708:
	bl FUN_0222204C
	cmp r4, #0
	bge _0222371C
	bl FUN_02222100
	b _02224960
_0222371C:
	ldr r0, [r8, #4]
	ldr sb, [r8, #0x30]
	cmp r0, #0
	bne _02224890
	mov r0, r8
	bl FUN_02222D6C
	str r0, [sp, #0x1c]
	cmp r0, #0
	moveq r0, #4
	streq r0, [sp, #4]
	beq _02224890
	mov r1, r0
	ldr r0, [sp, #0x18]
	mov r2, #0
	cmp r1, r0
	ldreq r1, [r8, #0x28]
	ldreq r0, [sp, #0x14]
	add r5, sp, #0x38
	cmpeq r1, r0
	ldreq r1, [r8, #8]
	ldreq r0, [sp, #0xc]
	add r4, sp, #0x40
	cmpeq r1, r0
	ldr r0, [r8, #0x28]
	moveq r2, #1
	str r0, [sp, #0x14]
	ldr r0, [r8, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	and r0, r0, r2
	str r0, [sp, #8]
	mvn r0, #0
	str r0, [sp, #0x20]
_022237A8:
	mov r0, #0
	cmp r6, #0
	str r0, [sp, #4]
	blt _022237F8
	mov r0, #9
	strh r0, [sp, #0x2c]
	ldr r2, _022245CC @ =0x0000CC8D
	add r0, sp, #0x28
	mov r1, #1
	mov r3, #0
	str r6, [sp, #0x28]
	bl FUN_020A36A0
	cmp r0, #0
	movle r0, #0
	strle r0, [sp, #8]
	ble _022237F8
	ldrsh r0, [sp, #0x2e]
	tst r0, #0xe0
	movne r0, #0
	strne r0, [sp, #8]
_022237F8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022238C0
	cmp r6, #0
	blt _02223840
	mov r0, r8
	mov r1, r6
	bl FUN_0222315C
	cmp r0, #0
	movlt r0, #0xa
	strlt r0, [sp, #4]
	mov r0, r6
	add r1, sp, #0x3c
	bl FUN_022235A0
	ldr r0, [sp, #4]
	ldr r6, [sp, #0x20]
	cmp r0, #0
	bne _02224890
_02223840:
	mov r0, r8
	bl FUN_022230DC
	movs r6, r0
	movmi r0, #3
	strmi r0, [sp, #4]
	bmi _02224890
	ldr r0, [r8, #8]
	cmp r0, #0
	beq _02223874
	ldr r0, [r8, #0x20]
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [r8, #0x20]
_02223874:
	bl FUN_02222038
	ldr r0, _022245C8 @ =0x02226220
	ldr r0, [r0]
	str r6, [r0, #0x10]
	bl FUN_0222204C
	ldr r0, [r8, #4]
	cmp r0, #0
	bne _02224890
	ldr r2, [sp, #0x1c]
	ldr r3, [r8, #0x28]
	mov r0, r8
	mov r1, r6
	bl FUN_022231A8
	cmp r0, #0
	movge r0, #1
	strge r0, [sp, #8]
	movlt r0, #0
	strlt r0, [sp, #8]
	b _022238F4
_022238C0:
	ldr r0, [r8, #8]
	cmp r0, #0
	beq _022238DC
	ldr r0, [r8, #0x20]
	bl FUN_02223564
	mov r0, #0
	str r0, [r8, #0x20]
_022238DC:
	bl FUN_022230BC
	bl FUN_02222038
	ldr r0, _022245C8 @ =0x02226220
	ldr r0, [r0]
	str r6, [r0, #0x10]
	bl FUN_0222204C
_022238F4:
	ldr r0, [r8, #4]
	cmp r0, #0
	bne _02224890
	ldr r0, [sp, #8]
	cmp r0, #0
	moveq r0, #5
	streq r0, [sp, #4]
	beq _02224890
	mov r0, #0
	str r0, [sp, #0x38]
	str r0, [sp, #8]
	ldr r0, [r8, #0x24]
	bl FUN_0222334C
	mov r7, r0
	mov r0, #0xa
	str r0, [sp, #4]
	ldr r0, [r8, #0x40]
	cmp r0, #0
	beq _02223954
	cmp r0, #1
	beq _02223980
	cmp r0, #2
	beq _022239AC
	b _022239D4
_02223954:
	mov r0, #4
	str r0, [sp]
	ldr r3, _022245D0 @ =0x02225EF4
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	b _022239D4
_02223980:
	mov r0, #5
	str r0, [sp]
	ldr r3, _022245D4 @ =0x02225EFC
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	b _022239D4
_022239AC:
	mov r0, #5
	str r0, [sp]
	ldr r3, _022245D8 @ =0x02225F04
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_022239D4:
	ldr sl, [r8, #0x10]
	cmp r7, sl
	ble _02223A14
	subs r0, r7, sl
	beq _02223A3C
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r8, #0x24]
	add r3, r3, sl
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	b _02223A3C
_02223A14:
	mov r0, #1
	str r0, [sp]
	ldr r3, _022245DC @ =0x02225F0C
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223A3C:
	mov r0, #0xb
	str r0, [sp]
	ldr r3, _022245E0 @ =0x02225F10
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r8, #8]
	ldr r3, _022245E4 @ =0x02225F1C
	cmp r0, #0
	movne r0, #8
	moveq r0, #7
	str r0, [sp, #0x34]
	mov r0, #6
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r7, [sp, #0x34]
	ldr r0, [r8, #0xc]
	subs r0, r0, r7
	beq _02223AD8
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r8, #0x24]
	add r3, r3, r7
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223AD8:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	add r0, r8, #0x34
	bl FUN_02221C60
	movs r7, r0
	beq _02223BE8
_02223B10:
	ldr r0, [r7, #8]
	bl FUN_0222334C
	cmp r0, #0
	beq _02223B44
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r7, #8]
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223B44:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245EC @ =0x02225F28
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r7, #0xc]
	bl FUN_0222334C
	cmp r0, #0
	beq _02223BA0
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r7, #0xc]
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223BA0:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r1, _022245F0 @ =0x0222621C
	mov r0, r7
	ldr r1, [r1]
	blx r1
	add r0, r8, #0x34
	bl FUN_02221C60
	movs r7, r0
	bne _02223B10
_02223BE8:
	ldr r0, [r8, #0x40]
	cmp r0, #1
	bne _02223E08
	ldr sl, [r8, #0x38]
	mov r7, #0
	mov r0, r7
	str r0, [sp, #0x10]
	cmp sl, #0
	mov r1, sl
	beq _02223C38
_02223C10:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x10]
	bne _02223C38
	ldr r0, [sl]
	cmp r1, r0
	ldrne r1, [r1, #4]
	cmpne r1, #0
	bne _02223C10
_02223C38:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02223D14
	cmp sl, #0
	beq _02223C94
_02223C4C:
	ldr r0, [sl, #8]
	add r7, r7, #0x16
	bl FUN_0222334C
	add r0, r0, #0x29
	add r7, r7, r0
	ldr r0, [sl, #0x14]
	ldr r1, [sl, #0x10]
	cmp r0, #0
	ldr r0, [r8, #0x38]
	addne r7, r7, #0x4b
	ldr r0, [r0]
	add r2, r7, #2
	cmp sl, r0
	ldrne sl, [sl, #4]
	add r1, r2, r1
	add r7, r1, #2
	cmpne sl, #0
	bne _02223C4C
_02223C94:
	mov r0, #0x2c
	str r0, [sp]
	ldr r3, _022245F4 @ =0x02225F2C
	mov r0, r8
	mov r1, r6
	mov r2, r5
	add r7, r7, #0x18
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r0, #0x12
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	add r3, r8, #0x46
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	b _02223D7C
_02223D14:
	cmp sl, #0
	beq _02223D54
_02223D1C:
	ldr r0, [sl, #8]
	bl FUN_022249A0
	add r0, r7, r0
	add r7, r0, #1
	ldr r0, [sl, #0xc]
	bl FUN_022249A0
	add r7, r7, r0
	ldr r0, [r8, #0x38]
	ldr r0, [r0]
	cmp sl, r0
	ldrne sl, [sl, #4]
	addne r7, r7, #1
	cmpne sl, #0
	bne _02223D1C
_02223D54:
	mov r0, #0x31
	str r0, [sp]
	ldr r3, _022245F8 @ =0x02225F5C
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223D7C:
	mov r0, #0x10
	str r0, [sp]
	ldr r3, _022245FC @ =0x02225F90
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r1, r7
	mov r0, r4
	bl FUN_02224C18
	str r0, [sp, #0x34]
	cmp r0, #0
	beq _02223DE0
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223DE0:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223E08:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r8, #0x40]
	cmp r0, #1
	bne _02224188
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _02224048
	ldr r7, [r8, #0x38]
	cmp r7, #0
	beq _02223FF4
_02223E54:
	mov r0, #0x14
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	add r3, r8, #0x44
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r0, #0x26
	str r0, [sp]
	ldr r3, _02224600 @ =0x02224F8C
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r7, #8]
	bl FUN_0222334C
	cmp r0, #0
	beq _02223F00
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r7, #8]
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223F00:
	mov r0, #3
	str r0, [sp]
	ldr r3, _02224604 @ =0x02225FA4
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _02223F5C
	mov r0, #0x4b
	str r0, [sp]
	ldr r3, _02224608 @ =0x02224FB4
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223F5C:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _02223FB4
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	ldr r3, [r7, #0xc]
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02223FB4:
	mov r0, #2
	str r0, [sp]
	ldr r3, _022245E8 @ =0x02225F24
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r0, [r8, #0x38]
	ldr r0, [r0]
	cmp r7, r0
	ldrne r7, [r7, #4]
	cmpne r7, #0
	bne _02223E54
_02223FF4:
	mov r0, #0x14
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	add r3, r8, #0x44
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	mov r0, #4
	str r0, [sp]
	ldr r3, _0222460C @ =0x02225FA8
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	b _02224188
_02224048:
	ldr sl, [r8, #0x38]
	cmp sl, #0
	beq _02224188
_02224054:
	ldr r1, [sl, #8]
	mov r7, #0
	ldrsb r0, [r1]
	cmp r0, #0
	beq _022240B8
_02224068:
	ldrsb r1, [r1, r7]
	mov r0, r4
	bl FUN_02224A08
	str r0, [sp, #0x34]
	cmp r0, #0
	beq _022240A4
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_022240A4:
	add r7, r7, #1
	ldr r1, [sl, #8]
	ldrsb r0, [r1, r7]
	cmp r0, #0
	bne _02224068
_022240B8:
	mov r0, #1
	str r0, [sp]
	ldr r3, _02224610 @ =0x02225FB0
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr r1, [sl, #0xc]
	mov r7, #0
	ldrsb r0, [r1]
	cmp r0, #0
	beq _02224144
_022240F4:
	ldrsb r1, [r1, r7]
	mov r0, r4
	bl FUN_02224A08
	str r0, [sp, #0x34]
	cmp r0, #0
	beq _02224130
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
_02224130:
	add r7, r7, #1
	ldr r1, [sl, #0xc]
	ldrsb r0, [r1, r7]
	cmp r0, #0
	bne _022240F4
_02224144:
	ldr r0, [r8, #0x38]
	ldr r0, [r0]
	cmp sl, r0
	beq _02224188
	mov r0, #1
	str r0, [sp]
	ldr r3, _02224614 @ =0x02225FB4
	mov r0, r8
	mov r1, r6
	mov r2, r5
	bl FUN_02223424
	cmp r0, #0
	blt _02224890
	beq _022237A8
	ldr sl, [sl, #4]
	cmp sl, #0
	bne _02224054
_02224188:
	ldr r3, [sp, #0x38]
	cmp r3, #0
	ble _022241B8
	mov r0, #0
	str r0, [sp]
	ldr r2, _02224618 @ =0x02226C58
	mov r0, r8
	mov r1, r6
	bl FUN_02223270
	cmp r0, #0
	blt _02224890
	beq _022237A8
_022241B8:
	mov r0, #0
	str r0, [sb]
	strb r0, [sp, #0x40]
	strb r0, [sp, #0x41]
	mov r1, #7
	strb r0, [sp, #0x42]
	strb r0, [sp, #0x43]
	ldr r5, [sb, #0x1c]
	str r1, [sp, #4]
	str r0, [sp, #0x38]
	add sl, sb, #0x20
	add r4, sp, #0x40
_022241E8:
	ldr r1, [r8, #4]
	cmp r1, #0
	bne _02224890
	cmp r0, #0x400
	bge _02224230
	add r2, sl, r0
	mov r0, #0
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r3, #1
	bl FUN_02223224
	ldr r3, [sp, #0x38]
	add r1, sb, r3
	ldrsb r2, [r1, #0x20]
	and r1, r3, #3
	strb r2, [r4, r1]
	b _022242C4
_02224230:
	ldr r1, _0222461C @ =0x000001FF
	ands r7, r0, r1
	bne _02224290
	cmp r5, #0
	mov r0, #0x204
	mov r1, #4
	beq _02224264
	ldr r2, _02224620 @ =0x02226218
	ldr r2, [r2]
	blx r2
	str r0, [r5]
	mov r5, r0
	b _02224278
_02224264:
	ldr r2, _02224620 @ =0x02226218
	ldr r2, [r2]
	blx r2
	mov r5, r0
	str r5, [sb, #0x1c]
_02224278:
	cmp r5, #0
	moveq r0, #1
	streq r0, [sp, #4]
	beq _02224890
	mov r0, #0
	str r0, [r5]
_02224290:
	mov r0, #0
	add r2, r5, #4
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	add r2, r2, r7
	mov r3, #1
	bl FUN_02223224
	add r1, r5, r7
	ldrsb r2, [r1, #4]
	ldr r1, [sp, #0x38]
	and r1, r1, #3
	strb r2, [r4, r1]
_022242C4:
	cmp r0, #0
	movle r0, #0xa
	strle r0, [sp, #4]
	ble _02224890
	ldr r1, [sp, #0x38]
	add r0, r1, r0
	str r0, [sp, #0x38]
	sub r1, r0, #4
	and r1, r1, #3
	ldrsb r1, [r4, r1]
	cmp r1, #0xd
	bne _022241E8
	sub r1, r0, #3
	and r1, r1, #3
	ldrsb r1, [r4, r1]
	cmp r1, #0xa
	bne _022241E8
	sub r1, r0, #2
	and r1, r1, #3
	ldrsb r1, [r4, r1]
	cmp r1, #0xd
	bne _022241E8
	sub r1, r0, #1
	and r1, r1, #3
	ldrsb r1, [r4, r1]
	cmp r1, #0xa
	bne _022241E8
	str r0, [sb]
	ldr r0, [sb]
	cmp r0, #0
	beq _02224890
	ldr r1, _02224618 @ =0x02226C58
	mov r0, sb
	mov r2, #0
	mov r3, #0xe
	bl FUN_02222420
	cmp r0, #0
	beq _02224890
	ldr r0, _02224618 @ =0x02226C58
	ldr r1, _02224624 @ =0x02225FB8
	mov r2, #5
	bl FUN_022232E4
	cmp r0, #0
	ldreq r0, _02224618 @ =0x02226C58
	ldrsbeq r0, [r0, #8]
	cmpeq r0, #0x20
	bne _02224890
	ldr r0, _02224628 @ =0x02226C61
	mov r1, #3
	bl FUN_02224B80
	cmp r0, #0
	blt _02224890
	ldr r2, [sb]
	add r3, sp, #0x30
	mov r0, sb
	mov r1, #0xc
	bl FUN_02222210
	cmp r0, #0
	blt _02224890
	ldr r1, _0222462C @ =0x02225FC0
	add r2, sp, #0x34
	mov r0, sb
	bl FUN_02222E7C
	movs r5, r0
	moveq r0, #0
	streq r0, [sp, #4]
	beq _02224890
	cmp r5, #0x400
	bgt _02224890
	cmp r5, #0
	ble _02224418
	ldr r2, [sp, #0x34]
	ldr r1, _02224618 @ =0x02226C58
	mov r0, sb
	mov r3, r5
	bl FUN_02222420
	cmp r0, #0
	beq _02224890
	ldr r0, _02224618 @ =0x02226C58
	mov r1, r5
	bl FUN_02224B80
	movs r5, r0
	bmi _02224890
	str r5, [r8, #0x14]
	b _02224420
_02224418:
	mvn r0, #0
	str r0, [r8, #0x14]
_02224420:
	ldr r1, _02224630 @ =0x02225FD0
	add r2, sp, #0x34
	mov r0, sb
	bl FUN_02222E7C
	str r0, [sp, #8]
	cmp r0, #0
	beq _02224890
	bge _02224480
	ldr r0, _02224618 @ =0x02226C58
	mov r2, #0
	ldrsb r1, [r0, #5]
	ldrsb r3, [r0, #7]
	add r0, sp, #0x24
	strb r1, [sp, #0x24]
	mov r1, #2
	strb r3, [sp, #0x25]
	strb r2, [sp, #0x26]
	bl FUN_02224B80
	cmp r0, #0xb
	movge r0, #1
	strge r0, [sp, #8]
	movlt r0, #0
	strlt r0, [sp, #8]
	b _022244C0
_02224480:
	cmp r0, #0x400
	mov r0, #0
	strgt r0, [sp, #8]
	bgt _022244C0
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r3, _02224634 @ =0x02225FDC
	mov r0, sb
	add r2, r1, r2
	bl FUN_02222350
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #8]
	movne r0, #0
	strne r0, [sp, #8]
_022244C0:
	ldr r1, _02224638 @ =0x02225FE8
	add r2, sp, #0x34
	mov r0, sb
	bl FUN_02222E7C
	cmp r0, #0
	beq _02224890
	cmp r0, #0x400
	movgt r1, #0
	bgt _0222451C
	cmp r0, #0
	ble _02224518
	ldr r1, [sp, #0x34]
	ldr r3, _0222463C @ =0x02225FFC
	add r2, r1, r0
	mov r0, #0x3b
	str r0, [sp]
	mov r0, sb
	bl FUN_02222350
	cmp r0, #0
	moveq r1, #1
	movne r1, #0
	b _0222451C
_02224518:
	mov r1, #0
_0222451C:
	ldr r0, [r8, #0x40]
	cmp r0, #2
	beq _02224890
	cmp r5, #0
	blt _02224640
	mov r4, #0
	b _0222456C
_02224538:
	str r4, [sp]
	ldr r2, [sb, #4]
	mov r0, r8
	mov r1, r6
	mov r3, r5
	bl FUN_02222548
	cmp r0, #0
	blt _02224890
	beq _02224588
	ldr r1, [sb, #4]
	sub r5, r5, r0
	add r0, r1, r0
	str r0, [sb, #4]
_0222456C:
	cmp r5, #0
	ble _02224588
	ldr r1, [sb, #4]
	mov r0, sb
	bl FUN_0222250C
	cmp r0, #0
	beq _02224538
_02224588:
	cmp r5, #0
	beq _022245B4
	ldr r1, [sb, #4]
	mov r0, sb
	bl FUN_0222250C
	cmp r0, #0
	movne r0, #6
	strne r0, [sp, #4]
	moveq r0, #0xa
	streq r0, [sp, #4]
	b _02224890
_022245B4:
	mov r0, #0
	str r0, [sp, #4]
	b _02224890
	.align 2, 0
_022245C0: .4byte 0x02226C10
_022245C4: .4byte 0x02226224
_022245C8: .4byte 0x02226220
_022245CC: .4byte 0x0000CC8D
_022245D0: .4byte 0x02225EF4
_022245D4: .4byte 0x02225EFC
_022245D8: .4byte 0x02225F04
_022245DC: .4byte 0x02225F0C
_022245E0: .4byte 0x02225F10
_022245E4: .4byte 0x02225F1C
_022245E8: .4byte 0x02225F24
_022245EC: .4byte 0x02225F28
_022245F0: .4byte 0x0222621C
_022245F4: .4byte 0x02225F2C
_022245F8: .4byte 0x02225F5C
_022245FC: .4byte 0x02225F90
_02224600: .4byte 0x02224F8C
_02224604: .4byte 0x02225FA4
_02224608: .4byte 0x02224FB4
_0222460C: .4byte 0x02225FA8
_02224610: .4byte 0x02225FB0
_02224614: .4byte 0x02225FB4
_02224618: .4byte 0x02226C58
_0222461C: .4byte 0x000001FF
_02224620: .4byte 0x02226218
_02224624: .4byte 0x02225FB8
_02224628: .4byte 0x02226C61
_0222462C: .4byte 0x02225FC0
_02224630: .4byte 0x02225FD0
_02224634: .4byte 0x02225FDC
_02224638: .4byte 0x02225FE8
_0222463C: .4byte 0x02225FFC
_02224640:
	mov r0, #0xa
	cmp r1, #0
	str r0, [sp, #4]
	beq _022247E4
	mov r7, #0
	ldr r5, _02224618 @ =0x02226C58
	add r4, sp, #0x40
	mov sl, r7
_02224660:
	mov r0, #0
	strb r0, [sp, #0x40]
	strb r0, [sp, #0x41]
	str r0, [sp, #0x38]
_02224670:
	str r7, [sp]
	ldr r2, [sp, #0x38]
	mov r0, r8
	mov r1, r6
	mov r3, #1
	add r2, r5, r2
	bl FUN_02223224
	cmp r0, #0
	blt _02224890
	ldr r1, [sp, #0x38]
	ldrsb r0, [r5, r1]
	and r2, r1, #1
	strb r0, [r4, r2]
	cmp r0, #0x3b
	beq _022246C8
	cmp r0, #0xa
	bne _02224710
	sub r2, r1, #1
	and r2, r2, #1
	ldrsb r2, [r4, r2]
	cmp r2, #0xd
	bne _02224710
_022246C8:
	cmp r0, #0xa
	subeq r0, r1, #1
	streq r0, [sp, #0x34]
	beq _022246F0
	str r1, [sp, #0x34]
	mov r0, r8
	mov r1, r6
	bl FUN_022234D8
	cmp r0, #0
	ble _02224890
_022246F0:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _02224890
	mov r0, r5
	bl FUN_02224A98
	movs fp, r0
	bmi _02224890
	b _02224724
_02224710:
	ldr r0, [sp, #0x38]
	add r0, r0, #1
	str r0, [sp, #0x38]
	cmp r0, #0x400
	blt _02224670
_02224724:
	ldr r0, [sp, #0x38]
	cmp r0, #0x400
	moveq r0, #7
	streq r0, [sp, #4]
	beq _02224890
	cmp fp, #0
	ble _022247CC
	ble _02224660
_02224744:
	str sl, [sp]
	mov r0, r8
	mov r1, r6
	ldr r2, [sb, #4]
	mov r3, fp
	bl FUN_02222548
	cmp r0, #0
	ble _02224890
	ldr r1, [sb, #4]
	subs fp, fp, r0
	add r0, r1, r0
	str r0, [sb, #4]
	bne _022247C0
	mov r0, #0
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, #1
	bl FUN_02223224
	cmp r0, #0
	ble _02224890
	mov r0, #0
	str r0, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, #1
	bl FUN_02223224
	cmp r0, #0
	ble _02224890
_022247C0:
	cmp fp, #0
	bgt _02224744
	b _02224660
_022247CC:
	mov r0, r8
	mov r1, r6
	bl FUN_022234D8
	mov r0, #0
	str r0, [sp, #4]
	b _02224890
_022247E4:
	ldr r1, [sb, #4]
	mov r0, sb
	bl FUN_0222250C
	cmp r0, #0
	bne _02224890
	mov r5, #0
	ldr r4, _02224618 @ =0x02226C58
	mov sl, #1
	mov r7, r5
_02224808:
	mov r0, r8
	mov r1, r6
	ldr r2, [sb, #4]
	mov r3, r7
	bl FUN_02222520
	cmp r0, #0
	blt _02224890
	moveq r0, #0
	streq r0, [sp, #4]
	beq _02224890
	ldr r1, [sb, #4]
	add r0, r1, r0
	str r0, [sb, #4]
	mov r0, sb
	ldr r1, [sb, #4]
	bl FUN_0222250C
	cmp r0, #0
	beq _0222487C
	str r5, [sp]
	mov r0, r8
	mov r1, r6
	mov r2, r4
	mov r3, sl
	bl FUN_02223224
	cmp r0, #0
	blt _02224890
	movne r0, #6
	strne r0, [sp, #4]
	bne _02224890
_0222487C:
	mov r0, sb
	ldr r1, [sb, #4]
	bl FUN_0222250C
	cmp r0, #0
	beq _02224808
_02224890:
	bl FUN_02222038
	ldr r0, _022245C8 @ =0x02226220
	ldr r1, _022245F0 @ =0x0222621C
	ldr r0, [r0]
	ldr r1, [r1]
	blx r1
	ldr r0, _022245C8 @ =0x02226220
	mov r1, #0
	str r1, [r0]
	bl FUN_0222204C
	ldr r0, [r8, #4]
	cmp r0, #0
	movne r0, #8
	strne r0, [sp, #4]
	cmp r6, #0
	blt _02224918
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022248E8
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02224918
_022248E8:
	mov r0, r8
	mov r1, r6
	bl FUN_0222315C
	cmp r0, #0
	movlt r0, #0xa
	strlt r0, [sp, #4]
	add r1, sp, #0x3c
	mov r0, r6
	bl FUN_022235A0
	mov r0, #0
	mvn r6, #0
	str r0, [sp, #8]
_02224918:
	ldr r0, [sp, #4]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sb, #8]
	beq _02224940
	mov r0, #0
	str r0, [sb, #8]
	ldr r1, _0222499C @ =0x02226214
	ldr r0, [sp, #4]
	str r0, [r1]
_02224940:
	ldr r4, [r8, #0x2c]
	mov r0, r8
	ldr r5, [r8, #0x3c]
	bl FUN_02222B98
	ldr r0, [sp, #4]
	mov r1, sb
	mov r2, r4
	blx r5
_02224960:
	ldr r0, _022245C4 @ =0x02226224
	ldr r0, [r0]
	cmp r0, #0
	beq _022236E4
_02224970:
	cmp r6, #0
	blt _02224990
	mov r0, r8
	mov r1, r6
	bl FUN_0222315C
	add r1, sp, #0x3c
	mov r0, r6
	bl FUN_022235A0
_02224990:
	bl FUN_02223640
	add sp, sp, #0x4c
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0222499C: .4byte 0x02226214
	arm_func_end FUN_022236A0

	arm_func_start FUN_022249A0
FUN_022249A0: @ 0x022249A0
	ldrsb r2, [r0], #1
	mov r1, #0
	cmp r2, #0
	beq _02224A00
_022249B0:
	cmp r2, #0x30
	blt _022249C0
	cmp r2, #0x39
	ble _022249E8
_022249C0:
	cmp r2, #0x41
	blt _022249D0
	cmp r2, #0x5a
	ble _022249E8
_022249D0:
	cmp r2, #0x61
	blt _022249E0
	cmp r2, #0x7a
	ble _022249E8
_022249E0:
	cmp r2, #0x20
	bne _022249F0
_022249E8:
	add r1, r1, #1
	b _022249F4
_022249F0:
	add r1, r1, #3
_022249F4:
	ldrsb r2, [r0], #1
	cmp r2, #0
	bne _022249B0
_02224A00:
	mov r0, r1
	bx lr
	arm_func_end FUN_022249A0

	arm_func_start FUN_02224A08
FUN_02224A08: @ 0x02224A08
	cmp r1, #0x20
	bne _02224A20
	mov r1, #0x2b
	strb r1, [r0]
	mov r0, #1
	bx lr
_02224A20:
	cmp r1, #0x30
	blt _02224A30
	cmp r1, #0x39
	ble _02224A50
_02224A30:
	cmp r1, #0x41
	blt _02224A40
	cmp r1, #0x5a
	ble _02224A50
_02224A40:
	cmp r1, #0x61
	blt _02224A5C
	cmp r1, #0x7a
	bgt _02224A5C
_02224A50:
	strb r1, [r0]
	mov r0, #1
	bx lr
_02224A5C:
	asr r2, r1, #4
	and r3, r2, #0xf
	mov r2, #0x25
	strb r2, [r0]
	cmp r3, #0xa
	addlt r2, r3, #0x30
	addge r2, r3, #0x37
	and r1, r1, #0xf
	cmp r1, #0xa
	addlt r1, r1, #0x30
	strb r2, [r0, #1]
	addge r1, r1, #0x37
	strb r1, [r0, #2]
	mov r0, #3
	bx lr
	arm_func_end FUN_02224A08

	arm_func_start FUN_02224A98
FUN_02224A98: @ 0x02224A98
	push {r4, r5, r6, r7, r8, lr}
	cmp r1, #8
	mvngt r0, #0
	popgt {r4, r5, r6, r7, r8, pc}
	bne _02224ABC
	ldrsb r2, [r0]
	cmp r2, #0x37
	mvngt r0, #0
	popgt {r4, r5, r6, r7, r8, pc}
_02224ABC:
	mov r5, #0
	mov r6, r5
	mov r7, r5
	cmp r1, #0
	ble _02224B78
	mov lr, #1
	mov r3, lr
	mov ip, lr
	mov r4, r5
_02224AE0:
	ldrsb r8, [r0, r5]
	mov r2, r4
	cmp r8, #0x41
	blt _02224AF8
	cmp r8, #0x5a
	movle r2, lr
_02224AF8:
	cmp r2, #0
	addne r8, r8, #0x20
	lsl r2, r8, #0x18
	asr r2, r2, #0x18
	cmp r2, #0x30
	blt _02224B28
	cmp r2, #0x39
	bgt _02224B28
	add r2, r2, r6, lsl #4
	mov r7, ip
	sub r6, r2, #0x30
	b _02224B6C
_02224B28:
	cmp r2, #0x61
	blt _02224B48
	cmp r2, #0x66
	bgt _02224B48
	add r2, r2, r6, lsl #4
	mov r7, r3
	sub r6, r2, #0x57
	b _02224B6C
_02224B48:
	cmp r7, #0
	beq _02224B5C
	cmp r2, #0x20
	cmpne r2, #0
	beq _02224B78
_02224B5C:
	cmp r7, #0
	cmpeq r2, #0x20
	mvnne r0, #0
	popne {r4, r5, r6, r7, r8, pc}
_02224B6C:
	add r5, r5, #1
	cmp r5, r1
	blt _02224AE0
_02224B78:
	mov r0, r6
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end FUN_02224A98

	arm_func_start FUN_02224B80
FUN_02224B80: @ 0x02224B80
	push {r3, r4, r5, lr}
	cmp r1, #0xa
	mvngt r0, #0
	popgt {r3, r4, r5, pc}
	mov lr, #0
	mov r4, lr
	mov r3, lr
	cmp r1, #0
	ble _02224C10
	mov ip, #1
	mov r2, #0xa
_02224BAC:
	cmp r3, #0
	ldrsb r5, [r0, lr]
	beq _02224BC4
	cmp r5, #0x20
	cmpne r5, #0
	beq _02224C10
_02224BC4:
	cmp r3, #0
	cmpeq r5, #0x20
	beq _02224C04
	cmp r5, #0x30
	blt _02224BE0
	cmp r5, #0x39
	ble _02224BE8
_02224BE0:
	mvn r0, #0
	pop {r3, r4, r5, pc}
_02224BE8:
	mla r3, r4, r2, r5
	mov r5, r4
	sub r4, r3, #0x30
	cmp r5, r4
	mov r3, ip
	mvngt r0, #0
	popgt {r3, r4, r5, pc}
_02224C04:
	add lr, lr, #1
	cmp lr, r1
	blt _02224BAC
_02224C10:
	mov r0, r4
	pop {r3, r4, r5, pc}
	arm_func_end FUN_02224B80

	arm_func_start FUN_02224C18
FUN_02224C18: @ 0x02224C18
	push {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	ldr r6, _02224CD0 @ =0x02225000
	add r4, sp, #0
	mov sl, r0
	mov sb, r1
	ldm r6!, {r0, r1, r2, r3}
	mov r5, r4
	stm r4!, {r0, r1, r2, r3}
	ldm r6!, {r0, r1, r2, r3}
	stm r4!, {r0, r1, r2, r3}
	ldr r0, [r6]
	mov r7, #0
	str r0, [r4]
	mov r6, r7
	mov r1, r7
	mov fp, #1
	mov r4, #0x30
_02224C60:
	ldr r8, [r5, r6, lsl #2]
	cmp sb, r8
	blo _02224C98
	mov r0, sb
	mov r1, r8
	bl FUN_020F2BA4
	mul r2, r0, r8
	cmp sl, #0
	addne r0, r0, #0x30
	strbne r0, [sl, r7]
	mov r1, fp
	sub sb, sb, r2
	add r7, r7, #1
	b _02224CAC
_02224C98:
	cmp r1, #0
	beq _02224CAC
	cmp sl, #0
	strbne r4, [sl, r7]
	add r7, r7, #1
_02224CAC:
	add r6, r6, #1
	cmp r6, #9
	blt _02224C60
	cmp sl, #0
	addne r0, sb, #0x30
	strbne r0, [sl, r7]
	add r0, r7, #1
	add sp, sp, #0x24
	pop {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02224CD0: .4byte 0x02225000
	arm_func_end FUN_02224C18

	arm_func_start FUN_02224CD4
FUN_02224CD4: @ 0x02224CD4
	push {r4, r5, r6, lr}
	mov ip, #1
	mov r3, #0
	mov r2, ip
	mov lr, r3
	b _02224D04
_02224CEC:
	cmp r5, #0
	cmpne r5, #0x20
	moveq r0, #0
	popeq {r4, r5, r6, pc}
	add r0, r0, #1
	add r1, r1, #1
_02224D04:
	ldrsb r6, [r1]
	mov r4, lr
	cmp r6, #0x41
	blt _02224D1C
	cmp r6, #0x5a
	movle r4, ip
_02224D1C:
	ldrsb r5, [r0]
	cmp r4, #0
	addne r6, r6, #0x20
	mov r4, r3
	cmp r5, #0x41
	blt _02224D3C
	cmp r5, #0x5a
	movle r4, r2
_02224D3C:
	cmp r4, #0
	addne r4, r5, #0x20
	moveq r4, r5
	cmp r4, r6
	beq _02224CEC
	mvn r0, #0
	pop {r4, r5, r6, pc}
	arm_func_end FUN_02224CD4

	arm_func_start FUN_02224D58
FUN_02224D58: @ 0x02224D58
	push {r3, lr}
	mov ip, #0
	cmp r1, #0
	mov lr, ip
	sub r1, r1, #1
	beq _02224DB8
	mov r2, #0xa
_02224D74:
	ldrsb r3, [r0]
	cmp r3, #0x20
	beq _02224DA8
	cmp r3, #0x30
	blt _02224DA8
	cmp r3, #0x39
	bgt _02224DA8
	mla r3, lr, r2, r3
	add ip, ip, #1
	cmp ip, #9
	sub lr, r3, #0x30
	mvngt r0, #0
	popgt {r3, pc}
_02224DA8:
	cmp r1, #0
	add r0, r0, #1
	sub r1, r1, #1
	bne _02224D74
_02224DB8:
	cmp ip, #0
	mvneq lr, #0
	mov r0, lr
	pop {r3, pc}
	arm_func_end FUN_02224D58

	arm_func_start FUN_02224DC8
FUN_02224DC8: @ 0x02224DC8
	push {r4, r5, r6, r7, r8, lr}
	cmp r1, r3
	mvnlt r0, #0
	poplt {r4, r5, r6, r7, r8, pc}
	sub r1, r1, r3
	add r8, r1, #1
	cmp r8, #0
	mov r4, #0
	ble _02224E44
	ldrsb r7, [r2]
	mov lr, #1
_02224DF4:
	ldrsb r1, [r0, r4]
	cmp r7, r1
	bne _02224E38
	mov r5, lr
	cmp r3, #1
	add r6, r0, r4
	ble _02224E2C
_02224E10:
	ldrsb ip, [r6, r5]
	ldrsb r1, [r2, r5]
	cmp ip, r1
	bne _02224E2C
	add r5, r5, #1
	cmp r5, r3
	blt _02224E10
_02224E2C:
	cmp r5, r3
	moveq r0, #0
	popeq {r4, r5, r6, r7, r8, pc}
_02224E38:
	add r4, r4, #1
	cmp r4, r8
	blt _02224DF4
_02224E44:
	mvn r0, #0
	pop {r4, r5, r6, r7, r8, pc}
	arm_func_end FUN_02224DC8

	.rodata

_02224E4C:
	.byte 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x00, 0x00, 0x00, 0x00
	.byte 0x25, 0x30, 0x30, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x32, 0x31, 0x34, 0x37
	.byte 0x34, 0x38, 0x33, 0x36, 0x34, 0x37, 0x00, 0x00, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48
	.byte 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58
	.byte 0x59, 0x5A, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E
	.byte 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x2E, 0x2D, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0x3A, 0x30
	.byte 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x2D, 0x30, 0x30, 0x00, 0x00, 0x00, 0x62, 0x47, 0x6C, 0x7A
	.byte 0x64, 0x41, 0x2A, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x59, 0x32, 0x39, 0x31, 0x62, 0x6E, 0x51, 0x2A
	.byte 0x00, 0x00, 0x00, 0x00, 0x59, 0x32, 0x39, 0x75, 0x64, 0x47, 0x56, 0x75, 0x64, 0x48, 0x4D, 0x2A
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x6F, 0xF2, 0x86, 0x23, 0x00, 0x00, 0x80, 0xC6, 0xA4
	.byte 0x7E, 0x8D, 0x03, 0x00, 0x00, 0x40, 0x7A, 0x10, 0xF3, 0x5A, 0x00, 0x00, 0x00, 0xA0, 0x72, 0x4E
	.byte 0x18, 0x09, 0x00, 0x00, 0x00, 0x10, 0xA5, 0xD4, 0xE8, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x76, 0x48
	.byte 0x17, 0x00, 0x00, 0x00, 0x00, 0xE4, 0x0B, 0x54, 0x02, 0x00, 0x00, 0x00, 0x00, 0xCA, 0x9A, 0x3B
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE1, 0xF5, 0x05, 0x00, 0x00, 0x00, 0x00, 0x80, 0x96, 0x98, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x42, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x86, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2D, 0x2D, 0x74, 0x39, 0x53, 0x66, 0x34, 0x79, 0x66, 0x6A, 0x66, 0x31
	.byte 0x52, 0x74, 0x76, 0x44, 0x75, 0x33, 0x41, 0x41, 0x00, 0x00, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x44, 0x69, 0x73, 0x70, 0x6F, 0x73, 0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3A
	.byte 0x20, 0x66, 0x6F, 0x72, 0x6D, 0x2D, 0x64, 0x61, 0x74, 0x61, 0x3B, 0x20, 0x6E, 0x61, 0x6D, 0x65
	.byte 0x3D, 0x22, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x79, 0x70, 0x65
	.byte 0x3A, 0x20, 0x61, 0x70, 0x70, 0x6C, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2F, 0x6F, 0x63
	.byte 0x74, 0x65, 0x74, 0x2D, 0x73, 0x74, 0x72, 0x65, 0x61, 0x6D, 0x0D, 0x0A, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x2D, 0x45, 0x6E, 0x63
	.byte 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3A, 0x20, 0x62, 0x69, 0x6E, 0x61, 0x72, 0x79, 0x0D, 0x0A, 0x00
	.byte 0x00, 0xCA, 0x9A, 0x3B, 0x00, 0xE1, 0xF5, 0x05, 0x80, 0x96, 0x98, 0x00, 0x40, 0x42, 0x0F, 0x00
	.byte 0xA0, 0x86, 0x01, 0x00, 0x10, 0x27, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00

	.data

_02225040:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x73, 0x41, 0x64, 0x65, 0x71, 0x57, 0x6F, 0x33, 0x76, 0x6F, 0x4C, 0x65
	.byte 0x43, 0x35, 0x72, 0x31, 0x36, 0x44, 0x59, 0x76, 0x00, 0x00, 0x00, 0x00, 0x26, 0x68, 0x61, 0x73
	.byte 0x68, 0x3D, 0x00, 0x00, 0x26, 0x64, 0x61, 0x74, 0x61, 0x3D, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x63, 0x68, 0x65, 0x63, 0x6B, 0x20, 0x73, 0x75, 0x6D, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x70, 0x69, 0x64, 0x20, 0x20
	.byte 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x64, 0x61, 0x74, 0x61, 0x20, 0x6C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x74, 0x6F, 0x6B, 0x65, 0x6E
	.byte 0x20, 0x6E, 0x6F, 0x74, 0x20, 0x66, 0x6F, 0x75, 0x6E, 0x64, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F
	.byte 0x72, 0x3A, 0x20, 0x74, 0x6F, 0x6B, 0x65, 0x6E, 0x20, 0x65, 0x78, 0x70, 0x69, 0x72, 0x65, 0x64
	.byte 0x20, 0x20, 0x00, 0x00, 0x65, 0x72, 0x72, 0x6F, 0x72, 0x3A, 0x20, 0x69, 0x6E, 0x63, 0x6F, 0x72
	.byte 0x72, 0x65, 0x63, 0x74, 0x20, 0x68, 0x61, 0x73, 0x68, 0x20, 0x00, 0x00, 0x25, 0x73, 0x3F, 0x70
	.byte 0x69, 0x64, 0x3D, 0x25, 0x64, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x46, 0x72, 0x65, 0x65, 0x42
	.byte 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x49, 0x6E, 0x69, 0x74, 0x42
	.byte 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x52, 0x65, 0x73, 0x65, 0x74
	.byte 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x67, 0x68, 0x69, 0x52, 0x65, 0x73, 0x69, 0x7A
	.byte 0x65, 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x67, 0x68, 0x69, 0x49, 0x6E, 0x69, 0x74, 0x46
	.byte 0x69, 0x78, 0x65, 0x64, 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x67, 0x68, 0x69, 0x41
	.byte 0x70, 0x70, 0x65, 0x6E, 0x64, 0x43, 0x68, 0x61, 0x72, 0x54, 0x6F, 0x42, 0x75, 0x66, 0x66, 0x65
	.byte 0x72, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x41, 0x70, 0x70, 0x65, 0x6E, 0x64, 0x44, 0x61, 0x74
	.byte 0x61, 0x54, 0x6F, 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x52
	.byte 0x65, 0x61, 0x64, 0x44, 0x61, 0x74, 0x61, 0x46, 0x72, 0x6F, 0x6D, 0x42, 0x75, 0x66, 0x66, 0x65
	.byte 0x72, 0x00, 0x00, 0x00, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x67, 0x68, 0x74, 0x74
	.byte 0x70, 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x2E, 0x63, 0x00, 0x00, 0x00, 0x73, 0x69, 0x7A, 0x65
	.byte 0x49, 0x6E, 0x63, 0x72, 0x65, 0x6D, 0x65, 0x6E, 0x74, 0x20, 0x3E, 0x20, 0x30, 0x00, 0x00, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x69, 0x6E, 0x69, 0x74
	.byte 0x69, 0x61, 0x6C, 0x53, 0x69, 0x7A, 0x65, 0x20, 0x3E, 0x20, 0x30, 0x00, 0x75, 0x73, 0x65, 0x72
	.byte 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x73, 0x69, 0x7A, 0x65, 0x20, 0x3E, 0x20, 0x30
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x61, 0x74, 0x61, 0x00, 0x00, 0x00, 0x00, 0x64, 0x61, 0x74, 0x61
	.byte 0x4C, 0x65, 0x6E, 0x20, 0x3E, 0x3D, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x65, 0x6E, 0x63, 0x72, 0x79, 0x70, 0x74, 0x6F
	.byte 0x72, 0x2E, 0x6D, 0x45, 0x6E, 0x67, 0x69, 0x6E, 0x65, 0x20, 0x21, 0x3D, 0x20, 0x47, 0x48, 0x54
	.byte 0x54, 0x50, 0x45, 0x6E, 0x63, 0x72, 0x79, 0x70, 0x74, 0x69, 0x6F, 0x6E, 0x45, 0x6E, 0x67, 0x69
	.byte 0x6E, 0x65, 0x5F, 0x4E, 0x6F, 0x6E, 0x65, 0x00, 0x3A, 0x20, 0x00, 0x00, 0x0D, 0x0A, 0x00, 0x00
	.byte 0x25, 0x64, 0x00, 0x00, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x49, 0x6E, 0x20, 0x21, 0x3D, 0x20
	.byte 0x4E, 0x55, 0x4C, 0x4C, 0x00, 0x00, 0x00, 0x00, 0x6C, 0x65, 0x6E, 0x20, 0x21, 0x3D, 0x20, 0x4E
	.byte 0x55, 0x4C, 0x4C, 0x00, 0x67, 0x68, 0x69, 0x43, 0x61, 0x6C, 0x6C, 0x50, 0x6F, 0x73, 0x74, 0x43
	.byte 0x61, 0x6C, 0x6C, 0x62, 0x61, 0x63, 0x6B, 0x00, 0x67, 0x68, 0x69, 0x43, 0x61, 0x6C, 0x6C, 0x50
	.byte 0x72, 0x6F, 0x67, 0x72, 0x65, 0x73, 0x73, 0x43, 0x61, 0x6C, 0x6C, 0x62, 0x61, 0x63, 0x6B, 0x00
	.byte 0x67, 0x68, 0x69, 0x43, 0x61, 0x6C, 0x6C, 0x43, 0x6F, 0x6D, 0x70, 0x6C, 0x65, 0x74, 0x65, 0x64
	.byte 0x43, 0x61, 0x6C, 0x6C, 0x62, 0x61, 0x63, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x67, 0x68, 0x74, 0x74, 0x70, 0x43, 0x61, 0x6C
	.byte 0x6C, 0x62, 0x61, 0x63, 0x6B, 0x73, 0x2E, 0x63, 0x00, 0x00, 0x00, 0x00, 0xFA, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x46, 0x69, 0x6E, 0x64, 0x46, 0x72, 0x65, 0x65, 0x53
	.byte 0x6C, 0x6F, 0x74, 0x00, 0x67, 0x68, 0x69, 0x46, 0x72, 0x65, 0x65, 0x43, 0x6F, 0x6E, 0x6E, 0x65
	.byte 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x52, 0x65, 0x64, 0x69, 0x72
	.byte 0x65, 0x63, 0x74, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x54, 0x6F, 0x43, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x67, 0x68, 0x69, 0x4E, 0x75, 0x6D, 0x43, 0x6F
	.byte 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x73, 0x20, 0x3D, 0x3D, 0x20, 0x67, 0x68, 0x69
	.byte 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x73, 0x4C, 0x65, 0x6E, 0x00, 0x00
	.byte 0x67, 0x68, 0x74, 0x74, 0x70, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2E
	.byte 0x63, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x72, 0x65, 0x71, 0x75
	.byte 0x65, 0x73, 0x74, 0x20, 0x3E, 0x3D, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x72, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20
	.byte 0x3C, 0x20, 0x67, 0x68, 0x69, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x73
	.byte 0x4C, 0x65, 0x6E, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E
	.byte 0x69, 0x6E, 0x55, 0x73, 0x65, 0x00, 0x00, 0x00, 0x72, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20
	.byte 0x3E, 0x3D, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00, 0x72, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20
	.byte 0x3C, 0x20, 0x67, 0x68, 0x69, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x73
	.byte 0x4C, 0x65, 0x6E, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E
	.byte 0x72, 0x65, 0x64, 0x69, 0x72, 0x65, 0x63, 0x74, 0x55, 0x52, 0x4C, 0x00, 0x67, 0x68, 0x74, 0x74
	.byte 0x70, 0x47, 0x65, 0x74, 0x45, 0x78, 0x41, 0x00, 0x67, 0x68, 0x69, 0x50, 0x72, 0x6F, 0x63, 0x65
	.byte 0x73, 0x73, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x00, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x67, 0x68, 0x74, 0x74
	.byte 0x70, 0x4D, 0x61, 0x69, 0x6E, 0x2E, 0x63, 0x00, 0x67, 0x68, 0x69, 0x52, 0x65, 0x71, 0x75, 0x65
	.byte 0x73, 0x74, 0x54, 0x6F, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x28, 0x63
	.byte 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x72, 0x65, 0x71, 0x75, 0x65
	.byte 0x73, 0x74, 0x29, 0x20, 0x3D, 0x3D, 0x20, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F
	.byte 0x6E, 0x00, 0x00, 0x00, 0x55, 0x52, 0x4C, 0x20, 0x26, 0x26, 0x20, 0x55, 0x52, 0x4C, 0x5B, 0x30
	.byte 0x5D, 0x00, 0x00, 0x00, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x53, 0x69, 0x7A, 0x65, 0x20, 0x3E
	.byte 0x3D, 0x20, 0x30, 0x00, 0x21, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x20, 0x7C, 0x7C, 0x20, 0x62
	.byte 0x75, 0x66, 0x66, 0x65, 0x72, 0x53, 0x69, 0x7A, 0x65, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50
	.byte 0x6F, 0x73, 0x74, 0x49, 0x6E, 0x69, 0x74, 0x53, 0x74, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67
	.byte 0x00, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x53, 0x74, 0x61, 0x74, 0x65
	.byte 0x49, 0x6E, 0x69, 0x74, 0x00, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x53
	.byte 0x74, 0x61, 0x74, 0x65, 0x43, 0x6C, 0x65, 0x61, 0x6E, 0x75, 0x70, 0x00, 0x67, 0x68, 0x69, 0x50
	.byte 0x6F, 0x73, 0x74, 0x53, 0x74, 0x61, 0x74, 0x65, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E
	.byte 0x67, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x47, 0x65, 0x74, 0x43, 0x6F
	.byte 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x54, 0x79, 0x70, 0x65, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50
	.byte 0x6F, 0x73, 0x74, 0x47, 0x65, 0x74, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x4C, 0x65, 0x6E
	.byte 0x67, 0x74, 0x68, 0x00, 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x53, 0x74, 0x72, 0x69, 0x6E
	.byte 0x67, 0x53, 0x74, 0x61, 0x74, 0x65, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x46, 0x69, 0x6C, 0x65, 0x44, 0x69, 0x73, 0x6B, 0x53
	.byte 0x74, 0x61, 0x74, 0x65, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x00, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x47, 0x65, 0x74, 0x4E, 0x6F, 0x46, 0x69, 0x6C, 0x65
	.byte 0x73, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x46, 0x69, 0x6C, 0x65, 0x4D, 0x65, 0x6D, 0x6F, 0x72
	.byte 0x79, 0x53, 0x74, 0x61, 0x74, 0x65, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x6F, 0x73, 0x74, 0x47, 0x65, 0x74, 0x48, 0x61, 0x73, 0x46, 0x69, 0x6C
	.byte 0x65, 0x73, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x67, 0x68, 0x74, 0x74, 0x70, 0x50, 0x6F, 0x73, 0x74, 0x2E, 0x63, 0x00
	.byte 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F, 0x70
	.byte 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46
	.byte 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56
	.byte 0x57, 0x58, 0x59, 0x5A, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x5F, 0x40
	.byte 0x2D, 0x2E, 0x2A, 0x00, 0x70, 0x6F, 0x73, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x6D, 0x75, 0x6C, 0x74, 0x69, 0x70, 0x61, 0x72, 0x74, 0x2F, 0x66, 0x6F, 0x72, 0x6D, 0x2D, 0x64
	.byte 0x61, 0x74, 0x61, 0x3B, 0x20, 0x62, 0x6F, 0x75, 0x6E, 0x64, 0x61, 0x72, 0x79, 0x3D, 0x51, 0x72
	.byte 0x34, 0x47, 0x38, 0x32, 0x33, 0x73, 0x32, 0x33, 0x64, 0x2D, 0x2D, 0x2D, 0x3C, 0x3C, 0x3E, 0x3C
	.byte 0x3E, 0x3C, 0x3C, 0x3C, 0x3E, 0x2D, 0x2D, 0x37, 0x64, 0x31, 0x31, 0x38, 0x65, 0x30, 0x35, 0x33
	.byte 0x36, 0x00, 0x00, 0x00, 0x61, 0x70, 0x70, 0x6C, 0x69, 0x63, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2F
	.byte 0x78, 0x2D, 0x77, 0x77, 0x77, 0x2D, 0x66, 0x6F, 0x72, 0x6D, 0x2D, 0x75, 0x72, 0x6C, 0x65, 0x6E
	.byte 0x63, 0x6F, 0x64, 0x65, 0x64, 0x00, 0x00, 0x00, 0x64, 0x61, 0x74, 0x61, 0x2D, 0x3E, 0x74, 0x79
	.byte 0x70, 0x65, 0x20, 0x3D, 0x3D, 0x20, 0x47, 0x48, 0x49, 0x53, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x00
	.byte 0x2D, 0x2D, 0x51, 0x72, 0x34, 0x47, 0x38, 0x32, 0x33, 0x73, 0x32, 0x33, 0x64, 0x2D, 0x2D, 0x2D
	.byte 0x3C, 0x3C, 0x3E, 0x3C, 0x3E, 0x3C, 0x3C, 0x3C, 0x3E, 0x2D, 0x2D, 0x37, 0x64, 0x31, 0x31, 0x38
	.byte 0x65, 0x30, 0x35, 0x33, 0x36, 0x00, 0x00, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74
	.byte 0x00, 0x00, 0x00, 0x00, 0x41, 0x72, 0x72, 0x61, 0x79, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x28
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74
	.byte 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61, 0x29, 0x20, 0x3D, 0x3D, 0x20, 0x41, 0x72, 0x72, 0x61, 0x79
	.byte 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x28, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F
	.byte 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2E
	.byte 0x73, 0x74, 0x61, 0x74, 0x65, 0x73, 0x29, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x70
	.byte 0x6F, 0x73, 0x20, 0x3E, 0x3D, 0x20, 0x30, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x70
	.byte 0x6F, 0x73, 0x20, 0x3C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61
	.byte 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61, 0x2E, 0x73, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x2E, 0x6C, 0x65
	.byte 0x6E, 0x00, 0x00, 0x00, 0x28, 0x63, 0x20, 0x2F, 0x20, 0x31, 0x36, 0x29, 0x20, 0x3C, 0x20, 0x31
	.byte 0x36, 0x00, 0x00, 0x00, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42
	.byte 0x43, 0x44, 0x45, 0x46, 0x00, 0x00, 0x00, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x70
	.byte 0x6F, 0x73, 0x20, 0x3C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x73, 0x74, 0x61, 0x74
	.byte 0x65, 0x2E, 0x66, 0x69, 0x6C, 0x65, 0x44, 0x69, 0x73, 0x6B, 0x2E, 0x6C, 0x65, 0x6E, 0x00, 0x00
	.byte 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x20, 0x3D, 0x3D, 0x20, 0x28, 0x69
	.byte 0x6E, 0x74, 0x29, 0x66, 0x74, 0x65, 0x6C, 0x6C, 0x28, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E
	.byte 0x73, 0x74, 0x61, 0x74, 0x65, 0x2E, 0x66, 0x69, 0x6C, 0x65, 0x44, 0x69, 0x73, 0x6B, 0x2E, 0x66
	.byte 0x69, 0x6C, 0x65, 0x29, 0x00, 0x00, 0x00, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x70
	.byte 0x6F, 0x73, 0x20, 0x3C, 0x20, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61
	.byte 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61, 0x2E, 0x66, 0x69, 0x6C, 0x65, 0x4D, 0x65, 0x6D, 0x6F, 0x72
	.byte 0x79, 0x2E, 0x6C, 0x65, 0x6E, 0x00, 0x00, 0x00, 0x73, 0x74, 0x61, 0x74, 0x65, 0x2D, 0x3E, 0x64
	.byte 0x61, 0x74, 0x61, 0x2D, 0x3E, 0x74, 0x79, 0x70, 0x65, 0x20, 0x3D, 0x3D, 0x20, 0x47, 0x48, 0x49
	.byte 0x53, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x00, 0x00, 0x25, 0x73, 0x3D, 0x00, 0x26, 0x25, 0x73, 0x3D
	.byte 0x00, 0x00, 0x00, 0x00, 0x2D, 0x2D, 0x51, 0x72, 0x34, 0x47, 0x38, 0x32, 0x33, 0x73, 0x32, 0x33
	.byte 0x64, 0x2D, 0x2D, 0x2D, 0x3C, 0x3C, 0x3E, 0x3C, 0x3E, 0x3C, 0x3C, 0x3C, 0x3E, 0x2D, 0x2D, 0x37
	.byte 0x64, 0x31, 0x31, 0x38, 0x65, 0x30, 0x35, 0x33, 0x36, 0x0D, 0x0A, 0x00, 0x0D, 0x0A, 0x2D, 0x2D
	.byte 0x51, 0x72, 0x34, 0x47, 0x38, 0x32, 0x33, 0x73, 0x32, 0x33, 0x64, 0x2D, 0x2D, 0x2D, 0x3C, 0x3C
	.byte 0x3E, 0x3C, 0x3E, 0x3C, 0x3C, 0x3C, 0x3E, 0x2D, 0x2D, 0x37, 0x64, 0x31, 0x31, 0x38, 0x65, 0x30
	.byte 0x35, 0x33, 0x36, 0x0D, 0x0A, 0x00, 0x00, 0x00, 0x25, 0x73, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E
	.byte 0x74, 0x2D, 0x44, 0x69, 0x73, 0x70, 0x6F, 0x73, 0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3A, 0x20, 0x66
	.byte 0x6F, 0x72, 0x6D, 0x2D, 0x64, 0x61, 0x74, 0x61, 0x3B, 0x20, 0x6E, 0x61, 0x6D, 0x65, 0x3D, 0x22
	.byte 0x25, 0x73, 0x22, 0x0D, 0x0A, 0x0D, 0x0A, 0x00, 0x25, 0x73, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E
	.byte 0x74, 0x2D, 0x44, 0x69, 0x73, 0x70, 0x6F, 0x73, 0x69, 0x74, 0x69, 0x6F, 0x6E, 0x3A, 0x20, 0x66
	.byte 0x6F, 0x72, 0x6D, 0x2D, 0x64, 0x61, 0x74, 0x61, 0x3B, 0x20, 0x6E, 0x61, 0x6D, 0x65, 0x3D, 0x22
	.byte 0x25, 0x73, 0x22, 0x3B, 0x20, 0x66, 0x69, 0x6C, 0x65, 0x6E, 0x61, 0x6D, 0x65, 0x3D, 0x22, 0x25
	.byte 0x73, 0x22, 0x0D, 0x0A, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x79, 0x70, 0x65
	.byte 0x3A, 0x20, 0x25, 0x73, 0x0D, 0x0A, 0x0D, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x73, 0x74, 0x61, 0x74
	.byte 0x65, 0x2D, 0x3E, 0x64, 0x61, 0x74, 0x61, 0x2D, 0x3E, 0x74, 0x79, 0x70, 0x65, 0x20, 0x3D, 0x3D
	.byte 0x20, 0x47, 0x48, 0x49, 0x46, 0x69, 0x6C, 0x65, 0x4D, 0x65, 0x6D, 0x6F, 0x72, 0x79, 0x00, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x53
	.byte 0x74, 0x61, 0x74, 0x65, 0x2E, 0x73, 0x74, 0x61, 0x74, 0x65, 0x73, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x53
	.byte 0x74, 0x61, 0x74, 0x65, 0x2E, 0x69, 0x6E, 0x64, 0x65, 0x78, 0x20, 0x3E, 0x3D, 0x20, 0x30, 0x00
	.byte 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74
	.byte 0x69, 0x6E, 0x67, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2E, 0x69, 0x6E, 0x64, 0x65, 0x78, 0x20, 0x3C
	.byte 0x3D, 0x20, 0x41, 0x72, 0x72, 0x61, 0x79, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x28, 0x63, 0x6F
	.byte 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x70, 0x6F, 0x73, 0x74, 0x69, 0x6E
	.byte 0x67, 0x53, 0x74, 0x61, 0x74, 0x65, 0x2E, 0x73, 0x74, 0x61, 0x74, 0x65, 0x73, 0x29, 0x00, 0x00
	.byte 0x70, 0x6F, 0x73, 0x74, 0x53, 0x74, 0x61, 0x74, 0x65, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x63, 0x6F, 0x6D, 0x70, 0x6C, 0x65, 0x74, 0x65
	.byte 0x64, 0x20, 0x26, 0x26, 0x20, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D
	.byte 0x3E, 0x72, 0x65, 0x73, 0x75, 0x6C, 0x74, 0x00, 0x0D, 0x0A, 0x2D, 0x2D, 0x51, 0x72, 0x34, 0x47
	.byte 0x38, 0x32, 0x33, 0x73, 0x32, 0x33, 0x64, 0x2D, 0x2D, 0x2D, 0x3C, 0x3C, 0x3E, 0x3C, 0x3E, 0x3C
	.byte 0x3C, 0x3C, 0x3E, 0x2D, 0x2D, 0x37, 0x64, 0x31, 0x31, 0x38, 0x65, 0x30, 0x35, 0x33, 0x36, 0x2D
	.byte 0x2D, 0x0D, 0x0A, 0x00, 0x67, 0x68, 0x69, 0x50, 0x61, 0x72, 0x73, 0x65, 0x55, 0x52, 0x4C, 0x00
	.byte 0x67, 0x68, 0x69, 0x44, 0x6F, 0x50, 0x6F, 0x73, 0x74, 0x69, 0x6E, 0x67, 0x00, 0x00, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x61, 0x72, 0x73, 0x65, 0x53, 0x74, 0x61, 0x74, 0x75, 0x73, 0x00, 0x00
	.byte 0x67, 0x68, 0x69, 0x50, 0x61, 0x72, 0x73, 0x65, 0x43, 0x68, 0x75, 0x6E, 0x6B, 0x53, 0x69, 0x7A
	.byte 0x65, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x44, 0x6F, 0x53, 0x65, 0x63, 0x75, 0x72, 0x69, 0x6E
	.byte 0x67, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x50
	.byte 0x72, 0x6F, 0x63, 0x65, 0x73, 0x73, 0x49, 0x6E, 0x63, 0x6F, 0x6D, 0x69, 0x6E, 0x67, 0x46, 0x69
	.byte 0x6C, 0x65, 0x44, 0x61, 0x74, 0x61, 0x00, 0x00, 0x67, 0x68, 0x69, 0x41, 0x70, 0x70, 0x65, 0x6E
	.byte 0x64, 0x54, 0x6F, 0x43, 0x68, 0x75, 0x6E, 0x6B, 0x48, 0x65, 0x61, 0x64, 0x65, 0x72, 0x42, 0x75
	.byte 0x66, 0x66, 0x65, 0x72, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69
	.byte 0x6F, 0x6E, 0x00, 0x00, 0x67, 0x68, 0x74, 0x74, 0x70, 0x50, 0x72, 0x6F, 0x63, 0x65, 0x73, 0x73
	.byte 0x2E, 0x63, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E
	.byte 0x55, 0x52, 0x4C, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x73, 0x3A, 0x2F, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x3A, 0x2F, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x50, 0x4F, 0x53, 0x54, 0x20, 0x00, 0x00, 0x00, 0x48, 0x45, 0x41, 0x44
	.byte 0x20, 0x00, 0x00, 0x00, 0x47, 0x45, 0x54, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x48, 0x54, 0x54
	.byte 0x50, 0x2F, 0x31, 0x2E, 0x31, 0x0D, 0x0A, 0x00, 0x48, 0x6F, 0x73, 0x74, 0x00, 0x00, 0x00, 0x00
	.byte 0x48, 0x6F, 0x73, 0x74, 0x3A, 0x20, 0x00, 0x00, 0x0D, 0x0A, 0x00, 0x00, 0x55, 0x73, 0x65, 0x72
	.byte 0x2D, 0x41, 0x67, 0x65, 0x6E, 0x74, 0x00, 0x00, 0x47, 0x61, 0x6D, 0x65, 0x53, 0x70, 0x79, 0x48
	.byte 0x54, 0x54, 0x50, 0x2F, 0x31, 0x2E, 0x30, 0x00, 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69
	.byte 0x6F, 0x6E, 0x00, 0x00, 0x4B, 0x65, 0x65, 0x70, 0x2D, 0x41, 0x6C, 0x69, 0x76, 0x65, 0x00, 0x00
	.byte 0x63, 0x6C, 0x6F, 0x73, 0x65, 0x00, 0x00, 0x00, 0x25, 0x64, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x79, 0x70, 0x65, 0x00, 0x00, 0x00, 0x00, 0x63, 0x6F, 0x6E, 0x6E
	.byte 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D, 0x3E, 0x63, 0x6F, 0x6D, 0x70, 0x6C, 0x65, 0x74, 0x65
	.byte 0x64, 0x20, 0x26, 0x26, 0x20, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x2D
	.byte 0x3E, 0x72, 0x65, 0x73, 0x75, 0x6C, 0x74, 0x00, 0x63, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69
	.byte 0x6F, 0x6E, 0x2D, 0x3E, 0x72, 0x65, 0x63, 0x76, 0x42, 0x75, 0x66, 0x66, 0x65, 0x72, 0x2E, 0x6C
	.byte 0x65, 0x6E, 0x20, 0x3E, 0x20, 0x30, 0x00, 0x00, 0x48, 0x54, 0x54, 0x50, 0x2F, 0x25, 0x64, 0x2E
	.byte 0x25, 0x64, 0x20, 0x25, 0x64, 0x25, 0x6E, 0x00, 0x6C, 0x65, 0x6E, 0x00, 0x25, 0x78, 0x00, 0x00
	.byte 0x64, 0x61, 0x74, 0x61, 0x00, 0x00, 0x00, 0x00, 0x6C, 0x65, 0x6E, 0x20, 0x3E, 0x3D, 0x20, 0x30
	.byte 0x00, 0x00, 0x00, 0x00, 0x6C, 0x65, 0x6E, 0x20, 0x3E, 0x20, 0x30, 0x00, 0x0D, 0x0A, 0x0D, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x4C, 0x6F, 0x63, 0x61, 0x74, 0x69, 0x6F, 0x6E
	.byte 0x3A, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x25, 0x73, 0x3A, 0x25, 0x64
	.byte 0x25, 0x73, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x4C, 0x65, 0x6E, 0x67
	.byte 0x74, 0x68, 0x3A, 0x00, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x2D, 0x45, 0x6E, 0x63
	.byte 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3A, 0x20, 0x63, 0x68, 0x75, 0x6E, 0x6B, 0x65, 0x64, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x38, 0x5D, 0x22, 0x02, 0x80, 0x00, 0x00, 0x00, 0x88, 0x5D, 0x22, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x20, 0x5D, 0x22, 0x02, 0x55, 0x53, 0x2C, 0x20, 0x57, 0x61, 0x73, 0x68
	.byte 0x69, 0x6E, 0x67, 0x74, 0x6F, 0x6E, 0x2C, 0x20, 0x4E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F
	.byte 0x20, 0x6F, 0x66, 0x20, 0x41, 0x6D, 0x65, 0x72, 0x69, 0x63, 0x61, 0x20, 0x49, 0x6E, 0x63, 0x2C
	.byte 0x20, 0x4E, 0x4F, 0x41, 0x2C, 0x20, 0x4E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x20, 0x43
	.byte 0x41, 0x2C, 0x20, 0x63, 0x61, 0x40, 0x6E, 0x6F, 0x61, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E
	.byte 0x64, 0x6F, 0x2E, 0x63, 0x6F, 0x6D, 0x00, 0x00, 0xB3, 0xCD, 0x79, 0x97, 0x77, 0x5D, 0x8A, 0xAF
	.byte 0x86, 0xA8, 0xE8, 0xD7, 0x73, 0x1C, 0x77, 0xDF, 0x10, 0x90, 0x1F, 0x81, 0xF8, 0x41, 0x9E, 0x21
	.byte 0x55, 0xDF, 0xBC, 0xFC, 0x63, 0xFB, 0x19, 0x43, 0xF1, 0xF6, 0xC4, 0x72, 0x42, 0x49, 0xBD, 0xAD
	.byte 0x44, 0x68, 0x4E, 0xF3, 0xDA, 0x1D, 0xE6, 0x4D, 0xD8, 0xF9, 0x59, 0x88, 0xDC, 0xAE, 0x3E, 0x9B
	.byte 0x38, 0x09, 0xCA, 0x7F, 0xFF, 0xDC, 0x24, 0xA2, 0x44, 0x78, 0x78, 0x49, 0x93, 0xD4, 0x84, 0x40
	.byte 0x10, 0xB8, 0xEC, 0x3E, 0xDB, 0x2D, 0x93, 0xC8, 0x11, 0xC8, 0xFD, 0x78, 0x2D, 0x61, 0xAD, 0x31
	.byte 0xAE, 0x86, 0x26, 0xB0, 0xFD, 0x5A, 0x3F, 0xA1, 0x3D, 0xBF, 0xE2, 0x4B, 0x49, 0xEC, 0xCE, 0x66
	.byte 0x98, 0x58, 0x26, 0x12, 0xC0, 0xFB, 0xF4, 0x77, 0x65, 0x1B, 0xEA, 0xFB, 0xCB, 0x7F, 0xE0, 0x8C
	.byte 0xCB, 0x02, 0xA3, 0x4E, 0x5E, 0x8C, 0xEA, 0x9B, 0x4E, 0x69, 0x74, 0x72, 0x6F, 0x20, 0x57, 0x69
	.byte 0x46, 0x69, 0x20, 0x53, 0x44, 0x4B, 0x2F, 0x25, 0x64, 0x2E, 0x25, 0x64, 0x00, 0x00, 0x00, 0x00
	.byte 0x24, 0x5D, 0x22, 0x02, 0x48, 0x54, 0x54, 0x50, 0x53, 0x54, 0x41, 0x54, 0x55, 0x53, 0x43, 0x4F
	.byte 0x44, 0x45, 0x00, 0x00, 0x72, 0x65, 0x74, 0x75, 0x72, 0x6E, 0x63, 0x64, 0x00, 0x00, 0x00, 0x00
	.byte 0x55, 0x73, 0x65, 0x72, 0x2D, 0x41, 0x67, 0x65, 0x6E, 0x74, 0x00, 0x00, 0x67, 0x61, 0x6D, 0x65
	.byte 0x63, 0x64, 0x00, 0x00, 0x72, 0x68, 0x67, 0x61, 0x6D, 0x65, 0x63, 0x64, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x61, 0x73, 0x73, 0x77, 0x64, 0x00, 0x00, 0x74, 0x6F, 0x6B, 0x65, 0x6E, 0x00, 0x00, 0x00
	.byte 0x75, 0x73, 0x65, 0x72, 0x69, 0x64, 0x00, 0x00, 0x6D, 0x61, 0x63, 0x61, 0x64, 0x72, 0x00, 0x00
	.byte 0x61, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x61, 0x74, 0x74, 0x72, 0x31, 0x00, 0x00, 0x00
	.byte 0x61, 0x74, 0x74, 0x72, 0x32, 0x00, 0x00, 0x00, 0x61, 0x74, 0x74, 0x72, 0x33, 0x00, 0x00, 0x00
	.byte 0x61, 0x70, 0x69, 0x6E, 0x66, 0x6F, 0x00, 0x00, 0x6F, 0x66, 0x66, 0x73, 0x65, 0x74, 0x00, 0x00
	.byte 0x6E, 0x75, 0x6D, 0x00, 0x63, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x73, 0x00, 0x00, 0x00, 0x00
	.byte 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x00, 0x00
	.byte 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x00, 0x68, 0x74, 0x74, 0x70, 0x73, 0x3A, 0x2F, 0x2F
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x54, 0x54, 0x50, 0x53, 0x54, 0x41, 0x54, 0x55, 0x53, 0x43, 0x4F
	.byte 0x44, 0x45, 0x00, 0x00, 0x47, 0x45, 0x54, 0x20, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4F, 0x53, 0x54
	.byte 0x20, 0x00, 0x00, 0x00, 0x48, 0x45, 0x41, 0x44, 0x20, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x20, 0x48, 0x54, 0x54, 0x50, 0x2F, 0x31, 0x2E, 0x31, 0x0D, 0x0A, 0x00, 0x48, 0x6F, 0x73, 0x74
	.byte 0x3A, 0x20, 0x00, 0x00, 0x0D, 0x0A, 0x00, 0x00, 0x3A, 0x20, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x79, 0x70, 0x65, 0x3A, 0x20, 0x6D, 0x75, 0x6C, 0x74, 0x69, 0x70
	.byte 0x61, 0x72, 0x74, 0x2F, 0x66, 0x6F, 0x72, 0x6D, 0x2D, 0x64, 0x61, 0x74, 0x61, 0x3B, 0x20, 0x62
	.byte 0x6F, 0x75, 0x6E, 0x64, 0x61, 0x72, 0x79, 0x3D, 0x00, 0x00, 0x00, 0x00, 0x43, 0x6F, 0x6E, 0x74
	.byte 0x65, 0x6E, 0x74, 0x2D, 0x54, 0x79, 0x70, 0x65, 0x3A, 0x20, 0x61, 0x70, 0x70, 0x6C, 0x69, 0x63
	.byte 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2F, 0x78, 0x2D, 0x77, 0x77, 0x77, 0x2D, 0x66, 0x6F, 0x72, 0x6D
	.byte 0x2D, 0x75, 0x72, 0x6C, 0x65, 0x6E, 0x63, 0x6F, 0x64, 0x65, 0x64, 0x0D, 0x0A, 0x00, 0x00, 0x00
	.byte 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x3A, 0x20
	.byte 0x00, 0x00, 0x00, 0x00, 0x22, 0x0D, 0x0A, 0x00, 0x2D, 0x2D, 0x0D, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x48, 0x54, 0x54, 0x50, 0x2F, 0x00, 0x00, 0x00
	.byte 0x43, 0x6F, 0x6E, 0x74, 0x65, 0x6E, 0x74, 0x2D, 0x4C, 0x65, 0x6E, 0x67, 0x74, 0x68, 0x00, 0x00
	.byte 0x43, 0x6F, 0x6E, 0x6E, 0x65, 0x63, 0x74, 0x69, 0x6F, 0x6E, 0x00, 0x00, 0x4B, 0x65, 0x65, 0x70
	.byte 0x2D, 0x41, 0x6C, 0x69, 0x76, 0x65, 0x00, 0x00, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72
	.byte 0x2D, 0x45, 0x6E, 0x63, 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x00, 0x00, 0x00, 0x63, 0x68, 0x75, 0x6E
	.byte 0x6B, 0x65, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_02226020:
	.space 0x1040
