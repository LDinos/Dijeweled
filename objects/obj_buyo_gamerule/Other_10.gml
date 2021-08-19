/// @description Music change
if (Gamerule_1.level == 3) {
	buyo_play_music(mus_puyo2)
}
else if (Gamerule_1.level == 5) {
	if !audio_is_playing(mus_puyo2) buyo_play_music(mus_puyo2)
	 buyo_play_music(mus_puyo3)
}
else if (Gamerule_1.level >= 8) {
	if !audio_is_playing(mus_puyo2) buyo_play_music(mus_puyo2)
	if !audio_is_playing(mus_puyo3) buyo_play_music(mus_puyo3)
	if !audio_is_playing(mus_puyo4) buyo_play_music(mus_puyo4)
}
