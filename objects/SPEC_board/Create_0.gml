/// @description
image_index = 0
image_speed = 0
depth = 3
alpha = 0			//Blazing speed current alpha
swapper = noone
player_id = 0		//Which player does this board represent? (0 = player1 or 1 = player2)
player_name = ""	//Player tag to show on top of me

function create_swapper() {
	swapper = instance_create(0,0,player2)
}

function blazing_speed_on() {
	alpha = 1
	audio_play_sound(vo_blazingspeed,0,0)
	audio_play_sound(snd_blazingspeed,0,0)
}

function blazing_speed_off() {
	alarm[2] = 1
}
