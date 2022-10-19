/// @description
//DELETE ME LATER

//
var _buffer = buffer_load(global.online_replay_string)
var _string = buffer_read(_buffer, buffer_string)
buffer_delete(_buffer)
var json = json_parse(_string)
global.user1 = json[$ "player1_name"]
global.user2 = json[$ "player2_name"]
player1_map = json[$ "player1"]
player2_map = json[$ "player2"]
global.spectator = true
global.online = true

global.SET_ultranovas = json[$ "ultranovas_allowed"]
global.SET_blazing = json[$ "blazing_allowed"]
global.SET_gamemode = json[$ "gamemode"]
global.SET_multiswap = json[$ "multiswap_allowed"]
global.SET_hyper = json[$ "hypercubes_allowed"]
global.SET_matchless = json[$ "matchless_allowed"]
global.SET_skin = json[$ "skins"]
Gamerule_1.num_skin = global.SET_skin-1
global.SET_gamemode2 = json[$ "gamemode_val"]
global.IAMHOST = false
avalanche_turns = json[$ "avalanche_turns"]

timer_enabled = false
timer = 0
timer_end = json[$ "game_end"]
var seed = json[$ "seed"]
random_set_seed(seed)
alarm[0] = 60*3
var istop = 8
if (global.SET_gamemode == 1) 
{
	istop = 3
	for(var i=0;i<3;i++)
{
	for(var j=0;j<=7;j++)
	{
		gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
	}
}

//2) make the Gem_1s not match

do
{
	var amready2 = false
	var amready = true
	for(var i=0;i<3;i++)
	{
		for(var j=0;j<=7;j++)
		{
			if i == 1
			{
				if (gem_array[i-1,j] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i+1,j])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i-1,j]
					}
			}
			
			if j >= 1 && j <= 6
			{
				if (gem_array[i,j-1] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i,j+1])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i,j-1]
					}
			}
			
			
		}
	}
	
	//3 always have moves at start
	if amready //&& global.board_rows = 3
		{
			#region Make sure we have moves to do
			for(var i = 0; i <3; i++)
			{			
				for(var j =0; j <8; j++)
				{
					//3
					if j < 5
					{
						if gem_array[i,j] == gem_array[i,j+2] && gem_array[i,j] == gem_array[i,j+3] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//4
					if j > 2
					{
						if gem_array[i,j] == gem_array[i,j-2] && gem_array[i,j] == gem_array[i,j-3] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//5
					if (j < 7 && i < 2 && i > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] == gem_array[i+1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//6
					if (j > 0 && i < 2 && i > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i+1,j-1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//7
					if (i > 0 && j < 7 && j > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}
					//8
					if (i < 2 && j < 7 && j > 0)
					{
						if gem_array[i,j] == gem_array[i+1,j-1] && gem_array[i,j] == gem_array[i+1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}
				}
				if amready2 break;
			}
			#endregion
			if !amready2 //4) shuffle and retry loop if we fail to find matches
				{
					for(i=0;i<3;i++)
					{
						for(j=0;j<=7;j++)
						{
							gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						}
					}
				}
		}
} until (amready = true) && (amready2 = true)
}
else 
{
	//1) create gems
	var gem_array=[]
	var amready, amready2;
	for(i=0;i<istop;i++)
	{
		for(j=0;j<8;j++)
		{
			gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
		}
	}

	//2) make the Gem_1s not match
	do
	{
		amready2 = false
		amready = true
		for(var i=0;i<istop;i++)
		{
			for(var j=0;j<=7;j++)
			{
				if i >= 1 && i <= istop-2
				{
					if (gem_array[i-1,j] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i+1,j])
						{
							amready = false
							do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
							until gem_array[i,j] != gem_array[i-1,j]
						}
				}
			
				if j >= 1 && j <= 6
				{
					if (gem_array[i,j-1] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i,j+1])
						{
							amready = false
							do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
							until gem_array[i,j] != gem_array[i,j-1]
						}
				}
			
			
			}
		}
	
		//3 always have moves at start
		if amready && global.board_rows = 3
			{
				amready2 = true
				for(var j=0;j<=7;j++)
				{
				
						if j <= 6 
						{
							if (gem_array[1,j] == gem_array[2,j+1]) && (gem_array[1,j] == gem_array[0,j+1])
							{
								amready2 = false
							}
						}
						if j >= 1
						{
							if (gem_array[1,j] == gem_array[2,j-1]) && (gem_array[1,j] == gem_array[0,j-1])
							{
								amready2 = false
							}
						}
						if j <= 4
						{
							if (gem_array[1,j] == gem_array[1,j+2]) && (gem_array[1,j] == gem_array[1,j+3])
							{
								amready2 = false
							}
						}
						if j >= 3
						{
							if (gem_array[1,j] == gem_array[1,j-2]) && (gem_array[1,j] == gem_array[1,j-3])
							{
								amready2 = false
							}
						}
				
				}
				if !amready2 //4) shuffle and retry loop if we fail to find matches
					{
						for(var i=0;i<istop;i++)
						{
							for(var j=0;j<8;j++)
							{
								gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
							}
						}
					}
			}
			else amready2 = true
	} until (amready = true) && (amready2 = true)
}
var b = instance_create_depth(96, 608, Board_1.depth, SPEC_board)
b.player_id = 0
b.player_name = global.user1
b = instance_create_depth(736, 608, Board_1.depth, SPEC_board)
b.player_id = 1
b.player_name= global.user2
instance_destroy(Board_1)
instance_destroy(Board_2)
instance_destroy(obj_pbox1)
instance_destroy(obj_pbox2)
instance_destroy(player1)
instance_destroy(obj_twist_spinner)

// and now spawn them in board1
var board_1 = spectator_get_board(0)
var board_2 = spectator_get_board(1)

for(var i=0;i<istop;i++)
{
	for(var j=0;j<8;j++)
	{
		var my_x = board_1.x + 64*j
		var my_y = board_1.y - 64*(i+1)
		var my_x2 = board_2.x + 64*j
		var my_y2 = board_2.y - 64*(i+1)
		var my_skin = gem_array[i,j]
		var Gem = instance_create_depth(my_x, my_y,-1,Gem_2, {MyBoard : board_1, player_id : 0})
		var Gem2 = instance_create_depth(my_x2, my_y2,-1,Gem_2, {MyBoard : board_2, player_id : 1})
		with(Gem) 
		{
			player_id = 0
			set_skin(my_skin)
			MyGamerule = Gamerule_1
			scr_add_gemid(Gamerule_1)
		}
		with(Gem2) 
		{
			player_id = 1
			set_skin(my_skin)
			MyGamerule = Gamerule_2
			scr_add_gemid(Gamerule_2)
		}
	}
}
Gamerule_1.ONLINE_give_gem_id = true

function process_action(action_name, action_array_values, p_id, gmrl) {
	switch(action_name) {
		case "swap":
			var v1 = action_array_values[0]
			var v2 = action_array_values[1]
			var found = 0
			var gem1, gem2;
			with(Gem_2)
			{
				if (myid == v1) && (player_id == p_id)
				{
					gem1 = id
					found++
				
				}
				else if (myid == v2) && (player_id == p_id)
				{
					gem2 = id
					found++
				}
				if (found == 2) break;
			}
			do_match_simplified(gem1,gem2, gmrl)
			break;
		case "twist_swap":
			var i = 0
			var gems = []
			repeat(4)
			{
				var v = action_array_values[i]
				with(Gem_2)
				{
					if (myid == v) && (player_id == p_id)
					{
						gems[i] = id
						i++
						break;
					}
				}
			}

			var cc = action_array_values[4]
			#region SWAP
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
		case "hype_swap":
			gmrl.hypeOn = true
			break;
		case "combo":
			var c = action_array_values[0]
			with(gmrl) {matches++; combo = c; combo_check()}
			break;
		case "avalanche_gameover":
			audio_stop_all()
			audio_play_sound(vo_gameover,0,false)
			gemdrop(Gem_2, p_id)
			with(obj_avalanchedeposit_spectator) alarm[1] = 3*60
			alarm[1] = 60*8
			break;
		case "points_add":
			var c = action_array_values[0]
			with(gmrl) {points += c}
			break;
		case "style_add":
			var c = action_array_values[0]
			with(gmrl) {style += c}
			break;
		case "blaze_on":
			with(spectator_get_board(p_id)) alpha = 1
			audio_play_sound(vo_blazingspeed,0,0)
			audio_play_sound(snd_blazingspeed,0,0)
			break;
		case "avalanche_endturn":
			var g = action_array_values[0]
			with(obj_avalanchedeposit_spectator) change_turn(g)
			break;
		case "blaze_off":
			with(spectator_get_board(p_id)) alpha = 0
			break;
		case "hype_off":
			gmrl.moving = false
			gmrl.hypeOn = false
			break;
		case "ahm_setskin":
			var d = action_array_values[0]
			var sk = action_array_values[1]
			with(Gem_2) 
			{
				if (myid == d) && (player_id == p_id)
				{
					set_skin(sk)
					break;
				}
			}
			break;
		case "match_points":
			var v1 = action_array_values[0]
			var v2 = action_array_values[1]
			gmrl.points = v1
			gmrl.style = v2
			break;
		case "ahm_spawn":
			var i = action_array_values[0]
			var j = action_array_values[1]
			var sk = action_array_values[2]
			var board = spectator_get_board(p_id)
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
		case "gem_spawn":
			var j = action_array_values[0]
			var sk = action_array_values[1]
			var board = spectator_get_board(p_id)
			var g = instance_create_depth(board.x + j*64,board.y-64,-1,Gem_2, {player_id : p_id, MyGamerule : gmrl, MyBoard : board})
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
		case "gem_amexplode":
			var d = action_array_values[0]
			with(Gem_2) 
			{
				if (myid == d) && (player_id == p_id) //second condition is always true when not spectating
				{
					amexplode = true
				}
			}
			break;
		case "gem_death":
			var d = action_array_values[0]
			var crtcol = action_array_values[1]
			with(Gem_2) 
			{
				if (myid == d) && (player_id == p_id) //second condition is always true when not spectating
				{
					if amHype
					{
						skin_to_hype = action_array_values[2]
					}
					create_col = crtcol
					instance_destroy()
				}
			}		
			gmrl.GEM_ID[d] = -1
			break;
		case "gem_power":
			var d = action_array_values[0]
			var po = action_array_values[1]
			with(obj_avalanchedeposit) { if hidden_gems > 0 {hidden_gems--};event_user(0);}
			with(Gem_2) 
			{
				if (myid == d) && (player_id == p_id)
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
		case "avalanche_hidden_minus":
			with(obj_avalanchedeposit) hidden_gems--
			break;
		case "gem_power_new":
			var i = action_array_values[0]
			var j = action_array_values[1]
			var sk = action_array_values[2]
			var po = action_array_values[3]
			var board = spectator_get_board(p_id)
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
		case "match_hyper":
			with(obj_avalanchedeposit) {if hidden_gems > 0 {hidden_gems--};event_user(0);}
			var d = action_array_values[0]
			with(Gem_2) 
			{
				if (myid == d) && (player_id == p_id)
				{
					gempower = 0
					amHype = true
					break;
				}
			}
			audio_play_sound(snd_hypecreate,0,false)
			break;
		case "hyper_new":
			var board = spectator_get_board(p_id)
			var i = action_array_values[0]
			var j = action_array_values[1]
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
		case "dualhype_make":
			var d = action_array_values[0]
			with(Gem_2) if (myid == d) && (player_id == p_id) {amHype = true; skinnum = 7}
			break;
		case "avalanche_pass":
			audio_play_sound(snd_pass,0,false)
			break;
	}
}

function fast_forward_turn() {
	if array_length(avalanche_turns) == 0 return audio_play_sound(snd_lock_start, 0, false);
	var ready = true
	with(Gem_2) {
		if acc != 0 {
			ready = false
			break;
		}
	}
	if (!timer_enabled) return audio_play_sound(snd_lock_start, 0, false);
	if (!ready) return audio_play_sound(snd_lock_start, 0, false);
	
	var next_turn = avalanche_turns[0]
	var t = timer
	show_debug_message(string(t) + " -> " + string(next_turn))
	for(var i = t; i <= next_turn; i++) { //search for the next frames (from now until we swap)
		var frame_p1 = player1_map[$ i]
		var frame_p2 = player2_map[$ i]
		if !is_undefined(frame_p1) || !is_undefined(frame_p2) { //if an event is happening
			if (i != next_turn) return audio_play_sound(snd_lock_start, 0, false); //and it's the same as the event where we swap
			else { //fast forward to that event. If above is false, we wait until all other events happened first.
				audio_play_sound(snd_chat_msg, 0, false)
				timer = i
				create_textellent_winner("Fast forward")
				return;
			}
		}
	}
	
}