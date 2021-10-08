/// @description ISGEMACTIVE2
// When we are sure no cascades are happening and gems are fully stationary

if (replay_allowed && complimentsaid1 && !levelbarfull && !juststarted && !bombis0 && !instance_exists(replay)) instance_create(Board_1.x + (Board_1.sprite_width/2) - 64, room_height - 72,replay)
combo = 0
if (levelbarfull) levelcompleted = true
if bombis0 && !levelbarfull
{
	if !challengewon
	{
		if !fruit_want_to_spawn alarm[7] = 1
		else IsGemActive2 = true
	}
	else IsGemActive2 = true
}
else IsGemActive2 = true
if IsGemActive2
{
	if !levelbarfull
	{
		check_summoves(false)
		if summoves2 = 0 //if we have no more moves
		{
			var gemsare0 = false
			if (isQuest) gemsare0 = obj_quest_control.C_gemsare0

			if !AHM_allowed && !illegals_allowed && end_on_nomoves //...and no more moves = defeat
			{	
				if !challengewon //if we havent completed a challenge yet (if its quest mode)
				{
				create_textellent("NO MORE MOVES") //...end the game
				game_over()
				}
			}
			else if AHM_allowed && !illegals_allowed && force_moves_allowed && !gemsare0 //if no more moves shall be impossible to happen but still does
			{
				if !juststarted create_random_cube() //make a random cube, since the game MUSTN'T end and we are stuck
			}
		}
		

	}
	illegal_cando = true
	if closecall
	{
		audio_play_sound(snd_closecall,0,0)
		create_textellent("CLOSE CALL!")
		closecall = false
	}
}