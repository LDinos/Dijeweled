function set_skin(argument0) {
	skinnum = argument0
	image_index = argument0
	switch skinnum
	{
		case 0: mycolor = c_red break;
		case 1: mycolor = c_white break;
		case 2: mycolor = c_green break;
		case 3: mycolor = c_yellow break;
		case 4: mycolor = c_purple break;
		case 5: mycolor = c_orange break;
		case 6: mycolor = c_blue break;
		default: mycolor = c_white break;
	}

	particle_flame_asset = asset_get_index("coord_" + string(image_index))
	particle_flame_points = path_get_number(particle_flame_asset)

}
