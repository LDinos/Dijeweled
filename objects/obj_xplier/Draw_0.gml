/// @description Insert description here
if !surface_exists(x_surf)
{
	x_surf = surface_create(8,sprite_height)
}
draw_sprite(spr_xplier_bottom,0,x,y)
//--draw flow--\\
surface_set_target(x_surf)
	if Gamerule_1.fruit_want_to_spawn
	{
		sprite_index = spr_xplier_flow_rainbow
		draw_sprite_tiled(sprite_index,0,x+t,y+32)
	}
	else if filler != 0 draw_sprite_tiled(sprite_index,0,x+t,y+32)
surface_reset_target()
draw_surface(x_surf,x,y)
//--\\
draw_sprite(spr_xplier_bars,bar_sprite,x,y)
draw_sprite(spr_xplier_top,0,x,y)
if light > 0 draw_sprite_ext(spr_xplierglow,0,x,y,1,1,0,c_white,light)
