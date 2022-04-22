/// @function script()
/// @description default
/// @param {type} param first parameter
function update_skin_array(Gamerule){
	with(Gamerule) {
		for(var i = 0; i < 8; i++) {
			for(var j = 0; j < 8 ; j++) {
				if (gems_id_fallen_array[i][j] != noone) {
					gems_skin_array[i][j] = gems_id_fallen_array[i][j].skinnum
				}
				else gems_id_fallen_array[i][j] = -1
			}
		}
	}
}