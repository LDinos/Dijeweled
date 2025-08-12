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

	if (global.replay_match_allowed)
	{
		write_replay_local()
	}
}