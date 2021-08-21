/// @description Insert description here
if unable
{
	var b = gamepad_lastkey(global.gp[0])
	if b != -1 && b != gp_padu && b != gp_padd && b != gp_padl && b != gp_padr && b != gp_start && b != gp_axisrh && b != gp_axisrv && b != gp_axislh && b != gp_axislv
	{
		B_list[click,0] = b
		ini_open("binds.ini")
			ini_write_real("binds",B_list[click,2],b)
		ini_close()
		click = -1
		unable = false
		read_gamepad_binds()
	}
}