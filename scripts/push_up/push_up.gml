///@oaram gem_index
if !global.online
{
	var modi = 1
	var accstoremove = 4
	if Gamerule_1.isReplay modi = 2
	acc = -accstoremove/modi
	stop = false
	i = 1
	do
	{
		if instance_position(x,y- i*64,argument0) != noone
		{
			pushme = instance_position(x,y - i*64,argument0)
			if (pushme.acc >=0) && !(pushme.amPowered) && (pushme.gempower < 2) pushme.acc = -accstoremove/modi
			else stop = true
			i++
		}
		else stop = true
	}
	until stop = true
}