///@description similar to delete_gem_lists, this one is used for a single instance. Do it with(gem).
function delete_gem() {
<<<<<<< HEAD
	if (Gamerule_1.gem_board1[_i,_j] == id) Gamerule_1.gem_board1[_i,_j] =noone
=======
	if (Gamerule_1.gem_board1[_i][_j] == id) Gamerule_1.gem_board1[_i][_j] =noone
>>>>>>> 1.9
	var plzstop = false
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<8;j++)		
			{
<<<<<<< HEAD
				if (Gamerule_1.gems_fallen[@i,j] == id) 
				{
					plzstop = true; 
					Gamerule_1.gems_fallen[@i,j] = noone
					Gamerule_1.gemboard[@i,j] = -1
=======
				if (Gamerule_1.gems_fallen[i][j] == id) 
				{
					plzstop = true; 
					Gamerule_1.gems_fallen[i][j] = noone
					Gamerule_1.gemboard[i][j] = -1
>>>>>>> 1.9
				}
				if plzstop break;
			}
			if plzstop break;
		}
	instance_destroy(id,false)


}
