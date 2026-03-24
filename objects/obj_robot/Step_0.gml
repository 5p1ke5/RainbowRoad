//If not being carried goes back and forth along whatever surface
if (!carrier)
{  
	var _player = instance_nearest(x, y, obj_player);
	
	if	(collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false))) ||
		(grounded && place_empty(x + hsp + (hDir * (bbox_right - bbox_left)), y + 1, GROUND))
	{
		hDir = -hDir;
		image_xscale = hDir;
	}

	if (grounded)
	{
		//Doubles speed if player is nearby and robot is facing them
		var _range = 200;
		var _speedBoost = spd * (distance_to_object(_player) < _range) && (sign(_player.x - x) == hDir)
		hsp = hDir * (spd + _speedBoost);
	}
}

// Inherit the parent event
event_inherited();