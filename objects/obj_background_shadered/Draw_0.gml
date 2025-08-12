/// @description Insert description here
if global.OPT_lightallowed && os_type != os_android
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
	shader_set(shd_goo);
		shader_set_uniform_f(goo_u_time, current_time/1000);
		shader_set_uniform_f(goo_u_resolution, camera_get_view_width(0), camera_get_view_height(0));
		draw_rectangle(0, 0, room_width, room_height, false);
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
	shader_set(shd_starlight) 
		shader_set_uniform_f(Res_starlight,512,512,0); 
		shader_set_uniform_f(Time_starlight,current_time/1000); 
		draw_self(); 
	shader_reset(); 
}
else if shd = 8 {
	shader_set(shd_starbust) 
		shader_set_uniform_f(starbust_res,1280,720,0); 
		shader_set_uniform_f(starbust_time,current_time/1000); 
		draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,1)
		//draw_self(); 
	shader_reset(); 
}
else if shd = 9 {
	shader_set(shd_wavegrid) 
		shader_set_uniform_f(wavegrid_time,current_time/1000); 
		draw_self(); 
	shader_reset(); 
}
else if shd = 10 {
	shader_set(shd_fog) 
		shader_set_uniform_f(fog_time,current_time/2500); 
		draw_self(); 
	shader_reset(); 
}
else if shd = 11 {
	shader_set(shd_candle) 
		shader_set_uniform_f(candle_time,current_time/2500); 
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
