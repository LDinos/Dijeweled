///@description Use inside the gem to glow nearby gems if im powered
function glow_nearby_gems(i,j){
	if (j > 7) || (i > 7) || (i < 0) return;
	try {
		if (i > 0) {
			var near_gem = MyGamerule.gem_board1[i-1,j]
			if (near_gem != noone) near_gem.nearby_glown_down = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (i < 7) {
			var near_gem = MyGamerule.gem_board1[i+1,j]
			if (near_gem != noone) near_gem.nearby_glown_up = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (j > 0) {
			var near_gem = MyGamerule.gem_board1[i,j-1]
			if (near_gem != noone) near_gem.nearby_glown_right = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (j < 7) {
			var near_gem = MyGamerule.gem_board1[i,j+1]
			if (near_gem != noone) near_gem.nearby_glown_left = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
	}
	catch(e) {
		if global.debug show_debug_message(e)
	}

}