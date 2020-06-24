make_gems_fallen(id)
summoves2 = 0
var skin;
var return_list = argument0
if return_list
{
	var list_returner = -1
}

//1) Make gemboard
for(var i=0;i<8;i++)
{
	for(var j=0;j<8;j++)
	{
		if gems_fallen[i,j] != noone
		{
			gemboard[i,j] = gems_fallen[i,j].skinnum
		}
		else
		{
			gemboard[i,j] = -1
		}
	}
}

//2) find matches
for(var i=0;i<7;i++) //0 - 6, last row cant be spinned.
{
	for(var j=0;j<7;j++) //0 - 6, last collumn cant be spinned.
	{
		if (gemboard[i,j] != -1 && gemboard[i+1,j] != -1 && gemboard[i,j+1] != -1 && gemboard[i+1,j+1] != -1)
		{
			/*
			skin						-> the top left gem of the spinner. If empty, take the nearest gem
			list_returner[summoves2, x] -> x = 0: i position, x = 1: j position, x = 2: Direction
			*/
			#region //1
			skin = gemboard[i+1,j]
			//if skin != -1
			//{
				if (j < 5)
				{
					if (skin == gemboard[i+1,j+2]) && (skin == gemboard[i+1,j+3])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //2
			skin = gemboard[i,j]
			if (j < 5)
			{
				if (skin == gemboard[i,j+2]) && (skin == gemboard[i,j+3])
				{
					if return_list
					{
						list_returner[summoves2,0] = i
						list_returner[summoves2,1] = j
						list_returner[summoves2,2] = "cw"
					}
					summoves2++
				}
			}
			#endregion
			#region //3
			skin = gemboard[i,j+1]
			//if skin != -1
			//{
				if (j > 1)
				{
					if (skin == gemboard[i,j-1]) && (skin == gemboard[i,j-2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //4
			skin = gemboard[i+1,j+1]
			//if skin != -1
			//{
				if (j > 1)
				{
					if (skin == gemboard[i+1,j-1]) && (skin == gemboard[i+1,j-2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			
			#region //5
			skin = gemboard[i,j]
			//if skin != -1 <-- already checked
			//{
				if (i < 5)
				{
					if (skin == gemboard[i+2,j]) && (skin == gemboard[i+3,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //6
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (i < 5)
				{
					if (skin == gemboard[i+2,j+1]) && (skin == gemboard[i+3,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //7
			skin = gemboard[i+1,j+1]
			//if skin != -1
			{
				if (i > 1)
				{
					if (skin == gemboard[i-1,j+1]) && (skin == gemboard[i-2,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //8
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i > 1)
				{
					if (skin == gemboard[i-1,j]) && (skin == gemboard[i-2,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			
			#region //9
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (j < 6)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i+1,j+2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //10
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (i > 0)
				{
					if (skin == gemboard[i,j+1]) && (skin == gemboard[i-1,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //11
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (j < 6)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i,j+2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //12
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i < 6)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i+2,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //13
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (j > 0)
				{
					if (skin == gemboard[i+1,j]) && (skin == gemboard[i+1,j-1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //14
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (i > 0)
				{
					if (skin == gemboard[i,j+1]) && (skin == gemboard[i-1,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //15
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (j > 0)
				{
					if (skin == gemboard[i+1,j]) && (skin == gemboard[i,j-1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //16
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i < 6)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i+2,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			
			#region //17
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (i > 1)
				{
					if (skin == gemboard[i-1,j+1]) && (skin == gemboard[i-2,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //18
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (i > 1)
				{
					if (skin == gemboard[i-1,j]) && (skin == gemboard[i-2,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //19
			skin = gemboard[i+1,j+1]
			//if skin != -1
			{
				if (i < 6)
				{
					if (skin == gemboard[i+1,j]) && (skin == gemboard[i+2,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //20
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i < 6)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i+2,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //21
			skin = gemboard[i+1,j+1]
			//if skin != -1
			{
				if (j < 5)
				{
					if (skin == gemboard[i,j+2]) && (skin == gemboard[i,j+3])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //22
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (j < 5)
				{
					if (skin == gemboard[i+1,j+2]) && (skin == gemboard[i+1,j+3])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //23
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (j > 1)
				{
					if (skin == gemboard[i+1,j-1]) && (skin == gemboard[i+1,j-2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //24
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (j > 1)
				{
					if (skin == gemboard[i,j-1]) && (skin == gemboard[i,j-2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			
			#region //25
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (i < 6)
				{
					if (skin == gemboard[i,j+1]) && (skin == gemboard[i+2,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //26
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (i < 6)
				{
					if (skin == gemboard[i,j+1]) && (skin == gemboard[i+2,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //27
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i > 0)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i-1,j])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //28
			skin = gemboard[i+1,j]
			//if skin != -1
			{
				if (i > 0)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i-1,j+1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //29
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (j < 6)
				{
					if (skin == gemboard[i+1,j]) && (skin == gemboard[i,j+2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //30
			skin = gemboard[i,j]
			//if skin != -1
			//{
				if (j < 6)
				{
					if (skin == gemboard[i+1,j]) && (skin == gemboard[i+1,j+2])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			//}
			#endregion
			#region //31
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (j > 0)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i,j-1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "ccw"
						}
						summoves2++
					}
				}
			}
			#endregion
			#region //32
			skin = gemboard[i,j+1]
			//if skin != -1
			{
				if (j > 0)
				{
					if (skin == gemboard[i+1,j+1]) && (skin == gemboard[i+1,j-1])
					{
						if return_list
						{
							list_returner[summoves2,0] = i
							list_returner[summoves2,1] = j
							list_returner[summoves2,2] = "cw"
						}
						summoves2++
					}
				}
			}
			#endregion
		}
	}
}

if return_list
{
	return list_returner;
}