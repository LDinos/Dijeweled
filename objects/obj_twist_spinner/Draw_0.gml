/// @description Insert description here
if pos_i != -1 && pos_j != -1
{
	draw_sprite_ext(spr_spinner2,touchedCCW,x,y,1,1,rot,c_white,1)
	draw_self()
}

if (os_type == os_android) {
	draw_rectangle_colour(buttonX,buttonY,buttonX+buttonW,buttonY+buttonH,0,0,0,0,0)
	var c = touchedCCW ? [c_teal,c_teal] : [$202020,$101010];
	draw_rectangle_colour(buttonX+4,buttonY+4,buttonX+buttonW-4,buttonY+buttonH-4,c[0],c[0],c[1],c[1],0)

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(font0)
	draw_text(buttonX+buttonW/2,buttonY+buttonH/2, touchedCCW ? "COUNTERCLOCKWISE" : "CLOCKWISE");
}