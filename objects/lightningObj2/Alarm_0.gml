/// @description instance_destroy();
/// @function instance_destroy
with(Gem_2) if (player_id == other.player_id) acc = 0
instance_destroy();
var count = 0
with(lightningObj2) if (player_id == other.player_id) count++
if (count == 0) //if im the last lightning
{
MyGamerule.lightOn = false //no longer producing lightning, now the gems can move :)
}


