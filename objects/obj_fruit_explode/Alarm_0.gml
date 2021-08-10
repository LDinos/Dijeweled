image_xscale -= 0.05/modifier
image_yscale -= 0.05/modifier
if image_xscale > 0.4*0.25 alarm[0] = 1
else 
{
	alarm[1] = 1; 
	shake = 0;
	if Gamerule_1.points_allowed
	{
		with(Gamerule_1) {points_add_nocombo(1000) compliment_add(150)}/*create_score_text_big(1000,x,y)*/
		create_fruit_text(1000)
	}
}

