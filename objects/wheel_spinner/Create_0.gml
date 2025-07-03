Gamerule_1.spawnallowed = false
pipe_x = 1280/2
spawn_move = false
texttowrite = 0
iwannalose = true
rottoend = 0
audio_play_sound(bombalarm,0,0)
ended = false
k = 1
audio_play_sound(siren,0,1)
maxacc = 8 //max accelleration
alreadydone = false
acc2 = 0
sp = 0
acc = 0
rot = 0
dest = rot
danger = clamp(Gamerule_1.bomb_danger,1,3)
instance_create_depth(0,512,-9,obj_fade)
with(obj_fade) alarm[1] = -1
hook = false
x = room_width/2
y = 512 - sprite_height
ytoreach = 720/2 + 512
instance_create(x,y+72,wheel_butt)
alarm[9] = 10 //tick
alarm[0] = 45
bomb = noone;

function kill_bomb() {
	with(bomb)
	{
		ds_list_delete(Gamerule_1.list_of_bombs,ds_list_find_index(Gamerule_1.list_of_bombs,id))
		instance_destroy(id,false)
	}
}

ticks_left = 7
tick_pitch = 1
tick_pitch_add = 0.05
tick_anim_frames = 8
tick_anim_current = 0
tick_anim_started = false
function tick_bombs_up() {
	var bombs_exist = false
	with(Gem_1)
	{
	if (amBomb = true && other.bomb != id) {
		bombs_exist = true
		instance_create(x,y,obj_gemoutlines)
	    countdown++
		xmover2 = 0
		ymover2 = 0
		xmover = 0
		ymover = 0
	  }
	}
	with(Gamerule_1.list_of_doom) {xmover2 = 0; ymover2 = 0; countdown++; bombs_exist = true}
	if (bombs_exist) {
		var glugk_sound = audio_play_sound(glugk,1,0)
		audio_sound_pitch(glugk_sound, tick_pitch)
		tick_pitch += tick_pitch_add
		ticks_left--
		if (ticks_left == 0) alarm[4] = 1 //end
		else tick_anim_current = tick_anim_frames
	}
	else alarm[4] = 1
}

