/// @description Insert description here
if hastickbox
{
	if (mouse_x >= x+8 && mouse_x <= x+24) && (mouse_y >= y+ sprite_height/2 && mouse_y <= y+ sprite_height/2 +16) && obj_CUS_general.canclick
	{
		amticked = !amticked
	}
}
if image_index = 2
{
	if (mouse_x > x + sprite_width-32) && obj_CUS_general.canclick
	{
		obj_CUS_general.canclick = false
		var bo = instance_create_depth(obj_CUS_board.x,obj_CUS_board.y,-10,obj_CUS_patternboard)
		for(var i =0; i<8; i++)
		{
			for(var j =0; j<8; j++)
			{
				bo.board[i,j] = board[# i,j]
			}
		}
		bo.index = index
		instance_create_depth(obj_CUS_gems.x,obj_CUS_gems.y,-11,obj_CUS_patterngems)
		instance_create_depth(obj_CUS_board.x - 32 + 512/2, obj_CUS_board.y+512,-11,obj_patternconfirm)
	}
}