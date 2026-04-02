/// @description If being held destroys self after two steps.
if (carrier)
{
	carry_carried_step()
	
	timer++;
	if (timer > timerMax)
	{
		instance_destroy();
	}
}
