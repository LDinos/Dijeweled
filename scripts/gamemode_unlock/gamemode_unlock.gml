#macro MODE_TWIST 0
#macro MODE_COMPACT 1
#macro MODE_SWIFT 2
#macro MODE_SURVIVOR 3

/// @function gamemode_unlock(mode_index, unlockscreen_x, unlockscreen_y)
/// @description Unlocks a secret gamemode
/// @param {real} mode_index Mode macro index
/// @param {real} unlockscreen_x Coordinate for GAMEMODE UNLOCKED screen object
/// @param {real} unlockscreen_y Coordinate for GAMEMODE UNLOCKED screen object
function gamemode_unlock(mode_index, unlockscreen_x, unlockscreen_y) {
	if !file_exists("secrets.ini") file_create_secrets()
	var l = ds_list_create()
	ini_open("secrets.ini")
		var str = ini_read_string("secret","data","")
		ds_list_read(l,str)
		if l[| mode_index] == false
		{
			instance_create_depth(unlockscreen_x, unlockscreen_y,-99,obj_secretunlock)
			l[| mode_index] = true
			var str = ds_list_write(l)
			ini_write_string("secret","data",str)
		}
	ini_close()
	ds_list_destroy(l)
}