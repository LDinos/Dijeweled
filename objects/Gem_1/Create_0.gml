#region My
	MyGem = Gem_1 //Instance variables so that copy pasting code through gems will be easier
	MyGamerule = Gamerule_1
	MyBoard = Board_1
	MyLightObj = lightningObj1
	MyLightKiller = lightningkiller
	MyPlayer = player1
	if (room == rm_blitz_matchreplay) MyPlayer = player1_matchreplay
	//else if room = rm_twist MyPlayer = obj_twist_spinner
	MyDiss = gem_dissappear
#endregion

EV_gem_CREATE()