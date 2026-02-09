// @description If Held does Held things, otherwise does physics things.

//If object moves reactivates gravity

	if (!moved) && ((yprevious != y) || (xprevious != x))
	{
		//grav = 0.1;	
		phys_initialize(0.1,,,,,,,, [abs_enemy, obj_blockSand]);
		moved = true;
	}

if (instance_exists(carrier))
{
	carry_carried_step();
}
else
{
	phys_step();
	carry_uncarried_step();
	
	//Does moving platform things
	moving_platform_carry_step();
}
