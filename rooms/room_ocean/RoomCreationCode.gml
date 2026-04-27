global.starsNearby = [];
 
global.starShardsNearby = []

var _background = layer_background_get_id(layer_get_id("Background"));

if (_background)
{
	var _bgArray = [bg_beach, bg_city, bg_forest, bg_sky, bg_sunset];
	//var _bg = _bgArray[my_irandom(array_length(_bgArray) - 1)];
	var _bg = _bgArray[(global.shipY + global.shipX) mod (array_length(_bgArray) - 1)];
	layer_background_sprite(_background, _bg);
}