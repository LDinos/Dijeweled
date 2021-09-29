// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buyo_spawn_gems(){
	var b = instance_create(800,544,obj_buyo_control)
	b.gem1 = gem1a
	b.gem2 = gem1b
	bag_index++
	if (bag_index == bag_size) {gem_bag = buyo_create_bag(); bag_index = 0}
	gem1a = gem_bag[bag_index].gem1a //center gem
	gem1b = gem_bag[bag_index].gem1b //outer gem
	check = false
}