# QERunquake
Quake Enhanced RuneQuake mod

# What is it?

Good ole RuneQuake. This was modified to work with QE but pretty much the same version. The one I used was version 1.4.21. I am not the original author.

# How to install
Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: %userprofile%\Saved Games\Nightdive Studios\Quake\Id1
Create a folder called 'id1'
Create another folder and call it 'mpmod'. If you already have this folder, skip this step.
Extract zip into the 'id1' folder you created on step 2. If you already have an 'id1' folder, it's likely from another mod. Unfortunately, you'll have to replace it.
How to run the mod
Open console and type 'game mpmod'
Start a multiplayer game
Technical explanation
When you change to mpmod, it sets the root folder to be Saved Games, so next time the game goes into id1 it will use the files from Saved Games and override.


# Settings for Hosting


# saved3
//
//      1 no exiting                            NOEXIT_NO_EXITING
//      2 allow exiting start level             NOEXIT_ALLOW_EXITING_START
//      4 randomize                             NOEXIT_RANDOMIZE
//      8 select level by number of players     NOEXIT_CHOOSE_BY_NPLAYERS
//     16 use Marlinspike levels                NOEXIT_MARLINSPIKE_LEVELS
//     32 don't loop back to dm1 after dm6      NOEXIT_DM_NO_LOOP
//     64 * max players before forwarding       NOEXIT_FORWARD_MULT
//   1024 don't use custom levels               NOEXIT_NO_CUSTOM_LEVELS
//   2048 don't use standard maps               NOEXIT_CUSTOM_LEVELS_ONLY
//   4096 allow voting non-rotatable maps       NOEXIT_VOTE_ALL_MAPS
//
// If nplayers level selection is turned off the DM
// maps will still be played (in sequence with the normal maps).

// You can't exit any level.  The next level to play is chosen by the
// number of players. Loop back of dm1 after dm6 is turned off.
//
// 1 + 4  + 8 + 32 + 1024
saved3 1069

# saved4
//
//     1-63 number of runes                     T1_NRUNES_MASK
//       64 rune selection by impulse           T1_RUNE_CHEAT
//      128 [REMOVED]
//      256 can pick up own rune                T1_CAN_GET_OWN_RUNE
//     1024 random rune models                  T1_RANDOM_RUNE_MODELS
//     2048 fast rune spawn                     T1_FAST_RUNE_SPAWN
//     4096 * max players                       T1_MAX_PLAYERS_MULT
//
//    262144 [REMOVED]
//    524288 [REMOVED]
//   1048576 no hook voting                     T1_HOOK_NO_VOTE
//
//     65536 no rune drop delay                 T1_RUNE_DROP_DELAY_0
//     66048  15 second rune drop delay         T1_RUNE_DROP_DELAY_15
//    131072  30 second rune drop delay         T1_RUNE_DROP_DELAY_30
//       512  60 second rune drop delay         T1_RUNE_DROP_DELAY_60
//    131584 120 second rune drop delay         T1_RUNE_DROP_DELAY_120
//    196608 240 second rune drop delay         T1_RUNE_DROP_DELAY_240
//    197120 rune dropping disabled             T1_RUNE_DROP_DELAY_INF

// Level has 16 runes max, no drop on death, random rune models, fast spawn,
// no drop delay, and free hook.

saved4 200255


# scratch1
//
//    1 equalize all lightstyles               S1_EQUALIZE_LIGHTSTYLE
//    2 disable all ambient sounds             S1_AMBIENT_SOUND_OFF
//    4 don't spawn any static lights          S1_LIGHT_MAKESTATIC_OFF
//    8 bprint prints to server console        S1_BPRINT_TO_CONSOLE
//   16 keep original level items              S1_ORIGINAL_LEVELS
//   32 limit maximum traps per rune           S1_MAX_TRAPS_FOR_LEVEL
//   64 basic/lite runes                       S1_BASIC_RUNES
//  128 custom exits                           S1_CUSTOM_EXITS
//  256 [REMOVED]
//  512 [REMOVED]
// 1024 no default mode                        S1_NO_DEFAULT
// 2048 default mode arena                     S1_ARENA_DEFAULT
// 4096 default mode practice                  S1_PRACTICE_DEFAULT
// 8192 default mode match                     S1_MATCH_DEFAULT

// Force lightstyles 0-63 to one value, disable ambient sounds, disable
// static lights, and use custom exist.`
// 1 + 2 + 4 + 128
scratch1 135

Credits
Original Author of quake: Slot Zero

Teamred, r00k, JP: For help in testing, code advice
