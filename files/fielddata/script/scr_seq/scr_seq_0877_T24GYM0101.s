#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24GYM0101.h"
#include "msgdata/msg/msg_0574_T24GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24GYM0101_000
	scrdef scr_seq_T24GYM0101_001
	scrdef scr_seq_T24GYM0101_002
	scrdef scr_seq_T24GYM0101_003
	scrdef_end

scr_seq_T24GYM0101_001:
	scrcmd_318
	clearflag FLAG_UNK_981
	end

scr_seq_T24GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _010A
	check_badge 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00EE
	npc_msg msg_0574_T24GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_CHUCK_CHUCK, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0104
	npc_msg msg_0574_T24GYM0101_00003
	settrainerflag TRAINER_BLACK_BELT_YOSHI
	settrainerflag TRAINER_BLACK_BELT_LAO
	settrainerflag TRAINER_BLACK_BELT_NOB
	settrainerflag TRAINER_BLACK_BELT_LUNG
	buffer_players_name 0
	npc_msg msg_0574_T24GYM0101_00004
	give_badge 4
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	addvar VAR_UNK_4134, 1
	add_special_game_stat 22
	setvar VAR_UNK_4116, 1
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, _00A6
	setvar VAR_UNK_4077, 1
_00A6:
	npc_msg msg_0574_T24GYM0101_00005
	goto _00AF

_00AF:
	setvar VAR_SPECIAL_x8004, 328
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00E3
	callstd std_give_item_verbose
	setflag FLAG_UNK_0BA
	npc_msg msg_0574_T24GYM0101_00006
	waitbutton
	closemsg
	releaseall
	end

_00E3:
	npc_msg msg_0574_T24GYM0101_00007
	waitbutton
	closemsg
	releaseall
	end

_00EE:
	checkflag FLAG_UNK_0BA
	gotoif FALSE, _00AF
	npc_msg msg_0574_T24GYM0101_00008
	waitbutton
	closemsg
	releaseall
	end

_0104:
	white_out
	releaseall
	end

_010A:
	npc_msg msg_0574_T24GYM0101_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T24GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0135
	npc_msg msg_0574_T24GYM0101_00012
	waitbutton
	closemsg
	releaseall
	end

_0135:
	npc_msg msg_0574_T24GYM0101_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0153
	closemsg
	releaseall
	end

_0153:
	buffer_players_name 0
	npc_msg msg_0574_T24GYM0101_00011
	closemsg
	setflag FLAG_UNK_981
	scrcmd_074 2143
	play_se SEQ_SE_DP_SHIP03
	play_se SEQ_SE_GS_TAKI2
	scrcmd_319 16384
	releaseall
	end

scr_seq_T24GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 4, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _019A
	npc_msg msg_0574_T24GYM0101_00013
	goto _019D

_019A:
	npc_msg msg_0574_T24GYM0101_00014
_019D:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
