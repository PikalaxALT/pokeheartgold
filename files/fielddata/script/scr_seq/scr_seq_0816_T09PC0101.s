#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T09PC0101.h"
#include "msgdata/msg/msg_0520_T09PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T09PC0101_000
	scrdef scr_seq_T09PC0101_001
	scrdef scr_seq_T09PC0101_002
	scrdef_end

scr_seq_T09PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T09PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0520_T09PC0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T09PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0520_T09PC0101_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
