///@description if ahm fails or zenify concludes with no moves, its time to make a cube
var gem_to_spawn = noone
var wheretospawn = ds_list_create()
var shalldoit = true //this variable will be false if the board has gaps for some reason, which means
					//that the board is not gemactive2
for(var i=0;i<8;i++)
{
	for(var j=0;j<8;j++)
	{
		if instance_exists(Gamerule_1.gem_board1[i,j])
		{
			if (Gamerule_1.gem_board1[i,j].gempower = 0)
			{
				ds_list_add(wheretospawn,Gamerule_1.gem_board1[i,j])
			}
		}
		else
		{
			shalldoit = false
		}
	}
}
ds_list_shuffle(wheretospawn)
var q = 0
do
{
	gem_to_spawn = wheretospawn[| q] 
	q++
}
until gem_to_spawn != noone
ds_list_destroy(wheretospawn)

if shalldoit 
{
	with(gem_to_spawn) {amHype = true; skinnum = 7; amLocked = 0}
}