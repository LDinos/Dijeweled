/// @description Insert description here
// You can write your code in this editor
pre_dist = dist
index = mouse_x div 48
func = 0
ini_open("challenges.ini")
	ini_write_real("Last Index","index", index)
ini_close()

if index = 26
{
	instance_create(0,0,obj_scrolldn)
	instance_create(0,0,obj_scrollup)
	instance_destroy(obj_editdelete)
	with(obj_challenges_selection)
	{
		read_custom_quest_info()
	}
	//create_deledit(true)
	//with(obj_challenges_selection) custom_challengemenu_getinfo()
}
else
{
	with(obj_challenges_selection)
	{
		index = index - other.page*6
	}
	page = 0
	instance_destroy(obj_scrolldn)
	instance_destroy(obj_scrollup)
	instance_destroy(obj_editdelete)
}