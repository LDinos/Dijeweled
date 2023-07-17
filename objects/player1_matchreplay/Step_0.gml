/// @description Insert description here
// You can write your code in this editor
/*
var canmove;
if !Gamerule_1.moving && !dont_swap && !Gamerule_1.lightOn && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning canmove = true
else canmove = false*/
var cur = Gamerule_1.cur_time

if ds_map_exists(Replay_load, string(cur))
{
	xlimprevious = Replay_load[? "xlim_previous" + string(cur)]
	ylimprevious = Replay_load[? "ylim_previous" + string(cur)]
	xlim = Replay_load[? "xlim_" + string(cur)]
	ylim = Replay_load[? "ylim_" + string(cur)]
	gem1 = Gamerule_1.gem_board1[ylimprevious,xlimprevious]
	gem2 = Gamerule_1.gem_board1[ylim,xlim]
	xx1 = gem1.x
	yy1 = gem1.y
	xx2 = gem2.x
	yy2 = gem2.y				
	do_match(Gamerule_1)
	gem1 = noone
	gem2 = noone
}