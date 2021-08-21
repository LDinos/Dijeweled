/// @description Insert description here
if mouse_check_button_pressed(mb_left)
{
	if (mouse_y >= y + 32) && (mouse_y < y + sprite_height) && (mouse_x > x) && (mouse_x < x + sprite_width)
	{
		obj_CUS_patternboard.gem_selection = (mouse_y - y - 32) div 64 + 8*((mouse_x - x) div 64 )
		
		if (obj_CUS_patternboard.gem_selection > 8) obj_CUS_patternboard.gem_selection = 8
		else if (obj_CUS_patternboard.gem_selection < 0) obj_CUS_patternboard.gem_selection = 0
	}
}
