//If not being carried does NPC stuff.
if !(carrier || thrown)
{  
	if	(collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false)))
	{
		hDir = -hDir;
		image_xscale = hDir;
	}

	hsp = hDir * spd;
	if (grounded)
	{
		image_speed = 1;
		vsp = -4;
	}
}

// Inherit the parent event
event_inherited();