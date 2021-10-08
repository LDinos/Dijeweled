/// @description Check how many gaps/empty grids we have in the board
/// @param Board_index
/// @param Gem
function check_gaps(argument0, argument1) {
	var mylist = ds_list_create()
	var yy = argument0.y
	var xx = argument0.x
	var counter;

	for(var i=0;i<8;i++) //for each vertical column
	{
		counter = collision_line_list(xx + i*64, yy - 32, xx + i*64, yy*7 + 32, argument1, false, true,mylist,true)
		gaps[@i] = 8 - counter	
	}
	ds_list_destroy(mylist)

}
