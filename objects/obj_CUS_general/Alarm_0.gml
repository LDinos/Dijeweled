/// @description Insert description here
//var filename = program_directory +"/CustomQuests/"+string(global.challenge_index)+".ini"
if file_exists(filename)
{
	ini_open(filename)
		var s = "General"
		CUS_general_hypercubes.enabled = ini_read_real(s,"hypeallowed",0)
		 CUS_general_hypercubes.image_index = CUS_general_hypercubes.enabled
		CUS_general_multiswap.enabled = ini_read_real(s,"multiswapallowed",0)
		 CUS_general_multiswap.image_index = CUS_general_multiswap.enabled
		CUS_general_matchless.enabled = ini_read_real(s,"illegalsallowed",0)
		 CUS_general_matchless.image_index = CUS_general_matchless.enabled
		CUS_general_points.enabled = ini_read_real(s,"pointsallowed",0)
		 CUS_general_points.image_index = CUS_general_points.enabled 
		CUS_general_spawn.enabled = ini_read_real(s,"spawnallowed",0)
		 CUS_general_spawn.image_index = CUS_general_spawn.enabled
		CUS_general_ahm.enabled = ini_read_real(s,"AHMallowed",0)
		 CUS_general_ahm.image_index = CUS_general_ahm.enabled
		CUS_general_loseonno.enabled = ini_read_real(s,"loseonnomoves",0)
		 CUS_general_loseonno.image_index = CUS_general_loseonno.enabled
		CUS_general_time.value = string(ini_read_real(s,"time",0))
		CUS_general_difficulty.value = string(ini_read_real(s,"difficulty",0))
		CUS_general_xplier.enabled = ini_read_real(s,"xplierallowed",0)
		 CUS_general_xplier.image_index = CUS_general_xplier.enabled
		CUS_general_chlbonus.enabled = ini_read_real(s,"challengeallowed",0)
		 CUS_general_chlbonus.image_index = CUS_general_chlbonus.enabled
		CUS_general_wheel.enabled = ini_read_real(s,"wheelallowed",0)
		 CUS_general_wheel.image_index = CUS_general_wheel.enabled
		//CUS_general_undo.enabled = ini_read_real(s,"undoallowed",0)
		// CUS_general_undo.image_index = CUS_general_undo.enabled
		CUS_general_skins.value = string(ini_read_real(s,"skinnum",0))
		CUS_general_description.value = ini_read_string(s,"description","")
	ini_close()
}