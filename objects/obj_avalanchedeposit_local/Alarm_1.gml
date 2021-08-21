/// @description Who won?
if myturn //last turn was p1's, so he lost
{
	create_textellent_winner("PLAYER 2 WINS!")
	audio_play_sound(vo_p2wins,0,0)
}
else
{
	create_textellent_winner("PLAYER 1 WINS!")
	audio_play_sound(vo_p1wins,0,0)
}
