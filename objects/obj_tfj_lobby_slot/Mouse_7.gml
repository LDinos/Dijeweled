if (is_pressable)
{
	if (image_index == 1) //deselect
	{
		obj_tfj_lobby_master.selected_lobby=undefined
		image_index=0
		exit
	}
	with( obj_tfj_lobby_slot)
	{
		image_index=0
	}
	image_index=1
	obj_tfj_lobby_master.selected_lobby=name
}




