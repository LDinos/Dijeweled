///@description Get all powers and transfer them on the next level afterwards
NXT_fruits = 0
NXT_flames = 0
NXT_lights = 0
NXT_novas = 0
NXT_septas = 0
NXT_octas = 0
NXT_hypes = 0
for(var i = 0; i<8;i++)
{
	for(var j = 0; j<8;j++)
	{
		if instance_exists(gems_fallen[@i,j])
		{
			if gems_fallen[@i,j].amHype NXT_hypes++
			else
			{
				switch gems_fallen[@i,j].gempower
				{
					case 6:
						NXT_fruits++
						break;
					case 5:
						NXT_octas++
						break;
					case 4:
						NXT_septas++
						break;
					case 3:
						NXT_novas++
						break;
					case 2:
						NXT_lights++
						break;
					case 1:
						NXT_flames++
						break;
				}
			}		
		}
	}
}