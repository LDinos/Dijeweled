/// @description Board Spawn

if (global.SET_gamemode == 1) 
{
	Gamerule_1.IsGemActive = 0
	Gamerule_1.IsGemActive2 = 0
	Gamerule_local.IsGemActive = 0
	Gamerule_local.IsGemActive2 = 0
	Gamerule_1.controlallowed = true
	Gamerule_local.controlallowed = false
	audio_play_sound(vo_go,0,false)
	instance_create(0,0,spawner_avalanche)
	instance_create(0,0,spawner_avalanche_local)
	instance_create(room_width/2,992,obj_avalanche_pass)
	with(spawner_avalanche) event_user(1)
	with(obj_avalanchedeposit_local) doonce = !doonce
	instance_destroy()
}
else
{
	instance_create(0,0,spawner1)
	with(spawner1) event_user(1)
	instance_create(0,0,spawner_local)
	Gamerule_local.spawnallowed = true;
}
