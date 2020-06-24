///@param x
///@param y
///@param points
///@param allow_combo_multiplier
///@param mycolor
if Gamerule_1.points_allowed && global.ShowScore && Gamerule_1.points_text_allowed
{
var multiplier = Gamerule_1.xplier
var cascade_num = Gamerule_1.combo
var xx = argument0
var yy = argument1

var c = instance_create_depth(xx,yy,-10,obj_score_text)
c.color = argument4

if (!argument3) cascade_num = 0
if room != rm_classic
{
	c.text = argument2*multiplier + cascade_num*100*multiplier
}
else
{
	c.text = argument2 +25*(multiplier-1) + cascade_num*25*multiplier
}

}
