<<<<<<< HEAD
function spawn_script(argument0, argument1) {
	/* Always have possible moves (AHM)! */

=======
function spawn_script(argument0, argument1, include_gem_creators) {
	/* Always have possible moves (AHM)! */
///param Gamerule
///param Gem
///param should options with gems that get freshly spawned be included in the decision?
>>>>>>> 1.9
#region SHAPE
	/*

	Use argument0.gemsfallen[i,j] or gemboard!
	We will divide the cases from minimum gapss first. Of course the single gaps can work on 2+ gapss aswell, etc.

	************ONE SPAWN***********************

		 |1|
	--SINGLE gaps-- (dont forget the O's gapss aswell, AND THEIR LIMITS!!)

		     X
	0) O O Δ			00
                           
	         Χ                       
	1) Ο Δ Ο            01              
                                  
		   Χ
	2) O Δ   O			02

	     X
	3) Ο   Δ O			03

	   x
	4)   O Δ Ο			04

	   Χ
	5)   Δ Ο Ο			05


		 |2|
	--2 gapsS-- (dont forget the O's gapss aswell!)

	       X
	0) O O				06
	   Δ Δ
   
	     Χ
	1) Ο   Ο
	   Δ   Δ			07
  
	   Χ
	2)   Ο Ο
	     Δ Δ			08


		 |3|
	--3 gapsS-- (dont forget the O's gapss aswell!)

	     Χ
	0) Ο				09
	   Ο
	   Δ

	   Χ
	1)  Ο				10
	    Ο
		Δ
	
		 |4|
	-- MINUS 6 gapsS-- (dont forget the O's gapss aswell!)
	   Χ          
	0)   Δ Δ			11
	   Δ Ο Ο

	     Χ
	1) Δ   Δ			12
	   Ο Δ Ο

	       Χ
	3) Δ Δ 
	   Ο Ο Δ			13
   
		 |5|
	-- MINUS 5 gapsS-- (dont forget the O's gapss aswell!)

	0) Χ		
	     Δ       
	   Δ Ο				14
	   Δ Ο         
               
	1)   Χ
	   Δ
	   Ο Δ				15
	   Ο Δ

	   Χ
	2)   Δ
	   Ο Δ				16
	   Δ Ο
  
	     Χ
	3) Δ
	   Δ Ο				17
	   Ο Δ

	   Χ
	4)   Ο
	     Δ				18
	   Δ Ο

	     Χ
	5) Ο
	   Δ				19
	   Ο Δ
   
	   	 |6|
	-- MINUS 4 gapsS-- (dont forget the O's gapss aswell!)

	1) Χ   2) Χ			20
   
	   Ο      Δ
	   Δ      Ο			21
	   Ο      Ο
 
	   	 |7|
	-- CHANGING CREATIONS-- (dont forget the O's gapss aswell!)

	1) X O       2) Ο Χ       3)   Χ Ο    4)   Ο Χ			22 23 24 25
	       Δ Ο          Δ Ο     Ο Δ         Ο Δ
   
		 |8|
	-- Cascade-- (dont forget the O's gapss aswell!)
	       X        X O		26	31
	1) O O		5)O 
							27	32
		 X          Ο Χ
	2) Ο   Ο    6)Ο			28	33

	   X          Χ Ο		29	34
	3)   Ο Ο    7)    Ο

	4)X         8)Ο Χ		30	35
	                  Ο
	  Ο
	  Ο
 
	***************************CREATE MORE THAN ONE SPAWNS (Θ)**************************************
	      Χ Θ     Θ
	1)O Δ		  X
				7)Δ
	              Ο
	    Χ   Θ     	
	2)Ο   Δ       Θ
				  Δ
				  Χ
				8)
	  X   Θ       Ο
	3)  Δ   Ο

	  Χ Θ 
	4)    Δ Ο

	  Χ     Θ
	5)  Ο Δ

	  Χ     Θ
	6)  Δ Ο
	*/
#endregion
	var nextspawn = noone
	var newg = noone
	ds_list_clear(num_choices) //number of choices reset
	var gaps;
	for(i=0;i<=7;i++)
	{
<<<<<<< HEAD
		gaps[i] = argument0.gaps[@i]
=======
		gaps[i] = argument0.gaps[i]
>>>>>>> 1.9
	}

	havedone = false

	//--------------------1--------------------\\
	//0

	{
		if j>=3 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j-2]
			g2 = argument0.gemboard[@gaps[@j]-1,j-3]
=======
			g1 = argument0.gemboard[gaps[j]-1,j-2]
			g2 = argument0.gemboard[gaps[j]-1,j-3]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,0)
				havedone = true; 
			}
		}
	}

	//1

	{
		if j>=3 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j-1]
			g2 = argument0.gemboard[@gaps[@j]-1,j-3]
=======
			g1 = argument0.gemboard[gaps[j]-1,j-1]
			g2 = argument0.gemboard[gaps[j]-1,j-3]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,1)
				havedone = true; 
			}
		}
	}

	//2

	{
		if j>=2 && j<=6 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j-2]
			g2 = argument0.gemboard[@gaps[@j]-1,j+1]
=======
			g1 = argument0.gemboard[gaps[j]-1,j-2]
			g2 = argument0.gemboard[gaps[j]-1,j+1]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,2)
				havedone = true; 
			}
		}
	}

	//3

	{
		if j>=1 && j<=5 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j-1]
			g2 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
			g1 = argument0.gemboard[gaps[j]-1,j-1]
			g2 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,3)
				havedone = true; 
			}
		}
	}

	//4

	{
		if j<=4 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j+1]
			g2 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
			g1 = argument0.gemboard[gaps[j]-1,j+1]
			g2 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,4)
				havedone = true; 
			}
		}
	}

	//5

	{
		if j<=4 //have space to check back
		{
<<<<<<< HEAD
			g1 = argument0.gemboard[@gaps[@j]-1,j+2]
			g2 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
			g1 = argument0.gemboard[gaps[j]-1,j+2]
			g2 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,5)
				havedone = true; 
			}
		}
	}

	//--------------------2--------------------\\

	//0
<<<<<<< HEAD
	 if gaps[@j] >= 2 && j>=2
	{
		g1 = argument0.gemboard[@gaps[@j]-2,j-1]
		g2 = argument0.gemboard[@gaps[@j]-2,j-2]
=======
	 if gaps[j] >= 2 && j>=2
	{
		g1 = argument0.gemboard[gaps[j]-2,j-1]
		g2 = argument0.gemboard[gaps[j]-2,j-2]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,12)
				havedone = true; 
			}
	}

	//1
<<<<<<< HEAD
	 if gaps[@j] >= 2 && j>=1 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j]-2,j-1]
		g2 = argument0.gemboard[@gaps[@j]-2,j+1]
=======
	 if gaps[j] >= 2 && j>=1 && j<=6
	{
		g1 = argument0.gemboard[gaps[j]-2,j-1]
		g2 = argument0.gemboard[gaps[j]-2,j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,13)
				havedone = true; 
			}
	}

	//2
<<<<<<< HEAD
	 if gaps[@j] >= 2 && j<=5
	{
		g1 = argument0.gemboard[@gaps[@j]-2,j+1]
		g2 = argument0.gemboard[@gaps[@j]-2,j+2]
=======
	 if gaps[j] >= 2 && j<=5
	{
		g1 = argument0.gemboard[gaps[j]-2,j+1]
		g2 = argument0.gemboard[gaps[j]-2,j+2]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,14)
				havedone = true; 
			}
	}

	//--------------------3--------------------\\

	//0
<<<<<<< HEAD
	 if gaps[@j] >= 3 && j>=1
	{
		g1 = argument0.gemboard[@gaps[@j]-3,j-1]
		g2 = argument0.gemboard[@gaps[@j]-2,j-1]
=======
	 if gaps[j] >= 3 && j>=1
	{
		g1 = argument0.gemboard[gaps[j]-3,j-1]
		g2 = argument0.gemboard[gaps[j]-2,j-1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,15)
				havedone = true; 
			}
	}

	//1
<<<<<<< HEAD
	 if gaps[@j] >= 3 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j]-3,j+1]
		g2 = argument0.gemboard[@gaps[@j]-2,j+1]
=======
	 if gaps[j] >= 3 && j<=6
	{
		g1 = argument0.gemboard[gaps[j]-3,j+1]
		g2 = argument0.gemboard[gaps[j]-2,j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,16)
				havedone = true; 
			}
	}

	//--------------------4--------------------\\

	//0
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-1 && j<=5
	{
		g1 = argument0.gemboard[@gaps[@j],j+1]
		g2 = argument0.gemboard[@gaps[@j],j+2]
=======
	 if gaps[j] <= global.board_rows-1 && j<=5
	{
		g1 = argument0.gemboard[gaps[j],j+1]
		g2 = argument0.gemboard[gaps[j],j+2]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,17)
				havedone = true; 
			}
	}

	//1
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-1 && j>=1 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j],j-1]
		g2 = argument0.gemboard[@gaps[@j],j+1]
=======
	 if gaps[j] <= global.board_rows-1 && j>=1 && j<=6
	{
		g1 = argument0.gemboard[gaps[j],j-1]
		g2 = argument0.gemboard[gaps[j],j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,18)
				havedone = true; 
			}
	}

	//2
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-1 && j>=2
	{
		g1 = argument0.gemboard[@gaps[@j],j-1]
		g2 = argument0.gemboard[@gaps[@j],j-2]
=======
	 if gaps[j] <= global.board_rows-1 && j>=2
	{
		g1 = argument0.gemboard[gaps[j],j-1]
		g2 = argument0.gemboard[gaps[j],j-2]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,19)
				havedone = true; 
			}
	}

	//--------------------5--------------------\\

	//0
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-2 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j],j+1]
		g2 = argument0.gemboard[@gaps[@j]+1,j+1]
=======
	 if gaps[j] <= global.board_rows-2 && j<=6
	{
		g1 = argument0.gemboard[gaps[j],j+1]
		g2 = argument0.gemboard[gaps[j]+1,j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,20)
				havedone = true; 
			}
	}

	//1
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-2 && j>=1
	{
		g1 = argument0.gemboard[@gaps[@j],j-1]
		g2 = argument0.gemboard[@gaps[@j]+1,j-1]
=======
	 if gaps[j] <= global.board_rows-2 && j>=1
	{
		g1 = argument0.gemboard[gaps[j],j-1]
		g2 = argument0.gemboard[gaps[j]+1,j-1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,21)
				havedone = true; 
			}
	}

	//2
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-2 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j],j]
		g2 = argument0.gemboard[@gaps[@j]+1,j+1]
=======
	 if gaps[j] <= global.board_rows-2 && j<=6
	{
		g1 = argument0.gemboard[gaps[j],j]
		g2 = argument0.gemboard[gaps[j]+1,j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,22)
				havedone = true; 
			}
	}

	//3
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-2 && j>=1
	{
		g1 = argument0.gemboard[@gaps[@j],j]
		g2 = argument0.gemboard[@gaps[@j]+1,j-1]
=======
	 if gaps[j] <= global.board_rows-2 && j>=1
	{
		g1 = argument0.gemboard[gaps[j],j]
		g2 = argument0.gemboard[gaps[j]+1,j-1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,23)
				havedone = true; 
			}
	}

	//4
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-1 && gaps[@j] >= 2 && j<=6
	{
		g1 = argument0.gemboard[@gaps[@j]-2,j+1]
		g2 = argument0.gemboard[@gaps[@j],j+1]
=======
	 if gaps[j] <= global.board_rows-1 && gaps[j] >= 2 && j<=6
	{
		g1 = argument0.gemboard[gaps[j]-2,j+1]
		g2 = argument0.gemboard[gaps[j],j+1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,24)
				havedone = true; 
			}
	}

	//5
<<<<<<< HEAD
	 if gaps[@j] <= global.board_rows-1 && gaps[@j] >= 2 && j>=1
	{
		g1 = argument0.gemboard[@gaps[@j]-2,j-1]
		g2 = argument0.gemboard[@gaps[@j],j-1]
=======
	 if gaps[j] <= global.board_rows-1 && gaps[j] >= 2 && j>=1
	{
		g1 = argument0.gemboard[gaps[j]-2,j-1]
		g2 = argument0.gemboard[gaps[j],j-1]
>>>>>>> 1.9
		if (g1 == g2) && (g2 != -1) && (g1 != 7)
			{	
				//with(Gem_create) set_skin(other.g1)
				ds_list_add(num_choices,25)
				havedone = true; 
			}
	}

	//--------------------6--------------------\\


		//1
<<<<<<< HEAD
		 if gaps[@j] <= global.board_rows-4
		{		
			g1 = argument0.gemboard[@gaps[@j],j]
			g2 = argument0.gemboard[@gaps[@j]+2,j]
=======
		 if gaps[j] <= global.board_rows-4
		{		
			g1 = argument0.gemboard[gaps[j],j]
			g2 = argument0.gemboard[gaps[j]+2,j]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,26)
					havedone = true; 
				}
		}
	
		//2
<<<<<<< HEAD
		 if gaps[@j] <= global.board_rows-4
		{		
			g1 = argument0.gemboard[@gaps[@j]+1,j]
			g2 = argument0.gemboard[@gaps[@j]+2,j]
=======
		 if gaps[j] <= global.board_rows-4
		{		
			g1 = argument0.gemboard[gaps[j]+1,j]
			g2 = argument0.gemboard[gaps[j]+2,j]
>>>>>>> 1.9
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,27)
					havedone = true; 
				}
		}
	//--------------------7--------------------\\
	if j <= 4
	{
<<<<<<< HEAD
		if (gaps[@j] == gaps[@j+1]) && (gaps[@j] == gaps[@j+3])
=======
		if (gaps[j] == gaps[j+1]) && (gaps[j] == gaps[j+3])
>>>>>>> 1.9
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				if g1 != -1 && (g1 != 7)
				{
					ds_list_add(num_choices,32)
					havedone = true;
				}
			}
		}
	}

	if (j>=1 && j<=5)
	{
<<<<<<< HEAD
		if (gaps[@j] == gaps[@j-1]) && (gaps[@j] == gaps[@j+2])
=======
		if (gaps[j] == gaps[j-1]) && (gaps[j] == gaps[j+2])
>>>>>>> 1.9
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				if g1 != -1 && (g1 != 7)
				{
					ds_list_add(num_choices,33)
					havedone = true;
				}
			}
		}
	}

	if (j>=2 && j<=6)
	{
<<<<<<< HEAD
		if (gaps[@j] == gaps[@j-2]) && (gaps[@j] == gaps[@j+1])
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
				if g1 != -1 && (g1 != 7)
				{
				ds_list_add(num_choices,34)
				havedone = true;
				}
			}
		}
	}

	if (j>=3)
	{
		if (gaps[@j] == gaps[@j-3]) && (gaps[@j] == gaps[@j-1])
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-3]
				if g1 != -1 && (g1 != 7)
				{
				ds_list_add(num_choices,35)
				havedone = true;
				}
			}
		}
	}
	
	//--------------------8--------------------\\
	if !havedone
	{
		//1
		 if j >= 2
		{		
			g1 = argument0.gemboard[@gaps[@j]-1,j-1]
			g2 = argument0.gemboard[@gaps[@j]-1,j-2]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,28)
					havedone = true; 
				}
		}
	
		//2
		 if j >= 1 && j <= 6
		{		
			g1 = argument0.gemboard[@gaps[@j]-1,j-1]
			g2 = argument0.gemboard[@gaps[@j]-1,j+1]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,29)
					havedone = true; 
				}
		}
	
		//3
		 if j <= 5
		{		
			g1 = argument0.gemboard[@gaps[@j]-1,j+2]
			g2 = argument0.gemboard[@gaps[@j]-1,j+1]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,30)
					havedone = true; 
				}
		}
	
		//4
		 if gaps[@j] <= global.board_rows-2
		{		
			g1 = argument0.gemboard[@gaps[@j],j]
			g2 = argument0.gemboard[@gaps[@j]+1,j]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,31)
					havedone = true; 
				}
		}
	
		//5
		if j >= 1
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
				if (g1 != -1) && (gaps[@j+1] == gaps[@j]) && (g1 != 7)
				{
					ds_list_add(num_choices,36)
					havedone = true; 
				}
			}
		}
	
		//6
		if j >= 2
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
				if (g1 != -1) && (gaps[@j-1] == gaps[@j]) && (g1 != 7)
				{
					ds_list_add(num_choices,37)
					havedone = true; 
				}
			}
		}
	
		//7
		if j <= 5
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
				if (g1 != -1) && (gaps[@j+1] == gaps[@j]) && (g1 != 7)
				{
					ds_list_add(num_choices,38)
					havedone = true; 
				}
			}
		}
	
		//8
		if j <= 6
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
				if (g1 != -1) && (gaps[@j-1] == gaps[@j]) && (g1 != 7)
				{
					ds_list_add(num_choices,39)
					havedone = true; 
=======
		if (gaps[j] == gaps[j-2]) && (gaps[j] == gaps[j+1])
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j-2]
				if g1 != -1 && (g1 != 7)
				{
				ds_list_add(num_choices,34)
				havedone = true;
>>>>>>> 1.9
				}
			}
		}
	}

<<<<<<< HEAD

	/*--------------------9------------------------*/
	//1
	{
		if j>=2 && j<=6 //have space to check back
		{
			if gaps[@j] == gaps[@j+1]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,40)
					havedone = true; 
=======
	if (j>=3)
	{
		if (gaps[j] == gaps[j-3]) && (gaps[j] == gaps[j-1])
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j-3]
				if g1 != -1 && (g1 != 7)
				{
				ds_list_add(num_choices,35)
				havedone = true;
>>>>>>> 1.9
				}
			}
		}
	}
<<<<<<< HEAD

	//2

	{
		if j>=1 && j<=5 //have space to check back
		{
			if gaps[@j] == gaps[@j+2]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 128,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,41)
=======
	
	//--------------------8--------------------\\
	if !havedone
	{
		//1
		 if j >= 2
		{		
			g1 = argument0.gemboard[gaps[j]-1,j-1]
			g2 = argument0.gemboard[gaps[j]-1,j-2]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,28)
					havedone = true; 
				}
		}
	
		//2
		 if j >= 1 && j <= 6
		{		
			g1 = argument0.gemboard[gaps[j]-1,j-1]
			g2 = argument0.gemboard[gaps[j]-1,j+1]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,29)
					havedone = true; 
				}
		}
	
		//3
		 if j <= 5
		{		
			g1 = argument0.gemboard[gaps[j]-1,j+2]
			g2 = argument0.gemboard[gaps[j]-1,j+1]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,30)
					havedone = true; 
				}
		}
	
		//4
		 if gaps[j] <= global.board_rows-2
		{		
			g1 = argument0.gemboard[gaps[j],j]
			g2 = argument0.gemboard[gaps[j]+1,j]
			if (g1 == g2) && (g2 != -1) && (g1 != 7)
				{	
					//with(Gem_create) set_skin(other.g1)
					ds_list_add(num_choices,31)
					havedone = true; 
				}
		}
	
		//5
		if j >= 1
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j-1]
				if (g1 != -1) && (gaps[j+1] == gaps[j]) && (g1 != 7)
				{
					ds_list_add(num_choices,36)
					havedone = true; 
				}
			}
		}
	
		//6
		if j >= 2
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j-2]
				if (g1 != -1) && (gaps[j-1] == gaps[j]) && (g1 != 7)
				{
					ds_list_add(num_choices,37)
					havedone = true; 
				}
			}
		}
	
		//7
		if j <= 5
		{
			nextspawn = instance_position(Gem_create.x+64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j+2]
				if (g1 != -1) && (gaps[j+1] == gaps[j]) && (g1 != 7)
				{
					ds_list_add(num_choices,38)
					havedone = true; 
				}
			}
		}
	
		//8
		if j <= 6
		{
			nextspawn = instance_position(Gem_create.x-64,y,argument1)
			if nextspawn != noone
			{
				g1 = argument0.gemboard[gaps[j]-1,j+1]
				if (g1 != -1) && (gaps[j-1] == gaps[j]) && (g1 != 7)
				{
					ds_list_add(num_choices,39)
>>>>>>> 1.9
					havedone = true; 
				}
			}
		}
	}

	//3

<<<<<<< HEAD
	{
		if j<=4 //have space to check back
		{
			if gaps[@j] == gaps[@j+2]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 128,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,42)
					havedone = true; 
=======
	/*--------------------9------------------------*/
	//1
	{
		if j>=2 && j<=6 //have space to check back
		{
			if gaps[j] == gaps[j+1]
			{
				g1 = argument0.gemboard[gaps[j]-1,j-2]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,40)
					havedone = true; 
					}
>>>>>>> 1.9
				}
			}
		}
	}

<<<<<<< HEAD
	//4

	{
		if j<=4 //have space to check back
		{
			if gaps[@j] == gaps[@j+1]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,43)
					havedone = true; 
=======
	//2

	{
		if j>=1 && j<=5 //have space to check back
		{
			if gaps[j] == gaps[j+2]
			{
				g1 = argument0.gemboard[gaps[j]-1,j-1]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 128,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,41)
					havedone = true; 
					}
>>>>>>> 1.9
				}
			}
		}
	}

<<<<<<< HEAD
	//5
=======
	//3
>>>>>>> 1.9

	{
		if j<=4 //have space to check back
		{
<<<<<<< HEAD
			if gaps[@j] == gaps[@j+3]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64*3,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,44)
					havedone = true; 
=======
			if gaps[j] == gaps[j+2]
			{
				g1 = argument0.gemboard[gaps[j]-1,j+3]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 128,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,42)
					havedone = true; 
					}
>>>>>>> 1.9
				}
			}
		}
	}

<<<<<<< HEAD
	//6
=======
	//4
>>>>>>> 1.9

	{
		if j<=4 //have space to check back
		{
<<<<<<< HEAD
			if gaps[@j] == gaps[@j+3]
			{
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64*3,Gem_create.y,argument1) = noone
				{
					//with(Gem_create) set_skin(other.g1)
					//newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
					//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
					ds_list_add(num_choices,45)
					havedone = true; 
=======
			if gaps[j] == gaps[j+1]
			{
				g1 = argument0.gemboard[gaps[j]-1,j+3]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,43)
					havedone = true; 
					}
>>>>>>> 1.9
				}
			}
		}
	}

<<<<<<< HEAD
	//7

	{
		if gaps[@j] >= 2 && gaps[@j] <= global.board_rows - 3 //have space to check back
		{
			g1 = argument0.gemboard[@gaps[@j]+1,j]
			if (g1 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				//newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
				ds_list_add(num_choices,46)
				havedone = true; 
=======
	//5

	{
		if j<=4 //have space to check back
		{
			if gaps[j] == gaps[j+3]
			{
				g1 = argument0.gemboard[gaps[j]-1,j+1]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64*3,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,44)
					havedone = true; 
					}
				}
>>>>>>> 1.9
			}
		}
	}

<<<<<<< HEAD
	//8
	{
		if gaps[@j] >= 3 && gaps[@j] <= global.board_rows - 2 //have space to check back
		{
			g1 = argument0.gemboard[@gaps[@j],j]
			if (g1 != -1) && (g1 != 7)
			{
				//with(Gem_create) set_skin(other.g1)
				//newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				//with(newg) {set_skin(other.g1); acc = other.Gem_create.acc}
				ds_list_add(num_choices,47)
				havedone = true; 
			}
		}
	}
	//Now make a random selection
	if !ds_list_empty(num_choices)
	{
		var sel = irandom(ds_list_size(num_choices)-1)
		showme = "case " + string(num_choices[|sel]) + " from col" + string(j) +"\nchoices: " + string(ds_list_size(num_choices))
		if Gamerule_1.debug show_debug_message(showme)
		switch num_choices[|sel]
		{
			case 0:
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
	//6

	{
		if j<=4 //have space to check back
		{
			if gaps[j] == gaps[j+3]
			{
				g1 = argument0.gemboard[gaps[j]-1,j+2]
				if (g1 != -1) && (g1 != 7) && instance_position(Gem_create.x + 64*3,Gem_create.y,argument1) = noone
				{
					if (include_gem_creators)
					{
					ds_list_add(num_choices,45)
					havedone = true; 
					}
				}
			}
		}
	}

	//7

	{
		if gaps[j] >= 2 && gaps[j] <= global.board_rows - 3 //have space to check back
		{
			g1 = argument0.gemboard[gaps[j]+1,j]
			if (g1 != -1) && (g1 != 7)
			{
				if (include_gem_creators)
				{
				ds_list_add(num_choices,46)
				havedone = true; 
				}
			}
		}
	}

	//8
	{
		if gaps[j] >= 3 && gaps[j] <= global.board_rows - 2 //have space to check back
		{
			g1 = argument0.gemboard[gaps[j],j]
			if (g1 != -1) && (g1 != 7)
			{
				if (include_gem_creators)
				{
				ds_list_add(num_choices,47)
				havedone = true; 
				}
			}
		}
	}
	//Now make a random selection
	if !ds_list_empty(num_choices)
	{
		var sel = irandom(ds_list_size(num_choices)-1)
		showme = "case " + string(num_choices[|sel]) + " from col" + string(j) +"\nchoices: " + string(ds_list_size(num_choices))
		if Gamerule_1.debug show_debug_message(showme)
		switch num_choices[|sel]
		{
			case 0:
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 1:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 2:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 3:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 4:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 5:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 6:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 7:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+2, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 8:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+2, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 9:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 10:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+3, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 11:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
				newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.Gem_create.acc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+3, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 12:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-2,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-2,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 13:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-2,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-2,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 14:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-2,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-2,j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 15:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-3,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-3,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 16:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-3,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-3,j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 17:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j+1]
=======
				g1 = argument0.gemboard[gaps[j],j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 18:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j-1]
=======
				g1 = argument0.gemboard[gaps[j],j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 19:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j-1]
=======
				g1 = argument0.gemboard[gaps[j],j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 20:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j+1]
=======
				g1 = argument0.gemboard[gaps[j],j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 21:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j-1]
=======
				g1 = argument0.gemboard[gaps[j],j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;	
			case 22:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j]
=======
				g1 = argument0.gemboard[gaps[j],j]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 23:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j]
=======
				g1 = argument0.gemboard[gaps[j],j]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 24:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-2,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-2,j+1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 25:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-2,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-2,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 26:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j]
=======
				g1 = argument0.gemboard[gaps[j],j]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 27:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]+1,j]
=======
				g1 = argument0.gemboard[gaps[j]+1,j]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 28:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 29:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 30:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 31:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j]
=======
				g1 = argument0.gemboard[gaps[j],j]
>>>>>>> 1.9
				with(Gem_create) set_skin(other.g1)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 32:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x+64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 33:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x-64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j-1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 34:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x+64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 35:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-3]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x-64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j-1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 36:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x+64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 37:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x-64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j-1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 38:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x+64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 39:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+1]
>>>>>>> 1.9
				nextspawn = instance_position(Gem_create.x-64,y,argument1)
				with(Gem_create) set_skin(other.g1)
				with(nextspawn) set_skin(other.g1)
				//REPLAY SETTINGS REFESH\\
				replay_script(j-1, nextspawn,false)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,nextspawn.myid)
						buffer_write(buffer,buffer_u8,nextspawn.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 40:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-2]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, newg,true)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				//--------------------\\
				break;
			case 41:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j-1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j-1]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+2, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 42:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 128, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+2, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 43:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+3]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+3]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 64, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+1, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 44:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+1]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+1]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+3, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 45:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]-1,j+2]
=======
				g1 = argument0.gemboard[gaps[j]-1,j+2]
>>>>>>> 1.9
				newg = instance_create(Gem_create.x + 64*3, Gem_create.y,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1); set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j+3, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 46:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j]+1,j]
				if Gamerule_1.debug show_debug_message(gaps[@j])
=======
				g1 = argument0.gemboard[gaps[j]+1,j]
				if Gamerule_1.debug show_debug_message(gaps[j])
>>>>>>> 1.9
				newg = instance_create(Gem_create.x, Gem_create.y-64,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(newg) {scr_add_gemid(Gamerule_1); set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				replay_script(j, newg,true)
				//--------------------\\
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				break;
			case 47:
<<<<<<< HEAD
				g1 = argument0.gemboard[@gaps[@j],j]
				if Gamerule_1.debug show_debug_message(gaps[@j])
=======
				g1 = argument0.gemboard[gaps[j],j]
				if Gamerule_1.debug show_debug_message(gaps[j])
>>>>>>> 1.9
				randg = instance_create(Gem_create.x, Gem_create.y-64,argument1)
				newg = instance_create(Gem_create.x, Gem_create.y-128,argument1)
				newacc = Gem_create.acc
				with(Gem_create) set_skin(other.g1)
				with(randg) {scr_add_gemid(Gamerule_1);acc = other.newacc}
				with(newg) {scr_add_gemid(Gamerule_1);set_skin(other.g1); acc = other.newacc}
				//REPLAY SETTINGS REFESH\\
				//replay_script(j, randg,true)
			#region online
				if global.online
				{
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,other.randg._i)
						buffer_write(buffer,buffer_u8,other.randg._j)
						buffer_write(buffer,buffer_u8,other.randg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SPAWN)
						buffer_write(buffer,buffer_s8,newg._i)
						buffer_write(buffer,buffer_u8,newg._j)
						buffer_write(buffer,buffer_u8,newg.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_AHM_SETSKIN)
						buffer_write(buffer,buffer_u8,other.Gem_create.myid)
						buffer_write(buffer,buffer_u8,other.Gem_create.skinnum)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}
				}
			#endregion
				replay_script(j, newg,true)
				replay_script(j, randg,true)
				//--------------------\\
				break;
		}
	}
	else showme = -1
<<<<<<< HEAD

	//if havedone argument0.future_summoves++

=======

	//if havedone argument0.future_summoves++

>>>>>>> 1.9

}
