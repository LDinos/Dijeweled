/* PURPOSE */
// A hypercube detonating in player 2's board in Online (a cheap version of a obj_hypercube_detonate)
alarm[0] = 1
gem = []
list_index = 0
modifier = 1
MyGamerule = Gamerule_2
player_id = 0
audio_play_sound(snd_hype_hit,0,false)
var hype_explo = part_type_create()
var hype_explo_ring = part_type_create()

part_type_sprite(hype_explo,spr_hype_afterglow,false,false,false)
part_type_size(hype_explo,0.5,0.5,0.01,false)
part_type_life(hype_explo,120,120)
part_type_alpha3(hype_explo,0,1,0)

part_type_sprite(hype_explo_ring,spr_hype_afterglow2,false,false,false)
part_type_size(hype_explo_ring,0,0,0.01,false)
part_type_scale(hype_explo_ring,0.5,1)
part_type_life(hype_explo_ring,60,140)
part_type_alpha3(hype_explo_ring,0,1,0)
part_type_orientation(hype_explo_ring,0,179,4,0,false)

part_particles_create(global.sys_above_gem,x,y,hype_explo,1)
part_particles_create(global.sys_above_gem,x,y,hype_explo_ring,3)