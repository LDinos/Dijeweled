/// @description Hide every piece in the level after a long time
hidden = true
mouse_x_prev = mouse_x
Board_1.visible = false
Gem_1.visible = false
obj_score.visible = false
obj_zenify.visible = false
obj_levelbar.visible = false
mouse_was_hidden = player1.visible
player1.visible = false
if instance_exists(replay) replay.visible = false