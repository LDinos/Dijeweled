function discord_free_app() {
	/*

	Call this script to free the application and shut it down corretly.

	Warning : It is really important to call this script before game end , otherwise the game will be still displayed on the discord.

	Arguments : 
	- Noone

	Returns:
	- Void

	-----------------------------------------

	Discord Rich Presence for Game Maker made by Aouab

	*/

	if os_type != os_android and global._discord_allowed {
		external_call(global.__d_free)
	}




}
