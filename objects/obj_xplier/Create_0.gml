/* PURPOSE */
// The multiplier bar of Arcade Mode
image_speed = 0
sum_pos = 0 //number of fruit spawns, for match replay
lerpy = 0
lerpy_toggle = false
lerpy_speed = 1
light = 0
perc = 0 //percentage for lerp at flow width
filler = 0 //current filler width
def_filler = 0 //base filler width
fill_to_go = 0 //future fill in lerp function
bar_gap = 64 //the gap between each bar (gets smaller as the xplie increases)
bar_sprite = 0 //number of bars to show
xplier_index = 0 //number of gaps filled (for checking for fruit)
xplier_real = 1 //real section for multiplier
xx = x 
perc2 = 0 //level complete animation percentage completed variable
t = 0
x_surf = surface_create(8,sprite_height)
if global.replay_match_isplaying
{	
	Replay_load = ds_map_create()
	var json = json_read_parse(global.replay_string)
	//ini_open(global.replay_string)
		var sect = json.data// ini_read_string("replay","data","-")
		ds_map_read(Replay_load,sect)
	//ini_close()
}
with(obj_challenge_score)
{
	y+=48
	x-=16
	xcenter = x + sprite_width/2
	ycenter = y + sprite_height/2
}