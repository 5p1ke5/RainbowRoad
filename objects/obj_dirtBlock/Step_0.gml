/// @description If being held destroys self after two steps.
if (instance_exists(carrier))
{
	carry_carried_step()
	
	timer++;
	if (timer > timerMax)
	{
		instance_destroy();
	}
}
