/// @description Insert description here
current_button = 0
MyGem = Gem_local
MyBoard = Board_local
MyGamerule = Gamerule_local
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
gamepad_can_move = 0
gamepad_first_hit = true
prev_mousex = mouse_x
prev_mousey = mouse_y
keyboard_control = true
depth = 2
rot = 0
pos_j = 0
pos_i = 0;

touchedBoard = false;
touchedCCW   = false;
xlim = -1
ylim = -1
buttonW = 255;
buttonH = 127;
buttonX = 128;
buttonY = 843;