///@param Gamerule
///@param deposit
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
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_PASS)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
	else audio_play_sound(snd_xplier_illegal,0,false)
}