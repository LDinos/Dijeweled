/// @description Insert description here
if (mouse_x > x && mouse_x < x+width) && (mouse_y > y && mouse_y < y+height)
	{
		hover = true
		if mouse_check_button_pressed(mb_left) 
		{
			global.bot1 = !global.bot1
			if (global.bot1 == false) text = "Enable Bot"
			else text = "Disable Bot"
			obj_controller_choose.index = 0;
		}
	}
else hover = false