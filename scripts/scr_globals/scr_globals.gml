/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.maxHP = 3;
	global.hp = global.maxHP;
	global.music = noone;
	
	global.spawnX = undefined;
	global.spawnY = undefined;
	
	show_debug_message("Globals initialized.");
}