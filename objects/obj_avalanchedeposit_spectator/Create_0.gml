/// @description Avalanche deposit that holds how many gems to send info
// You can write your code in this editor
whomst_turn = 0 //whose turn is it (player 1 = 0, player 2 = 1)
MYDEBUG = false
gemsmatched = 0
spawn_invs = false
doonce = true
gameover = false
num_turns = 1
ammoving = false
alpha = 1
gems_to_send = 1
gems_existing = 3*8
hidden_gems = 0
xdestination = x
left = 64 + sprite_width/2
right = room_width - 64 - sprite_width/2
f = 0

function change_turn(_gems_sent) {
	hidden_gems = 0
	whomst_turn = !whomst_turn
	num_turns++
	gemsmatched = 0
	gems_to_send = 1
	var b = spectator_get_board(whomst_turn)
	make_avalanche_compliment()
	xdestination = b.x - 32 + sprite_width/2
	var non_inv_gems = 0;
	var p_id = whomst_turn
	with(Gem_2) {
		if (!amInvisible && player_id == p_id) non_inv_gems++
	}
	if (_gems_sent + non_inv_gems > 64) hidden_gems = (_gems_sent + non_inv_gems) - 64
}