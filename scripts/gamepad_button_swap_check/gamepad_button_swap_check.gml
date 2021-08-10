///@param device
///@param button
///@param Gamerule
function gamepad_button_swap_check(argument0, argument1, argument2) {
	if (argument2.gamepad_allowed)
	{
		return gamepad_button_check(argument0,argument1)
	}


}
