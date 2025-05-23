///@function instance_place_array(_x, _y, _object, _ordered)
///@description Copy of instance_place_list but outputs an array instead.
///@param _x x coordinate to check for collisions at.
///@param _y y coordinate to check for collisions at.
///@param _obj Object asset or object instance or tile map or array of instances to check for.
///@param _ordered True or false if the array should be ordered.
function instance_place_array(_x, _y, _obj, _ordered)
{
	var _list = ds_list_create(); //The list that will be populated.
	var _items = instance_place_list(_x, _y, _obj, _list, _ordered); //Populated the list with items.
	var _array = []; //The array that will be filled.
	
	//Copies the _list to _array.
	for (var _i = 0; _i < _items; _i++) 
	{
		_array[_i] = ds_list_find_value(_list, _i);
	}
	
	ds_list_destroy(_list);
	
	return _array;
}


///@function collision_rectangle_array(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _ordered)
///@description Copy of collision_rectangle_array but outputs an array instead.
///@param _x1 x1 coordinate to check for collisions at, left side.
///@param _y1 y1 coordinate to check for collisions at, top side.
///@param _x2 x2 coordinate to check for collisions at, right side.
///@param _y2 y2 coordinate to check for collisions at, bottom side.
///@param _obj Object asset or object instance or tile map or array of instances to check for.
///@param _prec If the collision is precise.
///@param _notme If the collision should check the calling instance, if applicable.
///@param _ordered True or false if the array should be ordered.
function collision_rectangle_array(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _ordered)
{
	var _list = ds_list_create();
	var _items = collision_rectangle_list(_x1, _y1, _x2, _y2, _obj, _prec, _notme, _list, _ordered);
	var _array = [];
	
	//Copies the _list to _array.
	for (var _i = 0; _i < _items; _i++) 
	{
		_array[_i] = ds_list_find_value(_list, _i);
	}
	
	ds_list_destroy(_list);
	
	return _array;
	
}