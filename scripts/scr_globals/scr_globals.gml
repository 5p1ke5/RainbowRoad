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
	
	global.shipX = 1232;
	global.shipY = 1232;
	global.shipDoorTo = room_beach;
	global.shipDoorToX = 111;
	global.shipDoorToY = 2046;
	
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
	var _faceIndex = irandom(sprite_get_number(spr_dollFace));
	var _hairIndex = irandom(sprite_get_number(spr_dollHair));
	var _shirtIndex = irandom(sprite_get_number(spr_dollShirt));
	var _pantsIndex = irandom(1);
	var _shoeIndex = irandom(1);
	
	var _skinColor = choose(c_asian1, c_white1, c_black1, c_hispanic1);
	var _hairColor = choose(c_blonde, c_brunette, c_darkBrunette, c_red);
	var _shirtColor = choose(c_red, c_blue, c_green, c_purple, c_orange, c_yellow);
	var _pantsColor = choose(c_blue, c_gray, c_green, c_navy);
	var _shoeColor = choose(c_brunette, c_green, c_red, c_black);
	
	global.playerDoll = doll_struct(_faceIndex, _hairIndex, _shirtIndex, _pantsIndex, _shoeIndex, _skinColor, _hairColor, _shirtColor, _pantsColor, _shoeColor);
	
	show_debug_message("Globals initialized.");
}