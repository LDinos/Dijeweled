audio_play_sound(snd_hype_gemexp,0,0)
part_particles_create_colour(global.sys_above_gem,x1,y1,global.gemsmoketype,gem_color,8)
part_particles_create(global.sys_above_gem,irandom_range(x1-32,x1+32),irandom_range(y1-32,y1+32),global.gemsmokesparkle,irandom_range(6,10))
instance_destroy()