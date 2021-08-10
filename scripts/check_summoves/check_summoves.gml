///@param return_list?
///@description Check the sum of possible moves that we can use to match gems. If it goes to 0, AHM will be activated
function check_summoves(argument0) {
	make_gems_fallen(id)
	summoves2 = 0
#region Variable settings
	var rows = global.board_rows;
	var skin;
	var return_list = argument0
	if return_list
	{
		var list_returner = -1
		var l_index = 0;
	}
	for(i=0;i<=rows-1;i++)
		{
			for(j=0;j<=7;j++)
			{
				if gems_fallen[i,j] != noone //&& instance_exists(gems_fallen[i,j])
				{
					if gems_fallen[i,j].amHype
					{
					#region Hypercube
						if (i > 0)
						{
							if gems_fallen[i-1,j] != noone
							{
								if return_list
								{
									i_gemtouse[summoves2] = i //the i position of the bot gem to use
									j_gemtouse[summoves2] = j // the j position of the bot gem to use
									dir_gemtouse[summoves2] = "up" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"		
									list_returner[l_index,0] = i_gemtouse[summoves2]
									list_returner[l_index,1] = j_gemtouse[summoves2]
									list_returner[l_index,2] = dir_gemtouse[summoves2]
									l_index++
								}
								summoves2++
							}
						}
						if (i < 7)
						{
							if gems_fallen[i+1,j] != noone
							{
								if return_list
								{
									i_gemtouse[summoves2] = i //the i position of the bot gem to use
									j_gemtouse[summoves2] = j // the j position of the bot gem to use
									dir_gemtouse[summoves2] = "down" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"		
									list_returner[l_index,0] = i_gemtouse[summoves2]
									list_returner[l_index,1] = j_gemtouse[summoves2]
									list_returner[l_index,2] = dir_gemtouse[summoves2]
									l_index++
								}
								summoves2++
							}
						}
						if (j < 7)
						{
							if gems_fallen[i,j+1] != noone
							{
								if return_list
								{
									i_gemtouse[summoves2] = i //the i position of the bot gem to use
									j_gemtouse[summoves2] = j // the j position of the bot gem to use
									dir_gemtouse[summoves2] = "right" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"		
									list_returner[l_index,0] = i_gemtouse[summoves2]
									list_returner[l_index,1] = j_gemtouse[summoves2]
									list_returner[l_index,2] = dir_gemtouse[summoves2]
									l_index++
								}
								summoves2++
							}
						}
						if (j > 0)
						{
							if gems_fallen[i,j-1] != noone
							{
								if return_list
								{
									i_gemtouse[summoves2] = i //the i position of the bot gem to use
									j_gemtouse[summoves2] = j // the j position of the bot gem to use
									dir_gemtouse[summoves2] = "left" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"		
									list_returner[l_index,0] = i_gemtouse[summoves2]
									list_returner[l_index,1] = j_gemtouse[summoves2]
									list_returner[l_index,2] = dir_gemtouse[summoves2]
									l_index++
								}	
								summoves2++
							}
						}
					#endregion
					}
					gemboard[i,j] = gems_fallen[i,j].skinnum
				}
				else
				{
					gemboard[i,j] = -1
				}
			}
		}

#endregion

#region SHAPE DRAWING
	//1 O - O
	//    Θ

	//2   Θ
	//  O - O  

	//3 O
	//  - Θ
	//  Ο

	//4   Ο
	//  Θ -
	//    Ο

	//5 Ο
	//  Ο
	//  - Θ

	//6  Ο
	//   Ο
	// Θ -

	//7  - Θ
	//   Ο
	//   O

	//8 Θ - 
	//    Ο
	//    O

	//9 - O O 
	//  Θ

	//10 Θ 
	//  - O O

	//11     Θ
	//  O O -

	//12 O O -
	//       Θ

	//13 Θ
	//   -
	//   Ο
	//   Ο

	//14 O
	//   O
	//   -
	//   Θ

	//15 O Ο - Θ

	//16 Θ - Ο Ο
#endregion

#region THE BIG SEX
	for(i=0;i<=7;i++)
	    {
	    for(j=0;j<=7;j++)
	        {   
	            //1
	            if (i >=1) && (j >= 1 && j <= board_xsize-2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            if gemboard[i-1,j-1] = gemboard[i-1,j+1] && (gemboard[i-1,j-1] >= 0 && gemboard[i-1,j-1] <=6)
	                {
	                    skin = gemboard[i-1,j-1]
	                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i //the i position of the bot gem to use
											j_gemtouse[summoves2] = j // the j position of the bot gem to use
											dir_gemtouse[summoves2] = "up" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										#region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
										
	                                    }
	                            }
	                        }
	                }
	            }
	            //2
	            if (i <=rows-2) && (j >= 1 && j <= board_xsize-2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            if gemboard[i+1,j-1] = gemboard[i+1,j+1] && (gemboard[i+1,j-1] >= 0 && gemboard[i+1,j-1] <=6)
	                {
	                    skin = gemboard[i+1,j-1]
	                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {                                     
											i_gemtouse[summoves2] = i //the i position of the bot gem to use
											j_gemtouse[summoves2] = j // the j position of the bot gem to use
											dir_gemtouse[summoves2] = "down" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										#region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
										}
	                            }
	                        }
	                }
	            }
	            //3
	            if (i >=1 && i <=rows-2) && (j >= 1)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            if gemboard[i-1,j-1] = gemboard[i+1,j-1] && (gemboard[i-1,j-1] >= 0 && gemboard[i-1,j-1] <=6)
	                {
	                    skin = gemboard[i-1,j-1]
	                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    { 
											i_gemtouse[summoves2] = i //the i position of the bot gem to use
											j_gemtouse[summoves2] = j // the j position of the bot gem to use
											dir_gemtouse[summoves2] = "left" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										#region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //4
	            if (i >=1 && i <=rows-2) && (j <= board_xsize-2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-1,j+1]
	            if skin = gemboard[i+1,j+1] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {        
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "right"
										#region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //5
	            if (i >=2) && (j >= 1)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-1,j-1]
	            if skin = gemboard[i-2,j-1] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "left"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //6
	            if (i >=2) && (j <= board_xsize-2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-1,j+1]
	            if skin = gemboard[i-2,j+1] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "right"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //7
	            if (i <=rows-3) && (j >= 1)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i+1,j-1]
	            if skin = gemboard[i+2,j-1] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "left"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //8
	            if (i <=rows-3) && (j <= board_xsize-2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i+1,j+1]
	            if skin = gemboard[i+2,j+1] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "right"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //9
	            if (i >=1) && (j <= board_xsize-3)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-1,j+1]
	            if skin = gemboard[i-1,j+2] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "up"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //10
	            if (i <=rows-2) && (j <= board_xsize-3)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i+1,j+1]
	            if skin = gemboard[i+1,j+2] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "down"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //11
	            if (i <=rows-2) && (j >= 2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i+1,j-1]
	            if skin = gemboard[i+1,j-2] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "down"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //12
	            if (i >= 1) && (j >= 2)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-1,j-1]
	            if skin = gemboard[i-1,j-2] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "up"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //13
	            if (i <= rows-4) && board_ysize > 3
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i+2,j]
	            if skin = gemboard[i+3,j] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "down"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //14
	            if (i >= 3)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i-2,j]
	            if skin = gemboard[i-3,j] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "up"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //15
	            if (j >= 3)
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i,j-2]
	            if skin = gemboard[i,j-3] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "left"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
	            //16
	            if (j <= board_xsize-4) && board_xsize > 3
	            {
	            //first check if the two other gems are the same (and not coal/void)
	            skin = gemboard[i,j+2]
	            if skin = gemboard[i,j+3] && (skin >= 0 && skin <=6)
	                {                    
	                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
	                        {
	                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
	                            {
	                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
	                                    {
											i_gemtouse[summoves2] = i 
											j_gemtouse[summoves2] = j 
											dir_gemtouse[summoves2] = "right"
                                        #region list add for bot
											if return_list
											{
												list_returner[l_index,0] = i_gemtouse[summoves2]
												list_returner[l_index,1] = j_gemtouse[summoves2]
												list_returner[l_index,2] = dir_gemtouse[summoves2]
												l_index++
											}
										#endregion
											summoves2++
	                                    }
	                            }
	                        }
	                }
	            }
            
	        }
	    }
#endregion

	if return_list
	{
		return list_returner;
	}


}
