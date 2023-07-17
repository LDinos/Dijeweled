/// @description Gamerule that keeps future gems and the rules of the game
bag_size = 0; //Size of the gem bag to use
bag_index = 0; //Where in the bag are we right now?
gem_bag = buyo_create_bag()
gem1a = gem_bag[0].gem1a //center gem
gem1b = gem_bag[0].gem1b //outer gem
base_music = audio_play_sound(mus_puyobase,0,1)
check = false
Gamerule_1.xplier = 10
with(Board_1) sprite_index = spr_board_alternate
buyo_spawn_gems()
