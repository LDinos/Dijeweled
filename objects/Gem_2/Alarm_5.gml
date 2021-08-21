/// @description MATCH ANIM
/*var xx = MyPlayer.xx
var xx2 = MyPlayer.xx2
var yy = MyPlayer.yy
var yy2 = MyPlayer.yy2*/
var modi = 1

SWAP_X = ease_inout_sine(percent,0,SWAP_X_END,1)//round(lerp(0,SWAP_X_END,power(percent,2))) //- x
SWAP_Y = ease_inout_sine(percent,0,SWAP_Y_END,1)//round(lerp(0,SWAP_Y_END,power(percent,2))) //- y

percent += 0.1/modi

if percent <= 1 alarm[5] = 1
else
{
	percent = 0
	SWAP_X = round(lerp(0,SWAP_X_END,1)) //- x
	SWAP_Y = round(lerp(0,SWAP_Y_END,1)) //- y
	x += SWAP_X		
	y += SWAP_Y
	SWAP_X = 0
	SWAP_Y = 0
	SWAP_X_END = 0
	SWAP_Y_END = 0
	alarm[2] = 5;Gamerule_2.moving = false
}

