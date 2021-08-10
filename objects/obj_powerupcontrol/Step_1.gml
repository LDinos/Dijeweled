/// @description Insert description here
// You can write your code in this editor
if powerup_flames
{
	powerup_three_flames()
	powerup_flames = false
}
horver_timer = alarm[0] div 60 + 1
inverted_timer = alarm[1] div 60 + 1
if Gamerule_1.swap_happened
{
	if PowerupTurns > 0
	{
		PowerupTurns--
	}
	else
	{
		PowerupTurns = PowerupTurnsDefault
		with(spawner1) powerupspawn = true
	}
}