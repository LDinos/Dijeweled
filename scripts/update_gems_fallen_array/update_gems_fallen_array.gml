/// @function script()
/// @description default
/// @param {type} param first parameter
function update_gems_fallen_array() {
	with(Gem_1) dont_move_for_oneframe = true
	var temp_array = [[]]
	for(var i = 0; i < 8; i++) for(var j = 0; j < 8; j++) {
		temp_array[i][j] = gems_id_fallen_array[i][j]
		gems_id_fallen_array[i][j] = noone
		gems_skin_array[i][j] = -1
		gems_to_spawn[i][j] = -1
	}
	for(var j=0;j<=7;j++)
	{
		var k = 7;
		for(var i=7;i>=0;i--)
		{
			if temp_array[i][j] != noone
			{
				
				if (temp_array[i][j].amInvisible) {
					gems_id_fallen_array[i][j] = temp_array[i][j]
					gems_skin_array[i][j] = 7
					k--
				} else {
					if (temp_array[i][j].amLocked == 3) k = i
					gems_id_fallen_array[k][j] = temp_array[i][j]
					gems_id_fallen_array[k][j].i_limit = k
					gems_skin_array[k][j] = temp_array[i][j].skinnum
					k--
				}
			}
		}
		//gaps[j] = k+1
	}
}

function update_gems_to_spawn_array() {
	var found_gems_to_spawn = false
	for(var j = 0; j < 8; j++) for(var i = 0; i < 8; i++) {
		if (gems_skin_array[i][j] == -1) {gems_to_spawn[i][j] = irandom(num_skin); found_gems_to_spawn = true}
		else break
	}
	return found_gems_to_spawn
}