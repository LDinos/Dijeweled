/// @description Change gem depth
with(Gem_1)
{
	if skinnum = other.image_index
	{
		depth = other.depth
		alarm[4] = 60
	}
}