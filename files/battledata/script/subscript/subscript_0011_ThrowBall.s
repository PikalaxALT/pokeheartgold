    .include "macros/btlcmd.inc"

    .data

_000:
    // {0} used one {1}!
    PrintMessage msg_0197_00857, TAG_TRNAME_ITEM, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    StartCatchMonTask CAPTURE_NORMAL
    WaitCatchMonTask 
    UpdateVarFromVar OPCODE_GET, BSCRIPT_VAR_BATTLE_OUTCOME, BSCRIPT_VAR_TEMP_DATA
    UpdateVar OPCODE_BITWISE_AND, BSCRIPT_VAR_TEMP_DATA, 255
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_TEMP_DATA, 4, _CATCHING_CONTEST_OUT_OF_BALLS
    TryRestoreStatusOnSwitch BATTLER_CATEGORY_PLAYER, _CATCHING_CONTEST_OUT_OF_BALLS
    UpdateMonData OPCODE_SET, BATTLER_CATEGORY_PLAYER, BMON_DATA_STATUS, STATUS_NONE

_CATCHING_CONTEST_OUT_OF_BALLS:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_BATTLE_TYPE, BATTLE_TYPE_BUG_CONTEST, _060
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_CAPTURED_MON, _060
    CompareVarToValue OPCODE_NEQ, BSCRIPT_VAR_SAFARI_BALL_CNT, 0, _060
    PlaySound BATTLER_CATEGORY_ATTACKER, SEQ_SE_DP_PINPON
    // Announcer: You’re out of {0}s! Game over!
    PrintMessage msg_0197_01269, TAG_ITEM, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30
    FadeOutBattle 
    Wait 
    UpdateVar OPCODE_FLAG_ON, BSCRIPT_VAR_BATTLE_OUTCOME, BATTLE_RESULT_PLAYER_FLED

_060:
    End 
