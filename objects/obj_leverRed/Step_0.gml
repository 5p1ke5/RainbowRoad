//If this instance collides with a moving carry object it's considered tripped. 
var _collision = instance_place(x, y, CARRY);

if (flicker < 0)
{
	if (variable_instance_get(_collision, "collision") == true)
	{
		if (abs(_collision.hsp) > 1) || (abs(_collision.vsp) > 1)
		{
			event_user(0);
			flicker = FLICKER_MAX/2;
		}
	}
}
else 
{
	flicker--;	
}