/// @description Fall down
scr_buyo_findij()
var g1 = instance_create(x,y-1,Gem_1)
with(g1) set_skin(other.gem1)
var g2 = instance_create(x+xx,y+yy-1,Gem_1)
with(g2) set_skin(other.gem2)
audio_play_sound(snd_buyo_drop,0,0)
Gamerule_1.IsGemActive = 0
Gamerule_1.IsGemActive2 = 0
if (_i < 0 || _i2 < 0) 
{
	with(obj_buyo_gamerule) {alarm[0] = 3*60}; 
	audio_play_sound(vo_gameover,0,0); 
	audio_stop_sound(mus_puyo)
}
else obj_buyo_gamerule.check = true
instance_destroy()

