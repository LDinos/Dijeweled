/// @description put gems on array and store them
ready = !(moving || flameon || !should_move || fruit_spawning || fruit_exploding || gems_ready != instance_number(Gem_1))

if ready && !levelcompleted
{
	if !IsGemActive {
		if alarm[0] = -1 alarm[0] = 1 //isgemactive1
	}
}
else
{
	autosave = false
	doonce = 0
	IsGemActive = false
	IsGemActive2 = false
	alarm[0] = -1
	alarm[1] = -1
}
//ready = true;