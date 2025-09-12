// @description If Held does Held things, otherwise does physics things.

//If object moves reactivates gravity

	if (yprevious != y) || (xprevious != x)
	{
		grav = 0.1;	
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
