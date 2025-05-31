/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.maxHP = 3;
	global.hp = global.maxHP;
	
	//The object currently being carried between rooms.
	global.carried = noone;
	
	global.bgm = noone;
	
	global.redShards = 0;
	
	global.spawnX = undefined;
	global.spawnY = undefined;
	
	show_debug_message("Globals initialized.");
}