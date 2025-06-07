/// @function spawner_initialize(_spawnObject, _interval)
/// @description Initializes variables to spawn an object at a given interval.
/// @param _spawnObject the object to be spawned.
/// @param _interval The cooldown time between spawns.
function spawner_initialize(_spawnObject, _interval)
{
	spawnObject = _spawnObject;
	spawnTimer = -1;
	spawnTimerInterval = _interval;
}



/// @function spawner_step(_x, _y)
/// @description Increments timer, spawns objects when it goes off. Returns instance created if one was created, or undefined if not.
/// @param _x X coordinate to spawn objects at.
/// @param _y Y coordinate to spawn objects at.
/// @param _depth Depth to spawn objects at.
function spawner_step(_x, _y, _depth)
{
	//Counts down timer until -1
	if (spawnTimer > -1)
	{
		spawnTimer--;
	}
	else //At -1 resets timer and creates an isntance of spawnObject.
	{	
		spawnTimer = spawnTimerInterval;
		
		var _instance = instance_create_depth(_x, _y, _depth, spawnObject);	
		
		return _instance;
	}
	
	return undefined;
}