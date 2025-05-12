/// @description If inside of a block attempts to grab. If unsuccessful teleports to atop it.

///Todo: Put this code and the dupe in the step event into its own script and fix it so they're exclusive.
if (B_BUTTON)
{
	//If not carrying an object, tries to lift whatever's underfoot.
	if (!instance_exists(myCarry))
	{
		if (variable_instance_get(other, "canCarry") == true)
		{
			carry_pickup_instance(other);
		}
	}	
}

//do 
//{
//	y--;
//}
//until (!place_meeting(x, y + 1, other));