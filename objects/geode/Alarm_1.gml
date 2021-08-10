snd = audio_play_sound(snd_geode,0,0)
audio_sound_pitch(snd,random_range(1,1.2))
part_emitter_burst(global.sys_above_gem,global.coalbreakemit,global.coalgeodebreak,18)
if Gamerule_1.points_allowed = true
{ 
	var g = instance_create(x,y,geode_text)
	g.mycoal = mycoal
	g.myscore = myscore
}
instance_destroy()
