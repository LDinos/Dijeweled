/// @description Insert description here
// You can write your code in this editor
was_illegal_allowed_before = Gamerule_1.illegals_allowed
zen_multiplier = 1 //the lower the more difficult to get
zen_countdown_multiplier = 1 //the lower the slower it drains out
zenify_points = 0
zenify_points_temp = 0
particle1 = part_type_create();
part_type_shape(particle1,pt_shape_flare);
part_type_size(particle1,0.30,0.50,0,0);
part_type_scale(particle1,1,1);
part_type_color3(particle1,255,65535,16711680);
part_type_alpha2(particle1,1,0);
part_type_speed(particle1,4,4,-0.04,0);
part_type_direction(particle1,0,359,0,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,0,0,0,0,1);
part_type_blend(particle1,1);
part_type_life(particle1,60,60);
emitter1 = part_emitter_create(global.sys_below_gem);
part_emitter_region(global.sys_below_gem,emitter1,x-64,x+64,y-64,y+64,1,0);

timevar = 0
c_rainbow = c_white
cooldown = false
index = 0
index_temp = 0
index_temp_round = 0
image_speed = 0

xx = x 
perc = 0