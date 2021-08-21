/// @description counter++ and bomb destroy
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

audio_play_sound(glugk,1,0)
with(Gamerule_1)
{
	var my_bomb;
	for(var i=0;i<ds_list_size(list_of_bombs);i++) {if (list_of_bombs[| i].countdown = 0) my_bomb = list_of_bombs[| i]}
	
	with(my_bomb)
	{
		ds_list_delete(Gamerule_1.list_of_bombs,ds_list_find_index(Gamerule_1.list_of_bombs,id))
		instance_destroy(id,false)
	}
}

with(Gem_1)
{
if amBomb = true
    {
    countdown += 7
	xmover2 = 0
	ymover2 = 0
	xmover = 0
	ymover = 0
    }
}
with(Gamerule_1.list_of_doom) {xmover2 = 0; ymover2 = 0; countdown += 7}

alarm[4] = 1


