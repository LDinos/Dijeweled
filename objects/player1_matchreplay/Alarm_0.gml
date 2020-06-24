/// @description Button hold
// You can write your code in this editor
//press
if Gamerule_1.controlallowed
{
if keyboard_check(global.ps1_left) || gamepad_button_check(global.gp[0],gp_padl)
{
	if xlim > 0
	{
	xlimprevious = xlim
	xlim--
	x-=64
	}
	alarm[0] = 5

}

if keyboard_check(global.ps1_right) || gamepad_button_check(global.gp[0],gp_padr)
{
	if xlim < Gamerule_1.board_xsize-1
	{
	xlimprevious = xlim
	xlim++
	x+=64
	}
	alarm[0] = 5

}

if keyboard_check(global.ps1_up) || gamepad_button_check(global.gp[0],gp_padu)
{
	if ylim > 0
	{
	ylimprevious = ylim
	ylim--
	y-=64
	}
	alarm[0] = 5

}

if keyboard_check(global.ps1_down) || gamepad_button_check(global.gp[0],gp_padd)
{
	if ylim < global.board_rows-1
	{
	ylimprevious = ylim
	ylim++
	y+=64
	}
	alarm[0] = 5
}
}

