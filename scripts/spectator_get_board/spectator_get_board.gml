/// @function spectator_get_board(player_id)
/// @description Gets the board that represents the player_id that is provided
/// @param {type} player_id Player id, 0 or 1 (for player 1 or player 2 respectively)
function spectator_get_board(_player_id){
	with(SPEC_board) {
		if (_player_id == player_id) return id;
	}
	return noone;
}