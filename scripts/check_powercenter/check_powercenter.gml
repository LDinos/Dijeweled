///@param hor_ver
///@param gem1
///@param gem2
if argument0 = 1 //horizontal 1, vertical 2
{
	if argument1._j = cursor_x2 //|| argument1._j = cursor_x2
	    {
			//show_debug_message("(H) Yes the flame should happen to me!")
			retxx2 = argument1.x
			retyy2 = argument1.y
	        p1 = 1
	        p2 = 0
	    }
	else
	    {
			//show_debug_message("(H) No the flame won't happen to me!")
			retxx = argument2.x
			retyy = argument2.y
	        p1 = 0
	        p2 = 1
	    }
}
else
{
	if argument1._i = cursor_y2 //|| argument1._i = cursor_y2
	    {
			//show_debug_message("(V) Yes the flame should happen to me!")
			retxx2 = argument1.x //tell the other that is not centerd to come to me
			retyy2 = argument1.y
	        p1 = 1
	        p2 = 0
	    }
	else
	    {
			//show_debug_message("(V) No the flame won't happen to me!")
			retxx = argument2.x
			retyy = argument2.y
	        p1 = 0
	        p2 = 1
	    }
}
