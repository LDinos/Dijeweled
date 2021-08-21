/// @description Insert description here
time = 0
depth = -1000
image_alpha = 0
alpha = 1
xtouse = -1280 - 32
perc = 0
alarm[0] = 1
audio_play_sound(snd_lvlcomp_00,0,0)
audio_play_sound(snd_lvlcomp_01,0,1)
image = 0
alarm[1] = 1
if (Gamerule_1.points_xpliered_auto) Gamerule_1.xplier = Gamerule_1.level
with(Gamerule_1) clear_lists()