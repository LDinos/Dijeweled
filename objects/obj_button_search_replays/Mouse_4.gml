/// @description Insert description here
if (!visible) exit;
var controller = obj_replaylist
if (!global.canbepressed || controller.network_failed || controller.network_loading) exit;

if (obj_replaylist.filter == "") {
	global.canbepressed = false
	var d = create_dialog("Enter replay ID", obj_replaylist.search)
	var b_coords = d.get_button_coords()
	var button_width = 128
	var button_height = 48
	var b = create_button(b_coords.x - button_width/2, b_coords.y - button_height/2, d.depth-1, button_width, button_height, "SEARCH", d.enter)
	d.button = b
}
else obj_replaylist.search("")

