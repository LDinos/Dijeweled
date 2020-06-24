/// @description Coalify
with(obj_countdown_bkg) alpha = 1
with(Gem_1)
{
	if skinnum = 7 instance_destroy()
}
Gamerule_1.IsGemActive = 0
Gamerule_1.IsGemActive2 = 0
Gamerule_1.controlallowed = true
glowalpha = 1
audio_play_sound(snd_lightning_refill,0,false)
moves = 10
index = irandom(6)
explosion_start = false