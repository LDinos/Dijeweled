///@param gem1
///@param xlim
///@param ylim
///Checks if match is horizontal (used in Battle mode)
function is_swap_horizontal(argument0, argument1, argument2) {
	var gem1 = argument0
	var xlim = argument1
	var ylim = argument2
	var condition = false;
	//condition = (gem1.y == Board_1.y + 64*ylim && gem1.x == Board_1.x + 64*xlim) || (gem1.x == Board_1.x + 64*xlim && gem1.y == Board_1.y + 64*ylim)
	condition = (gem1._i == ylim && abs(gem1._j - xlim) == 1)
	return condition;



}
