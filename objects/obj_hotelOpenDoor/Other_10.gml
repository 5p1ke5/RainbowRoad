/// @description Closes, if all doors are closed restarts the room.
image_index = 1;

open = false;

var _allDoorsShut = true;

for (var _i = 0; _i < instance_number(obj_hotelOpenDoor); _i++) 
{
	var _door = instance_find(obj_hotelOpenDoor, _i);
	
	with (_door)
	{
		if (open)
		{
			_allDoorsShut = false;	
		}
	}
}

if (_allDoorsShut)
{
	room_restart();
}