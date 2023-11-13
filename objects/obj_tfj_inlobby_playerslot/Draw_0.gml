draw_self()
var ready_text = host ? " (HOST)" : (ready_status ? " - READY" : " - NOT READY")
var display_text = (name == "") ? name : name + ready_text
var c= c_black
draw_text_color(x+sprite_width/2,y+sprite_height/2,display_text,c,c,c,c,1)




