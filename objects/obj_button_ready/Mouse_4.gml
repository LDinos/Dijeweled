/// @description Insert description here
if canclick && !global.spectator
{
	if !global.online
	{
		var all_good = true;
		var ctrl = obj_controller_choose
		
		if global.bot1
		{
			global.botdifficulty1 =  ctrl.index
		}
		else global.gp[1] = ctrl.options[ctrl.index,0]
		
		if all_good
		{
			global.SET_blazing = LOB_blazing.enabled
			global.SET_multiswap = LOB_multiswap.enabled
			global.SET_hyper = LOB_hypercubes.enabled
			global.SET_matchless = LOB_matchless.enabled
			global.SET_twist = LOB_twist.enabled
			global.SET_skin = LOB_skins.val
			global.SET_gamemode = LOB_gamemode.val
			global.SET_ultranovas = LOB_ultranovas.enabled
			if (LOB_gamemode.val = 0) global.SET_gamemode2 = LOB_gamemode_2.val
			else if (LOB_gamemode.val = 1) global.SET_gamemode2 = LOB_gamemode_defence.enabled
			canclick = false
			with(obj_button_lobbyback) canclick = false
			fade_to_room(rm_LOCAL)
		}
		else
		{
			error = true
			alarm[0] = 3*60
		}
	}
	else 
	{
		if global.IAMHOST
		{
			if global.mynet.client_connected
			{
				if !LOB_circle.enabled
				{
					audio_play_sound(snd_lobby_ready,0,false)
					LOB_circle.enabled = !LOB_circle.enabled
					canclick = false;
					network_send(NN_LBY_READY, [], [])
				}
			}
		}
		else
		{
			if !LOB_circle2.enabled
			{
				LOB_circle2.enabled = !LOB_circle2.enabled
				{
					audio_play_sound(snd_lobby_ready,0,false)
					canclick = false;
					network_send(NN_LBY_READY, [], [])
				}
			}
		}
		
		if (LOB_circle.enabled && LOB_circle2.enabled)
		{
			if (global.IAMHOST) network_send(NN_DISSALLOW_SPECTATORS)
			with(obj_button_lobbyback) canclick = false
			fade_to_room(rm_ONLINE)
			global.SET_blazing = LOB_blazing.enabled
			global.SET_multiswap = LOB_multiswap.enabled
			global.SET_hyper = LOB_hypercubes.enabled
			global.SET_matchless = LOB_matchless.enabled
			global.SET_twist = LOB_twist.enabled
			global.SET_skin = LOB_skins.val
			global.SET_gamemode = LOB_gamemode.val
			global.SET_ultranovas = LOB_ultranovas.enabled
			if (LOB_gamemode.val = 0) global.SET_gamemode2 = LOB_gamemode_2.val
			else if (LOB_gamemode.val = 1) global.SET_gamemode2 = LOB_gamemode_defence.enabled
		}
	
	}
}