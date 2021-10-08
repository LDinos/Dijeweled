/// @description Insert description here

if global.OPT_lightallowed
{
if shd = 0	
{

	var_mouse_pos_x = mouse_x - camera_get_view_x(0);
	var_mouse_pos_y = mouse_y - camera_get_view_y(0);
	var_time_var+=0.01
	shader_set(shdr_backdrop2);
	    shader_set_uniform_f(uni_time_3, var_time_var);
	    shader_set_uniform_f(uni_resolution_3, room_width/2, room_height/2);
		draw_self()
	shader_reset();

}
else if shd = 1
{
	var_time_var+=0.04;

	var_mouse_pos_x = mouse_x - camera_get_view_x(0);
	var_mouse_pos_y = mouse_y - camera_get_view_y(0);
	gpu_set_texrepeat(false);
	if shader_enabled shader_set(shd_wave);
	    shader_set_uniform_f(uni_time, var_time_var);
	    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
	    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
	    shader_set_uniform_f(uni_wave_amount, var_wave_amount);
	    shader_set_uniform_f(uni_wave_distortion, var_wave_distortion );
	    shader_set_uniform_f(uni_wave_speed, var_wave_speed);
		draw_sprite_ext(spr_bck1,0,x,y,1.2,1.2,0,c_white,1)
	shader_reset();
}
else if shd = 2
{
	var_time_var++
	draw_sprite(spr_bck5,0,0,512)
	draw_sprite_tiled(spr_bck5_laser_lines,0,0,var_time_var)
}
else if shd = 3
{
	var_time_var+=0.01;
	shader_set(shdr_backdrop1);
	    shader_set_uniform_f(uni_time_2, var_time_var);
	    shader_set_uniform_f(uni_resolution_2, room_width*1.1, room_height*1.5);
		draw_self()
	shader_reset();
}
else if shd = 4
{
	draw_sprite(spr_bck3,0,0,512)
}
else if shd = 5
{
	draw_sprite(spr_bck4,0,0,512)
}
else if shd = 6
{
	var_time_var+=0.01;
	shader_set(shd_rainbowwater) 
		shader_set_uniform_f(rainbow_res,1280,720,0); 
		shader_set_uniform_f(rainbow_time,current_time/5000); 
		draw_self();
	shader_reset();
	
}
else if shd = 7
{
	shader_set(shd_starfield) 
		shader_set_uniform_f(Res,512,512,0); 
		shader_set_uniform_f(Time,current_time/5000); 
		draw_self();
	shader_reset(); 
}
else
{
	//Reset time variables to default
	tunnel_offset_x	= 0;
	tunnel_offset_y	= 0
	var_time_var = 0
}

}
