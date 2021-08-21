/// @description Change index and do its anim
if index < 99 && !Gamerule_1.zenify && !cooldown && !Gamerule_1.isReplay
{
	index += 1*zen_multiplier
	func = 0
	if index >= 99
	{
		index = 99
		create_textellent("ZEN READY")
		audio_play_sound(snd_zenify_ready,0,0)
		part_emitter_burst(global.sys_below_gem,emitter1,particle1,25)
	}
	alarm[0] = 1	
}