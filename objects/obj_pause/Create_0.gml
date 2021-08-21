/// @description Pause menu, after pressing ESC in-game

instance_create(x+272,y+178,obj_pause_tick_fullscreen)
instance_create(x+272,y+178 +32 + 16,obj_pause_tick_lighteffects)
instance_create(x+272,y+178 +32*2 + 16*2,obj_pause_tick_vsync)
//instance_create(x+272,y+178 +32*3 + 16*3,obj_pause_tick_lvltransition)
instance_create(x+272,y+178 +32*4 + 16*4,obj_pause_tick_transparent)
instance_create(x+272,y+178 +32*3 + 16*3,obj_pause_tick_shownum)

if room = rm_menu_options
{
	instance_create(x+432,y+560,obj_pause_return)
	instance_create(x+720, y+560, obj_pause_controls)
}
else
{
	part_particles_clear(global.sys_above_gem)
	part_particles_clear(global.sys_below_gem)
	instance_create(x+432,y+560,obj_pause_return)
	instance_create(x+720,y+560,obj_pause_mainmenu)
	instance_create(x+576, y+560, obj_pause_controls)
}

instance_create(x+416,y+480+32,obj_pause_arrowleft)
instance_create(x+576,y+480+32,obj_pause_arrowright)
instance_create(x+704,y+480+32,obj_pause_arrowleft_margin)
instance_create(x+864,y+480+32,obj_pause_arrowright_margin)

instance_create(x+688,y+176,obj_volume_music)
instance_create(x+688,y+176 +64,obj_volume_fx)
instance_create(x+688,y+176 +64 +64,obj_volume_voice)

ini_open("settings.ini")
	text = ini_read_string("Settings","Size","1280x720")
	text2 = ini_read_real("Settings","SleepMargin",15)
ini_close()

switch(text)
{
	case "720x405":
		choice = 0
		break;
		
	case "1280x720":
		choice = 1
		break;
		
	case "1600x900":
		choice = 2
		break;
		
	case "1920x1080":
		choice = 3
		break;
	
	case "Custom":
		choice = 4
		break;
	default:
		choice = 0
		text = "1280x720"
		break;
}