/// @description Insert description here
if room = rm_zen && Gamerule_1.Zen_allow_sleep
{
	if Gamerule_1.IsGemActive && Gamerule_1.controlallowed && !player1.visible
	{
		if !doonce
		{
			doonce = true
			 alarm[0] = 60*30
		}
	}
	else {doonce = false; alarm[0] = -1}

	if hidden
	{		
		if (mouse_x_prev != mouse_x) || mouse_check_button_pressed(mb_left) || player1.visible
		{
			unhide_items()	
		}
		mouse_x_prev = mouse_x	
	}
}