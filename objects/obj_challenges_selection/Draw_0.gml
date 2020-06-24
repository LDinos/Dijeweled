/// @description Insert description here
// You can write your code in this editor
if o.index = 26
{
	var stat = custom_status
}
else
{
	var stat = o.AR_status[o.index,index]
}

draw_sprite(sprite_index,stat,x,y)
draw_sprite_ext(spr_challenge_select_glow,0,x,y,1,1,0,c_white,alpha)
draw_sprite(spr_challenge_isunlocked,stat,x,y)
centerize_text()
draw_text(x+24,y+24,index+1)
draw_set_halign(fa_left)

if stat != 1
{
	if o.index = 26 draw_text(x+72,y+24,custom_description)
	else draw_text(x+72,y+24,o.AR_challenges[o.index,index])
}
