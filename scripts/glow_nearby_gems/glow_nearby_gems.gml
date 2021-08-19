///@description Use inside the gem to glow nearby gems if im powered
function glow_nearby_gems(i,j){
	if (i >= 0) {
		if (i > 0) {
			var near_gem = Gamerule_1.gem_board1[i-1,j]
			if (near_gem != noone) near_gem.nearby_glown_down = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (i < 7) {
			var near_gem = Gamerule_1.gem_board1[i+1,j]
			if (near_gem != noone) near_gem.nearby_glown_up = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (j > 0) {
			var near_gem = Gamerule_1.gem_board1[i,j-1]
			if (near_gem != noone) near_gem.nearby_glown_right = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
		if (j < 7) {
			var near_gem = Gamerule_1.gem_board1[i,j+1]
			if (near_gem != noone) near_gem.nearby_glown_left = GLOW_FADEOUT_FRAMES //will take 10 frame to fade out glow
		}
	}
}