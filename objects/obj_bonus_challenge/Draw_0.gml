/// @description Insert description here
draw_self()
if (!challenge_complete && !moving) draw_sprite(spr_bonus_indicator,0,indicator_x,y+32)
for(var i = 0; i < 4; i++)
{
	var sprite_to_use = spr_bonus_gems_off;
	if bonus_lit[i]
	{
		sprite_to_use = spr_bonus_gems_on
	}
	var scale = 0.25
	if (sprite_to_use == spr_bonus_gems_on) scale = 1
	draw_sprite_ext(sprite_to_use,bonus[i],x + 64*i,y+32,scale,scale,0,c_white,1)
}

/*
for(i=0; i < ds_list_size(list_of_matches); i++)
{
	draw_text(8,600 + 16*i,list_of_matches[| i])
}