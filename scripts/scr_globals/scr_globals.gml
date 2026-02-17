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
	
	global.playerDoll = doll_struct(0, 0, 0,0, 0, c_white1, c_darkBrunette, c_red, c_aqua, c_red);
	
	
	
	//Note: Make these a thing that getts looked up in INI or a DS Map or osmething idk. It shouldn't be just held in memory all the time.
	global.pants[0] = spr_dollPants0;
	global.pants[1] = spr_dollPants1;
	
	global.pants[0] = spr_dollPants0;
	global.pants[1] = spr_dollPants1;
	
	global.pants[0] = spr_dollPants0;
	global.pants[1] = spr_dollPants1;
	
	show_debug_message("Globals initialized.");
}