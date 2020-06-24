/// @description Insert description here
if instance_number(obj_hypercube_detonate_local) <= 1 //only me exists
{
	MyGamerule.moving = false
	MyGamerule.hypeOn = false
}
instance_destroy()