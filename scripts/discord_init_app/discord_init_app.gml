/*

Call this script your discord application.

Note : Call this at the right moment or after calling discord_init_dll()

Arguments : 
1 - Application Id (String)

Returns:
- Boolean (Whether successful)

-----------------------------------------

Discord Rich Presence for Game Maker made by Aouab

*/

if os_type != os_android {
	return external_call(global.__d_init,argument0)
}