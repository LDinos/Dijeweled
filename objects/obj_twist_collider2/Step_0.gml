/// @description Insert description here
if func <= 1 && !gemgotdestroyed
{
	if (func + 0.08 > 1) func = 1
	var inside = 1 - power((func-1),2)
	for(var i = 0; i<4;i++)
	{
		if !instance_exists(gem[i])
		{
			gemgotdestroyed = true
		}
		else
		{
			gem[i].x = ease_out_sine(func,gemxxdef[i],gemxx[i]-gemxxdef[i],1)//round(lerp(0,SWAP_X_END,power(percent,2))) //- x
			gem[i].y = ease_out_sine(func,gemyydef[i],gemyy[i]-gemyydef[i],1)//round(lerp(0,SWAP_Y_END,power(percent,2))) //- y
			//gem[i].x = lerp(gemxxdef[i],gemxx[i],inside)
			//gem[i].y = lerp(gemyydef[i],gemyy[i],inside)
		}
	}
	func += 0.08
}
else
{
	if (instance_number(obj_twist_collider2) == 1) Gamerule_2.moving = false
	
	for(var i = 0; i<4;i++)
	{
		with(gem[i])
		{
			if other.gemgotdestroyed
			{
				x = other.gemxx[i]
				y = other.gemyy[i]
			}
			ammoving = false	
		}
	}

	instance_destroy()
}