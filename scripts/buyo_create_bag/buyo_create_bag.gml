function buyo_create_bag(){
	var bag = ds_list_create()
	bag_size = 0;
	for(var i = 0; i <= 4; i++) {
		for(var j = 0; j <= 4; j++) {
			var strct = {gem1a : i, gem1b : j}
			bag[| bag_size++] = strct
		}
	}
	ds_list_shuffle(bag)
	var array = -1;
	for(var i = 0; i < ds_list_size(bag); i++) {
		array[i] = bag[| i]
	}
	ds_list_clear(bag)
	return array;
}