/// @description Insert description here
x = lerp(x,xdestination,0.1)
var non_inv_gems = 0;
var p_id = whomst_turn
with(Gem_2) {
	if (!amInvisible && player_id == p_id) non_inv_gems++
}
gems_existing = hidden_gems + non_inv_gems //non_inv gems einai ta diamantia hdh sto board