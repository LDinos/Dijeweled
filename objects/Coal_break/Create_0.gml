image_speed_default = 0.2
image_speed = image_speed_default
image_xscale = 1
image_yscale = 1
xx = x
yy = y

audio_play_sound(coal_blast,0,0)
with(Gamerule_1) {
	//UNCOMMENT IF YOU WANT SLOW MO AFTER COAL BREAK
	//coal_speed_modifier -= 0.25
	//if (coal_speed_modifier < 0.3) coal_speed_modifier = 0.3
	//alarm[10] = 25
	compliment_add(150)
}


