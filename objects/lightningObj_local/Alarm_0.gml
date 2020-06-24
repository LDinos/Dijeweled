/// @description instance_destroy();
/// @function instance_destroy
with(MyGem) acc = 0
//if octa {}
instance_destroy();
if !instance_exists(lightningObj_local)
{
	MyGamerule.lightOn = false //no longer producing lightning, now the gems can move :)
	MyGamerule.octanovaOn = false
}


