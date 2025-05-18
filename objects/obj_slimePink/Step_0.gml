if (!carrier)
{
	var _collision_on = function (element, index) { return (element.collision == true) };

	if (array_any(instance_place_array(x + hsp + hDir, y, BLOCK, false), _collision_on))
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