/// @description
function find_gamepad() {
	gamepad_id = noone
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		if (gamepad_is_connected(i)) {
			gamepad_id = i
			break;
		}
	}
}
gamepad_id = noone
find_gamepad()