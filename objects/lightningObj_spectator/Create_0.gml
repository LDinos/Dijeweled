///@description A cheap lightning effect in player 2's board
modifier = 1
image_speed = 0.4/modifier
/* Desc
The lightning itself. Mostly its doubled, since its a cross
lightning. Uses color aswell

*/
depth = -10
glowalpha = 1
color = c_red
skinnum = -1
player_id = 0
MyGamerule = Gamerule_2
//if instance_position(x,y,Board_1) = noone instance_destroy();
//Set alarm
image_yscale = 1.7
alarm[0] = 75*modifier

/* */
/*  */
function lighton(Gamerule, p_id) {
	Gamerule.lightOn = true
	MyGamerule = Gamerule
	player_id = p_id
	with(Gem_2) if (player_id == p_id) acc = 0
}

function lightoff(Gamerule, p_id) {
	with(Gem_2) if (player_id == p_id) acc = 0
	var num_lights = -1
	with(lightningObj_spectator) if (p_id == player_id) num_lights++
	if (num_lights == 0) //if im the last lightning
	{
		Gamerule.lightOn = false //no longer producing lightning, now the gems can move :)
	}
	instance_destroy();
}