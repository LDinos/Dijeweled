///@param device
///@param button
///@param Gamerule
function gamepad_button_swap_check_pressed(argument0, argument1, argument2) {
	if (argument2.gamepad_allowed)
	{
		return gamepad_button_check_pressed(argument0,argument1)
	}


}
