/// @description Gem destroyed/matched
if global.SET_gamemode2
{
	var non_inv_gems = 0;
	var g = Gem_1
	var cond = 64
	if !myturn {g = Gem_2; cond = 64} //cond = 63 idk why but the condition must be different as an info receiver
	with(g) {if !amInvisible non_inv_gems++}
	gems_existing = hidden_gems + non_inv_gems

	if (gems_existing < cond) 
	{
		//if MYDEBUG show_message("I am sending attacks now, " + string(gems_existing)); 
		gems_to_send++
	}
}
else gems_to_send++
gemsmatched++