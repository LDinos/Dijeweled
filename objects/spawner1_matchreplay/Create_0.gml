/// @description spawner for first board
// You can write your code in this editor
Replay_load = ds_map_create()
var json = json_read_parse(global.replay_string)
//ini_open(global.replay_string)
	var sect = json.data// ini_read_string("replay","data","-")
	ds_map_read(Replay_load,sect)
//ini_close()
coalspawn = false
bombspawn = -1 //this is the counter to use on our fresh spawned gem. if its -1 it means it wont spawn a bomb
havedone = false
showme = "-"
if Gamerule_1.spawnallowed
{
// and now spawn them in board1
for(i=0;i<=global.board_rows-1;i++)
{
	match_up_index[i] = 1
	for(j=0;j<=7;j++)
	{
		var skin = Replay_load[? string(i)+"-"+string(j)+"_spawn"]
		my_x = Board_1.x + 64*j
		my_y = Board_1.y - 64*(i+1)
		var Gem = instance_create_depth(my_x, my_y,-1,Gem_1) 
		with(Gem) set_skin(skin)
	}
}

}