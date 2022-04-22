/// @description GemActive
// When we are sure all gems are stationary but cascades might happen, so they are not fully stationary yet
var check_for_match = !zenify && !must_spawn_gems
if doonce == 0 
{
	#region do hidden gem
	if (!gameover)
	{
		update_gems_fallen_array()
		update_gems_to_spawn_array()
		var gems_should_update = destroy_hidden_gems()
		if (gems_should_update) {
			if (check_for_match) matcher_stepevent(Gem_1)
		}
		check_for_ice_gems()
		if (gems_should_update) { //check for spawns if hidden gems are gone
			update_gems_fallen_array()
			if update_gems_to_spawn_array() {
				check_for_match = false
				spawn_new_gems(Board_1, Gem_1)
			}
		} else if (check_for_match) matcher_stepevent(Gem_1);	
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
}
doonce = 1;

if isQuest with(obj_quest_control) {event_user(4)}
for(i=0;i<ds_list_size(list_of_ampowered);i++)
{
	with(list_of_ampowered[| i] ) amPowered = false
}
ds_list_clear(list_of_ampowered)
IsGemActive = true
future_summoves = 0

if bombis0
{
	var setitback = true //if bomb goes 0 but somehow returns back up (eg fruit trigger), then revert
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

