///@param Gamerule
///@param deposit
function pass(argument0, argument1) {
	var gmr = argument0
	var deposit = argument1
	if !global.paused
	{
		if gmr.IsGemActive2 && deposit.gems_existing < 64
		{
			delay = 60
			with(obj_avalanchedeposit) {avalanche_end_turn(Board_2,Gem_2); ammoving = true; Gamerule_1.controlallowed = false}
			with(obj_avalanchedeposit_local) 
			{
				var gmrl = Gamerule_1
				var b = Board_local
				var g = Gem_local
				if !myturn {gmrl = Gamerule_local; b = Board_1; g = Gem_1}
				avalanche_end_turn(b,g); 
				//ammoving = true; 
				gmrl.controlallowed = false

			
			}
			audio_play_sound(snd_pass,0,false)
			network_send(NN_MATCH_AVALANCHE_PASS)
		}
		else audio_play_sound(snd_xplier_illegal,0,false)
	}


}
