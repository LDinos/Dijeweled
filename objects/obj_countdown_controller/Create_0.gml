/// @description A gamerule-type of object for countdown. Holds info about moves made and spawning coal.
zoomalpha = 0
glowalpha = 0
depth = -10
xx = 1
yy = 1
prev_moves = 10
r1 = 1
r2 = 0
r3 = 0
alarm[1] = 30
color[0,0] = make_color_rgb(255,0,0) color[0,1] = make_color_rgb(255,150,150)
color[1,0] = make_color_rgb(220,220,220) color[1,1] = make_color_rgb(255,255,255)
color[2,0] = make_color_rgb(0,255,50) color[2,1] = make_color_rgb(120,255,50)
color[3,0] = make_color_rgb(255,255,0) color[3,1] = make_color_rgb(255,255,150)
color[4,0] = make_color_rgb(255,0,255) color[4,1] = make_color_rgb(255,150,255)
color[5,0] = make_color_rgb(255,165,0) color[5,1] = make_color_rgb(255,165,150)
color[6,0] = make_color_rgb(0,0,255) color[6,1] = make_color_rgb(150,150,255)
index = irandom(6)
moves = 10
explosion_start = false
timeup = false