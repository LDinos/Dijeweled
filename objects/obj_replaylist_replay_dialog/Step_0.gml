/// @description
// Dialog canvas positions
if (!global.canbepressed) exit;
var _xstart = 736+16 + 32
var _xend = room_width - 32
var _xmiddle = _xstart + (_xend - _xstart)/2
var _ymiddle = room_height/2

// Dialog positions
var x1 = _xmiddle - dialog.width/2
var x2 = _xmiddle + dialog.width/2
var y1 = _ymiddle - dialog.height/2
var y2 = _ymiddle + dialog.height/2

var controller = obj_replaylist
var butt_width = dialog.button_upload.width
var space = (x2 - x1 - 2 * butt_width) / 3;
var center1 = x1 + space + butt_width / 2;
var center2 = center1 + butt_width + space;

var butt1_x1 = center1 - butt_width/2
var butt1_x2 = center1 + butt_width/2
var butt2_x1 = center2 - butt_width/2
var butt2_x2 = center2 + butt_width/2
var butt_vertical_pad = 16
var butt_y1 = y2 - dialog.button_upload.height - butt_vertical_pad
var butt_y2 = y2 - butt_vertical_pad

if (controller.list_type == list_types.PUBLISHED || controller.list_type == list_types.DOWNLOADED) {
	if (mouse_over(_xmiddle - butt_width/2, butt_y1, _xmiddle + butt_width/2, butt_y2)) {
		butt1_hover = true
	}
	else butt1_hover = false
}
else {
	if (mouse_over(butt1_x1, butt_y1, butt1_x2, butt_y2)) {
		butt1_hover = true
	}
	else butt1_hover = false

	if (mouse_over(butt2_x1, butt_y1, butt2_x2, butt_y2)) {
		butt2_hover = true
	}
	else butt2_hover = false
}