/// @description Insert description here
// You can write your code in this editor
if audio_group_is_loaded(audiogroup_music) && audio_group_is_loaded(audiogroup_voice)
{
	var newuser = false
		ini_open("settings.ini")
			var marg = ini_read_real("Settings","SleepMargin",15)
			display_set_sleep_margin(marg)
			if !ini_key_exists("Settings", "user") newuser = true
			global.VolMus = ini_read_real("Settings","VolMus",0.3)
			global.VolFX = ini_read_real("Settings","VolFX",0.6)
			global.VolVO = ini_read_real("Settings","VolVO",0.5)
			audio_group_set_gain(audiogroup_music,global.VolMus,0)
			audio_group_set_gain(audiogroup_voice,global.VolVO,0)
			audio_group_set_gain(audiogroup_default,global.VolFX,0)
		ini_close()

	if newuser instance_create(0,0,obj_newuser)
	else room_goto(rm_menu)
	instance_destroy()
}
