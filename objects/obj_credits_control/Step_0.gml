/// @description Insert description here
if !showblack
{
	if (y < yyend)
	{
		y+=0.55
	}
	else if doonce
	{
		Gamerule_1.controlallowed = false
		alarm[3] = 60*5
		instance_create(0,512,obj_credits_thanks)
		doonce = !doonce
	}
}