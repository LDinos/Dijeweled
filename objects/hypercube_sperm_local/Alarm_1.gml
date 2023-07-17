audio_play_sound(snd_hype_gemexp,0,0)
var p = 50
var p2 = 20
with(gem_index)
{
	create_score_text(x,y,p,false,mycolor)
	magnify(x,y,false)
	make_inv_dis = true
	create_col = false
	part_particles_create_colour(global.sys_above_gem,x,y,global.gemsmoketype,mycolor,8)
	part_particles_create(global.sys_above_gem,irandom_range(x-32,x+32),irandom_range(y-32,y+32),global.gemsmokesparkle,irandom_range(6,10))
	if (gempower == FRUIT) 
	{
		gempower = FLAME; 
		p = 1000; p2 = 150
	}
	instance_destroy()
}
with(Gamerule_local) {points_add_nocombo(p); style_add(p,false);compliment_add(p2)}
instance_destroy()


