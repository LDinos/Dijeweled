/// @description Insert description here
x = lerp(x,xdestination,0.1)
var gem = Gem_1
var Gmrl = Gamerule_1
var gem_local = Gem_local
var board_local = Board_local

if !myturn //if it is my turn
{
	gem = Gem_local
	Gmrl = Gamerule_local
	gem_local = Gem_1
	board_local = Board_1
}

var non_inv_gems = 0;
with(gem) {if !amInvisible non_inv_gems++}
gems_existing = hidden_gems + non_inv_gems //non_inv gems einai ta diamantia hdh sto board
if ammoving //if I made a move, be ready to change turns
{
	Gmrl.controlallowed = false
	if Gmrl.IsGemActive2 //everything is stable, now change turn
	{
		if (gems_existing < 64) //normal end turn
		{
			avalanche_end_turn(board_local,gem_local)
		}
		else if !gameover //defeat
		{
			ammoving = false
			gameover = true
			alarm[0] = 60*8
			alarm[1] = 60*3
			audio_stop_all()
			gemdrop(gem)
			audio_play_sound(vo_gameover,0,false)				
		}
	}
}
