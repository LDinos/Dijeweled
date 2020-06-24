/// @description Magnification shader effect for explosions
// You can write your code in this editor
num = 0 //used to count how many surfs are yet to end the magnification effect
surf = -1

uni_greyscale_fade = shader_get_uniform(shd_greyscale,"fade");
var_greyscale_fade = 0.4;

uni_time = shader_get_uniform(shd_magnify,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_magnify,"mouse_pos");

uni_resolution = shader_get_uniform(shd_magnify,"resolution");
resolution_x = window_get_width() //camera_get_view_width(0);
resolution_y = window_get_height()//camera_get_view_height(0);

uni_circle_radius = shader_get_uniform(shd_magnify,"circleRadius");
uni_circle_zoom_min = shader_get_uniform(shd_magnify,"minZoom");
uni_circle_zoom_max = shader_get_uniform(shd_magnify,"maxZoom");


