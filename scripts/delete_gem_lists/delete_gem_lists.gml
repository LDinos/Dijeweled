///@description When deleting gems without activating destroy event, list gets undefined. At this case use this
function delete_gem_lists() {
	for(i=0;i<8;i++)
		{
			for(j=0;j<8;j++)
			{
				gems_fallen[i][j] = noone
				gems_id_array[i][j] = noone
				gems_skin_array[i][j] = -1
			}
		}


}
