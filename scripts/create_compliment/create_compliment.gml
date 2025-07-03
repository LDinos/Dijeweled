///@description Text used in compliments
///@param text
function create_compliment(argument0) {
	var board = Board_1;
	var _p_id = 0
	if (iam == Gamerule_local) {
		board = Board_local;
		_p_id = 1;
	}
	with(complimenter) {
		if (p_id == _p_id) instance_destroy()
	}
	var exc = instance_create_depth(board.x + 32 + board.sprite_width/3 ,board.y + 32 + board.sprite_height/3,-15,complimenter)
	exc.image_index = argument0
	exc.p_id = _p_id
}
