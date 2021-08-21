/// @description Insert description here
// You can write your code in this editor
if !global.paused
{
var multiswap_allowed; //if multiswap_allowed is allowed, we dont care if gems are stationary.
if MyGamerule.multiswap_allowed multiswap_allowed = true
else
{
	if MyGamerule.IsGemActive2 multiswap_allowed = true
	else multiswap_allowed = false
}
var canmove;
if !MyGamerule.moving && !dont_swap && !MyGamerule.lightOn && MyGamerule.illegal_cando canmove = true
else canmove = false

if gem1 != noone && !visible //instance_exists(gem1)
{
	#region Refresh xlim,ylim on moving gem
	if gem1.acc != 0
	{
		mouse_xx_pos = gem1.x
		mouse_yy_pos = gem1.y
		xlimprevious = xlim
		ylimprevious = ylim
		xlim = gem1._j
		ylim = gem1._i
		x = MyBoard.x + 64*xlim -32
		y = MyBoard.y + 64*ylim -32
	}
	#endregion
}

if MyGamerule.controlallowed //&& !global.bot1 && Gamerule_1.summoves2 > 0
{
	if (image_index == 1) image_index = 0
	if global.bot1
	{
		var isready = MyGamerule.IsGemActive2
		if (global.botdifficulty1 == 3 && Gamerule_1.multiswap_allowed && global.SET_gamemode != 1) {isready = true; bot_speed = 30}
		#region Bot
		if isready && canmove
		{
			if (alarm[0] == -1) alarm[0] = bot_speed
		}
		else alarm[0] = -1
		#endregion
	}
	else
	{
		player_local_step(canmove,multiswap_allowed)	
	}
}

if !MyGamerule.illegal_cando image_index = 1
else image_index = 0

}
//


