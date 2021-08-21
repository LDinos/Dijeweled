/// @description Change filler width anim
perc+=0.1
filler = round(lerp(def_filler,fill_to_go,1-power(perc-1,2)))

if filler >= 256
{
	event_user(1) //we are full, increase the xplier
}

if perc < 1
{
	alarm[0] = 1
}