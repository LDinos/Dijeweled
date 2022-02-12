/// @function mouse_over(x,y,x2,y2)
/// @description Check if mouse is over the rectangle area
function mouse_over(_x,_y,x2,y2) {
	return (mouse_x >= _x && mouse_x <= x2 && mouse_y >= _y && mouse_y <= y2)
}