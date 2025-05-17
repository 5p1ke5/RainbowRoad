/// @description If inside of a block attempts to grab. If unsuccessful teleports to atop it.

if (variable_instance_get(other, "collision") == false)
{
	return;
}

if (B_BUTTON_RELEASED) && (!instance_exists(myCarry)) && (variable_instance_get(other, "canCarry") == true)
{
	carry_pickup_instance(other);
}
else //Take damage, put on top of object.
{
	
	//Todo: Make this a function
	if (flicker < 0)
	{
		global.hp--;
		flicker = FLICKER_MAX;
	}
	
	do 
	{
		y--;
	}
	until (!place_meeting(x, y + 1, other));
}
