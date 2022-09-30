/// @description Gameover aftermath
var has_level = false
scr_gameover(has_level)

if global.replay_match_allowed room_goto(rm_menu_saverep)
else if room == rm_blitz room_goto(rm_stats_blitz)
else if room == rm_countdown room_goto(rm_stats_countdown)
else room_goto(rm_menu)