/// @description Toggle bonus door
with(obj_bonus_doors)
{
	if (image_speed > 0) image_speed = -1
	else if (image_speed < 0) image_speed = 1
	else
	{
		if image_index = 0
		{
			image_speed = 1
		}
		else
		{
			image_speed = -1
		}
	}
}