/// @description Time
time_now--
with(obj_score) time = convert_seconds_to_time(other.time_now)
if time_now > 0
{
	switch time_now
	{
		case 60:
			audio_play_sound(vo_1min,0,0)
			break;
		case 30:
			audio_play_sound(vo_30secs,0,0)
			break;
		case 10:
			audio_play_sound(vo_10,0,0)
			break;
		case 9:
			audio_play_sound(vo_9,0,0)
			break;
		case 8:
			audio_play_sound(vo_8,0,0)
			break;
		case 7:
			audio_play_sound(vo_7,0,0)
			break;
		case 6:
			audio_play_sound(vo_6,0,0)
			break;
		case 5:
			audio_play_sound(vo_5,0,0)
			break;
		case 4:
			audio_play_sound(vo_4,0,0)
			break;
		case 3:
			audio_play_sound(vo_3,0,0)
			break;
		case 2:
			audio_play_sound(vo_2,0,0)
			break;
		case 1:
			audio_play_sound(vo_1,0,0)
			break;
	}
	alarm[2] = 60
}
else
{
	with(obj_radio) {audio_stop_sound(music); audio_play_sound(mus_blitzend,0,false)}
	audio_play_sound(vo_timeup,0,0)
	Gamerule_1.controlallowed = false
	Gamerule_1.timeup = true
	with(obj_countdown_controller)
	{
		timeup = true
		alarm[0] = -1
	}
	alarm[3] = 60
}