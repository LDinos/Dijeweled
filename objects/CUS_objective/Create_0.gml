/// @description Insert description here
image_speed = 0
on_focus = false
objective = -1 //0 - 46
min_val = 1
max_val = 9999999
text = ""
text2 = "1"
blink = ""
alarm[1] = 30
hover = 0 //0 - 1 for pencil only
hasinput = false
hastickbox = false
amticked = false
texttickbox = ""
board = ds_grid_create(8,8)
for(var i =0; i<8; i++)
	{
		for(var j =0; j<8; j++)
		{
			board[# i,j] = -1
		}
	}