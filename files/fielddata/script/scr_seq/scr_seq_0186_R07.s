#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R07.h"
#include "msgdata/msg/msg_0336_R07.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R07_000
	scrdef scr_seq_R07_001
	scrdef_end

scr_seq_R07_000:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R07_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0336_R07_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
