#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0106.h"
#include "msgdata/msg/msg_0053_D11R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D11R0106_000
	scrdef scr_seq_D11R0106_001
	scrdef scr_seq_D11R0106_002
	scrdef scr_seq_D11R0106_003
	scrdef scr_seq_D11R0106_004
	scrdef scr_seq_D11R0106_005
	scrdef scr_seq_D11R0106_006
	scrdef scr_seq_D11R0106_007
	scrdef scr_seq_D11R0106_008
	scrdef scr_seq_D11R0106_009
	scrdef_end

scr_seq_D11R0106_009:
	get_phone_book_rematch 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00AB
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _008A
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _0069
	clearflag FLAG_UNK_2F5
	end

_0069:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _0084
	setflag FLAG_UNK_2F5
	goto _0088

_0084:
	clearflag FLAG_UNK_2F5
_0088:
	end

_008A:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, _00A5
	setflag FLAG_UNK_2F5
	goto _00A9

_00A5:
	clearflag FLAG_UNK_2F5
_00A9:
	end

_00AB:
	setflag FLAG_UNK_2F5
	end

scr_seq_D11R0106_008:
	checkflag FLAG_UNK_13B
	callif TRUE, _00D4
	checkflag FLAG_UNK_13D
	callif TRUE, _00E2
	checkflag FLAG_UNK_13E
	callif TRUE, _00F0
	end

_00D4:
	move_person 5, 21, 0, 14, 2
	return

_00E2:
	move_person 7, 9, 0, 13, 0
	return

_00F0:
	move_person 2, 15, 0, 16, 1
	return

scr_seq_D11R0106_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01B6
	npc_msg msg_0053_D11R0106_00000
	closemsg
	trainer_battle TRAINER_LEADER_BLAINE_BLAINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	give_badge 14
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_265
	setflag FLAG_UNK_299
	clearflag FLAG_UNK_29A
	add_special_game_stat 22
	setflag FLAG_UNK_13F
	setflag FLAG_UNK_140
	setflag FLAG_UNK_13C
	npc_msg msg_0053_D11R0106_00001
	buffer_players_name 0
	npc_msg msg_0053_D11R0106_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0053_D11R0106_00003
	goto _0175

_0175:
	setvar VAR_SPECIAL_x8004, 377
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01AC
	callstd std_give_item_verbose
	setflag FLAG_UNK_17D
	buffer_players_name 0
	npc_msg msg_0053_D11R0106_00004
	waitbutton
	closemsg
	releaseall
	end

_01AC:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_01B6:
	checkflag FLAG_UNK_17D
	gotoif FALSE, _0175
	npc_msg msg_0053_D11R0106_00005
	waitbutton
	closemsg
	releaseall
	end

_01CC:
	white_out
	releaseall
	end

scr_seq_D11R0106_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13B
	gotoif TRUE, _021A
	npc_msg msg_0053_D11R0106_00006
	closemsg
	trainer_battle TRAINER_SUPER_NERD_CARY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00008
	closemsg
	apply_movement obj_D11R0106_gsassistantm, _0424
	wait_movement
	setflag FLAG_UNK_13B
	releaseall
	end

_021A:
	npc_msg msg_0053_D11R0106_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D11R0106_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13C
	gotoif TRUE, _028C
	npc_msg msg_0053_D11R0106_00009
	closemsg
	trainer_battle TRAINER_SUPER_NERD_WALDO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00011
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _027A
	apply_movement obj_D11R0106_gsassistantm_2, _043C
	goto _0282

_027A:
	apply_movement obj_D11R0106_gsassistantm_2, _0430
_0282:
	wait_movement
	setflag FLAG_UNK_13C
	releaseall
	end

_028C:
	npc_msg msg_0053_D11R0106_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D11R0106_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13D
	gotoif TRUE, _02DF
	npc_msg msg_0053_D11R0106_00012
	closemsg
	trainer_battle TRAINER_SUPER_NERD_MERLE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00014
	closemsg
	apply_movement obj_D11R0106_gsassistantm_3, _0448
	wait_movement
	setflag FLAG_UNK_13D
	releaseall
	end

_02DF:
	npc_msg msg_0053_D11R0106_00013
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D11R0106_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13E
	gotoif TRUE, _0332
	npc_msg msg_0053_D11R0106_00015
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LOWELL, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00017
	closemsg
	apply_movement obj_D11R0106_assistantm, _0454
	wait_movement
	setflag FLAG_UNK_13E
	releaseall
	end

_0332:
	npc_msg msg_0053_D11R0106_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D11R0106_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13F
	gotoif TRUE, _03A4
	npc_msg msg_0053_D11R0106_00018
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LINDEN, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00020
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0392
	apply_movement obj_D11R0106_assistantm_2, _046C
	goto _039A

_0392:
	apply_movement obj_D11R0106_assistantm_2, _0460
_039A:
	wait_movement
	setflag FLAG_UNK_13F
	releaseall
	end

_03A4:
	npc_msg msg_0053_D11R0106_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D11R0106_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_140
	gotoif TRUE, _0416
	npc_msg msg_0053_D11R0106_00021
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_DANIEL, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01CC
	npc_msg msg_0053_D11R0106_00023
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0404
	apply_movement obj_D11R0106_assistantm_3, _0478
	goto _040C

_0404:
	apply_movement obj_D11R0106_assistantm_3, _0484
_040C:
	wait_movement
	setflag FLAG_UNK_140
	releaseall
	end

_0416:
	npc_msg msg_0053_D11R0106_00022
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0424:
	step 15, 1
	step 2, 1
	step_end

_0430:
	step 13, 1
	step 0, 1
	step_end

_043C:
	step 12, 1
	step 1, 1
	step_end

_0448:
	step 13, 1
	step 0, 1
	step_end

_0454:
	step 12, 1
	step 1, 1
	step_end

_0460:
	step 14, 1
	step 3, 1
	step_end

_046C:
	step 15, 1
	step 2, 1
	step_end

_0478:
	step 14, 1
	step 3, 1
	step_end

_0484:
	step 15, 1
	step 2, 1
	step_end
scr_seq_D11R0106_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04B6
	npc_msg msg_0053_D11R0106_00024
	waitbutton
	closemsg
	releaseall
	end

_04B6:
	npc_msg msg_0053_D11R0106_00025
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
