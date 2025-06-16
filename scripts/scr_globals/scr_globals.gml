/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.maxHP = STARTING_HP;
	global.hp = global.maxHP;
	
	//The object currently being carried between rooms.
	global.carried = noone;
	
	global.bgm = noone;
	
	global.redShards = 0;
	global.shardsFound = array_create(4, false);
	
	global.stars = 0;
	
	global.spawnX = undefined;
	global.spawnY = undefined;
	global.roomPrev = ROOM_TITLE;
	
	show_debug_message("Globals initialized.");
}