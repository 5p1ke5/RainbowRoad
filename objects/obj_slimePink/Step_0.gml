//If not being carried does NPC stuff.
if (!carrier)
{
	var _collision_on = function (element, index) { return (phys_collision_validate(element)) };

	if	(array_any(instance_place_array(x + hsp + hDir, y, BLOCK, false), _collision_on)) ||
		(grounded && place_empty(x + hsp + (hDir * (bbox_right - bbox_left)), y + 1, GROUND))
	{
		hDir = -hDir;
		image_xscale = hDir;
	}

	if (grounded)
	{
		hsp = hDir * spd;
	}
}

// Inherit the parent event
event_inherited();