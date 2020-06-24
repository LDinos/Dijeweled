/// @description Insert description here
t+=0.5 + 9.5*Gamerule_1.fruit_want_to_spawn
if !surface_exists(x_surf)
{
	x_surf = surface_create(8,sprite_height)
}
if  Gamerule_1.fruit_want_to_spawn surface_resize(x_surf,sprite_width,sprite_height)
else if filler != 0 surface_resize(x_surf,filler,sprite_height)
else surface_resize(x_surf,16,sprite_height)

if !lerpy_toggle
{
	if lerpy < 1
	{
		lerpy+=0.01*lerpy_speed
	}
	else lerpy_toggle = true
}
else
{
	if lerpy > 0
	{
		lerpy-=0.02*lerpy_speed
	}
	else lerpy_toggle = false
}

if Gamerule_1.IsGemActive2 && Gamerule_1.fruit_want_to_spawn
{
	event_user(3)
}