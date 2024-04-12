#ifndef POKEHEARTGOLD_CONSTANTS_BATTLE_H
#define POKEHEARTGOLD_CONSTANTS_BATTLE_H

//Battler IDs
#define BATTLER_NONE    0xFF
#define BATTLER_PLAYER  0
#define BATTLER_ENEMY   1
#define BATTLER_PLAYER2 2
#define BATTLER_ENEMY2  3
#define BATTLER_MAX     4

//Battler Positions
#define BATTLER_TYPE_SOLO_PLAYER            0
#define BATTLER_TYPE_SOLO_ENEMY             1
#define BATTLER_TYPE_PLAYER_SIDE_SLOT_1     2
#define BATTLER_TYPE_ENEMY_SIDE_SLOT_1      3
#define BATTLER_TYPE_PLAYER_SIDE_SLOT_2     4
#define BATTLER_TYPE_ENEMY_SIDE_SLOT_2      5

//Battler Category
#define BATTLER_CATEGORY_ALL                   0
#define BATTLER_CATEGORY_ATTACKER              1
#define BATTLER_CATEGORY_DEFENDER              2
#define BATTLER_CATEGORY_PLAYER                3
#define BATTLER_CATEGORY_ENEMY                 4
#define BATTLER_CATEGORY_FAINTED_MON           5
#define BATTLER_CATEGORY_SWITCHED_MON          6
#define BATTLER_CATEGORY_SIDE_EFFECT_MON       7
#define BATTLER_CATEGORY_ABILITY_MON           8
#define BATTLER_CATEGORY_PLAYER_SLOT_1         9
#define BATTLER_CATEGORY_ENEMY_SLOT_1         10
#define BATTLER_CATEGORY_PLAYER_SLOT_2        11
#define BATTLER_CATEGORY_ENEMY_SLOT_2         12
#define BATTLER_CATEGORY_UNDEFINED_13         13
#define BATTLER_CATEGORY_MSG_ATTACKER         14
#define BATTLER_CATEGORY_MSG_DEFENDER         15
#define BATTLER_CATEGORY_ATTACKER_PARTNER     16
#define BATTLER_CATEGORY_DEFENDER_PARTNER     17
#define BATTLER_CATEGORY_FORCED_OUT           18
#define BATTLER_CATEGORY_ATTACKER_ENEMY       19
#define BATTLER_CATEGORY_DEFENDER_ENEMY       20
#define BATTLER_CATEGORY_MSG_BATTLER_TEMP     21
#define BATTLER_CATEGORY_SWITCHED_MON_AFTER   22
#define BATTLER_CATEGORY_MSG_TEMP           0xFF

#ifndef PM_ASM

typedef enum BattleBg {
    BATTLE_BG_GENERAL,
    BATTLE_BG_OCEAN,
    BATTLE_BG_CITY,
    BATTLE_BG_FOREST,
    BATTLE_BG_MOUNTAIN,
    BATTLE_BG_SNOW,
    BATTLE_BG_BUILDING_1,
    BATTLE_BG_BUILDING_2,
    BATTLE_BG_BUILDING_3,
    BATTLE_BG_CAVE_1,
    BATTLE_BG_CAVE_2,
    BATTLE_BG_CAVE_3,
    BATTLE_BG_WILL,
    BATTLE_BG_KOGA,
    BATTLE_BG_BRUNO,
    BATTLE_BG_KAREN,
    BATTLE_BG_LANCE,
    BATTLE_BG_DISTORTION_WORLD,
    BATTLE_BG_BATTLE_TOWER,
    BATTLE_BG_BATTLE_FACTORY,
    BATTLE_BG_BATTLE_ARCADE,
    BATTLE_BG_BATTLE_CASTLE,
    BATTLE_BG_BATTLE_HALL,
} BattleBg;

typedef enum Terrain {
    TERRAIN_PLAIN,
    TERRAIN_SAND,
    TERRAIN_GRASS,
    TERRAIN_PUDDLE,
    TERRAIN_MOUNTAIN, 
    TERRAIN_CAVE,
    TERRAIN_SNOW,
    TERRAIN_WATER,
    TERRAIN_ICE,
    TERRAIN_BUILDING, 
    TERRAIN_GREAT_MARSH, // unused
    TERRAIN_UNKNOWN, // unused
    TERRAIN_WILL,
    TERRAIN_KOGA,
    TERRAIN_BRUNO,
    TERRAIN_KAREN,
    TERRAIN_LANCE,
    TERRAIN_DISTORTION_WORLD, // unused
    TERRAIN_BATTLE_TOWER,
    TERRAIN_BATTLE_FACTORY,
    TERRAIN_BATTLE_ARCADE,
    TERRAIN_BATTLE_CASTLE,
    TERRAIN_BATTLE_HALL,
    TERRAIN_GIRATINA, // unused
    TERRAIN_MAX
} Terrain;

// This is a catch-all terrain that includes Pokemon League, Distortion World
// and Battle Frontier.
#define TERRAIN_OTHERS  (TERRAIN_WILL)

#endif //PM_ASM

// Battle outcome
// Used with BattleSetup::winFlag
#define BATTLE_OUTCOME_NONE                 0
#define BATTLE_OUTCOME_WIN                  1
#define BATTLE_OUTCOME_LOSE                 2
#define BATTLE_OUTCOME_DRAW                 3
#define BATTLE_OUTCOME_MON_CAUGHT           4
#define BATTLE_OUTCOME_PLAYER_FLED          5
#define BATTLE_OUTCOME_FOE_FLED             6

//Battle Result
#define BATTLE_IN_PROGRESS               0
#define BATTLE_RESULT_WIN               (1 << 0)
#define BATTLE_RESULT_LOSE              (1 << 1)
#define BATTLE_RESULT_CAPTURED_MON      (1 << 2)
#define BATTLE_RESULT_TRY_FLEE_WAIT     (1 << 6)
#define BATTLE_RESULT_TRY_FLEE          (1 << 7)

#define BATTLE_RESULT_DRAW              (BATTLE_RESULT_WIN | BATTLE_RESULT_LOSE)
#define BATTLE_RESULT_PLAYER_FLED       (BATTLE_RESULT_CAPTURED_MON | BATTLE_RESULT_WIN)
#define BATTLE_RESULT_ENEMY_FLED        (BATTLE_RESULT_CAPTURED_MON | BATTLE_RESULT_LOSE)

//Battle Type
#define BATTLE_TYPE_NONE                     0
#define BATTLE_TYPE_TRAINER                 (1 << 0)
#define BATTLE_TYPE_DOUBLES                 (1 << 1)
#define BATTLE_TYPE_LINK                    (1 << 2)
#define BATTLE_TYPE_MULTI                   (1 << 3)
#define BATTLE_TYPE_TAG                     (1 << 4)
#define BATTLE_TYPE_SAFARI                  (1 << 5)
#define BATTLE_TYPE_AI                      (1 << 6)
#define BATTLE_TYPE_FRONTIER                (1 << 7)
#define BATTLE_TYPE_ROAMER                  (1 << 8)
#define BATTLE_TYPE_PAL_PARK                (1 << 9)
#define BATTLE_TYPE_TUTORIAL                (1 << 10)
#define BATTLE_TYPE_11                      (1 << 11)
#define BATTLE_TYPE_BUG_CONTEST             (1 << 12)
#define BATTLE_TYPE_13                      (1 << 13)
#define BATTLE_TYPE_DEBUG                   (1 << 31)

#define BATTLE_TYPE_NO_EXP                  (BATTLE_TYPE_LINK | BATTLE_TYPE_SAFARI | BATTLE_TYPE_FRONTIER | BATTLE_TYPE_PAL_PARK)

//Battle Special Flags
#define BATTLE_SPECIAL_FIRST_RIVAL          (1 << 0)
#define BATTLE_SPECIAL_HONEY_TREE           (1 << 1)
#define BATTLE_SPECIAL_NO_RUNNING           (1 << 2)
#define BATTLE_SPECIAL_LEGENDARY            (1 << 3)
#define BATTLE_SPECIAL_RECORDING            (1 << 4)
#define BATTLE_SPECIAL_RECORDED             (1 << 5)
#define BATTLE_SPECIAL_GIRATINA             (1 << 6)
#define BATTLE_SPECIAL_DISTORTION_WORLD     (1 << 7)

//Move Effects Flags
#define MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER      (3 << 0)
#define MOVE_EFFECT_FLAG_LEECH_SEED              (1 << 2)
#define MOVE_EFFECT_FLAG_LOCK_ON_0               (1 << 3)
#define MOVE_EFFECT_FLAG_LOCK_ON_1               (1 << 4)
#define MOVE_EFFECT_FLAG_LOCK_ON_SET             (1 << 4)
#define MOVE_EFFECT_FLAG_PERISH_SONG             (1 << 5)
#define MOVE_EFFECT_FLAG_FLY                     (1 << 6)
#define MOVE_EFFECT_FLAG_DIG                     (1 << 7)
#define MOVE_EFFECT_FLAG_MINIMIZE                (1 << 8)
#define MOVE_EFFECT_FLAG_CHARGE                  (1 << 9)
#define MOVE_EFFECT_FLAG_INGRAIN                 (1 << 10)
#define MOVE_EFFECT_FLAG_YAWN                    (3 << 11)
#define MOVE_EFFECT_FLAG_IMPRISON_USER           (1 << 13)
#define MOVE_EFFECT_FLAG_GRUDGE                  (1 << 14)
#define MOVE_EFFECT_FLAG_LUCKY_CHANT             (1 << 15) 
#define MOVE_EFFECT_FLAG_MUD_SPORT               (1 << 16)
#define MOVE_EFFECT_FLAG_WATER_SPORT             (1 << 17)
#define MOVE_EFFECT_FLAG_DIVE                    (1 << 18)
#define MOVE_EFFECT_FLAG_INTIMIDATE              (1 << 19) //unclear why this is a move effect
#define MOVE_EFFECT_FLAG_ROLE_PLAY               (1 << 20)
#define MOVE_EFFECT_FLAG_ABILITY_SUPPRESSED      (1 << 21)
#define MOVE_EFFECT_FLAG_MIRACLE_EYE             (1 << 22)
#define MOVE_EFFECT_FLAG_POWER_TRICK             (1 << 23)
#define MOVE_EFFECT_FLAG_AQUA_RING               (1 << 24)
#define MOVE_EFFECT_FLAG_HEAL_BLOCK              (1 << 25)
#define MOVE_EFFECT_FLAG_EMBARGO                 (1 << 26)
#define MOVE_EFFECT_FLAG_MAGNET_RISE             (1 << 27)
#define MOVE_EFFECT_FLAG_CAMOUFLAGE              (1 << 28)    
#define MOVE_EFFECT_FLAG_PHANTOM_FORCE           (1 << 29)
#define MOVE_EFFECT_FLAG_IMPRISON                (1 << 30)

#define MOVE_EFFECT_FLAG_LOCK_ON                 (MOVE_EFFECT_FLAG_LOCK_ON_0 | MOVE_EFFECT_FLAG_LOCK_ON_1)

#define MOVE_EFFECT_FLAG_BATON_PASSABLE          (MOVE_EFFECT_FLAG_LEECH_SEED_BATTLER | MOVE_EFFECT_FLAG_LEECH_SEED | MOVE_EFFECT_FLAG_LOCK_ON | MOVE_EFFECT_FLAG_PERISH_SONG | MOVE_EFFECT_FLAG_INGRAIN | MOVE_EFFECT_FLAG_LUCKY_CHANT | MOVE_EFFECT_FLAG_MUD_SPORT | MOVE_EFFECT_FLAG_WATER_SPORT | MOVE_EFFECT_FLAG_ABILITY_SUPPRESSED | MOVE_EFFECT_FLAG_POWER_TRICK | MOVE_EFFECT_FLAG_AQUA_RING | MOVE_EFFECT_FLAG_HEAL_BLOCK | MOVE_EFFECT_FLAG_EMBARGO | MOVE_EFFECT_FLAG_MAGNET_RISE)    
#define MOVE_EFFECT_FLAG_HIDE_SUBSTITUTE         (MOVE_EFFECT_FLAG_FLY | MOVE_EFFECT_FLAG_DIG | MOVE_EFFECT_FLAG_DIVE | MOVE_EFFECT_FLAG_PHANTOM_FORCE)
#define MOVE_EFFECT_FLAG_SEMI_INVULNERABLE       (MOVE_EFFECT_FLAG_FLY | MOVE_EFFECT_FLAG_DIG | MOVE_EFFECT_FLAG_DIVE | MOVE_EFFECT_FLAG_PHANTOM_FORCE)

#define MOVE_EFFECT_FLAG_LOCK_ON_SHIFT           3
#define MOVE_EFFECT_FLAG_YAWN_SHIFT             11

//Move side effects
#define MOVE_SIDE_EFFECT_BREAK_SCREENS              (1 << 23)
#define MOVE_SIDE_EFFECT_CHECK_SUBSTITUTE           (1 << 24)
#define MOVE_SIDE_EFFECT_CHECK_HP_AND_SUBSTITUTE    (1 << 25)
#define MOVE_SIDE_EFFECT_PROBABILISTIC              (1 << 26)
#define MOVE_SIDE_EFFECT_CANNOT_PREVENT             (1 << 27)
#define MOVE_SIDE_EFFECT_CHECK_HP                   (1 << 28)
#define MOVE_SIDE_EFFECT_ON_HIT                     (1 << 29)
#define MOVE_SIDE_EFFECT_TO_ATTACKER                (1 << 30)
#define MOVE_SIDE_EFFECT_TO_DEFENDER                (1 << 31)

//Move status
#define MOVE_STATUS_MISSED                  (1 << 0)
#define MOVE_STATUS_SUPER_EFFECTIVE         (1 << 1) 
#define MOVE_STATUS_NOT_VERY_EFFECTIVE      (1 << 2)
#define MOVE_STATUS_NO_EFFECT               (1 << 3) 
#define MOVE_STATUS_CRITICAL_HIT            (1 << 4)
#define MOVE_STATUS_ONE_HIT_KO              (1 << 5)
#define MOVE_STATUS_FAILED                  (1 << 6)
#define MOVE_STATUS_ENDURED                 (1 << 7)
#define MOVE_STATUS_ENDURED_ITEM            (1 << 8)
#define MOVE_STATUS_NO_PP                   (1 << 9)
#define MOVE_STATUS_BYPASSED_ACCURACY       (1 << 10)
#define MOVE_STATUS_LEVITATE_IMMUNE         (1 << 11)
#define MOVE_STATUS_ONE_HIT_KO_FAILED       (1 << 12)
#define MOVE_STATUS_SPLASH                  (1 << 13)
#define MOVE_STATUS_MULTI_HIT_DISRUPTED     (1 << 14)
#define MOVE_STATUS_PROTECTED               (1 << 15)
#define MOVE_STATUS_SEMI_INVULNERABLE       (1 << 16)
#define MOVE_STATUS_LOST_FOCUS              (1 << 17)
#define MOVE_STATUS_WONDER_GUARD_IMMUNE     (1 << 18) 
#define MOVE_STATUS_STURDY                  (1 << 19)
#define MOVE_STATUS_MAGNET_RISE_IMMUNE      (1 << 20)
#define MOVE_STATUS_NO_MORE_WORK            (1 << 31)

#define MOVE_STATUS_ANY_EFFECTIVE           (MOVE_STATUS_SUPER_EFFECTIVE | MOVE_STATUS_NOT_VERY_EFFECTIVE)

#define MOVE_STATUS_DID_NOT_HIT             (MOVE_STATUS_MISSED | MOVE_STATUS_NO_EFFECT | MOVE_STATUS_FAILED | MOVE_STATUS_LEVITATE_IMMUNE | MOVE_STATUS_ONE_HIT_KO_FAILED | MOVE_STATUS_MULTI_HIT_DISRUPTED | MOVE_STATUS_PROTECTED | MOVE_STATUS_SEMI_INVULNERABLE | MOVE_STATUS_LOST_FOCUS | MOVE_STATUS_WONDER_GUARD_IMMUNE | MOVE_STATUS_STURDY | MOVE_STATUS_MAGNET_RISE_IMMUNE)
#define MOVE_STATUS_FAIL                    (MOVE_STATUS_DID_NOT_HIT | MOVE_STATUS_NO_PP | MOVE_STATUS_NO_MORE_WORK)

//Field Conditions
#define FIELD_CONDITION_RAIN                (1 << 0)
#define FIELD_CONDITION_RAIN_PERMANENT      (1 << 1)
#define FIELD_CONDITION_RAIN_ALL            (FIELD_CONDITION_RAIN | FIELD_CONDITION_RAIN_PERMANENT)
#define FIELD_CONDITION_SANDSTORM           (1 << 2)
#define FIELD_CONDITION_SANDSTORM_PERMANENT (1 << 3)
#define FIELD_CONDITION_SANDSTORM_ALL       (FIELD_CONDITION_SANDSTORM | FIELD_CONDITION_SANDSTORM_PERMANENT)
#define FIELD_CONDITION_SUN                 (1 << 4)
#define FIELD_CONDITION_SUN_PERMANENT       (1 << 5)
#define FIELD_CONDITION_SUN_ALL             (FIELD_CONDITION_SUN | FIELD_CONDITION_SUN_PERMANENT)
#define FIELD_CONDITION_HAIL                (1 << 6)
#define FIELD_CONDITION_HAIL_PERMANENT      (1 << 7)
#define FIELD_CONDITION_HAIL_ALL            (FIELD_CONDITION_HAIL | FIELD_CONDITION_HAIL_PERMANENT)
#define FIELD_CONDITION_UPROAR              (15 << 8)
#define FIELD_CONDITION_GRAVITY_INIT        (5 << 12)
#define FIELD_CONDITION_GRAVITY             (7 << 12)
#define FIELD_CONDITION_FOG                 (1 << 15)
#define FIELD_CONDITION_TRICK_ROOM_INIT     (5 << 16)
#define FIELD_CONDITION_TRICK_ROOM          (7 << 16)

#define FIELD_CONDITION_WEATHER_NO_SUN      (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SANDSTORM_ALL | FIELD_CONDITION_HAIL_ALL | FIELD_CONDITION_FOG)
#define FIELD_CONDITION_WEATHER_CASTFORM    (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SUN_ALL | FIELD_CONDITION_HAIL_ALL)
#define FIELD_CONDITION_WEATHER             (FIELD_CONDITION_RAIN_ALL | FIELD_CONDITION_SANDSTORM_ALL | FIELD_CONDITION_SUN_ALL | FIELD_CONDITION_HAIL_ALL | FIELD_CONDITION_FOG)

#define FIELD_CONDITION_UPROAR_SHIFT         8
#define FIELD_CONDITION_GRAVITY_SHIFT       12
#define FIELD_CONDITION_TRICK_ROOM_SHIFT    16
    
//Field Side Conditions Flags
#define SIDE_CONDITION_REFLECT              (1 << 0)
#define SIDE_CONDITION_LIGHT_SCREEN         (1 << 1)
#define SIDE_CONDITION_SPIKES               (1 << 2)
#define SIDE_CONDITION_SAFEGUARD            (1 << 3)
#define SIDE_CONDITION_FUTURE_SIGHT         (1 << 4)
#define SIDE_CONDITION_WISH                 (1 << 5)
#define SIDE_CONDITION_MIST                 (1 << 6)
#define SIDE_CONDITION_STEALTH_ROCKS        (1 << 7)
#define SIDE_CONDITION_TAILWIND             (3 << 8)
#define SIDE_CONDITION_TOXIC_SPIKES         (1 << 10)
#define SIDE_CONDITION_LUCKY_CHANT          (7 << 12)

#define SIDE_CONDITION_TAILWIND_SHIFT        8
#define SIDE_CONDITION_LUCKY_CHANT_SHIFT    12

//Side Condition Enums
#define SIDE_COND_REFLECT_TURNS         0
#define SIDE_COND_LIGHT_SCREEN_TURNS    1
#define SIDE_COND_MIST_TURNS            2
#define SIDE_COND_SAFEGUARD_TURNS       3
#define SIDE_COND_SPIKES_LAYERS         4
#define SIDE_COND_TOXIC_SPIKES_LAYERS   5

//Status
#define STATUS_NONE                          0
#define STATUS_SLEEP_0                      (1 << 0)
#define STATUS_SLEEP_1                      (1 << 1)
#define STATUS_SLEEP_2                      (1 << 2)
#define STATUS_POISON                       (1 << 3)
#define STATUS_BURN                         (1 << 4)
#define STATUS_FREEZE                       (1 << 5)    
#define STATUS_PARALYSIS                    (1 << 6)
#define STATUS_BAD_POISON                   (1 << 7)
#define STATUS_POISON_COUNT                 (15 << 8)

#define STATUS_SLEEP                        (STATUS_SLEEP_0 | STATUS_SLEEP_1 | STATUS_SLEEP_2)
#define STATUS_NOT_SLEEP                    ~STATUS_SLEEP
#define STATUS_POISON_ALL                   (STATUS_POISON | STATUS_BAD_POISON | STATUS_POISON_COUNT)

#define STATUS_ALL                          (STATUS_SLEEP | STATUS_POISON | STATUS_BURN | STATUS_FREEZE | STATUS_PARALYSIS | STATUS_BAD_POISON)
#define STATUS_FACADE_BOOST                 (STATUS_POISON | STATUS_BAD_POISON | STATUS_BURN | STATUS_PARALYSIS)
#define STATUS_CAN_SYNCHRONIZE              (STATUS_POISON | STATUS_BURN | STATUS_PARALYSIS)

#define STATUS_POISON_COUNT_SHIFT           8

//Status Conditions
#define CONDITION_NONE                      0
#define CONDITION_SLEEP                     1
#define CONDITION_POISON                    2
#define CONDITION_BURN                      3
#define CONDITION_FREEZE                    4
#define CONDITION_PARALYSIS                 5

//Status 2
#define STATUS2_CONFUSION                   (7 << 0)
#define STATUS2_FLINCH                      (1 << 3)
#define STATUS2_UPROAR                      (7 << 4)
#define STATUS2_BIDE_0                      (1 << 8)
#define STATUS2_BIDE_1                      (1 << 9)
#define STATUS2_RAMPAGE                     (3 << 10)
#define STATUS2_LOCKED_INTO_MOVE            (1 << 12)
#define STATUS2_BIND                        (7 << 13)
#define STATUS2_ATTRACT_BATTLER1            (1 << 16)
#define STATUS2_ATTRACT_BATTLER2            (1 << 17)
#define STATUS2_ATTRACT_BATTLER3            (1 << 18)
#define STATUS2_ATTRACT_BATTLER4            (1 << 19)
#define STATUS2_FOCUS_ENERGY                (1 << 20)
#define STATUS2_TRANSFORM                   (1 << 21)
#define STATUS2_RECHARGE                    (1 << 22)
#define STATUS2_RAGE                        (1 << 23)
#define STATUS2_SUBSTITUTE                  (1 << 24)
#define STATUS2_DESTINY_BOND                (1 << 25)
#define STATUS2_MEAN_LOOK                   (1 << 26)
#define STATUS2_NIGHTMARE                   (1 << 27)
#define STATUS2_CURSE                       (1 << 28)
#define STATUS2_FORESIGHT                   (1 << 29)
#define STATUS2_DEFENSE_CURL                (1 << 30)
#define STATUS2_TORMENT                     (1 << 31)

#define STATUS2_BIDE                        (STATUS2_BIDE_0 | STATUS2_BIDE_1)
#define STATUS2_ATTRACT                     (STATUS2_ATTRACT_BATTLER1 | STATUS2_ATTRACT_BATTLER2 | STATUS2_ATTRACT_BATTLER3 | STATUS2_ATTRACT_BATTLER4)

#define STATUS2_UPROAR_SHIFT                 4
#define STATUS2_BIDE_SHIFT                   8
#define STATUS2_RAMPAGE_SHIFT               10
#define STATUS2_BINDING_SHIFT               13
#define STATUS2_ATTRACT_SHIFT               16    

#define STATUS2_BATON_PASSABLE              (STATUS2_CONFUSION | STATUS2_FOCUS_ENERGY | STATUS2_SUBSTITUTE | STATUS2_MEAN_LOOK | STATUS2_CURSE)

//Self Turns Flags
#define SELF_TURN_FLAG_CLEAR                 0
#define SELF_TURN_FLAG_PLUCK_BERRY          (1 << 1)
#define SELF_TURN_FLAG_INFATUATED           (1 << 2)
#define SELF_TURN_FLAG_SUBSTITUTE_HIT       (1 << 3)

//Struggle Checks
#define STRUGGLE_CHECK_NO_MOVES             (1 << 0)
#define STRUGGLE_CHECK_NO_PP                (1 << 1)
#define STRUGGLE_CHECK_DISABLED             (1 << 2)
#define STRUGGLE_CHECK_TORMENT              (1 << 3)
#define STRUGGLE_CHECK_TAUNT                (1 << 4)
#define STRUGGLE_CHECK_IMPRISON             (1 << 5)
#define STRUGGLE_CHECK_GRAVITY              (1 << 6)
#define STRUGGLE_CHECK_HEAL_BLOCK           (1 << 7)
#define STRUGGLE_CHECK_ENCORE               (1 << 8) //unused because they straight up forgot
#define STRUGGLE_CHECK_CHOICED              (1 << 9)
    
//Ability Checks
#define CHECK_ABILITY_SAME_SIDE             0
#define CHECK_ABILITY_SAME_SIDE_HP          1
#define CHECK_ABILITY_OPPOSING_SIDE         2
#define CHECK_ABILITY_OPPOSING_SIDE_HP      3
#define CHECK_ABILITY_OPPOSING_SIDE_HP_RET  4
#define CHECK_ABILITY_ALL                   5
#define CHECK_ABILITY_ALL_NOT_USER          6
#define CHECK_ABILITY_ALL_NOT_USER_RET      7
#define CHECK_ABILITY_ALL_HP                8
#define CHECK_ABILITY_ALL_HP_NOT_USER       9

//Battle Mon Data
#define BMON_DATA_SPECIES                    0
#define BMON_DATA_ATK                        1
#define BMON_DATA_DEF                        2
#define BMON_DATA_SPEED                      3
#define BMON_DATA_SPATK                      4    
#define BMON_DATA_SPDEF                      5
#define BMON_DATA_MOVE1                      6
#define BMON_DATA_MOVE2                      7
#define BMON_DATA_MOVE3                      8
#define BMON_DATA_MOVE4                      9
#define BMON_DATA_HP_IV                     10
#define BMON_DATA_ATK_IV                    11
#define BMON_DATA_DEF_IV                    12
#define BMON_DATA_SPEED_IV                  13
#define BMON_DATA_SPATK_IV                  14
#define BMON_DATA_SPDEF_IV                  15
#define BMON_DATA_IS_EGG                    16
#define BMON_DATA_HAS_NICKNAME              17
#define BMON_DATA_STAT_CHANGE_HP            18
#define BMON_DATA_STAT_CHANGE_ATK           19
#define BMON_DATA_STAT_CHANGE_DEF           20
#define BMON_DATA_STAT_CHANGE_SPEED         21
#define BMON_DATA_STAT_CHANGE_SPATK         22
#define BMON_DATA_STAT_CHANGE_SPDEF         23
#define BMON_DATA_STAT_CHANGE_ACC           24
#define BMON_DATA_STAT_CHANGE_EVASION       25
#define BMON_DATA_ABILITY                   26
#define BMON_DATA_TYPE_1                    27
#define BMON_DATA_TYPE_2                    28
#define BMON_DATA_GENDER                    29
#define BMON_DATA_IS_SHINY                  30
#define BMON_DATA_CUR_PP_1                  31
#define BMON_DATA_CUR_PP_2                  32
#define BMON_DATA_CUR_PP_3                  33
#define BMON_DATA_CUR_PP_4                  34
#define BMON_DATA_PP_UPS_1                  35
#define BMON_DATA_PP_UPS_2                  36
#define BMON_DATA_PP_UPS_3                  37
#define BMON_DATA_PP_UPS_4                  38
#define BMON_DATA_MAX_PP_1                  39
#define BMON_DATA_MAX_PP_2                  40
#define BMON_DATA_MAX_PP_3                  41
#define BMON_DATA_MAX_PP_4                  42
#define BMON_DATA_LEVEL                     43
#define BMON_DATA_FRIENDSHIP                44
#define BMON_DATA_NICKNAME                  45
#define BMON_DATA_NICKNAME_STRBUF           46
#define BMON_DATA_HP                        47
#define BMON_DATA_MAXHP                     48
#define BMON_DATA_OT_NAME                   49
#define BMON_DATA_EXP                       50
#define BMON_DATA_PERSONALITY               51
#define BMON_DATA_STATUS                    52
#define BMON_DATA_STATUS2                   53
#define BMON_DATA_OT_ID                     54 
#define BMON_DATA_HELD_ITEM                 55
#define BMON_DATA_TIMES_DAMAGED             56
#define BMON_DATA_MSG_FLAG                  57
#define BMON_DATA_OT_GENDER                 58
#define BMON_DATA_MOVE_EFFECT               59
#define BMON_DATA_MOVE_EFFECT_TEMP          60
#define BMON_DATA_DISABLED_TURNS            61
#define BMON_DATA_ENCORED_TURNS             62
#define BMON_DATA_CHARGED_TURNS             63
#define BMON_DATA_TAUNTED_TURNS             64
#define BMON_DATA_PROTECT_SUCCESS_COUNT     65
#define BMON_DATA_PERISH_SONG_TURNS         66
#define BMON_DATA_ROLLOUT_TURNS             67
#define BMON_DATA_FURY_CUTTER_TURNS         68
#define BMON_DATA_STOCKPILE_COUNT           69
#define BMON_DATA_STOCKPILE_DEF_BOOSTS      70
#define BMON_DATA_STOCKPILE_SPDEF_BOOSTS    71
#define BMON_DATA_TRUANT                    72
#define BMON_DATA_FLASH_FIRE                73
#define BMON_DATA_LOCK_ON_TARGET            74
#define BMON_DATA_MIMICED_MOVE              75
#define BMON_DATA_BIND_TARGET               76 
#define BMON_DATA_MEAN_LOOK_TARGET          77
#define BMON_DATA_LAST_RESORT_COUNT         78
#define BMON_DATA_MAGNET_RISE_TURNS         79
#define BMON_DATA_HEAL_BLOCK_TURNS          80
#define BMON_DATA_EMBARGO_TURNS             81
#define BMON_DATA_CAN_UNBURDEN              82
#define BMON_DATA_METRONOME_TURNS           83
#define BMON_DATA_MICLE_BERRY_FLAG          84
#define BMON_DATA_CUSTAP_FLAG               85
#define BMON_DATA_QUICK_CLAW_FLAG           86
#define BMON_DATA_RECHARGE                  87
#define BMON_DATA_FAKE_OUT                  88
#define BMON_DATA_SLOW_START_TURN_NUMBER    89
#define BMON_DATA_SUBSTITUTE_HP             90
#define BMON_DATA_TRANSFORMED_PERSONALITY   91
#define BMON_DATA_DISABLED_MOVE_NO          92
#define BMON_DATA_ENCORED_MOVE_NO           93
#define BMON_DATA_BINDING_MOVE_NO           94
#define BMON_DATA_HELD_ITEM_RESTORE_HP      95
#define BMON_DATA_SLOW_START_FLAG           96
#define BMON_DATA_SLOW_START_END            97
#define BMON_DATA_FORM                      98
#define BMON_DATA_99                        99 //unused
#define BMON_DATA_TEMP                     100

//Battle Status
#define BATTLE_STATUS_NO_ATTACK_MESSAGE             (1 << 0)
#define BATTLE_STATUS_CHECK_LOOP_ONLY_ONCE          (1 << 1)
#define BATTLE_STATUS_HIT_FLY                       (1 << 2)
#define BATTLE_STATUS_HIT_DIG                       (1 << 3)     
#define BATTLE_STATUS_HIT_DIVE                      (1 << 4)
#define BATTLE_STATUS_CHARGE_TURN                   (1 << 5)
#define BATTLE_STATUS_NO_BLINK                      (1 << 6)
#define BATTLE_STATUS_SYNCRONIZE                    (1 << 7)
#define BATTLE_STATUS_BATON_PASS                    (1 << 8)
#define BATTLE_STATUS_CHARGE_MOVE_HIT               (1 << 9)
#define BATTLE_STATUS_FLAT_HIT_RATE                 (1 << 10)
#define BATTLE_STATUS_IGNORE_TYPE_EFFECTIVENESS     (1 << 11)  
#define BATTLE_STATUS_CRASH_DAMAGE                  (1 << 12)
#define BATTLE_STATUS_MOVE_SUCCESSFUL               (1 << 13)
#define BATTLE_STATUS_MOVE_ANIMATIONS_OFF           (1 << 14)
#define BATTLE_STATUS_IGNORE_TYPE_IMMUNITY          (1 << 15)
#define BATTLE_STATUS_MULTI_HIT_IGNORE_MESSAGE      (1 << 16)
#define BATTLE_STATUS_FAIL_STAT_STAGE_CHANGE        (1 << 17)
#define BATTLE_STATUS_MISS_MESSAGE                  (1 << 18)
#define BATTLE_STATUS_SHADOW_FORCE                  (1 << 19)
#define BATTLE_STATUS_NO_MOVE_SET                   (1 << 20)
#define BATTLE_STATUS_MESSAGES_OFF                  (1 << 21)
#define BATTLE_STATUS_SECONDARY_EFFECT              (1 << 22)
#define BATTLE_STATUS_MOLD_BREAKER                  (1 << 23)
#define BATTLE_STATUS_FAINTED                       (15 << 24)
#define BATTLE_STATUS_SELFDESTRUCTED                (15 << 28)

#define BATTLE_STATUS_FAINTED_SHIFT                 24
#define BATTLE_STATUS_SELFDESTRUCTED_SHIFT          28

//Battle Status 2
#define BATTLE_STATUS2_NO_EXP_GAINED                (1 << 0)
#define BATTLE_STATUS2_UPDATE_STAT_STAGES           (1 << 1)
#define BATTLE_STATUS2_DISPLAY_ATTACK_MESSAGE       (1 << 2)
#define BATTLE_STATUS2_MAGIC_COAT                   (1 << 3)
#define BATTLE_STATUS2_UTURN                        (1 << 4)
#define BATTLE_STATUS2_FIRST_DAMAGE_MESSAGE         (1 << 5)
#define BATTLE_STATUS2_MOVE_SUCCEEDED               (1 << 6)
#define BATTLE_STATUS2_STAT_STAGE_CHANGE_SHOWN      (1 << 7)
#define BATTLE_STATUS2_RECOVER_HP_VISUAL            (1 << 8)
#define BATTLE_STATUS2_20                           (1 << 20)
#define BATTLE_STATUS2_FORM_CHANGE                  (1 << 26)
#define BATTLE_STATUS2_RECALC_MON_STATS             (1 << 27)
#define BATTLE_STATUS2_EXP_GAIN                     (15 << 28)

#define BATTLE_STATUS2_EXP_GAIN_SHIFT               28

//Stat Changes
#define STAT_DOWN_6          0
#define STAT_DOWN_5          1
#define STAT_DOWN_4          2
#define STAT_DOWN_3          3
#define STAT_DOWN_2          4
#define STAT_DOWN_1          5
#define STAT_NEUTRAL         6
#define STAT_UP_1            7
#define STAT_UP_2            8
#define STAT_UP_3            9
#define STAT_UP_4           10
#define STAT_UP_5           11
#define STAT_UP_6           12

//Trainer AI Flags

#define AI_DOUBLES      (1 << 7)
#define AI_29           (1 << 29)

//Action Input Consts
#define BATTLE_INPUT_FIGHT      1
#define BATTLE_INPUT_ITEM       2
#define BATTLE_INPUT_POKEMON    3
#define BATTLE_INPUT_RUN        4
#define BATTLE_INPUT_CANCEL     0xFF

//Multi hit flags
#define MULTIHIT_SKIP_OBEDIENCE_CHECK    (1 << 0)
#define MULTIHIT_SKIP_TYPE_CHART_CHECK   (1 << 1)
#define MULTIHIT_SKIP_STATUS_CHECK       (1 << 2)
#define MULTIHIT_SKIP_PP_DECREMENT       (1 << 3)
#define MULTIHIT_SKIP_IMMUNITY_TRIGGERS  (1 << 4)
#define MULTIHIT_SKIP_ACCURACY_CHECK     (1 << 5)
#define MULTIHIT_SKIP_ACCURACY_OVERRIDES (1 << 6)
#define MULTIHIT_SKIP_STOLEN_CHECK       (1 << 7)

#define MULTIHIT_HIT_MULTIPLE_TARGETS    (MULTIHIT_SKIP_OBEDIENCE_CHECK | MULTIHIT_SKIP_STATUS_CHECK | MULTIHIT_SKIP_PP_DECREMENT)
#define MULTIHIT_TRIPLE_KICK             (MULTIHIT_HIT_MULTIPLE_TARGETS | MULTIHIT_SKIP_IMMUNITY_TRIGGERS | MULTIHIT_SKIP_ACCURACY_OVERRIDES | MULTIHIT_SKIP_STOLEN_CHECK)
#define MULTIHIT_MULTI_HIT_MOVE          (MULTIHIT_TRIPLE_KICK | MULTIHIT_SKIP_ACCURACY_CHECK)

//Side Effect Type
#define SIDE_EFFECT_TYPE_NONE         0
#define SIDE_EFFECT_TYPE_DIRECT       1
#define SIDE_EFFECT_TYPE_INDIRECT     2
#define SIDE_EFFECT_TYPE_ABILITY      3
#define SIDE_EFFECT_TYPE_MOVE_EFFECT  4
#define SIDE_EFFECT_TYPE_HELD_ITEM    5
#define SIDE_EFFECT_TYPE_TOXIC_SPIKES 6
#define SIDE_EFFECT_TYPE_DISOBEDIENCE 7
    
#define AFTER_MOVE_MESSAGE_ONE_HIT      0
#define AFTER_MOVE_MESSAGE_MULTI_HIT    1

//Capture Types
#define CAPTURE_NORMAL  0
#define CAPTURE_SAFARI  1

//Battle Controller Commands
#ifndef PM_ASM
typedef enum ControllerCommand {
    CONTROLLER_COMMAND_GET_BATTLE_MON,
    CONTROLLER_COMMAND_START_ENCOUNTER,
    CONTROLLER_COMMAND_TRAINER_MESSAGE,
    CONTROLLER_COMMAND_SEND_OUT,
    CONTROLLER_COMMAND_SELECTION_SCREEN_INIT,
    CONTROLLER_COMMAND_SELECTION_SCREEN_INPUT,
    CONTROLLER_COMMAND_CALC_EXECUTION_ORDER,
    CONTROLLER_COMMAND_BEFORE_TURN,
    CONTROLLER_COMMAND_8,
    CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION,
    CONTROLLER_COMMAND_UPDATE_MON_CONDITION, //10
    CONTROLLER_COMMAND_UPDATE_FIELD_CONDITION_EXTRA,
    CONTROLLER_COMMAND_TURN_END,
    CONTROLLER_COMMAND_FIGHT_INPUT,
    CONTROLLER_COMMAND_ITEM_INPUT,
    CONTROLLER_COMMAND_POKEMON_INPUT, //15
    CONTROLLER_COMMAND_RUN_INPUT,
    CONTROLLER_COMMAND_SAFARI_THROW_BALL,
    CONTROLLER_COMMAND_SAFARI_THROW_MUD,
    CONTROLLER_COMMAND_SAFARI_RUN,
    CONTROLLER_COMMAND_SAFARI_WATCHING, //20
    CONTROLLER_COMMAND_CATCHING_CONSTEST_THROW_BALL,
    CONTROLLER_COMMAND_RUN_SCRIPT,
    CONTROLLER_COMMAND_23,
    CONTROLLER_COMMAND_24,
    CONTROLLER_COMMAND_25,
    CONTROLLER_COMMAND_26,
    CONTROLLER_COMMAND_27,
    CONTROLLER_COMMAND_HP_CALC,
    CONTROLLER_COMMAND_29,
    CONTROLLER_COMMAND_30,
    CONTROLLER_COMMAND_31,
    CONTROLLER_COMMAND_32,
    CONTROLLER_COMMAND_33,
    CONTROLLER_COMMAND_34,
    CONTROLLER_COMMAND_35,
    CONTROLLER_COMMAND_36,
    CONTROLLER_COMMAND_37,
    CONTROLLER_COMMAND_38,
    CONTROLLER_COMMAND_39,
    CONTROLLER_COMMAND_40,
    CONTROLLER_COMMAND_41,
    CONTROLLER_COMMAND_42,
    CONTROLLER_COMMAND_43,
    CONTROLLER_COMMAND_44,
    CONTROLLER_COMMAND_45,
    CONTROLLER_COMMAND_MAX
} ControllerCommand;

//Critical Music Flags
#define CRITICAL_MUSIC_OFF  2

#endif //PM_ASM
#endif //POKEHEARTGOLD_CONSTANTS_BATTLE_H
