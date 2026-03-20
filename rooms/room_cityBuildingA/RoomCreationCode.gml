 bgm_play(bgm_cityInside); 
 
 
//track starts at x = 1000, ends at x = 2560

//coins will be placed in 2x2 clusters in 300 horizontal sectors, each one 50 - 250 into each sector

//Clusters can be placed at 656 at highest, 720 at lowest
 
var _startX = 1200;
var _sectorNumber = 5;
var _sectorWidth = 300;
 
for (var _i = 0; _i < _sectorNumber; _i++) 
{    
	var _x = _startX + (_i * _sectorWidth) - irandom_range(50, 250);
	var _y = 656+ (16 * irandom(4));
	show_debug_message("x: " + string(_x) + " - y: " + string(_y));
	
	//Makes a cluster of coins.
	instance_create_layer(_x, _y, "Collectables", obj_money)
	instance_create_layer(_x + 16, _y, "Collectables", obj_money)
	instance_create_layer(_x, _y + 16, "Collectables", obj_money)
	instance_create_layer(_x + 16, _y + 16, "Collectables", obj_money)
	
}