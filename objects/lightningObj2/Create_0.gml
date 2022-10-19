///@description A cheap lightning effect in player 2's board
modifier = 1
image_speed = 0.4/modifier
if !variable_instance_exists(id,"player_id") player_id = 0
/* Desc

The lightning itself. Mostly its doubled, since its a cross
lightning. Uses color aswell

*/
depth = -10
glowalpha = 1
color = c_red
skinnum = -1
//if instance_position(x,y,Board_1) = noone instance_destroy();
//Set alarm
image_yscale = 1.7
MyGamerule = Gamerule_2
if (global.spectator && player_id == 0) MyGamerule = Gamerule_1
MyGamerule.lightOn = true
with(Gem_2) if (player_id == other.player_id) acc = 0
alarm[0] = 75*modifier

/* */
/*  */
