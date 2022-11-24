/// @description Discord Async
var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady") {
	np_registergame(DISCORD_APP_ID, "")
	global._discord_allowed = true
}





