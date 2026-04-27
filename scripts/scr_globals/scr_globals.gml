/// @function globals_initialize()
/// @description Initializes the game's global variabls.
function globals_initialize()
{
	global.maxHP = STARTING_HP;
	global.hp = global.maxHP;
	
	global.money = 0;
	
	//The object currently being carried between rooms.
	global.carried = noone;
	
	//These may be moved to a file but for now reading from memory is fine.
	global.bgm = noone;
	global.spawnX = undefined;
	global.spawnY = undefined;
	global.spawnHsp = undefined;
	global.spawnVsp = undefined;
	
	global.shipX = 416;
	global.shipY = 512;
	global.shipDoorTo = room_beach;
	global.shipDoorToX = 32;
	global.shipDoorToY = 2016;
	
	global.roomPrev = ROOM_TITLE;
	global.roomPausedFrom = noone;
	
	
	global.starShardsNearby = [];
	global.starShardsFound = array_create(20, false);
	
	global.starsNearby = [];
	global.starsFound = array_create(3, false);
	
	global.flagSasquatchDefeated = false;
	global.flagTreasureFound = false;
	global.flagWifeFound = false;
	global.flagHusbandFound = false;
	global.flagSonFound = false;
	
	
	//global.playerDoll = doll_struct(0, 0, 0,0, 0, c_white1, c_darkBrunette, c_red, c_aqua, c_red);
	var _faceIndex = my_irandom(sprite_get_number(spr_dollFace));
	var _hairIndex = my_irandom(sprite_get_number(spr_dollHair));
	var _shirtIndex = my_irandom(sprite_get_number(spr_dollShirt));
	var _pantsIndex = my_irandom(1);
	var _shoeIndex = my_irandom(1);
	
	var _skinColor = my_choose([c_asian1, c_white1, c_black1, c_hispanic1]);
	var _hairColor = my_choose([c_blonde, c_brunette, c_darkBrunette, c_red]);
	var _shirtColor = my_choose([c_red, c_blue, c_green, c_purple, c_orange, c_yellow]);
	var _pantsColor = my_choose([c_blue, c_gray, c_green, c_navy]);
	var _shoeColor = my_choose([c_brunette, c_green, c_red, c_black]);
	
	global.playerDoll = doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor);
	
	show_debug_message("Globals initialized.");
}