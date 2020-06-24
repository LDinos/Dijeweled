/// @description Sets global list for gamepads
// You can write your code in this edit
global.gp[0] = 0
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
   {
		if gamepad_is_connected(i) {global.gp[0] = i; break}
   }


