//If this instance collides with a moving carry object it's considered tripped. 
var _collisions = hitbox_step_instance_array();

if (array_length(_collisions) > 0)
{
	var _collision_check = function (element, index) 
	{
		return (element.collision) && ((abs(element.hsp) > 0) || (abs(element.vsp) > 0)); 
	};

	if (array_any(_collisions, _collision_check))
	{
		event_user(0)
		flicker = maxFlicker;
	}
}
