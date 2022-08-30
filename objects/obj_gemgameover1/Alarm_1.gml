/// @description Insert description here
// You can write your code in this editor
if room == rm_blitz
{
	if !file_exists("Stats/stats_blitz"+string(global.timer)+".ini") stats_create_blitz()
	global.STATS_file = "stats_blitz"+string(global.timer)+".ini"
	global.STATS_gamemode = "blitz_"+string(global.timer)
	global.STATS_points = Gamerule_1.points
	gameover_update_stats(false)
}
else if room == rm_countdown
{
	global.STATS_points = Gamerule_1.points
	global.STATS_file = "stats_countdown.ini"
	global.STATS_gamemode = "countdown"
	if !file_exists("Stats/"+global.STATS_file)
	{
		stats_create_countdown()
	}
	gameover_update_stats(false)
}

if global.replay_match_allowed room_goto(rm_menu_saverep)
else if room == rm_blitz room_goto(rm_stats_blitz)
else if room == rm_countdown room_goto(rm_stats_countdown)
else room_goto(rm_menu)