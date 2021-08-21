/// @description BOT SEARCH AND DO MATCH
var I = 0;
var J = 1;
var DIR = 2
var isready = MyGamerule.IsGemActive2
var we_matched = false//by default we think that we will not match the gems
if (global.botdifficulty1 == 3 && Gamerule_1.multiswap_allowed && global.SET_gamemode != 1) isready = true
if MyGamerule.controlallowed && isready
{
	//1) Search for matches
	with(MyGamerule)
	{
	var list_moves = check_summoves(true)
	}
	if list_moves != -1
	{
		var list_height = array_height_2d(list_moves)-1
		var INDEX = irandom(list_height)
		if (global.SET_gamemode == 1)
		{
			var list_moves_matchsorted = -1;
			for (var i = 0; i<array_height_2d(list_moves); i++)
			{
				list_moves_matchsorted[i] = do_virtual_match(list_moves,i) //lets find the most important swap
			}
			var findbest = 0;
			var findworst = 0;
			var findmedium = 0;
			for (var i = 1; i<array_height_2d(list_moves); i++)
			{
				if list_moves_matchsorted[i] > list_moves_matchsorted[findbest] {findbest = i}
				if list_moves_matchsorted[i] < list_moves_matchsorted[findworst] {findworst = i}
				if (list_moves_matchsorted[i] < list_moves_matchsorted[findbest]) && (list_moves_matchsorted[i] > list_moves_matchsorted[findworst])
				{
					findmedium = i
				}
			}
			if (global.botdifficulty1 == 0) INDEX = findworst //if im easy makes the worst move
			else if (global.botdifficulty1 == 1) INDEX = findmedium //if im medium makes the decent move
			else if (global.botdifficulty1 == 2) INDEX = choose(findmedium,findbest) //if im hard, choose between decent and best
			else if (global.botdifficulty1 == 3) INDEX = findbest //if im expert, choose the best move
			show_debug_message(string(list_moves_matchsorted[findworst])+ "-" +string(list_moves_matchsorted[findmedium])+ "-" +string(list_moves_matchsorted[findbest]))
		}
		var itodo = list_moves[INDEX,I]
		var jtodo = list_moves[INDEX,J]
		var dirtodo = list_moves[INDEX,DIR]
		var itomove = itodo
		var jtomove = jtodo
		switch dirtodo
		{
			case "up":
				itomove--
				break;
			case "down":
				itomove++
				break;
			case "left":
				jtomove--
				break;
			case "right":
				jtomove++
				break;
		}
		xlimprevious = xlim
		ylimprevious = ylim
		xlim = jtodo
		ylim = itodo

		gem1 = MyGamerule.gem_board1[itodo,jtodo]
		gem2 = MyGamerule.gem_board1[itomove,jtomove]
		if instance_exists(gem1) && instance_exists(gem2)
		{
			mouse_yy_pos = gem1.y
			mouse_xx_pos = gem1.x
			if (gem1._i == gem2._i && abs(gem1._j - gem2._j) == 1) || ((gem1._j == gem2._j) && abs(gem1._i - gem2._i) == 1)
			{
				if (gem1.acc = 0 && !gem1.ammoving && gem2.acc = 0 && !gem2.ammoving)
				{
					we_matched = true
					MyGamerule.IsGemActive2 = 0
					do_match(MyGamerule)
				}
			}
		}
	}
	else if (global.SET_gamemode == 1) //pass
	{
		we_matched = true
		with(obj_avalanche_pass) pass(Gamerule_local,obj_avalanchedeposit_local)
	}
	if (we_matched == false) alarm[0] = 1
}
else alarm[0] = 1