/// @description Insert description here

if Gamerule_1.blazingspeedtotalchain > 0 {
	var t = "x"+string(Gamerule_1.blazingspeedtotalchain)+" match chain";
	
	draw_set_halign(fa_center)draw_set_valign(fa_middle)draw_set_font(font0)
	
	draw_text_transformed_color(x+2,y+2,t,0.75,0.75,0,0,0,0,0,1);
	var str_w = string_width(t)*0.75, str_h = string_height(t)*0.75;
	var blaze_w = clamp(Gamerule_1.blazingspeedchain/7.5-1,0,1)*str_w
	
gpu_set_blendenable(false);
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0); 
		draw_rectangle(x-str_w,y-str_h, x+str_w,y+str_h, false);
	draw_set_alpha(1);
gpu_set_blendenable(true);

draw_text_transformed_colour(x,y,t,0.75,0.75,0,c_white,c_white,c_white,c_white,1);

gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
    draw_rectangle_colour(x-str_w/2,y-str_h/2,x+str_w/2,y+str_h/2,c_white,c_white,c_white,c_white,0);
    draw_rectangle_colour(x-str_w/2,y-str_h/2,x-str_w/2+blaze_w,y+str_h/2,$88ff,$88ff,$88ff,$88ff,0);    
draw_set_blend_mode(bm_normal);
	//draw_text_transformed_color(x,y,t,0.75,0.75,0,c_white,c_white,c_white,c_white,1);
}
