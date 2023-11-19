setPREV_MENU(room);
draw_set_font(font0)
random_set_seed(irandom(1000))
global.canbepressed = false
global.replay_match_allowed = false
if !instance_exists(OBJ_GRAPHICS) instance_create(0,0,OBJ_GRAPHICS)

with(obj_menu_buttons_master) change_to_group("replay_save")