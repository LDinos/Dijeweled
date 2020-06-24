///@description Text used in compliments
///@param text
var board = Board_1;
if (iam == Gamerule_local) board = Board_local;
instance_destroy(complimenter)
var exc = instance_create_depth(board.x + 32 + board.sprite_width/3 ,board.y + 32 + board.sprite_height/3,-15,complimenter)
exc.image_index = argument0