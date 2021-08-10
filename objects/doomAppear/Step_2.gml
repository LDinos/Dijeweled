if instance_exists(mygem)
{
	var XX = mygem.x+mygem.xmover+mygem.SWAP_X
	var YY = mygem.y+mygem.ymover+mygem.SWAP_Y
	x = XX
	y = YY
} else instance_destroy()

