// Inherit the parent event
event_inherited();

if (!carrier)
{
	if (collision_validate(instance_place_array(x + hsp + hDir, y, BLOCK, false)))
	{
		hDir = -hDir;
		
		image_xscale = hDir;
		vsp -= 2;
		hsp = hDir * 4;
	}
	
	if (grounded)
	{
		vsp -= 1;
		hsp = hDir * 4;
	}
	
	image_index = (vsp < 0)
}