//draw_self()
draw_set_font(font0)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var ip_text = hide_ip ? field_converted : field
draw_text_transformed(636,392,string_hash_to_newline(ip_text + blink),1,1,0)
//draw_text(room_width/2,16,keyboard_lastchar)
if (os_type != os_android) {
	draw_text(room_width/2,room_height-20,"(Press Right Click to Paste)")
	draw_text(room_width/2,room_height-48,"(Press Middle Click to hide IP)")
}