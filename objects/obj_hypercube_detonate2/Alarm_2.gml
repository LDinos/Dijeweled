/// @description Insert description here
var count = 0
with(hypercube_sperm2) {if (player_id == other.player_id) count++}
if (count != 0)
{
	alarm[3] = -1
	alarm[2] = 3*modifier
}
else
{
	alarm[3] = 15*modifier
}