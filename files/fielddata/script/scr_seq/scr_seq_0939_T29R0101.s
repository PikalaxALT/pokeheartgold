#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0101.h"
#include "msgdata/msg/msg_0627_T29R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29R0101_000
	scrdef_end

scr_seq_T29R0101_000:
	checkflag FLAG_UNK_0C7
	gotoif TRUE, _005A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0627_T29R0101_00000
	setvar VAR_SPECIAL_x8004, 337
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _006B
	callstd std_give_item_verbose
	setflag FLAG_UNK_0C7
	npc_msg msg_0627_T29R0101_00002
	waitbutton
	closemsg
	apply_movement obj_T29R0101_gsbigman, _0078
	wait_movement
	releaseall
	end

_005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0627_T29R0101_00004
	waitbutton
	closemsg
	releaseall
	end

_006B:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0078:
	step 3, 1
	step_end
	.balign 4, 0
