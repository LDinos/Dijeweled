/// @description Gem destroyed/matched
if global.SET_gamemode2
{
	var non_inv_gems = 0;
	var p_id = whomst_turn
	var g = Gem_2
	var cond = 64
	with(g) {if !amInvisible && (p_id == other.whomst_turn) non_inv_gems++}
	gems_existing = hidden_gems + non_inv_gems

	if (gems_existing < cond) 
	{
		gems_to_send++
	}
}
else gems_to_send++
gemsmatched++