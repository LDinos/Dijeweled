/// @description instance_destroy();
/// @function instance_destroy
with(Gem_2) acc = 0
instance_destroy();
if !instance_exists(lightningObj2) //if im the last lightning
{
Gamerule_2.lightOn = false //no longer producing lightning, now the gems can move :)
}


