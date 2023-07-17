room_speed = 60
//draw_texture_flush()
//global.chl_to_unlock = "0:0"
//global.chl_to_succeed = "26:" +string(global.challenge_index)
Gamerule_1.levelcompleteallowed = false
Gamerule_1.compliments_allowed = false
Gamerule_1.replay_allowed = false
Gamerule_1.autosave_allowed = false

load_custom_quest(true)

with(obj_questmusic)
{
	mus_main = mus_takeyourtime
	mus_win = mus_takeyourtimewin
	mus_loss = mus_takeyourtimeloss
	event_user(0)
}