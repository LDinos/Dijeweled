/// @description Insert description here
// You can write your code in this editor
percent = 0
current_button = 0
gamepad_can_move = 0
gamepad_first_hit = true
MyGamerule = Gamerule_1
MyBoard = Board_1
MyGem = Gem_1
if global.replay_match_allowed
{
	match_replay = true
}
else match_replay = false
mouse_xx_pos = 0
mouse_yy_pos = 0
dont_swap = false
swap_back = false
currently_swapping_back = false
whattoshow = 0
takerandom = false
image_speed = 0
gem1 = noone
gem2 = noone
gemtocheck = noone
xlimprevious = 0 //previous cursor position
ylimprevious = 0
xlim = 3 //cursor position
ylim = 3

function swap_xy_lerp(gem, alpha) {
	with(gem) {
		SWAP_X = lerp(0, SWAP_X_END, alpha) //ease_inout_sine(percent,0,SWAP_X_END,1)//round(lerp(0,SWAP_X_END,power(percent,2))) //- x
		SWAP_Y = lerp(0, SWAP_Y_END, alpha) //ease_inout_sine(percent,0,SWAP_Y_END,1)//round(lerp(0,SWAP_Y_END,power(percent,2))) //- y
	}
}

function swap_anim_lastframe(gem) {
	with(gem) {
		SWAP_X = round(lerp(0,SWAP_X_END,1)) //- x
		SWAP_Y = round(lerp(0,SWAP_Y_END,1)) //- y
		x += SWAP_X		
		y += SWAP_Y
		SWAP_X = 0
		SWAP_Y = 0
		SWAP_X_END = 0
		SWAP_Y_END = 0
		//if (!isturnback) {with(MyPlayer) alarm[2] = 5}
		//else {alarm[2] = 5; MyGamerule.moving = false}
	}
}

function change_gem_pos_vars(gem1,gem2,i1,j1,i2,j2) {
	gem1._i = i1
	gem2._i = i2
	gem1._j = j1
	gem2._j = j2
	gem1.i_limit = gem1._i
	gem2.i_limit = gem2._i
	MyGamerule.gems_id_array[i1][j1] = gem1
	MyGamerule.gems_id_array[i2][j2] = gem2
}