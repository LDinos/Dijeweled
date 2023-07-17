/// @description GemActive
// You can write your code in this editor
if isQuest with(obj_quest_control) {event_user(4)}
for(i=0;i<ds_list_size(list_of_ampowered);i++)
{
	with(list_of_ampowered[| i] ) amPowered = false
}
ds_list_clear(list_of_ampowered)

if doonce == 0 
{
	#region do hidden gem
	var l = ds_list_size(list_of_hiddengems)
	for(var i = 0; i<l; i++)
	{
		with(list_of_hiddengems[| i]) delete_gem()
	}
	
	var l = ds_list_size(list_of_ice_locks)
	for(var i = 0; i<l; i++)
	{
		with(list_of_ice_locks[| i]) ice_create_hiddengems()
	}
	#endregion
	#region AUTOSAVE
	if autosave_allowed && Gamestart
	{
		if !autosave 
		{
		
			if !isReplay && !zenify scr_autosave()
			autosave = true
		}
	}
	#endregion
	//show_message("I am gemactive")
	if !zenify matcher_stepevent(Gem_1);	
	#region do hidden gem (again)
	/*var l = ds_list_size(list_of_hiddengems)
	for(var i = 0; i<l; i++)
	{
		with(list_of_hiddengems[| i]) delete_gem()
	}
	
	var l = ds_list_size(list_of_ice_locks)
	for(var i = 0; i<l; i++)
	{
		with(list_of_ice_locks[| i]) ice_create_hiddengems()
	}*/
	#endregion
}
doonce = 1
IsGemActive = true
future_summoves = 0



if bombis0
{
	var setitback = true
	if list_of_doom != noone
	{
		if list_of_doom.countdown = 0 setitback = false
	}
	for(var i = 0; i < ds_list_size(list_of_bombs); i++)
	{
		if list_of_bombs[| i].countdown = 0 setitback = false
	}
	if setitback bombis0 = false
}

with(spawner1) havedone = false
with(spawner_avalanche) havedone = false
timegemcooldown = false
if (alarm[1] = -1 && !IsGemActive2) alarm[1] = 2
