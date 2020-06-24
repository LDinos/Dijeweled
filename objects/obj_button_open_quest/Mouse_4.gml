/// @description Insert description here
if global.canbepressed
{
	if obj_challenges_room.index != 26
	{
			obj_challenges_room.pre_dist = obj_challenges_room.dist
			obj_challenges_room.func = 0
			obj_challenges_room.index = 26
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
	var file;
	file = get_open_filename("custom quest |*.ini", "0")
	if file != ""
    {
		var lastnum = 0;
		while(file_exists(program_directory +"/CustomQuests/"+string(lastnum)+".ini")) lastnum++
		file_copy(file,program_directory +"/CustomQuests/"+string(lastnum)+".ini")
		ini_open(program_directory +"/CustomQuests/"+string(lastnum)+".ini");
			ini_write_real("General","ameditable",0)
		ini_close()
		with(obj_challenges_selection) read_custom_quest_info()
    }
}