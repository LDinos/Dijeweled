/// @description Insert description here
// You can write your code in this editor
var len = array_length_1d(surf)
if shader_is_compiled(shd_magnify)
{
	var_time_var+=0.04;
	
	#region do one surf for sure
		if !surface_exists(surf[0]) surf[0] = surface_create(1280,720)	
		surface_set_target(surf[0])
		shader_set(shd_magnify);
		    shader_set_uniform_f(uni_time, var_time_var);
		    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x[0], var_mouse_pos_y[0]);
		    shader_set_uniform_f(uni_resolution, resolution_x, resolution_y);
		    shader_set_uniform_f(uni_circle_radius, var_circle_radius[0]);
		    shader_set_uniform_f(uni_circle_zoom_min, var_circle_zoom_min[0]);
		    shader_set_uniform_f(uni_circle_zoom_max, var_circle_zoom_max[0]);
		    draw_surface(application_surface,0,0);
		shader_reset();
		surface_reset_target()
	#endregion
	
	#region do for more surfs if more explosions are happening
	for(var i = 1; i < len; i++)
	{
		if !surface_exists(surf[i]) surf[i] = surface_create(resolution_x,resolution_y)
		surface_set_target(surf[i])
			shader_set(shd_magnify);
			    shader_set_uniform_f(uni_time, var_time_var);
			    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x[i], var_mouse_pos_y[i]);
			    shader_set_uniform_f(uni_resolution, resolution_x, resolution_y);
			    shader_set_uniform_f(uni_circle_radius, var_circle_radius[i]);
			    shader_set_uniform_f(uni_circle_zoom_min, var_circle_zoom_min[i]);
			    shader_set_uniform_f(uni_circle_zoom_max, var_circle_zoom_max[i]);
			    draw_surface(surf[i-1],0,0);
			shader_reset();
		surface_reset_target()
	}
	#endregion
	
	draw_surface(surf[len-1],0,0) //Draw the latest surf
	/*if Gamerule_1.isReplay
	{
		shader_set(shd_greyscale);
			    shader_set_uniform_f(uni_time, var_time_var);
			    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
			    shader_set_uniform_f(uni_resolution, resolution_x, resolution_y);
			    shader_set_uniform_f(uni_greyscale_fade, var_greyscale_fade);
				draw_surface(surf[0],0,0)
		shader_reset();
	}*/

}


