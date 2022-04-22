/// @description Insert description here
//draw_text(x,y+64,string((obj_score.scoretemp-previous_points)))
draw_sprite(spr_lvlbar_bot,0,x-8,y)
if !Gamerule_1.time_allowed
{
	var w = show_full ? bar_end : ((obj_score.scoretemp-previous_points)/(Gamerule_1.levelpointsneeded-previous_points))*bar_end
	draw_sprite_part(spr_flow,image_index,0,0,w,32,x,y+8)
}
else
{
	draw_sprite_part(spr_flow,image_index,0,0,(time_now/time_full)*bar_end,32,x,y+8)
	draw_set_halign(fa_center)draw_set_valign(fa_middle)draw_set_font(font0);
	t = string(time_now div 60)+":"+(time_now mod 60 >= 10 ? string(time_now mod 60) : "0"+string(time_now mod 60))
	draw_text_transformed_colour(x+258,y+26,t,0.75,0.75,0,0,0,0,0,1);
	draw_text_transformed_colour(x+256,y+24,t,0.75,0.75,0,c_white,c_white,c_white,c_white,1);
}
draw_sprite(spr_lvlbar_top,0,x-8,y)
