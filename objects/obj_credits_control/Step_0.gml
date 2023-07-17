/// @description Insert description here
if !showblack
{
	if (y < yyend)
	{
		y+=0.55
	}
	else if doonce
	{
		Gamerule_1.controlallowed = false
		if !file_exists("secrets.ini") file_create_secrets()
		var l = ds_list_create()
		ini_open("secrets.ini")
			var str = ini_read_string("secret","data","")
			ds_list_read(l,str)
			if l[| 3] == false
			{
				instance_create_depth(0,512,-99,obj_secretunlock)
				l[| 3] = true
				var str = ds_list_write(l)
				ini_write_string("secret","data",str)
			}
		ini_close()
		alarm[3] = 60*5
		instance_create(0,512,obj_credits_thanks)
		doonce = !doonce
	}
}