setPREV_MENU(room);
draw_set_font(font0)
random_set_seed(irandom(1000))
global.replay_match_allowed = false
global.replay_match_isplaying = false
if !instance_exists(OBJ_GRAPHICS) instance_create(0,0,OBJ_GRAPHICS)

DISCORD np_setpresence(global.version, "In Quests Menu", "ico_512", "")