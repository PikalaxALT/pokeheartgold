#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08PC0101.h"
#include "msgdata/msg/msg_0515_T08PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08PC0101_000
	scrdef scr_seq_T08PC0101_001
	scrdef scr_seq_T08PC0101_002
	scrdef scr_seq_T08PC0101_003
	scrdef_end

scr_seq_T08PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T08PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0515_T08PC0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T08PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0515_T08PC0101_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T08PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0515_T08PC0101_00002
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _006E
	apply_movement obj_T08PC0101_gsgirl1, _009C
	goto _0091

_006E:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0089
	apply_movement obj_T08PC0101_gsgirl1, _00C0
	goto _0091

_0089:
	apply_movement obj_T08PC0101_gsgirl1, _00E4
_0091:
	npc_msg msg_0515_T08PC0101_00003
	waitbutton
	closemsg
	releaseall
	end


_009C:
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step_end

_00C0:
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step_end

_00E4:
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step_end
	.balign 4, 0
