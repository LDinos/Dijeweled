/// @description Insert description here
// You can write your code in this editor
with(Gem_1) 
{
	if position_meeting(x,y,other.id)
	{
		countdown = 20
		amLocked = 0;
		amInvisible = true; 
		gempower = 0;
	}
}

func += 0.03
if image_xscale > 1.2 {with(Board_1) sprite_index = spr_board_destroyed}
image_alpha = lerp(1,0,func)
image_xscale = lerp(0.1,2.5,func)
image_yscale = image_xscale
if func >= 1 instance_destroy()