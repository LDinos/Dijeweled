/// @description
/*
	The struct of player1_map or player2_map looks like this
	{	
		"112" : [{"gem_swap" : [32, 1]}, 
				{"points_add" : [1000]}],
		"253" : ....
	}
-	var frame is the number 112, or 253 etc, it's basically the frame where the actions happen
-	var action is one of the actions of the specific frame, eg {gem_swap : [32,1]} is one of them.
	One frame can have many actions which is why we loop through an array 
-	var action_array_values is the array of values of the specific action, eg for "gem_swap" it's [32,1]
	
*/
if (timer_enabled) {
	if (timer >= timer_end) {
		timer_enabled = false
		if (global.SET_gamemode == 0) {
			audio_play_sound(vo_gameover, 0, false)
			with(obj_rotator) alarm[2] = 60*3 //find the winner
			alarm[1] = 60*8 //go back to menu
		}
	}
	else {
		if (global.SET_gamemode == 1) {
			if array_length(avalanche_turns) > 0 {
				if (timer == avalanche_turns[0]) array_delete(avalanche_turns, 0, 1)
			}
		}
		for(var i = 0; i < 2; i++) {
			var t = string(timer)
			var p_id = i
			var map = (i == 0) ? player1_map : player2_map
			var gmrl = (i == 0) ? Gamerule_1 : Gamerule_2
			var frame = map[$ t]
			if !is_undefined(frame) {
				for(var k = 0; k < array_length(frame); k++) //How many actions happened in that frame
				{
					var action = frame[k] //one of the actions of that frame
					var action_name = variable_struct_get_names(action)[0] //get the name of the action
					var action_array_values = variable_struct_get(action, action_name) //get the array of values
					process_action(action_name, action_array_values, p_id, gmrl)
				}
			}
		}
	
		timer++
	}
}


