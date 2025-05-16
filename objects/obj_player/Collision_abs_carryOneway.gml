/// @description If inside of a block attempts to grab. If unsuccessful teleports to atop it.

if (variable_instance_get(other, "collision") == false)
{
	return;
}

if (B_BUTTON) && (!instance_exists(myCarry)) && (variable_instance_get(other, "canCarry") == true)
{
	carry_pickup_instance(other);
}