/// @description Insert description here
if func <= 1
{
	if (func + 0.08 > 1) func = 1
	var inside = 1 - power((func-1),2)
	for(var i = 0; i<4;i++)
	{
		gem[i].SWAP_X = lerp(0,gemxx[i] - gemxxdef[i],inside)
		gem[i].SWAP_Y = lerp(0,gemyy[i] - gemyydef[i],inside)
	}
	func += 0.08
	if func > 1 
	{
		for(var i = 0; i<4;i++)
		{
			gem[i].SWAP_X = 0
			gem[i].SWAP_Y = 0
			gem[i].x = gemxx[i]
			gem[i].y = gemyy[i]
		}
	}
}
else
{
	if (instance_number(obj_twist_collider_local) == 1) Gamerule_local.moving = false
	//instance_destroy(col)
	flag = false; //if we increase the multiplier
	
	#region Gamerule
	with(Gamerule_local)
	{
		check_for_xplier = true //check for multiplier increase/decrease on this move (gets to false after matcher_stepevent)
		increase_xplier = false //as default, lets say we did an illegal move (decrease xplier)
			for(var i=7;i>=0;i--) //make board array empty
			{
				for(var j=7;j>=0;j--)
				{
					gem_board1[i,j] = noone
				}
			}
		with(Gem_local) //fill it up with gems
		{
			if _i >= 0
			{
				other.gem_board1[_i,_j] = id
			}
		}


		gems_fallen = gem_board1				
		for(var j=0;j<=7;j++)
		{
			var k = 7;
			for(var i=7;i>=0;i--)
			{
				if gem_board1[i,j] != noone
				{
					var temp = gems_fallen[k,j]
					gems_fallen[k,j] = gem_board1[i,j]
					gems_fallen[i,j] = temp	
					k--
				}
			}
		}

		for(var i=0;i<=7;i++) //and use gemboard to keep their fallen skins
			{
				for(var j=0;j<=7;j++)
				{
					if gems_fallen[i,j] != noone
					{
						gemboard[i,j] = gems_fallen[i,j].skinnum
					}
					else
					{
						gemboard[i,j] = -1
					}
				}
			}
	}
	#endregion
	
	for(var i = 0; i<4;i++)
	{
		with(gem[i])
		{
			check_ifmatch_twist(Gamerule_local)
			ammoving = false	
		}
	}
	
	if flag
	{
		Gamerule_local.chain++
	}
	else
	{
		Gamerule_local.chain = 0
		audio_play_sound(snd_xplier_illegal,0,0)
		with(Gamerule_local.list_of_doom)
		{
			audio_play_sound(snd_doom_count,0,0)
			countdown_decrease()
		}
	}
	instance_destroy()
}