/// @description Insert description here
// You can write your code in this editor
MyGem = Gem_local
MyGamerule = Gamerule_local
MyBoard = Board_local

current_button = 0
gamepad_can_move = 0
gamepad_first_hit = true
match_replay = false
mouse_xx_pos = 0
mouse_yy_pos = 0
dont_swap = false
whattoshow = 0
takerandom = false
if global.bot1
{
	switch global.botdifficulty1
	{
		case 0:
			bot_speed = 60*4
			break;
		case 1:
			bot_speed = 60
			break;
		case 2:
			bot_speed = 5
			break;
		case 3:
			bot_speed = 1
			break;
	}
	if (global.SET_gamemode == 1) bot_speed = 10 //all speeds in avalanche are the same
}
image_speed = 0
gem1 = noone
gem2 = noone
gemtocheck = noone
xlimprevious = 0 //previous cursor position
ylimprevious = 0
xlim = 3 //cursor position
ylim = 3
for(i=0;i<=global.board_rows-1;i++)
{
	for(j=0;j<=Gamerule_1.board_xsize-1;j++)
	{
		gems_skin_array[i][j] = -1
	}
}
