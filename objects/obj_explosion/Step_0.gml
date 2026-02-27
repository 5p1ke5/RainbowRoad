/// @description Increments timer, destroys self at end.
timer--;
if (timer < 0)
{
	instance_destroy();	
}