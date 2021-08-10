///Make gem start the spin animation
function spin() {
	spinning = true
	if !amBomb && skinnum != 7 && gempower != 6 //&& !Gamerule_1.zenify//not bomb, not coal, not fruit
	{	
		anim_happening = true
		if !Gamerule_1.zenify 
		{
			switch skinnum
			{
				case 0: sprite_index = anim0 shadow_index = spr_shd_red break;
				case 1: sprite_index = anim1 shadow_index = spr_shd_white break;
				case 2: sprite_index = anim2 shadow_index = spr_shd_green break;
				case 3: sprite_index = anim3 shadow_index = spr_shd_yellow break;
				case 4: sprite_index = anim4 shadow_index = spr_shd_purple break;
				case 5: sprite_index = anim5 shadow_index = spr_shd_orange break;
				case 6: sprite_index = anim6 shadow_index = spr_shd_blue break;
			}
			image_speed = 2
		}
		else
		{
			image_speed = 2
			switch skinnum
			{
				case 0: sprite_index = spr_zen_red break;
				case 1: sprite_index = spr_zen_white break;
				case 2: sprite_index = spr_zen_green break;
				case 3: sprite_index = spr_zen_yellow break;
				case 4: sprite_index = spr_zen_purple break;
				case 5: sprite_index = spr_zen_orange break;
				case 6: sprite_index = spr_zen_blue image_speed = 1 break; //blue gem is too fast
			}		
		}
	}


}
