///@param key
///@param Gamerule
function keyboard_swap_check_pressed(argument0, argument1) {
	if (argument1.keyboard_allowed)
	{
		return keyboard_check_pressed(argument0)
	}


}
