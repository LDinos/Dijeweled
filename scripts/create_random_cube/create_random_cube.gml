///@description if ahm fails or zenify concludes with no moves, its time to make a cube
function create_random_cube() {
	var gem_to_spawn = noone
	var wheretospawn = ds_list_create()
	var shalldoit = true //this variable will be false if the board has gaps for some reason, which means
						//that the board is not gemactive2
	for(var i=0;i<8;i++)
	{
		for(var j=0;j<8;j++)
		{
			var g = Gamerule_1.gem_board1[i,j]
			if instance_exists(g)
			{
				if (g.gempower = 0) && (!g.amInvisible) && g.amLocked == 0
				{
					if check_surrounding_gems(i,j) ds_list_add(wheretospawn,g)	
				}
			}
			else
			{
				shalldoit = false
			}
		}
	}
	
	ds_list_shuffle(wheretospawn)
	if !ds_list_empty(wheretospawn) gem_to_spawn = wheretospawn[| 0] 
	else {
		create_textellent("SOFTLOCK!") //...end the game
		game_over()
	}

	ds_list_destroy(wheretospawn)

	if shalldoit 
	{
		with(gem_to_spawn) {amHype = true; skinnum = 7; amLocked = 0}
	}


}

function check_surrounding_gem(g) {
	if instance_exists(g) {
			if (!g.amInvisible) && (g.amLocked == 0) return true;
		}
}

function check_surrounding_gems(i,j) {
	if (i > 0) {
		var g = Gamerule_1.gem_board1[i-1,j]
		if instance_exists(g) {
			if (!g.amInvisible) && (g.amLocked == 0) return true;
		}
	}
	if (j > 0) {
		var g = Gamerule_1.gem_board1[i,j-1]
		if instance_exists(g) {
			if (!g.amInvisible) && (g.amLocked == 0) return true;
		}
	}
	if (i < 7) {
		var g = Gamerule_1.gem_board1[i+1,j]
		if instance_exists(g) {
			if (!g.amInvisible) && (g.amLocked == 0) return true;
		}
	}
	if (j < 7) {
		var g = Gamerule_1.gem_board1[i,j+1]
		if instance_exists(g) {
			if (!g.amInvisible) && (g.amLocked == 0) return true;
		}
	}
	return false;
}