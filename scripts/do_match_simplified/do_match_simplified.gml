/// @description Used for Gem2 instances in online. No replay stuff needed, only the idea of swapping.
/// @param gem1
/// @param gem2
var gem1 = argument0
var gem2 = argument1
gemtomove1 = gem1
gemtomove2 = gem2
//Do the match animation, and set that gamerule to gemactive0
with(Gamerule_2) 
{
	combo = 0
	Moves_Made++
	gemdestroyonemove =0;
}
if (!gem1.amHype && !gem2.amHype)
{
	Gamerule_2.moving = true
	with(gem1)
	{
		iprev = _i
		jprev = _j
		skinprev = skinnum
	}
	with(gem2)
	{
		iprev = _i
		jprev = _j
		skinprev = skinnum
	}

	Gamerule_2.moving = true
	with(gem1) {isturnback = false; ammoving = true; SWAP_X_END = gem2.x - x; SWAP_Y_END = gem2.y - y; alarm[2] = -1; alarm[5] = 1}
	with(gem2) {isturnback = false; ammoving = true; SWAP_X_END = gem1.x - x; SWAP_Y_END = gem1.y - y; alarm[2] = -1; alarm[5] = 1}
}
else //if one is at least hype
{
	Gamerule_2.moving = true
	Gamerule_2.IsGemActive = 0
	
	if gem1.amHype && gem2.amHype
	{
		gem1.gem_to_hype = gem2
		gem1.skin_to_hype = 8
		gem2.gem_to_hype = gem1
		gem2.skin_to_hype = 8
		instance_destroy(gem2)
		instance_destroy(gem1)
	}
	else if gem1.amHype
	{
		gem1.gem_to_hype = gem2
		gem1.skin_to_hype = gem2.skinnum
		instance_destroy(gem1)
	}
	else
	{
		gem2.gem_to_hype = gem1
		gem2.skin_to_hype = gem1.skinnum
		instance_destroy(gem2)
	}
	Gamerule_2.combo = 1
}
