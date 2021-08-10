///@description When a gem is normally destroyed, a fadeout effect should happen
///@param gem_to_follow
function create_gem_disabler() {
	var xxx = dragXX
	var yyy = dragYY
	var skin = skinnum
	var disabler = instance_create(x,y,obj_gemdisabler)
	with(disabler)
	{
		xx = xxx
		yy = yyy
		image_index = skin
		alarm[0] = 1
	}



}
