///@description Update bad gem values and Discord
if Gamerule_1.IsGemActive2
{
	if !doonce
	{
		doonce = true
		DISCORD np_setpresence("Moves: " + string(Gamerule_1.Moves_Made), global.DIS_name, "ico_512", "")
		var prev_level = Gamerule_1.level
		Gamerule_1.level = Gamerule_1.Moves_Made div 10
		if Gamerule_1.level != prev_level
		{
			with(obj_lock_control)
			{
				event_user(1)
			}
			with(obj_doom_control)
			{
				event_user(1)
			}
			with(obj_bombcontrol)
			{
				event_user(1)
			}
		}
	}
}
else doonce = false