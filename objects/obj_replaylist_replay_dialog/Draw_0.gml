/// @description
if (file == -1) exit;
var controller = obj_replaylist

// Dialog canvas positions
var _xstart = 736+16 + 32
var _xend = room_width - 32
var _xmiddle = _xstart + (_xend - _xstart)/2
var _ymiddle = room_height/2

// Dialog positions
var x1 = _xmiddle - dialog.width/2
var x2 = _xmiddle + dialog.width/2
var y1 = _ymiddle - dialog.height/2
var y2 = _ymiddle + dialog.height/2
var c = DARK_GRAY

draw_rectangle_color(x1, y1, x2, y2, c,c,c,c, false)

// Description positions
var text_x = x1 + 16
var text_y = y1
var text_offset = 32
var texts = [dialog.title, dialog.author, dialog.time, dialog.gamemode, dialog.date, dialog.points]
var text_variables = [file.title, file.author, file.time, file.gamemode, file.date, file.score]
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

for(var i = 0; i < array_length(texts); i++) {
	if (file.gamemode != "Blitz" && i == array_length(texts)-1) break; //dont show score for multiplayer replays
	var back_rectangle_c = (i%2 == 0) ? MEDIUM_GRAY : BLACK_GRAY
	draw_rectangle_color(x1, text_y-16 + text_offset*i, x2, text_y+16 + text_offset*i, back_rectangle_c,back_rectangle_c,back_rectangle_c,back_rectangle_c,false)
	draw_text_transformed(text_x, text_y + text_offset*i, texts[i] + " " + string(text_variables[i]), 0.75, 0.75, 0)
}


// Button positions, align them evenly horizontally (like in css space-around)
var butt1_c = COLOR_BLUEBERRY_BUTTON
var butt2_c = COLOR_GREEN_BUTTON
var butt_width = dialog.button_upload.width
var butt_height = dialog.button_upload.height
var space = (x2 - x1 - 2 * butt_width) / 3;
var center1 = x1 + space + butt_width / 2;
var center2 = center1 + butt_width + space;

var butt1_x1 = center1 - butt_width/2
var butt1_x2 = center1 + butt_width/2
var butt2_x1 = center2 - butt_width/2
var butt2_x2 = center2 + butt_width/2
var butt_vertical_pad = 16
var butt_y1 = y2 - butt_height - butt_vertical_pad
var butt_y2 = y2 - butt_vertical_pad
draw_set_halign(fa_center)

if (controller.list_type == list_types.LOCAL || controller.list_type == list_types.MULTIPLAYER) {
	draw_rectangle_color(butt1_x1, butt_y1, butt1_x2, butt_y2, butt1_c,butt1_c,butt1_c,butt1_c, false)
	draw_sprite_ext(spr_black, 1, butt1_x1, butt_y1, butt_width, butt_height, 0, c_white, (butt1_hover)*0.4)
	draw_text(center1, butt_y1 + (butt_y2-butt_y1)/2, "UPLOAD")
	draw_rectangle_color(butt2_x1, butt_y1, butt2_x2, butt_y2, butt2_c,butt2_c,butt2_c,butt2_c, false)
	draw_sprite_ext(spr_black, 1, butt2_x1, butt_y1, butt_width, butt_height, 0, c_white, (butt2_hover)*0.4)
	draw_text(center2, butt_y1 + (butt_y2-butt_y1)/2, "WATCH")
}
else if (controller.list_type == list_types.PUBLISHED) {
	draw_rectangle_color(_xmiddle - butt_width/2, butt_y1, _xmiddle + butt_width/2, butt_y2, butt1_c,butt1_c,butt1_c,butt1_c, false)
	draw_sprite_ext(spr_black, 1, _xmiddle - butt_width/2, butt_y1,butt_width, butt_height, 0, c_white, (butt1_hover)*0.4)
	draw_text(_xmiddle,butt_y1 + (butt_y2-butt_y1)/2, "DOWNLOAD")
}
else if (controller.list_type == list_types.DOWNLOADED) {
	draw_rectangle_color(_xmiddle - butt_width/2, butt_y1,  _xmiddle + butt_width/2, butt_y2, butt2_c,butt2_c,butt2_c,butt2_c, false)
	draw_sprite_ext(spr_black, 1, _xmiddle - butt_width/2, butt_y1,butt_width, butt_height, 0, c_white, (butt1_hover)*0.4)
	draw_text(_xmiddle, butt_y1 + (butt_y2-butt_y1)/2, "WATCH")
}