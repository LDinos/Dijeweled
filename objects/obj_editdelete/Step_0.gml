/// @description Insert description here
var amontop = position_meeting(mouse_x,mouse_y,id)
if amontop
{
	glow = true	
	if mouse_check_button_pressed(mb_left)
		{
			if image_index = 1 //delete
			{
				var f = program_directory +"/CustomQuests/"+string(index) + ".ini"
				file_delete(f)
				with(obj_challenges_selection) if (index = other.index)
				{
					custom_description = "Create Custom Quest"
					custom_status = 0
				}
				with(obj_editdelete) if (index = other.index) instance_destroy()
				
				/*#region make it default
				ini_open("challenges.ini") //unlock all custom challenges
					{
						var j = index
						ini_write_real("Info","26:"+string(j)+"-Status",0)
						ini_write_string("Challenges","26:"+string(j),"Create a Custom Quest")
						ini_write_string("Info","26:"+ string(j)+"-Matchless Moves","untick")
						ini_write_string("Info","26:"+ string(j)+"-Challenge Bonus","untick")
						ini_write_string("Info","26:"+ string(j)+"-Multiplier","untick")
						ini_write_string("Info","26:"+ string(j)+"-multiswap_allowed","untick")
						ini_write_string("Info","26:"+ string(j)+"-Hypercubes","untick")
						ini_write_string("Info","26:"+ string(j)+"-Bombs","untick")
						ini_write_string("Info","26:"+ string(j)+"-Dooms","untick")
						ini_write_string("Info","26:"+ string(j)+"-Skulls","untick")
						ini_write_string("Info","26:"+ string(j)+"-Locks","untick")
						ini_write_string("Info","26:"+ string(j)+"-Ice","untick")
						ini_write_string("Info","26:"+ string(j)+"-Coals","untick")
						ini_write_string("Info","26:"+ string(j)+"-Time","untick")
						ini_write_real("Info","26:"+ string(j)+"-Difficulty",0) //1-10
					}
			ini_close()
			#endregion*/
				//create_deledit(true)
				//delete
			}
			else
			{
				global.challenge_index = index
				room_goto(rm_quest_editor)
				//edit
			}
			mouse_clear(mb_left)
		}
		
	
}
else glow = false