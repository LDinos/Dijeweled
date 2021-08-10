///@param sprite_index
///@param style
/// style: "fader", "stayer"
function create_text(argument0, argument1) {

		instance_destroy(obj_text_stayer)
		instance_destroy(obj_text_fader)
		if argument1 = "stayer"
		{
			text = instance_create_depth(room_width/2,844,-100,obj_text_stayer)
			text.sprite_index = argument0
		}
		else if argument1 = "fader"
		{
			text = instance_create_depth(room_width/2,844,-100,obj_text_fader)
			text.sprite_index = argument0
		}



}
