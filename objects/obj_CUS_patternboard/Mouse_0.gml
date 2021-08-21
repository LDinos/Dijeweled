/// @description Insert description here
var xx = x-32
var yy = y-32

var i = (mouse_y - yy) div 64
var j = (mouse_x - xx) div 64
if gem_selection != 8 board[i,j] = gem_selection
else board[i,j] = -1