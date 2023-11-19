// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_board_to_string(_array){
	var _string = ""
	for (var i=0;i<8;i++)
	{
		for (var j=0;j<8;j++)
		{
			
			_string += string(_array[i][j].image_index)
		}
	}
	return _string
}