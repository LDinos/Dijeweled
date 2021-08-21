/// @description Fill one gap
alarm[0] = -1
if fill_to_go >= 256
{
	event_user(1)
}
def_filler = fill_to_go
fill_to_go += bar_gap
perc = 0
alarm[0] = 1
