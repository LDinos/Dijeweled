/// @description Insert description here
if image_index = 0 //down
{
	with(obj_replaylist)
	{
		if array_length_1d(mystring) > page*15
		{
			page++
		}
	}
}
else
{
	with(obj_replaylist)
	{
		if page != 1 page--
	}
}