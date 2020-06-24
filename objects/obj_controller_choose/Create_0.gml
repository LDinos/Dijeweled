/// @description Insert description here
width = 19*16
height = 12*16
instance_create(x,y+height,obj_bot_toggle)
index = 0
var gp_num = gamepad_get_device_count();
var n = 0;
options_bot[0] = "Easy"
options_bot[1] = "Medium"
options_bot[2] = "Hard"
options_bot[3] = "Expert"
options[n,0] = KEYBOARD
options[n,1] = "Keyboard"
if os_is_phone() global.bot1 = true //dissallow local multiplayer for phones
if (global.bot1 == true) 
{
	index = global.botdifficulty1
}
for (var i = 0; i < gp_num; i++;)
   {
   if gamepad_is_connected(i) {n++; options[n,0] = i; options[n,1] = gamepad_get_description(i);}
   }							//device		//description
maxindex = n;
hover = false