/// @description Insert description here
if image_speed < 0
{
	if image_index = 0
	{
		image_speed = 0
	}
}
else if image_speed > 0
{
	if image_index = image_number - 1
	{
		image_speed = 0
	}
}