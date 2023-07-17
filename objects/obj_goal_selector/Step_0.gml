/// @description Insert description here
if (mouse_y > 32 && mouse_y < room_height - 16) && (mouse_x > 10*16 && mouse_x < 37*16)
{
	yy = (mouse_y-32) div 32
	xx = (mouse_x - 10*16) div 144
	hover = yy + 21*xx
	if (hover > 37 && hover < 42) || hover > 46
	{
		hover = -1
	}
}
else hover = -1