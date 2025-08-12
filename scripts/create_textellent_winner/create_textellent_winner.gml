///@description Text used in compliments
///@param text
function create_textellent_winner(argument0) {
	instance_destroy(textellenter)
	var exc = instance_create_depth(room_width/2, 512 + (room_height-512)/2,-15,textellenter)
	exc.text = argument0
	exc.alpha = 1.2
}
