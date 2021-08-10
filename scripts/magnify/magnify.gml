///@param x
///@param y
///@param big
if !Gamerule_1.isReplay && !Gamerule_1.fruit_exploding && global.OPT_magnifyallowed
{
	if !instance_exists(obj_magnify)
	{
		var m = instance_create(argument0,argument1,obj_magnify)
	}
	else m = obj_magnify
	
	with(m) 
	{
		num++
		var len = array_length_1d(surf)
		surf[len] = surface_create(resolution_x,resolution_y)
		am_done[len] = false
		var_mouse_pos_x[len] = argument0 * resolution_x/1280
		var_mouse_pos_y[len] = (argument1 -512) * resolution_y/720
		def_radius[len] = 0.06
		def_radius_dest[len] = 0.12
		def_zoom_min[len] = 0.19
		def_zoom_max[len] = 0.8
		if argument2 = true
		{
				def_radius[len] = 0.19
				def_radius_dest[len] = 0.27
		}
		var_circle_radius[len] = def_radius[len]; //higher = more waves
		var_circle_zoom_min[len] = def_zoom_min[len]; //higher = less distortion
		var_circle_zoom_max[len] = def_zoom_max[len]; //higher = faster
		func[len] = 0
	}

}