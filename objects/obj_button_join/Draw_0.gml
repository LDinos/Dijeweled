/// @description Insert description here
centerize_text() //make v_align and h_align centred
draw_set_font(font0_big)
	var xx = room_width / 2 + 128
	var yy = 48
	draw_text_outline(xx,yy,"ONLINE HELP",c_orange,c_black)
draw_set_font(font0)
	yy = 128
	draw_text_outline(xx,yy,"If you want to HOST, either port forward your IP or have a Hamachi \n"
						+ "network. To Port Forward (you need to do Steps 1 to 6 only once):",c_white,c_black)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
	yy+=64
	xx = room_width / 2 - 240
	draw_text_outline(xx,yy,"1) Press the WinKey + R, type 'cmd' and press enter \n"
	+ "2) In the console, type 'ipconfig' and press enter \n"
	+ "3) Remember the IPV4 address and the Default Gateway \n"
	+ "4) Copy the Default Gateway and type it in your browser's URL \n"
	+ "5) A username and password will be asked, the most possible \ncombination is 'admin' for both. Else, try leaving them blank \n"
	+ "6) In your router settings click on the Port Forward tab and finally \nenter your IPV4 adress, using the ports 6969. If you \ncan't find Port Forward, conduct your router's manual \n"
	+ "7) Now, Google 'my IP' and find a website that tells you your IP \n"
	+ "8) Host in Dijeweled and tell your friend to join with that IP"
	,c_white,c_black)
centerize_text()
//draw_sprite(spr_onlinehelp,0,0,0)
var x_center,y_center;
x_center = x + sprite_width/2 //center in x axis
y_center = y + sprite_height/2 //center in y axis


draw_set_font(font0)
draw_self()
draw_text(x_center,y_center,"JOIN")