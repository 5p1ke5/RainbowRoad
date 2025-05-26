//If this instance collides with a moving carry object it's considered tripped. 
var _collision = instance_place(x, y, CARRY);

if (_collision)
{
	if (flicker < 0)
	{
		if (_collision.collision)
		{
			//If the object is moving registers a collision.
			if (abs(_collision.hsp) > 0) || (abs(_collision.vsp) > 0)
			{
				event_user(0);
				flicker = FLICKER_MAX;
			}
		}
	}
	else 
	{
		flicker--;	
	}
}
