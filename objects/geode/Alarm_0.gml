if ysp < 4 ysp += 0.3/modifier
xsp-= (0.01/modifier)*sign(xsp)
if func < 1 func += 0.05/modifier
angle += lerp(0,9,power((func-1)+1,3))
angle1-= 1*modifier
angle2+= 1*modifier
alarm[0] = 3

