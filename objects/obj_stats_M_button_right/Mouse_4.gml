/// @description Insert description here
with(obj_stats)
{
	stats_index++
	if (stats_index >= array_length(stats_array)) stats_index = 0
	global.STATS_file = stats_array[stats_index]
	open_stats()
}
with(obj_stats_online)
{
	stats_index++
	if (stats_index >= array_length(stats_array)) stats_index = 0
	request_stats() 
}