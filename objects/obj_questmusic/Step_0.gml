/// @description Insert description here
// You can write your code in this editor
if danger_enable
{
	var bombs = Gamerule_1.list_of_bombs
	var skulls = Gamerule_1.list_of_skulls
	var doom = Gamerule_1.list_of_doom

	if Gamerule_1.IsGemActive
	{
		if !doonce
		{
			doonce = true
				var did = false
				for(var i=0;i<ds_list_size(bombs);i++)
				{
					if bombs[| i].countdown < 6
					{
						did = true
						break;
					}
				}
				for(var i=0;i<ds_list_size(skulls);i++)
				{
					if (skulls[| i].countdown < 6) && (skulls[| i]._i == 7)
					{
						did = true
						break;
					}
				}
				if doom != noone
				{
					if doom.countdown < 6 did = true
				}
	
				if did 
				{
					if !isdanger event_user(2)	//danger		
				}
				else
				{
					if isdanger event_user(3) //no danger
				}
		}
	}
	else
	{
		doonce = false
	}
}