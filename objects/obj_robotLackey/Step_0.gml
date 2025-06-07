if (!carrier)
{
	if (collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false), collisionBlacklist))
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