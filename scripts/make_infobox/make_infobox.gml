///@param condition
///@param image_index
///Make tutorial infobox for first time appearing special gem
function make_infobox(argument0, argument1) {
	if argument0
	{
		if Gamerule_1.infobox_allowed
		{
		instance_destroy(obj_helpinfo)
		var info = instance_create(0,0, obj_helpinfo)
		info.image_index = argument1	
		ini_open("settings.ini")
			switch argument1
			{
				case 0:
					ini_write_real("First Time","Lock",false)
					Gamerule_1.FirstTime_Lock = false
					break;
				case 1:
					ini_write_real("First Time","Ice",false)
					Gamerule_1.FirstTime_Ice = false
					break;
				case 2:
					ini_write_real("First Time","Bomb",false)
					Gamerule_1.FirstTime_Bomb = false
					break;
				case 3:
					ini_write_real("First Time","Doom",false)
					Gamerule_1.FirstTime_Doom = false
					break;
				case 4:
					ini_write_real("First Time","Skull",false)
					Gamerule_1.FirstTime_Skull = false
					break;
				case 5:
					ini_write_real("First Time","Coal",false)
					Gamerule_1.FirstTime_Coal = false
					break;
				case 6:
					ini_write_real("First Time","Flame",false)
					Gamerule_1.FirstTime_Flame = false
					break;
				case 7:
					ini_write_real("First Time","Lightning",false)
					Gamerule_1.FirstTime_Lightning = false
					break;
				case 8:
					ini_write_real("First Time","Hypercube",false)
					Gamerule_1.FirstTime_Hypercube = false
					break;
				case 9:
					ini_write_real("First Time","Supernova",false)
					Gamerule_1.FirstTime_Supernova = false
					break;
				case 10:
					ini_write_real("First Time","Septanova",false)
					Gamerule_1.FirstTime_Septanova = false
					break;
				case 11:
					ini_write_real("First Time","Octanova",false)
					Gamerule_1.FirstTime_Octanova = false
					break;
				case 12:
					ini_write_real("First Time","Fruit",false)
					Gamerule_1.FirstTime_Fruit = false
					break;
				case 13:
					ini_write_real("First Time","Zenify",false)
					Gamerule_1.FirstTime_Zenify = false
					break;
			}
		ini_close()
		}
	}


}
