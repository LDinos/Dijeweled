function unhide_items() {
	hidden = false
	//set visible for all
	Board_1.visible = true
	Gem_1.visible = true
	obj_score.visible = true
	obj_zenify.visible = true
	obj_levelbar.visible = true
	if mouse_was_hidden player1.visible = true
	if instance_exists(replay) replay.visible = true
	doonce = false


}
