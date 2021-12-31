#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D40R0104.h"
#include "msgdata/msg/msg_0124_D40R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D40R0104_000
	scrdef scr_seq_D40R0104_001
	scrdef scr_seq_D40R0104_002
	scrdef scr_seq_D40R0104_003
	scrdef_end

scr_seq_D40R0104_003:
	setvar VAR_TEMP_x4003, 111
	end

scr_seq_D40R0104_001:
	comparevartovalue VAR_TEMP_x4003, 111
	gotoif ne, _0032
	checkflag FLAG_UNK_106
	gotoif TRUE, _003A
_0032:
	setvar VAR_TEMP_x4003, 0
	end

_003A:
	move_person 0, 34, 1, 29, 3
	setvar VAR_TEMP_x4003, 0
	end

scr_seq_D40R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_117
	gotoif TRUE, _010D
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, _0093
	checkflag FLAG_UNK_106
	gotoif TRUE, _00C5
	checkflag FLAG_UNK_094
	gotoif TRUE, _00B4
	npc_msg msg_0124_D40R0104_00001
	waitbutton
	closemsg
	releaseall
	end

_0093:
	checkflag FLAG_UNK_106
	gotoif TRUE, _00C5
	checkflag FLAG_UNK_094
	gotoif TRUE, _00B4
	npc_msg msg_0124_D40R0104_00000
	waitbutton
	closemsg
	releaseall
	end

_00B4:
	npc_msg msg_0124_D40R0104_00002
	closemsg
	scrcmd_774 1
	releaseall
	setflag FLAG_UNK_106
	end

_00C5:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif ne, _00EC
	checkflag FLAG_UNK_109
	gotoif TRUE, _00F7
	checkflag FLAG_UNK_105
	gotoif TRUE, _0102
_00EC:
	npc_msg msg_0124_D40R0104_00004
	waitbutton
	closemsg
	releaseall
	end

_00F7:
	npc_msg msg_0124_D40R0104_00006
	waitbutton
	closemsg
	releaseall
	end

_0102:
	npc_msg msg_0124_D40R0104_00005
	waitbutton
	closemsg
	releaseall
	end

_010D:
	npc_msg msg_0124_D40R0104_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D40R0104_002:
	wait 60, VAR_SPECIAL_x800C
	npc_msg msg_0124_D40R0104_00003
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0142
	apply_movement obj_D40R0104_bozu, _0168
	goto _014A

_0142:
	apply_movement obj_D40R0104_bozu, _0154
_014A:
	wait_movement
	wait 30, VAR_SPECIAL_x800C
	end


_0154:
	step 1, 1
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

_0168:
	step 3, 1
	step 71, 1
	step 14, 1
	step 72, 1
	step_end
	.balign 4, 0
