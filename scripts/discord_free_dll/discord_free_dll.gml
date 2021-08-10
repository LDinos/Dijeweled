/*

Call this script to free the dll files. (Optional)


Arguments : 
- Noone

Returns:
- Void

-----------------------------------------

Discord Rich Presence for Game Maker made by Aouab

*/

if os_type != os_android and global._discord_allowed {
	external_free("discord_rich_presence.dll")
}