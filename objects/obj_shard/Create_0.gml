/// @description Variables
/* Desc

Shard pieces that appear on bomb death. Can have 7 colors.

*/
color = c_white
var size = choose(0.3,0.4,0.5)
image_xscale = size
image_yscale = size
depth = -10
image_speed = 1
vsp = random_range(-5,5)
hsp = random_range(-20,20)

//System
smoketrail_sys = part_system_create();
//Particle
smoketrail = part_type_create();
part_type_shape(smoketrail,pt_shape_explosion)
part_type_color2(smoketrail,c_orange,c_gray)
part_type_size(smoketrail,0.4,0.5,-0.1,0)
part_type_alpha2(smoketrail,0.4,0)
part_type_life(smoketrail,25,30)
//emit
smoketrail_emit = part_emitter_create(smoketrail_sys)

/* */
/*  */
