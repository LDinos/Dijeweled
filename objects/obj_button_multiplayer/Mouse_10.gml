/// @description Change sprite
with(obj_menu_tooltip)
{
	var t = "Local Multiplayer gamemodes to play with your friends or bots!"
	if os_is_phone() t = "Multiplayer gamemodes to play with bots!"
	text = t
}
image_index = 1