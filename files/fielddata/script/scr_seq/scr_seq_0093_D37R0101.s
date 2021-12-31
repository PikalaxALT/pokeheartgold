#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0101.h"
#include "msgdata/msg/msg_0116_D37R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0101_000
	scrdef scr_seq_D37R0101_001
	scrdef scr_seq_D37R0101_002
	scrdef scr_seq_D37R0101_003
	scrdef_end

scr_seq_D37R0101_003:
	get_friend_sprite VAR_OBJ_0
	end

scr_seq_D37R0101_002:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, _0228
	clearflag FLAG_UNK_2C8
	show_person 3
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, _0050
	move_person 3, 9, 0, 25, 2
_0050:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_D37R0101_tsure_poke_611, _0174
	wait_movement
	wait 8, VAR_SPECIAL_x800C
	scrcmd_076 183, 0
	scrcmd_077
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _01BC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	clearflag FLAG_UNK_2C8
	show_person 2
	comparevartovalue VAR_TEMP_x4001, 30
	gotoif ne, _00AB
	move_person 2, 9, 0, 25, 2
_00AB:
	play_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement obj_D37R0101_var_1, _01C4
	wait_movement
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00EE
	apply_movement obj_D37R0101_tsure_poke_611, _0218
	apply_movement obj_player, _0218
	apply_movement 253, _0218
	wait_movement
	goto _0100

_00EE:
	apply_movement obj_D37R0101_tsure_poke_611, _0218
	apply_movement obj_player, _0218
	wait_movement
_0100:
	buffer_players_name 0
	gender_msgbox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	closemsg
	apply_movement obj_D37R0101_var_1, _01D0
	apply_movement obj_D37R0101_tsure_poke_611, _01E0
	wait_movement
	gender_msgbox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	call _0354
	gender_msgbox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	closemsg
	apply_movement obj_D37R0101_var_1, _01F0
	apply_movement obj_D37R0101_tsure_poke_611, _0204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	hide_person 2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_fade_end_friend_music
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end
	.byte 0x00

_0174:
	step 78, 1
	step 39, 1
	step 50, 2
	step 18, 3
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step_end

_01BC:
	step 12, 3
	step_end

_01C4:
	step 14, 1
	step 75, 1
	step_end

_01D0:
	step 14, 1
	step 13, 2
	step 14, 1
	step_end

_01E0:
	step 63, 3
	step 15, 1
	step 13, 1
	step_end

_01F0:
	step 13, 2
	step 14, 1
	step 13, 1
	step 69, 1
	step_end

_0204:
	step 13, 3
	step 14, 1
	step 13, 1
	step 69, 1
	step_end

_0218:
	step 35, 1
	step_end

_0220:
	step 33, 1
	step_end
_0228:
	clearflag FLAG_UNK_2C8
	show_person 2
	clearflag FLAG_UNK_2C8
	show_person 3
	lock obj_D37R0101_tsure_poke_611
	callstd std_play_friend_music
	move_person 2, 25, 0, 9, 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_player, _0220
	apply_movement obj_D37R0101_var_1, _0308
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0310
	apply_movement obj_D37R0101_var_1, _0318
	wait 8, VAR_SPECIAL_x800C
	move_person 3, 25, 0, 9, 0
	apply_movement obj_D37R0101_tsure_poke_611, _0320
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	gender_msgbox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	setvar VAR_SPECIAL_x8004, 435
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	call _0354
	gender_msgbox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	closemsg
	apply_movement obj_D37R0101_var_1, _0328
	apply_movement obj_D37R0101_tsure_poke_611, _033C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2C8
	hide_person 2
	hide_person 3
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_fade_end_friend_music
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0308:
	step 75, 1
	step_end

_0310:
	step 13, 2
	step_end

_0318:
	step 12, 2
	step_end

_0320:
	step 12, 1
	step_end

_0328:
	step 15, 1
	step 12, 4
	step 14, 2
	step 69, 1
	step_end

_033C:
	step 12, 1
	step 15, 1
	step 12, 4
	step 14, 2
	step 69, 1
	step_end
_0354:
	call _03A8
	call _03A8
	call _03A8
	call _03A8
	call _03A8
	call _03C2
	call _03C2
	call _03C2
	call _03C2
	call _03C2
	scrcmd_406 0
	setvar VAR_TEMP_x4001, 9999
	call _03DC
	call _03DC
	return

_03A8:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 0
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

_03C2:
	scrcmd_380 32780, 6
	setvar VAR_SPECIAL_x8004, 18
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_403 32772, 1
	return

_03DC:
	scrcmd_380 32780, 8
	comparevartovar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	gotoif eq, _03DC
	copyvar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_406 32772
	return

scr_seq_D37R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _0425
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_0425:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _043B
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_043B:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0451
	npc_msg msg_0116_D37R0101_00001
	goto _0454

_0451:
	npc_msg msg_0116_D37R0101_00000
_0454:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _047A
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_047A:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0490
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_0490:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _04A6
	npc_msg msg_0116_D37R0101_00004
	goto _04A9

_04A6:
	npc_msg msg_0116_D37R0101_00003
_04A9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
