/// @description Avalanche deposit that holds how many gems to send info
// You can write your code in this editor
MYDEBUG = false
gemsmatched = 0
spawn_invs = false
doonce = true
gameover = false
num_turns = 1
ammoving = false
alpha = 1
if global.IAMHOST myturn = true
else {myturn = false; doonce = false}
gems_to_send = 1
gems_existing = 3*8
hidden_gems = 0
xdestination = x
left = 64 + sprite_width/2
right = room_width - 64 - sprite_width/2
f = 0