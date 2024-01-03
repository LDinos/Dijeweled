// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_string_to_board(_string,_board)
{
	var i=0
	var j=0
	for (var s_i=0;s_i<string_length(_string);s_i++)
	{
		if(j>7)
		{
			i++
			j=0
		}
		_board[@ i][@ j]=real(string_char_at(_string,s_i+1))
		j++
	}
}