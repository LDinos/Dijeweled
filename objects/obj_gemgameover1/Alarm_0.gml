/// @description checking for condition first
// You can write your code in this editor
if i <= 7
{
	for(j=0;j<=7;j++)
	{
		var g = Gamerule_1.gem_board1[i][j]
		if instance_exists(g)
		{
			if g.skinnum = 7
			{
				with(g) delete_gem()
			}
			else instance_destroy(g,true)
		}
	}
	i++
	alarm[0] = 10
}
else
{
	#region secret
	if Gamerule_1.points >= 300000
	{
		gamemode_unlock(MODE_SWIFT, 0, 512)
	}
	#endregion
	
	Gamerule_1.gameover = true
	audio_play_sound(vo_gameover,0,0)
	instance_create(room_width/2,room_height - 720/2,obj_gameover_text)
	alarm[1] = 300
	#region save replay
	if global.replay_match_allowed
{
	var timetouse = -1
	if Gamerule_1.time_allowed
	{
		timetouse = global.timer
	}

	var num = 0
	var mydate = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	
	while file_exists("Replays/"+string(num) + ".rep")
	{
		num++
	}

	global.string_to_save = "Replays/"+ string(num) + ".rep"
	ini_open(global.string_to_save)
		var str = ds_map_write(Gamerule_1.Replay_match_map)
		ini_write_string("replay","data",str)
		ini_write_string("replay","date",mydate)
		ini_write_string("replay","time",timetouse)
		ini_write_string("replay","score",Gamerule_1.points)
		ini_write_real("replay","geode_xplier",Gamerule_1.geode_xplier)
		ini_write_real("replay","replay_ver",1) //to check for any problems after changes
	ini_close()
}
#endregion
}