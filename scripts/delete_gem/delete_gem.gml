///@description similar to delete_gem_lists, this one is used for a single instance. Do it with(gem).
function delete_gem() {
	//if (Gamerule_1.gems_id_fallen_array[_i][_j] == id) {
		Gamerule_1.gems_id_fallen_array[i_limit][_j] = noone
		Gamerule_1.gems_skin_array[i_limit][_j] = -1
	//}
	instance_destroy(id,false)
}
