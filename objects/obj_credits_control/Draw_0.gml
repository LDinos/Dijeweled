/// @description Insert description here
draw_self()
var offset = 128
var ydist = y-256 //+ offset
draw_sprite(spr_cred7,0,x,ydist)
ydist -= 256// +offset
draw_sprite(spr_cred6,0,x,ydist)
ydist -= 256// +offset
draw_sprite(spr_cred5,0,x,ydist)
ydist -= 256 //+offset
draw_sprite(spr_cred4,0,x,ydist)
ydist -= 256 //+offset
draw_sprite(spr_cred3,0,x,ydist)
ydist -= 256 //+offset
draw_sprite(spr_cred2,0,x,ydist)
ydist -= 256+128 //+offset
draw_sprite(spr_cred1,0,x,ydist)

if showblack
{
	draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,alpha)
	draw_set_font(font0)
	centerize_text()
	draw_text_outline_alpha(room_width/2,room_height- 512,"Congratulations! \nYou completed all Quests!",c_white,c_black,alpha2)
	//draw_sprite_ext(spr_credits0,0,0,512,1,1,0,c_white,alpha2)
}