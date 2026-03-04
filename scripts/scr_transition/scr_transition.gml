/// @function transition_initialize(_spawnX, _spawnY, _roomTo)
/// @description Initializes variables for a room transition.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _roomTo Index of the room the player will be sent to.
/// @param _locked If the door is considered locked.
function transition_initialize(_spawnX, _spawnY, _roomTo, _locked = false)
{
	spawnX = _spawnX;
	spawnY = _spawnY;
	roomTo = _roomTo;
	locked = _locked;
	
	//If you need the door to sorta stay unlocked you can do something like this in the creation code...
	/*
	if (locked)
	{
		locked = (global.roomPrev != roomTo);	
	}
	*/
}

/// @function transition_goto(_spawnX, _spawnY, _roomTo)
/// @description Saves variables to global, sends player to next room.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _roomTo Index of the room the player will be sent to.
function transition_goto(_spawnX, _spawnY, _roomTo)
{
	global.spawnX = _spawnX;
	global.spawnY = _spawnY;
	
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