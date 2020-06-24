///@param gem1
///@param xlim
///@param ylim
///Is the gem close to the second gem coordinates, enough to make them swappable?
var gem1 = argument0
var xlim = argument1
var ylim = argument2
var condition;
//condition = (gem1.y == Board_1.y + 64*ylim && gem1.x == Board_1.x + 64*xlim) || (gem1.x == Board_1.x + 64*xlim && gem1.y == Board_1.y + 64*ylim)
condition = (gem1._i == ylim && abs(gem1._j - xlim) == 1) || ((gem1._j == xlim) && abs(gem1._i - ylim) == 1) //if we have a gem1 and the gem we just selected is not gem1, lets check distance
return condition;
