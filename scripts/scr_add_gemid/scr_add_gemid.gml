///@param Gamerule
<<<<<<< HEAD
function scr_add_gemid(argument0) {
=======
function scr_add_gemid(gmrl) {
>>>>>>> 1.9
	if global.online
	{
		var i = 0;
		while( i < 64)
		{
<<<<<<< HEAD
			if argument0.GEM_ID[i] = -1
			{
				argument0.GEM_ID[i] = i
=======
			if gmrl.GEM_ID[i] = -1
			{
				gmrl.GEM_ID[i] = i
>>>>>>> 1.9
				myid = i
				break;
			}
			i++
		}
	}


}
