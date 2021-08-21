/// @description BOT
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
		var list_moves = check_summoves_twist(true)
	}
	if (list_moves == -1 && global.SET_gamemode == 0) //if no moves available and we are on time attack, make a random illegal one
	{
		list_moves[0,I] = irandom(6)
		list_moves[0,J] = irandom(6)
		list_moves[0,DIR] = choose("cw","ccw")
	}
	
	if list_moves != -1
	{	
		var list_height = array_height_2d(list_moves)-1
		show_debug_message(list_height+1)
		var INDEX = irandom(list_height)
		if (global.SET_gamemode == 1)
		{
			var list_moves_matchsorted = -1;
			for (var i = 0; i<array_height_2d(list_moves); i++)
			{
				list_moves_matchsorted[i] = do_virtual_match_twist(list_moves,i) //lets find the most important swap
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
			if (global.botdifficulty1 == 0) INDEX = findworst //if im easy make the worst move
			else if (global.botdifficulty1 == 1) INDEX = findmedium //if im medium make the decent move
			else if (global.botdifficulty1 == 2) INDEX = choose(findmedium,findbest) //if im hard, choose between decent and best
			else if (global.botdifficulty1 == 3) INDEX = findbest //if im expert, choose the best move
			show_debug_message(string(list_moves_matchsorted[findworst])+ "-" +string(list_moves_matchsorted[findmedium])+ "-" +string(list_moves_matchsorted[findbest]))
		}
		var itodo = list_moves[INDEX,I]
		var jtodo = list_moves[INDEX,J]

		xlimprevious = xlim
		ylimprevious = ylim
		xlim = jtodo
		ylim = itodo

		gem1 = MyGamerule.gem_board1[itodo,jtodo]
		if instance_exists(gem1)
		{
			var canmove;
			if (!Gamerule_local.lightOn && !Gamerule_local.moving && Gamerule_local.illegal_cando) canmove = true
			else canmove = false
		
			if !Gamerule_1.multiswap_allowed && !Gamerule_local.IsGemActive2 //Gamerule_1.moving
			{
				canmove = false
			}
			
			if canmove
			{
				var gems;
				gems[0] = Gamerule_local.gem_board1[itodo,jtodo]
				gems[1] = Gamerule_local.gem_board1[itodo,jtodo+1]
				gems[2] = Gamerule_local.gem_board1[itodo+1,jtodo+1]
				gems[3] = Gamerule_local.gem_board1[itodo+1,jtodo]
				var ready = true;			
				for(var i = 0; i<4;i++)
				{
					if (gems[i] == noone)
					{
						ready = false
						break;
					}
					else if gems[i].ammoving
					{
						ready = false
						break;
					}
					else if gems[i].acc != 0
					{
						ready = false
						break;
					}
					else if gems[i].amLocked > 0
					{
						ready = false
						break;
					}
				}
				if ready
				{
					with(obj_avalanchedeposit) ammoving = true
					with(obj_avalanchedeposit_local) ammoving = true
					Gamerule_local.moving = true
					gems[0].ammoving = true
					gems[1].ammoving = true
					gems[2].ammoving = true
					gems[3].ammoving = true
					var col = instance_create(gems[0].x-32,gems[0].y-32,obj_twist_collider_local)
					with(col)
					{
						for(var i = 0; i<4;i++)
						{
							gem[i] = gems[i]
							gemxxdef[i] = gems[i].x
							gemyydef[i] = gems[i].y
						}
						if list_moves[INDEX,DIR] == "cw"
						{
							gemxx[0] = gems[0].x + 64 //first gem going right
							gemyy[0] = gems[0].y
							gemxx[1] = gems[1].x	  //second gem going down
							gemyy[1] = gems[1].y  +64
							gemxx[2] = gems[2].x - 64 //third gem going left
							gemyy[2] = gems[2].y
							gemxx[3] = gems[3].x	  //fourth gem going up
							gemyy[3] = gems[3].y - 64
						}
						else
						{
							gemxx[0] = gems[0].x      //first gem going down
							gemyy[0] = gems[0].y + 64
							gemxx[1] = gems[1].x - 64 //second gem going left
							gemyy[1] = gems[1].y
							gemxx[2] = gems[2].x      //third gem going up
							gemyy[2] = gems[2].y - 64
							gemxx[3] = gems[3].x + 64  //fourth gem going right
							gemyy[3] = gems[3].y 
						}
					}
					with(Gamerule_local)
					{
					
						swap_happened = true
						alarm[9] = 1 
						combo = 0
						juststarted = false; 
						gemdestroyonemove =0; 
						reset_compliments()
					}				
				}
				mouse_yy_pos = gem1.y
				mouse_xx_pos = gem1.x
				we_matched = true
				Gamerule_local.IsGemActive2 = 0
			} //canmove end
		} //instance_exists end
	}
	else if (global.SET_gamemode == 1) //pass
	{
		we_matched = true
		with(obj_avalanche_pass) pass(Gamerule_local,obj_avalanchedeposit_local)
	}
	if (we_matched == false) alarm[1] = 1
}
else alarm[1] = 1