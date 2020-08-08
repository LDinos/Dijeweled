/// @description Insert description here
// You can write your code in this editor
if o.index = 26
{
	var stati = custom_status
}
else
{
	var stati = o.AR_status[o.index,index]
}
if global.canbepressed && stati != 1
{	
	global.DIS_quest_category = o.index
	global.DIS_quest_incategory = index
	if o.index != 26 //if its not a custom challenge
	{
		global.challenge_index = string(o.index)+string(index)
		global.chl_to_unlock = string(o.index)+":"+string(index+1)
		global.chl_to_succeed = string(o.index)+":"+string(index)
		if (index == 5) global.chl_to_unlock = "none"
		global.canbepressed = false; 
		global.challenge_desc = o.AR_challenges[o.index,index]; 
		if o.index == 25 && index = 2 //this challenge cannot be made in custom editor
		{
			fade_to_room(rm_quest252)
		}
		else 
		{
			fade_to_room(rm_quest)
		}
	}
	else
	{	
		global.challenge_index = index
		var f = working_directory +"/CustomQuests/"+string(index)+".ini"
		if file_exists(f)
		{
			ini_open(f)
				global.creator = ini_read_string("General","creator","-")
			ini_close()
			global.canbepressed = false;	
			global.challenge_desc = custom_description; 
			fade_to_room(rm_quest_custom)
		}
		else
		{
			fade_to_room(rm_quest_editor)
		}
	}
}