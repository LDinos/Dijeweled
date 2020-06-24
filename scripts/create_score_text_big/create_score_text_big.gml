///@param x
///@param y
///@param points
///@param allow_combo_multiplier
if Gamerule_1.points_allowed && global.ShowScore && Gamerule_1.points_text_allowed
{
	var multiplier = Gamerule_1.xplier
	var cascade_num = Gamerule_1.combo
	var xx = argument0
	var yy = argument1
	if (!argument3) cascade_num = 0
	if !instance_exists(obj_score_text_big)
	{
		var c = instance_create_depth(xx,yy,-10,obj_score_text_big)
		if room != rm_classic
		{
			c.text += argument2*multiplier + cascade_num*100*multiplier
		}
		else
		{
			c.text += argument2 +25*(multiplier-1) + cascade_num*25*multiplier
		}
	}
	else
	{
		var modifier = 1
		if Gamerule_1.isReplay modifier = 2
		c = obj_score_text_big
		if room != rm_classic
		{
			c.text += argument2*multiplier + cascade_num*100*multiplier
		}
		else
		{
			c.text += argument2 +25*(multiplier-1) + cascade_num*25*multiplier
		}
		c.scale = 1
		c.alarm[1] = 60*modifier
	}
}