room_speed = 60
//draw_texture_flush()
discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
with(Gamerule_1)
{
	points_xpliered_auto = true
	AHM_allowed = false
	illegals_allowed = true
	end_on_nomoves = false
	hypeallowed = false
	isQuest = false
	levelcompleteallowed = false
	replay_allowed = false
}

if (os_type == os_android) {
	var h = sprite_get_height(spr_buyomobilecontrols1)
	instance_create_depth(0, room_height - h, 0, obj_buyomobile_controls)
}