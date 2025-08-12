var f = "CustomQuests/"+string(global.challenge_index) + ".ini" //UNCOMMENT ME \\
ini_open(f)
	#region GENERAL
		var s = "General"
		var c = obj_CUS_general
		ini_write_real(s,"hypeallowed",c.buttons[0].value)
		ini_write_real(s,"multiswapallowed",c.buttons[1].value)
		ini_write_real(s,"illegalsallowed",c.buttons[2].value)
		ini_write_real(s,"pointsallowed",c.buttons[3].value)
		ini_write_real(s,"spawnallowed",c.buttons[4].value)
		ini_write_real(s,"AHMallowed",c.buttons[5].value)
		ini_write_real(s,"loseonnomoves",c.buttons[6].value)
		ini_write_real(s,"time",real(c.buttons[7].value))
		ini_write_real(s,"xplierallowed",c.buttons[8].value)
		ini_write_real(s,"challengeallowed",c.buttons[9].value)
		ini_write_real(s,"wheelallowed",c.buttons[10].value)
		ini_write_real(s,"skinnum",real(c.buttons[11].value))
		ini_write_real(s,"difficulty",real(c.buttons[12].value))	
		ini_write_string(s,"description",CUS_general_description.value)
		ini_write_string(s,"creator",global.user)
	#endregion
	
	#region OBJECTIVES
		var s = "Objectives"
		var i = 1
		with(CUS_objective)
		{
			ini_write_real(s,"objective_"+string(i),hover)
			ini_write_real(s,"value_"+string(i),real(text2))
			ini_write_string(s,"name_"+string(i),text)
			ini_write_real(s,"isticked_"+string(i),amticked)
			
			if image_index = 2
			{
				var str = ds_grid_write(board)
				ini_write_string(s,"board_"+string(i),str)
			}
			i++		
		}
		ini_write_real(s,"num_objectives",i-1)
	#endregion
	
	#region BOMBS
		var s = "Bombs"
		var c = obj_CUS_bombs
		ini_write_real(s,"allowed",obj_CUS_bombs.enabled)
		if obj_CUS_bombs.enabled
		{
			ini_write_real(s,"turns",real(c.buttons[0].value))
			ini_write_real(s,"counter",real(c.buttons[1].value))
			ini_write_real(s,"max",real(c.buttons[2].value))
		}
	#endregion
	
	#region DOOM
		var s = "Doom"
		var c = obj_CUS_doom
		ini_write_real(s,"allowed",obj_CUS_doom.enabled)
		if obj_CUS_doom.enabled
		{
			ini_write_real(s,"counter",real(c.buttons[0].value))
		}
	#endregion
	
	#region SKULLS
		var s = "Skulls"
		var c = obj_CUS_skulls
		ini_write_real(s,"allowed",obj_CUS_skulls.enabled)
		if obj_CUS_skulls.enabled
		{
			ini_write_real(s,"counter",real(c.buttons[0].value))
			ini_write_real(s,"max",real(c.buttons[1].value))
		}
	#endregion
	
	#region LOCKS
		var s = "Locks"
		var c = obj_CUS_locks
		ini_write_real(s,"allowed",obj_CUS_locks.enabled)
		if obj_CUS_locks.enabled
		{
			ini_write_real(s,"turns",real(c.buttons[0].value))
			ini_write_real(s,"max",real(c.buttons[1].value))
		}
	#endregion
	
	#region COALS
		var s = "Coals"
		var c = obj_CUS_coals
		ini_write_real(s,"allowed",obj_CUS_coals.enabled)
		if obj_CUS_coals.enabled
		{
			ini_write_real(s,"turns",real(c.buttons[2].value))
			ini_write_real(s,"max",real(c.buttons[3].value))
			ini_write_real(s,"random",c.buttons[0].value)
			ini_write_real(s,"chance",real(c.buttons[1].value))
		}
	#endregion
	
	#region ICE
		var s = "Ice"
		var c = obj_CUS_ice
		ini_write_real(s,"allowed",obj_CUS_ice.enabled)
		if obj_CUS_ice.enabled
		{
			ini_write_real(s,"turns",real(c.buttons[0].value))
			ini_write_real(s,"max",real(c.buttons[1].value))
		}
	#endregion
	
	#region COMPANION
		var s = "Companion"
		var c = obj_CUS_companion
		ini_write_real(s,"allowed",obj_CUS_companion.enabled)
		if obj_CUS_companion.enabled
		{
			ini_write_real(s,"num",real(c.buttons[0].value))
			ini_write_real(s,"locked",c.buttons[1].value)
		}
	#endregion	
	
	#region BOARD
		var s = "Board"
		var str = ds_grid_write(obj_CUS_board.board)
		ini_write_string(s,"board",str)
	#endregion
ini_close()