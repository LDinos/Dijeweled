/// @description Insert description here
// You can write your code in this editor
var X = x+xmover+SWAP_X
var Y = y+ymover+SWAP_Y
if !amInvisible
{
	if mypowerup > -1
	{
		draw_sprite(spr_powerup_base,skinnum,X,Y)
		draw_sprite(spr_powerups,mypowerup,X,Y)
	}
	else if !amHype //if I am not a hypercube
	{
		if global.OPT_lightallowed
		{
		if (gempower = 0 && !bloom && skinnum < 7) draw_sprite_ext(shadow_index,image_index,X,Y,0.5,0.5,0,c_white,1)
		}
		draw_sprite_ext(sprite_index,image_index,X,Y,image_xscale,image_yscale,0,c_white,1)	
	}	
	else //if I am a hypercube
	{
		draw_sprite(spr_hypercube,hyper_anim,x,y)
		draw_set_blend_mode(bm_add)
		draw_sprite(spr_hypeglow,hyper_anim,x,y)
		draw_set_blend_mode(bm_normal)
	}
	if start_locking > -1
	{
		draw_sprite(spr_locking,start_locking,X,Y)
		if start_locking < 35 start_locking++
		else {amLocked = 1; audio_play_sound(snd_lock_end,0,0); start_locking = -1}
	}
	else if amLocked = 1
	{
		draw_sprite(spr_lockgem,0,X,Y)
	}
	
	
	
}
else if Gamerule_1.debug draw_sprite(spr_hiddengem,0,x,y)
