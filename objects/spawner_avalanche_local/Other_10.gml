/// @description Spawn gems in my board
with(Gamerule_local) check_gaps(Board_local,Gem_local)
obj_avalanchedeposit_local.spawn_invs = true

var initial_gaps = []
array_copy(initial_gaps,0,Gamerule_local.gaps,0,8)

do
{
	var finished = false
	var numgems = obj_avalanchedeposit_local.gems_to_send
	var gaps = []
	array_copy(gaps,0,Gamerule_local.gaps,0,8)
	var col_num_create = -1;
	for(var i =0; i <8; i++) col_num_create[i] = 0
	var board = Gamerule_local.gemboard
	var gemcount = instance_number(Gem_local)
	var gemstobesorted = 0
	var amready = true; //no matches done by default
	var amready2 = false //no moves found by default
	
	if numgems > 0 //More than 1 gem
	{
		#region More than 1 gem
		#region create all gems in the needed spots
			while (gemcount < 64 && numgems > 0)
			{
				var r = 0
				for(var i = 1; i<8; i++) //column indicator
				{
					if gaps[i] >= gaps[r]
					{
						r = i //best column found (with biggest hole)
					}
				}

				if gaps[r] > 0
				{
					if board[gaps[r]-1,r] != -1 show_message("not empty board changes skin lol")
					board[gaps[r]-1,r] = irandom(Gamerule_1.num_skin) //make a gem for that place with random skin
					col_num_create[r]++
					gaps[r]--
					gemcount++
					gemstobesorted++
					numgems--
				}
				//ds_list_clear(list)		
			}
		#endregion

	
		if gemstobesorted > 3 //if more than 3 gems spawned
		{
			#region Make them not match
	
			for (var i = 0; i<8; i++)
			{		
				for(var j = 0; j < 8; j++)
				{
					if (j > 0 && j < 7)
					{
						if (board[i,j] == board[i,j-1]) && (board[i,j] == board[i,j+1]) && (board[i,j] != -1) && (board[i,j] != 7)
						{
							amready = false; //we have a cascade :( REDO!
							break;
						}
					}
		
					if (i > 0 && i < 7)
					{
						if (board[i,j] == board[i-1,j]) && (board[i,j] == board[i+1,j]) && (board[i,j] != -1) && (board[i,j] != 7)
						{
							amready = false; //we have a cascade :( REDO!
							break;
						}
					}
				}
				if !amready break; //if we already made a match, get out of this loop
			}
			#endregion
	
			if amready //if we succesfully have no matches done by itself
			{
				#region Make sure we have moves to do
				for(var i = 0; i <8; i++)
				{			
					for(var j =0; j <8; j++)
					{
						//1
						if board[i,j] == 7 //hypercube
						{
							amready2 = true
							break;
						}
						else
						{
							if i > 2
							{
								if board[i,j] == board[i-2,j] && board[i,j] == board[i-3,j] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}				
							//2
							if i < 5
							{
								if board[i,j] == board[i+2,j] && board[i,j] == board[i+3,j] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}
							//3
							if j < 5
							{
								if board[i,j] == board[i,j+2] && board[i,j] == board[i,j+3] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}				
							//4
							if j > 2
							{
								if board[i,j] == board[i,j-2] && board[i,j] == board[i,j-3] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}				
							//5
							if (j < 7 && i < 7 && i > 0)
							{
								if board[i,j] == board[i-1,j+1] && board[i,j] == board[i+1,j+1] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}				
							//6
							if (j > 0 && i < 7 && i > 0)
							{
								if board[i,j] == board[i-1,j-1] && board[i,j] == board[i+1,j-1] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}				
							//7
							if (i > 0 && j < 7 && j > 0)
							{
								if board[i,j] == board[i-1,j-1] && board[i,j] == board[i-1,j+1] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}
							//8
							if (i < 7 && j < 7 && j > 0)
							{
								if board[i,j] == board[i+1,j-1] && board[i,j] == board[i+1,j+1] && board[i,j] != -1
								{
									amready2 = true //Yay! we have at least one move to do, we are done here
									break;
								}
							}
						}
					}
					if amready2 break;
				}
				#endregion
			}
		}
		else amready2 = true //no need to search for matches with less than 3 gems spawned.
	
		if (amready && amready2) finished = true
		#endregion
	}
	else
	{
		#region One gem only
		if gemcount < 64
			{
				var r = 0
				for(var i = 1; i<8; i++)
				{
					if gaps[i] >= gaps[r]
					{
						r = i
					}
				}

				if gaps[r] > 0
				{
					var s = irandom(Gamerule_1.num_skin)
					var stop = 0
					while(stop < 4)
					{
						stop = 0
						if r == 0
						{
							if s != board[gaps[r]-1,r+1] && s != board[gaps[r]-1,r+2] stop++
						}
						else
						{
							if r < 7
							{
								if (s != board[gaps[r]-1,r-1] && s!= board[gaps[r]-1,r+1]) stop++
							}
							else stop++
						}
						
						if r == 7
						{
							if s != board[gaps[r]-1,r-1] && s != board[gaps[r]-1,r-2] stop++
						}
						else
						{
							if r < 7
							{
								if (s != board[gaps[r]-1,r-1] || s!= board[gaps[r]-1,r+1]) stop++
							}
							else stop++
						}
						
						if gaps[r]-1 == 0
						{
							if s != board[gaps[r]-1+1,r] && s != board[gaps[r]-1+2,r] stop++
						}
						else
						{
							if gaps[r]-1 < 7
							{
								if (s != board[gaps[r]-1-1,r] && s!= board[gaps[r]-1+1,r]) stop++
							}
							else stop++
						}
						
						if gaps[r]-1 == 7
						{
							if s != board[gaps[r]-1-1,r] && s != board[gaps[r]-1-2,r] stop++
						}
						else
						{
							if gaps[r]-1 < 7
							{
								if (s != board[gaps[r]-1-1,r] || s!= board[gaps[r]-1+1,r]) stop++
							}
							else stop++
						}
						
						if stop < 4 s = irandom(Gamerule_1.num_skin)
					}
					if board[gaps[r]-1,r] != -1 show_message("not empty board changes skin lol")
					board[gaps[r]-1,r] = irandom(Gamerule_1.num_skin) //make a gem for that place with random skin
					col_num_create[r]++
					gaps[r]--
					gemcount++
					gemstobesorted++
					numgems--
					
				}	
			}
			finished = true
		#endregion
	}
}
until finished

obj_avalanchedeposit_local.gems_to_send = 1
obj_avalanchedeposit_local.hidden_gems = numgems



for(var j=0; j<8;j++)
{
	for(var i =0; i < col_num_create[j]; i++)
	{
		var g = instance_create(Board_local.x + j*64, Board_local.y - 64*(i+1), Gem_local)
		var sk = board[initial_gaps[j]-1,j]

		with(g)
		{
			set_skin(sk)
		}
		initial_gaps[j]--
	}
}
