/// @function hitbox_initialize(_hitboxObjs = [], _maxFlicker = FLICKER_MAX)
/// @description Initializes varibales for a hitbox.
/// @param _hitboxObjs The objects to check for collisions with. Can be a single element or an array. If its a single element gets put into a 1-element array.
/// @param _maxFlicker The amount the object should flicker when hit.
function hitbox_initialize(_hitboxObjs = [], _maxFlicker = FLICKER_MAX)
{
	//If the object was given a single element for _hitboxObjs just assumes they meant to pass a 1-element array.
	if !(is_array(_hitboxObjs))
	{
		_hitboxObjs = [_hitboxObjs]
	}
	
	hitboxObjs = _hitboxObjs;
	flicker = -1;
	maxFlicker = _maxFlicker
}

/// @function hitbox_step()
/// @description Place in step event to check for collisions defined in hitbox_initialize. Increments flicker, checks for collisions. Returns true if a collision was recorded, false if not.
function hitbox_step()
{
	if (flicker < 0)
	{
		return place_meeting(x, y, hitboxObjs);
	}
	
	flicker--;
	
	return false;
}


/// @function hitbox_step_instance()
/// @description Place in step event to check for collisions defined in hitbox_initialize. Increments flicker, checks for collisions. Returns the instance collided with, or undefined if none was found.
function hitbox_step_instance()
{
	if (flicker < 0)
	{
		return instance_place(x, y, hitboxObjs);
	}
	
	flicker--;
	return undefined;
}

/// @function hitbox_step_instance_array()
/// @description Place in step event to check for collisions defined in hitbox_initialize. Increments flicker, checks for collisions. Returns an array of instance collided with, or none if none were found.
function hitbox_step_instance_array(_ordered = false)
{
	if (flicker < 0)
	{
		return instance_place_array(x, y, hitboxObjs, _ordered);
	}
	
	flicker--;
	return undefined;
}
