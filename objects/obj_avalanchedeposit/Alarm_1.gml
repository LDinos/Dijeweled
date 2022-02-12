/// @description Who won?
var txt, snd;
if myturn { //the last turn is the loser's turn
	if (global.IAMHOST) { //If im player 1 and its my turn, that means player 2 won
		txt = "PLAYER 2 WINS!"; 
		snd = vo_p2wins
	} else {
		txt = "PLAYER 1 WINS!"; 
		snd = vo_p1wins
	}
} else {
	if (global.IAMHOST) { //If im player 1 and its NOT my turn, that means that I won!
		txt = "PLAYER 1 WINS!"; 
		snd = vo_p1wins
	} else {
		txt = "PLAYER 2 WINS!"; 
		snd = vo_p2wins
	}
}

create_textellent_winner(txt)
audio_play_sound(snd,0,0)

