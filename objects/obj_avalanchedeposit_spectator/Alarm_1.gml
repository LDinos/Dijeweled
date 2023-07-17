/// @description Who won?
var txt ="PLAYER 1 WINS!";
var snd = vo_p1wins;

if (whomst_turn == 0) {
	txt = "PLAYER 2 WINS!"; 
	snd = vo_p2wins
}

create_textellent_winner(txt)
audio_play_sound(snd,0,0)

