function transition_initialize(_spawnX, _spawnY, _roomTo)
{
	spawnX = _spawnX;
	spawnY = _spawnY;
	roomTo = _roomTo;
}

function transition_goto(_spawnX, _spawnY, _roomTo)
{
	global.spawnX = _spawnX;
	global.spawnY = _spawnY;
	room_goto(roomTo);
}