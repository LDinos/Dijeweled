/// @description Draw debug/version values and greyscale shader
var_time_var+=0.04;
draw_set_font(font2)
draw_set_halign(fa_left)
var rmname = ""
if global.debug
{
	draw_text(8,64,"DEBUG MODE")
	rmname = " " + + room_get_name(room)
}

draw_text(8,32,"v"+global.version + rmname )

if shader_enabled && shader_is_compiled(shd_greyscale) //Combo replay gray screen effect
{
shader_set(shd_greyscale);
    shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_greyscale_fade, var_greyscale_fade);
	draw_surface(application_surface,0,0)
shader_reset();
}
