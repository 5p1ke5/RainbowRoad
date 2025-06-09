/// @function transition_initialize(_spawnX, _spawnY, _roomTo)
/// @description Initializes variables for a room transition.
/// @param _spawnX X postiion the player will be spawned at in the room.
/// @param _spawnY Y postiion the player will be spawned at in the room.
/// @param _roomTo Index of the room the player will be sent to.
function transition_initialize(_spawnX, _spawnY, _roomTo)
{
	spawnX = _spawnX;
	spawnY = _spawnY;
	roomTo = _roomTo;
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
	
	room_goto(roomTo);
}