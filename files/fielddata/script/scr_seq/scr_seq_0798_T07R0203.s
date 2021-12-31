#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0203.h"
#include "msgdata/msg/msg_0503_T07R0203.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0203_000
	scrdef scr_seq_T07R0203_001
	scrdef scr_seq_T07R0203_002
	scrdef scr_seq_T07R0203_003
	scrdef scr_seq_T07R0203_004
	scrdef scr_seq_T07R0203_005
	scrdef scr_seq_T07R0203_006
	scrdef scr_seq_T07R0203_007
	scrdef scr_seq_T07R0203_008
	scrdef scr_seq_T07R0203_009
	scrdef scr_seq_T07R0203_010
	scrdef scr_seq_T07R0203_011
	scrdef scr_seq_T07R0203_012
	scrdef scr_seq_T07R0203_013
	scrdef_end

scr_seq_T07R0203_008:
	get_friend_sprite VAR_OBJ_0
	setvar VAR_UNK_4125, 0
	end

scr_seq_T07R0203_011:
	comparevartovalue VAR_UNK_412C, 0
	gotoif ne, _006B
	move_person 5, 12, 0, 6, 2
	move_person 6, 13, 0, 6, 2
_006B:
	end

scr_seq_T07R0203_010:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement obj_T07R0203_var_1, _012C
	apply_movement obj_T07R0203_tsure_poke_611, _0138
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0503_T07R0203_00012, msg_0503_T07R0203_00013
	closemsg
	apply_movement obj_T07R0203_var_1, _0140
	apply_movement obj_T07R0203_tsure_poke_611, _0148
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0150
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0503_T07R0203_00014, msg_0503_T07R0203_00015
	closemsg
	apply_movement obj_T07R0203_var_1, _015C
	apply_movement obj_T07R0203_tsure_poke_611, _016C
	wait_movement
	scrcmd_307 0, 0, 3, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T07R0203_var_1, _0180
	apply_movement obj_T07R0203_tsure_poke_611, _018C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd std_fade_end_friend_music
	setvar VAR_UNK_412C, 1
	move_person 5, 29, 0, 29, 2
	move_person 6, 29, 0, 29, 2
	releaseall
	end
	.byte 0x00

_012C:
	step 14, 4
	step 75, 1
	step_end

_0138:
	step 14, 4
	step_end

_0140:
	step 14, 4
	step_end

_0148:
	step 14, 4
	step_end

_0150:
	step 13, 3
	step 35, 1
	step_end

_015C:
	step 12, 2
	step 14, 1
	step 12, 1
	step_end

_016C:
	step 14, 1
	step 12, 2
	step 14, 1
	step 32, 1
	step_end

_0180:
	step 12, 1
	step 69, 1
	step_end

_018C:
	step 12, 2
	step 69, 1
	step_end
scr_seq_T07R0203_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_johto_dex_complete VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0245
	checkflag FLAG_UNK_143
	gotoif TRUE, _01ED
	npc_msg msg_0503_T07R0203_00001
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_425 0
	scrcmd_150
	setflag FLAG_UNK_143
	add_special_game_stat 25
	fade_screen 6, 1, 1, 0x00
	wait_fade
_01ED:
	check_national_dex_complete VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0245
	checkflag FLAG_UNK_144
	gotoif TRUE, _023A
	npc_msg msg_0503_T07R0203_00002
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_425 1
	scrcmd_150
	setflag FLAG_UNK_144
	add_special_game_stat 26
	fade_screen 6, 1, 1, 0x00
	wait_fade
_023A:
	npc_msg msg_0503_T07R0203_00003
	waitbutton
	closemsg
	releaseall
	end

_0245:
	npc_msg msg_0503_T07R0203_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0276
	npc_msg msg_0503_T07R0203_00007
	waitbutton
	closemsg
	releaseall
	end

_0276:
	getitemquantity 502, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02A7
	npc_msg msg_0503_T07R0203_00008
	setvar VAR_SPECIAL_x8004, 502
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0503_T07R0203_00010
	waitbutton
	closemsg
	releaseall
	end

_02A7:
	npc_msg msg_0503_T07R0203_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0503_T07R0203_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0503_T07R0203_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0503_T07R0203_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00018
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00020
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0203_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0503_T07R0203_00021
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
