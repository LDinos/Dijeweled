///Used in quest menu, load all the info we need aka descriptions, allowances etc
function read_custom_quest_info() {
	var f = working_directory +"/CustomQuests/"+string(index)+".ini"
	if file_exists(f)
	{
		ini_open(f)
			custom_description = ini_read_string("General","description","")
			custom_status = ini_read_real("General","status",0)
			var ameditable = ini_read_real("General","ameditable",1)
			var xof = 0
			if ameditable
			{
			var edl = instance_create(x+sprite_width,y,obj_editdelete)
			edl.index = index //selection index
			xof+=48
			}
			var edl = instance_create(x+sprite_width+xof,y,obj_editdelete)
			edl.index = index //selection index
			edl.image_index = 1
		ini_close()
	}
	else
	{
		custom_description = "Create Custom Quest"
		custom_status = 0
	}


}
