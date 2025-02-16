function take_other_vsp(){
	var acctosend = 0
	var take_othervsp = true //take other vsp if its not glitching
	//unglitch
	if instance_place(x,y,Gem_1)
	{
		take_othervsp = false
		do y--
		until !instance_place(x,y,Gem_1)
	}
	if take_othervsp//get same vertical speed
	{
		var l = 1
		var found = false
		do
			{
				gemtofind = instance_position(x,y + l*64, Gem_1)
				if gemtofind != noone
					{
						acc = gemtofind.acc
						acctosend = acc
						found = true
					}
				l++
			}
		until l > 8 || found = true
	}
	return acctosend;
}