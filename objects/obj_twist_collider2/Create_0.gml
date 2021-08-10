/// @description Twist spin collision (128x128) for opponent's board. This is for the gems above to stay still
/// while the spinner is rotating
with(instance_position(x,y-33,Gem_2)) {dont_fall_yet = true;} //alarm[7] = 11}
with(instance_position(x+64,y-33,Gem_2)) {dont_fall_yet = true;}//alarm[7] = 11}

gemgotdestroyed = false
gem[0] = noone
gem[1] = noone
gem[2] = noone
gem[3] = noone
gemxxdef[0] = 0
gemyydef[0] = 0
gemxxdef[1] = 0
gemyydef[1] = 0
gemxxdef[2] = 0
gemyydef[2] = 0
gemxxdef[3] = 0
gemyydef[3] = 0
gemxx[0] = 0
gemyy[0] = 0
gemxx[1] = 0
gemyy[1] = 0
gemxx[2] = 0
gemyy[2] = 0
gemxx[3] = 0
gemyy[3] = 0
func = 0