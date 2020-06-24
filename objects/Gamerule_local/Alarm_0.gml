/// @description GemActive
// You can write your code in this editor
for(i=0;i<ds_list_size(list_of_ampowered);i++)
{
	with(list_of_ampowered[| i] ) amPowered = false
}
ds_list_clear(list_of_ampowered)

if doonce == 0 
{
	#region do hidden gem
	var l = ds_list_size(list_of_hiddengems)
	for(var i = 0; i<l; i++)
	{
		with(list_of_hiddengems[| i]) delete_gem()
	}
	#endregion

	matcher_stepevent(Gem_local);	

}
doonce = 1
IsGemActive = true
future_summoves = 0


with(spawner_local) havedone = false
with(spawner_avalanche_local) havedone = false

timegemcooldown = false
if (alarm[1] = -1 && !IsGemActive2) alarm[1] = 2
