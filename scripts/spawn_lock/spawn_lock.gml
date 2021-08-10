///@description Used in lock-type controls, when this is triggered, a locking sprite will appear
////@param type
var list = ds_list_create()
for(var i = 0; i<8; i++)
{
	for(var j = 0; j<8; j++)
	{
		var gem = Gamerule_1.gem_board1[i,j]
		if gem != noone//instance_exists(gem)
		{
			if (gem.amLocked = 0) && (gem.gempower = 0) && (gem.skinnum != 7) && (!gem.amBomb) && (gem.amBeingLocked = 0)
			{
				ds_list_add(list,gem)
			}
		}
	}
}

if !ds_list_empty(list)
{
	ds_list_shuffle(list)
	gem = list[| 0]

	if argument0 = "normal"
	{
		var app = instance_create(x,y,lockAppear)
		gem.amBeingLocked = 1
	}
	else if argument0 = "doom"
	{
		var app = instance_create(x,y,doomAppear)
		gem.amBeingLocked = 2
	}
	else if argument0 = "ice"
	{
		var app = instance_create(x,y,iceAppear)
		gem.amBeingLocked = 3
	}
	else if argument0 = "Skull"
	{
		var app = instance_create(x,y,skullAppear)
		gem.amBeingLocked = 4
	}
	app.mygem = gem
}

ds_list_destroy(list)