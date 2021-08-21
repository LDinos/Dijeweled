/// @description Insert description here
if image_index = 1
{
	image_index = 0

}
else
{
	image_index = 1
}

ini_open("settings.ini")
	ini_write_real("Settings","TransparentBoard",image_index)
ini_close()