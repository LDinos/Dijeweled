/// @description SWAP ANIM
var modi = 1
if Gamerule_1.isReplay modi = 2

if instance_exists(gemtomove1) && instance_exists(gemtomove2)
{
	//power(percent,2)
	var a = animcurve_channel_evaluate(global.match_curve, percent) 
	swap_xy_lerp(gemtomove1, a)
	swap_xy_lerp(gemtomove2, a)
	percent += 0.1/modi

	if percent <= 1 alarm[1] = 1
	else
	{
		percent = 0
		//alarm[7] = 3
		swap_anim_lastframe(gemtomove1)
		swap_anim_lastframe(gemtomove2)
		if (currently_swapping_back) {
			currently_swapping_back = false
			with(MyGem) matchnear = false;
			with(gemtomove1) alarm[2] = 2
			with(gemtomove2) alarm[2] = 2
			alarm[7] = 3
		} else {
			alarm[2] = 5
		}
	}
}
else 
{
	alarm[2] = 5
	instance_destroy(gemtomove1)
	instance_destroy(gemtomove2)
}