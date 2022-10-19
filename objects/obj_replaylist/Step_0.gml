/// @description Insert description here
var leng = array_length(mystring)
meet = -1
if leng > 0
{
	if mouse_y > 128 && mouse_y < 608 && mouse_x < 736 //after 736 is the slider position_meeting(mouse_x,mouse_y,id)
	{
		var yy = mouse_y - 128 //place where list begins
		if yy >= 0
		{
			meet = yy div 32 +15*(page-1)//will bring 0,1,2,3,4 etc
			if (leng-1 < meet) meet = -1 //reset if the place is not filled
			else
			{
				if mouse_check_button_pressed(mb_left)
				{
					if mouse_x >= 32 //not clicking trash
					{
						if (local_list) {
							ini_open(mystring[meet])
								var t = ini_read_real("replay","time",-1)
								if t != -1 global.timer = t
								var fade = instance_create(0,0,obj_black_fade)
								with(fade) room_to_go = rm_blitz_matchreplay
								global.replay_string = mystring[meet]
								global.replay_match_isplaying = true
							ini_close()
						}
						else {
							global.online_replay_string = mystring[meet]
							fade_to_room(rm_ONLINE_replay)
						}
						instance_destroy()
					}
					else //clicking the bin
					{
						file_delete(mystring[meet])
						var l = local_list
						instance_destroy()
						var r = instance_create(0,0,obj_replaylist)
						if (l == false) r.get_online_replays()
					}
				}
			}
		}	
	}
}