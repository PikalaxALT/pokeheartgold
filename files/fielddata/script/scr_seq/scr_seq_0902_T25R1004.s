#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1004.h"
#include "msgdata/msg/msg_0595_T25R1004.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1004_000
	scrdef scr_seq_T25R1004_001
	scrdef scr_seq_T25R1004_002
	scrdef scr_seq_T25R1004_003
	scrdef scr_seq_T25R1004_004
	scrdef_end

scr_seq_T25R1004_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_T25R1004_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0050
	npc_msg msg_0595_T25R1004_00001
	goto _0053

_0050:
	npc_msg msg_0595_T25R1004_00000
_0053:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1004_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0079
	npc_msg msg_0595_T25R1004_00003
	goto _007C

_0079:
	npc_msg msg_0595_T25R1004_00002
_007C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1004_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _00A2
	npc_msg msg_0595_T25R1004_00005
	goto _00A5

_00A2:
	npc_msg msg_0595_T25R1004_00004
_00A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1004_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0595_T25R1004_00006
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
