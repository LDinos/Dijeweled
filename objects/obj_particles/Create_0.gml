/// @description Define all particles here
global.gemglow_anim = animcurve_get_channel(anim_gem_glow,"chn_gem_glow")
// SYSTEMS \\
global.sys_above_gem = part_system_create()
part_system_depth(global.sys_above_gem,-2)

global.sys_below_gem = part_system_create()
part_system_depth(global.sys_below_gem,1)

global.sys_background = part_system_create()
part_system_depth(global.sys_background,3)
//-------------\\

/*For Ice Break*/
global.part_icebreak1 = part_type_create();
part_type_shape(global.part_icebreak1,pt_shape_line);
part_type_size(global.part_icebreak1,0.1,0.18,0,0);
part_type_scale(global.part_icebreak1,2,2);
part_type_color1(global.part_icebreak1,16744448);
part_type_alpha2(global.part_icebreak1,1,0);
part_type_speed(global.part_icebreak1,1,8,0,0);
part_type_direction(global.part_icebreak1,50,130,0,0);
part_type_gravity(global.part_icebreak1,0.50,270);
part_type_orientation(global.part_icebreak1,0,0,0,0,1);
part_type_blend(global.part_icebreak1,1);
part_type_life(global.part_icebreak1,40,40);

global.part_icebreak2 = part_type_create();
part_type_sprite(global.part_icebreak2,spr_ice_piece,0,0,0);
part_type_size(global.part_icebreak2,2,2,0,0);
part_type_scale(global.part_icebreak2,1,1);
part_type_alpha1(global.part_icebreak2,1);
part_type_speed(global.part_icebreak2,2,8,0,0);
part_type_direction(global.part_icebreak2,50,130,0,0);
part_type_gravity(global.part_icebreak2,0.50,270);
part_type_orientation(global.part_icebreak2,0,180,5,0,0);
//part_type_blend(global.part_icebreak2,1);
part_type_life(global.part_icebreak2,60,60);


/*For new flame particles*/
global.part_newflame =  part_type_create();
part_type_size(global.part_newflame,0.3,0.5,0,0)
part_type_sprite(global.part_newflame,spr_flamenew_part,true,true,false)
part_type_life(global.part_newflame,40,40);

global.part_newflame_ember =  part_type_create();
part_type_size(global.part_newflame_ember,0.05,0.05,0,0)
part_type_shape(global.part_newflame_ember,pt_shape_sphere)
part_type_life(global.part_newflame_ember,64,64);
part_type_color1(global.part_newflame_ember,c_orange)
part_type_direction(global.part_newflame_ember,80,100,0,0.8)
part_type_speed(global.part_newflame_ember,0.3,0.3,0,0)
part_type_blend(global.part_newflame_ember,bm_add)
part_type_alpha2(global.part_newflame_ember,1,0)

//------------------------\\

/*For skull gem downward gem break*/
global.part_skullgembreak= part_type_create();
part_type_shape(global.part_skullgembreak,pt_shape_line);
part_type_size(global.part_skullgembreak,0.10,0.20,0,0);
part_type_scale(global.part_skullgembreak,1,1);
part_type_color3(global.part_skullgembreak,33023,255,16384);
part_type_alpha2(global.part_skullgembreak,1,0);
part_type_speed(global.part_skullgembreak,3,4,0,0);
part_type_direction(global.part_skullgembreak,0,180,0,0);
part_type_gravity(global.part_skullgembreak,0.18,270);
part_type_orientation(global.part_skullgembreak,0,0,0,1,1);
part_type_blend(global.part_skullgembreak,1);
part_type_life(global.part_skullgembreak,60,60);



/*For companion break*/
 global.part_companion_br1 = part_type_create();
part_type_sprite(global.part_companion_br1,spr_companion_br1,0,0,0);
part_type_size(global.part_companion_br1,0.25,0.25,0,0);
part_type_scale(global.part_companion_br1,1,1);
part_type_alpha2(global.part_companion_br1,1,0);
part_type_speed(global.part_companion_br1,1,7,0,0);
part_type_direction(global.part_companion_br1,65,135,0,0);
part_type_gravity(global.part_companion_br1,0.25,270);
part_type_orientation(global.part_companion_br1,0,359,10,0,0);
part_type_blend(global.part_companion_br1,1);
part_type_life(global.part_companion_br1,180,200);

global.part_companion_br2 = part_type_create();
part_type_sprite(global.part_companion_br2,spr_companion_br2,0,0,0);
part_type_size(global.part_companion_br2,0.25,0.25,0,0);
part_type_scale(global.part_companion_br2,1,1);
part_type_alpha2(global.part_companion_br2,1,0);
part_type_speed(global.part_companion_br2,6,9,0,0);
part_type_direction(global.part_companion_br2,65,135,0,0);
part_type_gravity(global.part_companion_br2,0.25,270);
part_type_orientation(global.part_companion_br2,0,359,9,0,0);
part_type_blend(global.part_companion_br2,1);
part_type_life(global.part_companion_br2,180,200);

global.part_companion_br3 = part_type_create();
part_type_sprite(global.part_companion_br3,spr_companion_br3,0,0,0);
part_type_size(global.part_companion_br3,0.25,0.25,0,0);
part_type_scale(global.part_companion_br3,1,1);
part_type_alpha2(global.part_companion_br3,1,0);
part_type_speed(global.part_companion_br3,7,10,0,0);
part_type_direction(global.part_companion_br3,0,180,0,0);
part_type_gravity(global.part_companion_br3,0.25,270);
part_type_orientation(global.part_companion_br3,0,180,0,0,0);
part_type_blend(global.part_companion_br3,1);
part_type_life(global.part_companion_br3,180,240);

global.part_companion_br4 = part_type_create();
part_type_shape(global.part_companion_br4,pt_shape_explosion);
part_type_size(global.part_companion_br4,0.10,0.10,0.05,0);
part_type_scale(global.part_companion_br4,1,1);
part_type_color2(global.part_companion_br4,4737096,8388736);
part_type_alpha3(global.part_companion_br4,0,1,0);
part_type_direction(global.part_companion_br4,0,180,0,0);
part_type_orientation(global.part_companion_br4,0,359,5,0,1);
part_type_blend(global.part_companion_br4,1);
part_type_life(global.part_companion_br4,10,70);


//----------------------//

/*For hypercube */
global.part_hypercube = part_type_create();
part_type_shape(global.part_hypercube,pt_shape_flare);
part_type_size(global.part_hypercube,0.4,0.8,0,0);
part_type_scale(global.part_hypercube,1,1);
part_type_color3(global.part_hypercube,16777215,65535,12615680);
part_type_alpha2(global.part_hypercube,0.4,0);
part_type_speed(global.part_hypercube,0.6,0.6,0,0);
part_type_direction(global.part_hypercube,0,359,0,5);
part_type_gravity(global.part_hypercube,0,270);
part_type_orientation(global.part_hypercube,0,0,0,0,1);
part_type_blend(global.part_hypercube,1);
part_type_life(global.part_hypercube,60,80);
//--------------\\

/*For xplier sperm*/

global.part_xplier_sperm = part_type_create();
part_type_shape(global.part_xplier_sperm,pt_shape_sphere);
part_type_size(global.part_xplier_sperm,0.20,0.20,-0.01,0);
part_type_scale(global.part_xplier_sperm,1,1);
part_type_color3(global.part_xplier_sperm,16711808,33023,255);
part_type_alpha1(global.part_xplier_sperm,1);
part_type_blend(global.part_xplier_sperm,1);
part_type_life(global.part_xplier_sperm,60,60);

//---------------\\

/*For Lock break*/
 global.part_lockbreak1 = part_type_create();
part_type_sprite(global.part_lockbreak1,spr_fatlink,0,0,0);
part_type_size(global.part_lockbreak1,0.30,1,0,0);
part_type_scale(global.part_lockbreak1,1,1);
part_type_color1(global.part_lockbreak1,16777215);
part_type_alpha2(global.part_lockbreak1,1,0);
part_type_speed(global.part_lockbreak1,4,8,0,0);
part_type_direction(global.part_lockbreak1,65,120,0,0);
part_type_gravity(global.part_lockbreak1,0.70,270);
part_type_orientation(global.part_lockbreak1,0,359,10,0,1);
part_type_blend(global.part_lockbreak1,1);
part_type_life(global.part_lockbreak1,40,40);

global.part_lockbreak2 = part_type_create();
part_type_sprite(global.part_lockbreak2,spr_thinlink,0,0,0);
part_type_size(global.part_lockbreak2,0.50,0.80,-0.02,0);
part_type_scale(global.part_lockbreak2,1,1);
part_type_color1(global.part_lockbreak2,16777215);
part_type_alpha2(global.part_lockbreak2,1,0);
part_type_speed(global.part_lockbreak2,1,8,0,0);
part_type_direction(global.part_lockbreak2,0,359,0,0);
part_type_gravity(global.part_lockbreak2,0.20,270);
part_type_orientation(global.part_lockbreak2,0,359,15,0,1);
part_type_blend(global.part_lockbreak2,1);
part_type_life(global.part_lockbreak2,25,40);

/*--------------*/

/*FOR DOOM GEM*/
global.d_g1 = part_type_create() //white particles
part_type_shape(global.d_g1,pt_shape_sphere)
part_type_speed(global.d_g1,0,0,0.03,0)
part_type_size(global.d_g1,0.05,0.08,0,0)
part_type_alpha3(global.d_g1,0.3,1,0)
part_type_life(global.d_g1,40,60)
part_type_direction(global.d_g1,100,120,0,1)

global.d_g2 = part_type_create()
part_type_shape(global.d_g2,pt_shape_cloud)
part_type_colour1(global.d_g2,c_purple)
part_type_size(global.d_g2,0.2,0.4,0,0)
part_type_alpha3(global.d_g2,0.3,0.5,0)
part_type_direction(global.d_g2,100,120,0,1)
part_type_speed(global.d_g2,0,0,0.01,0)
part_type_life(global.d_g2,70,90)

global.doomdestroy = part_type_create()
part_type_shape(global.doomdestroy,pt_shape_explosion)
part_type_colour1(global.doomdestroy,c_purple)
part_type_size(global.doomdestroy,1,1,0.05,0)
part_type_alpha3(global.doomdestroy,0.4,1,0)
part_type_orientation(global.doomdestroy,0,360,1,0,0)
part_type_life(global.doomdestroy,60,80)
//-------------\\

/*FOR DOOM LOCK APPEAR*/

global.gemdoom1 = part_type_create() //white particles
part_type_shape(global.gemdoom1,pt_shape_sphere)
part_type_speed(global.gemdoom1,0,0,0.01,0)
part_type_size(global.gemdoom1,0.05,0.08,0,0)
part_type_alpha3(global.gemdoom1,0.3,1,0)
part_type_life(global.gemdoom1,60,80)
part_type_direction(global.gemdoom1,90,90,0,1)

global.gemdoom2 = part_type_create()
part_type_shape(global.gemdoom2,pt_shape_cloud)
part_type_colour1(global.gemdoom2,c_purple)
part_type_size(global.gemdoom2,0.4,0.8,0,0)
part_type_alpha3(global.gemdoom2,0.3,0.5,0)
part_type_life(global.gemdoom2,60,80)

//-------------------\\

/*FOR SKULL LOCK APPEAR*/

global.gemskull1 = part_type_create() //white particles
part_type_shape(global.gemskull1,pt_shape_sphere)
part_type_speed(global.gemskull1,0,0,0.01,0)
part_type_colour1(global.gemskull1,c_green)
part_type_size(global.gemskull1,0.05,0.08,0,0)
part_type_alpha3(global.gemskull1,0.3,1,0)
part_type_life(global.gemskull1,60,80)
part_type_direction(global.gemskull1,90,90,0,1)

global.gemskull2 = part_type_create()
part_type_shape(global.gemskull2,pt_shape_cloud)
part_type_colour1(global.gemskull2,c_black)
part_type_size(global.gemskull2,0.4,0.8,0,0)
part_type_alpha3(global.gemskull2,0.3,0.5,0)
part_type_life(global.gemskull2,60,80)

//-------------------\\

/*FOR FRUIT GEM SPARKLES */

global.part_fruit_sparkles = part_type_create();
part_type_shape(global.part_fruit_sparkles,pt_shape_spark);
part_type_size(global.part_fruit_sparkles,0.20,0.30,-0.005,0);
part_type_scale(global.part_fruit_sparkles,1,1);
part_type_color1(global.part_fruit_sparkles,c_white);
part_type_alpha2(global.part_fruit_sparkles,1,0);
part_type_speed(global.part_fruit_sparkles,1,1,0,0);
part_type_direction(global.part_fruit_sparkles,250,280,0,0);
part_type_gravity(global.part_fruit_sparkles,0,270);
part_type_orientation(global.part_fruit_sparkles,0,359,2,0,1);
part_type_blend(global.part_fruit_sparkles,1);
part_type_life(global.part_fruit_sparkles,30,45);




/*FOR FRUIT GEM BREAK SPARKLES*/

global.part_fruit_break_sparkles = part_type_create();
part_type_shape(global.part_fruit_break_sparkles,pt_shape_spark);
part_type_size(global.part_fruit_break_sparkles,0.20,0.30,0,0);
part_type_scale(global.part_fruit_break_sparkles,1,1);
part_type_color1(global.part_fruit_break_sparkles,16777215);
part_type_alpha2(global.part_fruit_break_sparkles,1,0);
part_type_speed(global.part_fruit_break_sparkles,5,6,-0.10,0);
part_type_direction(global.part_fruit_break_sparkles,0,359,0,20);
//part_type_gravity(global.part_fruit_break_sparkles,0.10,270);
part_type_orientation(global.part_fruit_break_sparkles,0,0,10,0,1);
part_type_blend(global.part_fruit_break_sparkles,1);
part_type_life(global.part_fruit_break_sparkles,20,30);


/*-------------------------*/
/*FOR COAL BREAK*/
global.coalbreak = part_type_create()
part_type_speed(global.coalbreak,1,1,0,0)
part_type_direction(global.coalbreak,-45,45,0,0);
part_type_orientation(global.coalbreak,0,359,0,0,0);
part_type_shape(global.coalbreak,pt_shape_spark);
part_type_size(global.coalbreak,0.5,0.5,0,0);
part_type_life(global.coalbreak,10,15);
part_type_alpha2(global.coalbreak,1,0);

global.coalgeodebreak = part_type_create()
part_type_speed(global.coalgeodebreak,3,3,0,0)
part_type_direction(global.coalgeodebreak,0,360,0,0);
part_type_orientation(global.coalgeodebreak,0,359,0,0,0);
part_type_shape(global.coalgeodebreak,pt_shape_spark);
part_type_size(global.coalgeodebreak,0.4,0.6,0,1);
part_type_life(global.coalgeodebreak,40,50);
part_type_alpha2(global.coalgeodebreak,1,0);

global.coalbreakemit = part_emitter_create(global.sys_above_gem)
/*------------------------*/


/* GEM BREAK */
global.pr_gembreak = part_type_create();
part_type_shape(global.pr_gembreak,pt_shape_spark);
part_type_size(global.pr_gembreak,0.03,0.1,0,0);
part_type_scale(global.pr_gembreak,1,1);
part_type_color1(global.pr_gembreak,16777215);
part_type_alpha3(global.pr_gembreak,0,1,0);
part_type_direction(global.pr_gembreak,0,359,0,1);
part_type_gravity(global.pr_gembreak,0.02,270);
part_type_orientation(global.pr_gembreak,0,0,3,1,0);
part_type_blend(global.pr_gembreak,1);
part_type_life(global.pr_gembreak,35,45);

/* BOMB DESTROYED */
//type
global.part_BombSmoke = part_type_create();
part_type_shape(global.part_BombSmoke,pt_shape_explosion);
part_type_size(global.part_BombSmoke,0.8,1,0.04,0);
part_type_scale(global.part_BombSmoke,1,1);
part_type_color1(global.part_BombSmoke,2434341);
part_type_alpha2(global.part_BombSmoke,1,0);
part_type_speed(global.part_BombSmoke,0.20,0.30,0,0);
part_type_direction(global.part_BombSmoke,0,359,0,0);
part_type_gravity(global.part_BombSmoke,0,270);
part_type_orientation(global.part_BombSmoke,0,359,4,0,1);
part_type_blend(global.part_BombSmoke,1);
part_type_life(global.part_BombSmoke,65,90);

global.part_BombSmoke2 = part_type_create();
part_type_shape(global.part_BombSmoke2,pt_shape_explosion);
part_type_size(global.part_BombSmoke2,1,1,0.05,0);
part_type_scale(global.part_BombSmoke2,1,1);
part_type_color1(global.part_BombSmoke2,12632256);
part_type_alpha3(global.part_BombSmoke2,0,0.80,0);
part_type_speed(global.part_BombSmoke2,1,1,0,0);
part_type_direction(global.part_BombSmoke2,0,359,0,0);
part_type_gravity(global.part_BombSmoke2,0,270);
part_type_orientation(global.part_BombSmoke2,0,0,3,0,1);
part_type_blend(global.part_BombSmoke2,1);
part_type_life(global.part_BombSmoke2,20,20);


//
 
/*NEW LIGHTNING*/
//Particles onto a gem that is a lightning/star
global.part_star_stars = part_type_create();
part_type_sprite(global.part_star_stars,spr_par_starstar,0,0,0);
part_type_size(global.part_star_stars,0.01,0.10,0,0);
part_type_scale(global.part_star_stars,1,1);
part_type_color2(global.part_star_stars,16777215,14932142);
part_type_alpha1(global.part_star_stars,1);
part_type_speed(global.part_star_stars,1,1,0,0);
part_type_direction(global.part_star_stars,0,359,10,0);
part_type_gravity(global.part_star_stars,0,270);
part_type_orientation(global.part_star_stars,0,359,0,0,1);
part_type_blend(global.part_star_stars,1);
part_type_life(global.part_star_stars,10,10);

global.part_star_bolt = part_type_create();
part_type_sprite(global.part_star_bolt,spr_par_starbolt,0,0,0);
part_type_size(global.part_star_bolt,0.50,1,0,0);
part_type_scale(global.part_star_bolt,1,1);
part_type_color2(global.part_star_bolt,16777215,14932142);
part_type_alpha2(global.part_star_bolt,1,0);
part_type_speed(global.part_star_bolt,0.2,0.2,0,2);
part_type_direction(global.part_star_bolt,0,359,10,1);
part_type_gravity(global.part_star_bolt,0,270);
part_type_orientation(global.part_star_bolt,0,359,0,5,1);
part_type_blend(global.part_star_bolt,1);
part_type_life(global.part_star_bolt,10,10);
part_type_death(global.part_star_bolt,1,global.part_star_stars)

global.emit_newstar = part_emitter_create(global.sys_below_gem);
//part_emitter_region(Sname,global.emit_newstar,-32,32,-32,32,2,0);
//part_emitter_stream(Sname,global.emit_newstar,global.gemsmoketype,3);
/**/

/* GLASS TUBE */
//The particles on the timer
global.pr_tube = part_type_create();
part_type_shape(global.pr_tube,pt_shape_spark);
part_type_size(global.pr_tube,0.10,0.10,0,0);
part_type_scale(global.pr_tube,1,1);
part_type_color1(global.pr_tube,956145);
part_type_alpha2(global.pr_tube,1,0);
part_type_speed(global.pr_tube,1.4,1.4,0,0);
part_type_direction(global.pr_tube,60,115,0,20);
part_type_gravity(global.pr_tube,0.02,270);
part_type_orientation(global.pr_tube,0,0,0,0,1);
part_type_blend(global.pr_tube,1);
part_type_life(global.pr_tube,60,60);




/* FOR FIRE */


//Cinder Particle
global.partCinder = part_type_create();
part_type_shape(global.partCinder,pt_shape_flare);
part_type_size(global.partCinder,0.5,1,0,0);
part_type_color2(global.partCinder,c_orange,c_red);
part_type_alpha3(global.partCinder,1,1,0);
part_type_speed(global.partCinder,1,2,0,0);
part_type_direction(global.partCinder,85,95,0,0);
part_type_blend(global.partCinder,1);
part_type_life(global.partCinder,13,18);

//Particles for a gem that is a flame
global.partFire = part_type_create();
part_type_sprite(global.partFire,spr_partFire,0,0,1);
part_type_size(global.partFire,0.5,1,0,0);
part_type_color2(global.partFire,c_orange,c_red);
part_type_alpha3(global.partFire,1,1,0);
part_type_speed(global.partFire,1,1,0,0);
part_type_direction(global.partFire,85,95,0,5);
part_type_orientation(global.partFire,0,359,0,0,0);
part_type_blend(global.partFire,1);
part_type_life(global.partFire,3,7);
part_type_death(global.partFire,1,global.partCinder);
/*---------------------*/

/*FOR LIGHTNING*/
//Particle System

//Glowy Particle
global.partLight = part_type_create();
part_type_shape(global.partLight, pt_shape_flare);
part_type_alpha2(global.partLight, 1, 0); 
part_type_direction(global.partLight,0,360,0,5);
part_type_speed(global.partLight, 1, 1, 0, 0);
part_type_size(global.partLight,0.1,0.1,0,0)
part_type_life(global.partLight,34,60);

//Lightning particle
global.partRay = part_type_create();
part_type_shape(global.partRay, pt_shape_disk);
part_type_sprite(global.partRay,spr_partFire,0,0,0)
part_type_alpha2(global.partRay, 1, 0); 
part_type_blend(global.partRay, 1); 
part_type_direction(global.partRay,0,90,90,5);
part_type_orientation(global.partRay,0,360,0,2,0);
part_type_speed(global.partRay, 1, 1, 0, 0);
part_type_size(global.partRay,1.2,1.2,0,0)
part_type_life(global.partRay,10,20);


/*---------------------*/

/* FOR GEM EXPLOSION */
//For when a flame gem explodes, this includes smoke and fire (256x256)
global.gemexplodetype = part_type_create()
part_type_shape(global.gemexplodetype,pt_shape_cloud)
part_type_alpha3(global.gemexplodetype,0.5,1,0)
part_type_size(global.gemexplodetype,0.3,0.3,0.05,0)
part_type_life(global.gemexplodetype,30,50)
part_type_orientation(global.gemexplodetype,0,360,1,0,0)
part_type_colour1(global.gemexplodetype,c_white)

global.gemexplodetype2 = part_type_create()
part_type_shape(global.gemexplodetype2,pt_shape_cloud)
part_type_alpha3(global.gemexplodetype2,0.5,1,0)
part_type_size(global.gemexplodetype2,0.3,0.3,0.05,0)
part_type_life(global.gemexplodetype2,30,50)
part_type_orientation(global.gemexplodetype2,0,360,1,0,0)
part_type_colour1(global.gemexplodetype2,c_orange)

global.gemexplodetype3 = part_type_create()
part_type_shape(global.gemexplodetype3,pt_shape_explosion)
part_type_alpha2(global.gemexplodetype3,0.8,0)
part_type_size(global.gemexplodetype3,2,2,0,0)
part_type_life(global.gemexplodetype3,10,25)
part_type_orientation(global.gemexplodetype3,0,360,1,0,0)
part_type_colour1(global.gemexplodetype3,c_yellow)
/*--------------------*/







/*FOR LIGHTNING EXPLOSION*/
//Particles when a gem dies from a lightning
/*
global.gemsmoketype = part_type_create()
part_type_shape(global.gemsmoketype,pt_shape_explosion)
part_type_alpha2(global.gemsmoketype,0.6,0)
part_type_life(global.gemsmoketype,60,100)
part_type_size(global.gemsmoketype,1,1,0.01,0)
part_type_orientation(global.gemsmoketype,0,360,4,0,0)
*/
global.gemsmoketype = part_type_create();
part_type_shape(global.gemsmoketype,pt_shape_smoke);
part_type_size(global.gemsmoketype,1,1,0,0);
part_type_scale(global.gemsmoketype,1,1);
part_type_color1(global.gemsmoketype,255);
part_type_alpha2(global.gemsmoketype,0.5,0);
part_type_speed(global.gemsmoketype,0.30,0.70,0,0);
part_type_direction(global.gemsmoketype,0,359,0,1);
part_type_gravity(global.gemsmoketype,0,270);
part_type_orientation(global.gemsmoketype,0,359,0,1,1);
part_type_blend(global.gemsmoketype,1);
part_type_life(global.gemsmoketype,30,40);

global.gemsmokesparkle = part_type_create()
part_type_sprite(global.gemsmokesparkle,sparkle,0,1,0)
part_type_blend(global.gemsmokesparkle,1)
part_type_alpha3(global.gemsmokesparkle,0.4,1,0)
part_type_life(global.gemsmokesparkle,50,70)
part_type_size(global.gemsmokesparkle,0.3,0.3,0,0)
part_type_direction(global.gemsmokesparkle,0,360,1,1)
part_type_speed(global.gemsmokesparkle,1,1,0,1)

/*----------------*/

/*FOR MULTIPLIER*/
//Idle particles for when a multiplier gem exists
global.pr_multi = part_type_create();
part_type_shape(global.pr_multi,pt_shape_flare);
part_type_size(global.pr_multi,0.4,0.80,0,0);
part_type_scale(global.pr_multi,0.20,0.40);
part_type_color1(global.pr_multi,16777215);
part_type_alpha3(global.pr_multi,0,1,0);
part_type_speed(global.pr_multi,1.2,1.5,0,0);
part_type_direction(global.pr_multi,0,359,1,0);
part_type_orientation(global.pr_multi,0,0,0,0,1);
part_type_blend(global.pr_multi,1);
part_type_life(global.pr_multi,25,35);

/*FOR SUPERNOVA*/
//Supernova particles (not exploded)

//Glowy Particle
global.partNovaLight = part_type_create();
part_type_shape(global.partNovaLight, pt_shape_flare);
part_type_alpha2(global.partNovaLight, 1, 0); 
part_type_direction(global.partNovaLight,0,360,0,5);
part_type_speed(global.partNovaLight, 1, 1, 0, 0);
part_type_size(global.partNovaLight,0.1,0.1,0,0)
part_type_life(global.partNovaLight,34,60);

//Lightning particle
global.partNovaRay = part_type_create();
part_type_shape(global.partNovaRay, pt_shape_disk);
part_type_colour_mix(global.partNovaRay, c_white, c_orange);
part_type_sprite(global.partNovaRay,spr_partFire,0,0,0)
part_type_alpha2(global.partNovaRay, 1, 0); 
part_type_blend(global.partNovaRay, 1); 
part_type_direction(global.partNovaRay,0,90,90,5);
part_type_orientation(global.partNovaRay,0,360,0,2,0);
part_type_speed(global.partNovaRay, 1, 1, 0, 0);
part_type_size(global.partNovaRay,1.2,1.2,0,0)
part_type_life(global.partNovaRay,10,20);

//Fire Particle
global.partNovaFire = part_type_create();
part_type_sprite(global.partNovaFire,spr_partFire,0,0,1);
part_type_size(global.partNovaFire,1,1.5,0,0);
part_type_color2(global.partNovaFire,c_blue,c_red);
part_type_alpha3(global.partNovaFire,1,1,0);
part_type_speed(global.partNovaFire,1,1,0,0);
part_type_direction(global.partNovaFire,85,95,0,5);
part_type_orientation(global.partNovaFire,0,359,0,0,0);
part_type_blend(global.partNovaFire,1);
part_type_life(global.partNovaFire,5,10);
/*------------------------*/


/*Septanova*/
global.partSeptafractal = part_type_create();
part_type_sprite(global.partSeptafractal,spr_fractal,0,0,0);
part_type_size(global.partSeptafractal,1,1,0,0);
part_type_scale(global.partSeptafractal,1,1);
part_type_color3(global.partSeptafractal,33023,8388672,255);
part_type_alpha2(global.partSeptafractal,1,0);
part_type_speed(global.partSeptafractal,0.30,0.30,0,0);
part_type_direction(global.partSeptafractal,0,359,0,1);
part_type_gravity(global.partSeptafractal,0,270);
part_type_orientation(global.partSeptafractal,0,359,5,0,1);
part_type_blend(global.partSeptafractal,1);
part_type_life(global.partSeptafractal,60,100);

//explosion
 global.partSeptaExplosion = part_type_create();
part_type_shape(global.partSeptaExplosion,pt_shape_spark);
part_type_size(global.partSeptaExplosion,0.10,0.40,0,0.1);
part_type_scale(global.partSeptaExplosion,1,1);
part_type_color3(global.partSeptaExplosion,255,16711680,65280);
part_type_alpha3(global.partSeptaExplosion,0,1,0);
part_type_speed(global.partSeptaExplosion,1,2,0,0);
part_type_direction(global.partSeptaExplosion,0,359,0,0);
part_type_orientation(global.partSeptaExplosion,0,0,0,0,1);
part_type_blend(global.partSeptaExplosion,1);
part_type_life(global.partSeptaExplosion,60,300);

global.partSeptaExplosion2 = part_type_create();
part_type_shape(global.partSeptaExplosion2,pt_shape_explosion);
part_type_size(global.partSeptaExplosion2,0.40,1,0.50,0);
part_type_scale(global.partSeptaExplosion2,1,1);
part_type_color3(global.partSeptaExplosion2,33023,16776960,16711680);
part_type_alpha2(global.partSeptaExplosion2,1,0);
part_type_speed(global.partSeptaExplosion2,0,0,0,0);
part_type_direction(global.partSeptaExplosion2,0,359,0,0);
part_type_gravity(global.partSeptaExplosion2,0,270);
part_type_orientation(global.partSeptaExplosion2,0,359,1,0,1);
part_type_blend(global.partSeptaExplosion2,1);
part_type_life(global.partSeptaExplosion2,30,40);


/*Octanova*/
global.partOctafractal = part_type_create();
part_type_sprite(global.partOctafractal,spr_fractal,0,0,0);
part_type_size(global.partOctafractal,1,1,0,0);
part_type_scale(global.partOctafractal,1,1);
part_type_color3(global.partOctafractal,33023,16776960,c_green);
part_type_alpha2(global.partOctafractal,1,0);
part_type_speed(global.partOctafractal,0.30,0.30,0,0);
part_type_direction(global.partOctafractal,0,359,0,1);
part_type_gravity(global.partOctafractal,0,270);
part_type_orientation(global.partOctafractal,0,359,5,0,1);
part_type_blend(global.partOctafractal,1);
part_type_life(global.partOctafractal,60,100);


