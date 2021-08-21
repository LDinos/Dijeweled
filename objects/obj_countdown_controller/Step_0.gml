/// @description Insert description here
if glowalpha > 0 glowalpha -=0.05
if moves = 0
{
	Gamerule_1.controlallowed = false
}

if moves <= 3
{
	if prev_moves != moves
	{
		audio_play_sound(snd_countdown_move,0,0)
		xx = 1
		yy = 1
		zoomalpha = 1
		alarm[2] = 1
	}
}
if Gamerule_1.IsGemActive2 && moves = 0 && !explosion_start && !timeup
{
	explosion_start = true
	audio_play_sound(snd_coalify,0,false)
	with(Gem_1)
	{
		if other.index = skinnum
		{
			instance_create(x,y,obj_coalify)
			set_skin(7)
			gempower = 0
		}
	}
	alarm[0] = 30
}
prev_moves = moves;