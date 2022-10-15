function scr_recieved_packet(argument0) {
	var buffer = argument0
	var sender;
	buffer_seek(buffer,buffer_seek_start,0)
	var msg = buffer_read(buffer,buffer_u8)
	if (global.spectator) {
		show_debug_message(buffer)
		sender = buffer_read(buffer,buffer_u8)
		var gamerule = (sender == 0) ? Gamerule_1 : Gamerule_2
	}
	var gmrl = Gamerule_2
	var board = Board_2
	if (global.spectator) {gmrl = gamerule; board = spectator_get_board(sender)}
	
	switch msg
	{
		case NN_MATCH_AVALANCHE_MAKE_INVGEMS:
			avalanche_create_invisible_gems(1)
			break;
		case NN_MATCH_TUG_INFO:
			with(obj_tugowar) offset = buffer_read(buffer,buffer_s16)
			break;
		case NN_MATCH_AVALANCHE_DESTROY_INVGEMS:
			with(Gem_2) {if amInvisible instance_destroy()}
			break;
		case NN_MATCH_GEM_SWAP:
			var id1 = buffer_read(buffer,buffer_u8)
			var id2 = buffer_read(buffer,buffer_u8)
			var gem1 = noone
			var gem2 = noone
			var found = 0
			var spec_check_with_playerid = 0 //gem2 is always player_id = 0 when not spectating
			if (global.spectator) spec_check_with_playerid = sender
			with(Gem_2)
			{
				if (myid == id1) && (player_id == spec_check_with_playerid)
				{
					gem1 = id
					found++
				
				}
				else if (myid == id2) && (player_id == spec_check_with_playerid)
				{
					gem2 = id
					found++
				}
				if (found == 2) break;
			}
			do_match_simplified(gem1,gem2, gmrl)
			break;
		case NN_MATCH_TWIST_SWAP:
			i = 0
			var spec_check_with_playerid = 0 //gem2 is always player_id = 0 when not spectating
			if (global.spectator) spec_check_with_playerid = sender
			repeat(4)
			{
				var d = buffer_read(buffer,buffer_u8)
				with(Gem_2)
				{
					if (myid == d) && (player_id == spec_check_with_playerid)
					{
						gems[i] = id
						i++
						break;
					}
				}
			}
			var cc = buffer_read(buffer,buffer_u8)
		#region SWAP
				var gems;
				gmrl.moving = true
				gems[0].ammoving = true
				gems[1].ammoving = true
				gems[2].ammoving = true
				gems[3].ammoving = true
				var col = instance_create(gems[0].x, gems[0].y,obj_twist_collider2)
					with(col)
					{
						for(var i = 0; i<4;i++)
						{
							gem[i] = gems[i]
							gemxxdef[i] = gems[i].x
							gemyydef[i] = gems[i].y
						}
						if cc == 1
						{
							gemxx[0] = gems[0].x + 64 //first gem going right
							gemyy[0] = gems[0].y
							gemxx[1] = gems[1].x	  //second gem going down
							gemyy[1] = gems[1].y  +64
							gemxx[2] = gems[2].x - 64 //third gem going left
							gemyy[2] = gems[2].y
							gemxx[3] = gems[3].x	  //fourth gem going up
							gemyy[3] = gems[3].y - 64
						}
						else
						{
							gemxx[0] = gems[0].x      //first gem going down
							gemyy[0] = gems[0].y + 64
							gemxx[1] = gems[1].x - 64 //second gem going left
							gemyy[1] = gems[1].y
							gemxx[2] = gems[2].x      //third gem going up
							gemyy[2] = gems[2].y - 64
							gemxx[3] = gems[3].x + 64  //fourth gem going right
							gemyy[3] = gems[3].y 
						}
					}
		#endregion
			break;
		case NN_MATCH_HYPE_SWAP:
			gmrl.hypeOn = true
			break;
		case NN_MATCH_AMEXPLODE:
			var id1 = buffer_read(buffer,buffer_u8)
			var spec_check_with_playerid = 0 //gem2 is always player_id = 0 when not spectating
			if (global.spectator) spec_check_with_playerid = sender
			with(Gem_2) {
				if (myid == id1) && (player_id == spec_check_with_playerid) amexplode = true
			}
			break;
		case NN_MATCH_GEM_COMBO_SOUND:
			var c = buffer_read(buffer,buffer_u8)
			with(gmrl) {matches++; combo = c; combo_check()}
			break;
		case NN_MATCH_AVALANCHE_GAMEOVER:
			var s = 0
			if (global.spectator) s = sender
			audio_stop_all()
			audio_play_sound(vo_gameover,0,false)
			gemdrop(Gem_2, s) //CHANGE ME LATER TO BOARD SPECIFIC GEMDROPS
			with(obj_avalanchedeposit) 
			{
				alarm[1] = 3*60
				 if global.IAMHOST alarm[0] = 8*60
			}
			with(obj_avalanchedeposit_spectator) alarm[1] = 3*60
			break;
		case NN_POINTS_ADD:
			var c = buffer_read(buffer,buffer_u16)
			with(gmrl) {points += c}
			break;
		case NN_STYLE_ADD:
			var c = buffer_read(buffer,buffer_u16)
			with(gmrl) {style += c}
			break;
		case NN_MATCH_BLAZING_SPEED_ON:
			with(board) alpha = 1
			audio_play_sound(vo_blazingspeed,0,0)
			audio_play_sound(snd_blazingspeed,0,0)
			break;
		case NN_MATCH_AVALANCHE_END_TURN:
			var g = buffer_read(buffer,buffer_u8)
			with(obj_avalanchedeposit) {
				var b = Board_1
				num_turns++
				gemsmatched = 0
				gems_to_send = g		
				Gamerule_1.IsGemActive = 0
				Gamerule_1.IsGemActive2 = 0
				Gamerule_1.controlallowed = true
				myturn = true
				ammoving = false	
				make_avalanche_compliment()
				xdestination = b.x - 32 + sprite_width/2	
			}
			with(obj_avalanchedeposit_spectator) {
				/*var non_inv_gems = 0;
				with(Gem_2) {if (!amInvisible && player_id == whomst_turn) non_inv_gems++}

				hidden_gems = gems_to_send + non_inv_gems - 64
				if hidden_gems < 0 hidden_gems = 0
				gems_existing = hidden_gems + non_inv_gems
				*/
				num_turns++
				var b = spectator_get_board(!sender)
				gemsmatched = 0
				gems_to_send = 1
				whomst_turn = !whomst_turn
				make_avalanche_compliment()
				xdestination = b.x - 32 + sprite_width/2
			}
			if (!global.spectator) with(spawner_avalanche) event_user(0) //spawn gems
			break;
		case NN_MATCH_BLAZING_SPEED_OFF:
			with(board) alpha = 0
			break;
		case NN_MATCH_HYPE_OFF:
			gmrl.moving = false
			gmrl.hypeOn = false
			break;
		case NN_MATCH_AHM_SETSKIN:
			var d = buffer_read(buffer,buffer_u8)
			var sk = buffer_read(buffer,buffer_u8)
			with(Gem_2) 
			{
				if (myid == d)
				{
					set_skin(sk)
					break;
				}
			}
			break;
		case NN_MATCH_SEND_POINTS:
			gmrl.points = buffer_read(buffer,buffer_u32)
			gmrl.style = buffer_read(buffer,buffer_u32)
			break;
		case NN_MATCH_AHM_SPAWN:
			var i = buffer_read(buffer,buffer_s8)
			var j = buffer_read(buffer,buffer_u8)
			var sk = buffer_read(buffer,buffer_u8)
			var p_id = 0
			if (global.spectator) p_id = sender
			var g = instance_create_depth(board.x + j*64,board.y + i*64,-1,Gem_2, {player_id : p_id, MyGamerule : gmrl, MyBoard : board})
			with(g)
			{
				player_id = p_id
				MyGamerule = gmrl
				MyBoard = board
				set_skin(sk)
			#region Take vsp
				var take_othervsp = true //take other vsp if its not glitching
				//unglitch
				if instance_place(x,y,Gem_2)
				{
					take_othervsp = false
					do y--
					until !instance_place(x,y,Gem_2)
				}
				if take_othervsp//get same vertical speed
				{
					l = 1
					found = false
					do
						{
							gemtofind = instance_position(x,y + l*64, Gem_2)
							if gemtofind != noone
								{
									acc = gemtofind.acc
									other.acctosend = acc
									found = true
								}
							l++
						}
					until l > 8 || found = true
				}
			#endregion
			}
			break;
		case NN_MATCH_GEM_SPAWN:
			var j = buffer_read(buffer,buffer_u8)
			var p_id = 0
			if (global.spectator) p_id = sender
			var g = instance_create_depth(board.x + j*64,board.y-64,-1,Gem_2, {player_id : p_id, MyGamerule : gmrl, MyBoard : board})
			var sk = buffer_read(buffer,buffer_u8)
			with(g)
			{
				player_id = p_id
				MyGamerule = gmrl
				MyBoard = board
				set_skin(sk)
			#region Take vsp
				var take_othervsp = true //take other vsp if its not glitching
				//unglitch
				if instance_place(x,y,Gem_2)
				{
					take_othervsp = false
					do y--
					until !instance_place(x,y,Gem_2)
				}
				if take_othervsp//get same vertical speed
				{
					l = 1
					found = false
					do
						{
							gemtofind = instance_position(x,y + l*64, Gem_2)
							if gemtofind != noone
								{
									acc = gemtofind.acc
									other.acctosend = acc
									found = true
								}
							l++
						}
					until l > 8 || found = true
				}
			#endregion
			}
			break;
		case NN_MATCH_GEM_DEATH:
			var d = buffer_read(buffer,buffer_u8)
			var crtcol = buffer_read(buffer,buffer_bool)
			var s = buffer_read(buffer,buffer_u8)
			var spec_check_with_playerid = 0
			if (global.spectator) spec_check_with_playerid = sender
			with(Gem_2) 
			{
				if (myid == d) && (player_id == spec_check_with_playerid) //second condition is always true when not spectating
				{
					if amHype
					{
						skin_to_hype = s
					}
					create_col = crtcol
					instance_destroy()
				}
			}		
			gmrl.GEM_ID[d] = -1
			break;
		case NN_MATCH_GEM_POWER:
			var d = buffer_read(buffer,buffer_u8)
			var po = buffer_read(buffer,buffer_u8)
			var spec_check_with_playerid = 0
			if (global.spectator) spec_check_with_playerid = sender
			with(obj_avalanchedeposit) { if hidden_gems > 0 {hidden_gems--};event_user(0);}
			with(obj_avalanchedeposit_spectator) { if hidden_gems > 0 {hidden_gems--};event_user(0);}
			with(Gem_2) 
			{
				if (myid == d) && (player_id == spec_check_with_playerid)
				{
					gempower = po
					break;
				}
			}
		#region sound effect
			switch po
			{
				case 1:
				audio_play_sound(snd_flamecreate,0,false)
				break;
				case 2:
				audio_play_sound(snd_lightcreate,0,false)
				break;
				case 3:
				audio_play_sound(snd_supernovacreate,0,false)
				break;
				case 4:
				audio_play_sound(snd_septacreate,0,false)
				break;
				case 5:
				audio_play_sound(snd_octacreate,0,false)
				break;
			}
		#endregion
			break;
		case NN_MATCH_AVALANCHE_HIDDENMINUS:
			with(obj_avalanchedeposit) hidden_gems--
			with(obj_avalanchedeposit_spectator) hidden_gems--
			break;
		case NN_MATCH_GEM_POWER_NEW:
		    var i = buffer_read(buffer,buffer_u8)
			var j = buffer_read(buffer,buffer_u8)
			var sk = buffer_read(buffer,buffer_u8)
			var po = buffer_read(buffer,buffer_u8)
			var p_id = 0
			if (global.spectator) p_id = sender
			var g = instance_create_depth(board.x + 64*j,board.y + 64*i,-10,Gem_2, {player_id : p_id, MyGamerule : gmrl, MyBoard : board})
			with(g) 
			{
				player_id = p_id
				MyGamerule = gmrl
				MyBoard = board
				gempower = po
				set_skin(sk)
			}
		#region sound effect
			switch po
			{
				case 1:
				audio_play_sound(snd_flamecreate,0,false)
				break;
				case 2:
				audio_play_sound(snd_lightcreate,0,false)
				break;
				case 3:
				audio_play_sound(snd_supernovacreate,0,false)
				break;
				case 4:
				audio_play_sound(snd_septacreate,0,false)
				break;
				case 5:
				audio_play_sound(snd_octacreate,0,false)
				break;
			}
		#endregion
			break;
		case NN_MATCH_GEM_HYPER:
			with(obj_avalanchedeposit) {if hidden_gems > 0 {hidden_gems--};event_user(0);}
			with(obj_avalanchedeposit_spectator) {if hidden_gems > 0 {hidden_gems--};event_user(0);}
			var d = buffer_read(buffer,buffer_u8)
			var spec_check_with_playerid = 0
			if (global.spectator) spec_check_with_playerid = sender
			with(Gem_2) 
			{
				if (myid == d) && (player_id == spec_check_with_playerid)
				{
					gempower = 0
					amHype = true
					break;
				}
			}
			audio_play_sound(snd_hypecreate,0,false)
			break;
		case NN_MATCH_GEM_HYPER_NEW:
		    var i = buffer_read(buffer,buffer_u8)
			var j = buffer_read(buffer,buffer_u8)
			var g = instance_create_depth(board.x + 64*j,board.y + 64*i,-10,Gem_2, {player_id : p_id, MyGamerule : gmrl, MyBoard : board})
			with(g) 
			{
				player_id = p_id
				MyGamerule = gmrl
				MyBoard = board
				gempower = 0
				amHype = true
			}
			audio_play_sound(snd_hypecreate,0,false)
			break;
		case NN_MATCH_BOARD_SPAWN: //SENT BY HOST ONLY
			var seed = buffer_read(buffer,buffer_u32)
			random_set_seed(seed)
			if (global.SET_gamemode == 1) 
			{
				instance_create(0,0,spawner_avalanche)
				if !global.spectator instance_create_depth(room_width/2,992,0,obj_avalanche_pass)
				with(spawner_avalanche) event_user(1)
			}
			else
			{
				instance_create(0,0,spawner1)
				with(spawner1) event_user(1)
			}
			Gamerule_1.ONLINE_give_gem_id = true
			break;
		case NN_MATCH_DUALHYPE_MAKE_HYPE:
			var d = buffer_read(buffer,buffer_u8)
			var spec_check_with_playerid = 0
			if (global.spectator) spec_check_with_playerid = sender
			with(Gem_2) if (myid == d) && (player_id == spec_check_with_playerid) {amHype = true; skinnum = 7}
			break;
		case NN_LBY_CONNECTED: //server getting the info that someone joined
			if (room != rm_lobby) break;
			var user = buffer_read(buffer,buffer_string)
			global.user2 = user
			audio_play_sound(snd_chat_msg,0,false)
			with(obj_chat)
			{
				chat_write(user + " has connected!",c_yellow)
			}
			with(obj_client) client_connected = true //for non-peer-to-peer cases
			break;
		case NN_CHAT:
			if (room != rm_lobby) break;
			var text = buffer_read(buffer,buffer_string)
			with(obj_chat)
			{
				chat_write(text,c_white)
			}
			audio_play_sound(snd_chat_msg,0,false)
			break;
		case NN_DISCONNECT: //client getting the message that server left
			room_goto(rm_menu)
			audio_stop_all()
			instance_destroy()
			break;
		case NN_LBY_REQUEST_SETTINGS: //server getting the okay to send lobby settings back to client when he first joins
			var spectator_asked = buffer_read(buffer, buffer_bool)
			if (room != rm_lobby) break;
			buffer_seek(global.mynet.buffer,buffer_seek_start,0)
			buffer_write(global.mynet.buffer,buffer_u8,NN_LBY_SEND_SETTINGS)
			buffer_write(global.mynet.buffer,buffer_bool,spectator_asked)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_blazing.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_ultranovas.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_multiswap.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_hypercubes.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_matchless.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_twist.enabled)
			buffer_write(global.mynet.buffer,buffer_u8,LOB_skins.val)
			buffer_write(global.mynet.buffer,buffer_u8,LOB_gamemode.val)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_circle.enabled)
			buffer_write(global.mynet.buffer,buffer_bool,LOB_circle2.enabled)
			buffer_write(global.mynet.buffer,buffer_string,global.user)
			buffer_write(global.mynet.buffer,buffer_string,global.version)
			if LOB_gamemode.val = 0 {buffer_write(global.mynet.buffer,buffer_u8,LOB_gamemode_2.val)}
			else if LOB_gamemode.val = 1 {buffer_write(global.mynet.buffer,buffer_u8,LOB_gamemode_defence.enabled)}
			network_send_packet(client_socket,global.mynet.buffer,buffer_tell(global.mynet.buffer))
			break;
		case NN_LBY_SEND_SETTINGS: //client getting info previously asked
			var spectator_asked = buffer_read(buffer,buffer_bool)
			if (room != rm_lobby) break;
			if (!global.spectator && spectator_asked) break; //was this meant to go for spectator only?
			LOB_blazing.enabled = buffer_read(buffer,buffer_bool)
			LOB_blazing.image_index = LOB_blazing.enabled
			LOB_ultranovas.enabled = buffer_read(buffer,buffer_bool)
			LOB_ultranovas.image_index = LOB_ultranovas.enabled
			LOB_multiswap.enabled = buffer_read(buffer,buffer_bool)
			LOB_multiswap.image_index = LOB_multiswap.enabled
			LOB_hypercubes.enabled = buffer_read(buffer,buffer_bool)
			LOB_hypercubes.image_index = LOB_hypercubes.enabled
			LOB_matchless.enabled = buffer_read(buffer,buffer_bool)
			LOB_matchless.image_index = LOB_matchless.enabled
			LOB_twist.enabled = buffer_read(buffer,buffer_bool)
			LOB_twist.image_index = LOB_twist.enabled
			LOB_skins.val = buffer_read(buffer,buffer_u8)
			LOB_gamemode.val = buffer_read(buffer,buffer_u8)
			LOB_circle.enabled = buffer_read(buffer,buffer_bool)
			LOB_circle2.enabled = buffer_read(buffer,buffer_bool)
			global.user2 = buffer_read(buffer,buffer_string)
			with(obj_chat) chat_write(global.user2 + " is the current host.", c_yellow)
			var ver = buffer_read(buffer,buffer_string)
			if (LOB_gamemode.val = 0) 
			{
				LOB_gamemode_2.val = buffer_read(buffer,buffer_u8)
			}
			else if (LOB_gamemode.val = 1) 
			{
				instance_destroy(LOB_gamemode_2); 
				var g = instance_create(16,336,LOB_gamemode_defence); 
				g.enabled = buffer_read(buffer,buffer_u8)
				g.image_index = g.enabled
			}
			else {instance_destroy(LOB_gamemode_defence); instance_destroy(LOB_gamemode_2)}
			if ver != global.version 
			{
				var t = instance_create(room_width/2,room_height/2,obj_online_kick)
				with(t) {txt = "Your version ("+global.version+") is different than Host's ("+ver+")"}
				room_goto(rm_menu)
			}
			break;
		case NN_LBY_PRESS_BEJ3: //client getting info that the host pressed BEJ3 preset
			with(LOB_preset_bej3) event_user(0)
			break;
		case NN_LBY_PRESS_CLASSIC: //client getting info that the host pressed CLASSIC preset
			with(LOB_preset_classic) event_user(0)
			break;
		case NN_LBY_SKINS: //client getting info
			LOB_skins.val = buffer_read(buffer,buffer_u8)
			break;
		case NN_LBY_ULTRANOVAS:
			LOB_ultranovas.enabled = buffer_read(buffer,buffer_bool)
			LOB_ultranovas.image_index = LOB_ultranovas.enabled
			break;
		case NN_LBY_BLAZING:
			LOB_blazing.enabled = buffer_read(buffer,buffer_bool)
			LOB_blazing.image_index = LOB_blazing.enabled
			break;
		case NN_LBY_TWIST: //client getting info
			LOB_twist.enabled = buffer_read(buffer,buffer_bool)
			LOB_twist.image_index = LOB_twist.enabled
			break;
		case NN_LBY_DEFENSE: //client getting info
			LOB_gamemode_defence.enabled = buffer_read(buffer,buffer_bool)
			LOB_gamemode_defence.image_index = LOB_gamemode_defence.enabled
			break;
		case NN_LBY_MATCHLESS: //client getting info
			LOB_matchless.enabled = buffer_read(buffer,buffer_bool)
			LOB_matchless.image_index = LOB_matchless.enabled
			break;
		case NN_LBY_HYPERCUBES: //client getting info
			LOB_hypercubes.enabled = buffer_read(buffer,buffer_bool)
			LOB_hypercubes.image_index = LOB_hypercubes.enabled
			break;
		case NN_LBY_MULTISWAP: //client getting info
			LOB_multiswap.enabled = buffer_read(buffer,buffer_bool)
			LOB_multiswap.image_index = LOB_multiswap.enabled
			break;
		case NN_LBY_GAMEMODE: //client getting info
			LOB_gamemode.val = buffer_read(buffer,buffer_u8)
			if LOB_gamemode.val = 0 && !instance_exists(LOB_gamemode_2) {instance_destroy(LOB_gamemode_defence); instance_create(168,336,LOB_gamemode_2)}
			else if LOB_gamemode.val = 1 {instance_destroy(LOB_gamemode_2); instance_create(16,336,LOB_gamemode_defence)}
			else {instance_destroy(LOB_gamemode_2); instance_destroy(LOB_gamemode_defence);}
			break;
		case NN_LBY_GAMEMODE2: //client getting info
			LOB_gamemode_2.val = buffer_read(buffer,buffer_u8)
			break;
		case NN_LBY_READY: //client or server getting ready info
			audio_play_sound(snd_lobby_ready,0,false)
			if (!global.spectator) {
				if global.IAMHOST LOB_circle2.enabled = !LOB_circle2.enabled
				else LOB_circle.enabled = !LOB_circle.enabled	
			}
			else {
				if (sender == 0) {LOB_circle.enabled = !LOB_circle.enabled}
				else {LOB_circle2.enabled = !LOB_circle2.enabled}
			}
			if (LOB_circle.enabled && LOB_circle2.enabled)
			{
				fade_to_room(rm_ONLINE)
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
			break;
		case NN_BACK_TO_LOBBY:
			room_goto(rm_lobby)
			audio_stop_all()
			with(obj_chat)
			{
				chat_write("Host is connected.",c_yellow)
			}
			break;
		case NN_MATCH_GO:
			with(obj_online_getready)
			{
				visible = false
				audio_play_sound(vo_go,0,false)
				with(obj_glassbar) ready = true	
				with(obj_rotator) alarm[0] = 60
				if global.SET_gamemode != 1 
				{
					Gamerule_1.controlallowed = true; alarm[2] = 60
					if global.SET_gamemode = 2 instance_destroy()
				}
				else 
				{
					Gamerule_1.IsGemActive = 0
					Gamerule_1.IsGemActive2 = 0
					with(obj_avalanchedeposit) doonce = !doonce
					instance_destroy()
				}
			}
			break;
		case NN_MATCH_TIMEUP:
			with(obj_rotator) event_user(0)
			break;
		case NN_MUSIC_DANGERON:
			with(obj_music) event_user(0)
			break;
		case NN_MUSIC_DANGEROFF:
			with(obj_music) event_user(1)
			break;
		case NN_MATCH_AVALANCHE_PASS:
			audio_play_sound(snd_pass,0,false)
			break;
		case NN_AMREADY:
			with(obj_online_getready) other_player_is_now_ready()
			break;
		case NN_YOUARE_HOST:
			global.IAMHOST = true
			global.mynet = obj_client //on non-peer-to-peer server, you are client and global host
			with(obj_chat) chat_write("You are the host of this lobby", c_yellow)
			break;
		case NN_YOUARE_SPECTATOR:
			global.mynet = obj_client
			global.spectator = true
			global.user1 = buffer_read(buffer, buffer_string)
			global.user2 = buffer_read(buffer, buffer_string)
			with(obj_chat)
			{
				chat_write("You are spectating: " + global.user1 +", " + global.user2 ,c_yellow)
			}
			break;
		case NN_SPECTATOR_JOINED:
			global.spectator_name = buffer_read(buffer, buffer_string)
			with(obj_chat)
			{
				chat_write("Spectator Joined: " + global.spectator_name ,c_yellow)
			}
			break;
		case NN_SPECTATOR_DISCONNECT:
			global.spectator_name = false
			break;
		case NN_SERVER_BYE:
			room_goto(rm_menu)
			var t = instance_create(room_width/2,room_height/2,obj_online_kick)
			with(t) {txt = "Server is closed"}
			break;
	}

}
