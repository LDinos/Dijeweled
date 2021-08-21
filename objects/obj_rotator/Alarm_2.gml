/// @description Who won?
var p1 = obj_scorer1
var p2 = obj_scorer2
var winner = 0
var n1 = 0;
var n2 = 0;
for(var i = 0; i < 3; i++)
{
	if p1.win[i] == 1 n1++
	if p2.win[i] == 1 n2++
}

if (n1 > n2) winner = 1
else if (n1 < n2) winner = 2

if winner = 1
{
	audio_play_sound(vo_p1wins,0,0)
	create_textellent_winner("PLAYER 1 WINS!")
}
else if winner = 2
{
	audio_play_sound(vo_p2wins,0,0)
	create_textellent_winner("PLAYER 2 WINS!")
}
else
{
	create_textellent_winner("DRAW!")
}