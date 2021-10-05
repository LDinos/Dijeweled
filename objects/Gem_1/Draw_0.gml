var X = x+xmover+SWAP_X
var Y = y+ymover+SWAP_Y
if !amInvisible
{
	if !amHype //if I am not a hypercube
	{
		#region powered bloom
		if global.OPT_lightallowed && Gamerule_1.shader_allowed
		{
			if amLit || (gempower > 0 && gempower < FRUIT) || bloom
			{
				//var value = random_range(.2,.4)
				gemglow_alpha += 0.005
				if (gemglow_alpha > 1) gemglow_alpha = 0
				var value = animcurve_channel_evaluate(global.gemglow_anim,gemglow_alpha)
				if amLit value = 1
					shader_set(shd_bright_contrast);
				    shader_set_uniform_f(uni_time, var_time_var);
				    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
				    shader_set_uniform_f(uni_resolution, 64, 64);
				    shader_set_uniform_f(uni_brightness_amount, value);
				    shader_set_uniform_f(uni_contrast_amount, var_contrast_amount );
			}	
		}
		#endregion

		#region draw self or bomb
		if amLocked = 4
		{
				draw_set_font(fnt_open24display_skull)
				centerize_text()
				draw_sprite_ext(spr_skull,0,X,Y,image_xscale,image_yscale,0,c_white,1)
				draw_text_outline(X,Y-12,countdown,c_white,c_green)
				draw_set_font(font0)
		}
		else if amCompanion
		{
			draw_sprite(spr_companion_glow,0,X,Y)
			draw_sprite_ext(spr_companion,amLocked,X,Y,image_xscale,image_yscale,0,c_white,1)
		}
		else if !amBomb //&& amLocked < 2 || amLocked = 3//draw me
		{
			if !Gamerule_1.zenify //default gem
			{
				if !(amLocked == 2 && amBeingLocked == 0) //if I am a fully set doom, dont show the gem.
				{
					if global.OPT_lightallowed
					{
						if (gempower = 0 && !bloom && skinnum < 7) draw_sprite_ext(shadow_index,image_index,X,Y,0.5,0.5,0,c_white,1)
					}
					draw_sprite_ext(sprite_index,image_index,X,Y,image_xscale,image_yscale,0,c_white,1)
					if (global.OPT_lightallowed) {
						if (anim_happening == false && gempower != FRUIT) {
							if (nearby_glown_left) draw_sprite_ext(spr_gemglow_left,skinnum,X,Y,1,1,0,c_white,random_range(0.5,nearby_glown_left/GLOW_FADEOUT_FRAMES))
							if (nearby_glown_right) draw_sprite_ext(spr_gemglow_right,skinnum,X,Y,1,1,0,c_white,random_range(0.5,nearby_glown_right/GLOW_FADEOUT_FRAMES))
							if (nearby_glown_up) draw_sprite_ext(spr_gemglow_up,skinnum,X,Y,1,1,0,c_white,random_range(0.5,nearby_glown_up/GLOW_FADEOUT_FRAMES))
							if (nearby_glown_down) draw_sprite_ext(spr_gemglow_down,skinnum,X,Y,1,1,0,c_white,random_range(0.5,nearby_glown_down/GLOW_FADEOUT_FRAMES))
						}
					}
				}
			}
			else //zenify
			{				
				draw_sprite_ext(sprite_index,image_index,X,Y,image_xscale,image_yscale,0,c_white,1)	
			}
		}
		#endregion

		#region draw locks/frozen locks if fully locked
		if !amBeingLocked
		{
			if amLocked = 1
			{
				draw_sprite(spr_lockgem,0,x,y)
			}
			else if amLocked = 2
			{
				draw_set_font(fnt_open24display)
				centerize_text()
				draw_sprite_ext(spr_doomgem,skinnum,X,Y,image_xscale,image_yscale,0,c_white,1)
				draw_text_outline(X,Y,countdown,c_white,c_black)
				draw_set_font(font0)
			}
			else if amLocked = 3
			{
				draw_sprite(spr_icefreeze,9,x,y)
			}
			else if amBomb
			{
				draw_set_font(fnt_open24display)
				centerize_text()
				draw_sprite_ext(spr_bombs,skinnum,X,Y,image_xscale,image_yscale,0,c_white,1)
				draw_text_outline(X,Y,countdown,c_white,c_black)
				draw_set_font(font0)
			}
		}
		#endregion	

		shader_reset()
		
	}
	else //if I am a hypercube
	{
		draw_sprite(spr_hypercube,hyper_anim,X,Y)
		draw_set_blend_mode(bm_add)
		draw_sprite(spr_hypeglow,hyper_anim,X,Y)
		draw_set_blend_mode(bm_normal)
	}

	if spinning //if im selected
	{
		if (!MyGamerule.illegal_cando || !MyGamerule.controlallowed)
		{
			draw_sprite(spr_gemselectglow,2,x,y)
		}
		else draw_sprite(spr_gemselectglow,MyGamerule.illegals_allowed,x,y)
	}
}
