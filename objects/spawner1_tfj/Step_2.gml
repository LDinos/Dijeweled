if Gamerule_1.IsGemActive exit; //gems not in place
if Gamerule_1.hypeOn exit; //hypercube being destroyed
if Gamerule_1.lightOn exit; //lightning gem being destroyed
if Gamerule_1.flameon exit; ///flame gem being destroyed
if !Gamerule_1.spawnallowed exit; 

with(Gamerule_1) check_gaps(Board_1,Gem_1)

for(j=0;j<8;j++)
{
	if Gamerule_1.gaps[j] < 1 continue;
	if collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) continue; 
	if position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear) continue;
	with(Gamerule_1) check_summoves(false)
	
	var gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
	with(gem_create)
	{
		//take vsp
		var take_othervsp = true //take other vsp if its not glitching
		//unglitch
		if instance_place(x,y,Gem_1)
		{
			do y--
			until !instance_place(x,y,Gem_1)
		}
		else
		{
			for (var l=1;l<9;l++)
			{
				gemtofind = instance_position(x,y + l*64, Gem_1)
				if gemtofind != noone 
				{
					acc = gemtofind.acc
					break;
				}
			}
		}
	}
	
	if !spawn_specific //NOT DOUBLE HYPERCUBE
	{
		with(obj_coal_control) if TurnsToSpawnRandom event_user(0) //Only if randomized, activate event(0) here -- FOR SPAWNING COAL
		if Gamerule_1.summoves2 == 0 && !havedone && Gamerule_1.AHM_allowed// && !Gamerule_1.juststarted
		{
			spawn_script(Gamerule_1,Gem_1,true)
		}
	}
	else
	{
		var key = string(specific[j]) + string(j)
		var skin = spawn_specific_array[? key + "_skin"]
		with(gem_create) //set same speed
		{
			set_skin(skin)
			amHype = other.spawn_specific_array[? key + "_amHype"]
		}
		specific[j]++
		specific_count++
		if specific_count = 64 {specific_count = 0; for(var K = 0; K <8; K++) {specific[K] = 0;} spawn_specific = false}
	}
}
