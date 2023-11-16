// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_board_to_string(_array,first_time){
	var _string = ""
	if (first_time) //to not wait for gems to fall down
	{
		for (var i=0;i<8;i++)
		{
			for (var j=0;j<8;j++)
			{
			
				_string += string(_array[abs(i-7)][j])
			}
		}
		return _string
	}
	
	for (var i=0;i<8;i++)
	{
		for (var j=0;j<8;j++)
		{
			
			_string += string(_array[i][j].image_index)
		}
	}
	return _string
}