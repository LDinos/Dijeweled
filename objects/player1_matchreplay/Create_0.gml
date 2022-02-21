/// @description Insert description here
// You can write your code in this editor

mouse_xx_pos = 0
mouse_yy_pos = 0
dont_swap = false
whattoshow = 0
if global.bot1
{
	alarm[5] = 50
	gemcontrolindex = 0
	switch global.botdifficulty1
	{
		case 0: r1 = 25 r2 = 80 break;
		case 1: r1 = 16 r2 = 45 break;
		case 2: r1 = 15 r2 = 20 break;
		case 3: r1 = 8 r2 = 12 break;
		case 4: r1 = 4 r2 = 5 break;
	}
}
takerandom = false
image_speed = 0
gem1 = noone
gem2 = noone
gemtocheck = noone
xlimprevious = 0 //previous cursor position
ylimprevious = 0
xlim = 3 //cursor position
ylim = 3

Replay_load = ds_map_create()
//var mystring = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	


for(i=0;i<=global.board_rows-1;i++)
{
	for(j=0;j<=Gamerule_1.board_xsize-1;j++)
	{
		gems_skin_array[i][j] = -1
	}
}

ini_open(global.replay_string)
	var sect = ini_read_string("replay","data","-")
	ds_map_read(Replay_load,sect)
	Gamerule_1.geode_xplier = ini_read_real("replay","geode_xplier",1)
ini_close()

random_set_seed(Replay_load[? "seed"])