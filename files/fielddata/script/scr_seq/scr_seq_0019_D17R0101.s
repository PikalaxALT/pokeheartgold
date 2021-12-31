#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0101.h"
#include "msgdata/msg/msg_0057_D17R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D17R0101_000
	scrdef scr_seq_D17R0101_001
	scrdef scr_seq_D17R0101_002
	scrdef_end

scr_seq_D17R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_116
	gotoif TRUE, _0053
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, _0048
	checkflag FLAG_UNK_108
	gotoif TRUE, _005E
	checkflag FLAG_UNK_105
	gotoif TRUE, _0069
_0048:
	npc_msg msg_0057_D17R0101_00003
	waitbutton
	closemsg
	releaseall
	end

_0053:
	npc_msg msg_0057_D17R0101_00006
	waitbutton
	closemsg
	releaseall
	end

_005E:
	npc_msg msg_0057_D17R0101_00005
	waitbutton
	closemsg
	releaseall
	end

_0069:
	npc_msg msg_0057_D17R0101_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D17R0101_001:
	scrcmd_609
	lockall
	scrcmd_386 VAR_TEMP_x400A
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, _0097
	apply_movement obj_D17R0101_bozu, _02D8
	goto _009F

_0097:
	apply_movement obj_D17R0101_bozu, _02E0
_009F:
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, _0150
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, _0192
	checkflag FLAG_UNK_093
	gotoif TRUE, _028E
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, _00F1
	apply_movement obj_player, _0344
	goto _0101

_00F1:
	apply_movement obj_D17R0101_bozu, _0354
	apply_movement obj_player, _0354
_0101:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0127
	npc_msg msg_0057_D17R0101_00000
	goto _012A

_0127:
	npc_msg msg_0057_D17R0101_00001
_012A:
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x400A, 0
	callif eq, _01EF
	comparevartovalue VAR_TEMP_x400A, 2
	callif eq, _0231
	releaseall
	end

_0150:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, _016B
	apply_movement obj_D17R0101_bozu, _02EC
	goto _018E

_016B:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, _0186
	apply_movement obj_D17R0101_bozu, _02FC
	goto _018E

_0186:
	apply_movement obj_D17R0101_bozu, _0304
_018E:
	wait_movement
	return

_0192:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, _01AD
	apply_movement obj_D17R0101_bozu, _0314
	goto _01EB

_01AD:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, _01C8
	apply_movement obj_D17R0101_bozu, _0324
	goto _01EB

_01C8:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, _01E3
	apply_movement obj_D17R0101_bozu, _032C
	goto _01EB

_01E3:
	apply_movement obj_D17R0101_bozu, _0338
_01EB:
	wait_movement
	return

_01EF:
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, _020A
	apply_movement obj_D17R0101_bozu, _0364
	goto _022D

_020A:
	comparevartovalue VAR_SPECIAL_x8004, 8
	gotoif ne, _0225
	apply_movement obj_D17R0101_bozu, _0378
	goto _022D

_0225:
	apply_movement obj_D17R0101_bozu, _0384
_022D:
	wait_movement
	return

_0231:
	comparevartovalue VAR_SPECIAL_x8005, 7
	gotoif ne, _024C
	apply_movement obj_D17R0101_bozu, _0398
	goto _028A

_024C:
	comparevartovalue VAR_SPECIAL_x8005, 8
	gotoif ne, _0267
	apply_movement obj_D17R0101_bozu, _03A4
	goto _028A

_0267:
	comparevartovalue VAR_SPECIAL_x8005, 9
	gotoif ne, _0282
	apply_movement obj_D17R0101_bozu, _03B0
	goto _028A

_0282:
	apply_movement obj_D17R0101_bozu, _03C0
_028A:
	wait_movement
	return

_028E:
	npc_msg msg_0057_D17R0101_00002
	closemsg
	scrcmd_774 0
	releaseall
	setvar VAR_UNK_40F3, 1
	end

scr_seq_D17R0101_002:
	wait 30, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, _02C2
	apply_movement obj_D17R0101_bozu, _03D0
	goto _02CA

_02C2:
	apply_movement obj_D17R0101_bozu, _03E0
_02CA:
	wait_movement
	npc_msg msg_0057_D17R0101_00003
	waitbutton
	closemsg
	end
	.byte 0x00, 0x00, 0x00

_02D8:
	step 75, 1
	step_end

_02E0:
	step 3, 1
	step 75, 1
	step_end

_02EC:
	step 13, 2
	step 14, 1
	step 13, 1
	step_end

_02FC:
	step 13, 3
	step_end

_0304:
	step 13, 2
	step 15, 1
	step 13, 1
	step_end

_0314:
	step 12, 1
	step 15, 2
	step 15, 1
	step_end

_0324:
	step 15, 3
	step_end

_032C:
	step 13, 1
	step 15, 3
	step_end

_0338:
	step 13, 2
	step 15, 3
	step_end

_0344:
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_0354:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_0364:
	step 12, 1
	step 15, 1
	step 12, 2
	step 33, 1
	step_end

_0378:
	step 12, 3
	step 33, 1
	step_end

_0384:
	step 12, 1
	step 14, 1
	step 12, 2
	step 33, 1
	step_end

_0398:
	step 14, 4
	step 13, 1
	step_end

_03A4:
	step 14, 4
	step 33, 1
	step_end

_03B0:
	step 14, 4
	step 12, 1
	step 33, 1
	step_end

_03C0:
	step 14, 4
	step 12, 2
	step 33, 1
	step_end

_03D0:
	step 71, 1
	step 4, 1
	step 72, 1
	step_end

_03E0:
	step 71, 1
	step 6, 1
	step 72, 1
	step_end
	.balign 4, 0
