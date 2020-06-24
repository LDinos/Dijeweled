//draw_sprite_ext(spr_spinner,0,x,y,1,1,rot,c_white,1)
//draw_sprite(spr_spinnerholder,0,0,y-256)

draw_sprite_ext(spr_spinnericons,danger,x,y,1,1,rot,c_white,1)
draw_sprite(spr_newpipe_left,0,1280/2 - pipe_x,512+sprite_height/2)
draw_sprite(spr_newpipe_right,0,1280/2 + pipe_x,512+sprite_height/2)
draw_self()

//debug
/*
if green = true color = c_green
else color = c_red
draw_rectangle_colour(x-10,y-10,x+10,y+10,color,color,color,color,0)
draw_text(x,y,string_hash_to_newline(round(rot)))

