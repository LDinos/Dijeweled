/// @description Gamepad (dis)connect
var event = async_load[? "event_type"];

if (event == "gamepad discovered") || (event == "gamepad lost") {
  find_gamepad()
}