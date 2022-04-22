/// @function script()
/// @description default
/// @param {type} param first parameter
function check_for_ice_gems(){
	for(var j = 0; j < 8; j++) {
		for(var i = 0; i < 8; i++) {
			var g = gems_id_fallen_array[i][j]
			if (g != noone) {
				if (g.amLocked == 3) {
					for(var k = i+1; k < 8; k++) {
						if (gems_id_fallen_array[k][j] == noone) {
							var invg = instance_create_depth(Board_1.x + 64*j, Board_1.y + 64*k, -1, Gem_1)
							Gamerule_1.gems_id_fallen_array[k][j] = invg
							Gamerule_1.gems_skin_array[k][j] = 7
							Gamerule_1.gems_ready++
							ds_list_add(list_of_hiddengems, invg)
							with(invg)
							{
								i_limit = k
								amInvisible = true
								set_skin(7)
							}
						}
						else break;
					}
				}
			}
		}
	}

}

function destroy_hidden_gems() {
	var l = ds_list_size(list_of_hiddengems)
	for(var i = 0; i<l; i++)
	{
		with(list_of_hiddengems[| i]) delete_gem()
	}
	ds_list_clear(list_of_hiddengems)
	return i > 0
}