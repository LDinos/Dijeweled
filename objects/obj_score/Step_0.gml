/// @description Insert description here
var points = Gamerule_1.points;
if points > scoretemp
{
	scoretemp += ((points-scoretemp) div 5)
	
	if (scoretemp >= points) scoretemp = points
	else scoretemp++
}
else scoretemp = points
