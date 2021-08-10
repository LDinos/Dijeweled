/// @description Insert description here
draw_set_font(font0)
draw_self()
if hover {draw_sprite(spr_lob_glow2,0,x,y); draw_textbox(mouse_x,mouse_y-16,"Enables swapping while gems are falling")}
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text_transformed(x+16+margin,y+8,"Allow Multiswap",0.5,0.5,0)


