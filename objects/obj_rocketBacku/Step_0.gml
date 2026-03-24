/// @description Overrides parent, skips hitbox things cause it doesn't take damage.
if (carrier)
{
	carry_carried_step();
}
else
{
	phys_step();
	carry_uncarried_step();
	
	if (hsp == 0)
	{
		instance_destroy();
		instance_create_depth(x, y, depth, obj_explosion);
	}
}

//Does moving platform things
moving_platform_carry_step();