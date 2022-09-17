/// @description Insert description here
// You can write your code in this editor
if (!Gamerule_1.isQuest)
{
	var has_level = true
	scr_gameover(has_level)
}
else
{
	room_to_go = rm_menu_challenges
}

fade_to_room(room_to_go)