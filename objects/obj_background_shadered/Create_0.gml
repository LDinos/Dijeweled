/// @description Background with GPU shaders
window_get_height()

var wh = x - sprite_width/2
var hh = y - sprite_height/2
//shd 4 parts
cloud_doonce = false
rain_doonce = false
laser_doonce = false
cloud_sys = part_system_create()
part_system_depth(cloud_sys,4)
cloud_part = part_type_create()
cloud_part_instant = part_type_create()
cloud_emit = part_emitter_create(cloud_sys)
rain_emit = part_emitter_create(cloud_sys)
part_emitter_region(cloud_sys,rain_emit,0,room_width,512,room_height,ps_shape_rectangle,ps_distr_invgaussian)
rain_part = part_type_create()
rain_part2 = part_type_create()
laser_part = part_type_create()
laser_emit = part_emitter_create(cloud_sys)
part_emitter_region(cloud_sys,laser_emit,room_width+64,room_width+64,512+64,512+720-64,ps_shape_line,ps_distr_gaussian)

//CLOUD PART
part_emitter_region(cloud_sys,cloud_emit,wh+128,x+sprite_width-128,hh+128,y+sprite_height-128,ps_shape_rectangle,ps_distr_gaussian)
part_type_sprite(cloud_part,spr_bck3_cloudparts,false,false,true)
part_type_life(cloud_part,13*60,16*60)
part_type_orientation(cloud_part,0,360,0.1,0,0)
part_type_speed(cloud_part,0.1,0.1,0,0)
part_type_direction(cloud_part,0,360,0,0)
part_type_alpha3(cloud_part,0,1,0)
part_type_size(cloud_part,1.2,2,0,0)

//CLOUD PART INSTANT
part_type_sprite(cloud_part_instant,spr_bck3_cloudparts,false,false,true)
part_type_life(cloud_part_instant,13*60,16*60)
part_type_orientation(cloud_part_instant,0,360,0.1,0,0)
part_type_speed(cloud_part_instant,0.1,0.1,0,0)
part_type_direction(cloud_part_instant,0,360,0,0)
part_type_alpha2(cloud_part_instant,1,0)
part_type_size(cloud_part_instant,1.2,2,0,0)

//RAIN
part_type_sprite(rain_part,spr_bck4_raindrop,false,false,false)
part_type_size(rain_part,0.1,0.2,0.03,0)
part_type_life(rain_part,40,60)
part_type_alpha2(rain_part,0.7,0)
part_type_orientation(rain_part,0,360,0,0,0)
part_type_speed(rain_part,0,0,0,0)

part_type_shape(rain_part2,pt_shape_sphere)

//LASER
part_type_sprite(laser_part,spr_bck5_laser,false,false,false)
part_type_scale(laser_part,3,0.2)
part_type_size(laser_part,0.5,0.5,0,0)
part_type_life(laser_part,10*60,10*60)
part_type_direction(laser_part,180,180,0,0)
part_type_orientation(laser_part,0,0,0,0,0)
part_type_speed(laser_part,3,3,0,0)

depth = 10
num_shaders = 6 //0,1,2...
shd = irandom_range(0,num_shaders)

/*0*/
uni_time_2 = shader_get_uniform(shdr_backdrop1,"iTime");
uni_resolution_2 = shader_get_uniform(shdr_backdrop1,"iResolution");

/*1*/
uni_time = shader_get_uniform(shd_wave,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_wave,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_wave,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 20; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 80; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = .5; //higher = faster

shader_enabled = true
/**/


/*3*/
uni_time_3 = shader_get_uniform(shdr_backdrop2,"iTime");
uni_resolution_3 = shader_get_uniform(shdr_backdrop2,"iResolution");
/**/
Res = shader_get_uniform(shd_starfield,"iResolution"); 
Time = shader_get_uniform(shd_starfield,"iGlobalTime"); 

rainbow_time = shader_get_uniform(shd_rainbowwater,"u_time");
rainbow_res = shader_get_uniform(shd_rainbowwater,"u_resolution");