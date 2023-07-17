/// @description Pause menu, after pressing ESC in-game
#macro FREE 0
#macro VOLUME 1
#macro SCREEN 2
#macro MARGIN 3

function find_gamepad() {
	gamepad_id = noone
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		if (gamepad_is_connected(i)) {
			gamepad_id = i
			break;
		}
	}
}

function write_volume_changes() {
	ini_open("settings.ini")
	ini_write_real("Settings","VolFX",global.VolFX)
	ini_write_real("Settings","VolMus",global.VolMus)
	ini_write_real("Settings","VolVO",global.VolVO)
	ini_close()
}

function pause_add_button(_x, _y, butt, row, column) {
	var b = instance_create(_x, _y, butt)
	button_manager[row][column] = b
}

function gamepad_buttons_mouse_leave_all() {
	for(var i = 0; i < array_length(button_manager); i++) {
		for(var j = 0; j < array_length(button_manager[0]); j++) {
			with(button_manager[i][j]) event_perform(ev_mouse, ev_mouse_leave)
		}
	}
}

function gamepad_move_vertically(dir) {
	do {
		gamepad_button_index.row += dir
		if (gamepad_button_index.row >= array_length(button_manager)) gamepad_button_index.row = 0
		else if (gamepad_button_index.row < 0) gamepad_button_index.row = array_length(button_manager)-1
	}
	until(button_manager[gamepad_button_index.row][gamepad_button_index.col] != noone)
	gamepad_buttons_mouse_leave_all()
	with(button_manager[gamepad_button_index.row][gamepad_button_index.col]) event_perform(ev_mouse, ev_mouse_enter)
}

function gamepad_move_horizontally(dir) {
	do {
		gamepad_button_index.col += dir
		if (gamepad_button_index.col >= array_length(button_manager[0])) gamepad_button_index.col = 0
		else if (gamepad_button_index.col < 0) gamepad_button_index.col = array_length(button_manager[0])-1
	}
	until(button_manager[gamepad_button_index.row][gamepad_button_index.col] != noone)
	gamepad_buttons_mouse_leave_all()
	with(button_manager[gamepad_button_index.row][gamepad_button_index.col]) event_perform(ev_mouse, ev_mouse_enter)
}

depth = -99
find_gamepad()
gamepad_button_index = {row : 0, col : 0}
gamepad_button_state = FREE
button_manager = [ 
[noone, noone, noone],
[noone, noone, noone],
[noone, noone, noone],
[noone, noone, noone],
[noone, noone, noone],
[noone, noone, noone],
[noone, noone, noone]
]
if (os_type != os_android) pause_add_button(x+272, y+178, obj_pause_tick_fullscreen, 0, 0)
pause_add_button(x+272, y+178 +32 + 16, obj_pause_tick_lighteffects, 1, 0)
pause_add_button(x+272,y+178 +32*2 + 16*2,obj_pause_tick_vsync, 2, 0)
pause_add_button(x+272,y+178 +32*3 + 16*3,obj_pause_tick_shownum, 3, 0)
pause_add_button(x+272,y+178 +32*4 + 16*4,obj_pause_tick_transparent, 4, 0)


if room = rm_menu_options
{
	pause_add_button(x+432,y+560, obj_pause_return, 6, 0)
	pause_add_button(x+720, y+560, obj_pause_controls, 6, 1)
}
else
{
	part_particles_clear(global.sys_above_gem)
	part_particles_clear(global.sys_below_gem)
	pause_add_button(x+432,y+560,obj_pause_return, 6, 0)
	pause_add_button(x+576, y+560, obj_pause_controls, 6, 1)
	pause_add_button(x+720,y+560,obj_pause_mainmenu, 6, 2)
}

if (os_type != os_android) instance_create(x+416,y+480+32,obj_pause_arrowleft)
if (os_type != os_android) instance_create(x+576,y+480+32,obj_pause_arrowright)
instance_create(x+704,y+480+32,obj_pause_arrowleft_margin)
instance_create(x+864,y+480+32,obj_pause_arrowright_margin)

pause_add_button(x+688,y+176,obj_volume_music, 0, 1)
pause_add_button(x+688,y+176 +64,obj_volume_fx, 1, 1)
pause_add_button(x+688,y+176 +64 +64,obj_volume_voice, 2, 1)

ini_open("settings.ini")
	text = ini_read_string("Settings","Size","1280x720")
	text2 = ini_read_real("Settings","SleepMargin",15)
ini_close()
if (os_type != os_android) switch(text)
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
else text = "Phone"