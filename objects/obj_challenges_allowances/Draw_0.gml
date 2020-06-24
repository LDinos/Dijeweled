/// @description Insert description here
// You can write your code in this editor
draw_self()
if madeby != "-"
{
	centerize_text()
	draw_text_outline_transformed(1280-32-122,192-64,"By " + madeby,c_white,c_black,0.5)
}
centerize_text()
draw_set_font(font0)
for(var i=0;i<4;i++)
{
	var showtick = false
	var ind = 0
	if AR_info[i] == "tick" || AR_info[i] == 1
	{
		showtick = true
		ind = 0		
	}
	else if AR_info[i] == "untick" || AR_info[i] == 0
	{
		showtick = true
		ind = 1
	}
	
	if showtick draw_sprite(spr_tick,ind,1208,192 +i*32)
	else draw_text(1208,192 +i*32,AR_info[i])
}
//GAP HERE
for(var i=4;i<11;i++)
{
	var showtick = false
	var ind = 0
	if AR_info[i] == "tick" || AR_info[i] == 1
	{
		showtick = true
		ind = 0		
	}
	else if AR_info[i] == "untick" || AR_info[i] == 0
	{
		showtick = true
		ind = 1
	}
	
	if showtick draw_sprite(spr_tick,ind,1208,192 +(i+1)*32)
	else draw_text(1208,192 +(i+1)*32,AR_info[i])
}
//TIME HERE
var showtick = false
	var ind = 0
	if AR_info[11] == "tick"
	{
		showtick = true
		ind = 0		
	}
	else if AR_info[11] == "untick" || AR_info[11] == 0
	{
		showtick = true
		ind = 1
	}
	
	if showtick draw_sprite(spr_tick,ind,1208,192+8 +(11+1)*32)
	else draw_text(1208,192+8 +(11+1)*32,convert_seconds_to_time(round(AR_info[11])))

draw_sprite(spr_chl_difficulty,AR_info[12],0,0)