ini_open("challenges.ini")
	custom_description = ini_read_string("Challenges",string(o.index)+":"+string(index),"Create a Custom Quest")
	custom_status = ini_read_real("Info",string(o.index)+":"+string(index)+"-Status",0)
ini_close()