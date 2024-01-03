/// @description Text fade out
text_alpha -= text_fadeout_speed
logo_current_y = lerp(logo_current_y, logo_end_y, 1-text_alpha)
if (text_alpha > 0) alarm[2] = 1
else {
	audio_stop_all()
	room_goto(rm_menu)
}










