/// @description Insert description here
if delay > 0 delay--
var deposit = obj_avalanchedeposit
var gmr = Gamerule_1
var butt = global.gp[0] //gamepad of player 1
if !global.online
{
	deposit = obj_avalanchedeposit_local
	if !deposit.myturn 
	{
		if !global.bot1 butt = global.gp[1]; 
		gmr = Gamerule_local
	}
}

if deposit.myturn || (!global.bot1 && !global.online) //if its my turn on online/bot match, or if we are locally playing
{
	if (mouse_check_button_pressed(mb_left) && !deposit.gameover && delay == 0 && position_meeting(mouse_x,mouse_y,id)) || gamepad_button_check_pressed(butt,gp_select) || keyboard_check_pressed(ord("P"))
	{
		pass(gmr,deposit)
	}
}