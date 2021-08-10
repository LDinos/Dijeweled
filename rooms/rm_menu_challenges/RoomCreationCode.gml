draw_set_font(font0)
random_set_seed(irandom(1000))
global.canbepressed = false
global.replay_match_allowed = false
global.replay_match_isplaying = false
if !instance_exists(OBJ_GRAPHICS) instance_create(x,y,OBJ_GRAPHICS)
discord_update_presence("In Quests Menu",global.version,"ico_512","")