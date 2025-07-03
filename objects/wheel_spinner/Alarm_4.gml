/// @description enable spawner
if Gamerule_1.bomb_danger < 3
{
Gamerule_1.bomb_danger++
}

if !Gamerule_1.isReplay
{
	with(Gamerule_1)
	{
		var ch = irandom(99)
		bomb_win = (ch > 99/(5-bomb_danger)) //chance to win a predetermined bomb defusal
	}
}
else
{
	Gamerule_1.bomb_win = Gamerule_1.cur_bomb_win
	Gamerule_1.bomb_danger = Gamerule_1.cur_bomb_danger
}
with(bomb)
{
	ds_list_delete(Gamerule_1.list_of_bombs,ds_list_find_index(Gamerule_1.list_of_bombs,id))
	if (Gamerule_1.gem_board1[_i,_j] == id) Gamerule_1.gem_board1[_i,_j] =noone //remove me from the list
	instance_destroy(id,false)
}
Gamerule_1.spawnallowed = true
instance_destroy()