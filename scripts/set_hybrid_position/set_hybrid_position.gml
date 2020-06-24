///Sets the position of the selector to the mouse position, as long as the selector is invisible (hybrid movements)
///Used when mouse and keyboard controls are used at the same time
///@param Board
var Board = argument0
if !visible && (gem1 == noone)
{
	if position_meeting(mouse_x,mouse_y,Board)
	{			
		xlim = (mouse_x-Board.x+32) div 64
		ylim = (mouse_y-Board.y+32) div 64
		x = Board.x + 64*xlim -32
		y = Board.y + 64*ylim -32
	}
}