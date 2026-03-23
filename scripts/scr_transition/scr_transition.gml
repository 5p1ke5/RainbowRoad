/// @function transition_initialize(_roomTo, _spawnX, _spawnY, _spawnHsp, _spawnVsp, _locked, _price)
/// @description Initializes variables for a room transition.
/// @param _roomTo Index of the room the player will be sent to.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _spawnHsp hsp the player will be spawned with.
/// @param _spawnVsp vsp the player will be spawned with.
/// @param _locked If the door is considered locked.
/// @param _price The amount the player has to pay to go through the door.
function transition_initialize(_roomTo, _spawnX, _spawnY, _spawnHsp = 0, _spawnVsp = 0, _locked = false, _price = 0)
{
	roomTo = _roomTo;
	spawnX = _spawnX;
	spawnY = _spawnY;
	spawnHsp = _spawnHsp;
	spawnVsp = _spawnVsp;
	locked = _locked;
	price = _price;
	
	//If you need the door to sorta stay unlocked you can do something like this in the creation code...
	/*
	if (locked)
	{
		locked = (global.roomPrev != roomTo);	
	}
	*/
}

/// @function transition_goto(_roomTo, _spawnX, _spawnY, _spawnHsp, _spawnVsp)
/// @param _roomTo Index of the room the player will be sent to.
/// @description Saves variables to global, sends player to next room.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _spawnHsp hsp the player will be spawned with
/// @param _spawnVsp vsp the player will be spawned with
function transition_goto(_roomTo, _spawnX, _spawnY, _spawnHsp = 0, _spawnVsp = 0)
{
	global.spawnX = _spawnX;
	global.spawnY = _spawnY;
	global.spawnHsp = _spawnHsp;
	global.spawnVsp = _spawnVsp;
	
	//If there's a player object in the room tries to save their carried object to global.
	if (PLAYER)
	{
		with (PLAYER)
		{
			if (myCarry)
			{
				global.carried = serialize_instance(myCarry);	
			}
			else
			{
				global.carried = noone;	
			}
		}
	}
	
	global.roomPrev = room;
	
	room_goto(_roomTo);
}