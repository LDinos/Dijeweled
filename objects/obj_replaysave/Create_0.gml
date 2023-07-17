/// @description Insert description here
x = 416
y = 320
image_speed = 0
text2 = ""
instance_create_depth(x + 32, y + sprite_height - sprite_get_height(spr_cancel),depth-1,obj_replaysave_continue)
instance_create_depth(x + sprite_width - 32 - sprite_get_width(spr_cancel),y + sprite_height - sprite_get_height(spr_cancel),depth-1,obj_replaysave_cancel)
flick = ""
text = ""
alarm[0] = 30