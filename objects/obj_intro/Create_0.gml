/// @description
function get_day_text() {
	var day = date_get_weekday(date_current_datetime())
	switch(day) {
		case 0:
			return "It's Sunday, go have fun and enjoy your weekend!"
		case 1:
			return "Ew, Mondays..."
		case 2:
			return "It's Tuesday, YIIIIKES"
		case 3:
			return "It's Wednesday, we're halfway there..."
		case 4:
			return "Heeey, it's Thursday, not bad, not bad"
		case 5:
			return "Friday is here, make it one of the best"
		case 6:
			return "Saturdays are the best, but they feel the shortest...?"
	}
}

text_list = [
	"A wise person once said 'INCREDIBLE' and the world hasn't been the same ever since",
	"TIP: Lock and Ice gems can spawn even on unmatching swaps!",
	"TIP: Cascades give lots of points, so wait them out to finish before swapping!",
	"TIP: Use the mentality that bombs will gameover you on 0 countdown, so you will play safer!",
	"TIP: Keep your hypercubes safe as much as possible in Classic, so you won't run out of moves.",
	"TIP: Skulls instantly spawn before your next match finishes. Don't get confused!",
	get_day_text()
]
audio_play_sound(mus_intro, 0, true)

logo_fadein_speed = 0.05
text_fadein_speed = 0.01
text_fadeout_speed = 0.025

logo_alpha = 0
logo_default_y = room_height/2 - sprite_get_height(spr_logo)/2
logo_end_y = 0
logo_current_y = logo_default_y

text_alpha = 0
text = text_list[irandom(array_length(text_list)-1)]

glow_width = 128
current_glow_x = 0
glow_end = sprite_get_width(spr_logo) + glow_width
glow_speed = 64
steady_glow_alpha = 0
canclick = false
alarm[3] = 120
alarm[0] = 30 // Start Fading in logo after 0.5 seconds
alarm[1] = 90 // Start Fading in bottom text