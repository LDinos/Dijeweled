/*

Call this script to update the presence of your app.

Arguments : 
- State (String)
- Details (String)
- Key of large image (String)
- Key of small image (String)

Returns:
- Void

-----------------------------------------

Discord Rich Presence for Game Maker made by Aouab

*/


if os_type != os_android and global._discord_allowed {
	external_call(global.__d_update,argument0,argument1,argument2,argument3)
}

