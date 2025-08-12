/// @description Insert description here
if (!global.canbepressed) exit;
var leng = array_length(mystring)
meet = -1
if leng > 0
{
	if mouse_y > 128 && mouse_y < 608 && mouse_x < 736 //after 736 is the slider position_meeting(mouse_x,mouse_y,id)
	{
		var yy = mouse_y - 128 //place where list begins
		if yy >= 0
		{
			var p = (list_type == list_types.PUBLISHED) ? 0 : page-1
			meet = yy div 32 +15*(p) //will bring 0,1,2,3,4 etc
			if (leng-1 < meet) meet = -1 //reset if the place is not filled
			else
			{
				if mouse_check_button_pressed(mb_left)
				{
					if mouse_x >= 32 ||(list_type == list_types.PUBLISHED) //not clicking trash
					{
						select_replay(meet)
					}
					else //clicking the bin
					{
						file_delete(mystring[meet])
						var l = list_type //(list_type == list_types.LOCAL)
						instance_destroy()
						var r = instance_create(0,0,obj_replaylist)
						if (l == list_types.LOCAL) r.get_local_replays()
						else if (l == list_types.MULTIPLAYER) r.get_online_replays()
						else r.get_downloaded_replays()
					}
				}
			}
		}	
	}
}