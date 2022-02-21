///@description similar to delete_gem_lists, this one is used for a single instance. Do it with(gem).
function delete_gem() {
	//if (Gamerule_1.gems_id_array[_i][_j] == id) {
		Gamerule_1.gems_id_array[i_limit][_j] = noone
		Gamerule_1.gems_skin_array[i_limit][_j] = -1
		Gamerule_1.gems_ready--
	//}
	instance_destroy(id,false)
}
