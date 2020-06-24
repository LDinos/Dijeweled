/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_chat)
draw_set_halign(fa_left)
if client_connected
{
	//draw_text_outline(x,y,"Client connected!",c_white,c_black)
}
else if server_socket < 0
{
	draw_text_outline(x,y,"Error! Server cannot open. (Already have one?)",c_orange,c_black)
}
else
{
	draw_text_outline(x,y,"Waiting for other player to join...",c_white,c_black)
}
