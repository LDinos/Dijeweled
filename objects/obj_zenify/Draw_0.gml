/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_zenifyback,0,x,y)

var target_angle = index_temp * 360 / 99;

draw_primitive_begin(pr_trianglelist);

var c_pie = Gamerule_1.zenify ? c_rainbow : $88FF;
for(i=0;i<32;i++)
{
	draw_vertex_color(x,y,c_pie,1);
	var a1 = 90+target_angle*i/32;
	var a2 = 90+target_angle*(i+1)/32;
	draw_vertex_color(x+lengthdir_x(72,a1),y+lengthdir_y(72,a1),c_pie,1);
	draw_vertex_color(x+lengthdir_x(72,a2),y+lengthdir_y(72,a2),c_pie,1);
}
draw_primitive_end();

draw_self()
draw_set_font(font0)
centerize_text()
if !cooldown draw_text_color(x,y,"ZENIFY",c_rainbow,c_rainbow,c_rainbow,c_rainbow,1)
else draw_text_color(x,y,string(zenify_points_temp),c_rainbow,c_rainbow,c_rainbow,c_rainbow,1)