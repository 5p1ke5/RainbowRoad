//If not being carried does NPC stuff.
if (!carrier)
{
	var _collision_on = function (element, index) { return (phys_collision_validate(element)) };

	if	(array_any(instance_place_array(x + hsp + hDir, y, BLOCK, false), _collision_on)) ||
		(place_empty(x + hsp + hDir, y + 1, BLOCK))
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